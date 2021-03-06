require 'rake'

desc 'Default: run unit tests.'
task :default => :test

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'css_naked'
  gem.summary = 'Rails plugin to disable stylesheets during the CSS Naked Day event'
  gem.description = 'This plugin makes a Rails application strip off the stylesheets during the CSS Naked Day event. It does this by modifying the stylesheet_link_tag helper to skip including stylesheets into the layout during the event.'
  gem.homepage = 'http://github.com/zargony/css_naked'
  gem.license = 'MIT'
  gem.authors = ['Andreas Neuhaus']
  gem.add_dependency 'activesupport', '~> 0'
  gem.add_dependency 'actionpack', '~> 0'
  gem.has_rdoc = false
  gem.add_development_dependency 'mocha', '~> 0'
end
Jeweler::GemcutterTasks.new

require 'rake/testtask'
task :test => :check_dependencies
desc 'Test the css_naked plugin.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rdoc/task'
desc 'Generate documentation for the css_naked plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "CSS Naked Day Rails Plugin #{version}"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
