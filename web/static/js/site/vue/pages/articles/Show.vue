<template lang="pug">
  article.article
    h1.page-title Phoenixはじめました
    section.article-body(v-html="md2html(article.body)")
</template>

<script>
export default {
  computed: {
    article() {
      return {
        title: 'Phoenixはじめました',
        // TODO: Remove marked.js
        body: `## Elixirのインストール
\`\`\`sh
brew install erlang

brew install exenv
brew install elixir-build

echo 'export PATH="$HOME/.exenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(exenv init -)"' >> ~/.zshenv
exec zsh -l

exenv install -l
exenv install 1.2.5
exenv global 1.2.5

# check
elixir -v
mix -v
\`\`\`

## Phoenixのインストール

\`\`\`sh
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
\`\`\`

## Phoenixプロジェクトの作成

\`\`\`sh
mix phoenix.new your_app
\`\`\`
`
      }
    }
  },
  methods: {
    md2html: (arg) => window.marked(arg) // TODO: Remove marked.js
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
