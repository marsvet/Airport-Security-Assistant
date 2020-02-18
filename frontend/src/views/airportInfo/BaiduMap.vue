<template>
  <div id="baidu-map" :style="mapStyle"></div>
</template>

<script>
import BMap from "BMap";

import { tabBarHeight } from "@/common/const.js";

export default {
  computed: {
    mapStyle() {
      return { height: `calc(100vh - ${tabBarHeight}px)` };
    }
  },
  methods: {
    createMap() {
      let map = new BMap.Map("baidu-map", { minZoom: 18, maxZoom: 19 }); // 创建Map实例
      let top_left_control = new BMap.ScaleControl({
        anchor: BMAP_ANCHOR_TOP_LEFT
      }); // 左上角，添加比例尺
      map.addControl(top_left_control);
      map.centerAndZoom(new BMap.Point(117.369194, 39.137837), 19); // 初始化地图,设置中心点坐标和地图级别
      map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
      let indoorManager = new BMapLib.IndoorManager(map);
    }
  },
  mounted() {
    this.createMap();
  }
};
</script>
