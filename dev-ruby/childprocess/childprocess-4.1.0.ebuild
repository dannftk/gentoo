# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="Solution for controlling external programs running in the background"
HOMEPAGE="https://github.com/jarib/childprocess"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.11"

all_ruby_prepare() {
	# Remove bundler support
	rm Gemfile || die
	sed -i -e "/[Bb]undler/d" Rakefile || die
	sed -i -e "/[Cc]overalls/d" spec/spec_helper.rb || die
	sed -i -e 's/git ls-files/find/' ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_prepare() {
	sed -i -e "s:'ruby':'"${RUBY}"':" spec/childprocess_spec.rb spec/spec_helper.rb || die
	sed -i -e '/system/ s:ruby:'${RUBY}':' spec/spec_helper.rb || die
}

each_ruby_test() {
	RUBYLIB=lib RSPEC_VERSION=3 ruby-ng_rspec
}
