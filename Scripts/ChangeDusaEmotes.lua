-- Change emotes in Lulu/Dusa dialogue trees to more appropriate ones
ModUtil.LoadOnce(function()
    ModUtil.Table.Merge( UnitSetData.NPCs, {
        NPC_Dusa_01 = {
            InteractTextLineSets = {
                DusaMiscMeeting02 = {
                    [1] = {
                        Emote = "PortraitEmoteNervous"
                    }
                },
                DusaMiscMeeting03 = {
                    [3] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaMiscMeeting04 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaPostFlashback01 = {
                    [1] = {
                        Emote = "PortraitEmoteAffection"
                    }
                },
                BecameCloseWithDusa01 = {
                    [1] = {
                        Emote = "PortraitEmoteSparkly"
                    },
                    [10] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                BecameCloseWithDusaAftermath01 = {
                    [1] = {
                        Emote = "PortraitEmoteNervous"
                    }
                },
                BecameCloseWithDusaAftermath02 = {
                    [1] = {
                        Emote = "PortraitEmoteNervous"
                    },
                    [3] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaAboutGorgons04 = {
                    [2] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaAboutPersephone01 = {
                    [2] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaAboutPersephone01_B = {
                    [4] = {
                        Emote = "PortraitEmoteSparkly"
                    }
                },
                DusaVsNyx02 = {
                    [1] = {
                        Emote = "PortraitEmoteNervous"
                    }
                },
                DusaVsNyx04 = {
                    [1] = {
                        Emote = "PortraitEmoteDepressed"
                    }
                },
                DusaAboutPromotion01 = {
                    [2] = {
                        Emote = "PortraitEmoteFiredUp"
                    }
                },
                DusaPostEnding03 = {
                    [2] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaWithHypnos01 = {
                    [4] = {
                        Emote = "PortraitEmoteSparkly"
                    }
                },
                DusaWithHypnos03 = {
                    [2] = {
                        Emote = "PortraitEmoteFiredUp"
                    },
                    [4] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaWithHypnos04 = {
                    [1] = {
                        Emote = "PortraitEmoteSparkly"
                    },
                    [5] = {
                        Emote = "PortraitEmoteSparkly"
                    }
                },
                DusaWithMegaeraHighAffinity01 = {
                    [2] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaWithPersephone01 = {
                    [1] = {
                        Emote = "PortraitEmoteSparkly"
                    },
                    [3] = {
                        Emote = "PortraitEmoteAffection"
                    }
                }
            },
            RepeatableTextLineSets = {
                DusaChat04 = {
                    [1] = {
                        Emote = "PortraitEmoteSurprise"
                    }
                },
                DusaChat09 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaChat12 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaChat23 = {
                    [1] = {
                        Emote = "PortraitEmoteSurprise"
                    }
                },
                DusaChat26 = {
                    [1] = {
                        Emote = "PortraitEmoteSparkly"
                    }
                },
                DusaChatExtra10 = {
                    [1] = {
                        Emote = "PortraitEmoteDepressed"
                    }
                },
                DusaChatExtra11 = {
                    [1] = {
                        Emote = "PortraitEmoteFiredUp"
                    }
                },
                DusaChatWithCerberus02 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                }
            },
            GiftTextLineSets = {
                DusaGift01 = {
                    [2] = {
                        Emote = "PortraitEmoteSparkly"
                    }
                },
                DusaGift02 = {
                    [1] = {
                        Emote = "PortraitEmoteAffection"
                    }
                },
                DusaGift03 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaGift04 = {
                    [1] = {
                        Emote = "PortraitEmoteCheerful"
                    }
                },
                DusaGift05_Alt = {
                    [4] = {
                        Emote = "PortraitEmoteAffection"
                    }
                },
                DusaGift06 = {
                    [2] = {
                        Emote = "PortraitEmoteCheerful"
                    },
                    [4] = {
                        Emote = "PortraitEmoteDepressed"
                    }
                },
                DusaGift10 = {
                    [2] = {
                        Emote = "PortraitEmoteFiredUp"
                    }
                },
                -- Not sure if this is still being used, but will replace anyway
                DusaGift05 = {
                    [1] = {
                        Emote = "PortraitEmoteSurprise"
                    }
                }
            }
        }
    })

    ModUtil.Table.NilMerge( UnitSetData.NPCs, {
        NPC_Dusa_01 = {
            InteractTextLineSets = {
                BecameCloseWithDusaAftermath03 = {
                    [4] = {
                        Emote = true
                    }
                }
            }
        }
    })
end)