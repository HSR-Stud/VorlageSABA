#!/usr/bin/env sh

# Originally from https://github.com/latex3/latex3

# This script is used for testing using Travis
# It is intended to work on their VM set up: Ubuntu 12.04 LTS
# A minimal current TL is installed adding only the packages that are
# required

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
tlmgr option repository http://mirrors.standaloneinstaller.com/ctan/systems/texlive/tlnet
if ! command -v texlua > /dev/null; then

# Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*
  

  #sudo apt-get install -y --no-install-recommends texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra dvipng texlive-latex-recommended
  
  # Install a minimal system
  ./install-tl --profile=../Travis/texlive/texlive.profile
  
  cd ..
fi

# Just including texlua so the cache check above works
# Needed for any use of texlua even if not testing LuaTeX
tlmgr install luatex

# Needed for TeX Live 2017
tlmgr install xkeyval

# A kind of minimum set of packages needed
tlmgr install collection-latex
tlmgr install graphics
tlmgr install required
tlmgr install collection-fontsrecommended

#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-latex-extra
#sudo apt-get install exlive-fonts-extra 
#sudo apt-get install dvipng
#sudo apt-ge install install texlive-latex-recommended

# Install babel languages
#tlmgr install collection-langeuropean
tlmgr install babel-german
tlmgr install hyphen-german

#retest
#tlmgr option repository http://babyname.tips/mirrors/ctan/

#sudo tlmgr option repository  ftp://dante.ctan.org/tex-archive//


# Index of packages: http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/archive/
# Other contrib packages: done as a block to avoid multiple calls to tlmgr
# pgf includes tikz
tlmgr install   \
  adjustbox     \
  algorithmicx  \
  algorithms    \
  amsfonts      \
  amsmath       \
  amssymb       \
  acronym		\
  array         \
  amsthm        \
  bm            \
  bookmark      \
  booktabs      \
  cancel        \
  caption       \
  centernot     \
  courier       \
  collectbox    \
  changepage	\
  ec            \
  enumerate     \
  enumitem      \
  etoolbox      \
  epstopdf		\
  exam          \
  fancybox      \
  fancyhdr      \
  float         \
  floatflt      \
  fontenc       \
  graphicx      \
  hyperref      \
  jknapltx      \
  lastpage      \
  imakeidx      \
  inputenc      \
  latex-fonts   \
  lm            \
  listings      \
  listofitems   \
  longtable     \
  l3k­er­nel	\
  marvosym      \
  mathabx       \
  mathrsfs      \
  mathtools     \
  multicol      \
  multirow      \
  opensans      \
  pdfpages      \
  pdflscape     \
  pgf           \
  pgfplots      \
  polynom       \
  pxfonts       \
  rotating      \
  rsfs          \
  subcaption    \
  scalerel      \
  slantsc       \
  stackengine   \
  stmaryrd      \
  thmtools      \
  tabularx      \
  textcomp      \
  tikz          \
  times         \
  titlesec      \
  trfsigns      \
  trsym         \
  txfonts       \
  verbatim      \
  ulem          \
  wrapfig       \
  xcolor        

#fmtutil --no-strict --byengine=pdftex

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
