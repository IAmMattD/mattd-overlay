# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit bzr eutils

DESCRIPTION="A simple GUI for managing Conky config files"
HOMEPAGE="https://launchpad.net/conky-manager"
SRC_URI=""
EBZR_REPO_URI="lp:conky-manager"
EBZR_PROJECT="conky-manager"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/vala-0.18
	app-admin/conky
	>=x11-libs/gtk+-3.0
	dev-libs/libgee:0
	net-misc/rsync
	dev-libs/json-glib
	media-gfx/imagemagick
	app-arch/p7zip"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${PV}

src_unpack() {
	bzr_src_unpack
}

src_install() {
	cd ${WORKDIR}/${PN}-${PV}/src
	emake DESTDIR="${D}" install
}
