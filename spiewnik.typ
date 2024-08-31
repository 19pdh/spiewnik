#set page(
  paper: "a6",
  margin: (inside: 14mm, outside: 6mm, bottom: 10mm, top: 10mm), 
  footer: [
  #line(length: 100%, stroke: 0.5pt)
  #v(-0.3cm)
  #align(center)[
    #counter(page).display("1")
  ]
  ]
)

#set par(justify: true)
#set text(font: "Nimbus Roman", lang: "pl", size: 11pt)
#show heading.where(level: 1): it => {
  text(size: 12pt)[#upper(it)]
}
#align(center + horizon)[
#text(size: 2em, weight: "bold")[
  *ŚPIEWNIK*
]

żeby śpiewali

]

//19 Poznański Szczep ZHR "Barć"

#pagebreak(to: "even")

#text(size: 1.3em)[
  *Druhno! Druhu!*
]

W twoich rękach leży śpiewnik. Stworzyliśmy go, aby przy wspólnym śpiewie milej spędzać czas przy ognisku. Ale jest też drugi cel tego śpiewnika. Podczas ognisk (i nie tylko) będziesz mógł rozwijać swoje umiejętności artystyczne. Tak jak nie da się przeżyć życia tylko patrząc, tak nie można uczestniczyć w ognisku bez śpiewania. 

Dlatego dajemy Ci wyzwanie: Ogniskowa Korona. Ten kto ją zdobędzie, ten tylko zazna pełnii magii harcerskiego ogniska.

#align(center)[
  #image("sprawnosci.svg", width: 90%)

*POWODZENIA!*
]

#include "piosenki/index.typ"
#pagebreak(weak: true)

*Notatki*
#for i in range(2) [#pagebreak()]

#align(center)[
  *SPIS TREŚCI*
]
#show outline.entry: it => {
  upper(it)
}
#outline(title: none)