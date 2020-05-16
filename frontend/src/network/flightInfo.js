import axios from "./base";
import { apiServer } from "@/common/const.js";

export function getAllLocation() {
  return axios({
    url: apiServer + "/api/all_location",
  });
}

export function getFlightInfoByNo(flightNo, date) {
  return axios({
    url: apiServer + "/api/flight_info_by_no",
    method: "POST",
    data: {
      flightNo,
      date,
    },
  });
}

export function getFlightInfoByLocation(leave, arrive, date) {
  return axios({
    url: apiServer + "/api/flight_info_by_location",
    method: "POST",
    data: {
      leave,
      arrive,
      date,
    },
  });
}
