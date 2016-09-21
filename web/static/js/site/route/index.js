import Vue from 'vue'
import VueRouter from 'vue-router'

import Root from '../vue/pages/Root.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Root }
  ]
})
