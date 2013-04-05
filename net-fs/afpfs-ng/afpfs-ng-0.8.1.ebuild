# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="4"

inherit autotools eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/Boxee/afpfs-ng.git"
	inherit git-2
else
	SRC_URI="mirror://sourceforge/afpfs-ng/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Apple Filing Protocol client and library implemented in FUSE"
HOMEPAGE="http://sourceforge.net/projects/afpfs-ng/"

LICENSE="LGPL-2"
SLOT="0"
IUSE="fuse static-libs"

RDEPEND="sys-libs/readline
	dev-libs/gmp
	dev-libs/libgcrypt
	fuse? ( sys-fs/fuse )"

DEPEND="${RDEPEND}"

src_unpack() {
	default
	if [[ ${PV} == "9999" ]] ; then
		git-2_src_unpack
	fi
}

src_prepare() {
	if [[ ${PV} == "0.8.1" ]] ; then
		epatch "${FILESDIR}"/00-${P}-fix_afpfs-ng_includes.patch
		epatch "${FILESDIR}"/01-${P}-gcrypt.patch
		epatch "${FILESDIR}"/02-${P}-pointer.patch
		epatch "${FILESDIR}"/03-${P}-boxee1.patch
		epatch "${FILESDIR}"/04-${P}-boxee2.patch
		epatch "${FILESDIR}"/05-${P}-boxee3.patch
		epatch "${FILESDIR}"/06-${P}-boxee4.patch
		epatch "${FILESDIR}"/07-${P}-boxee5.patch
		epatch "${FILESDIR}"/08-${P}-fix-errno.patch
		epatch "${FILESDIR}"/09-${P}-fix-stat.patch
		epatch "${FILESDIR}"/10-${P}-fix-even-more-pointers.patch
		mv ${S}/${P}/lib/identify.c ${S}/lib || die
	fi
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable fuse fuse) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use static-libs || find "${ED}" -name '*.la' -delete
}
