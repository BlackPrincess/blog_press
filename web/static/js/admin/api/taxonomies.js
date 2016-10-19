import * as axios from "axios"
export function fetchTaxonomies() {
  return axios.get("/admin/api/taxonomies")
}

export function createTaxonomy(data) {
  return axios.post("/admin/api/taxonomies", {taxonomy: data})
}
