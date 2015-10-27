## Installing the gitbook

### http://jason.bryer.org/Rgitbook/index.html

library(devtools)

#devtools::install_github("jbryer/Rgitbook")


require(Rgitbook)
installGitbook()
checkForGitbook()

newGitbook("humanitaRian-data-science")

buildGitbook()

### publishGitbook("Edouard-Legoupil/humanitaRian-data-science")
## Not needed as the book is already in the gh-pages branch