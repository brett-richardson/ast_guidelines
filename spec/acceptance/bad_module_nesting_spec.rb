require 'spec_helper'

RSpec.describe "Testing poorly nested modules" do
  module GoodModule
    class GoodClass
    end
  end

  class BadClass
    module BadModule
    end
  end

  module VeryBadModule
    class VeryBadClass
      module RootOfAllEvil
      end
    end
  end

  specify do
    expect(AstGuidelines.check_bound_context GoodModule).to eq true
    expect(AstGuidelines.check_bound_context VeryBadModule).to eq false
    expect(AstGuidelines.check_bound_context BadClass).to eq false
  end
end
