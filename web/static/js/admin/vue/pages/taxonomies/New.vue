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
              span.input-error-msg(v-if="errors.code") {{errors.code}}
          .form-group
            label.form-label 名称
            .form-inputs
              input.input(type="text" v-model="taxonomy.name")
              span.input-error-msg(v-if="errors.name") {{errors.name}}
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
      },
      errors: {}
    }
  },
  methods: {
    submit() {
      api.createTaxonomy(this.taxonomy).then(res => {
        console.dir(res)
        if(res.data.status == "success") {
          this.$router.push({name: 'taxonomies/index'})
        } else {
          this.errors = res.data.messages
        }
      })
    }
  }
}
</script>
