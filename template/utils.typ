#let fonts = (
  header: ("Noto Serif", "Noto Serif CJK JP"),
  heading: ("Times New Roman", "Noto Serif", "Noto Sans CJK JP"),
  body: ("Times New Roman", "Noto Serif", "Noto Serif CJK JP")
)

#let jp-pattern = "[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"

#let pageno = (page-numbering, display-page, actucal-page) => {
  if (page-numbering == none) {
    none
  } else {
    align(
      if calc.odd(actucal-page) { right } else { left },
      text(
        8pt,
        number-type: "old-style",
        numbering(page-numbering, display-page)
      ),
    )
  }
}

#let page-setting(rest) = {
  set page(
    paper: "jis-b5",
    margin: (x: 25mm, top: 29mm, bottom: 15mm),
    binding: auto,
    header: context {
      set par(first-line-indent: (amount: 0pt, all: false))
      set text(font: fonts.header, weight: "medium", lang: "ja")

      let current-chapter = query(heading.where(level: 1)).filter(it => it.location().page() <= here().page()).at(-1, default: none)

      if current-chapter != none {
        block(
          width: 100%,
          stroke: (
            bottom: (thickness: 0.5pt),
          ),
          align(
            if calc.even(here().page()) { left } else {right},
            box(
              inset: (y: 30%),
              text(current-chapter.body)
            )
          )
        )
      }
    },
    footer: context {
      pageno(here().page-numbering(), counter(page).get().at(0), here().page())
    }
  )
  
  rest
}

#let body-setting(rest) = {
  set text(
    font: fonts.body,
    lang: "ja",
    size: 9pt,
  )

  set par(
    leading: 1.1em,
    spacing: 1.1em,
    linebreaks: auto,
    first-line-indent: (
      amount: 1em,
      all: true,
    )
  )
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() > 1 {
        nums.pos().slice(1).map(str).join(".")
        h(0.55em)
      }
    },
  )

  show heading: set text(font: fonts.heading, weight: "bold", lang: "ja")
  show heading: it => {
    show regex(jp-pattern): set text(
      size: 0.9em,
      weight: "medium",
    )
    it
  }
  show heading.where(level: 1): it => {
    pagebreak()
    pad(
      top: 0.1em,
      bottom: 1em,
      align(
        center,
        text(size: 18pt, it)
      )
    )
  }
  show heading.where(level: 2): it => pad(y: 0.5em, text(size: 15pt, it))
  show heading.where(level: 3): it => pad(y: 0.5em, text(size: 12pt, it))

  set list(indent: 2em, spacing: 1.1em)
  show list: set block(spacing: 2em)
  
  rest
}
