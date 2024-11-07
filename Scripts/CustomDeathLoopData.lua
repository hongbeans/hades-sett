-- Remove Megaera bedroom scene
ModUtil.Table.NilMerge( DeathLoopData, {
	DeathAreaBedroom = {
		StartUnthreadedEvents = {
			[5] = true,
			[6] = true,
		}
	}
})