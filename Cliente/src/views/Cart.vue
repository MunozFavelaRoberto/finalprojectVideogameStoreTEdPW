<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h3 class="pt-3">Shopping cart</h3>
      </div>
    </div>

    <!-- loop over the cart items and display -->

    <div
      v-for="cartItem in cartItems"
      :key="cartItem.id"
      class="row mt-2 pt-3 justify-content-around"
    >
      <div class="col-2"></div>
      <div class="col-md-3 embed-responsive embed-responsive-16by9">
        <img
          :src="cartItem.product.image"
          alt=""
          class="w-100 card-image-top embed-responsive-item"
          style="object-fit: cover"
        />
      </div>

      <!-- display product name, quantity -->
      <div class="col-md-5 px-3">
        <div class="card-block px-3">
          <h6 class="card-title">
            <router-link
              :to="{ name: 'ShowDetails', params: { id: cartItem.id } }"
            >
              {{ cartItem.product.name }}
            </router-link>
          </h6>

          <p class="mb-0 font-weight-bold" id="item-price">
            $ {{ cartItem.product.price }} per unit
          </p>
          <p class="mb-0" style="float: left">
            Quantity:{{ cartItem.quantity }}
          </p>
        </div>
        <p class="mb-0" style="float: right">
          Total:
          <span class="font-weight-bold">
            $ {{parseFloat(cartItem.product.price) * parseFloat(cartItem.quantity) }}
          </span>
        </p>
        <br />
        <a href="#" class="text-right" @click="deleteItem(cartItem.id)"
          >Remove from cart
        </a>
      </div>
      <div class="col-2"></div>
      <div class="col-12"><hr /></div>
    </div>

    <!-- display the price -->
    <div></div>

    <div class="total-cost pt-2 text-right">
      <div class="row">
        <div class="col">
          <h5>Have a discount code?</h5>
          <div class="row">
            <div class="col-8 text-center">
              <input type="text" class="form-control" v-model="name" required />
            </div>
            <div class="col-4 text-center">
              <button
                type="button"
                class="btn btn-primary confirm"
                @click="discount"
              >
                Apply discount
              </button>
            </div>
          </div>
        </div>
        <div class="col">
          <h5>Total : ${{ totalCost.toFixed(2) }}</h5>
          <button
            type="button"
            class="btn btn-primary confirm"
            @click="checkout"
          >
            Confirm order
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
//import parseJwt from '../helper/decode.js'
export default {
  data() {
    return {
      cartItems: [],
      token: null,
      totalCost: 0,
      name:null,
    };
  },
  props: ["baseURL"],
  methods: {
    // fetch All items in cart
    listCartItems() {
      //const { uid } = parseJwt(localStorage.getItem('token'));
      axios
        .get(`${this.baseURL}cart/${uid}`, {
          headers: {
            //jwt_token: this.token,
          },
        })
        .then((res) => {
          const result = res.data;
          console.log(res.data)
          this.cartItems = result.cartItems;
          this.totalCost = result.totalCost;
        })
        .catch((err) => console.log("err", err));
    },
    deleteItem(itemId) {
      axios
        .delete(`${this.baseURL}cart/delete/${itemId}`)
        .then((res) => {
          if (res.status == 200) {
            this.$router.go(0);
          }
        })
        .catch((err) => console.log("err", err));
    },
    checkout() {
      this.$router.push({ name: "Checkout" });
    },
    discount() {
      this.totalCost = this.totalCost * 0.75;
      swal({
              text: "Coupon code applied successfully",
              icon: "success",
              closeOnClickOutside: false,
            });
    },
  },
  mounted() {
    this.token = localStorage.getItem("token");
    this.listCartItems();
  },
};
</script>
<style scoped>
h4,
h5 {
  color: #2a0ec9;
  font-size: 700;
}
</style>
