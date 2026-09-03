ENT.Base = "base_brush"
ENT.Type = "brush"

local curMap = game.GetMap()
if MAPS[curMap] == nil then return end

local kothOrigin = MAPS[curMap].kothOrigin or Vector(0, 0, 0)
local kothSize = MAPS[curMap].kothSize or Vector(128, 128, 128)

ENT.Origin = kothOrigin
ENT.Size = kothSize

if SERVER then
    function ENT:Initialize()
        self:SetSolid(SOLID_BBOX)
        self:SetCollisionBounds(self.Origin + self.Size, self.Origin - self.Size)
    end

    function ENT:StartTouch(ply)
        if !ply:IsPlayer() then return end

        table.insert(hillOccupants, ply)
        ply:SetNWBool("onOBJ", true)
        ply:SendLua("surface.PlaySound('tmui/objsuccess.wav')")

        HillStatusCheck()
    end

    function ENT:EndTouch(ply)
        if !ply:IsPlayer() then return end

        table.RemoveByValue(hillOccupants, ply)
        ply:SetNWBool("onOBJ", false)
        HillStatusCheck()
    end
end
