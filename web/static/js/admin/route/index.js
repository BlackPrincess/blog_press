import Vue from 'vue'
import VueRouter from 'vue-router'

import Index from '../vue/pages/Index.vue'

import TaxonomyIndex from '../vue/pages/taxonomies/Index.vue'
import TaxonomyNew from '../vue/pages/taxonomies/New.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  base: 'admin',
  routes: [
    { path: '/', component: Index },
    { path: '/taxonomies', name: 'taxonomies/index', component: TaxonomyIndex },
    { path: '/taxonomies/new', name: 'taxonomies/new', component: TaxonomyNew }
  ]
})
