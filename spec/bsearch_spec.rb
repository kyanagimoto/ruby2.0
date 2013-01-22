describe "bsearch" do
  subject { (1..300).to_a }
  it { subject.bsearch{ |i| 50 <=> i }.should == 50 }
  it { subject.bsearch{ |i| i <=> 50 }.should be_nil }
end
