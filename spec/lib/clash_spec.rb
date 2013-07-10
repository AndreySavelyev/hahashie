require 'spec_helper'

describe Hahashie::Clash do
  it "should be Clash object" do
    clash = Hahashie::Clash.new
    clash.where(:abc => 'def').order(:created_at)

    p clash

    expect(clash).to be
    expect(clash[:order]).to eq(:created_at)
    expect(clash[:where][:abc]).to eq('def')
  end
end
