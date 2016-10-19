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
export default {
  data() {
    return {
      taxonomies: [
          {id: 1, name: 'foo'},
          {id: 2, name: 'bar'}
        ]
    }
  }
}
</script>
