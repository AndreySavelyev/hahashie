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
    clash.where!.abc('def').there!.ghi(123).zz('xx').yy('cc')._end!.order(:created_at)._end!.lala("ppp")
    # {"where"=>{:abc=>"def", "there"=>{:ghi=>123, :zz=>"xx", :yy=>"cc"}, :order=>:created_at}, :lala=>"ppp"}
    expect(clash[:lala]).to eq('ppp')
    expect(clash[:where][:abc]).to eq('def')
    expect(clash[:where][:there][:ghi]).to eq(123)
  end

end
