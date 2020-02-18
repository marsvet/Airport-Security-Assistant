<template>
  <div id="home" :style="homeStyle">
    <carousel></carousel>
    <func-nav></func-nav>
    <page-footer hasBorderTop></page-footer>
  </div>
</template>

<script>
import PageFooter from "@/components/common/PageFooter";

import Carousel from "./Carousel";
import FuncNav from "./FuncNav";

import { footerHeight } from "@/common/const.js";

export default {
  components: {
    Carousel,
    FuncNav,
    PageFooter
  },
  computed: {
    homeStyle() {
      return { "margin-bottom": footerHeight * 1.2 + "px" };
    }
  }
};
</script>
