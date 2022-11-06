#!/bin/sh

version=v0.5.2
filename=gotosocial_0.5.2_linux_amd64.tar.gz

wget https://github.com/superseriousbusiness/gotosocial/releases/download/${version}/${filename}
mkdir tmp
(
    cd tmp
    tar -xzf ../${filename}
)
rm ${filename}

# copy config if not existing
test -e config.yaml || (cp tmp/example/config.yaml . && echo "you may want to edit the config.yaml!")

# move needed files
mv tmp/web .
mv tmp/gotosocial .

# cleanup
rm -rf tmp
