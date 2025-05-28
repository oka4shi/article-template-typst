#import "/template/utils.typ": page-setting, body-setting
#import "/template/toc.typ": toc
#import "/template/cover.typ": cover
#import "/template/backcover.typ": backcover
#import "@preview/cjk-unbreak:0.1.0": remove-cjk-break-space

#let date-format = "[year]年[month repr:numerical padding:none]月[day padding:none]日"

#let project(
  title: "",
  author: "筑波大学情報学群 情報科学類 WORD編集部",
  edition-dates: (datetime.today(),),
  keywords: (),
  body,
) = {
  set document(
    title: title,
    author: author.last(),
    date: edition-dates.last(),
    keywords: keywords,
  )

  show: remove-cjk-break-space
  show: page-setting
  show: body-setting

  cover()
  toc()

  counter(page).update(1)
  body

  backcover()
}
