require 'spec_helper'

describe Hahashie::Clash do
  it "should be Clash object" do
    clash = Hahashie::Clash.new
    clash.where(:abc => 'def').order(:created_at)

    expect(clash).to be
    expect(clash[:order]).to eq(:created_at)
    expect(clash[:where][:abc]).to eq('def')
  end

  it "should be Clash with bank" do
    clash = Hahashie::Clash.new
    clash.where!.abc('def').ghi(123)._end!.order(:created_at)
    p clash
    p clash[:where]

    expect(clash[:where][:abc]).to eq('def')
    expect(clash[:where][:ghi]).to eq(123)
    expect(clash[:order]).to eq(:created_at)
  end
end
