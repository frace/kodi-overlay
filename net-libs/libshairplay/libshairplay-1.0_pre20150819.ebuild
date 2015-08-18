EAPI="5"

inherit autotools eutils git-r3

MY_PV="1.0_pre20150819"
EGIT_REPO_URI="git://github.com/juhovh/shairplay.git"

if [[ ${PV} ==  ${MY_PV} ]] ; then
	EGIT_COMMIT="0f41ade"
fi

DESCRIPTION="Apple airplay and raop protocol server"
HOMEPAGE="https://github.com/juhovh/shairplay"

LICENSE="LGPL-2.1 MIT BSD"
SLOT="0"
IUSE="static-libs"
KEYWORDS="~amd64 ~x86"

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
