<template>
  <div class="card w-100 h-100" style="margin-top: 10px">
    <div class="embed-responsive embed-responsive-16by9">
      <img
        class="card-img-top embed-responsive-item"
        :src="category.image"
        alt="No image"
        :onerror="this.src='https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'"/>
    </div>
    <div class="card-body">
      <router-link :to="{name: 'ListProducts', params: {id: category.id} }">
        <h5 class="card-title">{{ category.name }}</h5>
      </router-link>
      <router-link :to="{name: 'ListProducts', params: {id: category.id} }">
        <a href="" class="btn btn-primary" style="  background-color: #0e256b; border-color: #0e256b;">Ver Categoria</a>
      </router-link>
      
      <p class="card-text">
        {{ category.description }}
      </p>
      
      <router-link :to="{name: 'EditCategory', params: {id: category.id}}"
                   v-show="$route.name == 'Category'">
        <button class="btn btn-primary" style="  background-color: #0e256b; border-color: #0e256b;">Edit</button>
      </router-link>
    </div>
  </div>
</template>
<script>
export default {
  name: "CategoryBox",
  props: ["category"],
  methods: {},

};
</script>

<style scoped>
.card-img-top {
  object-fit: cover;
}
</style>