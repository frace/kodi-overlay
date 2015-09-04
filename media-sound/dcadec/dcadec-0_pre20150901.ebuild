EAPI=5

inherit base

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/foo86/dcadec.git"
	inherit git-r3
else
	EGIT_COMMIT="2a9186e34ce557d3af1a20f5b558d1e6687708b9"
	SRC_URI="https://github.com/foo86/dcadec/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

DESCRIPTION="Free DTS Coherent Acoustics decoder with support for HD extensions"
HOMEPAGE="https://github.com/foo86/dcadec/"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/pkgconfig"
RDEPEND="${DEPEND}
	!media-libs/libdca"

src_install() {
	base_src_install PREFIX="${EPREFIX}/usr"
}
