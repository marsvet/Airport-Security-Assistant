export default {
  ["setCARegulations"](state, car) {
    state.CARegulations = car;
  },
  ["setCurrentShowedCAR"](state, index) {
    state.currentShowedCAR = index;
  },

  ["setSecurityCheckTips"](state, tips) {
    state.securityCheckTips = tips;
  },
  ["setCurrentShowedTips"](state, index) {
    state.currentShowedTips = index;
  },

  ["setCurrentShowedInfo"](state, index) {
    state.currentShowedInfo = index;
  }
};
