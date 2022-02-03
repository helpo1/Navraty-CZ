/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

nový soubor

*/



var int cz_settings_lock;



instance PC_CZSET_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_CZSET_end_Condition;
	information = PC_CZSET_end_Info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_CZSET_END_Condition()
{
	if(cz_settings_lock == TRUE)
	{
		return TRUE;
	};
	
	return FALSE;
};

func void PC_CZSET_END_Info()
{
	cz_settings_lock = FALSE;
	AI_StopProcessInfos(self);
	// self.aivar[AIV_INVINCIBLE] = FALSE;
	// PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};





instance PC_CZSET_WARNING_1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_CZSET_WARNING_Condition;
	information = PC_CZSET_WARNING_Info;
	permanent = TRUE;
	description = "d@ VAROVÁNÍ: jakákoliv změna herní obtížnosti ze základních hodnot bude trvale zaznamenána!";
};

instance PC_CZSET_WARNING_2(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_CZSET_WARNING_Condition;
	information = PC_CZSET_WARNING_Info;
	permanent = TRUE;
	description = "d@ Vyberte požadovanou hodnotu použitím šipek, PgUp/PgDown, Home/End a potvrďte klávesou Enter.";
};

func int PC_CZSET_WARNING_Condition()
{
	if(cz_settings_lock == TRUE)
	{
		return TRUE;
	};
	
	return FALSE;
};

func void PC_CZSET_WARNING_Info()
{
	// empty
};





/*

// SETTING TEMPLATE
// replace / set (ex.):

//   DIFF_DNAME -> Diff_HPPerLevel
//   ORIGDESC -> HP za úroveň:
//   nr = 101;
//   value = CZ_Settings_DIFF_DNAME;
//   max = 60;
//   InfoManagerSpinnerPageSize = 5;



// DIFF_DNAME

instance PC_CZSET_DIFF_DNAME(C_Info)
{
	npc = PC_Hero;
	nr = ;
	condition = PC_CZSET_DIFF_DNAME_Condition;
	information = PC_CZSET_DIFF_DNAME_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_DIFF_DNAME ORIGDESC";
};

func int PC_CZSET_DIFF_DNAME_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = ;
		
		// Min/max values
		min = 0;
		max = ;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_DIFF_DNAME");
		
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
			InfoManagerSpinnerPageSize = ;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		// Spinner ID SPIN_CZSET_DIFF_DNAME
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_DIFF_DNAME ");
		newDescription = ConcatStrings(newDescription, "ORIGDESC ");
		
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
		
		// Update dialogue description
		PC_CZSET_DIFF_DNAME.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_DIFF_DNAME_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_DIFF_DNAME = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};

*/



// HP Per Level

instance PC_CZSET_Diff_HPPerLevel(C_Info)
{
	npc = PC_Hero;
	nr = 101;
	condition = PC_CZSET_Diff_HPPerLevel_Condition;
	information = PC_CZSET_Diff_HPPerLevel_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_HPPerLevel HP za úroveň:";
};

func int PC_CZSET_Diff_HPPerLevel_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_HPPerLevel;
		
		// Min/max values
		min = 0;
		max = 60;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_HPPerLevel");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_HPPerLevel
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_HPPerLevel ");
		newDescription = ConcatStrings(newDescription, "HP za úroveň: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_HPPerLevel.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_HPPerLevel_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_HPPerLevel = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// LP Per Level

instance PC_CZSET_Diff_LPPerLevel(C_Info)
{
	npc = PC_Hero;
	nr = 102;
	condition = PC_CZSET_Diff_LPPerLevel_Condition;
	information = PC_CZSET_Diff_LPPerLevel_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_LPPerLevel LP za úroveň:";
};

func int PC_CZSET_Diff_LPPerLevel_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_LPPerLevel;
		
		// Min/max values
		min = 0;
		max = 50;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_LPPerLevel");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_LPPerLevel
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_LPPerLevel ");
		newDescription = ConcatStrings(newDescription, "LP za úroveň: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_LPPerLevel.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_LPPerLevel_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_LPPerLevel = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// XP Mult

instance PC_CZSET_Diff_XPMult(C_Info)
{
	npc = PC_Hero;
	nr = 103;
	condition = PC_CZSET_Diff_XPMult_Condition;
	information = PC_CZSET_Diff_XPMult_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_XPMult Koeficient XP:";
};

func int PC_CZSET_Diff_XPMult_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_XPMult;
		
		// Min/max values
		min = 0;
		max = 50;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_XPMult");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_XPMult
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_XPMult ");
		newDescription = ConcatStrings(newDescription, "Koeficient XP: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_XPMult.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_XPMult_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_XPMult = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Sleep Cap

instance PC_CZSET_Diff_EnableSleepCap(C_Info)
{
	npc = PC_Hero;
	nr = 104;
	condition = PC_CZSET_Diff_EnableSleepCap_Condition;
	information = PC_CZSET_Diff_EnableSleepCap_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_EnableSleepCap Omezení spánku:";
};

func int PC_CZSET_Diff_EnableSleepCap_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_EnableSleepCap;
		
		// Min/max values
		min = 0;
		max = 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_EnableSleepCap");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_EnableSleepCap
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_EnableSleepCap ");
		newDescription = ConcatStrings(newDescription, "Omezení spánku: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_EnableSleepCap.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_EnableSleepCap_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_EnableSleepCap = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Traps

instance PC_CZSET_Diff_EnableTraps(C_Info)
{
	npc = PC_Hero;
	nr = 105;
	condition = PC_CZSET_Diff_EnableTraps_Condition;
	information = PC_CZSET_Diff_EnableTraps_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_EnableTraps Pasti:";
};

func int PC_CZSET_Diff_EnableTraps_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_EnableTraps;
		
		// Min/max values
		min = 0;
		max = 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_EnableTraps");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_EnableTraps
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_EnableTraps ");
		newDescription = ConcatStrings(newDescription, "Pasti: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_EnableTraps.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_EnableTraps_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_EnableTraps = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Hunger

instance PC_CZSET_Diff_EnableHunger(C_Info)
{
	npc = PC_Hero;
	nr = 106;
	condition = PC_CZSET_Diff_EnableHunger_Condition;
	information = PC_CZSET_Diff_EnableHunger_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_EnableHunger Hlad:";
};

func int PC_CZSET_Diff_EnableHunger_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_EnableHunger;
		
		// Min/max values
		min = 0;
		max = 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_EnableHunger");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_EnableHunger
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_EnableHunger ");
		newDescription = ConcatStrings(newDescription, "Hlad: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_EnableHunger.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_EnableHunger_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_EnableHunger = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Hunger Pool Base

instance PC_CZSET_Diff_HungerPoolBase(C_Info)
{
	npc = PC_Hero;
	nr = 107;
	condition = PC_CZSET_Diff_HungerPoolBase_Condition;
	information = PC_CZSET_Diff_HungerPoolBase_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_HungerPoolBase Hunger Pool Base:";
};

func int PC_CZSET_Diff_HungerPoolBase_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_HungerPoolBase;
		
		// Min/max values
		min = 0;
		max = 2480;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_HungerPoolBase");
		
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
			InfoManagerSpinnerPageSize = 124;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		// Spinner ID SPIN_CZSET_Diff_HungerPoolBase
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_HungerPoolBase ");
		newDescription = ConcatStrings(newDescription, "Hunger Pool Base: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_HungerPoolBase.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_HungerPoolBase_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_HungerPoolBase = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Hunger Pool Level Multiplier

instance PC_CZSET_Diff_HungerPoolLevelMult(C_Info)
{
	npc = PC_Hero;
	nr = 108;
	condition = PC_CZSET_Diff_HungerPoolLevelMult_Condition;
	information = PC_CZSET_Diff_HungerPoolLevelMult_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_HungerPoolLevelMult Hunger Pool Level:";
};

func int PC_CZSET_Diff_HungerPoolLevelMult_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_HungerPoolLevelMult;
		
		// Min/max values
		min = 0;
		max = 20;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_HungerPoolLevelMult");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_HungerPoolLevelMult
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_HungerPoolLevelMult ");
		newDescription = ConcatStrings(newDescription, "Hunger Pool Level: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_HungerPoolLevelMult.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_HungerPoolLevelMult_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_HungerPoolLevelMult = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Thirst

instance PC_CZSET_Diff_EnableThirst(C_Info)
{
	npc = PC_Hero;
	nr = 109;
	condition = PC_CZSET_Diff_EnableThirst_Condition;
	information = PC_CZSET_Diff_EnableThirst_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_EnableThirst Žízeň:";
};

func int PC_CZSET_Diff_EnableThirst_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_EnableThirst;
		
		// Min/max values
		min = 0;
		max = 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_EnableThirst");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_EnableThirst
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_EnableThirst ");
		newDescription = ConcatStrings(newDescription, "Žízeň: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_EnableThirst.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_EnableThirst_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_EnableThirst = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Thirst Pool Base

instance PC_CZSET_Diff_ThirstPoolBase(C_Info)
{
	npc = PC_Hero;
	nr = 110;
	condition = PC_CZSET_Diff_ThirstPoolBase_Condition;
	information = PC_CZSET_Diff_ThirstPoolBase_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_ThirstPoolBase Thirst Pool Base:";
};

func int PC_CZSET_Diff_ThirstPoolBase_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_ThirstPoolBase;
		
		// Min/max values
		min = 0;
		max = 3080;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_ThirstPoolBase");
		
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
			InfoManagerSpinnerPageSize = 154;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		// Spinner ID SPIN_CZSET_Diff_ThirstPoolBase
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_ThirstPoolBase ");
		newDescription = ConcatStrings(newDescription, "Thirst Pool Base: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_ThirstPoolBase.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_ThirstPoolBase_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_ThirstPoolBase = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Thirst Pool Level Multiplier

instance PC_CZSET_Diff_ThirstPoolLevelMult(C_Info)
{
	npc = PC_Hero;
	nr = 111;
	condition = PC_CZSET_Diff_ThirstPoolLevelMult_Condition;
	information = PC_CZSET_Diff_ThirstPoolLevelMult_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_ThirstPoolLevelMult Thirst Pool Level:";
};

func int PC_CZSET_Diff_ThirstPoolLevelMult_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_ThirstPoolLevelMult;
		
		// Min/max values
		min = 0;
		max = 20;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_ThirstPoolLevelMult");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_ThirstPoolLevelMult
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_ThirstPoolLevelMult ");
		newDescription = ConcatStrings(newDescription, "Thirst Pool Level: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_ThirstPoolLevelMult.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_ThirstPoolLevelMult_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_ThirstPoolLevelMult = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Fatigue

instance PC_CZSET_Diff_EnableFatigue(C_Info)
{
	npc = PC_Hero;
	nr = 112;
	condition = PC_CZSET_Diff_EnableFatigue_Condition;
	information = PC_CZSET_Diff_EnableFatigue_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_EnableFatigue Únava:";
};

func int PC_CZSET_Diff_EnableFatigue_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_EnableFatigue;
		
		// Min/max values
		min = 0;
		max = 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_EnableFatigue");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_EnableFatigue
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_EnableFatigue ");
		newDescription = ConcatStrings(newDescription, "Únava: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_EnableFatigue.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_EnableFatigue_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_EnableFatigue = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Fatigue Pool Base

instance PC_CZSET_Diff_FatiguePoolBase(C_Info)
{
	npc = PC_Hero;
	nr = 113;
	condition = PC_CZSET_Diff_FatiguePoolBase_Condition;
	information = PC_CZSET_Diff_FatiguePoolBase_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_FatiguePoolBase Fatigue Pool Base:";
};

func int PC_CZSET_Diff_FatiguePoolBase_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_FatiguePoolBase;
		
		// Min/max values
		min = 0;
		max = 4320;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_FatiguePoolBase");
		
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
			InfoManagerSpinnerPageSize = 216;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		// Spinner ID SPIN_CZSET_Diff_FatiguePoolBase
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_FatiguePoolBase ");
		newDescription = ConcatStrings(newDescription, "Fatigue Pool Base: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_FatiguePoolBase.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_FatiguePoolBase_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_FatiguePoolBase = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};



// Fatigue Pool Level Multiplier

instance PC_CZSET_Diff_FatiguePoolLevelMult(C_Info)
{
	npc = PC_Hero;
	nr = 114;
	condition = PC_CZSET_Diff_FatiguePoolLevelMult_Condition;
	information = PC_CZSET_Diff_FatiguePoolLevelMult_Info;
	permanent = TRUE;
	description = "s@SPIN_CZSET_Diff_FatiguePoolLevelMult Fatigue Pool Level:";
};

func int PC_CZSET_Diff_FatiguePoolLevelMult_Condition()
{

	// Original dialogue condition
	if(cz_settings_lock == TRUE)
	{
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		value = CZ_Settings_Diff_FatiguePoolLevelMult;
		
		// Min/max values
		min = 0;
		max = 20;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_CZSET_Diff_FatiguePoolLevelMult");
		
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
		
		// Spinner ID SPIN_CZSET_Diff_FatiguePoolLevelMult
		newDescription = ConcatStrings(newDescription, "s@SPIN_CZSET_Diff_FatiguePoolLevelMult ");
		newDescription = ConcatStrings(newDescription, "Fatigue Pool Level: ");
		
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
		
		// Update dialogue description
		PC_CZSET_Diff_FatiguePoolLevelMult.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};

};

func void PC_CZSET_Diff_FatiguePoolLevelMult_Info()
{
	CZ_Settings_Diff_Changed = TRUE;
	AI_Wait(hero,1);
	CZ_Settings_Diff_FatiguePoolLevelMult = InfoManagerSpinnerValue;
	InfoManagerSpinnerValue = 1;
};





instance CZ_Settings_Book(C_Item)
{
	name = "Kniha nastavení";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha nastavení";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseItem_CZSettingsBook;
	inv_animate = 1;
};

func void UseItem_CZSettingsBook()
{
	if(Npc_IsPlayer(self))
	{
		cz_settings_lock = TRUE;
		AI_ProcessInfos(self);
	};
};

func void CZ_KeepSettingsBookInInventory()
{
	var int currentBooksAmount;
	currentBooksAmount = Npc_HasItems(hero, CZ_Settings_Book);

	if(currentBooksAmount < 1)
	{
		CreateInvItems(hero, CZ_Settings_Book, 1);
	}
	else if(currentBooksAmount > 1)
	{
		Npc_RemoveInvItems(hero, CZ_Settings_Book, currentBooksAmount - 1);
	};
};
