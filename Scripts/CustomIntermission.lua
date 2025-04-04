-- Add portrait presentation to Aphelios home intermission
-- Requires overriding BedroomIntermissionPresentation to handle fade in/out to portrait
ModUtil.Path.Override(
    "BedroomIntermissionPresentation",
    function (source, args)
        args = args or {}

        local megSound1 = nil
        local megSound2 = nil
        local thanSound1 = nil
        local thanSound2 = nil
        local zagSound1 = nil
        local zagSound2 = nil

        local isDinoCgiAvailable = false
        local cgiName = "PortraitThanSmooch"

        if args.UseRandomSounds then
            isDinoCgiAvailable = true
            local megLaughSounds =
            {
                "/VO/MegaeraHome_0228",
                "/VO/MegaeraHome_0229",
                "/VO/MegaeraHome_0230",
                "/VO/MegaeraHome_0231",
            }
            megSound1 = RemoveRandomValue( megLaughSounds )
            megSound2 = RemoveRandomValue( megLaughSounds )
            local thanLaughSounds =
            {
                "/VO/Thanatos_0468",
                "/VO/Thanatos_0469",
                "/VO/Thanatos_0470",
                "/VO/Thanatos_0471",
                "/VO/Thanatos_0472",
            }
            thanSound1 = RemoveRandomValue( thanLaughSounds )
            thanSound2 = RemoveRandomValue( thanLaughSounds )
            local zagLaughSounds =
            {
                "/VO/ZagreusHome_1512",
                "/VO/ZagreusHome_1513",
                "/VO/ZagreusHome_1514",
                "/VO/ZagreusHome_1515",
                "/VO/ZagreusHome_1516",
            }
            zagSound1 = RemoveRandomValue( zagLaughSounds )
            zagSound2 = RemoveRandomValue( zagLaughSounds )
        end

        if args ~= nil and args.ExtraWaitTime ~= nil then
            wait( args.ExtraWaitTime )
        end

        if args ~= nil and args.IsReminisce then
            cgiName = "PortraitThanElysium"
        elseif args ~= nil and args.IsNectarScene then
            cgiName = "PortraitThanNectar"
        elseif isDinoCgiAvailable then
            -- Determine if the dino CGI will be used
            local chance = math.random(10)
            -- DebugPrint({Text = "@ProjectSett CGI rolled number"..chance.."!"})
            if chance == 10 then
                cgiName = "PortraitThanDino"
            end
        end

        if args ~= nil and args.Partner == "Thanatos" then
            -- Fade out initially if reminiscing, since there is no follow up dialogue
            if args ~= nil and (args.IsReminisce or args.IsNectarScene) then
                FadeOut({ Color = Color.Black, Duration = 0.5 })
                wait(1)
            end
            wait(1)
            -- Display portrait
            FadeIn({ Duration = 1.5 })
            ScreenAnchors.PortraitDisplayAnchor = CreateScreenObstacle({ Name = "BlankObstacle", Group = "Overlay", X = ScreenCenterX, Y = ScreenCenterY })
            local blackScreenId = CreateScreenObstacle({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY })
            SetScale({ Id = blackScreenId, Fraction = 10 })
            SetColor({ Id = blackScreenId, Color = Color.Black })
            SetAlpha({ Id = blackScreenId, Fraction = 1.0, Duration = 0 })

            local portraitId = CreateScreenObstacle({ Name = "rectangle01", X = ScreenCenterX, Y = ScreenCenterY, Group = "Overlay" })
            SetAlpha({ Id = portraitId, Fraction = 0.0, Duration = 0 })
            SetAlpha({ Id = portraitId, Fraction = 1.0, Duration = 1.0 })
            SetAnimation({ Name = cgiName, DestinationId = portraitId })

            Attach({ Id = blackScreenId, DestinationId = ScreenAnchors.PortraitDisplayAnchor })
            Attach({ Id = portraitId, DestinationId = ScreenAnchors.PortraitDisplayAnchor })

            -- Camera Pan
            AdjustFullscreenBloom({ Name = "NewType06", Duration = 0 })
            AdjustFullscreenBloom({ Name = "Off", Duration = 1, Delay = 0 })
            Teleport({ Id = ScreenAnchors.PortraitDisplayAnchor, DestinationId = ScreenAnchors.PortraitDisplayAnchor, OffsetX = -50, OffsetY = 0 })
            Move({ Id = ScreenAnchors.PortraitDisplayAnchor, DestinationId = ScreenAnchors.PortraitDisplayAnchor, OffsetX = 100, OffsetY = 0, Duration = 9.5, EaseOut = 1.0, EaseIn = 0.0 })
            SetScale({ Id = portraitId, Fraction = 1.2 })

            if args.IsReminisce or args.IsNectarScene then
                wait(5)
            else
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                PlaySound({ Name = zagSound1 or "/VO/ZagreusField_2137" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                PlaySound({ Name = thanSound1 or "/VO/Thanatos_0469" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                PlaySound({ Name = zagSound2 or "/VO/ZagreusHome_1514" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                wait(0.5)
                PlaySound({ Name = thanSound2 or "/VO/Thanatos_0468" })
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                wait(0.5)
                PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
                wait(1.5)
            end

            FadeOut({ Color = Color.Black, Duration = 1.0 })
            wait(1.5)
            
            Destroy({ Id = portraitId })
            Destroy({ Id = blackScreenId })
            Destroy({ Id = ScreenAnchors.PortraitDisplayAnchor })
        elseif args ~= nil and args.Partner == "MegThan" then
            thread( PlayVoiceLines, GlobalVoiceLines.MegaeraFlirtVoiceLines, true )
            wait(2)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            PlaySound({ Name = "/VO/MegaeraHome_0228" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/VO/Thanatos_0472" })
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/VO/ZagreusHome_1516" })
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            PlaySound({ Name = "/VO/ZagreusField_2137" })
            wait(0.3)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/VO/MegaeraHome_0231" })
            wait(1.5)
            PlaySound({ Name = "/VO/ZagreusField_2308" })
            wait(2.0)
        else
            thread( PlayVoiceLines, GlobalVoiceLines.MegaeraFlirtVoiceLines, true )
            -- Megaera
            wait(2)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            PlaySound({ Name = megSound1 or "/VO/MegaeraHome_0228" })
            wait(0.5)
            PlaySound({ Name = "/SFX/Enemy Sounds/Megaera/MegaeraWhipFlurryAttack" })
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.6)
            PlaySound({ Name = "/VO/ZagreusEmotes/EmoteHurt" })
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            wait(0.5)
            PlaySound({ Name = "/Leftovers/World Sounds/CaravanCreak" })
            PlaySound({ Name = megSound2 or "/VO/MegaeraHome_0227" })
            wait(0.8)
            PlaySound({ Name = "/VO/ZagreusField_2308" })
            wait(1.5)
        end
        if args ~= nil and args.ExtraWaitTime ~= nil then
            wait( args.ExtraWaitTime )
        end
        SetThingProperty({ Property = "Graphic", Value = "ZagreusIdle", DestinationId = CurrentRun.Hero.ObjectId })
        AdjustFullscreenBloom({ Name = "Menu", Duration = 0.3 })
        AdjustColorGrading({ Name = "Ascension", Duration = 0.3 })
        AdjustColorGrading({ Name = "Off", Duration = 5.0 })
        AdjustFullscreenBloom({ Name = "Off", Duration = 5.0 })
        if args ~= nil and not args.IsReminisce and not args.IsNectarScene then
            wait(2.0)
            DisplayUnlockText( {
                --SupertitleText = "EasyModeUpgradedSupertitle",

                TitleText = "BedroomIntermissionMessage",
                -- SubtitleText = args.Text,
                TextRevealSound = "/Leftovers/Menu Sounds/EmoteExcitement",
                Color = Color.Pink,
                --SupertitleTextColor = {190, 190, 190, 255},
                --SupertitleTextDelay = 1.0,
                TextColor = Color.White,
                -- SubTextColor = {23, 255, 187, 255},
                -- Icon = EasyModeIcon,
                -- Duration = 4.35,
                -- IconMoveSpeed = 0.00001,
                TextOffsetY = 25,
                TitleFont = "SpectralSCLightTitling",
                SubtitleFont = "SpectralSCLightTitling",
                --SupertitleFont = "AlegreyaSansSCRegular",
                Layer = "Overlay",
                AdditionalAnimation = "GodHoodRays",
                } )
        else
            -- Simulate fading back in
            PlaySound({ Name = "/Leftovers/Menu Sounds/EmoteAffection" })
            FadeIn({ Duration = 2.5 })
        end
    end
)

-- Override gift eligibility function to disable Aphelios's 5th Nectar in run
ModUtil.Path.Override(
    "CanReceiveGift",
    function (npcData)
        local textLineSets = npcData.InteractTextLineSets or {}
        local repeatableLineSets = npcData.RepeatableTextLineSets or {}
        local name = GetGenusName( npcData )
        textLineSets = CombineTables( textLineSets, repeatableLineSets )
        if GameState.Flags.InFlashback then
            return false
        end
        for k, textLineSet in pairs( textLineSets ) do
            if CurrentRun.TextLinesRecord[textLineSet.Name] and textLineSet.GiftableOffSource then
                return false
            end
        end
        if npcData.NextInteractLines ~= nil and npcData.NextInteractLines.InitialGiftableOffSource ~= nil then
            return false
        end
        if npcData.GiftableOffInGhostProcession and CurrentDeathAreaRoom ~= nil and (CurrentDeathAreaRoom.HadesProcessionActivating or CurrentDeathAreaRoom.HadesProcessionActive) then
            return false
        end

        if npcData.SkipInitialGiftRequirement then

            return npcData.CanReceiveGift
                and (( GiftData[name] and GiftData[name].InfiniteGifts ) or ((GetGiftLevel(name) + 1) <= GetMaxGiftLevel(name)))
                -- mod
                and not (name == "NPC_Thanatos_01" and ((GetGiftLevel(name) + 1) == 5) and CurrentDeathAreaRoom == nil)
                and not CurrentRun.GiftRecord[name]

        else

            return ( GameState.NPCInteractions[name] ~= nil or GameState.LootPickups [name] ~= nil )
                and npcData.CanReceiveGift
                and (( GiftData[name] and GiftData[name].InfiniteGifts ) or ((GetGiftLevel(name) + 1) <= GetMaxGiftLevel(name)))
                -- mod
                and not (name == "NPC_Thanatos_01" and ((GetGiftLevel(name) + 1) == 5) and CurrentDeathAreaRoom == nil)
                and not CurrentRun.GiftRecord[name]

        end
    end
)

-- Add intermission to dialogue tree
ModUtil.Table.Merge(UnitSetData.NPCs, {
    NPC_Thanatos_01 = {
        GiftTextLineSets = {
            ThanatosGift05 = {
                [2] = {
                    PortraitExitAnimation = "Portrait_Zag_Default_01_Exit",
                    PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
                    PostLineFunctionArgs = { Partner = "Thanatos", IsNectarScene = true }
                }
            },
            ThanatosGift10 = {
                [8] = {
                    PortraitExitAnimation = "Portrait_Than_Shy_01_Exit",
                    PostLineThreadedFunctionName = "BedroomIntermissionPresentation",
                    PostLineFunctionArgs = { Partner = "Thanatos", IsReminisce = true }
                }
            }
        }
    }
})