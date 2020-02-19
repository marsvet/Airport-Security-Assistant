<template>
  <div>
    <v-tabs centered grow v-model="tab" class="mb-8">
      <v-tab>按航班号</v-tab>
      <v-tab>按起降地</v-tab>
    </v-tabs>

    <v-tabs-items v-model="tab" class="pl-md-10 pr-md-10">
      <v-tab-item>
        <v-row>
          <v-col cols="12" md="6" class="pb-0">
            <v-text-field label="输入航班号" prepend-icon="mdi-numeric" v-model="flightNo"></v-text-field>
          </v-col>
          <v-col cols="12" md="6" class="pb-10 pb-md-5">
            <v-menu
              ref="menu1"
              v-model="menu1"
              :close-on-content-click="false"
              :return-value.sync="date"
              transition="scale-transition"
              offset-y
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="date"
                  label="起飞时间"
                  prepend-icon="mdi-calendar-range"
                  readonly
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker v-model="date" no-title scrollable>
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu1 = false">Cancel</v-btn>
                <v-btn text color="primary" @click="$refs.menu1.save(date)">OK</v-btn>
              </v-date-picker>
            </v-menu>
          </v-col>
        </v-row>
        <v-btn color="primary" outlined block @click="searchByNo">查询</v-btn>
      </v-tab-item>

      <v-tab-item>
        <v-row>
          <v-col cols="5" md="2" class="pl-5">
            <v-autocomplete
              :loading="placePickerLoading"
              v-model="source"
              :items="placeItems"
              clearable
              label="起飞地"
              no-data-text="未找到该城市"
            ></v-autocomplete>
          </v-col>
          <v-col cols="2" md="1" class="text-center pt-7">
            <v-icon>mdi-arrow-right-bold</v-icon>
          </v-col>
          <v-col cols="5" md="2" class="pr-5">
            <v-autocomplete
              :loading="placePickerLoading"
              v-model="destination"
              :items="placeItems"
              clearable
              label="目的地"
              no-data-text="未找到该城市"
            ></v-autocomplete>
          </v-col>
          <v-col cols="12" md="6" offset="0" offset-md="1" class="center">
            <v-menu
              ref="menu2"
              v-model="menu2"
              :close-on-content-click="false"
              :return-value.sync="date"
              transition="scale-transition"
              offset-y
              min-width="290px"
            >
              <template v-slot:activator="{ on }">
                <v-text-field
                  v-model="date"
                  label="起飞时间"
                  prepend-icon="mdi-calendar-range"
                  readonly
                  v-on="on"
                ></v-text-field>
              </template>
              <v-date-picker v-model="date" no-title scrollable>
                <v-spacer></v-spacer>
                <v-btn text color="primary" @click="menu2 = false">Cancel</v-btn>
                <v-btn text color="primary" @click="$refs.menu2.save(date)">OK</v-btn>
              </v-date-picker>
            </v-menu>
          </v-col>
        </v-row>
        <v-btn color="primary" outlined block @click="searchByPlace">查询</v-btn>
      </v-tab-item>
    </v-tabs-items>
  </div>
</template>

<script>
import { getAllLocation } from "@/network/flightInfo.js";

export default {
  data() {
    return {
      tab: 0,
      menu1: false,
      menu2: false,
      placePickerLoading: true,
      placeItems: [],
      flightNo: "",
      source: "",
      destination: "",
      date: new Date().toISOString().substr(0, 10)
    };
  },
  methods: {
    searchByNo() {
      this.$emit("searchByNo", this.flightNo, this.date);
    },
    searchByPlace() {
      this.$emit("searchByPlace", this.source, this.destination, this.date);
    }
  },
  created() {
    getAllLocation().then(res => {
      this.placeItems = res.data;
      this.placePickerLoading = false;
    });
  }
};
</script>
