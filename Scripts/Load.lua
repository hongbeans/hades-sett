local mod = "ProjectSett"
ModUtil.Mod.Register(mod)

-- Load packages
ModUtil.Path.Wrap(
    "SetupMap",
    function (base)
        DebugPrint({Text = "@"..mod.." Trying to load package SettPortraits.pkg"})
        LoadPackages({Name = {"SettPortraits"}})
        DebugPrint({Text = "@"..mod.." Trying to load package SettDeathArea.pkg"})
        LoadPackages({Name = {"SettDeathArea"}})
        DebugPrint({Text = "@"..mod.." Trying to load package SettGUI.pkg"})
        LoadPackages({Name = {"SettGUI"}})
        return base()
    end
)