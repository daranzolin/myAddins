# myAddins
This repo is just a working collection of some RStudio Addins and gadgets that mesh with some of my idiosyncracies. When writing a list of strings, for example, I weary of capturing every string between `""`. Thus, `makeStringsGadget()` allows me to type without this irritating hassle. Some may call it lazy, and I don't really have a response to that.

I also have a habit of debugging by inserting `%>% View()` amidst various `dplyr` and `tidyr` chains. Now it's a hot key.

# Installation
```
devtools::install_github("daranzolin/myAddins")
library(myAddins)
```
