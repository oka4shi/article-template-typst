#import "/template/article.typ": author

#let ovalbox = body => [
  #h(0.2em)
  #box(stroke: 0.5pt + black, outset: 0.35em, radius: 0.3em, body)
  #h(0.2em)
]

= 記事を執筆しよう

#author("情報 太郎")

// #set heading(offset: 1)

== 環境を準備する

WORDの記事をコンパイルするにあたって、Typst といった
Typst のツールセットが必要です。

- Git #footnote[https://git-scm.com/]
- TeX Live または #footnote[https://www.tug.org/texlive/] Mac TeX #footnote[http://www.tug.org/mactex/]
- Typst #footnote[https://typst.app/]
- GNU Make #footnote[https://www.gnu.org/software/make/]

記事をコンパイルするため、記事のGitリポジトリのルートで次のコマンドを実行します。

```
$ git submodule update --init
$ make
```

== コンパイルする <compile>

#ovalbox[main.pdf] が作成されれば成功です。
ただし、`git submodule update --init`は最初のみ必要で、
その後は`make`のみでよいです。

== 記事を追加する

まず、#ovalbox[./articles/hinagata]というディレクトリをコピーして任意の名前で
#ovalbox[articles]ディレクトリへ置きます。
そして、Gitのリポジトリルートにある#ovalbox[main.tex]を開きます。

```typc
// TODO
```

このようになっていると思いますので、この「記事（サンプル）」と「裏表紙」という
コメントの間に次のような書き込みをしましょう。

```
// TODO
```
