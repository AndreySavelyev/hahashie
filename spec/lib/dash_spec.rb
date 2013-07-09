require 'spec_helper'

describe Hahashie::Dash do

  before do
    class Person < Hahashie::Dash
      # property :name, :required => true
      # property :occupation, :default => 'Rubyist'
      property :name
      property :age
    end
    @dash = Person.new(name: 'PName', age: '25')
  end

  it "should be Dash object" do
    expect(@dash).to be
    expect(@dash.name).to eq('PName')
    expect(@dash.age).to eq('25')
  end
end