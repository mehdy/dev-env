FROM ubuntu:latest

WORKDIR /root

ENV TERM xterm-256color

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget git make zsh vim build-essential libssl-dev openssl gnupg2 jq fd-find ripgrep bat powerline fonts-powerline

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install --all --no-zsh

RUN wget https://raw.githubusercontent.com/mehdy/dotfiles/master/.zshrc
RUN wget https://raw.githubusercontent.com/mehdy/dotfiles/master/.p10k.zsh
RUN wget https://raw.githubusercontent.com/mehdy/dotfiles/master/.vimrc

RUN KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN zsh .zshrc

ENTRYPOINT ["/bin/zsh"]
