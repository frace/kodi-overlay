EAPI="5"

RELEASE_NAME="Helix"

inherit autotools

case ${PV} in
	9999)
		inherit git-2
		EGIT_REPO_URI="git://github.com/opdenkamp/xbmc-pvr-addons.git"
		;;
	*_rc*)
		MY_PV="${RELEASE_NAME}${PV/14.0/}"
		MY_P="xbmc-pvr-addons-${MY_PV}"
		SRC_URI="https://github.com/opdenkamp/xbmc-pvr-addons/archive/${MY_PV}.tar.gz -> kodi-addon-pvr-${PV}.tar.gz"
		KEYWORDS="~amd64 ~x86"
		;;
esac

DESCRIPTION="KODI PVR add-ons"
HOMEPAGE="https://github.com/opdenkamp/xbmc-pvr-addons"

LICENSE="GPL-3"
SLOT="0"
IUSE="filmon iptv static-libs"

DEPEND="media-tv/kodi"
RDEPEND="${DEPEND}
	filmon? (
		dev-libs/crypto++
		dev-libs/jsoncpp
		net-misc/curl
	)
	iptv? ( sys-libs/zlib )"

S=${WORKDIR}/${MY_P}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--prefix=/usr \
		--libdir=/usr/share/kodi/addons \
		--datadir=/usr/share/kodi/addons \
		$(use_enable filmon addons-with-dependencies) \
	 	$(use_enable iptv addons-with-dependencies) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use static-libs || find "${ED}" -name '*.la' -delete
	emake DESTDIR="${D}" install || die "emake install failed"
}
