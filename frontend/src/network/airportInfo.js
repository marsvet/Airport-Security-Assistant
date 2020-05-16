import axios from "./base";
import { apiServer } from "@/common/const.js";

export function getWeather(city) {
  return axios({
    url: "https://jisutianqi.market.alicloudapi.com/weather/query",
    params: {
      city: city,
    },
    headers: {
      Authorization: "APPCODE 797a45df4c3e4876ad887686d674010f",
    },
  });
}

export function getCrowdStatus() {
  return axios({
    url: apiServer + "/api/crowd_status",
  });
}
