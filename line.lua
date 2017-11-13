line = {}

function line.from_two_coordinates(x1, y1, x2, y2)
    local m = (y1 - y2)/(x1 - x2)
    local c = y1 - (x1 * m)

    return m, c
end

function line.from_coordinate_and_angle(angle, x, y)
    local m = math.tan(angle)
    local c = y - (x * m)

    return m, c
end

function line.find_intersection(m1, c1, m2, c2)
    local x = (c2 - c1) / (m1 - m2)
    local y = m1 * x + c1

    return x, y
end

function line.is_point_in_line(x1, y1, x2, y2, point_x, point_y)
    local m, c = line.from_two_coordinates(x1, y1, x2, y2)

    if point_y == point_x * m + c then
        if line.in_between(x1, x2, point_x) then
            return true
        end
    end

    return false
end

function line.in_between(start, stop, point)
    if start > stop then
        return point <= start and point >= stop
    else
        return point >= start and point <= stop
    end
end