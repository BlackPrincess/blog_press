<template lang="pug">
  article
    .page-header
      h1.page-title 記事一覧
      .page-controls
        router-link.btn.btn-new(:to="{name: 'articles/new'}") 追加
    section.page-content
      table.table
        thead
          tr
            th タイトル
            th パーマリンク
            th 公開時刻
            th 新規作成時刻
            th 最終更新時刻
            th
        tbody
          tr(v-for="article in articles") 
            td {{article.title}}
            td {{article.permalink}}
            td {{article.publishedAt}}
            td {{article.createdAt}}
            td {{article.updatedAt}}
            td
              router-link.btn.btn-edit(:to="{name: 'article/edit', params: {id: article.id }}") 編集
</template>

<script>
import * as api from "../../../api/articles" // TODO:

export default {
  data() {
    return {
      articles: []
    }
  },
  beforeCreate() {
    api.fetchArticles().then(res => {
      this.articles = res.data
    })
  }
}
</script>
