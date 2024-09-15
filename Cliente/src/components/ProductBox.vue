<template>
    <div class="card h-100 w-100">
        <div class="embed-responsive embed-responsive-16by9">
            <img class="card-img-top embed-responsive-item" :src="product.image" alt="No image"
                :onerror="this.src = 'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'" />
        </div>
        <div class="card-body">
            <router-link :to="{ name: 'ShowDetails', params: { id: product.id } }">
                <h5 class="card-title">{{ product.name }}</h5>
            </router-link>
            <p class="card-text">
                {{ product.description.substring(0, 65) }}...
            </p>
            <div class="row">
                <router-link :to="{ name: 'EditProduct', params: { id: product.id } }" v-show="uid == product.proveedor">
                <button class="btn btn-primary">Edit
                </button>
            </router-link>
            <button class="btn btn-danger" v-show="uid == product.proveedor"
                @click="deleteProduct(product.id)">Delete</button>

            <router-link :to="{ name: 'ShowDetails', params: { id: product.id } }" v-show="uid != product.proveedor">
                <button href="" class="btn btn-primary "
                    style="  background-color: #81d6d6; border-color: #81d6d6;">Buy!</button>
            </router-link>
            </div>
        </div>
    </div>
</template>
<script>
//import parseJwt from '@/helper/decode'
export default {
    name: "ProductBox",
    props: ["product"],
    data() {
        return {
            baseURL: "http://localhost:3000/api/",
            uid: null,
        }
    }, methods: {
        //getuidi() {
            //const { uid } = parseJwt(localStorage.getItem('token'))
            //this.uid = uid
        //},
        deleteProduct(productId) {
      axios
        .delete(`${this.baseURL}product/delete/${productId}`)
        .then((res) => {
          if (res.status == 200) {
            this.$router.go(0);
          }
        })
        .catch((err) => console.log("err", err));
    },
    },
    mounted() {
        this.getuidi()
    }
}
</script>
<style scoped>
.card-img-top {
    object-fit: cover;
}

a {
    text-decoration: none;
}

.card-title {
    color: #2a0ec9;
}
</style>