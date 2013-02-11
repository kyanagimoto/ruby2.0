describe "to_h" do
  sample = Struct.new(:hoge)
  subject { sample.new(1) }
  it { subject.to_h.class.should == Hash }
  it { subject.to_h[:hoge] == "1"}
end
