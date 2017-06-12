# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3 webapp

DESCRIPTION="The worlds best and hottest interface to interact with aria2"
HOMEPAGE="https://github.com/ziahamza/webui-aria2"
SRC_URI=""
EGIT_REPO_URI="https://github.com/ziahamza/webui-aria2.git"
EGIT_BRANCH="master"

LICENSE="MIT"
KEYWORDS=""
IUSE=""

DEPEND="${WEBAPP_DEPEND}"
RDEPEND="${DEPEND}"

INSTALL_DIR="aria2"

src_install() {
	webapp_src_preinst
	cp -R css fonts img js index.html configuration.js favicon.ico \
		"${D}/${MY_HTDOCSDIR}"
	webapp_configfile "${MY_HTDOCSDIR}"/configuration.js
	dodoc README.md directurl.md
	webapp_src_install
}
