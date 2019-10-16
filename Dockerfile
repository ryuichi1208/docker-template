FROM thinca/vim
USER root:root
WORKDIR /root
RUN apk update \
	&& apk --no-cache add curl jq git \
	&& mkdir -p /root/.cache/dein \
	&& curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > install.sh \
	&& sh install.sh /root/.cache/dein
COPY vimrc /root/.vimrc
ENTRYPOINT ["/usr/local/bin/vim"]
