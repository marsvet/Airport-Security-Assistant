<template>
  <v-row>
    <v-col cols="9" md="11">
      <v-autocomplete
        :loading="loading"
        v-model="value"
        :items="items"
        solo
        clearable
        label="输入物品名称以查询"
        no-data-text="没有匹配的物品信息"
        @change="valueChanged"
      ></v-autocomplete>
    </v-col>
    <v-col cols="3" md="1">
      <v-btn fab color="primary" @click="$refs.hiddenUploadBtn.click()">
        <v-icon>mdi-upload</v-icon>
      </v-btn>
      <input
        type="file"
        ref="hiddenUploadBtn"
        @change="changeFile"
        accept="image/jpg, image/jpeg, image/png, image/gif, image/bmp"
        style="display: none"
      />
    </v-col>
  </v-row>
</template>

<script>
import { getAllResName } from "@/network/danger.js";

export default {
  data() {
    return {
      loading: true,
      value: null,
      items: []
    };
  },
  methods: {
    valueChanged() {
      this.$emit("getResInfo", this.value);
    },
    changeFile(e) {
      this.$emit("getResInfoByImage", e.target.files[0]);
    }
  },
  created() {
    getAllResName().then(res => {
      this.items = res.data;
      this.loading = false;
    });
  }
};
</script>
