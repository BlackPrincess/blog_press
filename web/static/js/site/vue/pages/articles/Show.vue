<template lang="pug">
  article.article
    header.article-header
      h1.page-title(v-text="article.title")
      .article-header-info
        p.left
          span.label taxon:
          span.data(v-text="article.taxon.name")
        p.right
          span.label published at:
          span.data(v-text="article.published_at")
      p
        ul.tags
          li(v-for="tag in article.tags")
            span.tag(v-text="tag.name")
          
    section.article-body(v-html="bodyHtml")
</template>

<script>
import {mapGetters} from 'vuex'
import * as articleApi from '../../../api/articles'

export default {
  data(){
    return {
      article: {
        title: '', 
        body: '',
        published_at: '2016-10-04 11:22:33',
        tags: [],
        taxon: {
          name: ''
        }
      }
    }
  },
  computed: {
    bodyHtml: function() {
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
.tags {
  li {
    display: inline-block;
  }
}
.tag {
  display: inline-block;
  margin-right: 8px;
  padding: 5px 8px;
  font-size: 1.4rem;
  border-radius: 8px;
  color: #fcfcfc;
  background-color: #12a3a3;
}

.article-header {
  .label {
    display: inline-block;
    margin-right: 8px;
    font-size: 1.6rem;
    font-weight: bold;
  }
  
  .data {
    display: inline-block;
    margin-right: 8px;
    font-size: 1.6rem;
  }
  
  .article-header-info {
    margin: 3px 0;
    
    &:after {
      content:"";display:block;clear:both;
    }
  }
  
  .left {
    float: left;
  }
  
  .right {
    float: right;
  }
}

$font-monospace: Consolas, 'Courier New', Courier, Monaco, monospace;
.article-body {
  margin-top: 40px;
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
