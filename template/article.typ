#import "/template/utils.typ": page-setting, body-setting
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space
#import "@preview/codly:1.3.0": codly-init, codly
// #import "@preview/codelst:2.0.2": sourcecode

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
  show: codly-init.with()

  codly(
    zebra-fill: none,
    fill: luma(95%),
    // stroke: 1pt + luma(80%),
    display-name: false,
    inset: 0.3em,
    number-placement: "outside",
  )

  heading(level: 1, title)
  author-block(author, author-mark)

  set heading(offset: 1)

  body
}
