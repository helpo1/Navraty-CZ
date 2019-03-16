
instance DIA_Attila_EXIT(C_Info)
{
	npc = VLK_494_Attila;
	nr = 999;
	condition = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Attila_PICKPOCKET(C_Info)
{
	npc = VLK_494_Attila;
	nr = 900;
	condition = DIA_Attila_PICKPOCKET_Condition;
	information = DIA_Attila_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Attila_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Attila_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
	Info_AddChoice(DIA_Attila_PICKPOCKET,Dialog_Back,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Attila_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};

func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};


instance DIA_Attila_Hallo(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Hallo_Condition;
	information = DIA_Attila_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Hallo_Condition()
{
	if(MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Hallo_Info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//Á - konečně. Už jsem na tebe čekal, cizinče.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Co ode mě chceš?",DIA_Attila_Hallo_Was);
	Info_AddChoice(DIA_Attila_Hallo,"Kdo jsi?",DIA_Attila_Hallo_Wer);
	B_GivePlayerXP(XP_Attila_MetHim);
};

func void DIA_Attila_Hallo_Wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Říkají mi Attila... Ale copak je moje jméno důležité? Naše jména neznamenají nic.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Ale tohle bys měl vědět cizinče.
	Knows_Attila_Wer = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Was == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"Co ode mě chceš?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice(DIA_Attila_Hallo,"Proč všechna ta fraška?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//Co ode mě chceš?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//Jsem tu, abych ti vysvětlil pár věcí. A kromě toho jsem tu také proto, abych tě zabil.
	Knows_Attila_Was = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"Kdo jsi?",DIA_Attila_Hallo_Wer);
	};
	Info_AddChoice(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"K čemu je ta fraška?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//K čemu je ta fraška?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//Neměl bys zemřit v nevědomosti. Ber to jako projev úcty k odsouzenému.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Myslím, že už půjdu.",DIA_Attila_Hallo_Ende);
	Info_AddChoice(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"Proč mě chceš zabít?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//Myslím už půjdu...
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//Bojím se... že toto ti nemůžu dovolit. Smiř se s tím. Nastal čas zemřít.
	AI_DrawWeapon(self);
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Kdo ti za to zaplatil?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"Proč mě chceš zabít?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Kdo ti za to zaplatil?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//Moji zaměstnavatelé pracují v utajení, stejně jako já.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//V podmínkách mé smlouvy je napsáno, že nebudu zmiňovat ani jejich jména, ani místo jejich pobytu.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Proč mě chceš zabít?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Proč mě chceš zabít?
	if(Betrayal_Halvor == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//Udal jsi Halvora. Teď sedí ve vězení. Takhle by to nešlo.
	};
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//Zaprodal jsi Rengara domobraně. I když je to jen prachsprostý zlodějíček, neměl jsi to dělat.
	};
	if(Nagur_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Nagur je kvůli tobě za mřížemi. Někteří lidé si myslí, že je to neodpustitelná chyba.
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//Mí zaměstnavatelé s tím nejsou spokojeni. Aby ti zabránili udělat nějakou další chybu, poslali mě.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Můžu ti dát zlato.",DIA_Attila_Hallo_Gold);
	Info_AddChoice(DIA_Attila_Hallo,"Tak mě alespoň nech tasit zbraň.",DIA_Attila_Hallo_Attacke);
};

func void DIA_Attila_Hallo_Gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//Můžu ti dát zlato - hodně zlata.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Je to marné! Proto jsem nepřišel. Jedinou cenu, kterou zaplatíš, je tvůj život. A to právě teď.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Attila_Hallo_Attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Tak mě alespoň nech tasit zbraň.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Dobrá, tak se připrav na svůj poslední boj.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//Žádná se ti u opasku nehoupe. Už ti nezbývá mnoho času, cizinče. Smrt už tě očekává.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,2);
	};
};


instance DIA_Attila_Willkommen(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Willkommen_Condition;
	information = DIA_Attila_Willkommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Willkommen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//Á - konečně. Už jsem na tebe čekal, cizinče.
	B_GivePlayerXP(XP_Attila_Friend);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Kdo jsi a co ode mě chceš?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//To není důležité. Co je důležité, jsou tvé skutky. Zůstal jsi věrný, dokonce aniž bys o tom věděl.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Jistí dobrodinci se doslechli o tvé loajalitě. A chtějí ti dát šanci. Tak ji využij.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Hele, prostě mi řekni, kdo jsou ti lidé.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//Mám pro tebe dárek. Ostatní už je jen ve tvých rukách, cizinče.
	B_GiveInvItems(self,other,ItKe_ZhiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AFTER");
};

instance DIA_Attila_NachSchluessel(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_NachSchluessel_Condition;
	information = DIA_Attila_NachSchluessel_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Attila_NachSchluessel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Wer) && (IS_LOVCACH == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//Můj úkol je splněn - prozatím.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//Ale kdo ví, možná se naše cesty opět propojí...
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Wer(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Wer_Condition;
	information = DIA_Attila_Wer_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_Attila_Wer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Willkommen) && (IS_LOVCACH == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Říkají mi Attila... Ale copak je moje jméno důležité? Naše jména neznamenají nic.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Ale tohle bys měl vědět cizinče.
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Job(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Job_Condition;
	information = DIA_Attila_Job_Info;
	permanent = FALSE;
	description = "Jaký jsou tvoje povinnosti v cechu?";
};

func int DIA_Attila_Job_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Job_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Job_15_00");	//Jaký jsou tvoje povinnosti v cechu?
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_01");	//Vzhledem k tomu že jsi jeden z nás, povím ti to.
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_02");	//Jsem prostředníkem mezi dvěma lidmy v horní a u pokladny. Téměř všechny případy jdou skrze mne.
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_03");	//A taky občas doručuju všelijaké typy zpráv.
};

instance DIA_Attila_CanTeach(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_CanTeach_Condition;
	information = DIA_Attila_CanTeach_Info;
	permanent = FALSE;
	description = "Co mě můžeš naučit?";
};

func int DIA_Attila_CanTeach_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_CanTeach_15_00");	//Co mě můžeš naučit?
	AI_Output(self,other,"DIA_Attila_Hallo_CanTeach_09_01");	//Pokud chceš, můžu ti ukázat jak se nejlépe vypořádat s obouruční zbraní.
	AI_Output(self,other,"DIA_Attila_Hallo_CanTeach_09_02");	//I když zloději obvykle preferují meč nebo kord.
};

instance DIA_Attila_TEACH(C_Info)
{
	npc = VLK_494_Attila;
	nr = 10;
	condition = DIA_Attila_teach_condition;
	information = DIA_Attila_teach_info;
	permanent = TRUE;
	description = "Chci se trénovat.";
};

func int DIA_Attila_teach_condition()
{
	if((Npc_KnowsInfo(other,DIA_Attila_CanTeach) == TRUE) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Attila_teach_info()
{
	AI_Output(other,self,"DIA_Attila_Teach_15_00");	//Chci se trénovat.
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_back()
{
	Info_ClearChoices(DIA_Attila_teach);
};