<template>
  <v-content>
    <v-container class="fill-height" fluid :style="bodyStyle">
      <h1>{{ $store.state.CARegulations[$store.state.currentShowedCAR].title }}</h1>
      <p v-for="para in $store.state.CARegulations[$store.state.currentShowedCAR].body">{{ para }}</p>
    </v-container>
  </v-content>
</template>

<script>
export default {
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
