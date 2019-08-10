# -*- encoding: utf-8 -*-
# stub: dry-logic 0.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "dry-logic"
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Piotr Solnica"]
  s.date = "2019-04-18"
  s.email = ["piotr.solnica@gmail.com"]
  s.homepage = "https://github.com/dry-rb/dry-logic"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Predicate logic with rule composition"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_runtime_dependency(%q<dry-core>, ["~> 0.2"])
      s.add_runtime_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
      s.add_dependency(%q<dry-core>, ["~> 0.2"])
      s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<concurrent-ruby>, ["~> 1.0"])
    s.add_dependency(%q<dry-core>, ["~> 0.2"])
    s.add_dependency(%q<dry-equalizer>, ["~> 0.2"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
