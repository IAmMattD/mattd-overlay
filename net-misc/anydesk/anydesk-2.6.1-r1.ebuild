# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="https://anydesk.com"
SRC_URI="
        x86?   ( https://download.anydesk.com/linux/${PN}_${PV}-1_i386.deb )
        amd64? ( https://download.anydesk.com/linux/${PN}_${PV}-1_amd64.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/gtkglext"
RDEPEND="${DEPEND}"

RESTRICT="mirror strip"

S=$WORKDIR

src_install() {
	tar xzvf data.tar.gz -C ${D}
	chmod 755 ${D}/usr
	chown -R root:root ${D}
}
