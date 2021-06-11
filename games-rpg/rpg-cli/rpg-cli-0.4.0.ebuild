# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
atty-0.2.14
autocfg-1.0.1
bincode-1.3.3
bitflags-1.2.1
cfg-if-1.0.0
clap-3.0.0-beta.2
clap_derive-3.0.0-beta.2
colored-2.0.0
ctor-0.1.20
dirs-3.0.2
dirs-sys-0.3.6
dunce-1.0.1
erased-serde-0.3.15
getrandom-0.2.3
ghost-0.1.2
hashbrown-0.9.1
heck-0.3.3
hermit-abi-0.1.18
indexmap-1.6.2
inventory-0.1.10
inventory-impl-0.1.10
lazy_static-1.4.0
libc-0.2.95
once_cell-1.7.2
os_str_bytes-2.4.0
ppv-lite86-0.2.10
proc-macro2-1.0.27
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
quote-1.0.9
rand-0.8.3
rand_chacha-0.3.0
rand_core-0.6.2
rand_hc-0.3.0
redox_syscall-0.2.8
redox_users-0.4.0
serde-1.0.126
serde_derive-1.0.126
strsim-0.10.0
syn-1.0.72
termcolor-1.1.2
textwrap-0.12.1
typetag-0.1.7
typetag-impl-0.1.7
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.2.2
vec_map-0.8.2
version_check-0.9.3
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Terminal game, your filesystem as a dungeon"
HOMEPAGE="https://github.com/facundoolano/rpg-cli"
SRC_URI="https://github.com/facundoolano/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install() {
	cargo_src_install
	dodoc README.md
	newdoc shell/README.md README-shell.md
}
