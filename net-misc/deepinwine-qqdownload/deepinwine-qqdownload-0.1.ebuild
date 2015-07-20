# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="QQ Download Tool for Linux by Deepin"
HOMEPAGE="http://www.linuxdeepin.com/"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-qqdownload/${PN}_${PV}_all.deb"

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
	elog "Please report bugs to Deepin."
	elog
}
