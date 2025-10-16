-- Sieve of Eratosthenes implementation in Lua
-- mostly AI generated

local function cairo(n)
    -- Return a table of primes strictly less than n
    if n <= 2 then
        return {}
    end

    local limit = n - 1
    local is_prime = {}
    for i = 1, limit do
        is_prime[i] = true
    end
    is_prime[1] = false -- 1 is not prime

    local sqrt_n = math.floor(math.sqrt(limit))
    for i = 2, sqrt_n do
        if is_prime[i] then
            for j = i * i, limit, i do
                is_prime[j] = false
            end
        end
    end

    local primes = {}
    for i = 2, limit do
        if is_prime[i] then
            table.insert(primes, i)
        end
    end

    return primes
end

-- Human coded
io.write("from 1 to n: ")
n = io.read("*n")
Q = cairo(n)

for i = 1, #Q do
    io.write(Q[i] .. " | ")
end