import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

import getters from "./getters";
import mutations from "./mutations";
import actions from "./actions";

const state = {
  CARegulations: [],
  currentShowedCAR: 0, // 当前展示的民航法规

  securityCheckTips: {},
  currentShowedTips: 0,

  currentShowedInfo: 0 // 手机端机场信息页面当前显示的信息。0 为机场地图，1 为天气情况，2 为安检口排队情况
};

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
});
