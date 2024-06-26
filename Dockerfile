FROM python:3.11.7-slim
LABEL maintainer="Scott A. Bruce <sabruce@tamu.edu>"
LABEL version="1.2"
LABEL description="Python Jupyter notebook development environment"

RUN apt-get update -y
RUN apt-get install -y gcc
RUN apt-get install -y build-essential libpq-dev
RUN apt-get install -y graphviz

RUN pip install --upgrade pip

# Installing packages 
RUN pip install \
    SQLAlchemy==2.0.25 \  
    psycopg2==2.9.9 \ 
    dask[complete]==2024.1.1 \  
    graphviz==0.20.1 \ 
    dask-ml==2023.3.24 \ 
    plotly==5.18.0 \ 
    numpy==1.24.4 \
    pandas==1.5.3 \
    seaborn==0.13.2 \ 
    jupyter==1.0.0 \  
    scikit-learn==1.4.0 \ 
    statsmodels==0.14.1 \
    matplotlib==3.8.3 \
    ISLP==0.3.22 \
    torch==2.2.0 \
    torchmetrics==1.3.1 \
    torchinfo==1.8.0 \
    pytorch-lightning==2.2.0.post0 \
    torchvision==0.17.0 \
    glob2==0.7 \
    json==2.7.2
   
WORKDIR /home/notebooks/

CMD jupyter notebook --no-browser --allow-root --ip 0.0.0.0
