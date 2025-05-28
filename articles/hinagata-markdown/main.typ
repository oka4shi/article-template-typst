#import "/template/article.typ": article
#import "@preview/cmarker:0.1.5"

#show: article.with(
  title: "記事を執筆しよう",
  author: "情報 太郎"
)

#cmarker.render(read("main.md"))
