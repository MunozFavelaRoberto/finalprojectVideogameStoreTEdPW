<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">My Payment Methods</h4>
      </div>
    </div>
    <div style="padding: 30px">
      <router-link :to="{ name: 'AddPaymentMethod' }">
        <button
          class="btn btn-primary"
          style="background-color: #febd69; border-color: #febd69"
        >
          Add New Payment Method
        </button>
      </router-link>
    </div>

    <div class="features pt-3">
      <h5><strong>Selected Method</strong></h5>
      <div class="card">
        <dl>
          <dt>Banamex</dt>
          <dd>XXXX XXXX XXXX 1234</dd>
          <dd>JUAN PEREZ</dd>
        </dl>
        <dl>
          <dt>DATE</dt>
          <dd>XX/XXXX</dd>
          <dd>
            State/Province/Region California Zip/Postal Code 93654 Country
            United States
          </dd>
        </dl>
      </div>
    </div>
    <div class="row">
      <div
        v-for="paymentMethod of PaymentMethods"
        :key="paymentMethod.id"
        class="col-md-6 col-xl-4 col-12 pt-3 d-flex"
      >
        <PaymentMethodBox :paymentMethod="paymentMethod" />
      </div>
    </div>
  </div>
</template>

<script>
//import parseJwt from "@/helper/decode";
import PaymentMethodBox from "../../components/PaymentMethod/PaymentMethodBox";
var axios = require('axios');

export default {
  name: "PaymentMethod",
  components: { PaymentMethodBox },
  props: ["baseURL", "PaymentMethods"],
  data() {
    return {
       PaymentMethods:null, 
      // [
      //   {
      //     id: 0,
      //     payment_type: "Credit Card",
      //     user_id: 0,
      //     name: "qwe",
      //     account_no: "asasd",
      //     month: "celaya",
      //     ccv: "celaya",
      //     year: "celaya",
      //     email: "celaya",
      //   },
      //   {
      //     id: 1,
      //     payment_type: "Credit Card",
      //     user_id: 0,
      //     name: "qwe",
      //     account_no: "asasd",
      //     month: "celaya",
      //     ccv: "celaya",
      //     year: "celaya",
      //     email: "celaya",
      //   },
      //   {
      //     id: 2,
      //     payment_type: "Credit Card",
      //     user_id: 0,
      //     name: "qwe",
      //     account_no: "asasd",
      //     month: "celaya",
      //     ccv: "celaya",
      //     year: "celaya",
      //     email: "celaya",
      //   },
      //   {
      //     id: 3,
      //     payment_type: "Paypal",
      //     user_id: 0,
      //     name: "qwe",
      //     account_no: "asasd",
      //     month: "celaya",
      //     ccv: "celaya",
      //     year: "celaya",
      //     email: null,
      //   },
      // ],
    };
  },
  methods: {
    async getMethods(){
      //const {uid} = parseJwt(localStorage.getItem('token'))
      console.log(uid)
      
      await axios
        .get(this.baseURL + "payment/all/metod/")
        .then((res) => (this.PaymentMethods = res.data))
        .catch((err) => console.log(err));
        console.log(this.products);
    }
  },
  mounted() {
    this.getMethods()
    // this.category_size = this.categories.length;
    // this.category_size = Math.min(6, this.category_size);
    // this.product_size = this.products.length;
    // this.product_size = Math.min(8, this.category_size);
  },
  }
</script>

<style scoped>
h4 {
  font-family: "Roboto", sans-serif;
  color: #484848;
  font-weight: 700;
}
</style>