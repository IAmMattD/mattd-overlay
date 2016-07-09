# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils autotools

DESCRIPTION="A drop down terminal, similar to the consoles found in first person shooters"
HOMEPAGE="https://github.com/lanoxx/tilda"
SRC_URI="https://github.com/lanoxx/tilda/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=">=x11-libs/vte-0.40.2:2.91
	>=dev-libs/glib-2.8.4:2
	>=x11-libs/gtk+-3.0"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

S="${WORKDIR}/${PN}-${P}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
	--enable-vte-2.91
}

src_install() {
	emake DESTDIR="${D}" install || die
}

