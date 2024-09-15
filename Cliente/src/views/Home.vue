<template>
  <div id="home">
    <!-- Page Wrapper -->
    <div id="background-div" class="page-holder bg-cover">
      <!-- <div class="container py-5">
        <header class="text-left text-white py-5">
          <h3 class="mb-4 rounded">
            <a
              href="#start-shopping"
              class="bg-white px-2 py-2 rounded"
              id="heading"
              >Our Products</a
            >
          </h3>
          <p id="content" class="lead mb-0 bg-dark p-1 rounded">
            
          </p>
        </header>
      </div> -->
              <section id="container-slider">
            <a href="javascript: fntExecuteSlide('prev');" class="arrowPrev"
              ><i class="fas fa-chevron-circle-left"></i
            ></a>
            <a href="javascript: fntExecuteSlide('next');" class="arrowNext"
              ><i class="fas fa-chevron-circle-right"></i
            ></a>
            <ul class="listslider">
              <li>
                <a itlist="itList_0" href="#" class="item-select-slid"></a>
              </li>
              <li><a itlist="itList_1" href="#"></a></li>
              <li><a itlist="itList_2" href="#"></a></li>
            </ul>
            <ul id="slider">
              <li
                style="
                  background-image: url('https://i0.wp.com/www.silviagaliana.com/wp-content/uploads/2014/04/Fondo-Super-Mario-para-Twitter.jpg');
                  z-index: 0;
                  opacity: 1;
                "
              >
                <div class="content_slider">
                  <div>
                    <h2>Los Mejores Videojuegos De Plataformas</h2>
                    <p>
                      Compralos Ahora Mismo
                    </p>
                    <a href="#start-shopping" class="btnSlider">Ver Más</a>
                  </div>
                </div>
              </li>
              <li
                style="
                  background-image: url('https://tep.pucmm.edu.do/PublishingImages/Educacion-continuada/Videojuegos-banner-2.jpg');
                "
              >
                <div class="content_slider">
                  <div>
                    <h2>Mejores Juegos Para Consola</h2>
                    <p>
                      No PC
                    </p>
                    <a href="#start-shopping" class="btnSlider">Ver Más</a>
                  </div>
                </div>
              </li>
              <li
                style="
                  background-image: url('https://www.vortez.net/contentteller.php?ct=news&action=file&id=18653');
                "
              >
                <div class="content_slider">
                  <div>
                    <h2>Juegos De Steam</h2>
                    <p>
                      La Mejor Plataforma De Videojuegos Digitales
                    </p>
                    <a href="#start-shopping" class="btnSlider">Ver Más</a>
                  </div>
                </div>
              </li>
            </ul>
          </section>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Mejores Categorias De Videojuegos</h2>
        </div>
      </div>
      <div class="row">
        <div
          v-for="index in this.category_size"
          :key="index"
          class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex"
        >
          <CategoryBox :category="categories[index - 1]"> </CategoryBox>
        </div>
      </div>
    </div>
    <div style="padding: 30px">
      <router-link :to="{ name: 'Category' }">
        <button
          class="btn btn-primary"
          style="background-color: #0e256b; border-color: #0e256b"
        >
          Ver Todas Las Categorias
        </button>
      </router-link>
    </div>
    <hr />
    <div id="start-shopping" class="container">
      <div class="row">
        <div class="col-12 text-left">
          <h2 class="pt-3">Mejores Videojuegos</h2>
        </div>
      </div>
      <div class="row">
        <div
          v-for="index in this.product_size"
          :key="index"
          class="col-md-6 col-xl-4 col-12 pt-3 justify-content-around d-flex"
        >
          <ProductBox :product="products[index - 1]"> </ProductBox>
        </div>
      </div>
      <div style="padding: 30px">
        <router-link :to="{ name: 'AdminProduct' }">
          <button
            class="btn btn-primary"
            style="background-color: #0e256b; border-color: #0e256b"
          >
            Ver Todos Los Videojuegos
          </button>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script >
import ProductBox from "../components/Product/ProductBox";
import CategoryBox from "../components/Category/CategoryBox";
export default {
  name: "Home",
  components: { ProductBox, CategoryBox },
  props: ["baseURL", "products", "categories", "user"],
  data() {
    return {
      category_size: 0,
      product_size: 0,
    };
  },
  mounted() {
    this.category_size = this.categories.length;
    this.category_size = Math.min(6, this.category_size);
    this.product_size = this.products.length;
    this.product_size = Math.min(8, this.category_size);
    
  },
  
};

</script>

<style>
.page-holder {
  min-height: 100vh;
}
.bg-cover {
  background-size: cover !important;
}
#background-div {
  background: url(../assets/home.jpg);
}
#heading {
  text-decoration: none;
  font-family: "Roboto", sans-serif;
  font-weight: 400;
  opacity: 0.8;
  font-family: "Josefin Sans", sans-serif;
}
#content {
  opacity: 0.8;
}
h2 {
  font-family: "Josefin Sans", sans-serif;
}

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
#container-slider
{
    position: relative;
    display: block;
    width: 100%;
}
#slider {
    position: relative;
    display: block;
    width: 100%;
    height: 100vh;
    min-height: 500px;
}
#slider li {
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    width: 100%;
    height: 100%;
    display: block;
    -webkit-transition: opacity 1s;
    -moz-transition: opacity 1s;
    -ms-transition: opacity 1s;
    -o-transition: opacity 1s;
    transition: opacity 1s;
    z-index: -1;
    opacity: 0;
}
#container-slider .arrowPrev, #container-slider .arrowNext{
    font-size: 30pt;
    color: rgba(204, 204, 204, 0.65);
    cursor: pointer;
    position: absolute;
    top: 50%;
    left: 50px;
    z-index: 2; 
}
#container-slider .arrowNext {
    left: initial;
    right: 50px !important;
}
.content_slider{
    padding: 15px 30px;
    color: #FFF;
    width: 100%;
    height: 100%;
}
.content_slider div{
    text-align: center;
}
.content_slider h2{
    font-family: 'arial';
    font-size: 30pt;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-bottom: 20px;
}
.content_slider p {
    font-size: 15pt;
    font-family: 'arial';
    color: #FFF;
    margin-bottom: 20px;
}
#slider li .content_slider{
    background: rgba(0, 0, 0, 0.50);
    padding: 10px 125px;
}
.content_slider{
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    justify-content: center;
    align-items: center;
}
.btnSlider{
    color: #FFF;
    font-size: 15pt;
    font-family: 'arial';
    letter-spacing: 1px;
    padding: 10px 50px;
    border: 1px solid #CCC;
    background: rgba(13, 13, 13, 0.55);
    border-radius: 31px;
    text-decoration: none;
    transition: .5s all;
}
.btnSlider:hover{
    background: #111;
    border: 1px solid #111;
}
.listslider {
    position: absolute;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    justify-content: space-between;
    align-items: center;
    left: 50%;
    bottom: 5%;
    list-style: none;
    z-index: 2;
    transform: translateX(-50%);
}
.listslider li {
    border-radius: 50%;
    width: 10px;
    height: 10px;
    cursor: pointer;
    margin: 0 5px;
}
.listslider li a {
    background: #CCC;
    border-radius: 50%;
    width: 100%;
    height: 100%;
    display: block;
}
.item-select-slid {
    background: #FFF  !important;
}

@media screen and (max-width: 700px){
	.content_slider h2 {
	    font-size: 15pt !important;
	}
	.content_slider p {
	    font-size: 12pt !important;
	}
	#container-slider .arrowPrev, #container-slider .arrowNext{
		font-size: 20pt;
	}
	#container-slider .arrowPrev{
		left: 15px;
	}
	#container-slider .arrowNext{
		right: 15px !important;
	}
	#slider{
		height: 400px;
		min-height: 400px;
	}
	#slider li .content_slider{
		padding: 10px 35px;
	}
	.btnSlider{
		padding: 10px 30px;
    	font-size: 10pt;
	}

}
</style>