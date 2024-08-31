/*#let lista_piosenek = (
  "1-juz-rozpalilo-sie-ognisko.txt",
  "2-plonie-ognisko-i-szumia-knieje.txt",
  "3-wspominajka.txt",
  "4-wiklina.txt",
  "ballada-o-harcerzu.txt",
  //"ballada-o-krzyzowcu.txt",
  "bez-slow.txt",
  "bieszczadzkie-anioly.txt",
  "bieszczadzki-trakt.txt",
  "bitwa.txt",
  "bolero.txt",
  "czuwajcie.txt",
  "dalej-wesolo.txt",
  "dlaczego-ja-tu-wracam-znow.txt",
  "droga-do-rio.txt",
  "dywizjon-303.txt",
  "dziewczyna-rumiankowa.txt",
  "dzis-pozno-pojde-spac.txt",
  "harcerskie-idealy.txt",
  "hej-przyjaciele.txt",
  "hej-w-gory.txt",
  "hiszpanskie-dziewczyny.txt",
  "imperatyw.txt",
  "jesien-idzie.txt",
  "jesien.txt",
  "juz-lipa-roztula.txt",
  "kantyczka-z-lotu-ptaka.txt",
  "kaszubskie-noce.txt",
  "kolor-zielony.txt",
  "komendant.txt",
  "lemata.txt",
  "lipka.txt",
  "majster-bieda.txt",
  "maly-oboz.txt",
  "niemanie.txt",
  "niepozegnanie.txt",
  "ostatnia-kula.txt",
  "piesn-wielorybnikow.txt",
  "szara-lilijka.txt",
  "tak-jak-ptaki.txt",
  "trudny-czas.txt",
  "wedrowanie.txt",
  "wedrowiec.txt",
  "we-wtorek-w-schronisku.txt",
  "wigwam.txt",
  //"w-naszym-niebie.txt",
  "zbroja.txt",
  "z-deszczu-slow-kaluze-dzwiekow.txt",
  "zielony-mundur.txt",
  "zielony-plomien.txt",
  "zostanie-tyle-gor.txt",
)

#let stick-together(a, b, threshold: 3em) = {
  block(a + v(threshold), breakable: false)
  v(-1 * threshold)
  b
}

#for (nr_piosenki, piosenka) in lista_piosenek.enumerate() {
  let tekst = read(piosenka).split("\n\n").map(it =>
    it.trim(regex("[\n]"))).filter(it =>
    it != "")
  let head = tekst.remove(0).split("\n")
  let header = block[
  = #head.at(0)
  #if head.len() > 1 {
    text(size: 0.9em)[#head.at(1)]
    v(2pt)
  } else {
    v(0.5cm)
  }
  ]
  stick-together(
    threshold: 10em,
    header, 
    []//block(breakable: false)[#tekst.remove(0)]
  )

//
  let chords_list = ()
  let chords_map = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

  for (nr_wersu, wers) in tekst.enumerate() {
    let wers_chords = ""
    for par in wers.split("\n") {
        let podzielony = par.split("| ")
        let chords = if podzielony.len() > 1 {
          podzielony.at(1)
        } else { "" }
        wers_chords += chords
    }
    if wers_chords == "" { continue }
    if wers_chords in chords_list {

    } else {
      chords_list.push(wers_chords)
      chords_map.insert(nr_wersu, chords_list.len()-1)
    }
  }
//

  for wers in tekst {
    block()[
      #for par in wers.split("\n") {
        let podzielony = par.split("| ")
        let chords = if podzielony.len() > 1 {
          podzielony.at(1)
        } else { "" }
        podzielony.first()
        if chords != "" [
          #h(1em)
          #chords
        ]
        v(-7pt)
      }
      #v(1em)
    ]
  }
  parbreak()
  v(0.5em)
}
*/

#let piosenki = (
  json("a-my-nie-chcemy-uciekac-stad.json"),
  json("czuwajcie.json"),
  json("zwiewnosc.json"),
  json("zrodlo.json"),
)

#let show_chords(chords_label, chords) = context { 
  let show_chords = true
  let here_i_am = here()
  let found_chords = query(selector(chords_label).before(here_i_am))
  if found_chords.len() > 0 {
    let refren_page = found_chords.last().location().page()
    let on_the_same_page = refren_page == here_i_am.page()
    let on_adjacent_page = (refren_page+1 == here_i_am.page() and calc.even(refren_page) )
    show_chords = not (on_the_same_page or on_adjacent_page)

  }
  if show_chords {
    return block[
      #chords
      #chords_label
    ]
  }
}

#let show_verse(verse_label, verse, chords) = {
  grid(
    columns: 2,
    gutter: 10pt,
    block[#verse],
    show_chords(verse_label, chords)
  )
}

#for (nr_piosenki, piosenka) in piosenki.enumerate() [

#context [
  #if here().position().y > 300pt {
    pagebreak(weak: true)
  }
  = #piosenka.title
]

#if piosenka.text_authors.len() > 0 [
  #text(size: 0.8em)[sł.: #piosenka.text_authors.first()]
] else [
  #text(size: 0.8em)[autor nieznany]
]

#let chords_list = ()

#for (key, part) in piosenka.parts.enumerate() {
  if "refren" in part {
    part = piosenka.refren
  }

  let verse_text = part.text
  let verse_chords = part.chords
  
  if verse_chords not in chords_list {
    chords_list.push(verse_chords)
  }
  let idx = chords_list.find(ch => ch == verse_chords)
  let lbl = label(str(nr_piosenki)+"-"+str(idx))

  show_verse(lbl, verse_text, verse_chords)
}
]