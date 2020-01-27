FROM rightmesh/ubuntu-openjdk:18.04
RUN apt-get update
RUN apt-get install wget vim -y
RUN wget http://download.snapform.com/redirect/download.asp?LINK_ID=100220 -O /tmp/SFViewer.sh
RUN chmod a+x /tmp/SFViewer.sh
RUN mkdir /tmp/SFViewer
RUN chmod a+rwx /tmp/SFViewer
RUN /tmp/SFViewer.sh -q -dir /tmp/SFViewer -Dinstall4j.detailStdout=true
RUN ln -s /tmp/SFViewer/Snapform\ Viewer /tmp/SFViewer/snapform.sh
RUN chmod a+x /tmp/SFViewer/snapform.sh
# Clean caches and tmps
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/SFViewer.sh && \
    rm -rf /var/log/*

