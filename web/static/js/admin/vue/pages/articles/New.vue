<template lang="pug">
  article
    .page-header
      h1.page-title 記事追加
    section.page-content
      form(@submit.prevent="submit")
        .form-group
          label タイトル
          input.input(v-model="article.title")
          span.input-error-msg(v-if="errors.title") {{errors.title}}
        .form-group
          label URL
          input.input(v-model="article.permalink")
          span.input-error-msg(v-if="errors.permalink") {{errors.permalink}}
        .form-group
          label 公開日
          input.input(v-model="article.publishedAt")
          span.input-error-msg(v-if="errors.publishedAt") {{errors.publishedAt}}
        .form-group
          label 本文
          .separate
            .left
              textarea.input.input-article-body(v-model="article.originalBody" rows=30)
              span.input-error-msg(v-if="errors.originalBody") {{errors.originalBody}}
            .right
              .preview(v-html="bodyHtml")
              span.input-error-msg(v-if="errors.bodyHtml") {{errors.bodyHtml}}
        .form-controls
          button.btn.btn-new(type="submit") 登録
</template>

<script>
import * as api from "../../../api/articles" // TODO:
import marked from 'marked'

export default {
  data() {
    return {      
      article: {
        title: '', 
        permalink: '',
        originalBody: '',
        bodyHtml: '',
        publishedAt: ''
      },
      errors: {}
    }
  },
  computed: {
    bodyHtml: function() {
      return marked(this.article.originalBody)
    }
  },
  methods: {
    submit() {
      api.createArticle(this.article).then(res => {
        if(res.data.status == "success") {
          this.$router.push({name: 'articles/index'})
        } else {
          this.errors = res.data.messages
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped>
.input-article-body {
  width: 100%;
  border: 1px solid #000;  
  min-height: 100vh;
}

.separate {
  display: flex;
  justify-content: space-between;
  .left {
    order: 1;
    width: 49%;
  }
  
  .right {
    order: 2;
    width: 49%;
  }
  
  .preview {
    height: 100%;
    border-radius: 5px;
    overflow-y: scroll;
    background-color: #f0f0f0;
  }
}

</style>

<style lang="scss">

$font-monospace: Consolas, 'Courier New', Courier, Monaco, monospace;
.preview {
  font-size: 1.6rem;
  
  h1 {
    margin: 13px 0;
    font-size: 3.6rem;
  }

  h2 {
    margin: 8px 0;
    font-size: 2.9rem;
  }
  
  h3 {
    margin: 5px 0;
    font-size: 2.4rem;
  }
  
  h4 {
    margin: 3px 0;
    font-size: 2.1rem;
  }
  
  h5 {
    margin: 2px 0;
    font-size: 1.9rem;
  }
  
  h6 {
    margin: 1px 0;
    font-size: 1.8rem;
  }

  code {
    font-family: $font-monospace;
  }
  
  p {
    padding: 4px 0;
  }
  
  li {
    margin-left: 24px;
  }
  
  ul {
    li {
      list-style-type: disc;
    }
  }
  
  ol {
    li {
      list-style-type: decimal;
    }
  }
}
</style>
