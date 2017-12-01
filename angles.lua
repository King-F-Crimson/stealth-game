angles = {}

function angles.is_angle_between_arc_angles(angle, arc_angle_1, arc_angle_2)
    local start_angle, end_angle = angles.determine_starting_angle_of_arc(arc_angle_1, arc_angle_2)

    local angle_from_angle_1_to_angle_2_clockwise = angles.normalize(arc_angle_1 - arc_angle_2)

    if angle_from_angle_1_to_angle_2_clockwise < math.pi then
        start_angle, end_angle = arc_angle_2, arc_angle_1
    else
        start_angle, end_angle = arc_angle_1, arc_angle_2
    end

    angle, start_angle, end_angle = angles.normalize(angle), angles.normalize(start_angle), angles.normalize(end_angle)

    -- Check if end angle loops.
    if end_angle < start_angle then
        return angle <= end_angle or angle >= start_angle
    else
        return angle <= end_angle and angle >= start_angle
    end
end

-- Arc will always be half circle or smaller.
-- Starting angle counter-clockwise.
function angles.determine_starting_angle_of_arc(arc_angle_1, arc_angle_2)
    local start_angle, end_angle

    local angle_from_angle_1_to_angle_2_clockwise = angles.normalize(arc_angle_1 - arc_angle_2)

    if angle_from_angle_1_to_angle_2_clockwise < math.pi then
        start_angle, end_angle = arc_angle_2, arc_angle_1
    else
        start_angle, end_angle = arc_angle_1, arc_angle_2
    end

    return start_angle, end_angle
end

-- Make angle ranges from 0 to 2 pi instead of negative values or more than 2 pi.
function angles.normalize(angle)
    return angle % (math.pi * 2)
end

function angles.sort_counter_clockwise_from_starting_angle(starting_angle, input_angles)
    local function order(a, b) 
        return angles.normalize(a - starting_angle) < angles.normalize(b - starting_angle)
    end

    table.sort(input_angles, order)
end