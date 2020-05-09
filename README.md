# csv2tmx

* `csv2tmx` is a converter from CSV file to TMX.

* `tmx2csv` is a converter from TMX file to CSV.

* These conversors are suitable for parallel corpora editors (e.g. OmegaT), translation tools, bilingual dictionary contruction (e.g., [alignment2dict](https://github.com/gamallo/alignment2dict)).

## Requeriments:
 * Bash and Perl

## The CSV file
The input CSV file can be a sentence aligned corpus in two languages. It must contain, at least, two columns: one with the sentences in the source language and the other with the aligned sentences in the target language.

## How to use:

```cat input.csv  | ./csv2tmx.perl  en  pt```

The script `csv2tmx.perl` takes the source and target language names as arguments.

The reverse conversion:

```cat input.tmx  | ./tmx2csv.perl  en  pt```

