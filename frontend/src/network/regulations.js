import axios from "./base";

export function getCARegulations() {
  return axios({
    url: "/raw/json/regulations.json"
  });
}
