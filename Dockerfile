FROM jupyter/datascience-notebook:cfddc5a3163f

LABEL maintainer.name="Aaron Steven White" \
      maintainer.email="aaron.white@rochester.edu" \
      maintainer.website="http://aaronstevenwhite.io" \
      project.name="MegaAttitude" \
      project.website="http://megaattitude.io" \
      subproject.name="MegaAcceptability" \
      subproject.name="http://megaattitude.io/projects/mega-acceptability/" \
      image.website="https://github.com/MegaAttitude/frequency-acceptability-selection" \
      image.version="1.1" \
      image.modification_date="2020-09-02"

COPY --chown=1000:100 ./*.ipynb /home/jovyan/work/

VOLUME /home/jovyan/work/

RUN mkdir data && mkdir plots

RUN pip install timeout-decorator==0.4.0\
		tensorflow==1.4.1\
		torch==1.0.1\
		pytorch-pretrained-bert==0.6.2

RUN R -e "install.packages(c('tidyverse', 'reshape2', 'lme4', 'ggrepel'), repos='http://cran.us.r-project.org')"
