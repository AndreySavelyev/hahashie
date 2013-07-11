require 'spec_helper'

describe Hahashie::Mash do
  it "should be Mash object" do
    mash = Hahashie::Mash.new
    mash.should be
    expect(mash).to be
  end

  it "should be Mash object's attribute" do
    mash = Hahashie::Mash.new
    expect(mash.name).to be_nil
  end

  it "should be Mash object's correct attribute" do
    mash = Hahashie::Mash.new({name: "test"})
    expect(mash.name).to eq('test')
  end

  it 'check key existing' do
    mash = Hahashie::Mash.new({name: "test"})
    expect(mash.name?).to be_true
    expect(mash.age?).to be_false
  end

  it "check nested attribute" do
    mash = Hahashie::Mash.new({name: {one: "1", two: "2", three: {ololo: 'trololo'} }, age: '25'})
    expect(mash.name.class).to be Hahashie::Mash
  end

  it 'check assignment' do
    mash = Hahashie::Mash.new({name: "test"})
    mash.name = 'ololo'
    expect(mash.name).to eq('ololo')
  end

  it "check multi-level assigment" do
    mash = Hahashie::Mash.new
    mash.xer!.name = "123"
    expect(mash.xer.class).to be Hahashie::Mash
    expect(mash.xer.name).to eq('123')
  end

  it 'check underscore access' do
    mash = Hahashie::Mash.new({a: 'aa', b: {c: 'cc'}} )
    expect(mash.a_).to eq('aa')
    expect(mash.b_.c?).to be_true
    expect(mash.b_).to be_true
    expect(mash.b_.d?).to be_false
    expect(mash.t_.z?).to be_false
  end
end
