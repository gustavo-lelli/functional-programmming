from functools import reduce

def is_prime(n, i=2):
    if n <= 2:
        return n == 2
    if n % i == 0:
        return False
    if i * i > n:
        return True
    return is_prime(n, i + 1)

def prime_gap(x, y):
    primes = list(filter(is_prime, range(x, y+1)))
    gaps = [primes[i+1] - primes[i] for i in range(len(primes)-1)]
    return reduce(lambda a, b: a if a > b else b, gaps) if gaps else 0

x = int(input())
y = int(input())

print(prime_gap(x, y))