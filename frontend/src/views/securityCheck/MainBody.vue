<template>
  <v-content>
    <v-container class="fill-height" fluid :style="bodyStyle">
      <h1>{{ tips[tipsIndex].title }}</h1>
      <div v-if="tips[tipsIndex].image" style="width: 100%;">
        <img :src="staticServer + tips[tipsIndex].image" style="width: 100%;" preview />
      </div>
      <p v-else v-for="para in tips[tipsIndex].body">{{ para }}</p>
    </v-container>
  </v-content>
</template>

<script>
import { staticServer } from "@/common/const.js";

export default {
  data() {
    return {
      staticServer
    };
  },
  computed: {
    bodyStyle() {
      if (this.$vuetify.breakpoint.mdAndUp)
        return {
          padding: "50px 170px",
          "font-size": "1.2em"
        };
      else
        return {
          padding: "50px 30px"
        };
    },
    tips() {
      return this.$store.state.securityCheckTips;
    },
    tipsIndex() {
      return this.$store.state.currentShowedTips;
    }
  }
};
</script>

<style scoped>
h1 {
  width: 100%;
  margin: 0 auto 40px auto;
  text-align: center;
}

p {
  margin-top: 15px;
  text-indent: 2em;
}
</style>
