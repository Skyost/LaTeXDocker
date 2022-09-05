apt-get -qq update

echo "Installing pandoc..."
apt -qq -y install wget
wget -q https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb
dpkg -i pandoc-2.19.2-1-amd64.deb
rm pandoc-2.19.2-1-amd64.deb
pandoc --version

echo "Installing Node.js"
apt -qq -y install build-essential libssl-dev
wget -q https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 16.17.0
nvm alias default node
node --version
npm --version

echo "Installing git..."
apt -qq -y install git
git --version

echo "Installing Poppler-utils..."
apt -qq -y install poppler-utils
pdftocairo -v

# echo "Installing TeXLive..."
# apt -qq -y install fontconfig
# wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# mkdir install-tl
# tar xvfz install-tl-unx.tar.gz --strip 1 -C install-tl
# rm install-tl-unx.tar.gz
# mv texlive.profile install-tl/texlive.profile
# cd install-tl
# ./install-tl --profile=texlive.profile
# cd ../
# rm -rf install-tl
# tlmgr path add
# cp $(kpsewhich -var-value TEXMFSYSVAR)/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive.conf
# fc-cache -fsv
# latexmk --version
# lualatex --version
