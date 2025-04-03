-- Subtitle color changes for post-epilogue cutscene
ModUtil.Table.NilMerge(GlobalVoiceLines.StorytellerEpilogueVoiceLines, {
    [1] = {
        -- Fix to Zeus/Voli subtitle color
        [1] = { Source = true },
        -- Hades/Old Timer -> Zag/Sett
        [3] = { Source = true },
        -- Hades/Old Timer -> Zag/Sett
        [5] = { Source = true },
    }
})

ModUtil.Table.Merge(GlobalVoiceLines.StorytellerEpilogueVoiceLines, {
    [1] = {
        -- Fix to Zeus/Voli subtitle color
        [1] = { Source = { SubtitleColor = { 255, 248, 187, 255 } } },
        -- Zeus/Voli -> Hades/Old Timer
        [4] = { Source = { SubtitleColor = Color.HadesVoice } },
    }
})