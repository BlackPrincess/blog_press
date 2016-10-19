<template lang="pug">
  article
    .page-header
      h1.page-title 分類追加
    section.page-content
      form.form-table(@submit.prevent="submit")
        .inner
          .form-group
            label.form-label 名称
            .form-inputs
              input.input(type="text" v-model="taxonomy.name")
        .form-controls
          button.btn.btn-submit(type="submit") 登録
</template>

<script>
export default {
  data() {
    return {
      taxonomy: {
        name: ""
      }
    }
  },
  methods: {
    submit() {
      console.dir(this.taxonomy)
    }
  }
}
</script>
