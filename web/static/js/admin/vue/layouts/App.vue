<template lang="pug">
  .app
    header.header
      router-link.brand(to="/admin") 
        | Blog Press Admin
    .wrapper
      .main
        transition(name="slide")
          router-view.view
      nav.sidebar
        ul
          li
            router-link.sidebar-link(:to="{name: 'articles/new'}") 新規記事作成
          li
            a.sidebar-link(href='#') 記事一覧
          li
            router-link.sidebar-link(:to="{name: 'taxonomies/index'}") 分類管理
    footer.footer
      | footer
</template>

<script>
import { mapGetters } from 'vuex'
export default {}
</script>

<style lang="scss" scoped>
$sidebar-min-width: 200px;
$main-pad: 20px;
$sidebar-pad: 20px;

.header {
  height: 50px;
  background-color: #0a0b4a;
  
  .brand {
    font-size: 4rem;
    color: #fff;
    text-decoration: none;
  }
}

.wrapper {
  display: flex;
  align-items: stretch;
}

.main {
  order: 2;
  flex: 1 0 $sidebar-min-width - $main-pad * 2;
  padding: $main-pad;
}

.sidebar {
  order: 1;
  flex: 0 0 $sidebar-min-width;
  min-height: 100vh;
  padding: $sidebar-pad;
  box-shadow: 4px 0px 2px -2px rgba(0,0,0,0.3);
}
</style>
