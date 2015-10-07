require 'pry'

def triplets(n)
  result = []
  (5..n).each do |c|
    (4..c-1).each do |b|
      (3..b-1).each do |a|
        result.push([a, b, c]) if a*a + b*b == c*c
      end
    end
  end
  result
end

binding.pry