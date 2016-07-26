require 'spec_helper'

RSpec.describe AstGuidelines::ConstantChecker do
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

  subject(:instance) { described_class.new constant }
  let(:constant) { GoodModule }

  describe "#call" do
    subject { instance.call }
    it { is_expected.to eq true }

    context "when constant is a class with a module inside" do
      let(:constant) { BadClass }
      it { is_expected.to eq false }
    end

    context "when constant is a module with a class, then a module inside" do
      let(:constant) { VeryBadModule }
      it { is_expected.to eq false }
    end
  end
end
