# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Typora — a minimal markdown reading & writing app"
HOMEPAGE="https://typora.io"
SRC_URI="
	amd64? ( https://typora.io/linux/typora_0.9.23_amd64.deb )
	x86? ( https://typora.io/linux/typora_0.9.23_i386.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	gnome-base/libgnome-keyring"

RESTRICT="mirror strip"

S=$WORKDIR

src_install() {
	tar xvf data.tar.xz -C ${D}
	chmod 755 ${D}/usr
	chown -R root:root ${D}
}
