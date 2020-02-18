<template>
  <v-card>
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title class="headline">当前安检口排队情况</v-list-item-title>
      </v-list-item-content>
    </v-list-item>

    <v-list class="transparent" dense>
      <v-list-item v-for="item in terminal">
        <v-list-item-title>{{ item.location }}</v-list-item-title>
        <v-list-item-subtitle class="text-right">{{ item.crowdStatus }}</v-list-item-subtitle>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
import { getCrowdStatus } from "@/network/airportInfo.js";

export default {
  data() {
    return {
      terminal: []
    };
  },
  created() {
    getCrowdStatus().then(res => {
      for (let item of res.data.dataList) {
        this.terminal.push({
          location: item.locTerminal + " 航站楼",
          crowdStatus:
            item.crowdStatus == "3" ? "当前排队人数众多" : "当前排队人数较多"
        });
      }
    });
  }
};
</script>
