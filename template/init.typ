#import "/template/utils.typ": page-setting, body-setting
#import "@preview/cjk-unbreak:0.2.1": remove-cjk-break-space

#let has-initialized-state = state("has-initialized-state", false)

#let initialize(body) = {
  context if not has-initialized-state.get() {

    show: remove-cjk-break-space
    show: page-setting
    show: body-setting

    body

  } else {
    body
  }

  has-initialized-state.update(true)
}
