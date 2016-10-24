import * as axios from "axios"

export function createArticle(data) {
  return axios.post("/admin/api/articles", {article: data})
}
