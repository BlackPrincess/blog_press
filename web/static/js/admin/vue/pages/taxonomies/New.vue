<template lang="pug">
  article
    .page-header
      h1.page-title 分類追加
    section.page-content
      form.form-table(@submit.prevent="submit")
        .inner
          .form-group
            label.form-label コード
            .form-inputs
              input.input(type="text" v-model="taxonomy.code")
          .form-group
            label.form-label 名称
            .form-inputs
              input.input(type="text" v-model="taxonomy.name")
        .form-controls
          button.btn.btn-submit(type="submit") 登録
</template>

<script>
import * as api from "../../../api/taxonomies" // TODO:

export default {
  data() {
    return {
      taxonomy: {
        code: "",
        name: ""
      }
    }
  },
  methods: {
    submit() {
      api.createTaxonomy(this.taxonomy).then(res => {
        console.dir(res)
      })
    }
  }
}
</script>
