require 'spec_helper'

describe AstGuidelines do
  describe ".check_bound_context" do
    subject { described_class.check_bound_context constant }
    let(:constant) { AstGuidelines }

    it { is_expected.to eq true }
  end
end
