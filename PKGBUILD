# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2020-10-20T23:49:30+01:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=mesos-git
_pkgsrcname="mesos"
pkgver=0.0.1.r7.7065005
pkgrel=1
pkgdesc="Mesos, cluster manager, and efficient resource isolater, for distributed applications."
arch=('x86_64')
url="https://github.com/apache/${_pkgsrcname}"
_branch="master"
license=("Apache-2.0") # Apache License Version 2.0
groups=()
depends=("python" "jre-openjdk-headless")
makedepends=("git"
						 "make"
						 "cmake")
optdepends=()
provides=("mesos")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgsrcname}::git+${url}#branch=${_branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgsrcname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${_pkgsrcname}"
	git checkout ${_branch} # get off of makepkg branch
	./bootstrap
	mkdir build
}

build() {
	# build
	cd "${srcdir}/${_pkgsrcname}/build"
	../configure
	make
	make check
}

check() {
	cd "${srcdir}/${_pkgsrcname}"
}

package() {
	cd "${srcdir}/${_pkgsrcname}/build"
	make install
}
