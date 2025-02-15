#!/bin/sh

version=v0.17.4
filename=gotosocial_0.17.4_linux_amd64.tar.gz

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
test -e web && mv web web.old
mv tmp/web .
mv tmp/gotosocial .

# cleanup
rm -rf tmp
