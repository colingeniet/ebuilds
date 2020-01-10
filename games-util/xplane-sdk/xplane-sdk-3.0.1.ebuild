# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="X-Plane developer headers"
HOMEPAGE="https://developer.x-plane.com/sdk/"
SRC_URI="https://developer.x-plane.com/wp-content/plugins/code-sample-generation/sample_templates/XPSDK301.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/glibc"
RDEPEND="${DEPEND}"

S="${WORKDIR}/SDK"

# This is stupid
src_compile() {
	cp -r "${S}/CHeaders/" "${S}/xplane_sdk/"
}

src_install() {
	doheader -r "${S}/xplane_sdk/"
}
