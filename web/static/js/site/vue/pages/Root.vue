<template lang="pug">
article.content
  h1 TopPage
  section
    ul(v-for="article in newArticles")
      li
        router-link(:to="{name: 'article/show', params: {permalink: article.permalink }}") {{article.title}}
</template>

<script>
import {mapGetters} from 'vuex'
export default {
  computed: mapGetters(['newArticles'])
}
</script>
