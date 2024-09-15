<template>
  <div class="card w-75">
    <div class="card-body">
      <h5 class="card-title">{{ address.address }} id : {{ address.id }}</h5>
      <p class="card-text">
        {{ address.address }}
        <br />
        <b> City:</b> {{ address.city }}
        <br />
        <b> Postal Code: </b>{{ address.postal_code }}
        <br />
        <b>Country: </b>{{ address.country }}
      </p>
      <!-- <router-link :to="{name: 'ShowDetails', params: {id : address.id}}"> -->
      <a href="#" class="btn btn-primary">Select Address</a>
      <!-- </router-link> -->
    </div>
  </div>
</template>
<script>
export default {
  name: "AddressBox",
  props: ["address"],
};
</script>
<style scoped>
.card-img-top {
  object-fit: cover;
}
a {
  text-decoration: none;
}
.card-title {
  color: #484848;
}
</style>