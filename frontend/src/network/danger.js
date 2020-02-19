import axios from "./base";
import { apiServer } from "@/common/const.js";

export function getAllResName() {
  return axios({
    url: apiServer + "/all_res_name"
  });
}

export function getResInfo(resName) {
  return axios({
    url: apiServer + "/res_info",
    method: "POST",
    data: {
      res_name: resName
    }
  });
}

export function uploadImg(form) {
  return axios({
    url: apiServer + "/res_info_by_image",
    method: "POST",
    config: {
      headers: { "Content-Type": "multipart/form-data" }
    },
    data: form
  });
}
