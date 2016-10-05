import Vue from 'vue'
import VueRouter from 'vue-router'

import Root from '../vue/pages/Root.vue'
// Article
import ArticleShow from '../vue/pages/articles/Show.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Root },
    { path: '/article/p/:permalink', name: 'article/show', component: ArticleShow }
  ]
})
