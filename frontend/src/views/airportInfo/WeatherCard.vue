<template>
  <v-card style="padding-top: 10px">
    <v-list-item two-line dense>
      <v-list-item-content>
        <v-list-item-title class="headline">{{ cityName }}</v-list-item-title>
        <v-list-item-subtitle>{{ date }}, {{ week }}</v-list-item-subtitle>
      </v-list-item-content>
    </v-list-item>

    <v-card-text>
      <v-row align="center">
        <v-col class="display-2" cols="6">{{ temp }}&deg;C</v-col>
        <v-col cols="6">
          <v-img :src="server + '/raw/img/weather_icons/' + weather + '.png'" width="60"></v-img>
        </v-col>
      </v-row>
    </v-card-text>

    <v-list-item dense>
      <v-list-item-icon>
        <v-icon>mdi-send</v-icon>
      </v-list-item-icon>
      <v-list-item-subtitle>{{ windSpeed }} km/h, {{ windDirect }}{{ windPower }}</v-list-item-subtitle>
    </v-list-item>

    <v-divider></v-divider>

    <v-list class="transparent" dense>
      <v-list-item v-for="item in hourly">
        <v-list-item-title>{{ item.time }}</v-list-item-title>

        <v-list-item-icon>
          <img
            style="width: 30px;"
            :src="server + '/raw/img/weather_icons/' + item.weather + '.png'"
          />
        </v-list-item-icon>

        <v-list-item-subtitle class="text-right">{{ item.temp }}&deg;C</v-list-item-subtitle>
      </v-list-item>
    </v-list>

    <v-text-field
      @change="search"
      v-model="value"
      :loading="loading"
      prepend-icon="mdi-map-marker"
      label="输入城市名"
      style="padding: 5px 15px 0 15px;"
    ></v-text-field>
  </v-card>
</template>

<script>
import { getWeather } from "@/network/airportInfo.js";

import { server } from "@/common/const.js";

export default {
  data() {
    return {
      cityName: "",
      date: "",
      week: "",
      weather: "",
      temp: "", // 温度
      windSpeed: "", // 风速
      windDirect: "", // 风向
      windPower: "", // 风的等级
      hourly: [], // 未来几个小时的情况

      value: "",
      loading: false,
      server
    };
  },
  methods: {
    getCityWeather(city) {
      getWeather(city).then(res => {
        let status = res.data.status;
        if (status != "0") {
        }
        let data = res.data.result;

        this.cityName = data.city;
        this.date = data.date;
        this.week = data.week;
        this.weather = data.weather;
        this.temp = data.temp;
        this.windSpeed = data.windspeed;
        this.windDirect = data.winddirect;
        this.windPower = data.windpower;
        this.hourly = data.hourly.slice(0, 3);

        this.loading = false;
      });
    },
    search() {
      this.loading = true;
      this.getCityWeather(this.value);
    }
  },
  created() {
    this.getCityWeather("东丽区");
  }
};
</script>
