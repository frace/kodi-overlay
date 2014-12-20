# What is it?
A Gentoo overlay which provides modified and unofficial ebuilds
for a KODI appliance/set-top-box/htpc.


## Get it!
There are two easy ways to get the overlay onto your Gentoo installation:


### 1. Git
1. `emerge -av git`
2. `mkdir /usr/local/portage`
3. `cd /usr/local/portage`
4. `git clone git://github.com/frace/kodi-overlay.git`
5. Modify `/etc/make.conf`:

        PORTDIR_OVERLAY="/usr/local/portage/kodi-overlay/"


### 2. Layman
If you don't know what `layman` is then please read the [documentation][docs-layman] first.

1. `emerge -av layman`
2. Modify `/etc/layman/layman.cfg`:

        overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                    https://raw.github.com/frace/kodi-overlay/master/repositories.xml

3. `layman --list`
4. `layman --add kodi-overlay`

[docs-layman]: http://www.gentoo.org/proj/en/overlays/userguide.xml


## Available ebuilds
        [M] app-admin/istatd-0.5.7
            media-plugins/kodi-addon-libshairplay-1.0_pre20130416
            media-tv/xbmc-9999
        [M] net-fs/afpfs-ng-0.8.1

Masked [M] ebuilds are unmaintained and are not in sync with possible upstream ebuilds.


## Bugs
You are welcome to report bugs at the [project bugtracker][project-bugtracker] at github.com.

[project-bugtracker]: https://github.com/frace/kodi-overlay/issues


## ToDo
- Add an ebuild for a patched («quietboot») version of syslinux
- Add an ebuild for XBMC/KODI fbsplash themes in media-gfx/

Presumably a more recent list of todos can be found on the [project todo list][project-todo] at github.com.

[project-todo]: https://github.com/frace/kodi-overlay/issues?labels=todo

* * *
- [Portage man pages][docs-gentoo-portage]
- [make.conf man pages][docs-gentoo-makeconf]
- [Gentoo dev manual][docs-devmanual]
- [Ebuild writing][docs-devmanual-ebuild]
- [Ebuild file format][docs-devmanual-ebuild-format]
- [Gentoo color palette][docs-gentoo-colors]

[docs-devmanual]: https://devmanual.gentoo.org
[docs-devmanual-ebuild]: https://devmanual.gentoo.org/ebuild-writing
[docs-devmanual-ebuild-format]: https://devmanual.gentoo.org/ebuild-writing/file-format
[docs-gentoo-colors]: https://www.gentoo.org/proj/en/desktop/artwork/colors.xml
[docs-gentoo-portage]: http://dev.gentoo.org/~zmedico/portage/doc/man/portage.5.html
[docs-gentoo-makeconf]: http://dev.gentoo.org/~zmedico/portage/doc/man/make.conf.5.html
