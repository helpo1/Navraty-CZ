
instance DIA_PAL_2680_UDAR_EXIT(C_Info)
{
	npc = pal_2680_udar;
	nr = 999;
	condition = dia_pal_2680_udar_exit_condition;
	information = dia_pal_2680_udar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2680_udar_exit_condition()
{
	return TRUE;
};

func void dia_pal_2680_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2680_UDAR_TEACH(C_Info)
{
	npc = pal_2680_udar;
	nr = 3;
	condition = dia_pal_2680_udar_teach_condition;
	information = dia_pal_2680_udar_teach_info;
	permanent = TRUE;
	description = "Chci se u tebe učit.";
};


func int dia_pal_2680_udar_teach_condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Chci se u tebe učit.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Dobře!
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
	Info_AddChoice(dia_pal_2680_udar_teach,Dialog_Back,dia_pal_2680_udar_teach_back);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};

func void dia_pal_2680_udar_teach_back()
{
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
};

func void dia_pal_2680_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Teď víš základy - a na víc nemáme čas.
};

func void dia_pal_2680_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Měl by ses podívat po lepším učiteli.
};

func void dia_pal_2680_udar_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
};

func void dia_pal_2680_udar_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};


instance DIA_PAL_2680_UDAR_PERM(C_Info)
{
	npc = pal_2680_udar;
	nr = 1;
	condition = dia_pal_2680_udar_perm_condition;
	information = dia_pal_2680_udar_perm_info;
	permanent = FALSE;
	description = "Vypadáš trochu unaveně.";
};


func int dia_pal_2680_udar_perm_condition()
{
	return TRUE;
};

func void dia_pal_2680_udar_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2680_Udar_Perm_01_00");	//Vypadáš trochu unaveně.
	AI_Output(self,other,"DIA_PAL_2680_Udar_Perm_01_01");	//Ano, docela jsem. Poslední útok skřetů mi dal pořádně zabrat.
	AI_Output(self,other,"DIA_PAL_2680_Udar_Perm_01_02");	//Ale snažím se na to nemyslet, a odpočinout si na další útok.
};


instance DIA_PAL_2680_UDAR_NATAN(C_Info)
{
	npc = pal_2680_udar;
	nr = 2;
	condition = dia_pal_2680_udar_natan_condition;
	information = dia_pal_2680_udar_natan_info;
	permanent = FALSE;
	description = "Mluvil jsi s Nathanem?";
};


func int dia_pal_2680_udar_natan_condition()
{
	if(MIS_NATANDOLG == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_natan_info()
{
	AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_00");	//Mluvil jsi s Nathanem?
	if(Npc_IsDead(pal_91680_natan))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_01");	//Bohužel jsem neměl čas s ním mluvit.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_02");	//Je mrtev kvůli tomu jeho hloupému smyslu pro povinnost.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_08");	//Nakonec dosáhl toho co chtěl. Jen jeho cena byla pro něho moc vysoká.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_09");	//(smutně) A já bohužel nemůžu nic změnit.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_10");	//Chápu tě.
		MIS_NATANDOLG = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_NATANDOLG);
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_11");	//Jak vidíš neměl jsem čas.(usmivá se) Ale rozhodně s ním promluvím.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_12");	//Musím mu nějak vysvětlit, že svou povinnost už zplatil.(zasměje se)
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_14");	//Ano, to je pravda. Ale on si to nemyslí.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_15");	//Ach...(zaraženě) On si myslí že musí zabít celou armadu skřetů?
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_17");	//Můžu ti s tím nějak pomoci?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_18");	//Hmm...(zamyšleně)Pomoc by se mi hodila. Už jsem začal přemýšlet o jednom nápadu.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_20");	//Co jsi vymyslel?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_21");	//Musím zařídit, aby Nathan dostal příležitost zachránit mi život. A ty mi v tom pomůžeš.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_22");	//Jak?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_23");	//Hmmm...(zamyšleně) Najdu nějakou skupinku skřetů, nechám se přepadnout a zařídím, aby to vypadalo, jako že mě Nathan zachránil.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_24");	//Bude to muset vypadat jako že jsem v pasti.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_25");	//V tom okamžiku se musíš objevit ty a Nathan, abyste mi pomohli.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_26");	//To je nebezpečné. Nemáš strach, že se může objevit pozdě?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_27");	//Neměj obavy...(usmívá se) Pro paladina jako jsem já není skupinka skřetů žádný problém.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_29");	//Chceš teda, aby to udělal Nathan?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_30");	//Ano!... V tom spočívá můj plán. Pomůžeš mi?!
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_31");	//Jasně. Musíme jen najít vhodné místo.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_32");	//Ale nesmí to být přes půl ostrova.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_33");	//Hmmm, malý les východně od hostince by se k tomu mohl hodit.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_34");	//Je tam malá jeskyně, kde se můžu schovat a na mostu chodí pravidelně skřetí patrola.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_37");	//Půjdu tam a počkám na nějakou skřetí skupinku.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_38");	//Ty zatím zabavíš Nathana, abych měl čas vše připravit.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_39");	//Dobře, chápu to!
		B_LogEntry(TOPIC_NATANDOLG,"Udar má nápad, jak by mohl Nathan zplatit svůj dluh. Mám mu pomoci. Udar chce najít u hostince tlupu skřetů a vstoupit s nimi do nerovného boje. Samozřejmě jenom naoko nerovného. Já mám přiběhnout s Nathanem, který tak dostane svou šanci zplatit pomyslný dluh, který zplatil už v Hornickém údolí.");
		Log_AddEntry(TOPIC_NATANDOLG,"Nyní bych měl zabavit Nathana, aby Udar měl šanci vše přichystat. Bude čekat v blízkosti hostince, v malé jeskyni.");
		AI_StopProcessInfos(self);
		UDARORCSTRAP = TRUE;
		self.aivar[93] = TRUE;
		Npc_ExchangeRoutine(self,"OrcsTrap");
	};
};


instance DIA_PAL_2680_UDAR_NATANDOLGDONE(C_Info)
{
	npc = pal_2680_udar;
	nr = 1;
	condition = dia_pal_2680_udar_natandolgdone_condition;
	information = dia_pal_2680_udar_natandolgdone_info;
	permanent = FALSE;
	description = "Co říkáš?";
};


func int dia_pal_2680_udar_natandolgdone_condition()
{
	if(MIS_NATANDOLG == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_natandolgdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_PAL_2680_Udar_NatanDolgDone_01_00");	//Co říkáš?
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_01");	//(směje se ) Líp to snad ani nešlo.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_02");	//Nyní si Nathan konečně přiznal, že mi zachránil život.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_05");	//Díky za tvou pomoc.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_06");	//Tady - máš ode mne menší dar na oplátku. Bude se ti hodit!
	B_GiveInvItems(self,other,itri_udargift,1);
	AI_Output(other,self,"DIA_PAL_2680_Udar_NatanDolgDone_01_07");	//Díky!
	AI_StopProcessInfos(self);
	self.aivar[93] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	Npc_ExchangeRoutine(pal_2500_garond,"Start");
	Npc_ExchangeRoutine(pal_2510_oric,"Start");
	Npc_ExchangeRoutine(pal_2520_parcival,"Start");
	Npc_ExchangeRoutine(pal_2170_marcos,"Start");
	Npc_ExchangeRoutine(pal_75230_albert,"Start");
	Npc_ExchangeRoutine(pal_75180_ritter,"Start");
	Npc_ExchangeRoutine(pal_75190_ritter,"Start");
	Npc_ExchangeRoutine(pal_75200_ritter,"Start");
	Npc_ExchangeRoutine(pal_75210_ritter,"Start");
	Npc_ExchangeRoutine(pal_75220_ritter,"Start");
	Npc_ExchangeRoutine(pal_75240_ritter,"Start");
	Npc_ExchangeRoutine(pal_2530_wache,"Start");
	Npc_ExchangeRoutine(pal_2570_ritter,"Start");
	Npc_ExchangeRoutine(pal_91650_ritter,"Start");
	Npc_ExchangeRoutine(pal_91660_ritter,"Start");
	Npc_ExchangeRoutine(pal_91670_ritter,"Start");
};

