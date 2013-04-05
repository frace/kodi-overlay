EAPI="4"

inherit autotools git-2

MY_PV="1.0_pre20130222"
EGIT_REPO_URI="git://github.com/juhovh/shairplay.git"

if [[ ${PV} ==  ${MY_PV} ]] ; then
	EGIT_COMMIT="efc9c14026"
fi

DESCRIPTION="Apple airplay and raop protocol server"
HOMEPAGE="https://github.com/juhovh/shairplay"

LICENSE="LGPL-2.1 MIT BSD"
SLOT="0"
IUSE="static-libs"

COMMON_DEPEND=">=dev-libs/openssl-1.0.0
           	   media-libs/libao"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static-libs static)
}

src_install() {
	default
	use static-libs || find "${ED}" -name '*.la' -delete
}
