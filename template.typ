#let fonts = (
  header: ("Noto Serif", "Noto Serif CJK JP"),
  heading: ("Times New Roman", "Noto Serif", "Noto Sans CJK JP"),
  main: ("Times New Roman", "Noto Serif", "Noto Serif CJK JP")
)

#let project(
  title: "",
  subtitle: "",
  body
) = {

  set document(
    author: ("筑波大学情報学群 情報科学類 WORD編集部"),
    title: title,
  )

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
          #align(
            if calc.even(here().page()) { left } else {right}
          )[
            #box(inset: (y: 30%))[
              #current-chapter.body
            ]
          ]
        ]
      }
    }
  )

  set text(
    font: fonts.main,
    lang: "ja",
    size: 9pt,
  )

  set par(
    leading: 1em,
    justify: true,
    linebreaks: auto,
    first-line-indent: 1em,
  )
  
  // 最初の段落が字下げされない問題を修正
  // https://github.com/typst/typst/issues/311 が修正されるまではこれで対応
  show selector(heading).or(figure): it => {
    it
    // 空の段落を入れる
    par(text(size: 0pt, ""))
    v(-1em)
  }

  set heading(numbering: (..nums) => {
    if nums.pos().len() > 1 {
      nums.pos().slice(1).map(str).join(".") + " "
    }
  })

  show heading: set text(font: fonts.heading, weight: "bold", lang: "ja")
  show heading: it => {
    show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(size: 0.9em, weight: "medium")
    it
  }

  show heading.where(level: 1): it => {
    pagebreak()
    v(10pt)
    align(center)[
      #text(size: 17pt, it)
    ]
    v(10pt)
  }
  show heading.where(level: 2): it => {
      v(0.5em)
      text(size: 13pt, it)
      v(0.4em)
  }

  set list(indent: 2em)
  show list: it => {
    v(1em)
    it
    v(1em)
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

#let author(name, authormark: [文#h(1em)編集部#h(1em)]) = [
  #metadata(name) <author>
  #align(right)[
    #block[
      #v(2em)
      #text[
        #authormark#name
      ]
      #v(1em)
    ]
  ]
]

