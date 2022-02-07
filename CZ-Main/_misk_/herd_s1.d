/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

(21x) systém výroby přepracován pomocí spinnerů
func void pc_herd_fleischbraten_info - opraven výstupní produkt (ItMi_Pan -> ItFoMutton)

*/



var int HerdFish;
var int HerdMeat;
var int HerdBug;
var int HerwFish;
var int HerwMeat;
var int HerwBug;
var int HerdCake;
var int NeedPan;
var int CampfireRest;

//----------------------------------------Zharka---------------------------------------

func void herdpan_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		NeedPan = FALSE;
		AI_ProcessInfos(her);
	};
};

func void herd_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		NeedPan = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_HERD_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_herd_exit_condition;
	information = pc_herd_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_herd_exit_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE))
	{
		return TRUE;
	};
};

func void pc_herd_exit_info()
{
	if((NeedPan == TRUE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") > 500))
	{
		if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
		{
			Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		}
		else
		{
			Npc_RemoveInvItems(hero,ItFoMutton,1);
		};

		CreateInvItems(hero,ItMi_Pan,1);
		NeedPan = FALSE;
	};
	if(Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") < 500)
	{
		CreateInvItems(hero,ITMI_BROTSCHIEBER,1);
	};

	b_endproductiondialog();
	HerdFish = FALSE;
	HerdMeat = FALSE;
	HerdBug = FALSE;
};

instance PC_Herd_Meat(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Meat_Condition;
	information = PC_Herd_Meat_Info;
	permanent = TRUE;
	description = "s@SPIN_Herd_Meat Opéct maso";
};

func int PC_Herd_Meat_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFoMuttonRaw) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herd_Meat");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herd_Meat
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herd_Meat ");
		newDescription = ConcatStrings(newDescription, "Opéct maso");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herd_Meat.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herd_Meat_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFoMutton,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herd_Fish(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Fish_Condition;
	information = PC_Herd_Fish_Info;
	permanent = TRUE;
	description = "s@SPIN_Herd_Fish Opéct ryby";
};

func int PC_Herd_Fish_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Fish) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herd_Fish");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herd_Fish
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herd_Fish ");
		newDescription = ConcatStrings(newDescription, "Opéct ryby");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herd_Fish.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herd_Fish_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_fish_gebraten,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herd_Bug(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Bug_Condition;
	information = PC_Herd_Bug_Info;
	permanent = TRUE;
	description = "s@SPIN_Herd_Bug Opéct maso ze žravé štěnice";
};

func int PC_Herd_Bug_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItAt_Meatbugflesh) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herd_Bug");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herd_Bug
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herd_Bug ");
		newDescription = ConcatStrings(newDescription, "Opéct maso ze žravé štěnice");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herd_Bug.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herd_Bug_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itat_meatbugflesh_gebraten,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herd_Cake(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herd_Cake_Condition;
	information = PC_Herd_Cake_Info;
	permanent = TRUE;
	description = "Upéct koláč...";
};

func int PC_Herd_Cake_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == FALSE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500))
	{
		return TRUE;
	};
};

func void PC_Herd_Cake_Info()
{
	HerdCake = TRUE;
};

instance PC_Herd_Cake_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herd_Cake_BACK_Condition;
	information = PC_Herd_Cake_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herd_Cake_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (HerdCake == TRUE) && (HerdFish == FALSE) && (HerdMeat == FALSE) && (HerdBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herd_Cake_BACK_Info()
{
	HerdCake = FALSE;
};

instance PC_HERD_Cake_Apple(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Apple_condition;
	information = PC_HERD_Cake_Apple_info;
	permanent = 1;
	important = 0;
	description = "s@SPIN_HERD_Cake_Apple ... upéct jablečný koláč";
};

func int PC_HERD_Cake_Apple_condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_01 == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Apple) / 25;
		max = min(max, Npc_HasItems(other, ItFo_Bread) / 5);
		max = min(max, Npc_HasItems(other, ItFo_Cheese) / 1);
		max = min(max, Npc_HasItems(other, ItPl_Blueplant) / 1);
		max = min(max, Npc_HasItems(other, ItFo_Water) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_HERD_Cake_Apple");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_HERD_Cake_Apple
		newDescription = ConcatStrings(newDescription, "s@SPIN_HERD_Cake_Apple ");
		newDescription = ConcatStrings(newDescription, "... upéct jablečný koláč");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_HERD_Cake_Apple.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_HERD_Cake_Apple_info()
{
	AI_Wait(hero,1);
	B_GivePlayerXP(10*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Apple,25*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Bread,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Cheese,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Blueplant,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Water,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_Cake_Apple,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_HERD_Cake_Meat(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Meat_condition;
	information = PC_HERD_Cake_Meat_info;
	permanent = 1;
	important = 0;
	description = "s@SPIN_HERD_Cake_Meat ... upéct masový koláč";
};

func int PC_HERD_Cake_Meat_condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_02 == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFoMuttonRaw) / 25;
		max = min(max, Npc_HasItems(other, ItFo_Bread) / 5);
		max = min(max, Npc_HasItems(other, ItFo_Milk) / 2);
		max = min(max, Npc_HasItems(other, ItFo_Cheese) / 2);
		max = min(max, Npc_HasItems(other, ItFo_Booze) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_HERD_Cake_Meat");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_HERD_Cake_Meat
		newDescription = ConcatStrings(newDescription, "s@SPIN_HERD_Cake_Meat ");
		newDescription = ConcatStrings(newDescription, "... upéct masový koláč");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_HERD_Cake_Meat.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_HERD_Cake_Meat_info()
{
	AI_Wait(hero,1);
	B_GivePlayerXP(20*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,25*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Bread,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Milk,2*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Cheese,2*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Booze,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_Cake_Meat,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_HERD_Cake_Mushroom(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Mushroom_condition;
	information = PC_HERD_Cake_Mushroom_info;
	permanent = 1;
	important = 0;
	description = "s@SPIN_HERD_Cake_Mushroom ... upéct houbový koláč";
};

func int PC_HERD_Cake_Mushroom_condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_03 == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Mushroom_02) / 25;
		max = min(max, Npc_HasItems(other, ItFo_Bread) / 5);
		max = min(max, Npc_HasItems(other, ItFo_Cheese) / 3);
		max = min(max, Npc_HasItems(other, ItFo_Wine) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_HERD_Cake_Mushroom");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_HERD_Cake_Mushroom
		newDescription = ConcatStrings(newDescription, "s@SPIN_HERD_Cake_Mushroom ");
		newDescription = ConcatStrings(newDescription, "... upéct houbový koláč");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_HERD_Cake_Mushroom.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_HERD_Cake_Mushroom_info()
{
	AI_Wait(hero,1);
	B_GivePlayerXP(30*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,25*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Bread,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Cheese,3*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Wine,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_Cake_Mushroom,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_HERD_Cake_Fish(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Fish_condition;
	information = PC_HERD_Cake_Fish_info;
	permanent = 1;
	important = 0;
	description = "s@SPIN_HERD_Cake_Fish ... upéct rybí koláč";
};

func int PC_HERD_Cake_Fish_condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_04 == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Fish) / 20;
		max = min(max, Npc_HasItems(other, ItFo_Bread) / 5);
		max = min(max, Npc_HasItems(other, ItPl_Blueplant) / 2);
		max = min(max, Npc_HasItems(other, ItFo_Booze) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_HERD_Cake_Fish");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_HERD_Cake_Fish
		newDescription = ConcatStrings(newDescription, "s@SPIN_HERD_Cake_Fish ");
		newDescription = ConcatStrings(newDescription, "... upéct rybí koláč");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_HERD_Cake_Fish.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_HERD_Cake_Fish_info()
{
	AI_Wait(hero,1);
	B_GivePlayerXP(40*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Fish,20*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Bread,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Blueplant,2*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Booze,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_Cake_Fish,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_HERD_Cake_Honey(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_HERD_Cake_Honey_condition;
	information = PC_HERD_Cake_Honey_info;
	permanent = 1;
	important = 0;
	description = "s@SPIN_HERD_Cake_Honey ... upéct medový koláč";
};

func int PC_HERD_Cake_Honey_condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == FALSE) && (Npc_GetDistToWP(hero,"NW_BIGFARM_KITCHEN_04") <= 500) && (HerdCake == TRUE) && (Thekla_Cake_05 == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Honey) / 5;
		max = min(max, Npc_HasItems(other, ItFo_Bread) / 5);
		max = min(max, Npc_HasItems(other, ItFo_Cheese) / 3);
		max = min(max, Npc_HasItems(other, ItFo_Milk) / 1);
		max = min(max, Npc_HasItems(other, ITFO_WINEBERRYS) / 1);
		max = min(max, Npc_HasItems(other, ItFo_Wine) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_HERD_Cake_Honey");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_HERD_Cake_Honey
		newDescription = ConcatStrings(newDescription, "s@SPIN_HERD_Cake_Honey ");
		newDescription = ConcatStrings(newDescription, "... upéct medový koláč");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_HERD_Cake_Honey.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_HERD_Cake_Honey_info()
{
	AI_Wait(hero,1);
	B_GivePlayerXP(50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Honey,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Bread,5*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Cheese,3*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Milk,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITFO_WINEBERRYS,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItFo_Wine,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_Cake_Honey,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

//----------------------------------------Kompoty---------------------------------------

func void kessel_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_KESSEL;
		AI_ProcessInfos(her);
	};
};

func void pc_kessel_peach_back()
{
	Info_ClearChoices(pc_kessel_peach);
};

instance PC_KESSEL_PEACH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_KESSEL_PEACH_condition;
	information = PC_KESSEL_PEACH_info;
	permanent = 1;
	important = 0;
	description = "Uvařit kompot...";
};

func int PC_KESSEL_PEACH_condition()
{
	
	// Original dialogue condition
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Choice #1
		
		var int value1;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Planeberry) / 20;
		max = min(max, Npc_HasItems(other, ItPl_Health_Herb_01) / 1);
		
		// Check boundaries
		if(value1 < min) { value1 = min; };
		if(value1 > max) { value1 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_KESSEL_PEACH_compote_01");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value1;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value1 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_KESSEL_PEACH_compote_01
		newDescription = ConcatStrings(newDescription, "s@SPIN_KESSEL_PEACH_compote_01 ");
		newDescription = ConcatStrings(newDescription, "... uvařit kompot z lučních bobulí (20x luční bobule, 1x léčivá rostlina)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value1));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_KESSEL_PEACH_compote_01");
		
//-- Spinner Choice #2
		
		var int value2;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Forestberry) / 30;
		max = min(max, Npc_HasItems(other, ItPl_Health_Herb_02) / 1);
		
		// Check boundaries
		if(value2 < min) { value2 = min; };
		if(value2 > max) { value2 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_KESSEL_PEACH_compote_00");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value2;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value2 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_KESSEL_PEACH_compote_00
		newDescription = ConcatStrings(newDescription, "s@SPIN_KESSEL_PEACH_compote_00 ");
		newDescription = ConcatStrings(newDescription, "... uvařit kompot z lesních bobulí (30x lesní bobule, 1x léčivá bylina)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value2));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_KESSEL_PEACH_compote_00");
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void B_Kessel_Peach()
{
	Info_ClearChoices(PC_KESSEL_PEACH);
	Info_AddChoice(PC_KESSEL_PEACH,Dialog_Back,PC_KESSEL_PEACH_back);

	if((Rezept_Compote_01 == TRUE) && (Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_01) >= 1))
	{
		Info_AddChoice(PC_KESSEL_PEACH,"s@SPIN_KESSEL_PEACH_compote_01 ... uvařit kompot z lučních bobulí (20x luční bobule, 1x léčivá rostlina)",PC_KESSEL_PEACH_compote_01);
	};
	if((Rezept_Compote_02 == TRUE) && (Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		Info_AddChoice(PC_KESSEL_PEACH,"s@SPIN_KESSEL_PEACH_compote_00 ... uvařit kompot z lesních bobulí (30x lesní bobule, 1x léčivá bylina)",PC_KESSEL_PEACH_compote_00);
	};
};

func void PC_KESSEL_PEACH_info()
{
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_00()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Forestberry,30*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_compote_00,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Peach();
};

func void PC_KESSEL_PEACH_compote_01()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Planeberry,20*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Health_Herb_01,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_compote_01,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Peach();
};

func void pc_kessel_fischsuppe_back()
{
	Info_ClearChoices(pc_kessel_fischsuppe);
};

instance PC_KESSEL_FISCHSUPPE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_kessel_fischsuppe_condition;
	information = pc_kessel_fischsuppe_info;
	permanent = 1;
	important = 0;
	description = "Uvařit polévku...";
};

func int pc_kessel_fischsuppe_condition()
{
	
	// Original dialogue condition
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Choice #1
		
		var int value1;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Beet) / 1;
		
		// Check boundaries
		if(value1 < min) { value1 = min; };
		if(value1 > max) { value1 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_kessel_fischsuppe_Beet");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value1;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value1 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_kessel_fischsuppe_Beet
		newDescription = ConcatStrings(newDescription, "s@SPIN_kessel_fischsuppe_Beet ");
		newDescription = ConcatStrings(newDescription, "... uvařit tuřínovou polévku (1x tuřín)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value1));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_kessel_fischsuppe_Beet");
		
//-- Spinner Choice #2
		
		var int value2;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Fish) / 1;
		
		// Check boundaries
		if(value2 < min) { value2 = min; };
		if(value2 > max) { value2 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_kessel_fischsuppe_fish");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value2;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value2 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_kessel_fischsuppe_fish
		newDescription = ConcatStrings(newDescription, "s@SPIN_kessel_fischsuppe_fish ");
		newDescription = ConcatStrings(newDescription, "... uvařit rybí polévku (1x ryba)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value2));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_kessel_fischsuppe_fish");
		
//-- Spinner Choice #3
		
		var int value3;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, itfoschildkroeteraw) / 1;
		
		// Check boundaries
		if(value3 < min) { value3 = min; };
		if(value3 > max) { value3 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_kessel_shildkroetesoup");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value3;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value3 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_kessel_shildkroetesoup
		newDescription = ConcatStrings(newDescription, "s@SPIN_kessel_shildkroetesoup ");
		newDescription = ConcatStrings(newDescription, "... uvařit želví polévku (1x želví maso)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value3));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_kessel_shildkroetesoup");
		
//-- Spinner Choice #4
		
		var int value4;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Mushroom_02) / 1;
		
		// Check boundaries
		if(value4 < min) { value4 = min; };
		if(value4 > max) { value4 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_kessel_pilzsuppe");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value4;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value4 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_kessel_pilzsuppe
		newDescription = ConcatStrings(newDescription, "s@SPIN_kessel_pilzsuppe ");
		newDescription = ConcatStrings(newDescription, "... uvařit houbovou polévku (1x otrokův chléb)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value4));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_kessel_pilzsuppe");
		
//-- Spinner Choice #5
		
		var int value5;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFoMuttonRaw) / 1;
		
		// Check boundaries
		if(value5 < min) { value5 = min; };
		if(value5 > max) { value5 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_kessel_meet");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value5;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value5 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_kessel_meet
		newDescription = ConcatStrings(newDescription, "s@SPIN_kessel_meet ");
		newDescription = ConcatStrings(newDescription, "... uvařit masovou polévku (1x syrové maso)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value5));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_kessel_meet");
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void B_Kessel_Supp()
{
	Info_ClearChoices(pc_kessel_fischsuppe);
	Info_AddChoice(pc_kessel_fischsuppe,Dialog_Back,pc_kessel_fischsuppe_back);


	if((Edda_Soup_00 == TRUE) && (Npc_HasItems(hero,ItPl_Beet) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe,"s@SPIN_kessel_fischsuppe_Beet ... uvařit tuřínovou polévku (1x tuřín)",pc_kessel_fischsuppe_Beet);
	};
	if((Edda_Soup_01 == TRUE) && (Npc_HasItems(hero,ItFo_Fish) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe,"s@SPIN_kessel_fischsuppe_fish ... uvařit rybí polévku (1x ryba)",pc_kessel_fischsuppe_fish);
	};
	if((Edda_Soup_02 == TRUE) && (Npc_HasItems(hero,itfoschildkroeteraw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe,"s@SPIN_kessel_shildkroetesoup ... uvařit želví polévku (1x želví maso)",pc_kessel_shildkroetesoup);
	};
	if((Edda_Soup_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe,"s@SPIN_kessel_pilzsuppe ... uvařit houbovou polévku (1x otrokův chléb)",pc_kessel_pilzsuppe);
	};
	if((Edda_Soup_04 == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1))
	{
		Info_AddChoice(pc_kessel_fischsuppe,"s@SPIN_kessel_meet ... uvařit masovou polévku (1x syrové maso)",pc_kessel_meet);
	};
};

func void pc_kessel_fischsuppe_info()
{
	B_Kessel_Supp();
};

func void pc_kessel_fischsuppe_Beet()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Beet,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_BeetSoup,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	InfoManagerSpinnerValue = 1;
	B_Kessel_Supp();
};

func void pc_kessel_fischsuppe_fish()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFo_Fish,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_FishSoup,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Supp();
};

func void pc_kessel_meet()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFo_MeetSoup,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Supp();
};

func void pc_kessel_shildkroetesoup()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,itfoschildkroeteraw,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_schildkroetesoup,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Supp();
};

func void pc_kessel_pilzsuppe()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_pilzsuppe,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Supp();
};

func void pc_kessel_soup_back()
{
	Info_ClearChoices(pc_kessel_soup);
};

instance PC_KESSEL_SOUP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_KESSEL_SOUP_condition;
	information = PC_KESSEL_SOUP_info;
	permanent = 1;
	important = 0;
	description = "Uvařit vývar...";
};

func int PC_KESSEL_SOUP_condition()
{
	
	// Original dialogue condition
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Choice #1
		
		var int value1;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Mushroom_02) / 50;
		max = min(max, Npc_HasItems(other, ItPl_Mana_Herb_03) / 1);
		
		// Check boundaries
		if(value1 < min) { value1 = min; };
		if(value1 > max) { value1 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_KESSEL_SOUP_mana");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value1;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value1 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_KESSEL_SOUP_mana
		newDescription = ConcatStrings(newDescription, "s@SPIN_KESSEL_SOUP_mana ");
		newDescription = ConcatStrings(newDescription, "... uvařit vývar z otrokových chlebů (50x otrokův chléb, 1x ohnivý kořen)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value1));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_KESSEL_SOUP_mana");
		
//-- Spinner Choice #2
		
		var int value2;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Mushroom_01) / 50;
		max = min(max, Npc_HasItems(other, ItPl_Mana_Herb_02) / 1);
		
		// Check boundaries
		if(value2 < min) { value2 = min; };
		if(value2 > max) { value2 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_KESSEL_SOUP_magic");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value2;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value2 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_KESSEL_SOUP_magic
		newDescription = ConcatStrings(newDescription, "s@SPIN_KESSEL_SOUP_magic ");
		newDescription = ConcatStrings(newDescription, "... uvařit vývar z tmavých hub (50x tmavá houba, 1x ohnivé býlí)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value2));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_KESSEL_SOUP_magic");
		
//-- Spinner Choice #3
		
		var int value3;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItPl_Mushroom_01) / 2;
		max = min(max, Npc_HasItems(other, ItAt_Meatbugflesh) / 1);
		
		// Check boundaries
		if(value3 < min) { value3 = min; };
		if(value3 > max) { value3 = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_KESSEL_SOUP_fleischwanzenragout");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value3;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value3 = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_KESSEL_SOUP_fleischwanzenragout
		newDescription = ConcatStrings(newDescription, "s@SPIN_KESSEL_SOUP_fleischwanzenragout ");
		newDescription = ConcatStrings(newDescription, "... uvařit masové ragú (2x tmavá houba, 1x maso ze žravé štěnice)");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value3));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update choice description
		InfoManager_SetInfoChoiceText_BySpinnerID(newDescription, "SPIN_KESSEL_SOUP_fleischwanzenragout");
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void B_Kessel_Soup()
{
	Info_ClearChoices(PC_KESSEL_SOUP);
	Info_AddChoice(PC_KESSEL_SOUP,Dialog_Back,PC_KESSEL_SOUP_back);

	if((Snaf_Meal_02 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_02) >= 50) && (Npc_HasItems(hero,ItPl_Mana_Herb_03) >= 1))
	{
		Info_AddChoice(PC_KESSEL_SOUP,"s@SPIN_KESSEL_SOUP_mana ... uvařit vývar z otrokových chlebů (50x otrokův chléb, 1x ohnivý kořen)",PC_KESSEL_SOUP_mana);
	};
	if((Snaf_Meal_01 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 50) && (Npc_HasItems(hero,ItPl_Mana_Herb_02) >= 1))
	{
		Info_AddChoice(PC_KESSEL_SOUP,"s@SPIN_KESSEL_SOUP_magic ... uvařit vývar z tmavých hub (50x tmavá houba, 1x ohnivé býlí)",PC_KESSEL_SOUP_magic);
	};
	if((Snaf_Meal_03 == TRUE) && (Npc_HasItems(hero,ItPl_Mushroom_01) >= 2) && (Npc_HasItems(hero,ItAt_Meatbugflesh) >= 1))
	{
		Info_AddChoice(PC_KESSEL_SOUP,"s@SPIN_KESSEL_SOUP_fleischwanzenragout ... uvařit masové ragú (2x tmavá houba, 1x maso ze žravé štěnice)",PC_KESSEL_SOUP_fleischwanzenragout);
	};
};

func void PC_KESSEL_SOUP_info()
{
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_mana()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_02,50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_03,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_pottage_mushroom,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Soup();
};

func void PC_KESSEL_SOUP_magic()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItPl_Mana_Herb_02,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_pottage_mushroom_black,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Soup();
};


func void PC_KESSEL_SOUP_fleischwanzenragout()
{
	AI_Wait(hero,1);
	RankPoints = RankPoints + 1;
	Npc_RemoveInvItems(hero,ItPl_Mushroom_01,2*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_fleischwanzenragout,1*InfoManagerSpinnerValue);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
	B_Kessel_Soup();
};

instance PC_KESSEL_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_kessel_exit_condition;
	information = pc_kessel_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_kessel_exit_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_KESSEL)
	{
		return TRUE;
	};
};

func void pc_kessel_exit_info()
{
	b_endproductiondialog();
};


//-------------------koster--------------------------------------

func void herw_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_HERD;
		CampfirePan = TRUE;
		AI_ProcessInfos(her);
	};
};

instance PC_HERW_EXIT(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_herw_exit_condition;
	information = pc_herw_exit_info;
	permanent = 1;
	important = 0;
	description = DIALOG_ENDE_WORK;
};

func int pc_herw_exit_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE))
	{
		return TRUE;
	};
};

func void pc_herw_exit_info()
{
	CampfirePan = FALSE;
	HerwFish = FALSE;
	HerwMeat = FALSE;
	HerwBug = FALSE;
	CheckCampfireMeat = TRUE;
	b_endproductiondialog();
};

instance PC_Herw_Meat(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Meat_Condition;
	information = PC_Herw_Meat_Info;
	permanent = TRUE;
	description = "s@SPIN_Herw_Meat Opéct maso";
};

func int PC_Herw_Meat_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFoMuttonRaw) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herw_Meat");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herw_Meat
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herw_Meat ");
		newDescription = ConcatStrings(newDescription, "Opéct maso");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herw_Meat.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herw_Meat_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,ItFoMutton,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herw_Fish(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Fish_Condition;
	information = PC_Herw_Fish_Info;
	permanent = TRUE;
	description = "s@SPIN_Herw_Fish Opéct ryby";
};

func int PC_Herw_Fish_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItFo_Fish) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herw_Fish");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herw_Fish
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herw_Fish ");
		newDescription = ConcatStrings(newDescription, "Opéct ryby");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herw_Fish.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herw_Fish_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItFo_Fish,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itfo_fish_gebraten,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herw_Bug(C_Info)
{
	npc = PC_Hero;
	condition = PC_Herw_Bug_Condition;
	information = PC_Herw_Bug_Info;
	permanent = TRUE;
	description = "s@SPIN_Herw_Bug Opéct maso ze žravé štěnice";
};

func int PC_Herw_Bug_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItAt_Meatbugflesh) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Herw_Bug");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Herw_Bug
		newDescription = ConcatStrings(newDescription, "s@SPIN_Herw_Bug ");
		newDescription = ConcatStrings(newDescription, "Opéct maso ze žravé štěnice");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Herw_Bug.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Herw_Bug_Info()
{
	AI_Wait(hero,1);
	Npc_RemoveInvItems(hero,ItAt_Meatbugflesh,1*InfoManagerSpinnerValue);
	CreateInvItems(hero,itat_meatbugflesh_gebraten,1*InfoManagerSpinnerValue);
	RankPoints = RankPoints + 1;
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;
};

instance PC_Herw_CampfireRest(C_Info)
{
	npc = PC_Hero;
	nr = 900;
	condition = PC_Herw_CampfireRest_Condition;
	information = PC_Herw_CampfireRest_Info;
	permanent = TRUE;
	description = "Odpočinout si...";
};

func int PC_Herw_CampfireRest_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == FALSE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_CampfireRest_Info()
{
	CampfireRest = TRUE;
};

instance PC_Herw_CampfireRest_BACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_Herw_CampfireRest_BACK_Condition;
	information = PC_Herw_CampfireRest_BACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Herw_CampfireRest_BACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (HerwFish == FALSE) && (HerwMeat == FALSE) && (HerwBug == FALSE))
	{
		return TRUE;
	};
};

func void PC_Herw_CampfireRest_BACK_Info()
{
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_1H(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_herw_CampfireRest_1H_condition;
	information = pc_herw_CampfireRest_1H_info;
	permanent = 1;
	important = 0;
	description = "... 1 hodinu";
};

func int pc_herw_CampfireRest_1H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 1))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_1H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 1;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 10) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool - 1;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour += 1;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_2H(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_herw_CampfireRest_2H_condition;
	information = pc_herw_CampfireRest_2H_info;
	permanent = 1;
	important = 0;
	description = "... 2 hodiny";
};

func int pc_herw_CampfireRest_2H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 2))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_2H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 2;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 1)
		{
			Hero_Hunger -= 1;
		}		
		else
		{
			Hero_Hunger = FALSE;
		};	
		if(Hero_Thirst > 1)
		{
			Hero_Thirst -= 1;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 20) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool - 2;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour += 2;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};

instance PC_HERW_CampfireRest_3H(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_herw_CampfireRest_3H_condition;
	information = pc_herw_CampfireRest_3H_info;
	permanent = 1;
	important = 0;
	description = "... 3 hodiny";
};

func int pc_herw_CampfireRest_3H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_HERD) && (CampfirePan == TRUE) && (CampfireRest == TRUE) && (RestPool >= 3))
	{
		return TRUE;
	};
};

func void pc_herw_CampfireRest_3H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 3;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 2)
		{
			Hero_Hunger -= 2;
		}		
		else
		{
			Hero_Hunger = FALSE;
		};	
		if(Hero_Thirst > 2)
		{
			Hero_Thirst -= 2;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 30) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool - 3;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour += 3;
	Wld_SetTime(bHour,bMinute);
	CampfireRest = FALSE;
};