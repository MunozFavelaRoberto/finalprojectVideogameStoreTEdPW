<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <!-- Navbar content -->
    <!--    Logo-->
    <router-link class="navbar-brand" :to="{ name: 'Home' }">
      <img id="logo" src="../assets/logofinal.png" width="" />
    </router-link>
    <!--    Burger Button-->
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!--      Search Bar-->
      <form class="form-inline ml-auto mr-auto">
        <div class="input-group">
          <input
            size="100"
            type="text"
            class="form-control"
            placeholder="Buscar"
            aria-label="Username"
            aria-describedby="basic-addon1"
          />
          <div class="input-group-prepend">
            <span class="input-group-text" id="search-button-navbar">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="currentColor"
                class="bi bi-search"
                viewBox="0 0 16 16"
              >
                <path
                  d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"
                />
              </svg>
            </span>
          </div>
        </div>
      </form>
      <!-- dropdown for browse -->
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a
            class="nav-link text-light dropdown-toggle"
            href="#"
            id="navbarAccount"
            data-toggle="dropdown"
          >
            Navegar
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarAccount">
            <router-link class="dropdown-item" :to="{ name: 'Home' }"
              >Home
            </router-link>
            <router-link class="dropdown-item" :to="{ name: 'AdminProduct' }"
              >Productos
            </router-link>
            <router-link class="dropdown-item" :to="{ name: 'Category' }"
              >Categorias
            </router-link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle text-light"
            href="#"
            id="navbarAccount"
            data-toggle="dropdown"
          >
            Mi Cuenta
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarAccount">
            <router-link
              v-if="token"
              class="dropdown-item"
              :to="{ name: 'Address' }"
              >My Address
            </router-link>
            <router-link
              v-if="token"
              class="dropdown-item"
              :to="{ name: 'OrderHistory' }"
              >My orders
            </router-link>
            <router-link
              v-if="token"
              class="dropdown-item"
              :to="{ name: 'PaymentMethod' }"
              >My Payment Methods
            </router-link>
            <router-link
              v-if="token"
              class="dropdown-item"
              :to="{ name: 'WishList' }"
              >Wishlist
            </router-link>
            <router-link
              v-if="token"
              class="dropdown-item"
              :to="{ name: 'Reports' }"
              >Reports
            </router-link>
            
            <router-link
              v-if="!token"
              class="dropdown-item"
              :to="{ name: 'Signup' }"
              >Sign up
            </router-link>
            <router-link
              v-if="!token"
              class="dropdown-item"
              :to="{ name: 'Signin' }"
              >Sign in
            </router-link>
            <a class="dropdown-item" v-if="token" href="#" @click="signout"
              >Sign out
            </a>
          </div>
        </li>
        <li v-if="token" class="nav-item">
          <div id="cart" style="position: relative">
            <span id="nav-cart-count">{{ cartCount }}</span>
            <router-link class="text-light" :to="{ name: 'Cart' }">
              <i class="fa fa-shopping-cart" style="font-size: 36px"></i>
            </router-link>
          </div>
        </li>
      </ul>
      <!-- dropdown for account -->
    </div>
  </nav>
</template>
<script>
import swal from "sweetalert";
export default {
  name: "Navbar",
  props: ["cartCount"],
  data() {
    return {
      token: null,
    };
  },
  methods: {
    signout() {
      localStorage.removeItem("token");
      this.token = null;
      swal({
        text: "Logged you out. Visit again",
        icon: "success",
      });
      this.$emit("resetCartCount");
      this.$router.push({ name: "Home" });
    },
  },
  mounted() {
    this.token = localStorage.getItem("token");
  },
};
</script>
<style scoped>
#logo {
  width: 150px;
  /* margin-left: 20px;
  margin-right: 20px; */
  height: 40px;
}
.nav-link {
  color: rgba(255, 255, 255);
}
#search-button-navbar {
  background-color: #81d6d6;
  border-color: #000000;
  border-top-right-radius: 2px;
  border-bottom-right-radius: 2px;
}
#general-buttons-color {
  background-color: #81d6d6;
  border-color: #000000;
}
#nav-cart-count {
  background-color: black;
  color: white;
  border-radius: 50%;
  height: 15px;
  width: 15px;
  font-size: 15px;
  align-items: center;
  display: flex;
  justify-content: center;
  position: absolute;
  margin-left: 10px;
}
</style>