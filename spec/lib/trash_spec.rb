require 'spec_helper'

describe Hahashie::Trash do
  before do
    class Person2 < Hahashie::Trash
      property :original, from: :copy
      property :first_name, from: :firstName
      property :login, transform_with: lambda { |v| v.upcase }
      property :id, transform_with: lambda { |v| v.to_i }
    end
  end

  it "should be Trash object" do
    @trash = Person2.new(original: 'PName', firstName: "Men")
    @trash2 = Person2.new(copy: 'Name2', first_name: "123")

    s = "555"
    @trash2.first_name = s

    expect(@trash).to be
    expect(@trash.original).to eq('PName')
    expect(@trash2.original).to eq('Name2')
    expect(@trash.first_name).to eq("Men")
    expect(@trash2.first_name).to eq(s)
  end

  it 'check lambdas' do
    @trash = Person2.new(original: 'ololo', login: 'aaa', id: '244')
    expect(@trash.login).to eq('AAA')
    expect(@trash.id.class).to eq(Fixnum)
  end

end
