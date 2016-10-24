<template lang="pug">
  article
    .page-header
      h1.page-title 記事一覧
      .page-controls
        router-link.btn.btn-new(:to="{name: 'articles/new'}") 追加
</template>

<script>
export default {
}
</script>
