#import "/template/init.typ": initialize
#import "/template/codeblock.typ": init-codeblock

#let author-block(name, authormark) = [
  #metadata(name) <author>
  #align(
    right,
    pad(
      top: 1.0em,
      bottom: 1.75em,
      text(size: 10.5pt)[
        #authormark#name
      ],
    ),
  )
]

#let article(
  title: "",
  author: "",
  author-mark: [文#h(1em)編集部#h(1em)],
  body,
) = {
  show: initialize

  show: init-codeblock

  heading(level: 1, title)
  author-block(author, author-mark)

  set heading(offset: 1)

  counter(footnote).update(0)
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)

  body
}
