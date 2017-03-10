# INSTALL

mkdir -p ${home}/.fonts
# install fonts ttf
cp -rf SourceCodePro_FontsOnly-1.013/TTF/* ${home}/.fonts/
# install fonts ttf
# cp -rf SourceCodePro_FontsOnly-1.013/OTF/* ${home}/.fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
