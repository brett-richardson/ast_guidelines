require 'active_support/core_ext/object'
require 'active_support/core_ext/array'

require 'ast_guidelines/version'
require 'ast_guidelines/constant_checker'

module AstGuidelines
  module_function

  def check_bound_context(constant)
    ConstantChecker.new(constant).call
  end
end

