SDGsR
================

An R package for interacting with the UN Sustainable Development Goals
API (<https://unstats.un.org/SDGAPI/swagger/>), inspired by
<https://rpubs.com/angelamhkim/sdgapi>.

To install this package please use:

devtools::install\_github(“DrMattG/SDGsR”, dependencies = TRUE)

## Example

``` r
library(SDGsR)
require(tidyverse)
Goals<-get_SDGs_goals()
Goals %>% select(goal, code, description ) %>% 
  sample_n(.,3) %>% #randomly select three rows to display
  kableExtra::kable()
```

<table>

<thead>

<tr>

<th style="text-align:left;">

goal

</th>

<th style="text-align:left;">

code

</th>

<th style="text-align:left;">

description

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

5

</td>

<td style="text-align:left;">

5.5

</td>

<td style="text-align:left;">

Ensure women’s full and effective participation and equal opportunities
for leadership at all levels of decision-making in political, economic
and public life

</td>

</tr>

<tr>

<td style="text-align:left;">

4

</td>

<td style="text-align:left;">

4.1

</td>

<td style="text-align:left;">

By 2030, ensure that all girls and boys complete free, equitable and
quality primary and secondary education leading to relevant and
effective learning outcomes

</td>

</tr>

<tr>

<td style="text-align:left;">

6

</td>

<td style="text-align:left;">

6.a

</td>

<td style="text-align:left;">

By 2030, expand international cooperation and capacity-building support
to developing countries in water- and sanitation-related activities and
programmes, including water harvesting, desalination, water efficiency,
wastewater treatment, recycling and reuse technologies

</td>

</tr>

</tbody>

</table>

## Citation

``` r
citation("SDGsR")
```

    ## Warning in citation("SDGsR"): no date field in DESCRIPTION file of package
    ## 'SDGsR'

    ## Warning in citation("SDGsR"): could not determine year for 'SDGsR' from package
    ## DESCRIPTION file

    ## 
    ## To cite package 'SDGsR' in publications use:
    ## 
    ##   Matt Grainger (NA). SDGsR: Interface with the UN SDGs API to get data
    ##   about the Sustainable Development Goals. R package version
    ##   0.0.0.9000. https://drmattg.github.io/SDGsR/
    ## 
    ## A BibTeX entry for LaTeX users is
    ## 
    ##   @Manual{,
    ##     title = {SDGsR: Interface with the UN SDGs API to get data about the Sustainable Development Goals},
    ##     author = {Matt Grainger},
    ##     note = {R package version 0.0.0.9000},
    ##     url = {https://drmattg.github.io/SDGsR/},
    ##   }
