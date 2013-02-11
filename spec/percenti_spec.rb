describe do
  subject {%i[hoge fuga]}
  it{subject.class.should == Array}
  it{subject[0].should == "hoge".to_sym}
  it{subject[1].should == "fuga".to_sym}
end
