#let toc() = context {
  set page(
    header: none,
    footer: none,
    margin: (x: 25mm, top: 24mm, bottom: 18mm),
  )
  heading(level: 2, numbering: none, [目次])
  v(1pt)

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

  pagebreak(weak: true)
}
