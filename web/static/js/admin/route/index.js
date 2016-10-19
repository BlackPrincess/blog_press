import Vue from 'vue'
import VueRouter from 'vue-router'

import Index from '../vue/pages/Index.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/admin', component: Index }
  ]
})
