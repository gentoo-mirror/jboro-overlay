# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="PCM DFT Viewer"
HOMEPAGE="https://github.com/JBoro/pcmdft"
SRC_URI="https://github.com/JBoro/pcmdft/archive/${PN}-${PV}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="media-libs/alsa-lib
		virtual/opencl
		x11-libs/qwt[qt5]"
DEPEND="${RDEPEND}
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
        x11-misc/xdg-utils
		dev-libs/boost"

CMAKE_USE_DIR="${S}/src"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_make
}

src_install() {
	cmake-utils_src_install
}

