$LOAD_PATH.unshift File.expand_path '../lib', __FILE__
require 'ast_guidelines/version'

Gem::Specification.new do |s|
	s.name         = 'ast_guidelines'
	s.summary      = 'AST backed ruby guideline enforcer'
	s.description  = 'Check code architecture'
	s.version      =  AstGuidelines::VERSION
	s.date         = '2016-06-26'
	s.homepage     = 'https://github.com/brett-richardson/ast_guidelines'
	s.authors      = ['Brett Richardson']
  s.email        = ['brett.richardson.nz@gmail.com']
	s.require_path = 'lib'
	s.files        = Dir.glob('lib/**/*') + %w{Gemfile Guardfile MIT-LICENSE README.md}

  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'parser', '~> 2.2'

	s.add_development_dependency 'bundler'
	s.add_development_dependency 'rspec'
	s.add_development_dependency 'guard'
	s.add_development_dependency 'guard-rspec'
	s.add_development_dependency 'pry'
end
