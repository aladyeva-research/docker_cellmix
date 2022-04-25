FROM koetjen/rstudio:4.0.3

RUN  apt-get -y update && apt-get -y upgrade #&& apt-get -y install libbz2-dev liblzma-dev

RUN R -e "install.packages(c('BiocManager', 'remotes', 'devtools', 'data.table', 'plotly', 'DT', 'waiter'), dependencies = T)"
RUN R -e "BiocManager::install(pkgs = c('Biobase'))"


RUN R -e "install.packages(c('parallel', 'gtools', 'pdist', 'enrichR', 'pheatmap', 'limSolve', 'corpcor', 'beeswarm', 'bibtex', 'nFactors', 'cowplot', 'matrixStats'), dependencies = T)"
RUN R -e "install.packages(c('ica', 'fastICA', 'NMF', 'csSAM'))"
RUN R -e "install.packages(pkgs = 'http://bioconductor.org/packages/3.7/bioc/src/contrib/BiocInstaller_1.30.0.tar.gz', type = 'source')"
RUN wget http://web.cbio.uct.ac.za/~renaud/CRAN/src/contrib/CellMix_1.6.2.tar.gz && Rscript -e "install.packages(pkgs = 'CellMix_1.6.2.tar.gz', repos = NULL, type = 'source')"