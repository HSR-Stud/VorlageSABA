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
tlmgr install koma-script

# Needed for TeX Live 2017
tlmgr install xkeyval

# A kind of minimum set of packages needed
tlmgr install collection-latex
tlmgr install graphics
tlmgr install required
tlmgr install collection-fontsrecommended


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
tlmgr install  acronym
tlmgr install  	\
  adjustbox     \
  algorithmicx  \
  algorithms    \
  amsfonts      \
  amsmath       \
  amssymb       \
  amsthm        \
  appendix      \
  array         \
  bibtex		\
  biblatex		\
  biblatex-ieee	\
  bigfoot		\
  bm            \
  bookmark      \
  booktabs      \
  cancel        \
  caption       \
  centernot     \
  changepage	\
  collectbox    \
  courier       \
  csquotes		\
  ec            \
  enumerate     \
  enumitem      \
  environ		\
  epstopdf		\
  etoolbox      \
  exam          \
  fancybox      \
  fancyhdr      \
  float         \
  floatflt      \
  fontenc       \
  footmisc		\
  framed		\
  graphbox		\
  graphicx      \
  hyperref      \
  hyphenat      \
  imakeidx      \
  inputenc      \
  jknapltx      \
  l3kernel	    \
  l3packages	\
  lastpage      \
  latex-fonts   \
  listings      \
  listofitems   \
  lipsum		\
  lm            \
  longtable     \
  logreq		\
  marginnote	\
  marvosym      \
  mathabx       \
  mathrsfs      \
  mathtools     \
  mparhack		\
  multicol      \
  multirow      \
  opensans      \
  paralist		\
  pdflscape     \
  pdfpages      \
  pgf           \
  pgfplots      \
  placeins		\
  polynom       \
  pxfonts       \
  rotating      \
  rsfs          \
  scrhack		\
  scalerel      \
  setspace		\
  slantsc       \
  stackengine   \
  stmaryrd      \
  subcaption    \
  tabularx      \
  textcomp      \
  thmtools      \
  tikz          \
  titlesec      \
  tocloft		\
  todonotes		\
  tcolorbox		\
  trfsigns      \
  trsym         \
  trimspaces	\
  txfonts       \
  ulem          \
  verbatim      \
  varwidth		\
  wrapfig       \
  xcolor        \
  xpatch		\
  xstring


#fmtutil --no-strict --byengine=pdftex

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
