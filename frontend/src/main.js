import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import vuetify from "./plugins/vuetify";

import preview from "vue-photo-preview"; // 图片查看组件
import "vue-photo-preview/dist/skin.css";
Vue.use(preview);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount("#app");
