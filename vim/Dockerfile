FROM archlinux/base

MAINTAINER Marco Guerri

RUN useradd -m dev

RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -Syu --noconfirm \
	git \
	sudo \
	vim \
	ctags \
    	go \
   	gopls \
	tar  \
	gcc

USER dev

ENV TERM tmux-256color

COPY --chown=dev:dev files/vimrc /home/dev/.vimrc

RUN git clone https://github.com/vim-airline/vim-airline /home/dev/.vim/pack/dist/start/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes /home/dev/.vim/pack/dist/start/vim-airline-themes
RUN git clone https://github.com/preservim/nerdtree.git /home/dev/.vim/pack/vendor/start/nerdtree
RUN git clone https://github.com/ctrlpvim/ctrlp.vim /home/dev/.vim/pack/vendor/start/ctrlp
RUN git clone https://github.com/fatih/vim-go.git /home/dev/.vim/pack/plugins/start/vim-go

RUN install -m 755 -d /home/dev/gopath

ENV GOPATH /home/dev/gopath
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.32.1

RUN sudo pacman -Syu --noconfirm tmux

RUN vim -e +GoInstallBinaries +qa
