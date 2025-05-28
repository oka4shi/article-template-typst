#let article() = {}

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
