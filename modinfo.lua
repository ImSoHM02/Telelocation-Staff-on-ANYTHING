description = 
[[
Allows you to use the Telelocation Staff to teleport ANY object! Use with the Telefocus! There is no sanity cost for teleporting non-mob objects!
Includes settings to also adjust Telefocus purple gem usage (Vanilla or none(You still need 3 inserted, but none will be destroyed)),
Telelocation Staff usages and whether Staff usage will trigger rain or not!
]]

name                        = "Telelocation Staff on EVERYTHING!"
author                      = "ImSoHM02"
version                     = "1.0"
forumthread                 = ""
icon                        = "modicon.tex"
icon_atlas                  = "modicon.xml"
api_version                 = 10
dont_starve_compatible      = false
reign_of_giants_compatible  = false
all_clients_require_mod     = true
dst_compatible              = true
client_only_mod             = false

--Locals

local Uses 					= {{description = "Default", data = 5}, {description = "10", data = 10}, {description = "20", data = 20}, {description = "9999", data = 9999}}

local GemUsage 				= {{description = "Vanilla", data = 1}, {description = "No Gems", data = 2}}

local YesNo 				= {{description = "Yes (Default)", data = 500}, {description = "No", data = 0}}

local Empty 				= {{description = "", data = 0}}

local function Title(title) --Allows use of an empty label as a header
return {name=title, options=Empty, default=0,}
end

local SEPARATOR 			= Title("")

--Config options

configuration_options =
{
	Title("Settings"),
	{
		name	= "TELEBASEGEMUSE",
		label	= "Telefocus Gem Usage",
		options = GemUsage,
		default = 1,
	},
	{
		name	= "TELEUSES",
		label	= "Number of Telelocator Staff uses",
		options = Uses,
		default = 5,
	},
	{
		name	= "TELEWET",
		label	= "Chance of rain upon teleport",
		options = YesNo,
		default = 500,
	},
}