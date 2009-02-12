# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ereiamjh}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas 'Ted' Davis"]
  s.date = %q{2009-02-12}
  s.default_executable = %q{ereiamjh}
  s.description = %q{Ruby library and command-line tool to announce your geographic location to Twitter.}
  s.email = %q{github@rudiment.net}
  s.executables = ["ereiamjh"]
  s.files = ["VERSION.yml", "bin/ereiamjh", "lib/ereiamjh.rb", "test/ereiamjh_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/trak3r/ereiamjh}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby library and command-line tool to announce your geographic location to Twitter.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
