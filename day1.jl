codes = readlines("data/day1.txt")
test = readlines("test/day1.txt")

# Part 1
# match the first and last number of each line
function matchn(codes::Array{String,1})
    s = 0
    for l in codes
        first = match(r"([0-9])", l).captures[1] |> x -> parse(Int, x)
        last = match(r"([0-9])\D*$", l).captures[1] |> x -> parse(Int, x)
        s = s+(first*10)+last
    end
    println("All numbers together are $s")
end

#correct solution: 54697
matchn(codes)

# Part 2
# replace all spelled out numbers with their digit equivalent
function matchn_str(codes::Array{String,1})
    s = 0
    for l in codes
        l = replace(
            l,
            "one" => "1",
            "two" => "2",
            "three" => "3",
            "four" => "4",
            "five" => "5",
            "six" => "6",
            "seven" => "7",
            "eight" => "8",
            "nine" => "9",
        )
        first = match(r"([0-9])", l).captures[1] |> x -> parse(Int, x)
        last = match(r"([0-9])\D*$", l).captures[1] |> x -> parse(Int, x)
        s = s+(first*10)+last
    end
    println("With the words counted the solution is: $s")
end

matchn_str(codes)
