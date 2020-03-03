# image name: tespkg/coc-base
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y neovim git curl yarnpkg
RUN git clone https://github.com/neoclide/coc.nvim.git
RUN cd coc.nvim && yarnpkg install --frozen-lockfile
#VOLUME [ "/root/.config/nvim/" "/root/.config/coc" ]
WORKDIR /work
RUN echo "set nocompatible\nset runtimepath^=/coc.nvim\nfiletype plugin indent on\nsyntax on\nset hidden\n" > /minimal-coc.nvim
CMD [ "nvim", "-u", "/minimal-coc.nvim" ]
