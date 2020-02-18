import axios from "./base";

export function getSecurityCheckTips() {
  return axios({
    url: "/raw/json/security_check.json"
  });
}
