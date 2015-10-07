class Triplet
  attr_reader :t

  def initialize(a, b, c)
    @t = [a, b, c].sort # sort to simplify the .pythagorean?
  end

  def sum
    t.inject(:+)
  end

  def product
    t.inject(:*)
  end

  def pythagorean?
    t[0]**2 + t[1]**2 == t[2]**2
  end

  def self.where(**args)
    bottom_limit  = args[:min_factor] || 3    # default value to simplify the method
    bottom_limit  = 3 if bottom_limit < 3     # smallest pythagorean triplet starts with 3
    upper_limit   = args[:max_factor] || 100  # default value to avoid errors
    sum_filter    = args[:sum] || nil

    pythagorean_triplets = []
    # tp avoid duplicates, only consider a < b < c
    (bottom_limit+2..upper_limit).each do |c|
      (bottom_limit+1..c-1).each do |b|
        (bottom_limit..b-1).each do |a|
          new_triplet = Triplet.new(a, b, c)
          if new_triplet.pythagorean?
            pythagorean_triplets << new_triplet unless sum_filter && sum_filter != new_triplet.sum
          end
        end
      end
    end
    pythagorean_triplets
  end
end