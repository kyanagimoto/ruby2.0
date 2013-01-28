require 'timeout'

module Lazy
  def self.lazy_func
    timeout(1) do
      (1..Float::INFINITY).lazy.select{ |i| i % 3 == 0 }.first(5)
    end
  end

  def self.not_lazy_func
    timeout(1) do
      (1..Float::INFINITY).select{ |i| i % 3 == 0 }.first(5)
    end
  end
end

describe Lazy do
  context "lazy" do
    it { Lazy::lazy_func.should == [3, 6, 9, 12, 15] }
  end

  context "timeout" do
    it { lambda{ Lazy::not_lazy_func }.should raise_error(TimeoutError)  }
  end
end
