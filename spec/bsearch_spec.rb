describe "bsearch" do
  before(:all) { @array = (1..300).to_a }
  subject { (1..300).to_a }
  it { @array.bsearch{ |i| 50 <=> i }.should == 50 }
  it { @array.bsearch{ |i| i <=> 50 }.should be_nil }
end
