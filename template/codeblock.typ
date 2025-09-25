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
  body
}
