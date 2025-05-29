#import "/template/utils.typ": page-setting, body-setting
#import "/template/toc.typ": toc
#import "/template/cover.typ": cover
#import "/template/backcover.typ": backcover
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space
#import "@preview/codly:1.3.0": codly-init

#let date-format = "[year]年[month repr:numerical padding:none]月[day padding:none]日"

#let project(
  title: "",
  author: "筑波大学情報学群 情報科学類 WORD編集部",
  publisher: "情報科学類長",
  editor-chief: "情報太郎",
  editions: ((date: datetime.today(), circulation: 128),),
  keywords: (),
  body,
) = {
  set document(
    title: title,
    author: author,
    date: editions.last().date,
    keywords: keywords,
  )

  show: remove-cjk-break-space
  show: page-setting
  show: body-setting
  show: codly-init.with()

  cover()
  toc()

  counter(page).update(1)
  body

  backcover(
    title: title,
    publisher: publisher,
    editor-chief: editor-chief,
    editions: editions,
  )
}
