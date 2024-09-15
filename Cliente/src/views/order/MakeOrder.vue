 <template>
  <div>
    <h3><strong>Confirm Order</strong></h3>
    <div class="features pt-3">
      <h5><strong>Selected Address</strong></h5>
      <div class="card">
        <dl>
          <dt>Contact</dt>
          <dd>Phone Number (559) 638-8444</dd>
          <dd>Email juanp@gmail.com</dd>
        </dl>
        <dl>
          <dt>Address</dt>
          <dd>Street 1300 E Manning Ave City/Town Reedley</dd>
          <dd>
            State/Province/Region California Zip/Postal Code 93654 Country
            United States
          </dd>
        </dl>
      </div>
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
      <button class="btn btn-primary" @click="goToCheckout">
        Make Payment
      </button>
    </div>
  </div>
</template>

<script>
//import parseJwt from "@/helper/decode";
import PaymentMethodBox from "../../components/PaymentMethod/PaymentMethodBox";
import axios from "axios";
export default {
  data() {
    return {
      PaymentMethods: null,
      stripeAPIToken:
        "pk_test_51Hr18ILR0wfBoBqmrZFhIWWOk0CA8PFS3cEMwh4S1S6jRUzVucZ26dbGIYRk5ezdYlMgUkQmYHGJOsKR35uEHgvV00IXALUhYx",
      stripe: "",
      token: null,
      checkoutBodyArray: [],
      totalCost: null,
    };
  },
  name: "Checkout",
  props: ["baseURL", "PaymentMethods"],
  methods: {
    getAllItems() {
      //const { uid } = parseJwt(localStorage.getItem("token"));
      axios
        .get(`${this.baseURL}cart/${uid}`, {
          headers: {
            //jwt_token: this.token,
          },
        })
        .then((response) => {
          if (response.status == 200) {
            const { cartItems, totalCost } = response.data;
            this.totalCost = totalCost;
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
      //   const { uid } = parseJwt(localStorage.getItem("token"));
      //   console.log("checkoutBodyArray", this.checkoutBodyArray);
      //   axios
      //     .post(`${this.baseURL}payment/order/create`, {
      //       items: this.checkoutBodyArray,
      //       totalCost: this.totalCost,
      //       user_id: uid,
      //     })
      //     .then((response) => {
      //       localStorage.setItem("sessionId", response.data.msg);
      //       this.stripe.redirectToCheckout({
      //         sessionId: response.data.smg,
      //       });
      //     })
      //     .catch((err) => console.log(err));
      swal({
        text: "Purchase confirmed",
        icon: "success",
        closeOnClickOutside: false,
      });
    },
    async getMethods() {
      //const { uid } = parseJwt(localStorage.getItem("token"));
      console.log(uid);

      await axios
        .get(this.baseURL + "payment/all/metod/" + uid)
        .then((res) => (this.PaymentMethods = res.data))
        .catch((err) => console.log(err));
      console.log(this.products);
    },
  },
  mounted() {
    this.token = localStorage.getItem("token");
    this.stripe = window.Stripe(this.stripeAPIToken);
    this.getMethods();
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