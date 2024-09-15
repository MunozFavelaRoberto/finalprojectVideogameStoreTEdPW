<template>
  <div class="div_class">
    <h3>You will be redirected to payment page</h3>
    <div class="alert alert-primary">
      While making payment use card number 4242 4242 4242 4242 and enter random
      date and cvv (3 digit)
    </div>

    <button class="btn btn-primary" @click="goToCheckout">Make Payment</button>
  </div>
</template>

<script>
//import parseJwt from '@/helper/decode';
import axios from 'axios';
export default {
  data() {
    return {
      stripeAPIToken:
        'pk_test_51Hr18ILR0wfBoBqmrZFhIWWOk0CA8PFS3cEMwh4S1S6jRUzVucZ26dbGIYRk5ezdYlMgUkQmYHGJOsKR35uEHgvV00IXALUhYx',
      stripe: '',
      token: null,
      checkoutBodyArray: [],
      totalCost:null
    };
  },
  name: 'Checkout',
  props: ['baseURL'],
  methods: {
    getAllItems() {
      //const { uid } = parseJwt(localStorage.getItem('token'));
      axios
        .get(`${this.baseURL}cart/${uid}`,{
          headers: {
            //jwt_token: this.token,
          }})
        .then((response) => {
          if (response.status == 200) {
            const {cartItems,totalCost} = response.data;
            this.totalCost=totalCost
            for (let i = 0; i < cartItems.length; i++) {
              this.checkoutBodyArray.push({
                product_id: cartItems[i].product.id, 
                price: cartItems[i].product.price,
                quantity: cartItems[i].quantity,
                productName: cartItems[i].product.name,
                productId: cartItems[i].product.id,
              });
            }
          }
        })
        .catch((err) => console.log(err));
    },
    goToCheckout() {
      //const { uid } = parseJwt(localStorage.getItem('token'));
      console.log('checkoutBodyArray', this.checkoutBodyArray);
      axios
        .post(
          `${this.baseURL}payment/order/create`,{
            items : this.checkoutBodyArray,
            totalCost:this.totalCost,
            user_id:uid
          }
        )
        .then((response) => {
          localStorage.setItem('sessionId', response.data.msg);
          this.stripe.redirectToCheckout({
            sessionId: response.data.smg, });
        })
        .catch((err) => console.log(err));
    },
  },
  mounted() {
    this.token = localStorage.getItem('token');
    this.stripe = window.Stripe(this.stripeAPIToken);
    this.getAllItems();
  },
};
</script>
<style scoped>
.alert {
  width: 50%;
}
.div_class {
  margin-top: 5%;
  margin-left: 30%;
}
.checkout_button {
  background-color: #5d3dec;
  margin: 10px;
}
</style>