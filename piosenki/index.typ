#let lista_piosenek = (
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

#for piosenka in lista_piosenek {
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