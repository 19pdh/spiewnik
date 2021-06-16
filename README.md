# spiewnik

## Render

Zainstaluj neatroff i pdfbook2

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
