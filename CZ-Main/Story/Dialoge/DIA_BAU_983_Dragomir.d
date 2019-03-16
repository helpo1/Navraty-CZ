
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Co tak daleko od domova?
		AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Tady musíš být opatrný, zvlášť, když se musíš spolehnout jen sám na sebe.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Hello_01_00");	//Kdo tě tu poslal?
		AI_Output(self,other,"DIA_Dragomir_Hello_01_01");	//Co tu chceš?!
		AI_Output(other,self,"DIA_Dragomir_Hello_01_02");	//Chtěl jsem se tu porozhlédnout.
		AI_Output(self,other,"DIA_Dragomir_Hello_01_03");	//Velmi zajímavé...
	};
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_00");	//Co tady děláš?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_01");	//Jsem lovec! (směje se) Nevidíš snad?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_02");	//A tohle, jak vidíš, je náš tábor - vynikající místo pro chlapy jako jsme my.
	}
	else
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_03");	//Kdo jsi?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_04");	//Co tě to zajímá?! (naštvaně)
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_05");	//Přestaň mi pokládat ty tvoje hloupé otázky a nech mě na pokoji!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "Jak ses stal lovcem?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_01_00");	//Jak ses stal lovcem?
	AI_Output(self,other,"DIA_Dragomir_Settlers_01_01");	//Jednoduše jsem se stal členem tohoto tábora.
	AI_Output(self,other,"DIA_Dragomir_Settlers_01_02");	//Je tady tiché a klidné místo.
	DRAGOMIRCANGIVEQUEST = TRUE;
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "Není to tu moc nebezpečné?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if((HEROISHUNTER == TRUE) && (DRAGOMIRCANGIVEQUEST == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//Není to tu moc nebezpečné?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//Ne, když se umíš bránit. Moje kuše je vždy připravena mi prokázat laskavost.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//No, není nic moc.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Ale je smrtící, když ji umíš užívat. Ano, měl jsem lepší kuši. Bohužel jsem ji ztratil.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Dostal jsem se do hor daleko na severu. Je tam kruh monolitů s obětním oltářem.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Když jsem tam lovil mrchožrouty, začali z lesa vylézat ti odporní nemrtví a napadli mě.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Jediné, co jsem mohl dělat, bylo vzít nohy na ramena.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//Jak jsem utíkal, vyklouzla mi ta kuše z rukou. Vsadím se, že se tam ještě pořád u toho podivného kamenného kruhu na severu někde povaluje.
	MIS_DragomirsArmbrust = LOG_Running;
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"U podivného kamenného kruhu vysoko v horách na severu ztratil Dragomir svou kuši.");
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "Tady. Našel jsem tvou kuši.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Tady. Našel jsem tvou kuši.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Opravdu, to je ona! Neříkej, tys byl tam nahoře u kamenného kruhu?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//To si piš.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//To od tebe byla pěkná lehkovážnost. Ale jinak díky.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_05");	//Lovci nejsou moc bohatí, tak nevím, co bych ti mohl dát.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_06");	//Možná... Tady, vezmi si tuto knihu.
	B_GiveInvItems(self,other,ITWR_CBOW_T1,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_07");	//Doufám, že tě něco naučí - tak, jako naučila mě.
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_SUCCESS);
	B_LogEntry(TOPIC_DragomirsArmbrust,"Přinesl jsem Dragomirovi jeho ztracenou kuši.");
};

var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "Můžeš mě něčemu naučit?";
};

func int DIA_Dragomir_Learn_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_SUCCESS) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Jestli na to máš. Jak už jsem řekl, právě se mi poněkud nedostává hotovosti.
	AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Kolik za to chceš?
	B_Say_Gold(self,other,Dragomir_TeachingCost);
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	Log_AddEntry(TOPIC_HUNTERTEACHERS,"Dragomir mě může naučit lépe střílet z kuše.");
	Info_ClearChoices(DIA_Dragomir_Learn);
	Info_AddChoice(DIA_Dragomir_Learn,"Možná později.",DIA_Dragomir_Learn_Later);

	if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
	{
		Info_AddChoice(DIA_Dragomir_Learn,"Tady je zlato.",DIA_Dragomir_Learn_Here);
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Možná později.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_01");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Dobrá, můžeme začít okamžitě.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};

var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak střílet z kuše.";
};

func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_01");	//Ukaž mi, jak střílet z kuše.
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//Více už tě naučit nemůžu.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void dia_dragomir_teach_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75))
	{
		if(DRAGOMIRTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_01");	//Začněme.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_02");	//Založ kuši k ramenu, pomůže ti to mířit.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_03");	//Prvních pár dní ti bude připadat, že ti upadne rameno.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_04");	//Ale do týdne bude jako kámen.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_05");	//Drž kuši pevně - je těžší než luk a mohla by ti vypadnout.
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self,"DIA_Dragomir_Teach_CrossBow_1_01_06");	//Řekni mi něco o kuších.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_07");	//Dobrá. Budeš moci lépe mířit, když si dřepneš. Zpevní se ti tak tělo a nebudeš se třást.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_08");	//Musíš se naučit, jak vypočítat rychlost, se kterou se cíl pohybuje.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_09");	//Když budeš správně předvídat pohyb cíle, můžeš ho zpomalit nebo zastavit.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_10");	//Pokud máš více cílů, neztrácej čas - střílej jeden po druhém s nepřetržitou sérií výstřelů.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};

func void dia_dragomir_teach_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75))
	{
		if(DRAGOMIRTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_01");	//Začněme.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_02");	//Zapři si kuši o rameno.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_03");	//Prvních pár dní ti bude připadat, že ti upadne rameno.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_04");	//Ale po týdnu bude jako kámen.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_05");	//Drž kuši pevně - je těžší než luk a mohla by ti vypadnout.
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self,"DIA_Dragomir_Teach_CrossBow_5_01_06");	//Řekni mi něco o kuších.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_07");	//Dobrá. Budeš moci lépe mířit, když si dřepneš. Zpevní se ti tak tělo a nebudeš se třást.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_08");	//Musíš se naučit, jak vypočítat rychlost, se kterou se cíl pohybuje.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_09");	//Když budeš správně předvídat pohyb cíle, můžeš ho zpomalit nebo zastavit.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_10");	//Pokud máš více cílů, neztrácej čas - střílej jeden po druhém s nepřetržitou sérií výstřelů.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return C_Beklauen(47,70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};


instance DIA_DRAGOMIR_RESPECT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respect_condition;
	information = dia_dragomir_respect_info;
	permanent = FALSE;
	description = "Přimluvíš se za mě?";
};


func int dia_dragomir_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (DRAGOMIR_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void dia_dragomir_respect_info()
{
	AI_Output(other,self,"DIA_Dragomir_Respect_01_00");	//Přimluvíš se za mě?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_01");	//Proč?
	AI_Output(other,self,"DIA_Dragomir_Respect_01_02");	//Chci přijmout Falkovu výzvu - soutěžit s ním v lovu.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_03");	//Opravdu?! Ty si myslíš, že ho můžeš porazit?
	AI_Output(other,self,"DIA_Dragomir_Respect_01_06");	//Zkusím to. Tak co pomůžeš mi?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_07");	//Dobře pomůžu - s tím nemám problém.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_08");	//Ale nejprve mi dokaž, že v našem oboru opravdu za něco stojíš.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_09");	//A to ne řečmi, ale činy.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_10");	//Co konkrétně chceš, abych dokázal?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_11");	//No, co třeba, že jsi dobrej střelec.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_12");	//Bez téhle dovednosti, jsi spíš snadná kořist, než dobrej lovec.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_13");	//Já samozřejmě moc nevynikám v lukostřelbě, ale dokážu posoudit, jak dobře jsi na tom ve střelbě z kuše.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_14");	//A koho mám pro tebe sestřelit?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_15");	//Nikoho! Prostě mi ukaž, jak s ní umíš zacházet. To bude stačit.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_16");	//Dobře. Proč ne?
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Dragomir_Respect_01_17");	//Hmmm... (zaujatě) Vidím, že docela dobře. Udělal jsi na mě dojem.
		AI_Output(other,self,"DIA_Dragomir_Respect_01_18");	//Znamená to, že můžu počítat s tvým hlasem?
		AI_Output(self,other,"DIA_Dragomir_Respect_01_19");	//Samozřejmě! Tak dobrý střelec nemůže být špatný lovec.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_20");	//Můžeš se mnou počítat.
		AI_Output(other,self,"DIA_Dragomir_Respect_01_21");	//Děkuju.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Udělal jsem na Dragomira dojem se svým uměním střelby z kuše. Můžu počítat s jeho podporou.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Respect_01_22");	//Hmmm... vidím, že to za moc nestojí.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_23");	//Ne příteli - s takovou střelbou toho na lovu moc nezmůžeš.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_24");	//Jestli na mě chceš udělat dojem, běž radši trénovat!
		AI_Output(self,other,"DIA_Dragomir_Respect_01_25");	//Pak uvidíme.
	};
};


instance DIA_DRAGOMIR_RESPECTDONE(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respectdone_condition;
	information = dia_dragomir_respectdone_info;
	permanent = TRUE;
	description = "A co nyní říkáš na mou práci s kuší?";
};


func int dia_dragomir_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_respect) && (CANHUNTERCHALLANGE == TRUE) && (DRAGOMIR_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_respectdone_info()
{
	AI_Output(other,self,"DIA_Dragomir_RespectDone_01_00");	//A co nyní říkáš na mou práci s kuší?
	AI_Output(self,other,"DIA_Dragomir_RespectDone_01_01");	//(s pochybnostmi) Dobře, předveď se...
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_03");	//Hmmm... (uznale) Vidím, že docela dobře. Udělal jsi na mě dojem.
		AI_Output(other,self,"DIA_Dragomir_RespectDone_01_04");	//Znamená to že můžu počítat s tvým hlasem?
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_05");	//Samozřejmě! Tak dobrý střelec nemůže být špatný lovec.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_06");	//Můžeš se mnou počítat.
		AI_Output(other,self,"DIA_Dragomir_RespectDone_01_07");	//Děkuju.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Udělal jsem na Dragomira dojem se svým uměním střelby z kuše. Můžu počítat s jeho podporou.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_08");	//Hmm... A čím mě chceš překvapit?
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_09");	//Raději nepokračuj ať se nezraníš.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_10");	//Jestli chceš na mě udělat dojem, musíš se naučit s ní zacházet. Čím dřív, tím líp.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_11");	//Tak co kdybys šel trénovat.
	};
};

