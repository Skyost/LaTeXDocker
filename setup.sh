apt-get -qq update

echo "Installing pandoc..."
pandoc_version=3.6.4
apt -qq -y install wget
wget -q https://github.com/jgm/pandoc/releases/download/$pandoc_version/pandoc-$pandoc_version-1-amd64.deb
dpkg -i pandoc-$pandoc_version-1-amd64.deb
rm pandoc-$pandoc_version-1-amd64.deb
pandoc --version

echo "Installing Node.js"
node_version=23
apt -qq -y install ca-certificates curl gnupg
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$node_version.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get -qq update
# apt -qq -y install gcc g++ make
apt -qq -y install nodejs
npm install --global yarn
node --version
npm --version
yarn --version

echo "Installing git..."
apt -qq -y install git
git --version

# Don't upgrade until this : https://gitlab.freedesktop.org/poppler/poppler/-/issues/1309 is fixed.
echo "Installing pdftocairo..."
poppler_version=25.05
apt -qq -y install xz-utils cmake build-essential libfreetype6-dev pkg-config libfontconfig1-dev libnss3-dev libjpeg-dev libopenjp2-7-dev libcairo2-dev libtiff-dev
wget -q https://poppler.freedesktop.org/poppler-$poppler_version.0.tar.xz
mkdir install-poppler
tar -xf poppler-$poppler_version.0.tar.xz --strip 1 -C install-poppler
rm poppler-$poppler_version.0.tar.xz
cd install-poppler
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DTESTDATADIR=$PWD/testfiles -DENABLE_QT6=OFF -DENABLE_QT5=OFF -DENABLE_GPGME=OFF -DENABLE_UNSTABLE_API_ABI_HEADERS=ON -DENABLE_BOOST=OFF -DENABLE_LCMS=OFF -DENABLE_LIBCURL=OFF ..
make install
cd ../../
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
