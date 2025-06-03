#import "/template/article.typ": article
#import "@preview/cmarker:0.1.5"
#import "@preview/mitex:0.2.5": mitex

#show: article.with(
  title: "記事を執筆しよう",
  author: "情報 太郎",
)

#cmarker.render(
  read("main.md"),
  math: mitex,
  scope: (
    image: (path, alt: none, ..args) => figure(
      image(path, alt: alt, ..args),
      caption: alt,
    ),
  ),
)
