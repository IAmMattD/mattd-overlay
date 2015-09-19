# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Tencent QQ for Crossover"
HOMEPAGE="http://www.linuxdeepin.com/"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-qq/${PN}_${PV}deepin4_i386.deb"

LICENSE="Tencent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=app-emulation/crossover-bin-14.0
"

RESTRICT="mirror strip"

S=$WORKDIR

src_install() {
	tar xvf data.tar.xz -C ${D}/

	chmod 755 ${D}/usr
	chown -R root:root ${D}
}

pkg_postinst() {
	elog
	elog "This package is used with Crossover only, please ensure "
	elog "you have a licensed Crossover installed."
	elog "If you encounter any issue, please report it to Deepin."
	elog
}
