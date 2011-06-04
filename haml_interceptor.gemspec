# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{haml_interceptor}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Scofield"]
  s.date = %q{2011-06-03}
  s.description = %q{haml_interceptor is a Rack middleware designed to intercept JS responses from a web application and re-process them from HTML to Haml, resulting in a smaller package sent down the wire to the client.}
  s.email = %q{git@turrean.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "haml_interceptor.gemspec",
    "lib/haml_interceptor.rb",
    "test/helper.rb",
    "test/sample_app.rb",
    "test/test.ru",
    "test/test_haml_interceptor.rb"
  ]
  s.homepage = %q{http://github.com/bscofield/haml_interceptor}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.9}
  s.summary = %q{Rack middleware to process HTML into Haml for slimmer JS responses}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.3.0"])
      s.add_runtime_dependency(%q<rake>, [">= 0.8.7"])
      s.add_runtime_dependency(%q<haml>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.6.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.3.0"])
      s.add_dependency(%q<rake>, [">= 0.8.7"])
      s.add_dependency(%q<haml>, [">= 3.1.1"])
      s.add_dependency(%q<hpricot>, [">= 0.8.4"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rack-test>, ["~> 0.6.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.3.0"])
    s.add_dependency(%q<rake>, [">= 0.8.7"])
    s.add_dependency(%q<haml>, [">= 3.1.1"])
    s.add_dependency(%q<hpricot>, [">= 0.8.4"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rack-test>, ["~> 0.6.0"])
  end
end

