# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils fcaps cmake-utils

DESCRIPTION="Quick Easy DNS viewer"
HOMEPAGE="https://github.com/JBoro/${PN}"
SRC_URI="https://github.com/JBoro/${PN}/archive/${PV}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt4 qt5"
REQUIRED_USE="|| ( qt4 qt5 )"

RDEPEND="net-libs/libpcap"
DEPEND="${RDEPEND}
		qt4? (
			dev-qt/qtcore:4
			dev-qt/qtgui:4
		)
		qt5? (
			dev-qt/qtcore:5
			dev-qt/qtgui:5
			dev-qt/qtwidgets:5
        )
		x11-misc/xdg-utils"

CMAKE_USE_DIR="${S}/src"


src_configure() {
	local mycmakeargs=(
			$(cmake-utils_use_find_package qt5 Qt5Widgets)
			$(cmake-utils_use_find_package qt5 Qt5Gui)
			$(cmake-utils_use_find_package qt5 Qt5Core)
			)
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_make
}

src_install() {
	cmake-utils_src_install
	domenu dnsviewer.desktop
}

pkg_postinst() {
	fcaps cap_net_raw \
	"${EROOT}"/usr/bin/dnsviewer
}
