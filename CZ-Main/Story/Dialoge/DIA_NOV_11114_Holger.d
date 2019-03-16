
instance DIA_HOLGER_EXIT(C_Info)
{
	npc = nov_11114_holger;
	nr = 999;
	condition = dia_holger_exit_condition;
	information = dia_holger_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_holger_exit_condition()
{
	return TRUE;
};

func void dia_holger_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOLGER_STORY(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_story_condition;
	information = dia_holger_story_info;
	important = FALSE;
	permanent = TRUE;
	description = "Tak mi všechno řekni.";
};

func int dia_holger_story_condition()
{
	if(MIS_HOLGER_QUEST == 3)
	{
		return TRUE;
	};
};

func void dia_holger_story_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Holger_01_01");	//Tak mi všechno řekni, jak jsi slíbil.
	AI_Output(self,other,"DIA_Holger_01_02");	//Co bych teď skrýval? V klášteře jsem byl asi rok.
	AI_Output(self,other,"DIA_Holger_01_03");	//Tehdy ještě stála bariéra a Khorinis vzkvétal. Ale jednoho krásného dne jsem se pohádal v Coragonově hospodě.
	AI_Output(self,other,"DIA_Holger_01_04");	//Byl jsem opilý a už moc nevím, jak to rvaní začalo, ale skončilo to špatně pro nás oba.
	AI_Output(self,other,"DIA_Holger_01_05");	//Ron, ten chlap - skončil zmlácený skoro k smrti a já bych asi skončil za bariérou.
	AI_Output(self,other,"DIA_Holger_01_06");	//Ale můj otec shromáždil všechny peníze, které jsme měli a dal mě do kláštera.
	AI_Output(self,other,"DIA_Holger_01_07");	//Musel prodat skoro všechno... Nemůžu se mu podívat do očí!
	AI_Output(self,other,"DIA_Holger_01_08");	//To je ten důvod, proč jsem k němu nemohl sám.
	AI_Output(other,self,"DIA_Holger_01_09");	//Není to veselý příběh, ale tvému otci se po tobě stýská a chce tě vidět.
	AI_Output(self,other,"DIA_Holger_01_10");	//Opravdu? On se nezlobí? Nelžeš?
	AI_Output(other,self,"DIA_Holger_01_11");	//Ne, samozřejmě.
	AI_Output(self,other,"DIA_Holger_01_12");	//Pak budu brzy u nich!
	MIS_HOLGER_QUEST = 4;
	Log_SetTopicStatus(TOPIC_BADSON,LOG_SUCCESS);
	B_LogEntry(TOPIC_BADSON,"Tak, nakonec do sebe vše zapadlo. Holger měl prostě smůlu a klášter byla jeho poslední možnost. Doufám, že se s Alvinem vše urovná.");
	INNOSPRAYCOUNT += 1;
	Npc_ExchangeRoutine(nov_11114_holger,"Smoke");
};

instance DIA_HOLGER_HELLO(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_hello_condition;
	information = dia_holger_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_holger_hello_condition()
{
	if(Wld_IsTime(20,0,8,0) && (Kapitel <= 2) && (MIS_HOLGER_QUEST < 1))
	{
		return TRUE;
	};
};

func void dia_holger_hello_info()
{
	AI_Output(self,other,"DIA_Holger_Hello_01_01");	//Hej! Počkej chvíli.
	AI_Output(self,other,"DIA_Holger_Hello_01_02");	//Něco pro tebe mám. Nemohl bys mi něco obstarat?
	AI_Output(other,self,"DIA_Holger_Hello_01_03");	//Vodu? Jídlo? Trávu?
	AI_Output(self,other,"DIA_Holger_Hello_01_04");	//Ne, to nepotřebuji, v klášteře máme všeho dostatek.
	AI_Output(self,other,"DIA_Holger_Hello_01_05");	//Teda kromě trávy, jestli tu zmíníš před mágy, budeš hodně dlouho zametat ve sklepení.
	AI_Output(self,other,"DIA_Holger_Hello_01_06");	//Ram náhodou upustil do sudu vína palici a Gorax už ho třetí týden nutí zametat.
	AI_Output(self,other,"DIA_Holger_Hello_01_07");	//Ani nevím, kde ji tu vzal.
	AI_Output(other,self,"DIA_Holger_Hello_01_08");	//To je smutné, ale zpátky k věci!
	AI_Output(self,other,"DIA_Holger_Hello_01_09");	//Jo, jasně... Takže, mohl bys něco vzít od pastýře z města Alvina? Jeden amulet.
	AI_Output(other,self,"DIA_Holger_Hello_01_10");	//No, mám ho ukrást, koupit...?
	AI_Output(self,other,"DIA_Holger_Hello_01_11");	//Ne, jenom mu dej tenhle dopis a zmiň moje jméno.
	AI_Output(other,self,"DIA_Holger_Hello_01_12");	//A proč tam nejdeš sám?
	AI_Output(self,other,"DIA_Holger_Hello_01_13");	//(váhá) To je dlouhý příběh...
	AI_Output(self,other,"DIA_Holger_Hello_01_14");	//Víš co, když mi přineseš ten amulet, řeknu ti ho, platí?
	Info_ClearChoices(dia_holger_hello);
	Info_AddChoice(dia_holger_hello,"Jasně, zajímalo by mě, co v tom je.",dia_holger_hello_yes);
	Info_AddChoice(dia_holger_hello,"Ne, nechci se do toho míchat.",dia_holger_hello_no);
};

func void dia_holger_hello_yes()
{
	AI_Output(other,self,"DIA_Holger_Hello_Yes_01_01");	//Jasně, zajímalo by mě, co v tom je.
	AI_Output(self,other,"DIA_Holger_Hello_Yes_01_02");	//Budu čekat.
	B_GiveInvItems(self,hero,itwr_holger_letter,1);
	Log_CreateTopic(TOPIC_BADSON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BADSON,LOG_Running);
	MIS_HOLGER_QUEST = 1;
	B_LogEntry(TOPIC_BADSON,"Mluvil jsem s novicem jménem Holger. Požádal mě, abych mu přinesl z města jeden amulet od pastýře Alvina. Když jsem se ho zeptal, proč si pro něj nezajde sám trochu se vykroucel. Prý mi to řekne, když mu amulet přinesu. Mám Alvinovi říct, kdo mě poslal a předat dopis.");
	Info_ClearChoices(dia_holger_hello);
};

func void dia_holger_hello_no()
{
	AI_Output(other,self,"DIA_Holger_Hello_No_01_01");	//Ne, nechci se do toho míchat.
	AI_Output(self,other,"DIA_Holger_Hello_No_01_02");	//Dobře, když ne, tak ne.
	Info_ClearChoices(dia_holger_hello);
};


instance DIA_Holger_GiveAmulet(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = DIA_Holger_GiveAmulet_condition;
	information = DIA_Holger_GiveAmulet_info;
	permanent = FALSE;
	description = "Mám ten amulet.";
};

func int DIA_Holger_GiveAmulet_condition()
{
	if((MIS_HOLGER_QUEST == 2) && (Npc_HasItems(other,itam_holger_amulet) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Holger_GiveAmulet_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Holger_GiveAmulet_01_01");	//Mám ten amulet.
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_02");	//Neděláš si legraci?
	AI_Output(other,self,"DIA_Holger_GiveAmulet_01_03");	//Tady, ber.
	B_GiveInvItems(other,self,itam_holger_amulet,1);
	Npc_RemoveInvItems(self,itam_holger_amulet,1);
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_04");	//To je vážně on, moc děkuji!
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_05");	//Tady, mám u sebe svitek Malé ohnivé bouře.
	B_GiveInvItems(self,other,ItSc_Firestorm,1);
	B_LogEntry(TOPIC_BADSON,"Přinesl jsem Hogarovi amulet od Alvina, teď by měl vyklopit, proč si pro něj nezašel sám.");
	MIS_HOLGER_QUEST = 3;
};

instance DIA_Holger_Wurst(C_Info)
{
	npc = nov_11114_holger;
	nr = 2;
	condition = DIA_Holger_Wurst_Condition;
	information = DIA_Holger_Wurst_Info;
	permanent = FALSE;
	description = "Tady, mám pro tebe jehněčí klobásu.";
};

func int DIA_Holger_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_HOLGER_QUEST < 4) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Holger_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Tady, mám pro tebe jehněčí klobásu.
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Dobře, dej to sem!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_HOLGER_TRADE(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_trade_condition;
	information = dia_holger_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Nemáš něco na prodej?";
};

func int dia_holger_trade_condition()
{
	if(HOLGER_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_holger_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_holger_TRADE_01_01");	//Nemáš něco na prodej?
	AI_Output(self,other,"DIA_holger_TRADE_01_02");	//Podívej se...
	B_GiveTradeInv(self);
};

instance DIA_HOLGER_RELAX(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_relax_condition;
	information = dia_holger_relax_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int dia_holger_relax_condition()
{
	if((MIS_HOLGER_QUEST == 4) && (Npc_GetDistToWP(nov_11114_holger,"NW_CITY_PATH_HABOUR_08_B") <= 100))
	{
		return TRUE;
	};
};

func void dia_holger_relax_info()
{
	AI_Output(other,self,"DIA_holger_Relax_01_01");	//Jak to jde?
	AI_Output(self,other,"DIA_holger_Relax_01_02");	//Skvěle! Rodiče mi odpustili.
	AI_Output(self,other,"DIA_holger_Relax_01_03");	//Teď s nimi opět mohu trávit čas.

	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_holger_Relax_01_04");	//Jsem rád, že si zase zahulím, to v klášteře nejde.
	};

	AI_Output(self,other,"DIA_holger_Relax_01_05");	//Jestli mě budeš potřebovat, budu v klášteru.

	MIS_HOLGER_QUEST = 5;
	HOLGER_TRADE_COND = TRUE;
};

instance DIA_HOLGER_PICKPOCKET(C_Info)
{
	npc = nov_11114_holger;
	nr = 900;
	condition = dia_holger_pickpocket_condition;
	information = dia_holger_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_holger_pickpocket_condition()
{
	return C_Beklauen(54,70);
};

func void dia_holger_pickpocket_info()
{
	Info_ClearChoices(dia_holger_pickpocket);
	Info_AddChoice(dia_holger_pickpocket,Dialog_Back,dia_holger_pickpocket_back);
	Info_AddChoice(dia_holger_pickpocket,DIALOG_PICKPOCKET,dia_holger_pickpocket_doit);
};

func void dia_holger_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void dia_holger_pickpocket_back()
{
	Info_ClearChoices(dia_holger_pickpocket);
};