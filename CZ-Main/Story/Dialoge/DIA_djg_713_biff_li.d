
instance DIA_BIFF_LI_EXIT(C_Info)
{
	npc = djg_713_biff_li;
	nr = 999;
	condition = dia_biff_li_exit_condition;
	information = dia_biff_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_biff_li_exit_condition()
{
	return TRUE;
};

func void dia_biff_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PERM(C_Info)
{
	npc = djg_713_biff_li;
	nr = 5;
	condition = dia_biff_li_perm_condition;
	information = dia_biff_li_perm_info;
	permanent = TRUE;
	description = "Na palubě všechno v pořádku?";
};


func int dia_biff_li_perm_condition()
{
	return TRUE;
};

func void dia_biff_li_perm_info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//Na palubě všechno v pořádku?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(podrážděně) Jo, jo. Je tu klid.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_LI_PICKPOCKET(C_Info)
{
	npc = djg_713_biff_li;
	nr = 900;
	condition = dia_biff_li_pickpocket_condition;
	information = dia_biff_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_biff_li_pickpocket_condition()
{
	return C_Beklauen(92,450);
};

func void dia_biff_li_pickpocket_info()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
	Info_AddChoice(dia_biff_li_pickpocket,Dialog_Back,dia_biff_li_pickpocket_back);
	Info_AddChoice(dia_biff_li_pickpocket,DIALOG_PICKPOCKET,dia_biff_li_pickpocket_doit);
};

func void dia_biff_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_biff_li_pickpocket);
};

func void dia_biff_li_pickpocket_back()
{
	Info_ClearChoices(dia_biff_li_pickpocket);
};


instance DIA_BIFF_LI_MISSMYGOLD(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_missmygold_condition;
	information = dia_biff_li_missmygold_info;
	permanent = FALSE;
	description = "Nevíš náhodou něco o tom kde - je moje zlato?";
};


func int dia_biff_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_biff_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Biff_LI_MissMyGold_01_01");	//Nevíš náhodou něco o tom kde - je moje zlato?
	AI_Output(self,other,"DIA_Biff_LI_MissMyGold_01_02");	//Hele...(reptání) Já myslím na hodně věcí, ale na okradení TEBE fakt ne!
	B_LogEntry(TOPIC_MISSMYGOLD,"Biff mi asi o mém zlatě nic neřekne.");
};


instance DIA_BIFF_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_findmagicorecave_condition;
	information = dia_biff_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni s ložiskem rudy.";
};


func int dia_biff_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Biff_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni s ložiskem rudy.
	AI_Output(self,other,"DIA_Biff_LI_FindMagicOreCave_01_02");	//Opravdu?! To by se měl dozvědět kapitán.
	AI_Output(self,other,"DIA_Biff_LI_FindMagicOreCave_01_03");	//Myslím, že ho to bude velice zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_BIFF_LI_CHANGECOURSE(C_Info)
{
	npc = djg_713_biff_li;
	nr = 2;
	condition = dia_biff_li_changecourse_condition;
	information = dia_biff_li_changecourse_info;
	permanent = FALSE;
	description = "Vracíme se na Khorinis.";
};


func int dia_biff_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_biff_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_01_00");	//Vracíme se na Khorinis.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_01_01");	//Kvůli čemu?
	Info_ClearChoices(dia_biff_li_changecourse);
	Info_AddChoice(dia_biff_li_changecourse,"Musím urgentně mluvit s paladiny.",dia_biff_li_changecourse_ore);
	Info_AddChoice(dia_biff_li_changecourse,"Je tu nemalá šance jak získat bohatství!",dia_biff_li_changecourse_gold);
};

func void dia_biff_li_changecourse_ore()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_01");	//Musím urgentně mluvit s paladiny!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_02");	//A o čem?
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_03");	//Je nezbytné je informovat o rudě zde na ostrově.
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Ore_01_04");	//Může pomoci ve válce proti skřetům!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_05");	//(reptání) No, zrovna silně mě to tedy nenadchlo.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_07");	//Takhle dáš paladinům jen další příležitost jak tě oškubat!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Ore_01_09");	//Odpust, příteli ale nemyslím si, že to co chci je pomoci paladinům!
	B_LogEntry(TOPIC_CHANGECOURSE,"Žoldák Biff si nemyslí že je dobrý nápad vrátit se na Khorinis a říct paladinům o rudě.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem promluvil se všemi chlapi, měl bych to říct kapitánovi.");
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

func void dia_biff_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_01");	//Je tu nemalá šance jak získat bohatství.
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_02");	//Opravdu?!... A jaká?!
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_03");	//Musíme prodat rudu z ostrova paladinům.
	AI_Output(other,self,"DIA_Biff_LI_ChangeCourse_Gold_01_04");	//Tuhle informaci nám vyplatí ve zlatě. Co myslíš?
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_05");	//Skvělý nápad, kámo!
	AI_Output(self,other,"DIA_Biff_LI_ChangeCourse_Gold_01_07");	//Jsem s tebou!
	B_LogEntry(TOPIC_CHANGECOURSE,"Biff není proti prodat rudu paladinům.");
	CREWAGREEAWAYBACKSELL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem promluvil se všemi chlapi, měl bych to říct kapitánovi.");
	};
	Info_ClearChoices(dia_biff_li_changecourse);
};

