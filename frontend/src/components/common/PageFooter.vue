<template>
  <v-footer
    id="footer"
    padless
    absolute
    class="font-weight-medium"
    color="white"
    :style="footerStyle"
  >
    <v-col class="text-center" cols="12">Copyright &copy; 2019.CAUC All rights reserved.</v-col>
  </v-footer>
</template>

<script>
import { footerHeight } from "@/common/const.js";

export default {
  props: {
    hasBorderTop: {
      type: Boolean,
      default: false
    },
    left: {
      type: String,
      default: "0"
    },
    zIndex: {
      type: String,
      default: "0"
    }
  },
  computed: {
    footerStyle() {
      let style = {
        color: "rgba(0, 0, 0, 0.5)",
        "z-index": this.zIndex
      };

      if (this.hasBorderTop)
        style["border-top"] = "1px solid rgba(0, 0, 0, 0.15) !important";

      if (this.$vuetify.breakpoint.smAndDown) {
        style["height"] = footerHeight * 0.7 + "px";
      } else {
        style["height"] = footerHeight + "px";
        style["left"] = this.left;
      }

      return style;
    }
  }
};
</script>
