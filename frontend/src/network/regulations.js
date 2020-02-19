import axios from "./base";
import { staticServer } from "@/common/const.js";

export function getCARegulations() {
  return axios({
    url: staticServer + "/raw/json/regulations.json"
  });
}
