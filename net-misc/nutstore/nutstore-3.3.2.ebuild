# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="A cloud service that lets you sync and share files anywhere"
HOMEPAGE="https://www.jianguoyun.com"
SRC_URI="x86? ( https://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x86.tar.gz -> ${P}-x86.tar.gz )
	amd64? ( https://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x64.tar.gz -> ${P}-amd64.tar.gz )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-java/oracle-jdk-bin
	dev-python/py-notify
	dev-libs/glib:2
	gnome-base/gvfs
	x11-libs/gtk+:2"

RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install(){
	insinto "/opt/${PN}"
	doins -r *
	insinto "/usr/share/applications"
	doins $S/gnome-config/menu/nutstore-menu.desktop
	insinto "/usr/share/pixmaps"
	doins $S/app-icon/nutstore.png
}
