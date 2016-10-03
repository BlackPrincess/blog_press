<template lang="pug">
  article.article
    h1.page-title(v-text="article.title")
    section.article-body(v-html="bodyHtml")
</template>

<script>
import {mapGetters} from 'vuex'
import * as articleApi from '../../../api/articles'

export default {
  props: {
    article: {
      title: {
        type: String,
        default: '',
        required: true
      },
      body: {
        type: String,
        default: '',
        required: true
      }
    }
  },
  computed: {
    bodyHtml: function() {
      if(this.article == null) return ''
      return this.md2html(this.article.body)
    }
  },
  methods: {
    md2html: (arg) => window.marked(arg) // TODO: Remove marked.js
  },
  beforeCreate() {
    // TODO: Action & mutation
    articleApi.fetchArticle(this.$route.params.permalink).then((res) => {
      this.article = res.data
    })
  }
}
</script>

<style lang="scss">
$font-monospace: Consolas, 'Courier New', Courier, Monaco, monospace;
.article-body {
  font-size: 1.6rem;
  
  h1 {
    margin: 13px 0;
    font-size: 3.6rem;
    
    &::before {
      $size: 15px;
      display: inline-block;
      width: 0;
      height: 0;
      border: $size solid transparent;
      border-left: $size solid #7e7ff5;
      content: '';
    }
  }

  h2 {
    margin: 8px 0;
    font-size: 2.9rem;
    
    &::before {
      $size: 12px;
      display: inline-block;
      width: 0;
      height: 0;
      border: $size solid transparent;
      border-left: $size solid #7e7ff5;
      content: '';
    }
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
}
</style>
