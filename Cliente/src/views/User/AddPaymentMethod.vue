<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">New Payment Method</h4>
      </div>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
          aria-selected="true">Credit/Card</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
          aria-selected="false">Paypal</a>
      </li>
    </ul>
    <div class="tab-content" id="myTabContent" style="text-align: center; margin: 0 auto">
      <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        Add a Credit Card

        <div class="padding">
          <div class="row">
            <div class="col">
              <div class="card">
                <div class="card-header">
                  <strong>Credit Card</strong>
                  <br>
                  <small>Enter your card details</small>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" v-model="name" id="name" type="text" placeholder="Enter the name of this payment method" />
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="ccnumber">Credit Card Number</label>
                        <div class="input-group">
                          <input class="form-control" type="text" v-model="account_no" placeholder="0000 0000 0000 0000"
                            autocomplete="email" />
                          <div class="input-group-append">
                            <span class="input-group-text">
                              <i class="mdi mdi-credit-card"></i>
                            </span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="row">
                    <div class="form-group col-sm-4">
                      <label for="ccmonth">Month</label>
                      <select class="form-control" id="ccmonth" v-model="month">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                      </select>
                    </div>
                    <div class="form-group col-sm-4">
                      <label for="ccyear">Year</label>
                      <select class="form-control" id="ccyear" v-model="year">
                        <option>2014</option>
                        <option>2015</option>
                        <option>2016</option>
                        <option>2017</option>
                        <option>2018</option>
                        <option>2019</option>
                        <option>2020</option>
                        <option>2021</option>
                        <option>2022</option>
                        <option>2023</option>
                        <option>2024</option>
                        <option>2025</option>
                      </select>
                    </div>
                    <div class="col-sm-4">
                      <div class="form-group">
                        <label for="cvv">CVV/CVC</label>
                        <input class="form-control" id="cvv" v-model="ccv" type="text" placeholder="123" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-footer pay px-5">
                  <button class="btn btn-danger" type="reset">
                    <i class="mdi mdi-lock-reset"></i> Reset
                  </button>
                  <button class="btn btn-primary" type="submit" @click="addPayment">
                    <i class="mdi mdi-gamepad-circle"></i> Add
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
        Easily and securely spend, send, and manage your transactions—all in one place.

        <div class="px-5 mt-5">
          <div class="inputbox">
            <input type="text" name="name" class="form-control" required="required" />
            <span>Paypal Email Address</span>
          </div>
          <div class="pay px-5">
            <button class="btn btn-primary btn-block">Add paypal</button>
          </div>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
var axios = require('axios');
//import parseJwt from '@/helper/decode';
import swal from 'sweetalert';
export default {
  data() {
    return {
      user_id: null,
      payment_type: "Credit card",
      name: null,
      account_no: null,
      month: null,
      ccv: null,
      year: null,
    }
  },
  props: ["baseURL", "products", "categories"],
  methods: {
    async addPayment() {
      //const {uid} = parseJwt(localStorage.getItem('token'))
      console.log(uid)
      const user_payment = {
        user_id: uid,
        payment_type: this.payment_type,
        name: this.name,
        account_no: this.account_no,
        month: this.month,
        ccv: this.ccv,
        year: this.year,
      }
      await axios({
        method: 'post',
        url: this.baseURL + "payment/add/metod/"+uid,
        data: JSON.stringify(user_payment),
        headers: {
          'Content-Type': 'application/json'
        }
      })
        .then(() => {
          console.log("se guardo")
        })
        .catch(err => console.log("Hello", err));
    }
  },
  mounted() {
  }
}
</script>

<style scoped>
/* h4 {
  font-family: "Roboto", sans-serif;
  color: #484848;
  font-weight: 700;
} */

body {
  height: 100vh;
  justify-content: center;
  align-items: center;
  display: flex;
  background-color: #eee;
}

.launch {
  height: 50px;
}

.close {
  font-size: 21px;
  cursor: pointer;
}

.modal-body {
  height: 450px;
}

.nav-tabs {
  border: none !important;
}

.nav-tabs .nav-link.active {
  color: #495057;
  background-color: #fff;
  border-color: #ffffff #ffffff #fff;
  border-top: 3px solid blue !important;
}

.nav-tabs .nav-link {
  margin-bottom: -1px;
  border: 1px solid transparent;
  border-top-left-radius: 0rem;
  border-top-right-radius: 0rem;
  border-top: 3px solid #eee;
  font-size: 20px;
}

.nav-tabs .nav-link:hover {
  border-color: #e9ecef #ffffff #ffffff;
}

.nav-tabs {
  display: table !important;
  width: 100%;
}

.nav-item {
  display: table-cell;
}

.form-control {
  border-bottom: 1px solid #eee !important;
  border: none;
  font-weight: 600;
}

.form-control:focus {
  color: #495057;
  background-color: #fff;
  border-color: #8bbafe;
  outline: 0;
  box-shadow: none;
}

.inputbox {
  position: relative;
  margin-bottom: 20px;
  width: 100%;
}

.inputbox span {
  position: absolute;
  top: 7px;
  left: 11px;
  transition: 0.5s;
}

.inputbox i {
  position: absolute;
  top: 13px;
  right: 8px;
  transition: 0.5s;
  color: #3f51b5;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.inputbox input:focus~span {
  transform: translateX(-0px) translateY(-15px);
  font-size: 12px;
}

.inputbox input:valid~span {
  transform: translateX(-0px) translateY(-15px);
  font-size: 12px;
}

.pay button {
  height: 47px;
  border-radius: 37px;
}
</style>