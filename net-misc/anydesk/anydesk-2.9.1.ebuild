# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="https://anydesk.com"
SRC_URI="
        x86?   ( https://download.anydesk.com/linux/${P}-i686.tar.gz )
        amd64? ( https://download.anydesk.com/linux/${P}-amd64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="x11-libs/gtkglext"
RDEPEND="${DEPEND}"

src_install() {
	dobin anydesk
}
