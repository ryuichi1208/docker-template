FROM ubuntu:latest
ADD openjdk-11.0.1_linux-x64_bin.tar.gz /opt/jdk/
ADD HelloWorld.class HelloWorld.class
ENV PATH /opt/jdk/jdk-11.0.1/bin:$PATH
CMD [ "java", "-showversion", "HelloWorld" ]
