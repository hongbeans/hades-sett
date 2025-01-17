-- Add a set chance to encounter Than
-- If rolled successfully, a Thanatos encounter will be the next room
ModUtil.Path.Override(
    "ChooseEncounter",
    function (currentRun, room)
        DebugAssert({ Condition = room ~= nil, Text = "Choosing an encounter for a nil room!" })

        local encounterData = nil
        if ForceNextEncounter ~= nil then
            DebugPrint({ Text = "ForceNextEncounter = "..tostring(ForceNextEncounter) })
            encounterData = EncounterData[ForceNextEncounter]
            encounterData.SkipIntroEncounterCheck = true
            ForceNextEncounter = nil
        elseif currentRun.ForceNextEncounterData ~= nil then
            encounterData = currentRun.ForceNextEncounterData
        elseif HasHeroTraitValue( "ForceThanatosEncounter" ) then
            local legalEncounters = {}
            for i, encounterName in pairs( EncounterSets.ThanatosEncounters ) do
                if IsEncounterEligible( currentRun, room, EncounterData[encounterName] ) then
                    table.insert(legalEncounters, encounterName )
                end
            end
            if not IsEmpty( legalEncounters ) then
                UseHeroTraitsWithValue( "ForceThanatosEncounter", true )
                encounterData = EncounterData[legalEncounters[1]]
            end
        end

        if not encounterData then
            -- Look for eligible Thanatos encounters
            local legalThanEncounters = {}
            for i, encounterName in pairs( EncounterSets.ThanatosEncounters ) do
                if IsEncounterEligible( currentRun, room, EncounterData[encounterName] ) then
                    table.insert(legalThanEncounters, encounterName )
                end
            end

            if not IsEmpty( legalThanEncounters ) then
                -- Roll for encounter if there are eligible Than encounters
                local chance = math.random(0, 1)
                DebugPrint({ Text = "@ProjectSett Than encounter rolled number"..chance.."!" })

                if chance == 1 then
                    encounterData = EncounterData[legalThanEncounters[1]]
                end
            end
        end

        if not encounterData then
            local eligibleEncounters = {}
            local forcedEncounters = {}
            if room.LegalEncounters ~= nil then
                for k, encounterName in pairs( room.LegalEncounters ) do
                    local encounterData = EncounterData[encounterName]
                    if IsEncounterEligible( currentRun, room, encounterData ) then
                        table.insert( eligibleEncounters, encounterData )
                        if IsEncounterForced( currentRun, room, encounterData ) then
                            table.insert( forcedEncounters, encounterData )
                        end
                    end
                end
            else
                for encounterName, encounterData in pairs( EncounterData ) do
                    if IsEncounterEligible( currentRun, room, encounterData ) then
                        table.insert( eligibleEncounters, encounterData )
                        if IsEncounterForced( currentRun, room, encounterData ) then
                            table.insert( forcedEncounters, encounterData )
                        end
                    end
                end
            end

            local roomName = room.Name
            if roomName == nil then
                roomName = GetKey(RoomData, room)
            end

            if roomName == nil then
                roomName = tostring(room.HelpTextId)..":"..tostring(room.Type)..":"..tostring(room.LegalEncounters[1])
            end

            DebugAssert({ Condition = not IsEmpty( eligibleEncounters ) or not IsEmpty(forcedEncounters), Text = "No encounters available for "..tostring(roomName).."!" })

            if not IsEmpty( forcedEncounters ) then
                encounterData = GetRandomValue( forcedEncounters )
            else
                encounterData = GetRandomValue( eligibleEncounters )
            end

            if encounterData.EnemySet ~= nil then
                for k, enemyName in pairs(encounterData.EnemySet) do
                    if EnemyData[enemyName].ForceIntroduction and not HasEncounterBeenCompleted(EnemyData[enemyName].RequiredIntroEncounter) then
                        encounterData = EncounterData[EnemyData[enemyName].RequiredIntroEncounter]
                    end
                end
            end
        end

        local encounter = SetupEncounter(encounterData, room)

        return encounter
    end
)