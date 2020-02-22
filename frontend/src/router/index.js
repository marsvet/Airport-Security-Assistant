import Vue from "vue";
import VueRouter from "vue-router";
import goTo from "vuetify/es5/services/goto"; // 使用 vuetify 中的 goTo 函数，使路由切换时将页面滚动到顶部

Vue.use(VueRouter);

const Home = () => import("../views/home/Home");
const Regulations = () => import("../views/regulations/Regulations");
const Danger = () => import("../views/danger/Danger");
const AirportInfo = () => import("../views/airportInfo/AirportInfo");
const SecurityCheck = () => import("../views/securityCheck/SecurityCheck");
const FlightInfo = () => import("../views/flightInfo/FlightInfo");
const Satisfaction = () => import("../views/satisfaction/Satisfaction");

const routes = [
  {
    path: "/",
    component: Home,
    meta: {
      title: "机场安检助手"
    }
  },
  {
    path: "/regulations",
    component: Regulations,
    meta: {
      title: "民航法规 - 机场安检助手"
    }
  },
  {
    path: "/danger",
    component: Danger,
    meta: {
      title: "危险物品 - 机场安检助手"
    }
  },
  {
    path: "/airport_info",
    component: AirportInfo,
    meta: {
      title: "机场信息 - 机场安检助手"
    }
  },
  {
    path: "/security_check",
    component: SecurityCheck,
    meta: {
      title: "安检须知 - 机场安检助手"
    }
  },
  {
    path: "/flight_info",
    component: FlightInfo,
    meta: {
      title: "航班查询 - 机场安检助手"
    }
  },
  {
    path: "/satisfaction",
    component: Satisfaction,
    meta: {
      title: "满意度调查 - 机场安检助手"
    }
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
