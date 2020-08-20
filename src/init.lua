local Vector1

local function lerp(a, b, t)
	return a + (b-a) * t
end

local function add(v1, v2)
	return Vector1.new(v1.X + v2.X)
end
local function sub(v1, v2)
	return Vector1.new(v1.X - v2.X)
end
local function mul(v, by)
	if typeof(by) == "number" then
		return Vector1.new(v.X * by)
	else
		return Vector1.new(v.X * by.X)
	end
end
local function div(v, by)
	if typeof(by) == "number" then
		return Vector1.new(v.X / by)
	else
		return Vector1.new(v1.X / v2.X)
	end
end


Vector1 = {}

function Vector1.new(x)
	return setmetatable({
		X = x,
		Magnitude = x,
	}, {
		__index = Vector1,
		__add = add,
		__sub = sub,
		__mul = mul,
		__div = div,
	})
end

function Vector1:Lerp(goal, alpha)
	return Vector1.new(lerp(self.X, goal.X, alpha))
end

function Vector1:Dot(other)
	return self.X * other.X
end

function Vector1:Cross(other)
	return 0
end

Vector1.Unit = 1


return Vector1
