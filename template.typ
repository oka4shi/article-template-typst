#let fonts = (
  header: ("Noto Serif", "Noto Serif CJK JP"),
  heading: ("Noto Serif", "Noto Sans CJK JP"),
  main: ("Noto Serif", "Noto Serif CJK JP")
)

#let project(
  title: "",
  subtitle: "",
  body
) = {

  set document(author: ("筑波大学情報学群 情報科学類 WORD 編集部"), title: title)

  set page(
    paper: "jis-b5",
    margin: auto,
    binding: auto,
    header: context {
      set text(font: fonts.header, weight: "medium", lang: "ja")

      let current-chapter = query(heading.where(level: 1)).filter(it => it.location().page() <= here().page()).at(-1, default: none)

      if current-chapter != none {
        block(
          width: 100%,
          stroke: (
            bottom: (thickness: 0.5pt),
          )
        )[
          #if calc.even(here().page()) {
            align(left)[
              #current-chapter.body
            ]
          } else {
            align(right)[
              #current-chapter.body
            ]
          }
        ]
      }
    }
  )

  set text(
    font: fonts.main,
    lang: "ja"
  )

  show heading: set text(font: fonts.heading, weight: "medium", lang: "ja")
  show heading.where(level: 1): it => {
    pagebreak()
    v(20pt)
    block(
      width: 100%,
      inset: 24pt,
      fill: luma(240),
      radius: 4pt,
    )[
      #text(size: 20pt)[#it.body]
    ]
  }

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

#let author(name) = [
  #metadata(name) <author>
  #text[文 編集部 #name]
]

