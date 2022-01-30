
instance DIA_Addon_Garett_EXIT(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 999;
	condition = DIA_Addon_Garett_EXIT_Condition;
	information = DIA_Addon_Garett_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garett_PICKPOCKET(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 900;
	condition = DIA_Addon_Garett_PICKPOCKET_Condition;
	information = DIA_Addon_Garett_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Garett_PICKPOCKET_Condition()
{
	return C_Beklauen(36,55);
};

func void DIA_Addon_Garett_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,Dialog_Back,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};

func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};


instance DIA_Addon_Garett_Anheuern(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Anheuern_Condition;
	information = DIA_Addon_Garett_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Ani se mě neptej, jestli s tebou půjdu na lov.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//Co si myslíš, že by si tu beze mě počali, co?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//Než bych se vrátil, nezbyla by mi tu ani JEDNA plná krabice!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//Zůstávám tady a budu se starat o zásoby!
};


instance DIA_Addon_Garett_Hello(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 1;
	condition = DIA_Addon_Garett_Hello_Condition;
	information = DIA_Addon_Garett_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Garett_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Addon_Greg_ClearCanyon != LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//Copak to tu máme, nová tvář? Doufám, že nejsi žádný z těch všivých banditů!
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//Já jsem Garett. Když budeš něco potřebovat, přijď nejprve za mnou.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//Mám téměř všechno. Víno, zbraně a ještě mnoho dalšího, co lidé potřebují.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Kromě kořalky - jestli hledáš kvalitní kořalku, jdi za Samuelem.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Garett_Samuel(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 2;
	condition = DIA_Addon_Garett_Samuel_Condition;
	information = DIA_Addon_Garett_Samuel_Info;
	permanent = FALSE;
	description = "Kdo je Samuel?";
};


func int DIA_Addon_Garett_Samuel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) && (Samuel.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Kdo je Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//Náš palič. Jeho jeskyně je támhle o kousek dál, napravo od pláže.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//Není těžké to najít, jdi prostě na sever.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//Ale něco ti poradím - zásob se grogem.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Někteří mladíci tady nemají moc rádi nové chlapy, jestli chápeš...
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//V tom případě může troška kvalitního grogu urovnat situaci!
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Garett_Warez(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Warez_Condition;
	information = DIA_Addon_Garett_Warez_Info;
	description = "Od koho bereš své zboží?";
};


func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Od koho bereš své zboží?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip vždycky doveze hodně z Khorinisu, kam chodívá.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//Až do teď prodával hodně věcí banditům.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//Ale jak teď s bandity válčíme, všechno to zboží končí u mě.
};


instance DIA_Addon_Garett_Bandits(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 3;
	condition = DIA_Addon_Garett_Bandits_Condition;
	information = DIA_Addon_Garett_Bandits_Info;
	description = "Co víš o banditech?";
};


func int DIA_Addon_Garett_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//Na to je odborník Skip.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//Řeknu ti, on měl s těmi idioty hodně schůzek.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg rozkázal zlikvidovat každého banditu, co se přiblíží k táboru.
};


instance DIA_Addon_Garett_Greg(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 4;
	condition = DIA_Addon_Garett_Greg_Condition;
	information = DIA_Addon_Garett_Greg_Info;
	permanent = FALSE;
	description = "Tvůj kapitán Greg. Jaký je?";
};


func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Tvůj kapitán Greg. Jaký je?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//Je to tuhý chlápek, to určitě.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//A chamtivý jako nikdo jiný.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//Nechal našeho pokladníka Francise, aby nám platil akorát tolik, abychom se nevzbouřili.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//A když jeden z nás něco opravdu zamýšlel, postaral se o něho osobně.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//Jednou jsem ukradl kompas z jedné královské fregaty.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//Greg, ten bastard, mi ho samozřejmě zabavil.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Pf! Asi ho někam schoval, jako všechny jeho poklady.
};


instance DIA_Addon_Garett_Tips(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Condition;
	information = DIA_Addon_Garett_Tips_Info;
	description = "Kde mohl Greg ukrýt ten kompas?";
};


func int DIA_Addon_Garett_Tips_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Kde mohl Greg ukrýt ten kompas?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg mi jednou řekl, že o můj kompas se stará smrt a pak se začal smát.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Něco dalšího?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//Na jižním pobřeží je pláž. Dá se tam dostat jen po moři.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Říká se, že Greg tam občas chodí. Možná bys tam něco našel.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//Jednou jsem tam byl, ale je tam plno potvor.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//Jestli to chceš opravdu risknout, nezapomeň si krumpáč.
	MIS_ADDON_GARett_BringKompass = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kompass,"Greg sebral Garettovi vzácný kompas. Garett si myslí, že ho schoval někde na jižní pláži.");
};

instance DIA_Addon_Garett_Tips_Next(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 5;
	condition = DIA_Addon_Garett_Tips_Next_Condition;
	information = DIA_Addon_Garett_Tips_Next_Info;
	description = "Je pravda že Gregův poklad střeží smrt?";
};

func int DIA_Addon_Garett_Tips_Next_Condition()
{
	if(MIS_ADDON_GARett_BringKompass == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Next_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_Next_01_00");	//Co měl Greg na mysli když řekl, že jeho poklad střeží smrt?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_Next_01_01");	//Říká se, že jeho poklad je prokletý! Hlídají ho lidé, které Greg jednou zabil.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_Next_01_02");	//Takže buď velmi opatrný pokud ho budeš chtít ukrást.
};

instance DIA_Addon_Garett_GiveKompass(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 6;
	condition = DIA_Addon_Garett_GiveKompass_Condition;
	information = DIA_Addon_Garett_GiveKompass_Info;
	permanent = FALSE;
	description = "Tady je tvůj kompas.";
};

func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if((Npc_HasItems(other,ItMI_Addon_Kompass_Mis) >= 1) && (MIS_ADDON_GARett_BringKompass == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Tady je tvůj kompas.
	if(B_GiveInvItems(other,self,ItMI_Addon_Kompass_Mis,1))
	{
		Npc_RemoveInvItems(self,ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(raduje se) Jo, to je on. Nečekal jsem, že ho ještě někdy uvidím.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Díky, chlape!
	if(Npc_HasItems(self,ItBe_Addon_Prot_EdgPoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//Tentokrát už ho Greg NEDOSTANE...
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Tady, vezmi si za to tenhle opasek. Je celkem cenný.
		B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
	}
	else if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//Tento pásek si ode mě koupil, pamatuješ?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//Zaplatil jsi za něj hodně - (rychle) a je opravdu cenný. Tady - vezmi si ty peníze zpět.
		B_GiveInvItems(self,other,ItMi_Gold,Value_ItBE_Addon_Prot_EdgPoi);
	};
	B_LogEntry(TOPIC_Addon_Kompass,"Garett byl velmi potěšen, když jsem mu vrátil jeho kompas.");
	MIS_ADDON_GARett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};


instance DIA_Addon_Garett_Francis(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 7;
	condition = DIA_Addon_Garett_Francis_Condition;
	information = DIA_Addon_Garett_Francis_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o Francisovi?";
};


func int DIA_Addon_Garett_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//Co mi můžeš říct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg mu předal velení, dokud tu není.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//Ale jako kapitán je Francis absolutně nemožný!
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//Ani nedokázal vytáhnout Morgana z postele.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Henry a jeho chlapci jsou jediní, kdo tu něco dělá.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//Ti ostatní se jen flákají.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//Doufám, že se Greg vrátí brzy.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//Pak je pěkně nakope do zadku.
	};
};


instance DIA_Addon_Garett_PERM(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 99;
	condition = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent = TRUE;
	description = "Něco nového?";
};

func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Něco nového?

	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Dokud bude Greg pryč, nic se tu dít nebude.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Teď, když je Greg zpět, věci se vrací do normálu.
	};
};

instance DIA_Addon_Garett_Trade(C_Info)
{
	npc = PIR_1357_Addon_Garett;
	nr = 888;
	condition = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};

func int DIA_Addon_Garett_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};

	return FALSE;
};


var int garretarrowsday;

func void DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random;
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	Garett_Random = Hlp_Random(3);

	if(Garett_Random == 0)
	{
		B_Say(other,self,"$TRADE_1");
	}
	else if(Garett_Random == 1)
	{
		B_Say(other,self,"$TRADE_2");
	}
	else
	{
		B_Say(other,self,"$TRADE_3");
	};

	daynow = Wld_GetDay();

	if(GARRETARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (GARRETARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - GARRETARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			GARRETARROWSDAY = daynow;
		};
	};

	B_GiveTradeInv(self);
};

