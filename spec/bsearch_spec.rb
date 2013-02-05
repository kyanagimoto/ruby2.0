describe "bsearch" do
  subject { (1..300).to_a }
  it { subject.bsearch{ |i| 50 <=> i }.should == 50 }
  it { subject.bsearch{ |i| i <=> 50 }.should be_nil }
end

describe "bsearch greater equal" do
  subject { [0, 3, 5, 10, 12] }
  it { subject.bsearch{ |i| i >= 3 }.should == 3 }
  it { subject.bsearch{ |i| i >= 4 }.should == 5 }
  it { subject.bsearch{ |i| i >= -1 }.should == 0 }
  it { subject.bsearch{ |i| i >= 20 }.should be_nil }
end

describe "bsearch any" do
  subject { [0, 3, 5, 10, 12] }
  it("# try to find v such that 4 <= v < 8") {
    r = subject.bsearch{ |i| 1 - i / 4 }
    (r == 3 || r == 5).should be_true
  }
end
