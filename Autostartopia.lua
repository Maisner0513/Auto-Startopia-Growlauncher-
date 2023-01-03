--Script is not encrypted
--The script is still beta
--Maisner#0513

function Drone()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6532")
	LogToConsole("`b[TOOLS] `#Tactical Drone")
end

function Teleporter()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6526")
    LogToConsole("`b[TOOLS] `#Teleporter Charge")
end

function Doc()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6534")
	LogToConsole("`b[TOOLS]`# Stellar Documents")
end

function Scan()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6530")
	LogToConsole("`b[TOOLS]`# Quadriscanner")
end

function Torp()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6540")
	LogToConsole("`b[TOOLS]`# Growton Torpedo")
end

function Dip()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6538")
	LogToConsole("`b[TOOLS]`# Cyborg Diplomat")
end

function Sup()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6536")
	LogToConsole("`b[TOOLS]`# Star Supplies")
end

function Giga()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6528")
	LogToConsole("`b[TOOLS] `#Gigablaster")
end

function Shield()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6518")
	LogToConsole("`b[TOOLS] `#HyperShields")
end

function AI()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6520")
	LogToConsole("`b[TOOLS] `#AI Brain")
end

function Gala()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6522")
	LogToConsole("`b[TOOLS] `#Galactibolt")
end

function Meds()
	SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|tool6524")
	LogToConsole("`b[TOOLS] `#Space Meds")
end

function Hook(var)
	if var.v1 == "OnDialogRequest" and var.v2:find("end_dialog|startopia") and var.v2:find("Health") then
        if var.v2:find("add_label_with_icon|big|`w(%w+) Data") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 4 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 4 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2" .. var.v2:match("add_label_with_icon|big|`w(%w+) Data") .. " Data"
					)
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wSet a Course") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Set a Course")
				end
				Drone()
				return true
			end
		elseif
			var.v2:find("add_label_with_icon|big|`wOutpost Attack")
			or var.v2:find("add_label_with_icon|big|`wOne Angry Ship")
		then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Torp()
					elseif step == 2 then
						Dip()
					elseif step == 3 or step == 5 then
						Teleporter()
					elseif step == 4 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Torp()
					elseif step == 2 then
						Dip()
					elseif step == 3 or step == 5 then
						Teleporter()
					elseif step == 4 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					if var.v2:find("Outpost Attack") then
						LogToConsole("`c[MISSION] `2Outpost Attack")
					elseif var.v2:find("One Angry Ship") then
						LogToConsole("`b[`9MISSION`b] `6One Angry Ship")
					end
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wStarachnid Attack") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 then
						Torp()
					elseif step == 2 then
						Sup()
					elseif step == 4 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 then
						Torp()
					elseif step == 2 then
						Sup()
					elseif step == 4 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Starachnid Attack")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`w(%w+) Attack") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Shield()
					elseif step == 2 or step == 3 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Shield()
					elseif step == 2 or step == 3 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2" .. var.v2:match("add_label_with_icon|big|`w(%w+) Attack") .. " Attack"
					)
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wLife Pod") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Scan()
					elseif step == 2 then
						Meds()
					elseif step == 3 then
						Sup()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Teleporter()
					elseif step == 1 then
						Scan()
					elseif step == 2 then
						Meds()
					elseif step == 3 then
						Sup()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Life Pod")
				end
				Teleporter()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wBoarding Party") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 2 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Scan()
					elseif step == 1 or step == 2 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Boarding Party")
				end
				Scan()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wExperimental Salvage") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 2 or step == 3 then
						Teleporter()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 2 or step == 3 then
						Teleporter()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Experimental Salvage")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wDark Ship") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Teleporter()
					elseif step == 2 then
						AI()
					elseif step == 3 or step == 4 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Teleporter()
					elseif step == 2 then
						AI()
					elseif step == 3 or step == 4 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Dark Ship")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`w(%w+) Hunt") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 4 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 4 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2" .. var.v2:match("add_label_with_icon|big|`w(%w+) Hunt") .. " Hunt"
					)
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wWindy Days") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Windy Days")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wAncient Temple") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Dip()
					elseif step == 2 then
						Sup()
					elseif step == 3 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Dip()
					elseif step == 2 then
						Sup()
					elseif step == 3 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Ancient Temple")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wA Challenge") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 2 or step == 3 or step == 4 then
						Shield()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 2 or step == 3 or step == 4 then
						Shield()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2A Challenge?!")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wMiner Rescue") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Drone()
					elseif step == 2 or step == 4 or step == 5 then
						Teleporter()
					elseif step == 3 then
						Scan()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Gala()
					elseif step == 1 then
						Drone()
					elseif step == 2 or step == 4 or step == 5 then
						Teleporter()
					elseif step == 3 then
						Scan()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Miner Rescue")
				end
				Gala()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wHunter and Prey") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						AI()
					elseif step == 2 or step == 4 then
						Teleporter()
					elseif step == 3 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						AI()
					elseif step == 2 or step == 4 then
						Teleporter()
					elseif step == 3 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Hunter and Prey")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wGiant Skeleton") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						AI()
					elseif step == 2 then
						Shield()
					elseif step == 3 then
						Sup()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						AI()
					elseif step == 2 then
						Shield()
					elseif step == 3 then
						Sup()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Giant Skeleton")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wShadow Stalkers") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 or step == 7 then
						Teleporter()
					elseif step == 2 or step == 6 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Giga()
					elseif step == 8 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 5 or step == 7 then
						Teleporter()
					elseif step == 2 or step == 6 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Giga()
					elseif step == 8 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Shadow Stalkers")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wPlanet Calamity") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 or step == 6 then
						Teleporter()
					elseif step == 2 then
						AI()
					elseif step == 4 then
						Shield()
					elseif step == 5 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 or step == 6 then
						Teleporter()
					elseif step == 2 then
						AI()
					elseif step == 4 then
						Shield()
					elseif step == 5 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Planet Calamity")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wA Strange One") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Dip()
					elseif step == 2 then
						Gala()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Dip()
					elseif step == 2 or step == 6 then
						Gala()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2A Strange One")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wTasty Cakes") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 6 then
						Teleporter()
					elseif step == 2 or step == 4 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 5 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 6 then
						Teleporter()
					elseif step == 2 or step == 4 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 5 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Tasty Cakes")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wTaking Aim") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Taking Aim")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wBad Taste") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Dip()
					elseif step == 2 then
						Giga()
					elseif step == 3 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Teleporter()
					elseif step == 1 then
						Dip()
					elseif step == 2 then
						Doc()
					elseif step == 3 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Bad Taste")
				end
				Teleporter()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wSolar Impact!") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 or step == 7 then
						Gala()
					elseif step == 2 or step == 6 then
						Meds()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Drone()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Shield()
					elseif step == 1 then
						Gala()
					elseif step == 2 then
						Meds()
					elseif step == 3 then
						AI()
					elseif step == 4 then
						Drone()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Solar Impact!")
				end
				Shield()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wJunk Punks") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Drone()
					elseif step == 2 then
						Torp()
					elseif step == 3 then
						AI()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						AI()
					elseif step == 1 then
						Drone()
					elseif step == 2 then
						Torp()
					elseif step == 3 then
						AI()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Junk Punks")
				end
				AI()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wCryonite Crisis") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 9 then
						Teleporter()
					elseif step == 1 or step == 3 then
						Scan()
					elseif step == 2 then
						Giga()
					elseif step == 4 or step == 5 then
						AI()
					elseif step == 6 then
						Shield()
					elseif step == 7 then
						Gala()
					elseif step == 8 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 or step == 9 then
						Teleporter()
					elseif step == 1 or step == 3 then
						Scan()
					elseif step == 2 then
						Giga()
					elseif step == 4 or step == 5 then
						AI()
					elseif step == 6 then
						Shield()
					elseif step == 7 then
						Gala()
					elseif step == 8 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Cryonite Crisis")
				end
				Teleporter()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wSalvage Run") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 3 then
						Teleporter()
					elseif step == 2 then
						Scan()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Salvage Run")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wShip Rescue") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Drone()
					elseif step == 2 or step == 5 then
						Teleporter()
					elseif step == 3 then
						Scan()
					elseif step == 4 then
						Meds()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Gala()
					elseif step == 1 then
						Drone()
					elseif step == 2 or step == 5 then
						Teleporter()
					elseif step == 3 then
						Scan()
					elseif step == 4 then
						Meds()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Ship Rescue")
				end
				Gala()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wSkeleton Crew") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Scan()
					elseif step == 2 then
						AI()
					elseif step == 3 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Teleporter()
					elseif step == 1 then
						Scan()
					elseif step == 2 then
						AI()
					elseif step == 3 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Skeleton Crew")
				end
				Teleporter()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wGhost Ship") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Dip()
					elseif step == 4 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Dip()
					elseif step == 4 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Ghost Ship")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wPit o' Trouble") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 4 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 5 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 4 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 5 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Pit o' Trouble")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wClose Encounter") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 then
						AI()
					elseif step == 2 or step == 3 then
						Dip()
					elseif step == 4 then
						Scan()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 5 then
						AI()
					elseif step == 2 or step == 3 then
						Dip()
					elseif step == 4 then
						Scan()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Close Encounter")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wEscape Pod") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 6 then
						Meds()
					elseif step == 1 then
						Drone()
					elseif step == 4 or step == 7 then
						Scan()
					elseif step == 2 then
						Shield()
					elseif step == 3 or step == 8 then
						Teleporter()
					elseif step == 5 then
						Giga()
					elseif step == 9 then
						Torp()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 or step == 6 then
						Meds()
					elseif step == 1 then
						Drone()
					elseif step == 4 or step == 7 then
						Scan()
					elseif step == 2 then
						Shield()
					elseif step == 3 or step == 8 then
						Teleporter()
					elseif step == 5 then
						Giga()
					elseif step == 9 then
						Torp()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Escape Pod")
				end
				Meds()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wPrevent War") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Drone()
					elseif step == 2 then
						Dip()
					elseif step == 3 then
						Teleporter()
					elseif step == 4 then
						Doc()
					elseif step == 5 then
						Gala()
					elseif step == 6 then
						Sup()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Shield()
					elseif step == 1 then
						Drone()
					elseif step == 2 then
						Dip()
					elseif step == 3 then
						Teleporter()
					elseif step == 4 then
						Doc()
					elseif step == 5 then
						Gala()
					elseif step == 6 then
						Sup()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Prevent War")
				end
				Shield()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wMining Colony Rescue") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Teleporter()
					elseif step == 2 then
						Dip()
					elseif step == 3 then
						Meds()
					elseif step == 4 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Teleporter()
					elseif step == 2 then
						Dip()
					elseif step == 3 then
						Meds()
					elseif step == 4 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Mining Colony Rescue")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wMining Colony Delivery") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 4 then
						Sup()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 4 then
						Sup()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole("`c[MISSION] `2Mining Colony Delivery")
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`w(%w+) Duel") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Shield()
					elseif step == 2 or step == 4 then
						Torp()
					elseif step == 3 then
						AI()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Shield()
					elseif step == 2 or step == 4 then
						Torp()
					elseif step == 3 then
						AI()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2" .. var.v2:match("add_label_with_icon|big|`w(%w+) Duel") .. " Duel"
					)
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`wMining Colony Delivery") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Sup()
					elseif step == 4 then
						Giga()
					elseif step == 5 then
						Doc()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Sup()
					elseif step == 4 then
						Giga()
					elseif step == 5 then
						Doc()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2"
							.. var.v2:match("add_label_with_icon|big|`w(%w.-) Extermination")
							.. " Extermination"
					)
				end
				Drone()
				return true
			end
		elseif var.v2:find("add_label_with_icon|big|`w(%w.-) Delivery") then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 4 then
						Sup()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 5 then
						Teleporter()
					elseif step == 2 then
						Scan()
					elseif step == 3 then
						Giga()
					elseif step == 4 then
						Sup()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					LogToConsole(
						"`c[MISSION] `2" .. var.v2:match("add_label_with_icon|big|`w(%w.-) Delivery") .. " Delivery"
					)
				end
				Drone()
				return true
			end
		elseif
			var.v2:find("add_label_with_icon|big|`wWho's There")
			or var.v2:find("add_label_with_icon|big|`wShe's Gonna Blow")
		then
			if var.v2:find("Skill Success") or var.v2:find("Skill Fail") then
				if var.v2:find("Skill Success") then
					step = step + 1
					if step == 1 then
						Teleporter()
					elseif step == 2 or step == 4 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 5 then
						Giga()
					end
				elseif var.v2:find("Skill Fail") then
					if step == 0 then
						Drone()
					elseif step == 1 or step == 6 then
						Teleporter()
					elseif step == 2 or step == 4 then
						Scan()
					elseif step == 3 then
						AI()
					elseif step == 5 then
						Giga()
					end
				end
				return true
			else
				step = 0
				if Mission == 0 then
					if var.v2:find("|`wWho's There") then
						LogToConsole("`c[MISSION] `2Who's There?")
					else
						LogToConsole("`c[MISSION] `2She's Gonna Blow!")
					end
				end
				Drone()
				return true
			end
		end
	elseif var.v1 == "OnDialogRequest" and var.v2:find("Starship Helm") then
		SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|beginvoyage")
		return true
	elseif var.v1 == "OnDialogRequest" and var.v2:find("It is a good day to flee!") then
		SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|failmission")
		LogToConsole("`b[`4FAIL`b]`2 Sorry for the fail `#This script is still beta! `cMaisner#0513")
		return true
	elseif var.v1 == "OnTalkBubble" and var.v3:find("You received") then
		return false
	elseif var.v1 == "OnDialogRequest" and var.v2:find("The voyage continues!") then
		SendPacket(2, "action|dialog_return\ndialog_name|startopia\nbuttonClicked|finishmission")
		LogToConsole("`c[SUCCESS]")
		step = 0
		Mission = 0
		return true
	elseif var.v1 == "OnDialogRequest" and var.v2:find("end_dialog|startopia") then
		return false
	end
	return false
end

LogToConsole("`4Script is still beta! `cMaisner#0513 `1on `#Discord")
iwm = {}
iwm.v0 = "OnDialogRequest"
step = 0
Mission = 0
AddHook(Hook, "OnVariant")
