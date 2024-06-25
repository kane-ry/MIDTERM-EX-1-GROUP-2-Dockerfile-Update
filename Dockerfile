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
    SQLAlchemy==2.0.31 \  
    psycopg2==2.9.9 \ 
    dask[complete]==2024.6.2 \
    graphviz==0.20.3 \ 
    dask-ml==2024.4.4 \ 
    plotly==5.22.0 \ 
    numpy==2.0.0 \
    pandas==2.2.2 \
    seaborn==0.13.2 \ 
    jupyter==1.0.0 \  
    scikit-learn==1.5.0 \ 
    statsmodels==0.14.2 \
    matplotlib==3.9.0 \
    ISLP==0.4.0 \
    torch==2.3.1 \
    torchmetrics==1.4.0.post0 \
    torchinfo==1.8.0 \
    pytorch-lightning==2.3.0 \
    torchvision==0.18.1 \ 
    glob==10.4.2 \
    json==2.7.2 \
   
WORKDIR /home/notebooks/

CMD jupyter notebook --no-browser --allow-root --ip 0.0.0.0
