require 'benchmark'

array = (0..100000).to_a

benchmark = Benchmark.bm(10) do |x|
  x.report("Ruby 2.0:   ") do
    100.times { array.bsearch { |e| 7777 <=> e } }
  end
end

puts
benchmark = Benchmark.bm(10) do |x|
  x.report("select  :   ") do
    100.times { array.select { |e| 7777 == e } }
  end
end
