EAPI="5"

inherit autotools eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/juhovh/shairplay.git"
else
	EGIT_COMMIT="0f41ade2678f374aa8446d127d6aa9d5a3d428da"
	SRC_URI="https://github.com/juhovh/shairplay/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
fi

DESCRIPTION="Apple airplay and raop protocol server"
HOMEPAGE="https://github.com/juhovh/shairplay"

LICENSE="LGPL-2.1 MIT BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static-libs"

RDEPEND=">=dev-libs/openssl-1.0.0
		media-libs/libao"
DEPEND="${COMMON_DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default
	use static-libs || prune_libtool_files --all
}
