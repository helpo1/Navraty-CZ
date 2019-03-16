instance DIA_Addon_WispDetector_EXIT(C_Info)
{
	npc = Wisp_Detector;
	nr = 999;
	condition = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

instance DIA_Addon_WispDetector_DetectItems(C_Info)
{
	npc = Wisp_Detector;
	nr = 1;
	condition = DIA_Addon_WispDetector_DetectItems_Condition;
	information = DIA_Addon_WispDetector_DetectItems_Info;
	permanent = TRUE;
	description = "Začni hledat...";
};

func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_15_00");	//Začni hledat...
	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);

	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... runy a svitky.",DIA_Addon_WispDetector_DetectItems_RUNE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... zlato, klíče a další užitečné věci.",DIA_Addon_WispDetector_DetectItems_NONE);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... střelné zbraně a munici.",DIA_Addon_WispDetector_DetectItems_FF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... zbraně na blízko.",DIA_Addon_WispDetector_DetectItems_NF);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... jídlo a byliny.",DIA_Addon_WispDetector_DetectItems_FOOD);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... prsteny a amulety.",DIA_Addon_WispDetector_DetectItems_MAGIC);
	};
	if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... jakékoliv lektvary.",DIA_Addon_WispDetector_DetectItems_POTIONS);
	};

	Info_AddChoice(DIA_Addon_WispDetector_DetectItems,"... vše, co dokážeš najít.",DIA_Addon_WispDetector_DetectItems_ALL);
};

func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_ALL_15_00");	//Hledej vše, co dokážeš najít.
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_POTIONS_15_00");	//Hledej jakékoliv lektvary.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_MAGIC_15_00");	//Hledej prsteny a amulety.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FOOD_15_00");	//Hledej jídlo a byliny.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NF_15_00");	//Hledej zbraně na blízko.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_FF_15_00");	//Hledej střelné zbraně a munici.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_NONE_15_00");	//Hledej zlato, klíče a další užitečné věci.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other,self,"DIA_Addon_WispDetector_DetectItems_RUNE_15_00");	//Hledej runy a svitky.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};