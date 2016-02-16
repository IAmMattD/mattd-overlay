# Copyright 1999-2016 Gentoo Foundation
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

DEPEND="
	app-admin/conky
	app-arch/p7zip
	>=dev-lang/vala-0.18
	dev-libs/json-glib
	dev-libs/libgee:0
	media-gfx/imagemagick
	net-misc/rsync
	>=x11-libs/gtk+-3.0
	"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${PV}

src_unpack() {
	bzr_src_unpack
}

src_install() {
	cd ${WORKDIR}/${PN}-${PV}/src
	emake DESTDIR="${D}" install
}
