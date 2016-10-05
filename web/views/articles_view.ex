defmodule BlogPress.ArticlesView do
  use BlogPress.Web, :view

  def render("first.json", _assigns) do
    body = """
    ## Elixirのインストール
    ```sh
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
    ```

    ## Phoenixのインストール

    ```sh
    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
    ```

    ## Phoenixプロジェクトの作成

    ```sh
    mix phoenix.new your_app
    ```
    """
    title = "Phoenixはじめました"
    render_json(title, body)
  end

  def render_json(title, body) do
    %{
      title: title,
      body: body,
      published_at: "2016-10-04 11:22:33",
      tags: [
        %{name: "Elixir"},
        %{name: "Phoenix"}
      ],
      taxon: %{
        name: "ポエム"
      }
    }
  end
end
