require 'spec_helper'

describe Hahashie::Mash do
  it "should be Mash object" do
      mash = Hahashie::Mash.new
      mash.should be
  end
end
