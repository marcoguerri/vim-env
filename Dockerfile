FROM archlinux

MAINTAINER Marco Guerri

CMD ["zsh"]

RUN useradd -m dev

COPY --chown=dev:dev downgrade_glibc.sh /tmp
COPY --chown=dev:dev config/zshrc /home/dev/.zshrc

RUN chmod a+x /tmp/downgrade_glibc.sh && /tmp/downgrade_glibc.sh

RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm \
	git \
	sudo \
	vim \
	ctags \
    	go \
   	gopls \
	tar  \
	gcc \
	docker-compose \
	tmux \
	zsh \
	nodejs \
        yarn \
        rust \
        rust-analyzer \
	rustup

USER dev

ENV TERM tmux-256color

COPY --chown=dev:dev config/vimrc /home/dev/.vimrc

RUN git clone https://github.com/vim-airline/vim-airline /home/dev/.vim/pack/dist/start/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes /home/dev/.vim/pack/dist/start/vim-airline-themes
RUN git clone https://github.com/preservim/nerdtree.git /home/dev/.vim/pack/vendor/start/nerdtree
RUN git clone https://github.com/ctrlpvim/ctrlp.vim /home/dev/.vim/pack/vendor/start/ctrlp
RUN git clone https://github.com/fatih/vim-go.git /home/dev/.vim/pack/plugins/start/vim-go
RUN cd /home/dev/.vim/pack/plugins/start/ && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -

RUN install -m 755 -d /home/dev/gopath

ENV GOPATH /home/dev/gopath
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.32.1

RUN vim -e +GoInstallBinaries +qa
RUN vim -e +CocInstall coc-go +qa
RUN sudo chsh -s /bin/zsh dev

COPY --chown=dev:dev config/coc-settings.json /home/dev/.vim/
