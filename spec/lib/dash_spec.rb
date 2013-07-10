require 'spec_helper'

describe Hahashie::Dash do
  before do
    class Person < Hahashie::Dash
      property :name, :required => true
      property :occupation, :default => "Rubyist"
      property :age
    end
  end

  it "should be Dash object" do
    @dash = Person.new(name: 'PName', age: '25')
    @dash2 = Person.new(name: 'Name2')

    expect(@dash).to be
    expect(@dash.name).to eq('PName')
    expect(@dash2.name).to eq('Name2')
    expect(@dash.age).to eq('25')
    expect(@dash2.age).to be_nil
  end

  it " check required field" do
    expect { Person.new }.to raise_error(ArgumentError)
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
    expect(@dash[:name]).to eq('PName')
    expect(@dash.occupation).to eq('Men')
    expect {@dash[:zzz] }.to raise_error(NoMethodError)
  end

  it 'check assignment' do
    new_name = 'NewName'
    @dash = Person.new(name: 'PName', age: '25', occupation: 'Men')
    @dash.name = new_name
    expect(@dash.name).to eq new_name
  end
end
