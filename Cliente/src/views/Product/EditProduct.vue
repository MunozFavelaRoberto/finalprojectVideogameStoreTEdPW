<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Edit Product</h4>
      </div>
    </div>

    <div class="row">
      <div class="col-3"></div>
      <div class="col-md-6 px-5 px-md-0">
        <form>
          <div class="form-group">
            <label>Category</label>
            <select class="form-control" v-model="categoryId" required>
              <option v-for="category of categories" :key="category.id" :value="category.id">{{ category.name }}</option>
            </select>
          </div>
          <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" v-model="name" required>
          </div>
          <div class="form-group">
            <label>Description</label>
            <input type="text" class="form-control" v-model="description" required>
          </div>
          <div class="form-group">
            <label>Select Image</label>
            <input type="file" @change="onSelectedImage" ref="imageSelector" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Price</label>
            <input type="number" class="form-control" v-model="price" required>
          </div>
          <div class="form-group">
            <label>Stock</label>
            <input type="number" class="form-control" v-model="inventory" required>
          </div>
          <button type="button" class="btn btn-primary" @click="editProduct">Submit</button>
        </form>
      </div>
      <div class="col-3"><img v-if="!localImage" :src="image" alt="entry-picture" class="img-thumbnail">
        <img v-else-if="localImage" :src="localImage" alt="entry-picture" class="img-thumbnail">
      </div>
    </div>
  </div>
</template>

<script>
var axios = require('axios');
import parseJwt from '@/helper/decode';
import uploadImage from '@/helper/uploadImage';
import swal from 'sweetalert';
export default {
  data() {
    return {
      id: null,
      categoryId: 0,
      name: null,
      proveedor: null,
      description: null,
      image: null,
      price: 0,
      inventory: null,
      productIndex: null,
      localImage: null
    }
  },
  props: ["baseURL", "products", "categories"],
  methods: {
    onSelectedImage(event) {
      const file = event.target.files[0]
      if (!file) {
        this.localImage = null
        this.image = null
        return
      }
      this.image = file
      const fr = new FileReader()
      fr.onload = () => { this.localImage = fr.result }
      fr.readAsDataURL(file)
    },
    async editProduct() {
      this.image = await uploadImage(this.image)
      const { uid } = parseJwt(localStorage.getItem('token'));
      const updatedProduct = {
        categoryId: this.categoryId,
        name: this.name,
        proveedor: uid,
        description: this.description,
        image: this.image,
        price: this.price,
        inventory: this.inventory
      }
      await axios({
        method: 'put',
        url: this.baseURL + "product/update/" + this.id,
        data: JSON.stringify(updatedProduct),
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(() => {
          //sending the event to parent to handle
          this.$emit("fetchData");
          this.$router.push({ name: 'AdminProduct' });
          swal({
            text: "Product Updated Successfully!",
            icon: "success",
            closeOnClickOutside: false,
          });
        })
        .catch(err => console.log("Hello", err));
    }
  },
  mounted() {
    this.id = this.$route.params.id;
    this.productIndex = this.products.findIndex(product => product.id == this.id);
    //input fields
    this.categoryId = this.products[this.productIndex].categoryId;
    this.name = this.products[this.productIndex].name;
    this.description = this.products[this.productIndex].description;
    this.image = this.products[this.productIndex].image;
    this.price = this.products[this.productIndex].price;
    this.inventory = this.products[this.productIndex].inventory
  }
}
</script>

<style scoped>
h4 {
  font-family: 'Roboto', sans-serif;
  color: #484848;
  font-weight: 700;
}
</style>