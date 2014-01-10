EAPI="5"

inherit autotools git-2

MY_PV="1.2.0.20310_pre20130221"
EGIT_REPO_URI="git://github.com/amejia1/libshairport.git"

if [[ ${PV} ==  ${MY_PV} ]] ; then
	EGIT_COMMIT="16395d85ea"
fi

DESCRIPTION="Emulates an AirPort Express for the purpose of streaming music from iTunes and compatible iPods"
HOMEPAGE="https://github.com/amejia1/libshairport"

LICENSE="GPL-2"
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
