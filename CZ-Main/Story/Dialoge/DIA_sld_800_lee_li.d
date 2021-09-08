
instance DIA_LEE_LI_EXIT(C_Info)
{
	npc = sld_800_lee_li;
	nr = 999;
	condition = dia_lee_li_exit_condition;
	information = dia_lee_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lee_li_exit_condition()
{
	return TRUE;
};

func void dia_lee_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_LI_PERM6(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_perm6_condition;
	information = dia_lee_li_perm6_info;
	permanent = TRUE;
	description = "Jak to jde s lodí?";
};


func int dia_lee_li_perm6_condition()
{
	return TRUE;
};

func void dia_lee_li_perm6_info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Jak to jde s lodí?
	AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Bez obav. Mám to pod kontrolou.
};


instance DIA_LEE_LI_TEACH(C_Info)
{
	npc = sld_800_lee_li;
	nr = 10;
	condition = dia_lee_li_teach_condition;
	information = dia_lee_li_teach_info;
	permanent = TRUE;
	description = "Pojď mě cvičit.";
};


func int dia_lee_li_teach_condition()
{
	return TRUE;
};

func void dia_lee_li_teach_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Pojď mě cvičit.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//V čem přesně?
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_back()
{
	Info_ClearChoices(dia_lee_li_teach);
};

func void dia_lee_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Tvá obrana je na nic, ale něco s tím provedem.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Nesvírej zbraň tak křečovitě. Musíš ji držet volně.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Vždy si pamatuj: sílu moudře.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};

func void dia_lee_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Silnější úder je ti k ničemu když netrefíš cíl. Snaž se ho použit jen když si jseš jistý že uspěješ.
	};
	Info_ClearChoices(dia_lee_li_teach);
	Info_AddChoice(dia_lee_li_teach,Dialog_Back,dia_lee_li_teach_back);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_lee_li_teach_2h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_lee_li_teach_2h_5);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_lee_li_teach_1h_1);
	Info_AddChoice(dia_lee_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_lee_li_teach_1h_5);
};


instance DIA_LEE_LI_PICKPOCKET(C_Info)
{
	npc = sld_800_lee_li;
	nr = 900;
	condition = dia_lee_li_pickpocket_condition;
	information = dia_lee_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lee_li_pickpocket_condition()
{
	return C_Beklauen(110,570);
};

func void dia_lee_li_pickpocket_info()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
	Info_AddChoice(dia_lee_li_pickpocket,Dialog_Back,dia_lee_li_pickpocket_back);
	Info_AddChoice(dia_lee_li_pickpocket,DIALOG_PICKPOCKET,dia_lee_li_pickpocket_doit);
};

func void dia_lee_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_lee_li_pickpocket);
};

func void dia_lee_li_pickpocket_back()
{
	Info_ClearChoices(dia_lee_li_pickpocket);
};


instance DIA_LEE_LI_MISSMYGOLD(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_missmygold_condition;
	information = dia_lee_li_missmygold_info;
	permanent = FALSE;
	description = "Nevíš, kde je mé zlato?";
};


func int dia_lee_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lee_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Lee_LI_MissMyGold_01_01");	//Nevíš, kde je mé zlato?
	AI_Output(self,other,"DIA_Lee_LI_MissMyGold_01_02");	//Ne, chlape, to já nevím. Nebyl čas se o to starat.
	AI_Output(other,self,"DIA_Lee_LI_MissMyGold_01_03");	//Aha.
	B_LogEntry(TOPIC_MISSMYGOLD,"Lee mi taky nepomuže ohledně zlata.");
};


instance DIA_LEE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_findmagicorecave_condition;
	information = dia_lee_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni plnou rudy.";
};


func int dia_lee_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Lee_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni plnou rudy.
	AI_Output(self,other,"DIA_Lee_LI_FindMagicOreCave_01_02");	//Opravdu?!... (udiveně) Měl bys o tom promluvit s kapitánem.
	AI_Output(self,other,"DIA_Lee_LI_FindMagicOreCave_01_03");	//Myslím, že ho to bude zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_LEE_LI_CHANGECOURSE(C_Info)
{
	npc = sld_800_lee_li;
	nr = 2;
	condition = dia_lee_li_changecourse_condition;
	information = dia_lee_li_changecourse_info;
	permanent = FALSE;
	description = "Musíme zpět na Khorinis.";
};


func int dia_lee_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lee_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_01_00");	//Musíme zpět na Khorinis.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_01_01");	//(udiveně) A proč by sme se měli vracet?
	Info_ClearChoices(dia_lee_li_changecourse);
	Info_AddChoice(dia_lee_li_changecourse,"Říci paladinům o rudě.",dia_lee_li_changecourse_ore);
	Info_AddChoice(dia_lee_li_changecourse,"Pro hromadu zlata!",dia_lee_li_changecourse_gold);
};

func void dia_lee_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_01");	//Musíme jim pomoct! Je nutné je informovat o magické rudě co je tady na ostrově.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_02");	//Myslím, že se jim bude hodit ve válce proti skřetům!
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_03");	//A co má být? Copak jim něco dlužíme!
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_04");	//Mám zájem starat se jen o osud svojich lidí. Pro ty idioty nic neudělám!
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_07");	//Můžeme od nich požadovat velkou kompenzaci za rudu.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_08");	//Hmm. (zamyšleně) A co by nám lord Hagen mohl tak asi dát?!
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_09");	//Například amnestii pro tebe a tvé lidi.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_10");	//Většina z nich zůstala na ostrově.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_14");	//(zamyšleně) To je pravda. Musím zachránit své lidi!
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_15");	//Udělám co bude v mých silách.
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Ore_01_16");	//Takže jdeš se mnou?
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Ore_01_17");	//Dobrá, ano jdu.
	B_LogEntry(TOPIC_CHANGECOURSE,"Lee pluje se mnou zpět na Khorinis.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi! Nyní bych měl informovat kapitána.");
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

func void dia_lee_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Gold_01_01");	//Pro hromadu zlata. Není to důvod k návratu?
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_02");	//Zajímavé. A kde ji chceš hledat?
	AI_Output(other,self,"DIA_Lee_LI_ChangeCourse_Gold_01_03");	//Informuji paladiny o rudě, kterou jsem zde nalezl. A ti nám vyplatí rudu zlatem.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_07");	//Pochybuji, že paladinové budou mít tolik zlata.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_08");	//Kromě toho na Khorinisu můžou být skřeti.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_10");	//(vážně) Myslím že náš návrat je pěkná blbost.
	AI_Output(self,other,"DIA_Lee_LI_ChangeCourse_Gold_01_11");	//To je můj názor. Ale rozhodnutí nechám na tobě.
	B_LogEntry(TOPIC_CHANGECOURSE,"Lee jde zpět na Khorinis se mnou, ale není vůbec nadšený.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi! Nyní bych měl informovat kapitána.");
	};
	Info_ClearChoices(dia_lee_li_changecourse);
};

