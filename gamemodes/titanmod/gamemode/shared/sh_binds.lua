local sp = game.SinglePlayer()
local intermissionLength = GetConVar("sv_tm_intermission_length")
local gunGameSize = GetConVar("sv_tm_mode_gungame_ladder_size")

local isGunGame = GetGlobal2String("ActiveGamemode", "FFA") == "Gun Game"

hook.Add("PlayerButtonDown", "TMBinds", function(ply, button)
	if (CLIENT or sp) and IsFirstTimePredicted() then
		if !IsFirstTimePredicted() then return end
		if GetGlobal2Bool("tm_intermission") then return end

		if ply:GetInfoNum("tm_quickswitching", 1) == 1 then
			if !isGunGame then
				if button == ply:GetInfoNum("tm_primarybind", KEY_1) then
					local weapon = ply:GetWeapon(ply:GetNWString("loadoutPrimary"))

					if weapon != NULL then
						input.SelectWeapon(weapon)
					end
				end

				if button == ply:GetInfoNum("tm_secondarybind", KEY_2) then
					local weapon = ply:GetWeapon(ply:GetNWString("loadoutSecondary"))

					if weapon != NULL then
						input.SelectWeapon(weapon)
					end
				end

				if button == ply:GetInfoNum("tm_meleebind", KEY_3) then
					local weapon = ply:GetWeapon(ply:GetNWString("loadoutMelee"))

					if weapon != NULL then
						input.SelectWeapon(weapon)
					end
				end
			else
				if ply:GetInfoNum("tm_quickswitching", 1) == 1 then
					if button == ply:GetInfoNum("tm_primarybind", KEY_1) then
						local weapon = ply:GetWeapon(ggLadder[ply:GetNWInt("ladderPosition") + 1][1])

						if weapon != NULL then
							input.SelectWeapon(weapon)
						end
					end

					if (ply:GetNWInt("ladderPosition") == (gunGameSize:GetInt() - 1)) == false then
						if button == ply:GetInfoNum("tm_secondarybind", KEY_2) then
							local weapon = ply:GetWeapon(ggLadder[ply:GetNWInt("ladderPosition") + 1][2])

							if weapon != NULL then
								input.SelectWeapon(weapon)
							end
						end

						if button == ply:GetInfoNum("tm_meleebind", KEY_3) then
							local weapon = ply:GetWeapon(ggLadder[ply:GetNWInt("ladderPosition") + 1][2])

							if weapon != NULL then
								input.SelectWeapon(weapon)
							end
						end
					end
				end
			end
		end

		if button == ply:GetInfoNum("tm_nadebind", KEY_4) then
			RunConsoleCommand("+quicknade")
		end
	end

	if button == ply:GetInfoNum("tm_mainmenubind", KEY_M) then
		if !ply:Alive() then
			net.Start("OpenMainMenu")
				if timer.Exists(ply:SteamID() .. "respawnTime") then
					net.WriteFloat(timer.TimeLeft(ply:SteamID() .. "respawnTime"))
				else
					net.WriteFloat(0)
				end
			net.Send(ply)

			ply:SetNWBool("mainmenu", true)
		else
			if GetGlobal2Int("tm_matchtime", 0) - CurTime() > GetGlobal2Int("tm_matchtime", 0) - intermissionLength:GetInt() then
				ply:KillSilent()

				net.Start("OpenMainMenu")
					net.WriteFloat(0)
				net.Send(ply)

				ply:SetNWBool("mainmenu", true)
			end
		end
	end
end)

hook.Add("PlayerButtonUp", "TMBindsUp", function(ply, button)
	if (CLIENT or sp) and IsFirstTimePredicted() then
		if GetGlobal2Bool("tm_intermission") then return end

		if button == ply:GetInfoNum("tm_nadebind", KEY_4) then
			RunConsoleCommand("-quicknade")
		end
	end
end)
