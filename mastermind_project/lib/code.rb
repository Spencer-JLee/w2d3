require "byebug"

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all?{ |n| POSSIBLE_PEGS.include?(n.upcase)}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = []

      arr.each do |n|
        @pegs.push(n.upcase)
      end
    else
      raise
    end
  end

  def pegs
    @pegs
  end

  def self.random(num)
    arr = []
    colors = ["R", "G", "B", "Y"]

    (1..num).each do |i|
      arr.push(colors[rand(4)])
    end

    Code.new(arr)
  end

  def self.from_string(str)
    colors = str.split("")
    Code.new(colors)
  end

  def [](num)
    @pegs[num]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0

    code.pegs.each_with_index do |n, i|
      count += 1 if n == @pegs[i]
    end

    count
  end

  def num_near_matches(code)
    count = 0
    arr = []
    arr1 = []

    code.pegs.each_with_index do |n, i|
      if n != @pegs[i]
        arr.push(n)
        arr1.push(@pegs[i])
      end
    end

    arr.each_with_index do |n, i|
      if arr1.include?(n)
        count += 1
        arr1[arr1.index(n)] = nil
      end
    end

    count
  end

  def ==(code)
    return false if code.length != length
    num_exact_matches(code) == length
  end
end
