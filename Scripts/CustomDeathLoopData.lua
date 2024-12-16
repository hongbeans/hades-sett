-- Remove Megaera bedroom scene and Thanatos rejection
ModUtil.Table.NilMerge( DeathLoopData, {
	DeathAreaBedroom = {
		StartUnthreadedEvents = {
            -- Megaera scenes
			[5] = true,
			[6] = true,
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
            }
		}
	}
})
