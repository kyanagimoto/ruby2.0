module KeywordParam
  def self.func(hoge: "str", fuga: 123)
    "hoge: #{hoge}, fuga: #{fuga}"
  end

  def self.func2(str, num, add_str: "add_str", add_num: 10)
    "str: #{str}, num: #{num}, add_str: #{add_str}, add_num: #{add_num}"
  end

  def self.option_param(num: num, str: str, **options)
    "num: #{num}, str: #{str}, options: #{options.inspect}"
  end
end

describe KeywordParam do
  context "default" do
    it { KeywordParam::func.should == "hoge: str, fuga: 123" }
  end

  context "argument" do
    it { KeywordParam::func(hoge: "hhh").should == "hoge: hhh, fuga: 123" }
    it { KeywordParam::func(fuga: 33).should == "hoge: str, fuga: 33" }
  end

  context "argument error" do
    it { lambda{ KeywordParam::func("abc", 33) }.should raise_error(ArgumentError) }
    it { lambda{ KeywordParam::func(no_param: "aaa") }.should raise_error(ArgumentError) }
  end

  context "include normal param" do
    it { KeywordParam::func2("ss", 3).should == "str: ss, num: 3, add_str: add_str, add_num: 10" }
    it { KeywordParam::func2("ss", 3, add_num: 5).should == "str: ss, num: 3, add_str: add_str, add_num: 5" }
    it { KeywordParam::func2("ss", 3, add_str: "aaa").should == "str: ss, num: 3, add_str: aaa, add_num: 10" }
  end

  context "option params" do
    it { KeywordParam::option_param(str: "aa", num: 88).should == "num: 88, str: aa, options: {}" }
    it { KeywordParam::option_param(str: "aa", num: 88,
                                    opt1: "op1",
                                    opt2: "op2").should == 'num: 88, str: aa, options: {:opt1=>"op1", :opt2=>"op2"}' }
  end
end
