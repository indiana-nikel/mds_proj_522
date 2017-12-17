FROM rocker/tidyverse

RUN apt-get unzip

RUN Rscript -e "install.packages('ezknitr', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('tidyverse', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('cowplot', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('maps', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('countrycode', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('forcats', repos='http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('packrat', repos='http://cran.us.r-project.org')"
