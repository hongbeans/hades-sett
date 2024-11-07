-- Patch in Poseidon's dialogue in Tartarus room data
ModUtil.Table.Merge(RoomSetData.Tartarus, {
    RoomOpening = {
        ForcedRewards = {
            [9] = {
                ForcedTextLines = {
                    PoseidonWrathIntro01 = {
                        [1] = {
                            Portrait = "Portrait_Poseidon_Default_01"
                        }
                    }
                }
            },
            [11] = {
                ForcedTextLines = {
                    PoseidonFishQuest01 = {
                        [1] = {
                            Portrait = "Portrait_Poseidon_Default_01"
                        }
                    }
                }
            }
        }
    }
})