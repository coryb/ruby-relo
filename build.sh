#!/bin/bash
set -eux

VERSION=2.4.0
CURDIR=$(pwd)

CRAZYUSER=ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1
CRAZYDIR=/Users/${CRAZYUSER}

OSXVER=$(sw_vers -productVersion)
OSXVER=${OSXVER%.*}

sudo ln -s $HOME ${CRAZYDIR}

export HOME=${CRAZYDIR}
cd $HOME

export USER=${CRAZYUSER}

curl -sSL https://get.rvm.io | bash -s stable

$HOME/.rvm/bin/rvm install ${VERSION} --disable-binary

cp ${CURDIR}/relocate ${CRAZYDIR}/.rvm/rubies/ruby-${VERSION}
chmod 755 ${CRAZYDIR}/.rvm/rubies/ruby-${VERSION}/relocate

cd ${CRAZYDIR}/.rvm/rubies/ruby-${VERSION} && tar -cyf ${TRAVIS_BUILD_DIR}/ruby-${VERSION}-osx-${OSXVER}.tar.bz2 *

set +x

curl -X DELETE -ucoryb:${BINTRAY_API_KEY} https://api.bintray.com/content/coryb/ruby-relo/ruby-tarballs/0.0.2/osx/${OSXVER}/ruby-${VERSION}-osx-${OSXVER}.tar.bz2 || true

curl -T ${TRAVIS_BUILD_DIR}/ruby-${VERSION}-osx-${OSXVER}.tar.bz2 -ucoryb:${BINTRAY_API_KEY} https://api.bintray.com/content/coryb/ruby-relo/ruby-tarballs/0.0.2/osx/${OSXVER}/ruby-${VERSION}-osx-${OSXVER}.tar.bz2

curl -X POST -ucoryb:${BINTRAY_API_KEY} https://api.bintray.com/content/coryb/ruby-relo/ruby-tarballs/0.0.2/publish
