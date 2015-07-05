class Primes
  def self.is_prime?(number)
    [*2..(number/2)].each do |i|
      if number % i == 0
        return false
      end
    end
    return true
  end
    # if ([*2..(number/2)].select {|n| number % n == 0}).length == 0
    #   return true
    # else 
    #   return false
    # end
  

  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    all = [*2..limit]
    prime_numbers = []
    all.each do |n|
      if is_prime?(n)
        prime_numbers << n
      end
    end
    prime_numbers.inject {|memo, n| memo + n}
  end
end


@sum = Primes.sum_to(2000)