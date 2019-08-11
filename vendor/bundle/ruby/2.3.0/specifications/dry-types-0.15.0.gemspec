# -*- encoding: utf-8 -*-
# stub: dry-types 0.15.0 ruby lib

Gem::Specification.new do |s|
  s.name = "dry-types"
  s.version = "0.15.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "bug_tracker_uri" => "https://github.com/dry-rb/dry-types/issues", "changelog_uri" => "https://github.com/dry-rb/dry-types/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/dry-rb/dry-types" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Solnica"]
  s.bindir = "exe"
  s.date = "2019-03-22"
  s.description = "Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc."
  s.email = ["piotr.solnica@gmail.com"]
  s.homepage = "https://github.com/dry-rb/dry-types"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Type system for Ruby supporting coercions, constraints and complex types like structs, value objects, enums etc."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<dry-core>, [">= 0.4.4", "~> 0.4"])
      s.add_runtime_dependency(%q<dry-inflector>, [">= 0.1.2", "~> 0.1"])
      s.add_runtime_dependency(%q<dry-container>, ["~> 0.3"])
      s.add_runtime_dependency(%q<dry-equalizer>, [">= 0.2.2", "~> 0.2"])
      s.add_runtime_dependency(%q<dry-logic>, [">= 0.5", "~> 0.5"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 11.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.3"])
      s.add_development_dependency(%q<dry-monads>, ["~> 0.2"])
      s.add_development_dependency(%q<yard>, ["~> 0.9.5"])
    else
      s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_dependency(%q<dry-core>, [">= 0.4.4", "~> 0.4"])
      s.add_dependency(%q<dry-inflector>, [">= 0.1.2", "~> 0.1"])
      s.add_dependency(%q<dry-container>, ["~> 0.3"])
      s.add_dependency(%q<dry-equalizer>, [">= 0.2.2", "~> 0.2"])
      s.add_dependency(%q<dry-logic>, [">= 0.5", "~> 0.5"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 11.0"])
      s.add_dependency(%q<rspec>, ["~> 3.3"])
      s.add_dependency(%q<dry-monads>, ["~> 0.2"])
      s.add_dependency(%q<yard>, ["~> 0.9.5"])
    end
  else
    s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
    s.add_dependency(%q<dry-core>, [">= 0.4.4", "~> 0.4"])
    s.add_dependency(%q<dry-inflector>, [">= 0.1.2", "~> 0.1"])
    s.add_dependency(%q<dry-container>, ["~> 0.3"])
    s.add_dependency(%q<dry-equalizer>, [">= 0.2.2", "~> 0.2"])
    s.add_dependency(%q<dry-logic>, [">= 0.5", "~> 0.5"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 11.0"])
    s.add_dependency(%q<rspec>, ["~> 3.3"])
    s.add_dependency(%q<dry-monads>, ["~> 0.2"])
    s.add_dependency(%q<yard>, ["~> 0.9.5"])
  end
end