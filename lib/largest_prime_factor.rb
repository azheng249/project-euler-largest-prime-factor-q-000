# Enter your procedural solution here!

# Program finds the largest prime factor of a number
# Finds every prime number up until the square root of the number using the Sieve of Eratosthenes algorithm.
# Source for eratosthenes() code: http://rosettacode.org/wiki/Sieve_of_Eratosthenes#With_a_wheel
def largest_prime_factor(n)
  square_root = Math.sqrt(n)
  primes = eratosthenes(square_root)
  prime_factors_of_n = []
  i = 0

  # Loop starts at the beginning of primes and checks if n is divisible by the prime number
  # When it finds a prime factor it is pushed into prime_factors_of_n and n is divided by that number
  # Stops when n is 1, because of prime factorization. All natural numbers can be repeatedly divided by prime factors until it equals 1.
  until n == 1
    if n % primes[i] == 0
      prime_factors_of_n.push(primes[i])
      n /= primes[i]
      i -= 1
    end
    i += 1
  end

# The last element in prime_factors_of_n should be the largest prime factor of n
  return prime_factors_of_n.last
end

# Sieve of Eratosthenes- an efficient algorithm for generating prime numbers given a limit
# Explanation: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
def eratosthenes(n)
  # For odd i, if i is prime, nums[i >> 1] is true.
  # Set false for all multiples of 3.
  nums = [true, false, true] * ((n + 5) / 6)
  nums[0] = false  # 1 is not prime.
  nums[1] = true   # 3 is prime.

  # Outer loop and both inner loops are skipping multiples of 2 and 3.
  # Outer loop checks i * i > n, same as i > Math.sqrt(n).
  i = 5
  until (m = i * i) > n
    if nums[i >> 1]
      i_times_2 = i << 1
      i_times_4 = i << 2
      while m <= n
        nums[m >> 1] = false
        m += i_times_2
        nums[m >> 1] = false
        m += i_times_4  # When i = 5, skip 45, 75, 105, ...
      end
    end
    i += 2
    if nums[i >> 1]
      m = i * i
      i_times_2 = i << 1
      i_times_4 = i << 2
      while m <= n
        nums[m >> 1] = false
        m += i_times_4  # When i = 7, skip 63, 105, 147, ...
        nums[m >> 1] = false
        m += i_times_2
      end
    end
    i += 4
  end

  primes = [2]
  nums.each_index {|i| primes << (i * 2 + 1) if nums[i]}
  primes.pop while primes.last > n
  return primes
end
