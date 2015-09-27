FROM rtezli/java

MAINTAINER Robert Tezli <robert@pixills.com>

COPY ./start.sh /
COPY ./welcome.sh /

RUN apt-get update && \
    apt-get install -y procps && \
    mkdir -p /usr/share/spark && \
    cd /usr/share/spark && \
    wget -nv http://mirror.netcologne.de/apache.org/spark/spark-1.5.0/spark-1.5.0-bin-hadoop2.6.tgz && \
    tar zxf spark-1.5.0-bin-hadoop2.6.tgz && \
    rm -rf spark-1.5.0-bin-hadoop2.6.tgz && \
    ln -s /usr/share/spark/spark-1.5.0-bin-hadoop2.6 /usr/share/spark/latest && \
    chmod +x /start.sh && \
    chmod +x /welcome.sh 

ENV SPARK_HOME /usr/share/spark/latest
ENV PATH /usr/share/spark/latest/bin:\
/usr/share/spark/latest/sbin:\
$PATH

VOLUME ["/data"]

EXPOSE 6066 7077 8080

ENTRYPOINT ["/start.sh"]
