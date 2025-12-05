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
    block(
      width: 100%,
      breakable: true,
      stroke: (paint: cmyk(0%, 0%, 0%, 75%), thickness: 0.3mm),
      inset: (x: 2.5mm, y: 2.5mm),
      outset: 0pt,
      above: 1.5em,
      below: 1.5em,
      radius: 1.5mm,
    )[ #it ]
  }

  body
}
