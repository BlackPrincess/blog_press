import * as axios from "axios"
import * as jsonUtil from "../../core/utils/json_util" // TODO:

export function createArticle(data) {
  return axios.post("/admin/api/articles", {article: jsonUtil.underscoreKey(data)})
}

export function fetchArticles() {
  return axios.get("/admin/api/articles").then((res) => jsonUtil.camelizeKey(res))
}
