#import "/template/utils.typ": page-setting, body-setting
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space

#let date-format = "[year]年[month repr:numerical padding:none]月[day padding:none]日"

#let project(
  title: "",
  author: "筑波大学情報学群 情報科学類 WORD編集部",
  edition-dates: (datetime.today(),),
  keywords: (),
  body,
) = {
  set document(
    title: title,
    author: author.last(),
    date: edition-dates.last(),
    keywords: keywords,
)

  set page(
    paper: "jis-b5",
    margin: (x: 25mm, top: 29mm, bottom: 15mm),
    binding: auto,
  )

  show: remove-cjk-break-space
  show: page-setting
  show: body-setting

  body
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
