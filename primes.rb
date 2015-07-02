class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    all = [*2..limit]
    no_primes = []
    all.each do |num| 
      if num > 2
        i = 2
        while (i < num) 
          if num % i == 0
            no_primes << num
            break
          end
          i += 1
        end
      end
    end
    "I'm working on it!"
    prime_numbers = all - no_primes
    
    prime_numbers.inject {|memo, prime| memo + prime}
  end
end


p Primes.sum_to(100)
