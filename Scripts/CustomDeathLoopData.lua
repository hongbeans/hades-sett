-- Remove Megaera bedroom scene and Thanatos rejection
ModUtil.LoadOnce(function()
    ModUtil.Table.NilMerge( DeathLoopData, {
        DeathAreaBedroom = {
            StartUnthreadedEvents = {
                -- Megaera scenes
                [5] = {
                    FunctionName = true
                },
                [6] = {
                    FunctionName = true
                },
                -- Thanatos scenes
                [7] = {
                    Args = {
                        DistanceTrigger = {
                            Args = {
                                TextLineSet = {
                                    BecameCloseWithThanatos01 = {
                                        [3] = {
                                            Choices = {
                                                [2] = true,
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                [8] = {
                    Args = {
                        DistanceTrigger = {
                            Args = {
                                TextLineSet = {
                                    BecameCloseWithThanatos01_B = {
                                        [3] = {
                                            Choices = {
                                                [2] = true,
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                },
                -- Meg + Than scenes
                [9] = {
                    FunctionName = true
                },
                [10] = {
                    FunctionName = true
                },
            }
        }
    })

    -- Remove Megaera smooch statuses
    ModUtil.Table.NilMerge( UnitSetData.NPCs, {
        NPC_FurySister_01 = {
            RepeatableTextLineSets = {
                MegIntermissionChat01 = true,
                MegIntermissionChat02 = true,
                MegIntermissionChat03 = true,
                MegIntermissionChat04 = true,
                MegIntermissionChat05 = true,
                MegIntermissionChat06 = true,
            }
        }
    })
end)
