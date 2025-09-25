#let show-line-numbers-state = state("show-line-numbers", true)

#let show-line-numbers(flag) = {
  show-line-numbers-state.update(flag)
}

#let toggle-line-numbers() = {
  show-line-numbers-state.update(v => not v)
}

#let init-codeblock(
  body,
) = {
  show figure.where(kind: raw): set figure.caption(position: top)
  show figure.where(kind: raw): it => {
    set align(left + horizon)
    show figure.caption: set text(weight: "bold")
    it
  }

  context let show-numbers = show-line-numbers-state.get()

  show raw.where(block: true): it => {
    set par(
      leading: 0.9em,
      spacing: 0.9em,
      justify: false
    )

    grid(
      columns: (100%, 100%),
      column-gutter: -100%,
      block(
        width: 100%,
        inset: 1em,
        for (i, line) in it.text.split("\n").enumerate() {
          box(
            width: 0pt,
            align(right, str(i + 1) + h(2em))
          )
          hide(line)
          linebreak()
        }
      ),
      block(
        width: 100%,
        inset: 1em,
        it
      ),
    )
  }

  // show raw: set text(size: 1.1em)
  body
}
