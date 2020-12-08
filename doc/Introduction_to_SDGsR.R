## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=8,
  collapse = TRUE,
  comment = "#>"
)

## ---- echo=TRUE, message=FALSE, warning=FALSE---------------------------------
library(SDGsR)
Goals<-get_SDGs_goals()
Goals %>% select(goal, code, description ) %>% 
  sample_n(.,3) %>% #randomly select three rows to display
  kableExtra::kable()


## ---- echo=TRUE---------------------------------------------------------------

head(get_country_list())


## ---- echo=TRUE---------------------------------------------------------------
ind_lst<-get_indicator_list()

ind_lst %>% 
  filter(goal=="15") %>% 
  select(target, code, description) %>% 
  kableExtra::kable()
  

## ---- echo=TRUE---------------------------------------------------------------
Norway_code<-lookup_country(code="M49", country = "Norway")
Norway_code

## ---- echo=TRUE---------------------------------------------------------------
Norway<-get_indicator(Country = Norway_code, indicator = "15.4.1")


## ---- echo=TRUE---------------------------------------------------------------

p1<-Norway %>% 
  select(timePeriodStart,value,seriesDescription) %>% 
  ggplot(aes(timePeriodStart, as.numeric(value)))+
  geom_point(colour=SDGs_cols("Goal15"))+
  labs(x="Year", y="% Mountain Area Protected")+
  ggtitle(label=paste0(Norway$seriesDescription[1])) +
  ggpubr::theme_pubclean()+
  theme(plot.title = element_text(size = 12))


## -----------------------------------------------------------------------------
p1

