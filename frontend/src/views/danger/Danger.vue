<template>
  <div id="danger" :style="styles">
    <v-container :style="dangerStyle">
      <search-res @getResInfo="getResInfo" @getResInfoByImage="getResInfoByImage"></search-res>
      <res-card :loading="resCardLoading" :res="res"></res-card>
    </v-container>
    <page-footer></page-footer>
  </div>
</template>

<script>
import SearchRes from "./SearchRes";
import ResCard from "./ResCard";

import PageFooter from "@/components/common/PageFooter";

import { footerHeight } from "@/common/const.js";

import { getResInfo, uploadImg } from "@/network/danger.js";

export default {
  components: {
    SearchRes,
    ResCard,
    PageFooter
  },
  data() {
    return {
      resCardLoading: false,
      res: {
        resName: "无",
        resDescription: "无",
        resLimit: "无",
        resCarryMethod: "无",
        resClass: "无",
        imgAddress: this.$vuetify.breakpoint.smAndDown
          ? "/raw/img/placeholderMobile.png"
          : "/raw/img/placeholder.png"
      }
    };
  },
  methods: {
    getResInfo(resName) {
      this.resCardLoading = true;
      getResInfo(resName).then(res => {
        let data = res.data;

        this.res.resName = data["物品名称"] ? data["物品名称"] : "无";
        this.res.resDescription = data["附加说明"] ? data["附加说明"] : "无";
        this.res.resLimit = data["限定规格"] ? data["限定规格"] : "无";
        this.res.resCarryMethod = data["携带方式"] ? data["携带方式"] : "无";
        this.res.resClass = data["物品所属分类"] ? data["物品所属分类"] : "无";

        if (data["图片地址"]) this.res.imgAddress = data["图片地址"];
        else if (this.$vuetify.breakpoint.smAndDown)
          this.res.imgAddress = "/raw/img/noImageMobile.png";
        else this.res.imgAddress = "/raw/img/noImage.png";

        this.resCardLoading = false;
      });
    },
    getResInfoByImage(file) {
      this.resCardLoading = true;

      let form = new FormData();
      form.append("image", file);
      uploadImg(form).then(res => {
        let data = res.data;

        this.res.resName = data["物品名称"] ? data["物品名称"] : "无";
        this.res.resDescription = data["附加说明"] ? data["附加说明"] : "无";
        this.res.resLimit = data["限定规格"] ? data["限定规格"] : "无";
        this.res.resCarryMethod = data["携带方式"] ? data["携带方式"] : "无";
        this.res.resClass = data["物品所属分类"] ? data["物品所属分类"] : "无";

        if (data["图片地址"]) this.res.imgAddress = data["图片地址"];
        else if (this.$vuetify.breakpoint.smAndDown)
          this.res.imgAddress = "/raw/img/noImageMobile.png";
        else this.res.imgAddress = "/raw/img/noImage.png";

        this.resCardLoading = false;
      });
    }
  },
  computed: {
    styles() {
      return {
        "margin-bottom": footerHeight + "px"
      };
    },
    dangerStyle() {
      return {
        padding: this.$vuetify.breakpoint.smAndDown ? "20px" : "50px 200px"
      };
    }
  }
};
</script>
