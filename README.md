# spiewnik

## Render

Zainstaluj neatroff i pdfbook2 (Zobacz [#instalowanie](#instalowanie))

```sh
./bin/redo

./bin/redo print # Przygotowanie PDF w postaci broszury gotowej do druku

./bin/redo clean # Wyczyszczenie cache'u i PDFów
```

## Edytowanie

Główny plik `spiewnik.ms` - ustawienia strony, marginesów, czcionki i pierwszej strony
Wszystkie pliki `*.do` - opisują kroki do wykonania aby wyrenderować PDF
Piosenki w `piosenki/*.txt` - Pliki z tekstami piosenek

```
index.ms.do => spiewnik.ps.do => spiewnik.pdf.do => all.do - stworzenie PDF'a
                                      ||
                                      ++=> print.do - stworzenie PDF'a gotowego do druku

        clean.do - usunięcie cache'u
```

## Instalowanie

Jest opcja żeby zainstalowało wszystko automatycznie, ale jest to wolne i mało optymalne (jak wszystko co jest "automatyczne"). Ale robi się samo:

Ten skrypt stworzy plik ~/.config/nix/nix.conf i folder ~/.nix-portable gdzie będą przechowywane wszystkie potrzebne programy itp. - jak usuniesz to będzie trzeba na nowo pobrać

```sh
# Potrzebujesz `curl`, 1.3G wolnego miejsca i internet który to pobierze
./bin/install-all
```

Ten skrypt pobiera dużo rzeczy, które prawdopodobnie twój komputer gdzieś ma, ale każdy system jest inny, więc tak jest prościej i działa wszędzie. Jeśli potrzebujesz zaoszczędzić miejsca to postępuj według instrukcji swojej dystrybucji.
