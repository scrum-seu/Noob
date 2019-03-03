FROM steveng28/python3:v1
EXPOSE 5000
WORKDIR /opt/project
COPY . /opt/project
RUN ["/bin/bash", "-r","pip3", "install", "-r", "requirements.txt"]

