import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import vuetify from "./plugins/vuetify";

// 图片查看插件
import preview from "vue-photo-preview";
import "vue-photo-preview/dist/skin.css";
Vue.use(preview);

// 用来修改 title 的插件。普通方法无法修改微信中的 title
import VueWechatTitle from "vue-wechat-title";
Vue.use(VueWechatTitle);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount("#app");
