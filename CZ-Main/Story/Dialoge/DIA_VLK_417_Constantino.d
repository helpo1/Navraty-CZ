
var int APP_CONSTANTINO_TR;

instance DIA_Constantino_EXIT(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 999;
	condition = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Constantino_PICKPOCKET(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 900;
	condition = DIA_Constantino_PICKPOCKET_Condition;
	information = DIA_Constantino_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Constantino_PICKPOCKET_Condition()
{
	return C_Beklauen(59,90);
};

func void DIA_Constantino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,Dialog_Back,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Constantino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Constantino_PICKPOCKET);
};

var int FirstTalkConstantino;

instance DIA_Constantino_NoTalkAtAll(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_NoTalkAtAll_Condition;
	information = DIA_Constantino_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NoTalkAtAll_Info()
{
	if(FirstTalkConstantino == FALSE)
	{
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_00");	//Hej, nemáš tu co dělat.
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_01");	//Vypadni!
		FirstTalkConstantino = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_NoTalkAtAll_12_02");	//Řekl jsem, vypadni!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Constantino_Hallo(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Constantino_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//Co chceš? Nic tady není zadarmo.
};


instance DIA_Constantino_AboutLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent = FALSE;
	description = "Chtěl bych k někomu vstoupit do učení.";
};

func int DIA_Constantino_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Constantino_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Chtěl bych k někomu vstoupit do učení.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Skutečně? A ke komu se chceš zapsat?
};

instance DIA_Constantino_Heilung(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent = FALSE;
	description = "Potřebuji uzdravit.";
};

func int DIA_Constantino_Heilung_Condition()
{
	return TRUE;
};

func void DIA_Constantino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Potřebuji uzdravit.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(úsečně) Copak, jsi zraněný?
	Info_ClearChoices(DIA_Constantino_Heilung);
	Info_AddChoice(DIA_Constantino_Heilung,"Vlastně ne.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice(DIA_Constantino_Heilung,"Ano.",DIA_Constantino_Heilung_Ja);
};

func void DIA_Constantino_Heilung_Ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Ano!
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Tak si zajdi za Vatrasem, ten tě dá zase do pořádku. A přestaň mi tu svinit podlahu od krve!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//Vždyť máš sotva šrám a já mám na práci důležitější věci, než se s tebou vybavovat.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Constantino_Heilung_Nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//Vlastně ne.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Tak se ztrať, nebo k úrazu přijdeš.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Constantino_LestersKraeuter(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 5;
	condition = DIA_Addon_Constantino_LestersKraeuter_Condition;
	information = DIA_Addon_Constantino_LestersKraeuter_Info;
	description = "Zajímá tě koupě nějakých bylin?";
};


func int DIA_Addon_Constantino_LestersKraeuter_Condition()
{
	if((MIS_Constantino_BringHerbs == 0) && (MIS_Addon_Lester_PickForConstantino != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Zajímá tě koupě nějakých bylin?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//Pokud je tu něco, co můžeš nabídnout...
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Constantino_Trade(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 700;
	condition = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};

func int DIA_Constantino_Trade_Condition()
{
	if(Wld_IsTime(8,0,13,0) || Wld_IsTime(16,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Ukaž mi své zboží.

	if(Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Constantino prodává alchymistické zásoby.");
		Constantino_Logpatch1 = TRUE;
	};
	if((Player_IsApprentice == APP_Constantino) && (APP_CONSTANTINO_TR == FALSE))
	{
		CreateInvItems(self,ItPl_Dex_Herb_01,1);
		CreateInvItems(self,ItPl_Strength_Herb_01,1);
		CreateInvItems(self,ItPl_Speed_Herb_01,10);
		CreateInvItems(self,ItPl_Blueplant,15);
		CreateInvItems(self,ItPl_Perm_Herb,1);
		APP_CONSTANTINO_TR = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) >= 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	CreateInvItems(self,ItMi_Flask,5);
	B_GiveTradeInv(self);
};


instance DIA_Constantino_BeiDir(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent = FALSE;
	description = "Chtěl bych se stát tvým učedníkem.";
};


func int DIA_Constantino_BeiDir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BeiDir_Info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Chtěl bych se stát tvým učedníkem.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//MÝM učedníkem? Ne! Už jsem jednou tu pochybnou čest měl a to mi úplně stačilo. S žádným dalším učedníkem už se otravovat nebudu.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Celá léta jsem mu předával vědomosti a nakonec se ten pitomec zbláznil a otrávil se!
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Běž se zapsat k někomu z ostatních mistrů.
};


instance DIA_Constantino_ZUSTIMMUNG(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Chtěl bych se zapsat u některého z ostatních mistrů.";
};


func int DIA_Constantino_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_AboutLehrling) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Chtěl bych se zapsat u některého z ostatních mistrů.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Přišel jsi mě požádat o doporučení?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hm - co se mě týče, můžeš se zapsat, u koho chceš.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Víš, ty to nechápeš! To, co jsem o tobě slyšel, nijak nemluví ve tvůj prospěch.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Nepřimluvím se za to, aby zločinec jako ty zastával ve městě nějakou čestnou pozici.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Dokud všechno neurovnáš s velitelem stráží, má odpověď bude ne!
	};
	if(Constantino_Logpatch2 == FALSE)
	{
		Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
		B_LogEntry(TOPIC_Lehrling,"Constantino mi dá své doporučení, pokud se ve městě nezapletu do žádného zločinu.");
		Constantino_Logpatch2 = TRUE;
		B_GivePlayerXP(50);
	};
};


instance DIA_Constantino_BringHerbs(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent = FALSE;
	description = "Co musím udělat, abych se mohl stát TVÝM učedníkem?";
};


func int DIA_Constantino_BringHerbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_BeiDir) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_BringHerbs_Info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Co musím udělat, abych se mohl stát TVÝM učedníkem?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(povzdechne si) Už si nevezmu na svědomí ŽÁDNÉHO dalšího diletanta.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//Všude kolem roste spousta rozličných bylin. V různých obměnách jsou jejich účinky velmi rozdílné.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Ty nejspíš neznáš ani polovinu z nich.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(povzdechne si) Tumáš - tohle je seznam těch nejdůležitějších rostlin.
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Přines mi od každé jeden exemplář a možná si rozmyslím, zda tě přijmout za učedníka.
	MIS_Constantino_BringHerbs = LOG_Running;
	Log_CreateTopic(TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ConstantinoPlants,LOG_Running);
	B_LogEntry(TOPIC_ConstantinoPlants,"Constantino chce jednu rostlinu od každého druhu, jinak mě jako učedníka nepřijme.");
};

instance DIA_Constantino_LostKey(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKey_Condition;
	information = DIA_Constantino_LostKey_Info;
	permanent = FALSE;
	description = "Vypadáš trochu rozrušeně.";
};

func int DIA_Constantino_LostKey_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Constantino_LestersKraeuter) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKey_Info()
{
	AI_Output(other,self,"DIA_Constantino_LostKey_01_01");	//Vypadáš trochu rozrušeně.
	AI_Output(self,other,"DIA_Constantino_LostKey_01_02");	//Stále... (křičí) mám být z čeho rozrušený!
	AI_Output(other,self,"DIA_Constantino_LostKey_01_03");	//A co se stalo?
	AI_Output(self,other,"DIA_Constantino_LostKey_01_04");	//Eh... (škrábe se na hlavě) Během své poslední procházky jsem ztratil klíč od své truhly. A teď netuším, co mám dělat.
	AI_Output(other,self,"DIA_Constantino_LostKey_01_06");	//No, nemohl by ti pomoci Thorben? Vyzná se v zámcích.
	AI_Output(self,other,"DIA_Constantino_LostKey_01_07");	//Už jsem se ho ptal, ale jen potřásl hlavou a řekl, že mi s tímhle nemůže pomoci. 
	AI_Output(other,self,"DIA_Constantino_LostKey_01_08");	//A kde ses naposledy procházel?
	AI_Output(self,other,"DIA_Constantino_LostKey_01_09");	//Není to tvoje práce, hochu... (křičí) Na tom místě jsem už hledal! Žádný klíč jsem ale nenašel.
	MIS_Constantino_LostKey = LOG_Running;
	Log_CreateTopic(TOPIC_Constantino_LostKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Running);
	B_LogEntry(TOPIC_Constantino_LostKey,"Při cestě z města Constantino ztratil klíč. Je pravda, že neřekl kudy ta cesta vedla.");
};

instance DIA_Constantino_LostKeyDone(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LostKeyDone_Condition;
	information = DIA_Constantino_LostKeyDone_Info;
	permanent = FALSE;
	description = "Našel jsem tvůj klíč.";
};

func int DIA_Constantino_LostKeyDone_Condition()
{
	if((MIS_Constantino_LostKey == LOG_Running) && (Npc_HasItems(other,ItKe_Constantino) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LostKeyDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_01");	//Našel jsem tvůj klíč.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_02");	//Opravdu?!
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_03");	//Tady, podívej se.
	B_GiveInvItems(other,self,ItKe_Constantino,1);
	Npc_RemoveInvItems(self,ItKe_Constantino,1);
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_04");	//Ano, je to... (podezřívavě) A kde jsi ho našel?
	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_05");	//Na okraji města, poblíž východní brány.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_06");	//(chichotání) Ano, tam jsem byl. No, měl bych ti za tvojí pomoc poděkovat.
	AI_Output(self,other,"DIA_Constantino_LostKeyDone_01_08");	//Na, vezmi si tento lektvar. Taková věc je mnohem cennější než zlato. Doufám, že to pochopíš.

	if((Player_IsApprentice == APP_Constantino) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
		{
			B_GiveInvItems(self,other,ItPo_Perm_Dex,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItPo_Perm_Str,1);
		};
	};

	AI_Output(other,self,"DIA_Constantino_LostKeyDone_01_11");	//Samozřejmě.
	MIS_Constantino_LostKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_Constantino_LostKey,LOG_Success);
	B_LogEntry(TOPIC_Constantino_LostKey,"Vrátil jsem Constantinovi klíč.");
};

instance DIA_Constantino_HerbsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent = TRUE;
	description = "Co se týče těch rostlin...";
};

func int DIA_Constantino_HerbsRunning_Condition()
{
	if(MIS_Constantino_BringHerbs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_HerbsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Co se týče těch rostlin...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Jestli to nezvládneš sám, nikdy z tebe pořádný alchymista nebude!
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
	Info_AddChoice(DIA_Constantino_HerbsRunning,"Aha.",DIA_Constantino_HerbsRunning_Running);
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) && (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) && (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) && (Npc_HasItems(other,ItPl_Temp_Herb) > 0) && (Npc_HasItems(other,ItPl_Perm_Herb) > 0))
	{
		Info_AddChoice(DIA_Constantino_HerbsRunning,"Už jsem sehnal všechny rostliny, které jsem ti měl přinést!",DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Už jsem sehnal všechny rostliny, které jsem ti měl přinést!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Cože? Taháš mě za nos, co?
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItWr_Kraeuterliste,1);
	CreateInvItems(self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Při Adanovi! Všechno je opravdu v pořádku.
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Kdo ví, možná že z tebe přece jenom jednou bude slušný alchymista.
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Constantino_Herbs);
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Constantino mě přijme do učení, jen když získám doporučení od čtyřech mistrů.");
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Aha.
	Info_ClearChoices(DIA_Constantino_HerbsRunning);
};


var int Constantino_StartGuild;

instance DIA_Constantino_LEHRLING(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent = TRUE;
	description = "Mohu se teď stát tvým učedníkem?";
};

func int DIA_Constantino_LEHRLING_Condition()
{
	if((MIS_Constantino_BringHerbs == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Mohu se teď stát tvým učedníkem?

	if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Co se mě týče, tak ano.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Haradovi záleží především na tom, abys dokázal v případě skřetího útoku ubránit město.
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//A vypadá to, žes ho o tom přesvědčil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Ale on si myslí, že jsi zbabělec.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Ale Harad tvrdí, že tě ještě nikdy neviděl.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper se o tvých kvalitách zmínil pouze zdrženlivě.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Počítám, že by si tě radši vzal do učení sám.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Ale nakonec přece jenom souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Odepřít souhlas zrovna z takového důvodu rozhodně není nijak čestné!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Ale jestli tě doporučí i ostatní mistři, nebudeš jeho hlas potřebovat.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//A Bosper tě zatím vůbec nezná.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben je velmi pobožný.
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Ale požehnal ti - to je dobré znamení.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Svůj souhlas ti však dá pouze tehdy, až si vyprosíš i požehnání od bohů.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben ani neví, kdo jsi.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//A co se týče Mattea, ten na tebe všude pěje chválu.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo tvrdí, že mu ještě něco dlužíš. Chceš-li jeho souhlas, radši bys tu záležitost měl co nejrychleji vyřídit.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo tvrdí, že s tebou o téhle věci zatím nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo tě prý ve svém krámku ještě nikdy neviděl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//To znamená, žes získal doporučení ode všech mistrů!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Nyní tě doporučují čtyři mistři - to postačí, abys mohl k někomu vstoupit do učení.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Jsi připraven vstoupit do učení ke mně?
			Info_ClearChoices(DIA_Constantino_LEHRLING);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Nejdřív se na to musím vyspat.",DIA_Constantino_LEHRLING_Later);
			Info_AddChoice(DIA_Constantino_LEHRLING,"Ano, mistře.",DIA_Constantino_LEHRLING_Yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Chceš-li k někomu v dolní čtvrti vstoupit do učení, potřebuješ souhlas alespoň čtyř mistrů.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Takže by sis měl promluvit se všemi, kteří ti zatím souhlas nedali.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(podrážděně) Ani náhodou! Slyšel jsem, žes byl tady v Khorinisu obžalován z nějakého zločinu!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Nepřijmu tě do učení, dokud tu záležitost u velitele městské stráže neurovnáš.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	B_GivePlayerXP(XP_Lehrling);
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Ano, mistře.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(povzdechne si) No tak dobře! Doufám, že svého rozhodnutí nebudu litovat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//Od téhle chvíle se tedy považuj za mého učedníka.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_05");	//Tady, vem si tyhle šaty. Aspoň budeš vypadat jako alchymista.
	B_GiveInvItems(self,other,itar_alchemy_nov,1);
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_06");	//A je to lepší, než ty cáry co nosíš teď!
	Player_IsApprentice = APP_Constantino;
	TalentCount_Alchemy[0] += 5;
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,10);
	Npc_ExchangeRoutine(Lothar,"START");
	Constantino_StartGuild = other.guild;
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry_Quiet(Topic_Bonus,"Constantino mě přijal za učedníka. Teď mám přístup do horní čtvrti města.");
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_03");	//A ještě jedna věc. Když jsi teď můj učedník, můžu tě naučit zdarma přípravu jednoho lektvaru, ale jen jednoho!
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_04");	//Takže máš na výběr, který z nich to bude?
	Info_ClearChoices(DIA_Constantino_LEHRLING);

	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Esence hojivé síly",dia_constantino_lehrling_heal);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Esence many",dia_constantino_lehrling_mana);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_LEHRLING,"Lektvar rychlosti",dia_constantino_lehrling_speed);
	};
};

func void dia_constantino_lehrling_heal()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Tak dobrá. Hezky od začátku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Každý lektvar je dělán z rostlin - a každé dosahují různých možností využití.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Tohle začínají být trochu složitější formule.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//K přípravě lektvaru u alchymistické kolony potřebuješ laboratorní lahvičku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musíš znát recept na jeho přípravu a také mít u sebe příslušné ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Můžu tě několik formulí naučit, jestli chceš.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Naučím tě lektvary, které obnoví tvou ztracenou výdrž ale také ty, které zvýší tvou sílu trvale.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Můžu tě to naučit všechno najednou.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Constantino mě zasvětí do tajů alchymie.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_00");	//Esence hojivé síly je jeden z najprostějších magických lektvarů.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_01");	//Ingredience pro esenci hojivé síly jsou: Léčivá rostlina a Luční pohanka.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_mana()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Tak dobrá. Hezky o začátku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Každý lektvar je dělán z rostlin - a každé dosahují různých možností využití.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Tohle začínají být trochu složitější formule.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//K přípravě lektvaru u alchymistické kolony potřebuješ laboratorní lahvičku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musíš znát recept na jeho přípravu a také mít u sebe příslušné ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Můžu tě několik formulí naučit, jestli chceš.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Naučím tě lektvary, které obnoví tvou ztracenou výdrž ale také ty, které zvýší tvou sílu trvale.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Můžu tě to naučit všechno najednou.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Constantino mě zasvětí do tajů alchymie.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_02");	//Esence many je jeden z najprostějších magických lektvarů.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_03");	//Ingredience pro esenci many jsou: Ohnivá kopřiva a Luční pohanka.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void dia_constantino_lehrling_speed()
{
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Tak dobrá. Hezky o začátku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Každý lektvar je dělán z rostlin - a každé dosahují různých možností využití.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Tohle začínají být trochu složitější formule.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//K přípravě lektvaru u alchymistické kolony potřebuješ laboratorní lahvičku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musíš znát recept na jeho přípravu a také mít u sebe příslušné ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Můžu tě několik formulí naučit, jestli chceš.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Naučím tě lektvary, které obnoví tvou ztracenou výdrž ale také ty, které zvýší tvou sílu trvale.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Můžu tě to naučit všechno najednou.
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Constantino mě zasvětí do tajů alchymie.");

	if(b_teachplayertalentalchemy_free(self,other,POTION_Speed))
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_04");	//Lektvar rychlosti je jeden z najprostějších magických lektvarů.
		AI_Output(self,other,"DIA_Constantino_LEHRLING_90_05");	//Ingredience pro lektvar rychlosti jsou: Chňapavčí býlí a Luční pohanka.
	};
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Nejdřív se na to musím vyspat.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//No dobře! Jestli do toho opravdu nechceš dát všechno, pak by sis měl zvolit jiné povolání.
	Info_ClearChoices(DIA_Constantino_LEHRLING);
};

var int Constantino_MILKommentar;
var int Constantino_INNOSKommentar;
var int Constantino_KDWKommentar;
var int Constantino_SEKKommentar;
var int Constantino_KDMKommentar;

instance DIA_Constantino_AlsLehrling(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Constantino_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Constantino) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Constantino_AlsLehrling_Info()
{
	if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(podrážděně) Odmítám tě dál učit, dokud budeš obžalovaný ze zločinu.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Zajdi za lordem Andrem a dej to nějak do pořádku.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (Constantino_StartGuild != GIL_MIL) && (Constantino_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Tak ty ses přidal k domobraně? Už jsem o tom slyšel.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Chceš se rychle vyučit a pak se přidat k domobraně? Postarám se, abys to neměl tak jednoduché.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Doufám ale, že se budeš držet naší dohody a budeš mi pravidelně nosit rostliny a houby.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//A jestli jsou na tebe dvě povolání moc, tak prostě trochu míň spi!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (Constantino_StartGuild != GIL_NOV) && (Constantino_StartGuild != GIL_KDF) && (Constantino_StartGuild != GIL_PAL) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Vidím, žes vstoupil do Innosových služeb. To tedy nejspíš znamená, že od nynějška už nebudeš mít tolik času, abys starci nosil byliny.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Ale i tak si považuji za čest, že jsem tě na tvé cestě podpořil.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//Pokud si i přes své nové povinnosti vyšetříš trochu času na alchymii, věz, že tě tu vždycky rád přivítám.
		Constantino_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Constantino_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_13");	//Kruh následovníků Adana je na Khorinisu velmi úzký. Patří k těm mágům, kteří mají cenné znalosti i v oblasti alchymie.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_14");	//Nezapomeň, že jsi stále mým učedníkem. Můžeš se stát mágem Vody, ale nezapomínej na hledání hub. 
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_15");	//A ano, podle pověstí může mág snadno překonat lesní kočky a vyvrácené kořeny, pokud si přidrží plášť nad zemí.

		Constantino_KDWKommentar = TRUE;
	}
	else if((Constantino_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_16");	//Nemůžu uvěřit, že jsi vstoupil do té sekty! Myslel jsem, že můj učedník pobral trochu rozumu.

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_17");	//Říká se, že sektáři mají dobře trénované stráže. Dej si pozor ať nepřijdeš o hlavu. Přesto bys měl mít dost rozumu na dvě věci: nosit mi houby, a netahat mi sem trávu z bažin!
		};

		Constantino_SEKKommentar = TRUE;
	}
	else if((Constantino_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_18");	//Každý alchymista se někdy setkal s nekromancií. Setkal, rozumíš? Abys nezašel příliš daleko. A je lepší se v té robě neukazovat na veřejnosti. Společnost nemá nekromanty zrovna v oblibě.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_19");	//Já stejně jako doposud potřebuji houby a nezáleži mi na tom, zda mi je donese nekromant nebo přístavní kurtizána. Klidně pokračuj.
		Constantino_KDMKommentar = TRUE;
	}
	else if((Constantino_Lehrling_Day <= (Wld_GetDay() - 4)) && (Constantino_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Kam tím míříš?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Počítám, že většina mých učedníků sem pak prostě zaskočí jen jednou za uherský rok!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Přinesl jsi mi aspoň nějaké houby?
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Tak tě tu zase máme.
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Constantino_Aufgaben(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent = FALSE;
	description = "Co mám za úkoly?";
};


func int DIA_Constantino_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};

func void DIA_Constantino_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Co mám za úkoly?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Nejsem tak naivní, abych si myslel, že mladík jako ty bude celý den trávit se mnou mezi čtyřmi stěnami.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Stačí, když mi čas od času přineseš rostliny, které potřebuji, a já tě na oplátku budu učit alchymistickému umění.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Také si u mě můžeš nakoupit lahvičky. Většinu přísad si ale už budeš muset opatřit sám.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//A zároveň počítám, že tady ve městě budeš jako řádný občan sekat latinu.
};


instance DIA_Constantino_Mushrooms(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent = FALSE;
	description = "Jaké rostliny mám obstarat?";
};


func int DIA_Constantino_Mushrooms_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Constantino_Mushrooms_Info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Jaké rostliny mám obstarat?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Koupím všechno, co mi přineseš - a zaplatím ti za to obvyklou cenu.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Za houby ale dostaneš zvlášť slušnou sumičku.
	MIS_Constantino_Mushrooms = LOG_Running;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Constantinovi mohu prodávat houby za mimořádně výhodnou cenu.");
};


instance DIA_Constantino_MushroomsRunning(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent = TRUE;
	description = "Chtěl jsi nějaké houby...";
};

func int DIA_Constantino_MushroomsRunning_Condition()
{
	if(MIS_Constantino_Mushrooms == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Chtěl jsi nějaké houby.
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Později...",DIA_Constantino_MushroomsRunning_Later);

	if(Player_IsApprentice == APP_Constantino)
	{
		if((Npc_HasItems(other,ItPo_Perm_Stamina) > 0) || (Npc_HasItems(other,ItPo_Perm_Mana) > 0) || (Npc_HasItems(other,ItPo_Perm_Health) > 0) || (Npc_HasItems(other,ItPo_Perm_Dex) > 0) || (Npc_HasItems(other,ItPo_Perm_STR) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem magické lektvary.",dia_constantino_mushroomsrunning_sell_perm_potion);
		};
		if((Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Temp_Herb) > 0) || (Npc_HasItems(other,ItPl_Perm_Herb) > 0) || (Npc_HasItems(other,ITPL_SUPER_HERB) > 0))
		{
			Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem vzácné byliny.",dia_constantino_mushroomsrunning_sell_rare_plants);
		};
	};
	if((Npc_HasItems(other,ItPl_Health_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem léčivé rostliny a byliny.",dia_constantino_mushroomsrunning_sell_herb);
	};
	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem ohnivé kopřivy a býlí.",dia_constantino_mushroomsrunning_sell_mana);
	};
	if((Npc_HasItems(other,ItAt_BugMandibles) > 0) || (Npc_HasItems(other,ItAt_CrawlerMandibles) > 0) || (Npc_HasItems(other,ItAt_SpiderMandibles) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem kusadla.",dia_constantino_mushroomsrunning_sell_mand);
	};
	if(Npc_HasItems(other,ItAt_OreBugClaw) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem drápy.",dia_constantino_mushroomsrunning_sell_claz);
	};
	if(Npc_HasItems(other,ItAt_Wing) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem křídla krvavých much.",dia_constantino_mushroomsrunning_sell_w);
	};
	if(Npc_HasItems(other,ItAt_Sting) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem žihadla krvavých much.",dia_constantino_mushroomsrunning_sell_st);
	};
	if((Npc_HasItems(other,ItPl_Mushroom_01) > 0) || (Npc_HasItems(other,ItPl_Mushroom_02) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem pár hub.",dia_constantino_mushroomsrunning_sell_1);
	};
	if((Npc_HasItems(other,ItAt_StoneGolemHeart) > 0) || (Npc_HasItems(other,ItAt_FireGolemHeart) > 0) || (Npc_HasItems(other,ItAt_IceGolemHeart) > 0) || (Npc_HasItems(other,ITAT_SWAMPGOLEMHEART) > 0))
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Přinesl jsem srdce golemů.",dia_constantino_mushroomsrunning_sell_heart);
	};
	if(Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Proč jsou ty houby tak důležité?",DIA_Constantino_MushroomsRunning_Why);
	};
};

func void dia_constantino_mushroomsrunning_sell_perm_potion()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Já ti je přinesu...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPo_Perm_STR) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Lektvar síly (cena: 750 zlatých)",dia_constantino_mushroomsrunning_sell_STR);
	};
	if(Npc_HasItems(other,ItPo_Perm_Dex) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Lektvar obratnosti (cena: 750 zlatých)",dia_constantino_mushroomsrunning_sell_DEX);
	};
	if(Npc_HasItems(other,ItPo_Perm_Health) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Lektvar života (cena: 1000 zlatých)",dia_constantino_mushroomsrunning_sell_Health);
	};
	if(Npc_HasItems(other,ItPo_Perm_Mana) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Lektvar many (cena: 1000 zlatých)",dia_constantino_mushroomsrunning_sell_Mans);
	};
	if(Npc_HasItems(other,ItPo_Perm_Stamina) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Lektvar výdrže (cena: 500 zlatých)",dia_constantino_mushroomsrunning_sell_STA);
	};
};

func void dia_constantino_mushroomsrunning_sell_STR()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DEX()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPo_Perm_Dex,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Health()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Health,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_Mans()
{
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_STA()
{
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(other,ItPo_Perm_Stamina,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_rare_plants()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Já ti je přinesu...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Mana_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivý kořen (cena: 20 zlatých)",dia_constantino_mushroomsrunning_sell_ManaRoot);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_03) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivý kořen (cena: 30 zlatých)",dia_constantino_mushroomsrunning_sell_HealthRoot);
	};
	if(Npc_HasItems(other,ItPl_Dex_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Gobliní bobule (cena: 125 zlatých)",dia_constantino_mushroomsrunning_sell_DexHerb);
	};
	if(Npc_HasItems(other,ItPl_Strength_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Dračí kořen (cena: 250 zlatých)",dia_constantino_mushroomsrunning_sell_StrHerb);
	};
	if(Npc_HasItems(other,ItPl_Speed_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Chňapavčí býlí (cena: 50 zlatých)",dia_constantino_mushroomsrunning_sell_SpeedHerb);
	};
	if(Npc_HasItems(other,ItPl_Temp_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Luční pohanka (cena: 10 zlatých)",dia_constantino_mushroomsrunning_sell_TempHerb);
	};
	if(Npc_HasItems(other,ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Královský šťovík (cena: 250 zlatých)",dia_constantino_mushroomsrunning_sell_PermHerb);
	};
	if(Npc_HasItems(other,ITPL_SUPER_HERB) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Trolí bobule (cena: 250 zlatých)",dia_constantino_mushroomsrunning_sell_StaHerb);
	};
};

func void dia_constantino_mushroomsrunning_sell_ManaRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,20);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_HealthRoot()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_03,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_DexHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,125);
	Npc_RemoveInvItems(other,ItPl_Dex_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StrHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Strength_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_SpeedHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,50);
	Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_TempHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,10);
	Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_PermHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_StaHerb()
{
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(other,ITPL_SUPER_HERB,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Já ti je přinesu...",DIA_Constantino_MushroomsRunning_Later);

	if(Npc_HasItems(other,ItPl_Health_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivá bylina - 1x (cena: 30 zlatých)",dia_constantino_mushroomsrunning_sell_herb_2);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivé byliny - 10x (cena: 300 zlatých)",dia_constantino_mushroomsrunning_sell_herb_20);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivé byliny - 50x (cena: 1500 zlatých)",dia_constantino_mushroomsrunning_sell_herb_50);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivá rostlina - 1x (cena: 15 zlatých)",dia_constantino_mushroomsrunning_sell_herb_1);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivé rostliny - 10x (cena: 150 zlatých)",dia_constantino_mushroomsrunning_sell_herb_10);
	};
	if(Npc_HasItems(other,ItPl_Health_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Léčivé rostliny - 50x (cena: 750 zlatých)",dia_constantino_mushroomsrunning_sell_herb_150);
	};
};

func void dia_constantino_mushroomsrunning_sell_herb_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_150()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,30);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_herb_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_heart()
{
	var int mand;

	mand = (Value_StoneGolemHeart * Npc_HasItems(other,ItAt_StoneGolemHeart)) + (VALUE_SWAMPGOLEMHEART * Npc_HasItems(other,ITAT_SWAMPGOLEMHEART)) + (Value_IceGolemHeart * Npc_HasItems(other,ItAt_IceGolemHeart)) + (Value_FireGolemHeart * Npc_HasItems(other,ItAt_FireGolemHeart));
	B_GiveInvItems(self,other,ItMi_Gold,mand);
	Npc_RemoveInvItems(other,ItAt_StoneGolemHeart,Npc_HasItems(other,ItAt_StoneGolemHeart));
	Npc_RemoveInvItems(other,ITAT_SWAMPGOLEMHEART,Npc_HasItems(other,ITAT_SWAMPGOLEMHEART));
	Npc_RemoveInvItems(other,ItAt_IceGolemHeart,Npc_HasItems(other,ItAt_IceGolemHeart));
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,Npc_HasItems(other,ItAt_FireGolemHeart));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mand()
{
	var int mand;
	var int mandsp;
	var int summmand;

	mand = Npc_HasItems(other,ItAt_BugMandibles) + Npc_HasItems(other,ItAt_CrawlerMandibles);
	mandsp = Npc_HasItems(other,ItAt_SpiderMandibles);
	summmand = (mand * 12) + (mandsp * 25);
	B_GiveInvItems(self,other,ItMi_Gold,summmand);
	Npc_RemoveInvItems(other,ItAt_BugMandibles,Npc_HasItems(other,ItAt_BugMandibles));
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,Npc_HasItems(other,ItAt_CrawlerMandibles));
	Npc_RemoveInvItems(other,ItAt_SpiderMandibles,Npc_HasItems(other,ItAt_SpiderMandibles));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_w()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Wing) * 15);
	Npc_RemoveInvItems(other,ItAt_Wing,Npc_HasItems(other,ItAt_Wing));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_claz()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_OreBugClaw) * 10);
	Npc_RemoveInvItems(other,ItAt_OreBugClaw,Npc_HasItems(other,ItAt_OreBugClaw));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_st()
{
	B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Sting) * 20);
	Npc_RemoveInvItems(other,ItAt_Sting,Npc_HasItems(other,ItAt_Sting));
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana()
{
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	Info_AddChoice(DIA_Constantino_MushroomsRunning,"Já ti je přinesu...",DIA_Constantino_MushroomsRunning_Later);
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivá tráva - 1x (cena: 15 zlatých)",dia_constantino_mushroomsrunning_sell_mana_2);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivá tráva - 10x (cena: 150 zlatých)",dia_constantino_mushroomsrunning_sell_mana_20);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_02) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivá tráva - 50x (cena: 750 zlatých)",dia_constantino_mushroomsrunning_sell_mana_60);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) > 0)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivá kopřiva - 1x (cena: 7 zlatých)",dia_constantino_mushroomsrunning_sell_mana_1);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 10)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivé kopřivy - 10x (cena: 70 zlatých)",dia_constantino_mushroomsrunning_sell_mana_10);
	};
	if(Npc_HasItems(other,ItPl_Mana_Herb_01) >= 50)
	{
		Info_AddChoice(DIA_Constantino_MushroomsRunning,"Ohnivé kopřivy - 50x (cena: 350 zlatých)",dia_constantino_mushroomsrunning_sell_mana_50);
	};
};

func void dia_constantino_mushroomsrunning_sell_mana_1()
{
	B_GiveInvItems(self,other,ItMi_Gold,7);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_10()
{
	B_GiveInvItems(self,other,ItMi_Gold,70);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_50()
{
	B_GiveInvItems(self,other,ItMi_Gold,350);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_01,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_2()
{
	B_GiveInvItems(self,other,ItMi_Gold,15);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,1);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_20()
{
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,10);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_mana_60()
{
	B_GiveInvItems(self,other,ItMi_Gold,750);
	Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,50);
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void dia_constantino_mushroomsrunning_sell_1()
{
	var int Dunkelpilz_dabei;
	Dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Podařilo se mi najít pár tmavých hub.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Páni - ty jsou nejlepší! Skvělá práce - a tady máš zlato!
		Dunkelpilz_dabei = TRUE;
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_01) * 5);
		B_GiveInvItems(other,self,ItPl_Mushroom_01,Npc_HasItems(other,ItPl_Mushroom_01));
		Npc_RemoveInvItems(self,ItPl_Mushroom_01,Npc_HasItems(self,ItPl_Mushroom_01));
	};
	if(Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if(Dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//A tady jsou ještě nějaké další.
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//Mám tu pro tebe pár hub!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Sice nejsou tak dobré jako tmavé houby, ale i tak ti za ně zaplatím.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItPl_Mushroom_02) * 10);
		B_GiveInvItems(other,self,ItPl_Mushroom_02,Npc_HasItems(other,ItPl_Mushroom_02));
		Npc_RemoveInvItems(self,ItPl_Mushroom_02,Npc_HasItems(self,ItPl_Mushroom_02));
	};
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Proč jsou ty houby pro tebe tak důležité?

	if(Constantino_DunkelpilzCounter == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//(povzdechne se) I když jsi mým učedníkem, nevyžvaním ti úplně všechno.
	}
	else if(Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//No dobře - tak já ti to tedy povím. Ale musíš si to nechat pro sebe.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Tmavé houby jsou plné magické energie a pokaždé, když některou sníš, se ti část její síly usadí v těle.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Sníš-li dostatečný počet těchto hub, tvá magická energie se zvýší.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Kdybych ti to řekl dříve, nejspíš by sis všechny houby křečkoval pro sebe, viď?
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_06");	//A proto jsou ty houby pro mě tak důležité! Otázky...?
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices(DIA_Constantino_MushroomsRunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_08");   //Už ses mě ptal! Nebo jsi už zapomněl?!
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Tak já ti nějaké přinesu.
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Skvělé! Přines mi jich co nejvíc!
	Info_ClearChoices(DIA_Constantino_MushroomsRunning);
};

instance DIA_Constantino_Alchemy(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent = FALSE;
	description = "Nauč mě vařit lektvary!";
};

func int DIA_Constantino_Alchemy_Condition()
{
	if(Player_IsApprentice == APP_Constantino)
	{
		if(Constantino_TeachAlchemy == TRUE)
		{
			return FALSE;
		};

		return TRUE;
	};
};

func void DIA_Constantino_Alchemy_Info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Nauč mě alchymistickému umění!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Tak dobrá. Hezky od začátku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Každý lektvar je dělán z rostlin - a každé dosahují různých možností využití.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Tohle začínají být trochu složitější formule.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//K přípravě lektvaru u alchymistické kolony potřebuješ laboratorní lahvičku.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Musíš znát recept na jeho přípravu a také mít u sebe příslušné ingredience.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Můžu tě několik formulí naučit, jestli chceš.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Naučím tě lektvary, které obnoví tvou ztracenou výdrž ale také ty, které zvýší tvou sílu trvale.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Můžu tě to naučit všechno najednou.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_09");	//Než tě začnu učit, chci, abys pro mě něco udělal.
		AI_Output(other,self,"DIA_Constantino_Alchemy_10_10");	//Co přesně?
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_11");	//Budeš si pro sebe muset připravit jeden jednoduchý lektvar.
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_12");	//Jeho složení je poměrně jednoduché. Samotný lektvar má však velmi zajímavé účinky. Vezmi si tento recept.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other,"DIA_Constantino_Alchemy_10_14");	//Jakmile ho dovaříš, vrať se ke mě a začnu tě učit umění alchymie.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew,"Constantino mě naučí umění alchymie, ale nejdřív chce, abych sám vyzkoušel uvařit jeden lektvar. Dal mi recept s podrobným postupem.");
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_NewRecipes(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent = FALSE;
	description = "Rád bych se dozvěděl nějaké nové recepty na lektvary.";
};

func int DIA_Constantino_NewRecipes_Condition()
{
	if((Player_IsApprentice != APP_Constantino) && (Player_IsApprentice > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void DIA_Constantino_NewRecipes_Info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Rád bych se dozvěděl nějaké nové recepty na lektvary.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//Máš s alchymií nějaké předchozí zkušenosti?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Ano.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//A jsi stále naživu - to není špatná kvalifikace.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Myslím, že pár formulí ti mohu prozradit. Samozřejmě ale záleží na tom, co přesně chceš vědět.

	if((MIS_MyBrew == FALSE) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_05");	//Než tě začnu učit, chci, abys pro mě něco udělal.
		AI_Output(other,self,"DIA_Constantino_NewRecipes_10_06");	//Co přesně?
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_07");	//Budeš si pro sebe muset připravit jeden jednoduchý lektvar.
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_08");	//Jeho složení je poměrně jednoduché. Samotný lektvar má však velmi zajímavé účinky. Vezmi si tento recept.
		B_GiveInvItems(self,other,ItWr_ConstRecept,1);
		AI_Output(self,other,"DIA_Constantino_NewRecipes_10_10");	//Jakmile ho dovaříš, vrať se ke mě a začnu tě učit umění alchymie.
		MIS_MyBrew = LOG_Running;
		Log_CreateTopic(TOPIC_MyBrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyBrew,LOG_Running);
		B_LogEntry(TOPIC_MyBrew,"Constantino mě naučí umění alchymie, ale nejdřív chce, abych sám vyzkoušel uvařit jeden lektvar. Dal mi recept s podrobným postupem.");
	}
	else
	{
		Constantino_TeachAlchemy = TRUE;
	};
};

instance DIA_Constantino_TEACH(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent = TRUE;
	description = "O jaké recepty se se mnou můžeš podělit?";
};

func int DIA_Constantino_TEACH_Condition()
{
	if(Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Constantino_TEACH_Info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//O jaké recepty se se mnou můžeš podělit?

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE) && (PLAYER_TALENT_ALCHEMY[18] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Lituji, ale nic víc už tě naučit nemohu.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Několik jich znám - vyber si sám.
		Info_ClearChoices(DIA_Constantino_TEACH);
		Info_AddChoice(DIA_Constantino_TEACH,Dialog_Back,DIA_Constantino_Teach_BACK);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Constantino_TEACH_Health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Constantino_TEACH_Health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Constantino_TEACH_Health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Constantino_TEACH_PermHealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Constantino_TEACH_Mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Constantino_TEACH_Mana02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Elixír síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),DIA_Constantino_TEACH_PermSTR);
	};
	if(PLAYER_TALENT_ALCHEMY[17] == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Lektvar výdrže",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_STAMINA)),dia_constantino_teach_stamina);
	};
	if((PLAYER_TALENT_ALCHEMY[18] == FALSE) && (PLAYER_TALENT_ALCHEMY[17] == TRUE))
	{
		Info_AddChoice(DIA_Constantino_TEACH,b_buildlearnstringforalchemy("Elixír výdrže",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STAMINA)),dia_constantino_teach_perm_stamina);
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Pro esenci hojivé síly potřebuješ léčivé rostliny a luční pohanku.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//K přípravě extraktu hojivé síly si musíš opatřit léčivé byliny a luční pohanku.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//A dej si pozor, abys ten extrakt správně povařil.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Health03()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//K vytvoření elixíru hojivé síly je zapotřebí trochu zkušeností.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Musíš si sehnat léčivé kořeny a luční pohanku a velmi opatrně všechno ohřívat.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermHealth()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Elixír života! Vzácný to odvar! Ne že by jeho příprava byla tak složitá - vlastně ho lze namíchat docela snadno.
	};

	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana01()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Esence many je nejjednodušším z magických lektvarů.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Natrhej pět ohnivých kopřiv, luční pohanku a vše pomalu povař.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_speed()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Speed))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Speed_10_00");	//Příprava lektvaru rychlosti je velmi jednoduchá.
		AI_Output(self,other,"DIA_Constantino_TEACH_Speed_10_01");	//Potřebuješ akorát chňapavčí býlí a poté ji nechat lehce povařit.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_Mana02()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Jakmile dovedeš připravit esenci many, s trochou úsilí bys měl dokázat vyrobit i její extrakt.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Při přípravě tohoto elixíru stačí mít trošku citu a nechat ho jemně přejít varem. Jeho ingredience tvoří ohnivé kopřivy a luční pohanka.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void DIA_Constantino_TEACH_PermSTR()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Elixír síly! Výtečný to mok! K jeho namíchání však potřebuješ vzácný dračí kořen a ještě vzácnější královský šťovík.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//Při varu pak dávej pozor, aby bublinky nebyly příliš velké a nedočkal ses pak nemilého překvapení.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_STAMINA))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Stamina_10_00");	//Lektvar výdrže! Ten ti pomůže zregenerovat tvoji únavu a vrátit ti sílu.
		AI_Output(self,other,"DIA_Constantino_TEACH_Stamina_10_02");	//Postupně lektvar veď k varu až na potřebnou teplotu, a poté ho rychle zchlaď. A to je celé tajemství.
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};

func void dia_constantino_teach_perm_stamina()
{
	if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_STAMINA))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_00");	//Elixír výdrže - velmi užitečný lektvar! Příprava ovšem není tak jednoduchá!
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_02");	//Základní tajemství ve výrobě tohoto lektvaru je přesné načasování sejmutí vývaru z ohně.
		AI_Output(self,other,"DIA_Constantino_TEACH_Perm_Stamina_10_03");	//Prošvihneš to, a můžeš začít znovu!
	};
	Info_ClearChoices(DIA_Constantino_TEACH);
};


instance DIA_CONSTANTINO_RECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_receptfortyon_condition;
	information = dia_constantino_receptfortyon_info;
	permanent = FALSE;
	description = "Hledám recept jednoho lektvaru.";
};


func int dia_constantino_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_constantino_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_00");	//Hledám recept jednoho lektvaru.
	AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_03");	//Už jsi o něm někdy slyšel?
	if(Player_IsApprentice == APP_Constantino)
	{
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_04");	//A proč se můj učedník zabývá takovými věcmi?
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_06");	//Jako alchymista - začátečník mám velký zájem o různé zvláštní druhy elixírů. Samozřejmě, jen abych poznal jejich neobvyklé vlastnosti.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_07");	//Ha!... (nadšeně) Tvoje vášeň k poznání tajemství alchymie mě překvapuje...
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_08");	//Řekneš mi tedy o tomhle lektvaru?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_09");	//No... (zamyslí se) Ano, o tomto elixíru jsem už slyšel. Skutečně má řadu velmi neobvyklých alchymistických vlastností.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_10");	//Ztrátu vědomí - to umí jen tento. Má vlastnost, měnit v lidském těle své skupenství a poté se úplně vytratit z lidského těla.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_11");	//A také je třeba zmínit, že příprava tohoto lektvaru je velmi složitá, a zvládne ji jenom hodně zkušený alchymista.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_12");	//A k tomu všemu, k jeho výrobě je zapotřebí opravdu vzácné byliny.
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_13");	//A ty jeho recept znáš?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_14");	//To rozhodně ne!... říkal jsem, že jsem o tom elixíru pouze slyšel, neříkal jsem, že znám recept na jeho přípravu.
		AI_Output(other,self,"DIA_Constantino_ReceptForTyon_01_15");	//A kdo by mohl ten recept znát?
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_16");	//Zaslechl jsem, že by ten recept mohli mít mágové Ohně!
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_17");	//Nicméně, jak asi chápeš, jsou to jen klepy. A mágové se navíc o takový recept nehodlají dělit.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_20");	//Pokud by se ti ale přes všechny trápoty podařilo získat ten recept, byl bych potěšen. Rád bych se na něj aspoň jednou v životě podíval.
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_21");	//Ale mezi námi, tento rozhovor vůbec neproběhl! Doufám, že vís co tím myslím.
		KNOWABOUTRECEPTFORTYON = TRUE;
		CONSTANTINOWANTSRECEPTFORTYON = TRUE;
		B_LogEntry(TOPIC_RECEPTFORTYON,"Alchymista Constantino mi říkal, že recept na ten zvláštní lektvar vlastní mágové Ohně. Dal by všechno pro to, aby ho mohl aspoň jednou v životě spatřit.");
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_23");	//Nemám tušení, o čem to tady mluvíš!
		AI_Output(self,other,"DIA_Constantino_ReceptForTyon_01_24");	//Přestaň mě zatěžovat takovými hloupými otázkami, a raději běž dělat něco užitečnějšího!
	};
};


instance DIA_CONSTANTINO_GOTRECEPTFORTYON(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_gotreceptfortyon_condition;
	information = dia_constantino_gotreceptfortyon_info;
	permanent = FALSE;
	description = "Mám ten recept.";
};


func int dia_constantino_gotreceptfortyon_condition()
{
	if((Npc_HasItems(other,itwr_tyonrecept) >= 1) && (CONSTANTINOWANTSRECEPTFORTYON == TRUE))
	{
		return TRUE;
	};
};

func void dia_constantino_gotreceptfortyon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_01");	//Mám ten recept.
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_02");	//Opravdu?! Ukaž.
	B_GiveInvItems(other,self,itwr_tyonrecept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_03");	//Jak vzrušující! Ani ve snu by mě nenapadlo, že bych mohl získat.
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_07");	//Tady - vem si odměnu za tvoji snahu. Myslím, že to stačí!
	B_GiveInvItems(self,other,ItPl_Perm_Herb,2);
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_08");	//A co můj recept?
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_09");	//Promiň, ale bude lepší, když zůstane u mě. Stejně ještě nejsi dostatečně zručný na jeho přípravu.
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_10");	//Zvlášť, když už jsi dostal zaplaceno. Tak proč ho tak moc chceš? (nervózně)
	AI_Output(other,self,"DIA_Constantino_GotReceptForTyon_01_11");	//Dej mi můj recept!
	AI_Output(self,other,"DIA_Constantino_GotReceptForTyon_01_12");	//Na to zapomeň! Nebo snad chceš, abych řekl mágům Ohně, kde jsi k němu přišel?!
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEED(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneed_condition;
	information = dia_constantino_poisonneed_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_constantino_poisonneed_condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneed_info()
{
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_01");	//Hej! Počkej chvíli... (efektně) Ještě bych si rád o něčem promluvil.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_03");	//Podívej, vidím, že se dobře vyznáš v cestování na různá místa.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_04");	//A krom toho, není nadarmo si tím získat i pár mincí, nemám pravdu?!
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_05");	//Jistě! Zlato člověk nikdy neodmítne. (skrytě ironicky)
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_06");	//Já si myslím... (usmívá se) Tak potom bych ti mohl nabídnout zajímavou prácičku, co říkáš?
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_07");	//A také si tím u mě zajistíš respekt!
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_08");	//Tak už k věci! Co bys rád?
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_09");	//Hele, pro můj další experiment potřebuju jednu zvláštní přísadu.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_10");	//Je to opravdu unikátní ingredience, a proto je taky těžko k sehnání!
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_13");	//No... (potí se) Zní to trochu nezvykle, ale potřebuji, abys mi sehnal nějaký velmi prudký jed!
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_01_14");	//Chceš někoho otrávit?!
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_15");	//U Innose! To ne... (nervózně) To nepřipadá v úvahu!
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_16");	//Prostě. Dostal se mi do rukou recept, který tento typ jedu ke své výrobě vyžaduje.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_17");	//A já ani nemám ponětí, kde bych to měl hledat. Ale jsem si jistý, že ty už určitě budeš vědět.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_01_18");	//Tak co, podíváš se mi po tom?!
	Info_ClearChoices(dia_constantino_poisonneed);
	Info_AddChoice(dia_constantino_poisonneed,"Ne, to rozhodně nepůjde!",dia_constantino_poisonneed_no);
	Info_AddChoice(dia_constantino_poisonneed,"No, žádný problém.",dia_constantino_poisonneed_ok);
};

func void dia_constantino_poisonneed_ok()
{
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_Ok_01_01");	//No, žádný problém.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_Ok_01_02");	//To je skvělé! To jsem chtěl slyšet.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_Ok_01_03");	//Prostě mi ten jed sežeň, a hned uvidíš, jak se ti kapsa namastí zlatem!
	MIS_POISONNEED = LOG_Running;
	Log_CreateTopic(TOPIC_POISONNEED,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_Running);
	B_LogEntry(TOPIC_POISONNEED,"Alchymista Constantino mě požádal, abych mu sehnal nějaký velmi silný jed. Slíbil jsem mu, že se po něčem podívám.");
	Info_ClearChoices(dia_constantino_poisonneed);
};

func void dia_constantino_poisonneed_no()
{
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_No_01_01");	//Ne, to rozhodně nepůjde!
	AI_Output(other,self,"DIA_Constantino_PoisonNeed_No_01_02");	//Budeš se muset podívat po nějakém jiném bláznovi.
	AI_Output(self,other,"DIA_Constantino_PoisonNeed_No_01_03");	//Eh... (naštvaně) Dobrá tedy, jak myslíš!
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_POISONNEEDOK(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = dia_constantino_poisonneedok_condition;
	information = dia_constantino_poisonneedok_info;
	permanent = FALSE;
	description = "Mám ten jed, co jsi chtěl.";
};


func int dia_constantino_poisonneedok_condition()
{
	if((Npc_HasItems(hero,itpo_bloodflypoison) >= 1) && (MIS_POISONNEED == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_constantino_poisonneedok_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Constantino_PoisonNeedOk_01_01");	//Mám ten jed, co jsi chtěl.
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_02");	//Opravdu?!... (nadšeně) Ukaž, podívám se.
	AI_Output(other,self,"DIA_Constantino_PoisonNeedOk_01_03");	//Tady.
	B_GiveInvItems(other,self,itpo_bloodflypoison,1);
	Npc_RemoveInvItems(self,itpo_bloodflypoison,1);
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_04");	//Hmmm... (přemýšlí) No výborně! Myslím, že je čas dokončit to... (zamlouvá) no, ten experiment, že ano...
	AI_Output(self,other,"DIA_Constantino_PoisonNeedOk_01_06");	//Zajisté! Tady máš. Mělo by to být dost za takovou prácičku.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	MIS_POISONNEED = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_POISONNEED,LOG_SUCCESS);
	B_LogEntry(TOPIC_POISONNEED,"Přinesl jsem Constantinovi jeho jed, který žádal. Byl z toho celý nadšený!");
	AI_StopProcessInfos(self);
	KILLHAPPENS = Wld_GetDay();
};


instance DIA_CONSTANTINO_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_aboutkillignaz_condition;
	information = dia_constantino_aboutkillignaz_info;
	permanent = FALSE;
	description = "Víš něco o vraždě alchymisty Ignaze?";
};


func int dia_constantino_aboutkillignaz_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_constantino_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_00");	//Víš něco o vraždě alchymisty Ignaze?
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_01");	//Omlouvám se, ale bohužel nic nevím... A ani nemám představu kdo by to mohl udělat. Proč se vlastně ptáš?!
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_02");	//Já jen, že mi lord Andre sdělil, že toho ubohého starce někdo otrávil.
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_03");	//A všechno tohle mě vede jedním směrem...
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_04");	//Na co narážíš?!
	AI_Output(other,self,"DIA_Constantino_AboutKillIgnaz_01_05");	//No, nedávno jsi mě požádal, abych pro tebe sehnal nějaký velmi silný jed pro své experimenty.
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_07");	//Ale přisáhám u Innose... (nervózně) To bych nikdy neudělal!
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_08");	//My jsme byli celkem dobří přátelé a samotného mě to dost rozrušilo.
	AI_Output(self,other,"DIA_Constantino_AboutKillIgnaz_01_11");	//Nemám s tím nic společného!
	B_LogEntry(TOPIC_KILLIGNAZ,"Alchymista Constantino nic neví o vraždě. Ale něco tu smrdí. Před několika dny jsem pro něj sháněl silný jed, prý pro svoje experimenty. To je dost silný důkaz...");
	ASKKILLFIRST = TRUE;
};

instance DIA_CONSTANTINO_FOUNDBOTTLE(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_foundbottle_condition;
	information = dia_constantino_foundbottle_info;
	permanent = FALSE;
	description = "Hele podívej, co jsem našel.";
};

func int dia_constantino_foundbottle_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_constantino_foundbottle_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_00");	//Hele podívej, co jsem našel.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_01");	//Eee... (dělá jakoby nic) A co je to?!
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_02");	//Myslím, že víš. Řekl bych, že tato lahvička dříva patřila tobě hm?!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_03");	//Cože?!... (neklidně) To teda ne! To není moje!
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_04");	//Ale já bych řekl že ano. Tato lahvička patřila tobě, je od toho jedu a je otevřená, takže ji někdo použil!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_05");	//Ale... (nervózně) Opravdu si myslíš, že jsem otrávil Ignaze?!
	AI_Output(other,self,"DIA_Constantino_FoundBottle_01_06");	//Je jasné, že jsi to byl ty! A při první příležitosti informuji domobranu...
	AI_Output(self,other,"DIA_Constantino_FoundBottle_01_07");	//Ne! Prosím tě, nedělej to!... (panikaří) byl jsem donucen!
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Nahlásím tě lordu Andremu.",dia_constantino_foundbottle_prison);
	Info_AddChoice(dia_constantino_foundbottle,"A jak to můžeš dokázat?",dia_constantino_foundbottle_tellme);
};

func void dia_constantino_foundbottle_prison()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Prison_01_01");	//Nahlásím tě lordu Andremu.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Prison_01_02");	//No... (poraženě) Dělej, co musíš! Ale věz, že děláš velkou chybu.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Ha! Zdá se, že tím vrahem je Constantino. To on otrávil alchymistu Ignaze. Řekl bych, že je nutné ho nahlásit lordu Andremu.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_tellme()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_01");	//A jak to můžeš dokázat?
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_02");	//Je to prostě zajímavé, jak se ta věc mohla objevit zničeho nic u domu toho alchymisty.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_03");	//Věř mi! Nemám absolutně představu jak! (pot mu teče jak vodopády) Asi mi to musel někdo v noci ukrást.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_04");	//A pak to hodit před Ignazův dům, aby to na mě hodil!
	AI_Output(other,self,"DIA_Constantino_FoundBottle_TellMe_01_07");	//Zdá se, že tvé alibi nejsou moc přesvědčivé.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_TellMe_01_08");	//Ale já opravdu nic nevím! Nevím, kdo to mohl být a ani jak se tam ta lahvička dostala.
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Potom mi nedáváš na výběr.",dia_constantino_foundbottle_no);
	Info_AddChoice(dia_constantino_foundbottle,"Tak se zkus zamyslet líp!",dia_constantino_foundbottle_yes);
};

func void dia_constantino_foundbottle_no()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_No_01_01");	//Potom mi nedáváš na výběr. Je nezbytné tě předat domobraně!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_No_01_02");	//No... (poraženě) Dělej, co musíš! Ale věz, že děláš velkou chybu.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Ha! Zdá se, že tím vrahem je Constantino. To on otrávil alchymistu Ignaze. Řekl bych, že je nutné ho nahlásit lordu Andremu.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yes()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Yes_01_01");	//Tak zkus zamyslet! V sázce máš zbytek života!
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_02");	//Věř mi, zkoušel jsem to... (na pokraji sil) ale už mě nic nenapadá.
	AI_Output(other,self,"DIA_Constantino_FoundBottle_Yes_01_03");	//Hmmm... No, a nevšiml sis třeba během několika minulých dní nečeho zvláštního ve tvém okolí?
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_04");	//Ano! počkej... Vzpomínám se, všiml jsem si jedné zvláštní věci... (víc se zamyslí)
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_06");	//(přemýšlí) Je to pár dní, co ke mě přišel zvláštní cizinec.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_10");	//Zajímal se o mé vzácné lektvary... Samozřejmě, některé ode mě chtěl odkoupit.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_12");	//No... (zamyslí se) Chápeš, že takové druhy lektvarů si tady v laboratoři neskladuju.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_13");	//Je to příliš nebezpečné, protože některé z nich jsou velmi vzácné a drahé. A tento lektvar patřil k nim.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_Yes_01_14");	//Proto jsem šel do skladu. Ale když jsem se vrátil, už tady ten chlap nebyl...
	Info_ClearChoices(dia_constantino_foundbottle);
	Info_AddChoice(dia_constantino_foundbottle,"Nemyslím si, že to jako důkaz neviny postačí.",dia_constantino_foundbottle_nohelp);
	Info_AddChoice(dia_constantino_foundbottle,"No dobrá, věřím ti.",dia_constantino_foundbottle_yeshelp);
};

func void dia_constantino_foundbottle_nohelp()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_NoHelp_01_01");	//Nemyslím si, že to jako důkaz neviny postačí.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_NoHelp_01_02");	//No... (poraženě) Potom dělej, co musíš! Ale věz, že děláš velkou chybu.
	CONSTANTINOFUCKOFF = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Ha! Zdá se, že tím vrahem je Constantino. To on otrávil alchymistu Ignaze. Řekl bych, že je nutné ho nahlásit lordu Andremu.");
	AI_StopProcessInfos(self);
};

func void dia_constantino_foundbottle_yeshelp()
{
	AI_Output(other,self,"DIA_Constantino_FoundBottle_YesHelp_01_01");	//No dobrá, věřím ti.
	AI_Output(self,other,"DIA_Constantino_FoundBottle_YesHelp_01_02");	//U Innose!... (radostně) Díky. A doufám, že ho nakonec chytíš.
	HELPKILLIGNAZ = TRUE;
	Info_ClearChoices(dia_constantino_foundbottle);
	B_LogEntry(TOPIC_KILLIGNAZ,"Rozhodl jsem se, že pomůžu Constantinovi. Tento případ je těžce zapeklitý. Ale věřím Constantinovi, že to neudělal, ale měl bych zjistit, kdo byla ta tajemná osoba, co ho navštívila. Možná že si ji někdo z domobrany všimnul.");
};

instance DIA_CONSTANTINO_MakePoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoison_condition;
	information = dia_constantino_MakePoison_info;
	permanent = FALSE;
	description = "Víš, jak dělat jedy?";
};

func int dia_constantino_MakePoison_condition()
{
	if(HELPKILLIGNAZ == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoison_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoison_01_01");	//Víš, jak dělat jedy?
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_02");	//Hmm... (neochotně) Ano. Je to další součást mé práce hned po vaření lektvarů.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_03");	//Ale nikomu o tom neříkám a tobě radím to samé.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_04");	//Pokud se o tom dozví městská stráž, okamžitě zavře tento obchod!
	AI_Output(other,self,"DIA_Constantino_MakePoison_01_05");	//Chápu. Nebojíš se, že se někdy otrávíš?
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_06");	//Neboj se... (smích) Vždy když vařím jed, mám u sebe protijed.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_07");	//Dělám je také, protože bez nich se v tomto oboru neobejdeš.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_08");	//Kromě toho jsem se ze svých experimentů naučil extrahovat některé druhy jedů.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_09");	//Nyní mají pouze malé vedlejší účinky ve formě vyrážky na kůži nebo na tváři.
	AI_Output(self,other,"DIA_Constantino_MakePoison_01_10");	//Neexistuje jediný případ intoxikace.
};

instance DIA_CONSTANTINO_MakePoisonTeachMe(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMe_condition;
	information = dia_constantino_MakePoisonTeachMe_info;
	permanent = FALSE;
	description = "Nauč mě zvládat jedy.";
};

func int dia_constantino_MakePoisonTeachMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_Constantino_MakePoison) == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMe_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMe_01_01");	//Mohl bys mi ukázat jak zvládnout jedy?

	if(ConstForgiven == TRUE)
	{
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_02");	//Hmmm... (zamyšleně) Přeci jen jsi mi pomohl vyřešit problém s Ignazem.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_03");	//A byl bych nevděčná svině, kdybych ti za to nepoděkoval.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_04");	//Nicméně, mé znalosti budou vyžadovat, abys měl nějaké zkušenosti.
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_05");	//No... Malý obnos zlata neuškodí. Alespoň pokryji náklady na tvé učení.
		ConsTeachPoison = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMe_01_07");	//(náhle) Ne. Nechci ti to říct! Na to ani nemysli!
		AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMe_01_08");	//No klidně, jak myslíš.
	};
};

instance DIA_CONSTANTINO_MakePoisonTeachMeAgain(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 1;
	condition = dia_constantino_MakePoisonTeachMeAgain_condition;
	information = dia_constantino_MakePoisonTeachMeAgain_info;
	permanent = FALSE;
	description = "Můžeš mi ještě ukázat, jak zvládnout jedy?";
};

func int dia_constantino_MakePoisonTeachMeAgain_condition()
{
	if((Npc_KnowsInfo(other,DIA_Constantino_MakePoisonTeachMe) == TRUE) && (ConstForgiven == TRUE) && (ConsTeachPoison == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_MakePoisonTeachMeAgain_info()
{
	AI_Output(other,self,"DIA_Constantino_MakePoisonTeachMeAgain_01_01");	//Mohl bys mi ukázat jak zvládnout jedy?
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_02");	//Hmmm... (zamyšleně) Přeci jen jsi mi pomohl vyřešit problém s Ignazem.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_03");	//A byl bych nevděčná svině, kdybych ti za to nepoděkoval.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_04");	//Nicméně, mé znalosti budou vyžadovat, abys měl nějaké zkušenosti.
	AI_Output(self,other,"DIA_Constantino_MakePoisonTeachMeAgain_01_05");	//No... Malý obnos zlata neuškodí. Alespoň pokryji náklady na tvé učení.
	ConsTeachPoison = TRUE;
};

instance DIA_CONSTANTINO_TeachPoison(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 800;
	condition = dia_constantino_TeachPoison_condition;
	information = dia_constantino_TeachPoison_info;
	permanent = TRUE;
	description = "Nauč mě vařit protijedy.";
};

func int dia_constantino_TeachPoison_condition()
{
	if((ConsTeachPoison == TRUE) && ((AnPoisonKnow == FALSE) || (ResistPoisonKnow == FALSE)))
	{
		return TRUE;
	};
};

func void dia_constantino_TeachPoison_info()
{
	AI_Output(other,self,"DIA_Constantino_TeachPoison_01_01");	//Nauč mě vařit protijedy.
	AI_Output(self,other,"DIA_Constantino_TeachPoison_01_02");	//Co chceš vědět?
	Info_ClearChoices(DIA_Constantino_TeachPoison);
	Info_AddChoice(DIA_Constantino_TeachPoison,Dialog_Back,DIA_Constantino_TeachPoison_BACK);
	
	if(AnPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison,"Nauč mě výrobu protijedů (VB: 1, cena: 500 zlatých)",DIA_Constantino_TeachPoison_AnPoison);
	};

	if(ResistPoisonKnow == FALSE)
	{
		Info_AddChoice(DIA_Constantino_TeachPoison,"Nauč mě odolnosti vůči jedům (VB: 10, cena: 3000 zlatých)",DIA_Constantino_TeachPoison_Resist);
	};
};

func void DIA_Constantino_TeachPoison_BACK()
{
	Info_ClearChoices(DIA_Constantino_TeachPoison);
};

func void DIA_Constantino_TeachPoison_AnPoison()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_AnPoison_01_00");	//Nauč mě výrobu protijedů.

	kosten = 1;
	money = 500;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_01");	//Omlouvám se, ale na to ještě nemáš dost zkušeností!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_02");	//Je mi líto, ale bude to něco stát!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_03");	//Dobře, poslouchej pozorně.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_04");	//Budeš potřebovat láhev vody, síru a uhlí.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_05");	//Rozdrť síru a uhlí na prášek a přidej je do vroucí vody.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_AnPoison_01_06");	//Počkej pár minut, než to vychladne. V tom je celý trik!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Alchymie - 'Protijed'");
		AnPoisonKnow = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro PROTIJED: láhev vody, síra, sůl a uhlí.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
};

func void DIA_Constantino_TeachPoison_Resist()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Constantino_TeachPoison_Resist_01_00");	//Nauč mě odolnosti vůči jedům.

	kosten = 10;
	money = 3000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_01");	//Omlouvám se, ale na to ještě nemáš dost zkušeností!
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_02");	//Je mi líto, ale bude to něco stát!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_03");	//Jed je špatný. Zvlášť pokud se ti dostal do těla.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_04");	//Musíš se ujistit, že tvoje tělo jed co nejdříve rozloží.
		AI_Output(self,other,"DIA_Constantino_TeachPoison_Resist_01_05");	//Musíš být neustále v pohybu a hodně se potit. Pak ti jed neublíží.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		AI_Print("Naučeno: Odolnost proti jedu");
		ResistPoisonKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_CONSTANTINO_FUCKOFF(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 10;
	condition = dia_constantino_fuckoff_condition;
	information = dia_constantino_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_constantino_fuckoff_condition()
{
	if((CONSTANTINOFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_constantino_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

instance DIA_Constantino_LOKIPOTION(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_LOKIPOTION_Condition;
	information = DIA_Constantino_LOKIPOTION_Info;
	permanent = FALSE;
	description = "Potřebuju jednu velmi vzácnou rostlinu.";
};


func int DIA_Constantino_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_LOKIPOTION_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_00");	//Potřebuju jednu velmi vzácnou rostlinu.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_01");	//Jak se jmenuje?
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_02");	//Kaktus.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_03");	//Hmmm... (se zájmem) Ano, už jsem o něm slyšel, v této oblasti je opravdu velmi vzácný.
	AI_Output(other,self,"DIA_Constantino_LOKIPOTION_01_04");	//Víš, kde ho najdu?
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_05");	//Obávám se, že ho v okolí Khorinisu nenajdeš.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_06");	//Pokud vím, má tato rostlina ráda suché klima a spoustu slunečního svitu. Tady je pro něj příliš chladno.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_07");	//Být tebou, zeptal bych se místních obchodníků.
	AI_Output(self,other,"DIA_Constantino_LOKIPOTION_01_08");	//Pokud je tato rostlina na ostrově, oni o tom budou vědět.
	TradeCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Constantino mi poradil, abych si promluvil s obchodníky, protože oni by o rostlině mohli vědět.");
};

instance DIA_Constantino_MyBrew(C_Info)
{
	npc = VLK_417_Constantino;
	nr = 2;
	condition = DIA_Constantino_MyBrew_Condition;
	information = DIA_Constantino_MyBrew_Info;
	permanent = FALSE;
	description = "Zajímá mě tvůj lektvar.";
};

func int DIA_Constantino_MyBrew_Condition()
{
	if((MIS_MyBrew == LOG_Running) && (KnowFakeRecept == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Constantino_MyBrew_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_00");	//Zajímá mě tvůj lektvar.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_01");	//(se zájmem) Už jsi ho uvařil?
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_02");	//Ne! A pochybuji, že z toho vzejde něco dobrého.
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_03");	//Všechny složky receptu jsou naprosto neslučitelné.
	AI_Output(other,self,"DIA_Constantino_MyBrew_01_04");	//A některé se v alchymii vůbec nepoužívají!
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_05");	//(uctivě) Vážně jsem si nemyslel, že bys na tu záludnost přišel.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_06");	//Možná budeš opravdu dobrý alchymista.
	AI_Output(self,other,"DIA_Constantino_MyBrew_01_07");	//Dobře, ukážu ti pravou velikost tohoto umění.
	MIS_MyBrew = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyBrew,LOG_Success);
	B_LogEntry(TOPIC_MyBrew,"Řekl jsem Constantinovi všechno, co mi řekl Salandril. Byl překvapen mou předvídavostí a zdálo se, že mě dokonce respektuje. Ale hlavní věcí je, že teď mě naučí umění alchymie.");
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher,"Constantino mě naučí umění alchymie.");
};
