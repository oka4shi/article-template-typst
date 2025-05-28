#let backcover() = {
  set page(
    header: none,
    footer: none
  )
  set par(first-line-indent: (amount: 0pt, all: false))

  text(
    size: 19pt,
  )[情報科学類誌]
  image(
    width: 100%,
    "assets/wordlogo.svg"
  )

  place(
    center + horizon,
    box(
      text(size: 25pt)[WORD xxx号]
    )
  )

  place(
    center + bottom,
    box(
      width: 100%,
      stroke: 0.5pt + black,
      inset: 10pt,
      grid(
        align: left,
        columns: (auto, 1fr),
        rows: auto,
        column-gutter: 20pt,
        row-gutter: 10pt,
        [発行者],
        [情報科学類長],
        [編集長],
        [情報太郎],
        [],
        [筑波大学情報学群],
        [],
        [情報科学類 WORD 編集部],
        [制作・編集],
        [(第三エリアC棟212号室)],
        [20xx年xx月xx日],
        [初版第1刷発行 #h(1fr) (256部)],
      )
    )
  )
}
