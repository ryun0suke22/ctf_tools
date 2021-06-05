# Kali Linux (Rolling) Docker Image
# 2016
#
# Buld the image with:
#   $ docker build -t kali-linux .
#
# Start a container for the first time from a built image with:
#   $ docker run -it --name kali -h kali kali-linux
#
# After the first run, start the image with:
#   $ docker start -ai kali

FROM kalilinux/kali-rolling
MAINTAINER butaganmen <jhan.k.police@gmail.com>

# Let the container know there will be no TTY
ENV DEBIAN_FRONTEND=noninteractive

# From the upstream docker image
#RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
#    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Get the latest everything
RUN apt-get -y update && \
    apt-get -y dist-upgrade

# Install tools we want
RUN apt-get install -y \
    hydra \
    john \
    metasploit-framework \
    nmap \
    sqlmap \
    wfuzz \
    exploitdb \
    nikto \
    commix \
    hashcat \
    # Wordlists
    wordlists \ 
    cewl

# Install Other tools
RUN apt-get install -y \
    gdb

# Install utils
RUN apt-get install -y \
    vim-gtk3 \
    git \
    tmux \
    xserver-xorg \
    xsel \
    zsh

# Setup gdb-peda
RUN git clone https://github.com/longld/peda.git ~/peda && \
    echo "source ~/peda/peda.py" >> ~/.gdbinit

# PYENV
RUN apt-get update &&  apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
RUN  git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
         cd ~/.pyenv && src/configure && make -C src && \
         ~/.pyenv/bin/pyenv install 3.7.4 && ~/.pyenv/bin/pyenv global 3.7.4

WORKDIR /root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

