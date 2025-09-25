#import "/template/utils.typ": page-setting, body-setting
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space
#import "@preview/codly:1.3.0": codly-init

#let has-initialized-state = state("has-initialized-state", false)

#let initialize(body) = {
  context if not has-initialized-state.get() {

    show: remove-cjk-break-space
    show: page-setting
    show: body-setting
    show: codly-init

    body

  } else {
    body
  }

  has-initialized-state.update(true)
}
