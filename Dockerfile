FROM jupyter/all-spark-notebook:137a295ff71b

RUN python --version

USER root

RUN conda install --quiet --yes -c conda-forge osmnx dask

# RUN conda install --yes --name root spacy pymongo

RUN ["bash", "-c", "source activate root"]

# RUN python -m spacy download en

USER jovyan

RUN pip install -U nltk \
                   twitter

ADD fonts /usr/share/fonts/truetype/

RUN fc-cache
RUN fc-list

RUN [ "python", "-c", "import nltk; nltk.download('all')" ]

VOLUME /notebooks
WORKDIR /notebooks
CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='demo'
