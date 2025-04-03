-- Take out Badgers greeting anim in ending
ModUtil.Path.Override(
    "GardenScenePan",
    function ()
        local zagreusId = CurrentRun.Hero.ObjectId
        local persephoneId = 555688
        local cerberusId = 555687
        local hadesId = 555686

        HideCombatUI()

        SetAlpha({ Id = ScreenAnchors.DialogueBackgroundId, Fraction = 0.0, Duration = 0.5 })

        PlaySound({ Name = "/VO/CerberusBarks", Id = cerberusId, Delay = 1 })

        wait(0.55)

        PanCamera({ Id = 556836, Duration = 3.0, OffsetX = -30, OffsetY = -160 })
        PlaySound({ Name = "/Leftovers/World Sounds/MapZoomInShortHigh", Delay = 0.5 })
        FocusCamera({ Fraction = 1.25, Duration = 3, ZoomType = "Ease" })
        thread( GardenSceneSecondCameraPush )
        -- AdjustZoom({ Fraction = 0.75, LerpTime = 5 })

        SetAnimation({ Name = "Hades_StandingIdle_ShameLoop", DestinationId = hadesId })

        thread( PlayVoiceLines, GlobalVoiceLines.EndingReunionVoiceLines )

        wait(1.5)

        SetAnimation({ Name = "Cerberus_HubIdle", DestinationId = cerberusId })

        SecretMusicPlayer( "/Music/PersephoneTheme_MC" )
        SetSoundCueValue({ Names = { "Harp", "Strings", "WoodWinds", "Trombones", "Percussion" }, Id = SecretMusicId, Value = 1 })
        SetSoundCueValue({ Names = { "Room" }, Id = SecretMusicId, Value = 0, Duration = 0.75 })
        SetVolume({ Id = SecretMusicId, Value = 0.8 })

        SetUnitProperty({ Property = "Speed", Value = 320, DestinationId = persephoneId })
        Move({ Id = persephoneId, DestinationId = 556839, SuccessDistance = 32, StopAtEnd = true })


        wait(1.0)

        SetUnitProperty({ Property = "StartGraphic", Value = nil, DestinationId = zagreusId })
        SetUnitProperty({ Property = "MoveGraphic", Value = "ZagreusWalk2", DestinationId = zagreusId })
        SetUnitProperty({ Property = "StopGraphic", Value = "ZagreusWalkStop2", DestinationId = zagreusId })
        SetUnitProperty({ Property = "Speed", Value = 115, DestinationId = zagreusId })
        SetUnitProperty({ DestinationId = zagreusId, Property = "CollideWithObstacles", Value = false })
        thread( MoveHeroToRoomPosition, { DestinationId = 555690, Timeout = 9999, AngleTowardsIdOnEnd = 556841 } )

        NotifyWithinDistance({ Id = persephoneId, DestinationId = 556839, Distance = 40, Notify = "PersephoneGardenMove", Timeout = 10.0 })
        waitUntil( "PersephoneGardenMove" )

        Move({ Id = persephoneId, DestinationId = 555689, SuccessDistance = 32, StopAtEnd = true })
        thread( SlowDownPersephoneAndZagreus, persephoneId, zagreusId )
        --wait(3.4)
        NotifyWithinDistance({ Id = persephoneId, DestinationId = 555689, Distance = 40, Notify = "PersephoneGardenMove", Timeout = 10.0 })
        waitUntil( "PersephoneGardenMove" )

        Stop({ Id = persephoneId })
        AngleTowardTarget({ Id = persephoneId, DestinationId = cerberusId })

        wait(1)

        SetAlpha({ Id = ScreenAnchors.DialogueBackgroundId, Fraction = 1.0, Duration = 0.5 })
    end
)

ModUtil.LoadOnce( function()
    ModUtil.Table.NilMerge( DeathLoopData, {
        DeathArea = {
            StartUnthreadedEvents = {
                [5] = {
                    Args = {
                        DistanceTrigger = {
                            Args = {
                                TextLineSet = {
                                    Ending01 = {
                                        [19] = {
                                            PreLineAnim = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } )
end )