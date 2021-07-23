# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_DOCDIR="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

# Don't install support scripts to avoid slot collisions.
RUBY_FAKEGEM_BINWRAP=""

RUBY_FAKEGEM_GEMSPEC="cucumber-gherkin.gemspec"

inherit ruby-fakegem

DESCRIPTION="Fast Gherkin lexer and parser"
HOMEPAGE="https://github.com/cucumber/gherkin"
SRC_URI="https://github.com/cucumber/common/archive/gherkin/v${PV}.tar.gz -> ${P}.tar.gz"
RUBY_S="common-gherkin-v${PV}/gherkin/ruby"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="$(ver_cut 1)"
IUSE=""

ruby_add_rdepend ">=dev-util/cucumber-messages-17.0.1:17"
