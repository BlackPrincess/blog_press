<template lang="pug">
  .app
    header.header
      h1.site-title 
        .header-brand
          img(src="/images/phoenix.png" width=728 height=99)
    .wrapper
      .main
        router-view
      nav.sidebar
        h3.sidebar-heading Taxons
        ul.siderbar-menu(v-for="menu in sidemenus")
          li
            a.sidebar-link(href='#' v-text="menu.name")
    footer.footer
      | footer
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  computed: mapGetters(['sidemenus'])
}
</script>

<style lang="scss">
$header-height: 99px;
$footer-height: 300px;

.header {
  height: $header-height;
  background-color: #000;
  color: #fff;
}

.wrapper {
  $sidebar-min-width: 200px;
  $main-pad: 20px;
  $sidebar-pad: 20px;
  background-color: #f9f9f9;
  
  display: flex;
  align-items: stretch;
  
  .main {
    order: 1;
    flex: 1 0 $sidebar-min-width - $main-pad * 2;
    padding: $main-pad;
    box-shadow: 1px 0 5px 1px rgba(0, 0, 0, 0.3);
    background-color: #fff;
  }
  
  .sidebar {
    order: 2;
    flex: 0 0 $sidebar-min-width;
    min-height: 100vh;
    padding: $sidebar-pad;
  }
  
  .sidebar-heading {
    font-size: 3.2rem;
    font-weight: normal;
  }
  
  .siderbar-menu {
    margin-left: 2rem;
  }
  
  .sidebar-link {
    display: inline-block;
    padding: 10px 0;
    font-size: 1.6rem;
    text-decoration: none;
    cursor: pointer;
    
    transition-property: opacity;
    transition-duration: 200ms;
    &:hover {
      opacity: 0.6;
    }
  }
}

.footer {
  min-height: $footer-height;
  background-color: #020021;
  color: #fff;
}
</style>
