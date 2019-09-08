FROM java:openjdk-8-jdk-alpine

COPY . /spark-kotlin-docker

RUN apk update &amp;&amp; \ 
    apk add --virtual build-dependencies build-base bash curl &amp;&amp; \
    cd /spark-kotlin-docker &amp;&amp; ./gradlew clean &amp;&amp; \
    cd /spark-kotlin-docker &amp;&amp; ./gradlew build &amp;&amp; \
    mkdir -p /usr/local/spark-kotlin-docker/lib &amp;&amp; \
    cp -R /spark-kotlin-docker/build/libs/* /usr/local/spark-kotlin-docker/lib/ &amp;&amp; \
    apk del build-dependencies &amp;&amp; \
    rm -rf /var/cache/apk/* &amp;&amp; \
    rm -rf ~/.gradle &amp;&amp; \
    rm -rf /spark-kotlin-docker
