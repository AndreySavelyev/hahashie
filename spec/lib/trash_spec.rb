require 'spec_helper'

describe Hahashie::Trash do
  before do
    class Person < Hahashie::Trash
      property :first_name, from: :firstName
    end
  end

  it "should be Trash object" do
    @trash = Person.new(first_name: 'PName')
    @trash2 = Person.new(firstName: 'Name2')

    expect(@trash).to be
    expect(@trash.first_name).to eq('PName')
    expect(@trash2.first_name).to eq('Name2')
  end
end
