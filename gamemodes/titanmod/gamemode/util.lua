-- format given number with commas (###### -> ###,###)
function string.FormatComma(val)
	local formatted = tostring(val)
	local num

	while true do
		formatted, num = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")
		if (num == 0) then break end
	end

	return formatted
end

-- convert units to meters
function math.UnitsToMeters(units)
	return math.Round(units * 0.01905)
end

-- better table.Random() for sequential tables
function table.SeqRandom(tbl)
	return tbl[math.random(#tbl)]
end

local blurMat = Material("pp/blurscreen")
local blurCol = Color(255, 255, 255)

function BlurPanel(panel, strength, passes)
	if panel == nil or !ispanel(panel) then return end

	local x, y = panel:LocalToScreen(0, 0)
	local w, h = panel:GetSize()

	render.SetScissorRect(x, y, x + w, y + h, true)

	surface.SetMaterial(blurMat)
	surface.SetDrawColor(blurCol)

	for i = 1, (passes or 3) do
		blurMat:SetFloat("$blur", (i / (passes or 3)) * (strength or 3))
		blurMat:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(-x, -y, ScrW(), ScrH())
	end

	render.SetScissorRect(0, 0, 0, 0, false)
end

function BlurRect(x, y, w, h, strength, passes)
	surface.SetMaterial(blurMat)
	surface.SetDrawColor(blurCol)

	render.SetScissorRect(x, y, x + w, y + h, true)
		for i = 1, (passes or 3) do
			blurMat:SetFloat("$blur", (i / (passes or 3)) * (strength or 3))
			blurMat:Recompute()
			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		end
	render.SetScissorRect(0, 0, 0, 0, false)
end
