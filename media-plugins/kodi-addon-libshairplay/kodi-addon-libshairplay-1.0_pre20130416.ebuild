EAPI="5"

inherit autotools git-2

MY_PV="1.0_pre20130416"
EGIT_REPO_URI="git://github.com/juhovh/shairplay.git"

if [[ ${PV} ==  ${MY_PV} ]] ; then
	EGIT_COMMIT="139d5ef"
fi

DESCRIPTION="A KODI addon providing an Apple airplay and raop protocol server"
HOMEPAGE="https://github.com/juhovh/shairplay"

LICENSE="LGPL-2.1 MIT BSD"
SLOT="0"
IUSE="static-libs"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND=">=dev-libs/openssl-1.0.0
				media-libs/libao
				media-tv/kodi[airplay]"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	epatch "${FILESDIR}"/01-${PN}-1.0-fixipv4ipv6race.patch
	epatch "${FILESDIR}"/02-${PN}-1.0-fixpasswordauthitunes.patch

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
