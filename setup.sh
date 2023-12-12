apt-get -qq update

echo "Installing pandoc..."
pandoc_version=3.1.9
apt -qq -y install wget
wget -q https://github.com/jgm/pandoc/releases/download/$pandoc_version/pandoc-$pandoc_version-1-amd64.deb
dpkg -i pandoc-$pandoc_version-1-amd64.deb
rm pandoc-$pandoc_version-1-amd64.deb
pandoc --version

echo "Installing Node.js"
node_version=20
apt -qq -y install ca-certificates curl gnupg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$node_version.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get -qq update
# apt -qq -y install gcc g++ make
apt -qq -y install nodejs npm
npm install --global yarn
node --version
npm --version
yarn --version

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
