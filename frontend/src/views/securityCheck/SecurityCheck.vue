<template>
  <div id="security-check" :style="styles">
    <directory></directory>
    <main-body></main-body>
    <page-footer left="150px"></page-footer>
  </div>
</template>

<script>
import Directory from "./Directory";
import MainBody from "./MainBody";

import PageFooter from "@/components/common/PageFooter";

import { getSecurityCheckTips } from "@/network/securityCheck.js";

import { footerHeight } from "@/common/const.js";

export default {
  components: {
    Directory,
    MainBody,
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
    getSecurityCheckTips().then(res => {
      this.$store.commit("setSecurityCheckTips", res.data);
    });
  }
};
</script>
