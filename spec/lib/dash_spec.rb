require 'spec_helper'

describe Hahashie::Dash do
  before do
    class Person < Hahashie::Dash
      property :name, :required => true
      property :occupation, :default => "Rubyist"
      property :name
      property :age
    end
  end

  it "should be Dash object" do
    @dash = Person.new(name: 'PName', age: '25')
    #@dash1 = Person.new

    expect(@dash).to be
    expect(@dash.name).to eq('PName')
    expect(@dash.age).to eq('25')
  end

  it "should be Dash object with default occupation" do
    @dash = Person.new(name: 'PName', age: '25')

    expect(@dash).to be
    expect(@dash.name).to eq('PName')
    expect(@dash.occupation).to eq("Rubyist")
  end

  it "should be Dash object with occupation instead default" do
    @dash = Person.new(name: 'PName', age: '25', occupation: 'Men')

    expect(@dash).to be
    expect(@dash.name).to eq('PName')
    expect(@dash.occupation).to eq('Men')
  end

  it "should be Dash object with required name" do
    @dash = Person.new(name: 'PName', age: '25')

    expect {@dash.name = "333"}.to raise_error(ArgumentError)
  end
end
