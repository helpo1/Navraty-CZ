/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

(3x) CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_DJG_715_Ferros_EXIT(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 999;
	condition = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_Ferros_Hello(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 4;
	condition = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//Z pevniny. Připlul jsem sem se svými lidmi.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//Situace se pořád zhoršuje. Skřeti za sebou nechávají jen vypálené vesnice.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//Král už nemá žádnou moc.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//Pokud to chceš vědět, tak jste vy paladinové zklamali na plné čáře.
	};
};


instance DIA_DJG_715_Ferros_Friends(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent = FALSE;
	description = "Kde jsou tví lidé teď?";
};


func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//Kde jsou tví lidé teď?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//Opustil jsem je.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//Měli dojem, že si můžou brát, co se jim zlíbí, a bylo jim jedno, komu to patří. Zbavili se mě.
};


instance DIA_DJG_715_Ferros_War(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent = FALSE;
	description = "Co dalšího víš o válce?";
};


func int DIA_DJG_715_Ferros_War_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//Co dalšího víš o válce?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//Už jsi svého krále neviděl pěkně dlouho, co?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//Skřeti jsou za branami hlavního města. Ale jestli už padlo, to nevím.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//Poslední věc, co jsem slyšel, byla, že král padl. Ale já tomu nevěřím.
};

var int FerrosRing;

instance DIA_DJG_715_Ferros_OldCamp(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 7;
	condition = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent = FALSE;
	description = "Co děláš tady na hradě?";
};

func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//Co děláš tady na hradě?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//Zaslechl jsem o dracích a chtěl jsem pomoct v boji proti nim.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//Bohužel jsem ztratil svůj meč, když jsem se plížil kolem skřetů. Teď jsem tady jak v pasti.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//Bez meče se odsud nemůžu dostat a ty meče, co se tu dají koupit, jsou ty nejhorší krámy, co jsem kdy viděl.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"Přeju ti hodně štěstí při hledání.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,
		ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, FALSE), "Co mi dáš za to, když ti seženu meč?"),
		// "Co mi dáš za to, když ti seženu meč?",
		DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp,"Najdu tvůj meč.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis,"FP_OW_ITEM_08");
	MIS_FErrosSword = LOG_Running;
	Log_CreateTopic(TOPIC_FerrosSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword,LOG_Running);
	B_LogEntry(TOPIC_FerrosSword,"Kdesi u skřetů ztratil Ferros svůj meč - to bylo z jeho strany pořádně hloupé.");
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//Přeju ti hodně štěstí při hledání.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//Pořád se ptám sám sebe, proč jsem vlastně tady?
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//Co mi dáš za to, když ti seženu meč?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//Bohužel ti nemůžu dát nic. Svoje poslední peníze jsem utratil za ten meč.

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_New_15_00");	//Tak tohle neudělám!
		AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_New_15_01");	//Kromě toho, nevypadáš zrovna na chlapa co nemá peníze.
		AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_New_15_02");	//Ale já opravdu nemám peníze... (naštvaně)
		AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_New_15_03");	//Jedinou věc, co ti můžu dát jako odměnu - je rodinej prsten!
		AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_New_15_04");	//Poslední věc, kterou jsem ještě neprodal...
		FerrosRing = TRUE;
	};

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//Najdu tvůj meč.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//To by bylo výborné. Měl bys ho hledat na tom strmém srázu na jihu.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//Pravděpodobně jsem ho ztratil poblíž skřetích stanů.
	B_LogEntry(TOPIC_FerrosSword,"Ferros svůj meč nejspíš ztratil na vysokém útesu na jihu - tam, kde si skřeti rozbili své stany.");
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};


instance DIA_DJG_715_Ferros_FerrosAnySword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent = FALSE;
	description = "Možná bych pro tebe měl jiný meč.";
};


func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && ((Npc_HasItems(other,ItMw_1H_Special_01) >= 1) || (Npc_HasItems(other,ItMw_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//Možná bych pro tebe měl jiný meč.
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,Dialog_Back,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	if(Npc_HasItems(other,ItMw_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if(Npc_HasItems(other,ItMw_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//Je to dobrá čepel. Opravdu výjimečná práce.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//Jsi si jistý, že mi něco takového chceš dát?
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Ne, potřebuju ho pro sebe.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,
		ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, FALSE), "Jo, vezmi si ho."),
		// "Jo, vezmi si ho.",
		DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,"Ne, potřebuju ho pro sebe.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,
		ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, FALSE), "Jo, vezmi si ho."),
		// "Jo, vezmi si ho.",
		DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");		//Jo, vezmi si ho.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_00");		//Díky kámo! Máš to u mě.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_01");		//Peníze, jak víš, já nemám... (naštvaně) 
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_02");		//Na oplátku ti ukážu pár triků, které ti v boji umožní lépe využívat tvou sílu.

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_03");	//Poslouchej pozorně... (vážně) 
		AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_04");	//Když chceš zasadit ránu mečem, použivej nejen sílu paže, ale také sílu celého těla.
		AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_05");	//Je nutné se pořádně zapřít v nohách, stáhnout ramena k lopatkám a narovnat paže.
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,1);
	};
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//Děkuji! Něco ti dlužím.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//Na oplátku ti ukážu pár triků, které ti v boji umožní lépe využívat tvou sílu.

	if(FerrosRing == TRUE)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_02");	//A samozřejmě, tady máš můj prsten. Jak jsem slíbil.
		B_GiveInvItems(self,hero,ItRi_FerrosRing,1);
	};

	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Ferros mi může pomoci zvýšit sílu a obratnost.");
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Ne, potřebuju ho pro sebe.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Tak tomu rozumím.
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

instance DIA_DJG_715_Ferros_FerrosHisSword(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent = FALSE;
	description = "Našel jsem tvůj meč.";
};

func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && (Npc_HasItems(other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//Našel jsem tvůj meč.
	B_GiveInvItems(other,self,ItMW_1H_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};


instance DIA_Ferros_Teach(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 1;
	condition = DIA_Ferros_Teach_Condition;
	information = DIA_Ferros_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak můžu posílit své schopnosti.";
};


func int DIA_Ferros_Teach_Condition()
{
	if(MIS_FErrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//Ukaž mi, jak můžu posílit své schopnosti.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//Po těch skřetích útocích jsem s tím skončil. Jsem rád, že jsem zůstal naživu, chlape.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//Dobrý válečník by se měl naučit, jak své schopnosti převést přímo na zbraň.
		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach,Dialog_Back,DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
};


instance DIA_Ferros_AllDragonsDead(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Všichni draci jsou mrtví.";
};


func int DIA_Ferros_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//Dobrá práce! Kdybychom měli víc takových lidí, nejspíš by se to nikdy nedostalo tak daleko.
};


instance DIA_Ferros_PICKPOCKET(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 900;
	condition = DIA_Ferros_PICKPOCKET_Condition;
	information = DIA_Ferros_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ferros_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,Dialog_Back,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

