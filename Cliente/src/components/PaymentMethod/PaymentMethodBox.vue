<template>
  <div class="card w-75">
    <div class="card-body">
      <h5 class="card-title"><i v-if="paymentMethod.email" class="bi bi-credit-card"></i> <i v-if="paymentMethod.email ==''" class="bi bi-paypal"></i>{{ paymentMethod.payment_type }} <br> id : {{ paymentMethod.id }}</h5>
      <p class="card-text">
        {{ paymentMethod.name }}
        <br />
        <b> City:</b> {{ paymentMethod.account_no }}
        <br />
        <b> Postal Code: </b>{{ paymentMethod.ccv }}
        <br />
        <b>Country: </b>{{ paymentMethod.email }}
      </p>
      <!-- <router-link :to="{name: 'ShowDetails', params: {id : paymentMethod.id}}"> -->
         
      <a href="#" class="btn btn-primary">Select Payment Method</a>
      <!-- </router-link> -->
    </div>
  </div>
</template>
<script>
export default {
  name: "PaymentMethodBox",
  props: ["paymentMethod"],
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