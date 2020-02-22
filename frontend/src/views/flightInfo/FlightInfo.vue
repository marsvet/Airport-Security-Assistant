<template>
  <div id="flight-info">
    <div :style="styles" :class="{'elevation-4': $vuetify.breakpoint.mdAndUp}">
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

import { tabBarHeight } from "@/common/const.js";

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
      let padding = "";
      let height = "";
      if (this.$vuetify.breakpoint.mdAndUp) {
        width = "63%";
        padding = "35px 70px";
        height = `calc(100vh - ${tabBarHeight}px)`;
      } else {
        width = "85%";
        padding = "30px 0";
        height = "auto";
      }

      return {
        margin: "0 auto",
        width,
        padding,
        height
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
