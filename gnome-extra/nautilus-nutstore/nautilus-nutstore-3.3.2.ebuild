# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils autotools

DESCRIPTION="Nutstore integration for Nautilus"
HOMEPAGE="https://www.jianguoyun.com/"
SRC_URI="https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-java/oracle-jdk-bin
	dev-libs/glib:2
	gnome-base/gvfs
	gnome-base/nautilus
	x11-libs/gtk+:2"

DEPEND="${RDEPEND}"

S="${WORKDIR}/nutstore_linux_src_installer"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die
}

