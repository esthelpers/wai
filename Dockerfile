FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y wget git
RUN mkdir $HOME/bin
RUN echo echo
RUN wget -O - -o /dev/null https://raw.githubusercontent.com/esthelpers/est/master/install.sh | bash
RUN mkdir $HOME/.config
RUN PATH=$PATH:$EST_HOME/bin
RUN echo 'export EST_EDITOR=vim' >> $HOME/.bashrc
RUN echo 'export EST_HOME=/root/.est' >> $HOME/.bashrc
RUN echo 'source /root/.est/estlib.sh' >> $HOME/.bashrc
RUN echo 'est_session' >> $HOME/.bashrc
COPY ./* /root/.config/est/helpers/esthelpers/wai/
RUN bash -c ". /root/.est/estlib.sh;est activate wai"

WORKDIR /root

CMD bash -c "echo $(wai)"After you made it executable, you can run it using 
