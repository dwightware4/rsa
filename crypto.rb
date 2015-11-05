require 'byebug'

def generate_key_pair
  p = random_prime
  _q = generate_q(p)
  r = (p - 1) * (_q - 1)
  e = generate_e(r)
  d = generate_d(e, r)
  { public_key: [e, r], private_key: [d, r] }
end

def generate_d(e, n)
  d = 1
  d += 1 until (d * e) % n == 1
  d
end

def generate_e(n)
  e = n - 1
  until e.gcd(n) == 1
    e -= 1
  end
  e
end

def generate_q(p)
  _q = random_prime
  until p != _q
    _q = random_prime
  end
  _q
end

def random_prime
  prime = 4
  until is_prime?(prime)
    prime = rand(2..255)
  end
  prime
end

def is_prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end
debugger
puts generate_key_pair
