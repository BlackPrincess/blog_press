<template lang="pug">
  article
    .page-header
      h1.page-title 分類一覧
      .page-controls
        router-link.btn.btn-new(:to="{name: 'taxonomies/new'}") 追加
    section.page-content
      ul.list
        li.list-group(v-for="taxonomy in taxonomies") {{taxonomy.name}}
</template>

<script>
import * as api from "../../../api/taxonomies" // TODO:

export default {
  data() {
    return {
      taxonomies: []
    }
  },
  beforeCreate() {
    api.fetchTaxonomies().then(res => {
      this.taxonomies = res.data
    })
  }
}
</script>
