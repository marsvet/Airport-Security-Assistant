<template>
  <div id="flight-info">
    <div :style="styles">
      <searcher @searchByNo="searchByNo" @searchByPlace="searchByPlace"></searcher>
      <info-table class="mt-3 mt-md-10" :flightInfos="flightInfos" :loading="tableLoading"></info-table>
    </div>
  </div>
</template>

<script>
import Searcher from "./Searcher";
import InfoTable from "./InfoTable";

import {
  getFlightInfoByNo,
  getFlightInfoByLocation
} from "@/network/flightInfo.js";

export default {
  components: {
    Searcher,
    InfoTable
  },
  data() {
    return {
      flightInfos: [],
      tableLoading: false
    };
  },
  computed: {
    styles() {
      let width = "";
      if (this.$vuetify.breakpoint.mdAndUp) width = "60%";
      else width = "85%";

      return {
        width: width,
        margin: "30px auto 0 auto"
      };
    }
  },
  methods: {
    searchByNo(flightNo, date) {
      this.tableLoading = true;

      getFlightInfoByNo(flightNo, date).then(res => {
        let data = res.data;

        data.leavePlace = data.leavePort + data.leaveBuilding;
        data.arrivePlace = data.arrivePort + data.arriveBuilding;

        this.flightInfos = [];
        this.flightInfos.push(data);

        this.tableLoading = false;
      });
    },
    searchByPlace(source, destination, date) {
      this.tableLoading = true;

      getFlightInfoByLocation(source, destination, date).then(res => {
        let data = res.data.flightInfos;

        this.flightInfos = [];
        for (let item of data) {
          item.leavePlace = item.leavePort + item.leaveBuilding;
          item.arrivePlace = item.arrivePort + item.arriveBuilding;
          this.flightInfos.push(item);
        }

        this.tableLoading = false;
      });
    }
  }
};
</script>
