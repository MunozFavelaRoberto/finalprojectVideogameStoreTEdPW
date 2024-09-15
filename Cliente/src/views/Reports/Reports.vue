<template>
  <div class="container">
    <div class="row">
      <div class="col-12 text-center">
        <h4 class="pt-3">Reports</h4>
      </div>
    </div>

    <div class="features pt-3">
      <h5><strong>Sales Chart</strong></h5>
      <div class="row">
        <div class="col">
            <h5>Sales</h5>
          <GChart type="PieChart" :data="chartData" :options="chartOptions" />
        </div>
        <div class="col">
            <h5>New Users</h5>
          <GChart type="PieChart" :data="chartData" :options="chartOptions" />
        </div>
        <div class="col">
            <h5>Others</h5>
          <GChart type="PieChart" :data="chartData" :options="chartOptions" />
        </div>
      </div>
    </div>
    <div class="features pt-3">
      <h5><strong>Sumary</strong></h5>
      <GChart type="ColumnChart" :data="chartData" :options="chartOptions" />
    </div>
  </div>
</template>

<script>
import AddressBox from "../../components/Address/AddressBox";
import { GChart } from "vue-google-charts";

export default {
  name: "Reports",
  components: { AddressBox, GChart },
  props: ["baseURL", "addresses"],
  data() {
    return {
      chartData: [
        ["Year", "Sales", "Expenses", "Profit"],
        ["2014", 1000, 400, 200],
        ["2015", 1170, 460, 250],
        ["2016", 660, 1120, 300],
        ["2017", 1030, 540, 350],
      ],
      chartOptions: {
        chart: {
          title: "Company Performance",
          subtitle: "Sales, Expenses, and Profit: 2014-2017",
        },
      },
    };
  },
  mounted() {
    // this.category_size = this.categories.length;
    // this.category_size = Math.min(6, this.category_size);
    // this.product_size = this.products.length;
    // this.product_size = Math.min(8, this.category_size);
  },
};
</script>


<style scoped>
h4 {
  font-family: "Roboto", sans-serif;
  color: #484848;
  font-weight: 700;
}
</style>