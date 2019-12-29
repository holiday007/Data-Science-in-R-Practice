packs = c()

new.pkg <- packs[!(packs %in% installed.packages())]

if (length(new.pkg)) { 
  # as long as it is not if (0), it is treated as a true condition
  install.packages(new.pkg, repos = "http://cran.rstudio.com")
}