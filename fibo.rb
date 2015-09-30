
def fibo(n)
  _arr = [0, 1]
  x1, x2 = 0, 1
  0.upto(n) do |x|
    x3 = x1+x2
    _arr.push(x3)
    x1,x2 = x2,x3
  end
  _arr
end

puts fibo(10)
