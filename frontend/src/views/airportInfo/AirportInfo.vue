<template>
  <div id="airport-info">
    <div v-if="isMobile">
      <baidu-map v-if="currentShowed == 0"></baidu-map>
      <weather-card
        v-else-if="currentShowed == 1"
        :style="{ height: 'calc(100vh - ' + tabBarHeight + 'px' }"
      ></weather-card>
      <crowd-status-card v-else :style="{ height: 'calc(100vh - ' + tabBarHeight + 'px' }"></crowd-status-card>
    </div>
    <div v-else>
      <baidu-map></baidu-map>
      <div :style="pcStyle">
        <weather-card></weather-card>
        <crowd-status-card style="margin-top: 10px;"></crowd-status-card>
      </div>
    </div>
  </div>
</template>

<script>
import BaiduMap from "./BaiduMap";
import CrowdStatusCard from "./CrowdStatusCard";
import WeatherCard from "./WeatherCard";

import { tabBarHeight } from "@/common/const.js";

export default {
  components: {
    BaiduMap,
    CrowdStatusCard,
    WeatherCard
  },
  data() {
    return {
      tabBarHeight
    };
  },
  computed: {
    isMobile() {
      return this.$vuetify.breakpoint.smAndDown;
    },
    pcStyle() {
      return {
        width: "300px",
        position: "fixed",
        "z-index": 10,
        left: "35px",
        top: tabBarHeight + 10 + "px"
      };
    },
    currentShowed() {
      return this.$store.state.currentShowedInfo;
    },
    weatherCardStyle() {
      return {};
    },
    crowdStatusCardStyle() {
      return {};
    }
  }
};
</script>
