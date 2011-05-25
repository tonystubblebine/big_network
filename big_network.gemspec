# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{big_network}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tony Stubblebine"]
  s.date = %q{2010-10-02}
  s.email = %q{tony+bignetwork@tonystubblebine.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "app/controllers/relationships_controller.rb",
     "app/models/relationship.rb",
     "app/views/relationships/_create.html.erb",
     "app/views/relationships/_form.html.erb",
     "app/views/relationships/_show.html.erb",
     "app/views/relationships/create.js.erb",
     "app/views/relationships/edit.html.erb",
     "app/views/relationships/index.html.erb",
     "app/views/relationships/new.html.erb",
     "app/views/relationships/show.html.erb",
     "lib/big_network.rb",
     "lib/big_network/engine.rb",
     "lib/big_network/railties/tasks.rake",
     "lib/generators/big_network/big_network_generator.rb",
     "lib/generators/big_network/templates/migration.rb"
  ]
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Social network relationship engine.}
  s.test_files = [
    "test/functional/relationships_controller_test.rb",
     "test/unit/relationship_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
