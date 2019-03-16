var int SagittaMakeOnce;

instance DIA_Sagitta_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_NO_TALK(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = dia_sagitta_no_talk_condition;
	information = dia_sagitta_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_sagitta_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sagitta_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HALLO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 4;
	condition = DIA_Sagitta_HALLO_Condition;
	information = DIA_Sagitta_HALLO_Info;
	description = "Tak sama, tady venku?";
};


func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//Tak sama, tady venku?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Řekni, co ode mě chceš, a pak vypadni. Mám práci.
	Info_ClearChoices(DIA_Sagitta_HALLO);
	Info_AddChoice(DIA_Sagitta_HALLO,Dialog_Back,DIA_Sagitta_HALLO_ende);
	Info_AddChoice(DIA_Sagitta_HALLO,"Můžeš mě vyléčit?",DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO,"Co tady děláš?",DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HALLO,"Kdo jsi?",DIA_Sagitta_HALLO_wer);
};

func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//Tak tys o mně ještě neslyšel?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Bylinkářka, alespoň se tomu tak říká. Šarlatánka, nebo tak nějak mě nazývají.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//Ale, když je jim zle, vždycky je jim stará Sagitta se svými léčivými bylinkami dobrá.
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//Žiju tady, co se pamatuju a starám se o své bylinky.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//Les je mým přítelem. Poskytuje mi vše, co potřebuju.
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Můžeš mě vyléčit?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//To je to, proč jsi tady, že? Tak povídej, co je v nepořádku.
	Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader,"U Sagitty za Sekobovou farmou si mohu nakoupit vybavení.");
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};


instance DIA_Sagitta_TeachAlchemyRequest(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_TeachAlchemyRequest_Condition;
	information = DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit něco o bylinkách?";
};


func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (MIS_Sagitta_Herb == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Sagitta_TeachAlchemyRequest_OneTime;

func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Můžeš mě naučit něco o bylinkách?
	if(DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//Jak zajímavé. O něco takového mě lidé nežádají zrovna často.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//Takže, ty by ses chtěl stát mým studentem? To bys měl nejdřív prokázat, že to s tím zájmem myslíš vážně.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//Právě připravuju velmi vzácný lektvar, který vyžaduje vybrané bylinky a extrakty.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//Když mi seženeš jednu ingredienci - velmi vzácnou bylinu, kterou tady bohužel nemám - můžu tě něčemu naučit.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//Už jsem ti řekla, že ano. Až mi přineseš tu vzácnou bylinu.
	};
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Promiň, nemám zájem.",DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"A kde ji najdu?",DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"O jakou ingredienci se jedná?",DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//O jakou ingredienci se jedná?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//Je to nesmírně vzácná rostlina - říká se jí sluneční aloe. Poznáš ji podle pronikavé mandlové vůně.
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//A kde ji najdu?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//Ta bylina, co potřebuju, roste jen na místech, kde má všechny potřebné živiny.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//Ty se nacházejí v exkrementech černého trola.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//Proto je pro mě tak obtížné tu rostlinu získat.
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest,"Uvidíme, co se s tím dá dělat.",DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Uvidíme, co se s tím dá dělat.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Dobrá tedy. Tak hodně štěstí při hledání.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb,LOG_Running);
	B_LogEntry(TOPIC_SagittaHerb,"Sagitta potřebuje zvláštní rostlinu zvanou sluneční aloe, která roste pouze u exkrementů černého trola.");
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Promiň, nemám zájem.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Tak přestaň plýtvat mým časem s těmi tvými nesmysly.
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};


instance DIA_Sagitta_Sagitta_Herb(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Sagitta_Herb_Condition;
	information = DIA_Sagitta_Sagitta_Herb_Info;
	description = "Našel jsem sluneční aloe.";
};


func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if(Npc_HasItems(other,ItPl_Xagitta_Herb_MIS) && (MIS_Sagitta_Herb == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//Našel jsem sluneční aloe.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Díky. A teď se mě ohledně lektvarů můžeš ptát, na co chceš.
	B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
	Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};


instance DIA_Sagitta_Teach(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent = TRUE;
	description = "Jaké lektvary mě můžeš naučit?";
};


var int DIA_Sagitta_Teach_permanent;

func int DIA_Sagitta_Teach_Condition()
{
	if((DIA_Sagitta_Teach_permanent == FALSE) && (Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//Jaké lektvary mě můžeš naučit?
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach,Dialog_Back,DIA_Sagitta_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Elixír obratnosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Lektvar výdrže",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_STAMINA)),dia_sagitta_teach_stamina);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach,b_buildlearnstringforalchemy("Elixír výdrže",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),dia_sagitta_teach_perm_stamina);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Předtím, než tě naučím něco z mé alchymie, ti musím říct, co všechno budeš na přípravu lektvarů potřebovat.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//Alchymistická kolona slouží jako kuchyň pro přípravu lektvarů. Budeš potřebovat prázdné laboratorní baňky, ve kterých se lektvary uchovávají.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Pak přidáš ingredience a máš požadovaný lektvar.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//Tomu se samozřejmě můžeš ode mě naučit.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//Tak jaký lektvar by to měl být?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//Už znáš vše, co bych tě mohla naučit.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void dia_sagitta_teach_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void dia_sagitta_teach_perm_stamina()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA);
	Info_ClearChoices(DIA_Sagitta_Teach);
};


instance DIA_SAGITTA_ALOE(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloe_condition;
	information = dia_sagitta_aloe_info;
	permanent = FALSE;
	description = "A jaký nápoj se bude z aloe dělat?";
};


func int dia_sagitta_aloe_condition()
{
	if(Sagitta_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void dia_sagitta_aloe_info()
{
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_00");	//A jaký nápoj se bude z aloe dělat?
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_01");	//Jde o velmi mocný lektvar - po jeho užití je tvoje kůže silná jako trolí kožich.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_02");	//Ale recept ti neřeknu.
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_03");	//A uvařila bys ho pro mně?
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_04");	//Z této rostliny? (s lítostí) Ne, bohužel ten je již objednán.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_05");	//Pokud mi však přineseš jinou rostlinu, pak ti připravím tento lektvar.
	AI_Output(self,other,"DIA_Sagitta_Aloe_17_06");	//Ale samozřejmě ne zadarmo.
	AI_Output(other,self,"DIA_Sagitta_Aloe_15_07");	//Chápu.
};


instance DIA_SAGITTA_ALOEREADY(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloeready_condition;
	information = dia_sagitta_aloeready_info;
	permanent = TRUE;
	description = "Mám pro tebe další sluneční aloe.";
};

func int dia_sagitta_aloeready_condition()
{
	if((Sagitta_TeachAlchemy == TRUE) && Npc_KnowsInfo(other,dia_sagitta_aloe) && (Npc_HasItems(other,ItPl_Xagitta_Herb_MIS) >= 1) && (SAGITTAONWORK == FALSE) && (SagittaMakeOnce == FALSE))
	{
		return TRUE;
	};
};

func void dia_sagitta_aloeready_info()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_01_00");	//Mám pro tebe další sluneční aloe.
	if(SAGITTA_SECONDAALOE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_01");	//Skvěle! (omámeně) Kde jsi ji sehnal?!
		AI_Output(other,self,"DIA_Sagitta_AloeReady_01_02");	//Řekněme, že je to mé tajemství.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_03");	//Dobře, takže za tisíc zlatých je lektvar tvůj.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_04");	//Co říkáš?
		SAGITTA_SECONDAALOE = TRUE;
		B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_01_05");	//Máš-li peníze, je lektvar tvůj!
	};
	Info_ClearChoices(dia_sagitta_aloeready);
	Info_AddChoice(dia_sagitta_aloeready,"Nemám dost peněz.",dia_sagitta_aloeready_no);
	Info_AddChoice(dia_sagitta_aloeready,"Tady máš peníze.",dia_sagitta_aloeready_ok);
};

func void dia_sagitta_aloeready_no()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_No_01_01");	//Nemám dost peněz.
	AI_Output(self,other,"DIA_Sagitta_AloeReady_No_01_02");	//Pak se vrať až je budeš mít!
	AI_StopProcessInfos(self);
};

func void dia_sagitta_aloeready_ok()
{
	AI_Output(other,self,"DIA_Sagitta_AloeReady_Ok_01_00");	//Tady máš peníze.

	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_01");	//Vrať se zítra odpoledne.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_02");	//Lektvar bude připraven.
		B_GiveInvItems(other,self,ItPl_Xagitta_Herb_MIS,1);
		Npc_RemoveInvItems(self,ItPl_Xagitta_Herb_MIS,1);
		SAGITTASECONDALOEDAY = Wld_GetDay();
		SAGITTAONWORK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_03");	//No? Kde mám ty peníze?
		AI_Output(other,self,"DIA_Sagitta_AloeReady_Ok_01_04");	//Zdá se, že je nemám...
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_05");	//Nesnaž se mě oklamat! Nebudu pracovat zadarmo!.
		AI_Output(self,other,"DIA_Sagitta_AloeReady_Ok_01_06");	//Až získáš peníze, pak se vrať.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_ALOEGET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_aloeget_condition;
	information = dia_sagitta_aloeget_info;
	permanent = TRUE;
	description = "Je lektvar hotov?";
};

func int dia_sagitta_aloeget_condition()
{
	if((SAGITTASECONDALOEDAY > 0) && (SAGITTAONWORK == TRUE))
	{
		return TRUE;
	};
};

func void dia_sagitta_aloeget_info()
{
	var int daynow;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Sagitta_AloeGet_01_00");	//Je lektvar hotov?

	if(SAGITTASECONDALOEDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (SAGITTASECONDALOEDAY < (daynow - 1)))
		{
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_01");	//Tady je.
			B_GiveInvItems(self,other,itpo_perm_def,1);
			AI_Output(other,self,"DIA_Sagitta_AloeGet_01_02");	//Díky.
			SAGITTASECONDALOEDAY = FALSE;
			SAGITTAONWORK = FALSE;
			SagittaMakeOnce = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_03");	//Je snad už další den po poledni?
			AI_Output(other,self,"DIA_Sagitta_AloeGet_01_04");	//No...
			AI_Output(self,other,"DIA_Sagitta_AloeGet_01_05");	//No proto. Neruš mě při práci!
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_AloeGet_01_06");	//Řekla jsem ti, abys přišel zítra odpoledne!
		AI_StopProcessInfos(self);
	};
};


var int praydaysagg;

instance DIA_Sagitta_HEAL(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 99;
	condition = DIA_Sagitta_HEAL_Condition;
	information = DIA_Sagitta_HEAL_Info;
	permanent = TRUE;
	description = "Vyleč mě.";
};

func int DIA_Sagitta_HEAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Vyleč mě.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if(PRAYDAYSAGG != Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Ukaž, podívám se. Hmm... Na ty nejhorší zranění by měla moje mastička stačit.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAYSAGG = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else if(PRAYDAYSAGG == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Sagitta_HEAL_17_03");	//Dnes jsem tě už léčila, jdi pryč.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//V tuhle chvíli nepotřebuješ žádné léčení.
	};
};


instance DIA_Sagitta_TRADE(C_Info)
{
	npc = BAU_980_Sagitta;
	condition = DIA_Sagitta_TRADE_Condition;
	information = DIA_Sagitta_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Jaké zboží mi můžeš nabídnout?";
};


func int DIA_Sagitta_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//Jaké zboží mi můžeš nabídnout?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Řekni, co chceš.
	B_GiveTradeInv(self);
};


instance DIA_Sagitta_KAP3_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP3_EXIT_Condition;
	information = DIA_Sagitta_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_OBSESSION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_OBSESSION_Condition;
	information = DIA_Sagitta_OBSESSION_Info;
	description = "Mám podivné pocity úzkosti.";
};


func int DIA_Sagitta_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//Trpím pocity strachu. Potřebuju pomoc.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//Vidím, že spánek by ti moc nepomohl. Byl jsi vystaven temnému pohledu Pátračů.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Zajdi za Pyrokarem, nejvyšším mágem kláštera. Moje skromné možnosti na tohle nestačí.
};


instance DIA_Sagitta_Thekla(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Thekla_Condition;
	information = DIA_Sagitta_Thekla_Info;
	description = "Thekla mě poslala pro nějaký balík.";
};


func int DIA_Sagitta_Thekla_Condition()
{
	if((MIS_Thekla_Paket == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla mě poslala pro nějaký balík.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ach, ano. Už jsem ho očekávala včera.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Tady je ten balík. Dávej na něj dobrý pozor!
	B_GivePlayerXP(XP_AmbientKap3);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
};


instance DIA_Sagitta_KAP4_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP4_EXIT_Condition;
	information = DIA_Sagitta_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_HEALRANDOLPH(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 30;
	condition = DIA_Sagitta_HEALRANDOLPH_Condition;
	information = DIA_Sagitta_HEALRANDOLPH_Info;
	permanent = TRUE;
	description = "Randolph má absťák.";
};


var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if((MIS_HealRandolph == LOG_Running) && (Npc_HasItems(other,ItPo_HealRandolph_MIS) == 0) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph má absťák.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//Kdy už se ten chlap konečně poučí?
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//Už jsem ti pro něj přichystala dávku. Tak se s tím nikde moc nepoflakuj.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//Dám mu na to lék. To mu bude na několik dní stačit.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//Přijde to na 300 zlatých.
	if(DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//Co?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//Jediná věc, kterou dostaneš úplně zadarmo, je smrt, chlapče.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Pff. Za takové nesmysly utrácet nebudu.",DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH,"Tady jsou peníze.",DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Tady jsou peníze.
	if(B_GiveInvItems(other,self,ItMi_Gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Výborně. Vždycky ty peníze můžeš dostat zpátky od něj.
		CreateInvItems(self,ItPo_HealRandolph_MIS,1);
		B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph,"Sagitta mi dala lék pro Randolpha.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//Dokud mi nedáš peníze, nebude žádnej obchod.
	};
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Pff. Za takové nesmysly utrácet nebudu.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(Smích) Nedal ti peníze, co? To je celý on!
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};


instance DIA_Sagitta_KAP5_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP5_EXIT_Condition;
	information = DIA_Sagitta_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_KAP6_EXIT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 999;
	condition = DIA_Sagitta_KAP6_EXIT_Condition;
	information = DIA_Sagitta_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sagitta_PICKPOCKET(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 900;
	condition = DIA_Sagitta_PICKPOCKET_Condition;
	information = DIA_Sagitta_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(pokusit se jí ukrást klíč)";
};


func int DIA_Sagitta_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,Dialog_Back,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	if(hero.attribute[ATR_DEXTERITY] >= 100)
	{
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_SagittaChest,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	}
	else
	{
		Print("Požadovaná obratnost: 100");

		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};


instance DIA_SAGITTA_RECEPTFORTYON(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 2;
	condition = dia_sagitta_receptfortyon_condition;
	information = dia_sagitta_receptfortyon_info;
	permanent = FALSE;
	description = "Mám otázku.";
};


func int dia_sagitta_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_sagitta_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_00");	//Mám otázku.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_01");	//O co jde?
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_02");	//Zaslechl jsem něco o lektvaru který ovlivňuje lidské vědomí!
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_03");	//Nevíš o tom něco?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_04");	//Obávám se, že ti nemohu pomoci. Nevím co by to za lektvar mohl být.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_05");	//Ale mohu ti dát radu.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_06");	//Jakou?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_07");	//Vzhledem k tomu, že jde o velmi vzácnou věc, možná dokonce mýtickou...
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_08");	//Takové věci bývají dobře skryté.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_09");	//Takže?
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_10");	//Odpověď na tvou otázku najdeš tam, kde se obyčejní lidé nemohou dostat.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_11");	//Jsem si jistá že mágové Ohně budou ve svém klášteře vědět víc.
	AI_Output(other,self,"DIA_Sagitta_ReceptForTyon_01_12");	//Díky za radu.
	AI_Output(self,other,"DIA_Sagitta_ReceptForTyon_01_13");	//Vždy ráda pomohu.
};


instance DIA_SAGITTA_CLAW(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = dia_sagitta_claw_condition;
	information = dia_sagitta_claw_info;
	permanent = FALSE;
	description = "Znáš lovce jménem Nix?";
};


func int dia_sagitta_claw_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && Npc_KnowsInfo(other,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void dia_sagitta_claw_info()
{
	AI_Output(other,self,"DIA_Sagitta_Claw_01_00");	//Znáš lovce jménem Nix?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_01");	//Ano, vím o koho jde. Často mě navštěvuje když loví poblíž.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_02");	//Opravdu?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_03");	//Ano obvykle shání různé léčivé bylinky a lektvary. Proč se ptáš?
	AI_Output(other,self,"DIA_Sagitta_Claw_01_04");	//Postihlo ho neštěstí.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_05");	//Co se mu stalo?
	AI_Output(other,self,"DIA_Sagitta_Claw_01_06");	//Jemu nic, ale jeho vlčice Tlama byla během lovu vážně zraněna wargem!
	AI_Output(other,self,"DIA_Sagitta_Claw_01_07");	//Nyní je na tom opravdu špatně.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_08");	//Nix zkusil všechno, ale její stav se jen zhoršuje.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_09");	//To mne nepřekvapuje. O léčení nic neví narozdíl ode mě.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_10");	//Takže mu pomůžeš?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_11");	//Samozřejmě vím, jak moc mu na Tlamě záleží. Jsem ochotna pomoct.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_12");	//Ale říkáš že rána je vážná - bude potřebovat silný léčivý lektvar.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_13");	//Nemohu slíbit že to pomůže.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_14");	//Samozřejmě, dostanu tedy ten lektvar?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_15");	//Bohužel ho nemám (smutně). Ale můžu ho namíchat
	AI_Output(self,other,"DIA_Sagitta_Claw_01_16");	//Ovšem budu potřebovat správné ingredience.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_17");	//Jaké?
	AI_Output(self,other,"DIA_Sagitta_Claw_01_18");	//Královský šťovík, lesní bobuli, dvě trávy z bažin a léčivý kořen.
	AI_Output(self,other,"DIA_Sagitta_Claw_01_19");	//Přines to a dostaneš lék.
	AI_Output(other,self,"DIA_Sagitta_Claw_01_20");	//Dobře, hned vyrazím!
	B_LogEntry(TOPIC_RECOVERDOG,"Sagitta mi dá lék pro Tlamu, avšak potřebuje několik věcí: královský šťovík, lesní bobuli, dvě trávy z bažin a léčivý kořen.");
};


instance DIA_SAGITTA_CLAWDONE(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = dia_sagitta_clawdone_condition;
	information = dia_sagitta_clawdone_info;
	permanent = FALSE;
	description = "Mám ty byliny.";
};


func int dia_sagitta_clawdone_condition()
{
	if((MIS_RECOVERDOG == LOG_Running) && (SAGITTAHELPSCLAW == FALSE) && Npc_KnowsInfo(other,dia_sagitta_claw) && (Npc_HasItems(other,ItPl_SwampHerb) >= 2) && (Npc_HasItems(other,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(other,ItPl_Forestberry) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1))
	{
		return TRUE;
	};
};

func void dia_sagitta_clawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_00");	//Mám ty byliny.
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_01");	//Dobře, dej to sem a já namíchám lék.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_02");	//Ustup!
	B_GiveInvItemsManyThings(self,other);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,2);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Forestberry,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_03");	//Počkej...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"NW_SAGITTA_CAVE_IN_03");
	AI_AlignToWP(self);
	AI_LookAtNpc(other,self);
	AI_UseMob(self,"LAB",1);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_04");	//...(mumlá si pro sebe)
	AI_UseMob(self,"LAB",-1);
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_05");	//A je to. Lék je připraven.
	B_GiveInvItems(self,other,itpo_sagittaclawpotion,1);
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_06");	//A co teď?
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_07");	//(Vážně) Teď mě poslouchej. 
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_08");	//Umyj rány Tlamě a poté použij tento lektvar.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_09");	//To je vše?
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_10");	//Ano, to je vše. Vážně doufám, že to pomůže.
	AI_Output(other,self,"DIA_Sagitta_ClawDone_01_11");	//Dobře, děkuju ti.
	AI_Output(self,other,"DIA_Sagitta_ClawDone_01_12");	//(S úsměvem) Rádo se stalo.
	SAGITTAHELPSCLAW = TRUE;
	B_LogEntry(TOPIC_RECOVERDOG,"Sagitta mi dala lék pro vlčici Tlamu. Nyní ho musím odnést do tábora lovců.");
};

instance DIA_Sagitta_LOKIPOTION(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_LOKIPOTION_Condition;
	information = DIA_Sagitta_LOKIPOTION_Info;
	description = "Hledám jednu vzácnou rostlinu - květ kaktusu.";
};


func int DIA_Sagitta_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_LOKIPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_00");	//Hledám jednu vzácnou rostlinu - květ kaktusu.
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_01");	//Co o něm víš?
	AI_Output(self,other,"DIA_Sagitta_LOKIPOTION_01_02");	//Bojím se, že nic. 
	AI_Output(self,other,"DIA_Sagitta_LOKIPOTION_01_03");	//Popravdě řečeno, neznám tu rostlinu a ani nevím jak vypadá.
	AI_Output(other,self,"DIA_Sagitta_LOKIPOTION_01_04");	//Pochopitelně.
};

instance DIA_SAGITTA_PLACEBO(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = dia_sagitta_placebo_condition;
	information = dia_sagitta_placebo_info;
	permanent = FALSE;
	description = "Pastýř Pepe je vážně zraněný.";
};

func int dia_sagitta_placebo_condition()
{
	if((MIS_LECHENIEPEPE == LOG_Running) && Npc_KnowsInfo(hero,DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void dia_sagitta_placebo_info()
{
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_01");	//Pastýř Pepe je vážně zraněný.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_02");	//Co se stalo?
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_03");	//Jeden goblin mu vážně poranil nohu.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_04");	//Jeho noha zmodrala a on se na ni nemůže ani postavit.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_05");	//Taky říká, že běžné léčivé lektvary mu nepomáhají.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_06");	//Zajímavé... (zamyšleně) obvykle se takové zranění jednoduše léčí tinktůrou z modrého bezu. 
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_07");	//Běžný lektvar by ho měl postavit na nohy.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_08");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_09");	//Myslím, že problém bude v něčem jiném.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_10");	//Pro takový případ znám jen jeden účinný způsob léčby.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_11");	//A v čem spočívá?
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_12");	//V takovém případě postačí dát postiženému obyčejný lektvar, ale říci mu, že je to, 'elixír života'.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_13");	//Pacient se vyléčí, jako kdyby skutečně dostal takový elixír.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_14");	//Můžu ti zaručit, že to bude opravdu fungovat.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_15");	//Tento trik jsem použila už několikrát a vždy to zabralo.
	AI_Output(other,self,"DIA_Sagitta_Placebo_01_16");	//Zajímavý způsob léčby. Tak já to vyzkouším.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_17");	//Tak dobře. (se smíchem) Řekni Pepemu že jsem pro něj udělala obzvlášť silný lektvar.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_18");	//A dej mu obyčejnou léčivou esenci.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_19");	//Hlavně neprozraď, že jsi mu dal obyčejný lektvar, dokud se neuzdraví.
	AI_Output(self,other,"DIA_Sagitta_Placebo_01_20");	//Jednoduše - drž jazyk za zuby.
	B_LogEntry(TOPIC_LECHENIEPEPE,"Sagitta mi řekla, jak vyléčit Pepeho. Mám mu dát obyčejný lektvar a přesvědčit ho, že je to speciální lék pro něj.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Troll,"FP_ROAM_CASTLEMILL_TROLL_01");
	Wld_InsertNpc(Shadowbeast,"FP_ROAM_NW_BIGFARMFORESTCAVE_04");
	Wld_InsertNpc(DragonSnapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_01");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_02");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_03");
	Wld_InsertNpc(Snapper,"FP_ROAM_NW_BIGFARM_FOREST_03_NAVIGATION_04");
};

instance DIA_Sagitta_Seekers(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Condition;
	information = DIA_Sagitta_Seekers_Info;
	description = "Tváříš se nějak divně.";
};

func int DIA_Sagitta_Seekers_Condition()
{
	if((Kapitel == 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Seekers_Info()
{
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_00");	//Co se stalo, že se tváříš tak divně?
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_01");	//(úzkostlivě) Nic, vše je v pořádku...
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_02");	//Jen mám špatný pocit z těch lidí v černých kápích, co se tady v poslední době potulují.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_03");	//Myslíš Pátrače?
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_04");	//Zřejmě. Po pravdě, nevím, co jsou zač.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_05");	//Cítím se nesvá a mám silné bolesti hlavy, když se přiblíží.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_06");	//Zvláštní, nikdy se mi nic takového nestalo.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_07");	//A včera jeden z nich něco hledal poblíž mé jeskyně.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_08");	//Doufám, že si nevšimnul, že jsem ho sledovala.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_09");	//Bude pro tebe lepší držet se od nich dál.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_10");	//Nejlépe bys udělala, kdybys odešla k Onarovi na farmu. Pryč odtud.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_11");	//Co?
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_12");	//V každém případě, tam budeš v bezpečí.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_13");	//(důrazně) Promiň. Nemohu odtud odejít - je to můj domov.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_14");	//Kromě toho jsem si zvykla na život poustevníka. Onarovy způsoby mě nejsou po chuti.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_15");	//Hodně riskuješ, když tady chceš zůstat sama.
	AI_Output(self,other,"DIA_Sagitta_Seekers_01_16");	//Co se dá dělat. (usmívá se) Ale nechat jeskyni bez dozoru také nemohu.
	AI_Output(other,self,"DIA_Sagitta_Seekers_01_17");	//Dobře, zkusím něco vymyslet.
	MIS_SagittaGuard = LOG_Running;
	Log_CreateTopic(TOPIC_SagittaGuard,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Running);
	B_LogEntry(TOPIC_SagittaGuard,"Sagitta je velmi rozrušená z přítomnosti Pátračů v blízkosti její jeskyně. Zeptal jsem se jí jestli nechce odejít na Onarovu farmu. Odmítla s tím, že nemůže opustit svou jeskyni.");
};

instance DIA_Sagitta_Seekers_Done(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Seekers_Done_Condition;
	information = DIA_Sagitta_Seekers_Done_Info;
	description = "Teď máš ochranu.";
};

func int DIA_Sagitta_Seekers_Done_Condition()
{
	if((MIS_SagittaGuard == LOG_Running) && (LeeSendGuard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Seekers_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sagitta_Seekers_Done_01_00");	//Teď máš ochranu.
	AI_Output(other,self,"DIA_Sagitta_Seekers_Done_01_01");	//Už si nemusíš dělat starosti s těma lidma v černých kápích.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_02");	//(usmívá se) Děkuji ti. I když, upřímně - moc těm žoldákům nevěřím.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_03");	//Ale je to lepší, než se pořád třást strachem.
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_04");	//Tady, vezmi si tyto lektvary jako projev mé vděčnosti.
	B_GiveInvItems(self,other,ItPo_Health_02,2);
	AI_Output(self,other,"DIA_Sagitta_Seekers_Done_01_05");	//Pomohou ti vyléčit tvá zranění.
	MIS_SagittaGuard = LOG_Success;
	Log_SetTopicStatus(TOPIC_SagittaGuard,LOG_Success);
	B_LogEntry(TOPIC_SagittaGuard,"Sagitta byla ráda, že jsem ji sehnal někoho, kdo ji bude chránit.");
};

instance DIA_Sagitta_Werewolf(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Condition;
	information = DIA_Sagitta_Werewolf_Info;
	permanent = FALSE;
	description = "Říká se, že se zde objevila obrovská stínová šelma.";
};

func int DIA_Sagitta_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Orlan_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_00");	//Říká se že se zde objevila obrovská stínová šelma.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_01");	//(překvapeně) Opravdu? Kdo to říkal?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_02");	//No, znáš to - klepy... Ale může na tom něco být.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_03");	//Proč se o to zajímáš?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_01_04");	//Je to dlouhá historie. No v krátkosti, tato stínová šelma... Je výjimečná, ne jako běžné stínové šelmy.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_01_05");	//(vážně) Ano, já vím.
	Info_ClearChoices(DIA_Sagitta_Werewolf);
	Info_AddChoice(DIA_Sagitta_Werewolf,"Odkud?",DIA_Sagitta_Werewolf_Know);
};

func void DIA_Sagitta_Werewolf_Know()
{
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_00");	//Odkud?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_01");	//Je hned za tebou.
	AI_TurnToNPC(other,Werewolf);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_02");	//Jak tomu mám rozumět?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_03");	//Schovej zbraň! Nic ti neudělá.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_04");	//Určitě nekouše?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_05");	//Ne... (směje se) Ten chudák je příliš vyděšený, než aby někoho napadnul.
	AI_RemoveWeapon(self);
	AI_TurnToNPC(other,self);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_06");	//Ty mu věříš? Vždyť to on napadnul jednoho z Akilových rolníků.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_07");	//Ne to byla jiná stínová šelma. On by neublížil ani mouše.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_08");	//Jak jsem už pochopila, dřív byl člověkem. Ale něčí špatný vtip ho proměnil ve zvíře.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_09");	//Máš pravdu. Alchymista Ignaz něco popletl v transformačním kouzlu.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_10");	//Ta stínová šelma je jeho asistent, který měl tu smůlu a to kouzlo použil.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_11");	//(vážně) Nyní je mi vše jasné. Aspoň, že ho to kouzlo nezabilo. A to je dobře...
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_12");	//Co s ním teď budeš dělat?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_13");	//(zamyšleně) Asi zůstane žít tady se mnou.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_14");	//Pro přátele to nic nemění a nezvané hosty aspoň zažene.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_15");	//Ale bylo by dobré vymyslet, jak mu vrátit jeho podobu.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_16");	//Máš nějakej nápad jak na to?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_17");	//Bohužel moje znalosti na to nestačí. Možná by nám mohli pomoci mágové.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Know_01_18");	//Zkus promluvit s Vatrasem. Jsem si jistá, že něco vymyslí.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Know_01_19");	//Dobře. Promluvím s ním.
	SagittaWereWolf = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Stínová šelma, kterou jsem hledal se najednou objevila v jeskyni Sagitty. Podle ní, nepředstavuje žádné nebezpečí. Je tu ale problém, jak mu vrátit lidskou podobu. Sagitta mi poradila, abych promluvil s Vatrasem.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Werewolf,"NW_SAGITTA_CAVE_IN_WEREWOLF");
};

instance DIA_Sagitta_Werewolf_Killed(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Killed_Condition;
	information = DIA_Sagitta_Werewolf_Killed_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Sagitta_Werewolf_Killed_condition()
{
	if(WerewolfIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Killed_Info()
{
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_00");	//Proč jsi ho zabil? Co ti udělal?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_01");	//Nemyslela jsem si, že jsi takový mizera!
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Killed_01_02");	//Vypadni z mé jeskyně!
	SagittaPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_PissOff(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_PissOff_Condition;
	information = DIA_Sagitta_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Sagitta_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SagittaPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_PissOff_Info()
{
	AI_Output(self,other,"DIA_Sagitta_PissOff_01_00");	//Vypadni, špinavý bastarde!
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 3;
	condition = DIA_Sagitta_Werewolf_Safe_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Info;
	permanent = FALSE;
	description = "Promluvil jsem s Vatrasem.";
};

func int DIA_Sagitta_Werewolf_Safe_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (VatrasGiveSpell == TRUE) && (WereWolfIsHuman == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_00");	//Promluvil jsem s Vatrasem.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_01");	//A co říkal?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_02");	//Může mu vrátit akorát lidské vědomí. Víc je i nad jeho síly.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_03");	//Dobře. (smutně) Snad to alespoň trochu zmírní jeho utrpení.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_04");	//Říkal Vatras, jak to máme udělat?
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_01_05");	//Samozřejmě. Dal mi magický svitek. S jeho pomocí mu vrátíme paměť.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_01_06");	//Tak se do toho pusť. Snad to bude fungovat.
	AI_StopProcessInfos(self);
};

instance DIA_Sagitta_Werewolf_Safe_Done(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 1;
	condition = DIA_Sagitta_Werewolf_Safe_Done_Condition;
	information = DIA_Sagitta_Werewolf_Safe_Done_Info;
	permanent = FALSE;
	description = "Použil jsem svitek.";
};

func int DIA_Sagitta_Werewolf_Safe_Done_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman == TRUE) && (Npc_KnowsInfo(hero,DIA_Werewolf_Hallo) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Werewolf_Safe_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_00");	//Použil jsem svitek.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_01");	//Dobře. Už vidím výsledky.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_02");	//Myslím, že by sis o tom měl promluvit s Ignazem.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_03");	//Jsem si jistá, že ho pořád trápí co se stalo.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_04");	//Stínová šelma zůstane tady?
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_05");	//Kde jinde. (usmívá se) Les není ideální místo a mezi lidmi také být nemůže.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_06");	//A já tu aspoň nebudu sama.
	AI_Output(self,other,"DIA_Sagitta_Werewolf_Safe_Done_01_07");	//Lidi moc nemusím. Ale tohle... to je něco jinýho.
	AI_Output(other,self,"DIA_Sagitta_Werewolf_Safe_Done_01_08");	//Rozumím.
	SaggitaCanSave = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Sagitta mi řekla, abych o tom informoval Ignaze. Mohlo by to trochu uklidnit jeho svědomí.");
};

instance DIA_Sagitta_ASKFORDT(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 6;
	condition = DIA_Sagitta_askfordt_condition;
	information = DIA_Sagitta_askfordt_info;
	permanent = FALSE;
	description = "Potřebuji léčitele do svého tábora.";
};

func int DIA_Sagitta_askfordt_condition()
{
	if(Npc_KnowsInfo(other,DIA_Sagitta_HALLO) && (HURRAYICANHIRE == TRUE) && (SagittaNeed == TRUE) && (MIS_SagittaGuard == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_00");	//Potřebuji léčitele do svého tábora.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_01");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_02");	//Zařizuji tábor a potřebuji tam léčitele. Hned jsem si vzpomněl na tebe!
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_03");	//Přestože víš, že nemám ráda ostatní lidi a neopustím svoji jeskyni?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_04");	//Jenže časy se mění, to musíš vědět.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_05");	//Co tím myslíš?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_06");	//Nikde není bezpečno. Vzpomeň si na temné cizince. Příště by to nemuselo skončit dobře.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_07");	//Ani tvá stráž tě neochrání.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_08");	//Myslím, že to hoši zvládnou.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_09");	//Já bych na to nespoléhal.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_10");	//Leeho chlapi jsou žoldáci. Pokud půjde do tuhého, utečou.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_11");	//Obzvláště pokud budou stát proti magii Temnoty.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_12");	//A ty mi můžeš poskytnou ochranu proti takovým silám?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_13");	//Jistě. Vždyť mne znáš. Navíc můj tábor je nedobytný.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_14");	//Hm... a kde to je?
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_15");	//Za Onarovou farmou, u staré věže.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_16");	//Poblíž je navíc pevnost paladinů.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_17");	//To zní bezpečně. Ale budu tam mít co dělat?
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_18");	//Myslím tím, zdali tam nebudu zbytečná.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_19");	//Toho bych se nebál, spousta lidí, spusta zranění. Samozřejmě dostaneš zaplaceno.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_20");	//Nejde jen o peníze. Budu potřebovat spoustu vybavení, které musím koupit.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_21");	//Kolik potřebuješ?
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_22");	//Hm... Myslím, že čtyřicet zlatých denně pokryje náklady.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_23");	//Fajn. Mimochodem, co tvoje stráž?
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_24");	//Myslím že tu zůstanou. Alespoň pohlídají jeskyni.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_25");	//Dobře. Heslo pro vstup je 'dračí poklad'.
	AI_Output(other,self,"DIA_Sagitta_AskforDT_17_26");	//Stačí ho sdělit strážci.
	AI_Output(self,other,"DIA_Sagitta_AskforDT_17_27");	//Chápu. Uvidíme se tam.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Sagitta bude v mém táboře ošetřovat raněné a nemocné.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	SagittaRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Sagitta_INTOWER(C_Info)
{
	npc = BAU_980_Sagitta;
	nr = 22;
	condition = DIA_Sagitta_intower_condition;
	information = DIA_Sagitta_intower_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_Sagitta_intower_condition()
{
	if((SagittaRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_intower_info()
{
	AI_Output(other,self,"DIA_Sagitta_InTower_OrcKap_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Sagitta_InTower_OrcKap_01_01");	//Jsem ráda že jsem sem přišla.
};