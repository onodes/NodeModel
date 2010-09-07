class Array
  def sum
    ans = 0
    self.each{|i|
      ans += i
    }
    return ans
  end
end
