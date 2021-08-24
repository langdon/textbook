FROM fedora-minimal

RUN microdnf install -y python3 pip ImageMagick make && \
    microdnf clean all

RUN pip install --no-cache-dir jupyter jupyter-book pyppeteer
RUN pyppeteer-install

RUN mkdir /data
WORKDIR /data

VOLUME /data
ENTRYPOINT [ "/usr/local/bin/jupyter-book"]