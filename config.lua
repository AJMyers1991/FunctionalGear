Config = {}

Config.goggleKey = 172 --Configures the key used to activate the thermal or night vision goggles.  Default is 172 (up arrow on keybord or xbox controller).  You can go here and find whichever key you would like to replace it with if you wish to do so https://docs.fivem.net/docs/game-references/controls/
Config.gearlightkey = 38 --Configures the key used to activate the light on the fire gear SCBA rig or the scuba SCBA rig.

--Main Functions.  Set these to true to turn them on or false to turn them off.
Config.KeepProps = true --Toggles the peds ability to keep props attached when taking damage.
Config.FireGear = true --Toggles the fire gears ability to make the ped fireproof/steamproof.
Config.ScubaGear = true --Toggles the scuba gears ability to make ped drownproof.
Config.BombGear = true --Toggles the bomb gears ability to make ped bombproof/fireproof/steamproof.
Config.GearLights = true --Toggles the ability to turn gear lights on and off.
Config.ThermalGoggles = true --Toggles the ability for ped to use thermal goggles.
Config.NightVisionGoggles = true --Toggles the ability for ped to use night vision goggles.

--Clothing category and texture numbers.  These will need to be changed according to your framework documentation or to the default native variables found here https://docs.fivem.net/natives/?_0x67F3780DD425D4FC
Config.armspeddrawablevariation = 3 -- This is the CATEGORY number used to determine your Arms item number
Config.torsopeddrawablevariation = 11 -- This is the CATEGORY number used to determine your Jacket/Overshirt item number
Config.undershirtpeddrawablevariation = 8 -- This is the CATEGORY number used to determine your undershirt/belt item number
Config.pantspeddrawablevariation = 4 -- This is the CATEGORY number used to determine your undershirt/belt item number
Config.shoespeddrawablevariation = 6 -- This is the CATEGORY number used to determine your shoes item number
Config.maskdrawablevariation = 1 -- This is the CATEGORY number used to determine your mask item number

--Clothing prop and texture numbers.  These will need to be changed according to your framework documentation or to the default native variables found here http://gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
Config.hatpedpropindex = 0 -- This is the CATEGORY number used to determine your hat item number
Config.hatpedproptextureindex = 0 -- This is the TEXTURE number used to get the texture ID of your peds hat texture
Config.glassespedpropindex = 1 -- This is the CATEGORY number used to determine your glasses/eyewear item number

--Fire Gear Clothing Items.  These are the ITEM numbers for the clothing items and will need to be adjusted according to YOUR EUP.  You can find these numbers using vMenu or whatever clothing script you use.
Config.mfirehat = 45
Config.mfiremask = 28
Config.mfiretorso = 315
Config.mfireundershirt = 151
Config.mfirepants = 120
Config.mfireshoes = 71
Config.ffirehat = 44
Config.ffiremask = 28
Config.ffiretorso = 325
Config.ffireundershirt = 187
Config.ffirepants = 126
Config.ffireshoes = 52

--Scuba Gear Clothing Items.  These are the ITEM numbers for the clothing items and will need to be adjusted according to YOUR EUP.  You can find these numbers using vMenu or whatever clothing script you use.
Config.mscubagoggles = 26
Config.mscubaundershirt = 123
Config.mscubashoes = 67
Config.fscubagoggles = 28
Config.fscubaundershirt = 153
Config.fscubashoes = 70

--Bomb Gear Clothing Items.  These are the ITEM numbers for the clothing items and will need to be adjusted according to YOUR EUP.  You can find these numbers using vMenu or whatever clothing script you use.
Config.mbombhat = 123
Config.mbombarms = 110
Config.mbombtorso = 186
Config.mbombundershirt = 97
Config.mbombpants = 84
Config.mbombshoes = 25
Config.fbombhat = 122
Config.fbombarms = 127
Config.fbombtorso = 188
Config.fbombundershirt = 105
Config.fbombpants = 86
Config.fbombshoes = 25

--NightVision Goggles/Helmets Items.  These are the ITEM numbers for the clothing items and will need to be adjusted according to YOUR EUP.  You can find these numbers using vMenu or whatever clothing script you use.
Config.mnvgup = 117 --male nightvision goggles in the up (not used) position
Config.mnvgdown = 116 --male nightvision goggles in the down (in-use) position
Config.fnvgup = 116 --female nightvision goggles in the up (not used) position
Config.fnvgdown = 115 --female nightvision goggles in the down (in-use) position

--Thermal Goggles/Helmets Items.  These are the ITEM numbers for the clothing items and will need to be adjusted according to YOUR EUP.  You can find these numbers using vMenu or whatever clothing script you use.
Config.mthermalup = 119 --male thermal goggles in the up (not used) position
Config.mthermaldown = 118 --male thermal goggles in the down (in-use) position
Config.fthermalup = 118 --female thermal goggles in the up (not used) position
Config.fthermaldown = 117 --female thermal goggles in the down (in-use) position
