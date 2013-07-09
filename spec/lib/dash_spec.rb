require 'spec_helper'

describe Hahashie::Dash do

  before do
    class Person < Hahashie::Dash
      # property :name, :required => true
      # property :occupation, :default => 'Rubyist'
      property :email
    end
    @dash = Person.new
  end

  it "should be Dash object" do
    expect(@dash).to be
    # p @dash.required_options
    # p @dash.default_options
    p @dash.properties
  end

end
