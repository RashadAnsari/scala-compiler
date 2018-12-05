FROM java:8

# Env variables
ENV SCALA_VERSION 2.12.4
ENV SBT_VERSION 1.2.1

# Install Scala
RUN  curl -fsLO https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb
RUN \
  dpkg -i scala-$SCALA_VERSION.deb && \
  rm -f scala-$SCALA_VERSION.deb

# Install sbt
RUN curl -fsLO https://piccolo.link/sbt-$SBT_VERSION.tgz
RUN tar -zxf sbt-$SBT_VERSION.tgz && \
    rm sbt-$SBT_VERSION.tgz
WORKDIR sbt
RUN ./bin/sbt

# Add sbt link in path
RUN ln -s /sbt/bin/sbt /bin/sbt

# Define working directory
WORKDIR /root
