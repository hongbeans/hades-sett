-- Subtitle color changes for post-epilogue cutscene
ModUtil.Table.Merge(GlobalVoiceLines.StorytellerEpilogueVoiceLines, {
    [1] = {
        -- Hades/Old Timer -> Zag/Sett
        [3] = { Cue = "/VO/Hades_1207", PreLineWait = 0.3 },
        -- Zeus/Voli -> Hades/Old Timer
        [4] = { Cue = "/VO/Zeus_0247", Source = { SubtitleColor = Color.HadesVoice }, PreLineWait = 0.3 },
        -- Hades/Old Timer -> Zag/Sett
        [5] = { Cue = "/VO/Hades_0940", PreLineWait = 0.3 },
    }
})