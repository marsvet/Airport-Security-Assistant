import Vue from "vue";
import VueRouter from "vue-router";
import goTo from "vuetify/es5/services/goto"; // 使用 vuetify 中的 goTo 函数，使路由切换时将页面滚动到顶部

Vue.use(VueRouter);

const Home = () => import("../views/home/Home");
const Regulations = () => import("../views/regulations/Regulations");
const Danger = () => import("../views/danger/Danger");
const AirportInfo = () => import("../views/airportInfo/AirportInfo");
const SecurityCheck = () => import("../views/securityCheck/SecurityCheck");

const routes = [
  {
    path: "/",
    component: Home
  },
  {
    path: "/regulations",
    component: Regulations
  },
  {
    path: "/danger",
    component: Danger
  },
  {
    path: "/airport_info",
    component: AirportInfo
  },
  {
    path: "/security_check",
    component: SecurityCheck
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,

  scrollBehavior: (to, from, savedPosition) => {
    let scrollTo = 0;

    if (to.hash) {
      scrollTo = to.hash;
    } else if (savedPosition) {
      scrollTo = savedPosition.y;
    }

    return goTo(scrollTo, {
      duration: 0
    });
  }
});

export default router;
