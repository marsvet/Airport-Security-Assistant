<template>
  <v-app id="app">
    <!-- <login-dialog :dialog="loginDialogShowed"></login-dialog>
    <registration-dialog></registration-dialog>-->
    <tab-bar @showLoginDialog="showLoginDialog"></tab-bar>
    <keep-alive>
      <router-view :style="routerViewStyle"></router-view>
    </keep-alive>
  </v-app>
</template>

<script>
import { tabBarHeight } from "./common/const.js";

// import LoginDialog from "./components/content/LoginDialog";
// import RegistrationDialog from "./components/content/RegistrationDialog";
import TabBar from "./components/content/TabBar";

export default {
  name: "App",
  components: {
    TabBar
    // LoginDialog,
    // RegistrationDialog
  },
  data() {
    return {
      loginDialogShowed: false,
      routerViewStyle: {
        "margin-top": tabBarHeight + "px"
      }
    };
  },
  methods: {
    showLoginDialog() {
      this.loginDialogShowed = true;
    }
  }
};
</script>

<style scoped>
@import "./assets/css/base.css";
</style>
