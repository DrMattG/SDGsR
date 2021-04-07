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

13

</td>

<td style="text-align:left;">

13.1

</td>

<td style="text-align:left;">

Strengthen resilience and adaptive capacity to climate-related hazards
and natural disasters in all countries

</td>

</tr>

<tr>

<td style="text-align:left;">

13

</td>

<td style="text-align:left;">

13.b

</td>

<td style="text-align:left;">

Promote mechanisms for raising capacity for effective climate
change-related planning and management in least developed countries and
small island developing States, including focusing on women, youth and
local and marginalized communities

</td>

</tr>

<tr>

<td style="text-align:left;">

11

</td>

<td style="text-align:left;">

11.4

</td>

<td style="text-align:left;">

Strengthen efforts to protect and safeguard the world’s cultural and
natural heritage

</td>

</tr>

</tbody>

</table>

## Citation

``` r
citation("SDGsR")
```

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
