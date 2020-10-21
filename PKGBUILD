# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2020-10-21T18:10:42+01:00

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
						 "cmake"
						 "apr"
						 "subversion"
						 "grpc")
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
	# standard version from tag or fallback from revisions if possible
	cd "${srcdir}/${_pkgsrcname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_pkgsrcname}"
	git checkout ${_branch}
}

build() {
	cd "${srcdir}/${_pkgsrcname}"
	./bootstrap
	mkdir build
	cd "${srcdir}/${_pkgsrcname}/build"
	cmake ..
	cmake --build .
}

check() {
	cd "${srcdir}/${_pkgsrcname}"
}

package() {
	cd "${srcdir}/${_pkgsrcname}/build"
	make install
}
