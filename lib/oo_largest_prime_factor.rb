# Enter your object-oriented solution here!

require_relative 'largest_prime_factor'

class LargestPrimeFactor
  def initialize(number)
    @number = largest_prime_factor(number)
  end

  def number
    @number
  end
end