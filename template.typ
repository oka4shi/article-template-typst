#import "/template/utils.typ": page-setting, body-setting
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space

#let project(
  title: "",
  subtitle: "",
  body,
) = {
  set document(
    author: "筑波大学情報学群 情報科学類 WORD編集部",
    title: title,
  )

  show: remove-cjk-break-space
  show: page-setting
  show: body-setting

  set list(indent: 2em, spacing: 1.1em)
  show list: set block(spacing: 2em)

  body
  pagebreak()
}

#let toc() = context {
  let elements = query(heading.where(level: 1, outlined: true))
  for el in elements {
    let metadatas = query(selector(<author>).after(el.location()))
    let author = metadatas.first().value
    link(el.location())[
      #block(width: 100%)[
        #el.body
        #box(width: 1fr, repeat[．])
        #text(style: "italic", author)
        #box(width: 2em, inset: (left: 1em))[
          #align(right)[
            #el.location().page()
          ]
        ]
      ]
    ]
  }
}

#let author(name, authormark: [文#h(1em)編集部#h(1em)]) = [
  #metadata(name) <author>
  #align(
    right,
    block[
      #v(1em)
      #text(size: 10.5pt)[
        #authormark#name
      ]
      #v(1.6em)
    ],
  )
]

