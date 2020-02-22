<template>
  <iframe src="https://www.wjx.cn/jq/48103469.aspx" frameborder="0" :style="styles"></iframe>
</template>

<script>
export default {
  computed: {
    styles() {
      let height = "0";
      if (this.$vuetify.breakpoint.smAndDown) height = "3000px";
      else height = "2300px";
      return {
        height: height
      };
    }
  }
};
</script>
