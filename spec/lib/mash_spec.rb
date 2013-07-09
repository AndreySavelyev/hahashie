require 'spec_helper'

describe Hahashie::Mash do
  it "should be Mash object" do
      mash = Hahashie::Mash.new
      mash.should be
  end

  it "should be Mash object's attribute" do
    mash = Hahashie::Mash.new
    mash.name.should be_nil
 end

  it "should be Mash object's correct attribute" do
    mash = Hahashie::Mash.new({name: "test"})
    mash.name.should eq "test"
 end

 it 'check key existing' do
  mash = Hahashie::Mash.new({name: "test"})
  mash.name?.should be_true
  mash.age?.should be_false
 end

end