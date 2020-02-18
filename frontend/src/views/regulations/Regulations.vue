<template>
  <div id="regulations" :style="styles">
    <directory></directory>
    <car-body></car-body>
    <page-footer left="150px"></page-footer>
    <go-to-top></go-to-top>
  </div>
</template>

<script>
import Directory from "./Directory";
import CarBody from "./CarBody";

import GoToTop from "@/components/common/GoToTop";
import PageFooter from "@/components/common/PageFooter";

import { getCARegulations } from "@/network/regulations.js";

import { footerHeight } from "@/common/const.js";

export default {
  components: {
    Directory,
    CarBody,
    GoToTop,
    PageFooter
  },
  computed: {
    styles() {
      return {
        "margin-bottom": footerHeight + "px"
      };
    }
  },
  created() {
    getCARegulations().then(res => {
      this.$store.commit("setCARegulations", res.data);
    });
  }
};
</script>
