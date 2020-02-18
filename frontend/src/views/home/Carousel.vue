<template>
  <v-carousel
    cycle
    hide-delimiter-background
    hide-delimiters
    interval="5000"
    show-arrows-on-hover
    :height="mapHeight"
    :show-arrows="$vuetify.breakpoint.mdAndUp"
  >
    <v-carousel-item v-for="img in images" :src="img.src"></v-carousel-item>
  </v-carousel>
</template>

<script>
import { server } from "@/common/const.js";

export default {
  data() {
    return {
      images: [
        { src: server + "/raw/img/slide1.jpg" },
        { src: server + "/raw/img/slide2.jpg" },
        { src: server + "/raw/img/slide3.jpg" },
        { src: server + "/raw/img/slide4.jpg" }
      ]
    };
  },
  computed: {
    mapHeight() {
      if (this.$vuetify.breakpoint.smAndDown) return 200;
      else return 550;
    }
  }
};
</script>
