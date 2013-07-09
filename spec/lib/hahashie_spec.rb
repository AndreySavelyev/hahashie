require 'spec_helper'

describe Hahashie do
  it 'should stub spec' do
    true.should be_true
  end

  it "should be Mash object" do
      mash = Hahashie::Mash.new
      mash.should be
  end
end
