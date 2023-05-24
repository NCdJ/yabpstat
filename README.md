
<!-- README.md is generated from README.Rmd. Please edit that file -->

# yabpstat

### YABPstat: Yet Another BPstat

| Versão em Português                                                                                                                                                                                                                                                   | English version                                                                                                                                                                                                                    |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Este package foi desenvolvido no decorrer da UC Projeto Final em Ciência de Dados, 3.º ano, Licenciatura em Ciência de Dados, pelo Iscte-IUL. Tivemos como coordenador da UC o Professor Doutor José Gonçalves Dias, e a orientação do Professor Doutor Jorge Sinval. | This package was developed during the UC Final Project in Data Science, 3rd year, Degree in Data Science, by Iscte-IUL. We had Professor José Gonçalves Dias as coordinator of the UC, and the guidance of Professor Jorge Sinval. |
| A equipa que o desenvolveu é constituída por:                                                                                                                                                                                                                         | The team that developed it consists of:                                                                                                                                                                                            |

- Henrique Luís (halsa\[at\]iscte.iul) <br>
- Maria Ribeiro (mcroo2\[at\]iscte-iul.pt) <br>
- Nelson Jesus (nelson_carvalho_jesus\[at\]iscte-iul.pt) <br>
- Pedro Ferreira (pvfaa\[at\]iscte-iul.pt) <br>
- Telma Garção (telma_garcao\[at\]iscte-iul.pt\] \|

<!-- badges: start -->

[![R-CMD-check](https://github.com/NCdJ/yabpstat/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/NCdJ/yabpstat/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of YABPstat is to open to a more specialized public
(undergraduation students, data-journalists, teachers, investigators…)
the BPstat API to gather data from over 300 000 series.

## Installation

You can install the development version of yabpstat from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("NCdJ/yabpstat")
```

## Documentation

Full documentation website on: <https://NCdJ.github.io/yabpstat>

``` r
library(yabpstat)
## basic example code
```

## Examples

1.  Using YABPstat «*ya_search*» to get results for the query for “ihpc”
    (*Harmonised index of consumer prices*), and returning the results
    in portuguese language.

``` r
## using search
ya_search(query = "ihpc", lang = "PT")
```

2.  Using YABPstat «*ya_info_serie()*» to plot a serie from BPstat in
    english language.

``` r
## using info serie for plotting 
ya_info_serie(series_id = 12561507, operation = "P", lang = "EN")
```

3.  Using YABPstat «*ya_info_serie()*» to view the data from a BPstat
    serie in a table format in english language.

``` r
## using info serie for plotting 
ya_info_serie(series_id = 12561507, operation = "T", lang = "EN")
```

4.  Using YABPstat «*ya_info_serie()*» to use the data from a BPstat
    serie in a dataframe format for use in further analysis and reuse.

``` r
## using info serie as a dataframe for reuse
ya_info_serie(series_id = 12561507, operation = "Df")
```

## Branding

<img style = "float: left; margin: 2px 20px 10px 0; ; " src="https://raw.githubusercontent.com/NCdJ/yabpstat_poster/main/YABPstat_hex.png"  alt="YABPstat hex branding" width="200" height="200"  />
