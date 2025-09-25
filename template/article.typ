#import "/template/utils.typ": page-setting, body-setting
#import "/template/codeblock.typ": show-line-numbers, toggle-line-numbers, init-codeblock
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space

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
  show: remove-cjk-break-space
  show: page-setting
  show: body-setting
  show: init-codeblock

  show-line-numbers(true)

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
