#!/bin/bash
GOSS_VERSION=v0.3.7
DGOSS_VERSION=3c51e31c2083b61c24c346e37d08be39d8149f51

wget https://github.com/aelsabbahy/goss/releases/download/$GOSS_VERSION/goss-linux-amd64 -O goss
wget https://raw.githubusercontent.com/aelsabbahy/goss/$DGOSS_VERSION/extras/dgoss/dgoss -O dgoss
