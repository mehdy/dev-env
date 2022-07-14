FROM ubuntu:latest

WORKDIR /root

RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget git make zsh vim build-essential openssl gnupg2 fzf jq fd-find ripgrip bat

RUN chsh -s /bin/zsh
RUN wget https://raw.githubusercontent.com/mehdy/dotfiles/master/.zshrc https://raw.githubusercontent.com/mehdy/dotfiles/master/.p10k.zsh
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN exec zsh

ENTRYPOINT ["/bin/zsh"]
