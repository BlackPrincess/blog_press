import * as axios from "axios"
export function fetchArticle(permalink) {
  return axios.get(`/api/articles/${permalink}`)
}
