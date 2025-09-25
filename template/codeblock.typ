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
  show raw.where(block: true): it => {
    set par(
      leading: 0.9em,
      spacing: 0.9em,
      justify: false
    )

    show grid: set block(outset: (top: 0em, bottom: 0em), spacing: 0em)
    line(length: 100%, stroke: 0.5pt)
    grid(
      columns: (100%, 100%),
      column-gutter: -100%,
      block(
        width: 100%,
        inset: 1em,
        for (i, line) in it.text.trim("\n").split("\n").enumerate() {
          box(
            width: 0pt,
            align(right, text(0.95em, luma(40%), context if show-line-numbers-state.get() { str(i + 1) } else { "" } + h(2em)))
          )
          hide(line)
          linebreak()
        }
      ),
      block(
        width: 100%,
        inset: (y: 1em),
        it
      ),
    )
    line(length: 100%, stroke: 0.5pt)
  }

  body
}
