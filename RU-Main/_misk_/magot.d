//-----------------------------вызвать через хоткей LCONTROL+LSHIFT+K--------------------------------------------------------

instance ItWr_UndefBook(C_Item)
{
	name = "Для тестов - Том I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Addon_Hinweis_UndefBook;
	scemeName = "MAP";
	description = name ;
	inv_animate = 1;
};

func void Use_ItWr_Addon_Hinweis_UndefBook()
{
};

//-----------------------------зачарование--------------------------------------------------------

func void ENCHANT_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_MEMORIES;
		AI_ProcessInfos(her);
	};
};

instance PC_ENCHANT_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ENCHANT_End_Condition;
	information = PC_ENCHANT_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_ENCHANT_End_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_MEMORIES) && (Npc_GetDistToWP(hero,"ITUSELDTOWER_START") < 5000))
	{
		return TRUE;
	};
};

func void PC_ENCHANT_End_Info()
{
	b_endproductiondialog();
};
