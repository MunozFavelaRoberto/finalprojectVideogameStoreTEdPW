<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Add new Product</h4>
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
            <input type="file"  @change="onSelectedImage" 
                ref="imageSelector" class="form-control" required>
          </div>
          <div class="form-group">
            <label>Price</label>
            <input type="number" class="form-control" v-model="price" required>
          </div>
          <div class="form-group">
            <label>Stock</label>
            <input type="number" class="form-control" v-model="inventory" required>
          </div>
          <button type="button" class="btn btn-primary" @click="addProduct">Submit</button>
        </form>
      </div>
      <div class="col-3"> <img 
    v-if="localImage"
    :src="localImage" 
    alt="entry-picture"
    class="img-thumbnail"></div>
    </div>
  </div>
</template>

<script>
const axios = require('axios')
import swal from 'sweetalert';
import parseJwt from '../../helper/decode.js'
import uploadImage from "../../helper/uploadImage.js"

export default {
  data() {
    return {
      categoryId: null,
      name: null,
      proveedor: null,
      description: null,
      image:null,
      price: null,
      inventory: null,
      localImage: null, 
    }
  },
  props: ["baseURL", "categories"],
  methods: {
     onSelectedImage(event) {
            const file =event.target.files[0]
            if(!file){
                this.localImage = null
                this.image = null
                return
            }
            this.image = file
            const fr = new FileReader()
            fr.onload= () => {this.localImage = fr.result}
            fr.readAsDataURL(file)
        },
    async addProduct() {
      this.image = await uploadImage(this.image)
      const { uid } = parseJwt(localStorage.getItem('token'));
      console.log(this.image);
      const newProduct = {
        categoryId: this.categoryId,
        name: this.name,
        proveedor: uid,
        description: this.description,
        image: this.image,
        price: this.price,
        inventory : this.inventory
      };
      await axios({
        method: 'post',
        url: this.baseURL + "product/add",
        data: JSON.stringify(newProduct),
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(() => {
            // this.$router.replace("/");
          swal({
            text: "Product Added Successfully!",
            icon: "success",
            closeOnClickOutside: false,
          });
          this.$router.push({ name: 'AdminProduct' });
        })
        .catch(err => console.log(err));
    }
  },
  mounted() {
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