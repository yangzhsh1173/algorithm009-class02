# @param {Float} x
# @param {Integer} n
# @return {Float}
# 分治
def my_pow(x, n)
    m = n
    m = -n if n < 0
    tmp = resursive_pow(x, m)
    n > 0 ? tmp : 1.0 / tmp
end

def resursive_pow(x, n)
    # terminator
    return 1.0 if n == 0

    # split problems & drill down
    half_result = my_pow(x, n / 2)

    # merge result
    n.even? ? half_result * half_result : half_result * half_result * x
end

# 国际站看到的解法
def my_pow(x, n)
    if n==0
     return 1
    end
    if n<0
      n=-n
      x = 1/x
    end
   
    return (n%2==0)? my_pow(x*x, n/2): x*my_pow(x*x,n/2)
end