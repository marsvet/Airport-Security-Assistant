import axios from "./base";
import { staticServer } from "@/common/const.js";

export function getSecurityCheckTips() {
  return axios({
    url: staticServer + "/raw/json/security_check.json"
  });
}
