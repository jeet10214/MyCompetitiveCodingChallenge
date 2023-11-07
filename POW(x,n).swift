func myPow(_ x: inout Double, _ n: Int) -> Double {
    var ans: Double = 1.0
    var nn: CLong = n < 0 ? -1 * n : n
    var newX = x
    while nn > 0 {
        if nn % 2 == 1 {
            ans = ans * newX
            nn = nn - 1
        } else {
            newX = newX * newX
            nn = nn / 2
        }
    }
    
    if n < 0 {
        ans = Double(1.0) / Double(ans)
    }
    
    return ans
    
}

var pow = 2.00000
myPow(&pow, -2)
