def egcd(a, b)
 return 1, 0 if b == 0
 q, r = a.divmod b
 s, t = egcd(b, r)
 return t, s - q * t
end
def modinv(z, n)
 return mod(egcd(z, n)[0], n)
end
def mod(n, m)
 return (n % m + m) % m
end
def modpow(b, e, m)
 r = 1
 while e > 0 do
  if e % 2 == 1 then
   r = (r * b) % m
  end
  b = (b * b) % m
  e >>= 1
 end
 return r
end
gets.to_i.times{
 a, b, x = gets.split.map(&:to_i)
 if b >= 0 then
  puts modpow(a, b, x)
 else
  puts modpow(modinv(a, x), -b, x)
 end
}
