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


  it 'merge clash hashes' do
    # Multiple hashes are merged automatically
    c1 = Hahashie::Clash.new
    c2 = Hahashie::Clash.new
    c1.where(:abc => 'def').where(:hgi => 123)
    c2.where!.abc('def').there!.ghi(123).zz('xx').yy('cc')._end!.order(:created_at)._end!.lala("ppp").where(nnew: 'york')

    # c # => {:where => {:abc => 'def', :hgi => 123}}
    expect(c1[:where]).to eq({abc: 'def', hgi: 123})
    expect(c2[:where][:nnew]).to eq('york')
  end

end
