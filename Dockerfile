FROM foliant/foliant:pandoc

RUN wget https://github.com/jgm/pandoc/releases/download/2.14.2/pandoc-2.14.2-1-amd64.deb -O pandoc.deb && \
    dpkg -i pandoc.deb && \
    rm pandoc.deb

COPY requirements.txt .

RUN pip3 install -r requirements.txt
