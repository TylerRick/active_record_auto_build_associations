# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_record/auto_build_associations/version"

Gem::Specification.new do |s|
  s.name        = "active_record_auto_build_associations"
  s.version     = ActiveRecord::AutoBuildAssociations.version
  s.authors     = ["Tyler Rick"]
  s.email       = ["tyler@tylerrick.com"]
  s.homepage    = ""
  s.summary     = %q{Automatically calls `build_assoc_model` for you, ensuring that model.assoc_model is always an instance of model and not nil.}
  s.description = s.summary

  s.add_dependency 'activerecord'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
