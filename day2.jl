function parse_game(game::String)
    id, game_draws = split(game, ":")
    id = filter(isdigit, id) |> x -> parse(Int, x)
    game_draws = split(game_draws, ";")
    drawn_cubes = []
    for draw in game_draws
        colors = split(draw, ",")
        r,g,b = 0,0,0
        for c in colors
            if occursin("red", c)
                r = filter(isdigit, c) |> x -> parse(Int, x)
            elseif occursin("green", c)
                g = filter(isdigit, c) |> x -> parse(Int, x)
            elseif occursin("blue", c)
                b = filter(isdigit, c) |> x -> parse(Int, x)
            end
        end
        push!(drawn_cubes, (r,g,b))
    end
    return (id, drawn_cubes)
end

function islegal(game, r, g, b)
    draws = game[2]
    if any(x -> x[1] > r || x[2] > g || x[3] > b, draws)
        return false
    end
    return true
end

function score_possible(games, r, g, b)
    s = 0
    for game in games
        if islegal(game, r, g, b)
            s += game[1]
        end
    end
    println("The score of possible games is $s")
end

function lowest_set(game)
    r, g, b = 0, 0, 0
    draws = game[2]
    r = maximum(x -> x[1], draws)
    g = maximum(x -> x[2], draws)
    b = maximum(x -> x[3], draws)
    return (r, g, b)
end

function score_power(games)
    s = 0
    for game in games
        score = prod(lowest_set(game))
        s += score
    end
    println("The combined power of all games is $s")
end

games = readlines("data/day2.txt")
games = parse_game.(games)
score_possible(games, 12, 13, 14)
score_power(games)
