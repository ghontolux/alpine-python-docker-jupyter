FROM python:3.9-alpine

# docker run --platform linux/amd64 -p 8888:8888  -v /path/to/notebooks/notebooks:/opt/notebook <container_name>

ENV NOTEBOOK_TOKEN='dont_use_me!'
COPY requirements.txt /requirements.txt


RUN apk update && apk add --no-cache gcc musl musl-dev libffi libffi-dev libpq && \
 pip install -r /requirements.txt \
 && mkdir -p /opt/notebook

EXPOSE 8888
WORKDIR /opt/notebook

CMD jupyter notebook --ip=0.0.0.0 --port=8888 --NotebookApp.token=${NOTEBOOK_TOKEN} --no-browser --allow-root