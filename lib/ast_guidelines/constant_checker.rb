module AstGuidelines
  class ConstantChecker
    def initialize(base_constant)
      @base_constant = base_constant
      @already_checked = []
    end

    def call
      check base_constant
    end

    def check(constant)
      return true if already_checked.include? constant
      already_checked << constant

      return true if !class?(constant) && !module?(constant)
      return true if constant.constants.empty?
      return false if class?(constant) && all_children(constant).any? { |a| module? a }

      all_children(constant).all? { |a| check a }
    end

    def module?(constant)
      constant.class.ancestors.first == Module
    end

    def class?(constant)
      constant.class.ancestors.first == Class
    end

    def all_children(constant)
      constant.constants.map { |c| constant.module_eval "#{c}" }
    end

    private
    attr_reader :base_constant, :already_checked
  end
end
