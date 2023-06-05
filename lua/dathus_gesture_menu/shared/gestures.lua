--[[ 
 Dathus' Gesture Menu
 
 Copyright (c) 2013-2023 Dathus [BR] <http://www.Dathusbr.net>
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 $Id$
 Version 1.3.X by Dathus [BR] on 2023-06-05 08:00 PM (GMT -03)
]]

-- Setup Act List
DathusGestureMenuOptions = {}
DathusGestureMenuOptions["dance"] = "Dance"
DathusGestureMenuOptions["muscle"] = "Sexy Dance"
DathusGestureMenuOptions["robot"] = "Robot Dance"
DathusGestureMenuOptions["pers"] = "Crane Kick"
DathusGestureMenuOptions["zombie"] = "Zombie"
DathusGestureMenuOptions["agree"] = "Agree"
DathusGestureMenuOptions["disagree"] = "Disagree"
DathusGestureMenuOptions["salute"] = "Salute"
DathusGestureMenuOptions["bow"] = "Bow"
DathusGestureMenuOptions["wave"] = "Hello"
DathusGestureMenuOptions["becon"] = "Follow"
DathusGestureMenuOptions["halt"] = "Halt"
DathusGestureMenuOptions["group"] = "Group"
DathusGestureMenuOptions["forward"] = "Forward"
DathusGestureMenuOptions["cheer"] = "Hell Yeah"
DathusGestureMenuOptions["laugh"] = "Laugh"

DathusGestureMenuSounds = {}
DathusGestureMenuSounds["dance"] = ""
DathusGestureMenuSounds["muscle"] = ""
DathusGestureMenuSounds["robot"] = ""
DathusGestureMenuSounds["pers"] = ""
DathusGestureMenuSounds["zombie"] = {
	["male"] = {
		"vo/npc/male01/zombies01.wav",
		"vo/npc/male01/zombies02.wav"
	},
	["female"] = {
		"vo/npc/female01/zombies01.wav",
		"vo/npc/female01/zombies02.wav"
	}
}
DathusGestureMenuSounds["agree"] = {
	["male"] = {
		"vo/npc/male01/ok01.wav",
		"vo/npc/male01/ok02.wav"
	},
	["female"] = {
		"vo/npc/female01/ok01.wav",
		"vo/npc/female01/ok02.wav"
	}
}
DathusGestureMenuSounds["disagree"] = {
	["male"] = {
		"vo/npc/male01/no01.wav",
		"vo/npc/male01/no02.wav"
	},
	["female"] = {
		"vo/npc/female01/no01.wav",
		"vo/npc/female01/no02.wav"
	}
}
DathusGestureMenuSounds["salute"] = {
	["male"] = {
		"vo/npc/male01/hi01.wav",
		"vo/npc/male01/hi02.wav"
	},
	["female"] = {
		"vo/npc/female01/hi01.wav",
		"vo/npc/female01/hi02.wav"
	}
}
DathusGestureMenuSounds["bow"] = {
	["male"] = {
		"vo/npc/male01/squad_affirm01.wav",
		"vo/npc/male01/squad_affirm02.wav",
		"vo/npc/male01/squad_affirm03.wav",
		"vo/npc/male01/squad_affirm04.wav",
		"vo/npc/male01/squad_affirm05.wav",
		"vo/npc/male01/squad_affirm06.wav",
		"vo/npc/male01/squad_affirm07.wav",
		"vo/npc/male01/squad_affirm08.wav",
		"vo/npc/male01/squad_affirm09.wav"		
	},
	["female"] = {
		"vo/npc/female01/squad_affirm01.wav",
		"vo/npc/female01/squad_affirm02.wav",
		"vo/npc/female01/squad_affirm03.wav",
		"vo/npc/female01/squad_affirm04.wav",
		"vo/npc/female01/squad_affirm05.wav",
		"vo/npc/female01/squad_affirm06.wav",
		"vo/npc/female01/squad_affirm07.wav",
		"vo/npc/female01/squad_affirm08.wav",
		"vo/npc/female01/squad_affirm09.wav"
	}
}
DathusGestureMenuSounds["wave"] = {
	["male"] = {
		"vo/npc/male01/hellodrfm01.wav",
		"vo/npc/male01/hellodrfm02.wav"
	},
	["female"] = {
		"vo/npc/female01/hellodrfm01.wav",
		"vo/npc/female01/hellodrfm02.wav"
	}
}
DathusGestureMenuSounds["becon"] = {
	["male"] = {
		"vo/coast/odessa/male01/stairman_follow01.wav",
		"vo/coast/odessa/male01/stairman_follow03.wav"
	},
	["female"] = {
		"vo/coast/odessa/female01/stairman_follow01.wav",
		"vo/coast/odessa/female01/stairman_follow03.wav"
	}
}
DathusGestureMenuSounds["halt"] = {
	["male"] = {
		"vo/npc/male01/stopitfm.wav"
	},
	["female"] = {
		"vo/npc/female01/stopitfm.wav"
	}
}
DathusGestureMenuSounds["group"] = {
	["male"] = {
		"vo/npc/male01/squad_away01.wav",
		"vo/npc/male01/squad_away02.wav",
		"vo/npc/male01/squad_away03.wav"
	},	
	["female"] = {
		"vo/npc/female01/squad_away01.wav",
		"vo/npc/female01/squad_away02.wav",
		"vo/npc/female01/squad_away03.wav"
	}
}
DathusGestureMenuSounds["forward"] = {
	["male"] = {
		"vo/npc/male01/letsgo01.wav",
		"vo/npc/male01/letsgo02.wav"
	},
	["female"] = {
		"vo/npc/female01/letsgo01.wav",
		"vo/npc/female01/letsgo02.wav"
	}
}
DathusGestureMenuSounds["cheer"] = {
	["male"] = {
		"vo/coast/odessa/male01/nlo_cheer01.wav",
		"vo/coast/odessa/male01/nlo_cheer02.wav",
		"vo/coast/odessa/male01/nlo_cheer03.wav",
		"vo/coast/odessa/male01/nlo_cheer04.wav"
	},
	["female"] = {
		"vo/coast/odessa/female01/nlo_cheer01.wav",
		"vo/coast/odessa/female01/nlo_cheer02.wav",
		"vo/coast/odessa/female01/nlo_cheer03.wav"
	}
}
DathusGestureMenuSounds["laugh"] = {
	["male"] = {
		"vo/npc/Barney/ba_laugh01.wav",
		"vo/npc/Barney/ba_laugh02.wav",
		"vo/npc/Barney/ba_laugh03.wav",
		"vo/npc/Barney/ba_laugh04.wav"
	}
}