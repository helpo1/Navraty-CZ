/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int DIA_ADDON_VATRAS_LeeLetter_condition - upraveny podmínky dialogu

*/



var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int prayday_vatr;
var int prayday_vatr1;
var int prayday2_vatr;
var int praysum_vatr;

instance DIA_Addon_Vatras_KillerWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_KillerWarning_Condition;
	information = DIA_Addon_Vatras_KillerWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if((Kapitel >= 2) && (MadKillerCount >= 5) && (MadKillerCount <= 10) && (VatrasPissedOffForever == FALSE) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//Hodně zvěstí se o tobě v Khorinisu šíří.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//Říká se, že jsi zapleten do vražd nevinných lidí.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//Mohu tě jen varovat synu, doufaje že správně.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Nesestupuj z cesty rovnováhy a záchrany tohoto světa. Jinak se budeš muset připravit nést následky.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Jak mohu být nápomoci?
};


instance DIA_Addon_Vatras_LastWarning(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_LastWarning_Condition;
	information = DIA_Addon_Vatras_LastWarning_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if((Kapitel >= 5) && (MadKillerCount > 10) && (VatrasPissedOffForever == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//Je něco, co bys chtěl dodat?
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Vypadni...",DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning,"Je mi líto. Nevěděl jsem co dělám...",DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Vypadni...
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//Ve tvých slovech není žádný náznak lítosti.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//Nedal jsi mi jinou možnost.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//Je mi líto. Nevěděl jsem co dělám.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//Budu se za tebe modlit a doufat, že jednoho dne opět najdeš rovnováhu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Buď opatrný a opovaž se ještě někdy zaplést do vraždy.
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};


instance DIA_Addon_Vatras_PissedOff(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_PissedOff_Condition;
	information = DIA_Addon_Vatras_PissedOff_Info;
	important = TRUE;
};


func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if((MadKillerCount > VatrasMadKillerCount) && Npc_KnowsInfo(other,DIA_Addon_Vatras_LastWarning) && (Kapitel >= 5) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Tvá slova jsou stejně špatná jako tvé činy.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//Tvé bezcitné vraždění zjevně nikdy neskončí.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//Nedáváš mi jinou možnost.
	B_VatrasPissedOff();
};


instance DIA_Vatras_EXIT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 999;
	condition = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (Vatras_LaresExit == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Počkej!
		if(Vatras_GehZuLares == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//Pokud se setkáš s Laresem...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//Je tu jedna malá věc, o kterou bych tě chtěl požádat.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Běž do přístavu. Najdeš tam chlapíka jménem Lares.
			Vatras_GehZuLares = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Doruč mu tento ornament a pověz mu, aby ho odnesl zpět. Bude vědět, co udělat dál.
		CreateInvItems(self,ItMi_Ornament_Addon_Vatras,1);
		B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
		Vatras_LaresExit = TRUE;
	};
	AI_StopProcessInfos(self);

	if(Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin,"VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger,"VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin,"VATRASAWAY");
		if(MIS_NOVICECANJOIN == FALSE)
		{
			B_StartOtherRoutine(VLK_421_Valentino,"VATRASAWAY");
		};
		Vatras_SchickeLeuteWeg = FALSE;
	};
};

instance DIA_Vatras_PICKPOCKET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 900;
	condition = DIA_Vatras_PICKPOCKET_Condition;
	information = DIA_Vatras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Vatras_PICKPOCKET_Condition()
{
	return C_Beklauen(91,250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,Dialog_Back,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};


instance DIA_Vatras_GREET(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_GREET_Condition;
	information = DIA_Vatras_GREET_Info;
	important = TRUE;
};


func int DIA_Vatras_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos tě provázej.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Jsem Vatras, služebník Adanův, strážce božské i pozemské rovnováhy.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Co pro tebe mohu udělat?
};


instance DIA_Addon_Vatras_Cavalorn(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Cavalorn_Condition;
	information = DIA_Addon_Vatras_Cavalorn_Info;
	description = "Mám pro tebe dopis.";
};


func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if(((Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon_Sealed) >= 1) && (MIS_Addon_Cavalorn_Letter2Vatras == LOG_Running)) || (Npc_HasItems(other,ItWr_SaturasFirstMessage_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//Mám pro tebe dopis.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//Pro mě?
	if(SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other,self,ItWr_SaturasFirstMessage_Addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Jo, ale... byl otevřen. Doufám že nepadl do nesprávných rukou.
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Vskutku. To je opravdu důležitá zpráva.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//Divím se, že se ti ta zpráva dostala vůbec do rukou.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Sebral jsem to banditům.",DIA_Addon_Vatras_Cavalorn_Bandit);
	if(MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn,"Od lovce Cavalorna.",DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};
	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//Sebral jsem to banditům...
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(znepokojeně) U Adana! To není dobré. To vůbec není dobré.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//Pokud je tvé vyprávění pravdivé, pak máme obrovský problém.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//Budu se tím zabývat hned, jak to bude možné.
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//Dal mi ji Cavalorn.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(překvapeně) Cavalorn? Kde je?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//Řekl mi, abych ti vyřídil, že nemohl dopis doručit. Nyní je na cestě k místu obvyklého setkání. Ať už je to cokoliv.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//Vidím, že sis získal jeho důvěru. Měl bych ti také věřit synu.
	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};


var int Vatras_Why;

instance DIA_Addon_Vatras_CavalornSentMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_CavalornSentMe_Condition;
	information = DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent = FALSE;
	description = "Cavalorn mě za tebou poslal!";
};


func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring) && (Vatras_Why == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn mě za tebou poslal!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//A co říkal?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//Zmínil se, že máš kolem sebe několik schopných lidí, co ti pomáhají. Prý bych se mohl taky přidat.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(úsměv) Tak... chtěl by ses k nám přidat synu?
};

instance DIA_Addon_Vatras_TellMe(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_TellMe_Condition;
	information = DIA_Addon_Vatras_TellMe_Info;
	permanent = TRUE;
	description = "Řekni mi o 'Kruhu Vody' víc.";
};

func int DIA_Addon_Vatras_TellMe_Condition()
{
	if((SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Pověz mi něco o 'Kruhu Vody'.

	if(!Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//A proč bych to dělal?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Nemusíš vědět VŠECHNO, dokud nejsi jedním z nás.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//Řeknu ti vše, co mohu.
		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,Dialog_Back,DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Tak co máte nyní v plánu?",DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kde jsou ostatní mágové Vody?",DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"Kdo jsou členové 'Kruhu Vody'?",DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//Tak co máte nyní v plánu?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//Stojíme mezi řádem Innose a chaosem Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//Pokud by jedna strana převažovala, mělo by to za následek buď ztrátu svobody nebo příchod smrtnesoucího chaosu.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//A pokoušíme se zajistit rovnováhu. Je to jediná cesta pro život na tomto světě.
	if(MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe,"A to znamená?",DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//Mohl bys být trochu víc konkrétní?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//Po té, co bariéra padla to tu je velmi nebezpečné.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//Jedna z největších hrozeb jsou zjevně banditi.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Je skoro nemožné cestovat po ostrově neozbrojen...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... ve městě je dokonce někdo, kdo bandity podporuje!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//Zjistili jsme, že banditi nakupují zbraně od jednoho z místních obchodníků.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//Teď se snažíme ze všech sil, abychom tomu zabránili.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//Pokud se o tom chceš dozvědět víc, tak mi řekni.
	MIS_Vatras_FindTheBanditTrader = LOG_Running;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic(TOPIC_Addon_Bandittrader,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Bandittrader,LOG_Running);
	B_LogEntry(TOPIC_Addon_Bandittrader,"V Khorinisu je dodavatel zbraní pro bandity. Vatras mě pověřil vyšetřováním.");
	B_LogEntry_Quiet(TOPIC_Addon_Bandittrader,"Martin, proviantmistr paladinů o dodavateli zbraní něco ví. Najdu ho ve skladu paladinů v přístavu.");
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater,"'Kruh Vody' se zabývá problémem s bandity v okolí města Khorinis.");
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Kde jsou ostatní mágové Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//Na severovýchodě zkoumají ruiny prastarého národa.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//Domníváme se, že v ruinách je vchod na doposud neobjevenou část ostrova.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Mágové Vody zkoumají starodávnou kulturu někde na severu Khorinisu. Snad tam existuje cesta do neznámé části ostrova?");
	Info_AddChoice(DIA_Addon_Vatras_TellMe,"Řekni mi víc o té neprozkoumané části.",DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Řekni mi víc o té neprozkoumané části.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//Mohu napsat dopis a poslat tě s ním za Saturasem, máš-li zajem o připojení se k výpravě.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//Samozřejmě, že se na tom můžeš podílet jen jako jeden z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Jistě.
	B_LogEntry(TOPIC_Addon_KDW,"Dříve než se mohu připojit k mágské expedici, musím se podle Vatrase stát členem 'Kruhu Vody'.");
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Kdo jsou členové 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//To se dozvíš, až budeš jedním z nás.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//Jsem si jistý, že se s někým z nás setkáš.
};


instance DIA_Addon_Vatras_WannaBeRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_WannaBeRanger_Condition;
	information = DIA_Addon_Vatras_WannaBeRanger_Info;
	description = "Chci se přidat ke 'Kruhu Vody'!";
};


func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if((SC_KnowsRanger == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//Chci se přidat ke 'Kruhu Vody'!
	if(Npc_KnowsInfo(other,DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//Ano? Dobře, již jsi splnil první požadavek.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//O čem to mluvíš?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//Někdo z nás ti věří. Jinak bys o nás vůbec nevěděl.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//Ale 'já' o tobě nic nevím...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Co bys rád věděl?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//No, mohl bys mi prozradit, odkud přicházíš a proč jsi vkročil do města.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//Nesu důležitou zprávu veliteli paladinů.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Co je to za zprávu?
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Objevili se tu draci!",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou strašné věci...",DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Zatímco tu spolu hovoříme, sbírá se proti nám obrovská armáda, kterou vedou draci a která si chce podmanit celou zemi.
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Pokud je to skutečně pravda, pak by to mohlo narušit rovnováhu celé země. Kdo ti to řekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(přemýšlivě) Draci? Myslíš ty tvory, o kterých se vyprávějí legendy? Jak jsi na to přišel?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Zaslechl jsem to v hospodě...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Xardas mi to řekl!",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Brzy se stanou hrozné věci...
	if(Vatras_First == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//Aha. A kdo ti to řekl?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Hrozné věci, hmmm... a jak to víš?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Zaslechl jsem to v hospodě...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Xardas mi to řekl!",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Pověděl mi to mág Xardas a také mi nakázal, abych varoval paladiny.
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Vím, že tento muž je moudrý a mocný mistr magických věd. A odkud přicházíš ty?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Nekromant... takže žije... (přemýšlivě) a poslal tě sem? Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem jen dobrodruh z jihu...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem trestanec z kolonie...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//No, někde jsem něco zaslechl...
	if(Vatras_Second == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(otráveně) Pamatuješ si alespoň, odkud přicházíš?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. A právě proto jsi podnikl tuhle cestu. Kdo doopravdy jsi?
	};
	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem jen dobrodruh z jihu...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Jsem trestanec z kolonie...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Dobře, tak si to shrňme:
	if(Vatras_Third == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Jsi bývalý trestanec...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Jsi dobrodruhem z dalekého jihu...
	};
	if(Vatras_Second == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... kterého sem poslal nekromant Xardas...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... který se někde doslechl...
	};
	if(Vatras_First == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... že naši zemi napadnou draci.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... že se v brzké době stanou hrozné věci.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//A tak jsi to přišel ohlásit paladinům...
	if((Vatras_First == TRUE) && (Vatras_Second == TRUE) && (Vatras_Third == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//To zní sice fantasticky, ale nezdá se mi, že bys mi lhal.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Proto musím uznat, že tvé pohnutky jsou ušlechtilé.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//Máš šanci připojit se ke 'Kruhu Vody'.
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Myslím, že jsi mi neřekl úplně všechno.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Jestli se bojíš, že bych mohl tvá slova někomu vyzradit, pak neměj strach.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Přísahal jsem, že všechna tajemství, která mi někdo svěří, si ponechám pro sebe.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//A co zdejší lidé?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Ti rozumí pouze polovině toho, co jim KÁŽU, takže neměj obavy.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Začněme tedy znovu od začátku. Co je to za zprávu?
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Draci se objevili...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger,"Brzy se stanou hrozné věci.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Jsem bývalý vězeň z trestanecké kolonie v Khorinisu...
	Vatras_Third = TRUE;
	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Jsem dobrodruhem z dalekého jihu...
	Vatras_Third = FALSE;
	B_Vatras_INFLUENCE_REPEAT();
};


instance DIA_Addon_Vatras_HowToJoin(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_HowToJoin_Condition;
	information = DIA_Addon_Vatras_HowToJoin_Info;
	description = "Co musím udělat k přijetí?";
};


func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//Co musím udělat k přijetí?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Musíš si uvědomit, že vstupem mezi nás na sebe bereš velkou zodpovědnost.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//Nepřijímám kde koho, jen protože si o to řekne.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//Pokud chceš být jedním z nás, synu, chovej se tak, jako kdybys už byl jedním z nás.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//Tím myslíš...
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Každý mladý muž musí splnit hlavní úkol, než se může přidat.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Pouze pak mohu uvažovat o tvém připojení k nám v našem úkolu udržování rovnováhy sil na tomto ostrově.
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Dobře, jak tě můžu přesvědčit?",DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Osvobodil jsem mnoho lidí! Bariéra byla zničena.",DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin,"Porazil jsem Spáče. To by se dalo považovat jako hlavní zkouška?",DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//Porazil jsem Spáče. To by se dalo považovat jako hlavní zkouška?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//Slyším poslední dobou mnoho povídaček.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Včetně té o monstru zvaném Spáč a jeho odstraněním z tohoto světa.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//Neslyšel jsem o tom, že jsi za to zodpovědný jen ty - ale přesto tvé oči říkají, že věříš v to, co říkáš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//Poněkud mě to popuzuje, ale nejsem si jistý, jestli mě mé smysly nezrazují.
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//Osvobodil jsem mnoho lidí! Bariéra byla zničena.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Pokud za tím OPRAVDU stojíš ty...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//Lidém, kterým jsi dal svobodu nejsou jen mágové Vody či nevinní občané.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//Zločinci z celé země jsou teď rozlezlí po celém ostrově a ohrožují občany tohoto města.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//Také už kontrolují některé části ostrova blízko města. Je téměř nemožné opustit Khorinis bez nebezpečí.
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//Dobře, jak tě můžu přesvědčit?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Něco podivného se tyto dny děje v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//Počet zmizelých lidí se zvyšuje každým dnem.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//Pokud zjistíš, co se s nimi stalo, přijmeme tě rádi do 'Kruhu Vody'.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,LogText_Addon_KDWRight);
	B_LogEntry_Quiet(TOPIC_Addon_RingOfWater,"Vatras mě nepřijme dokud ta záležitost s 'Kruhem Vody' a mizejícími lidmi nebude vyřešena.");

	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_Running;
	SC_HearedAboutMissingPeople = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//Ale...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Ano?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... měl by sis nejdříve promluvit s paladiny a říci jim o zprávě, kterou jim neseš.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Myslím, že to je neobyčejně důležité!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Promluv si s lordem Hagenem.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Vatras chce, abych paladinům nejprve předal zprávu o dracích v Hornickém údolí.");
	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};


instance DIA_Addon_Vatras_GuildBypass(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Condition;
	information = DIA_Addon_Vatras_GuildBypass_Info;
	description = "Jenže já se k lordu Hagenovi nedostanu!";
};


func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_HowToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//Ale oni mě nepustí!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Pustí. Pokud jsi členem vlivné gildy.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//Kruh má pár užitečných kontaktů.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//Pokusíme se zajistit, abys mohl doručit zprávu lordu Hagenovi co nejrychleji to bude možné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//Měl by ses zeptat přítele Larese. Mohl by ti pomoci.
	B_LogEntry(TOPIC_Addon_RingOfWater,"Ke vstupu k lordu Hagenovi musím být členem nějaké mocné khoriniské gildy.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"A ke které gildě?",DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//Udělám to.
	Vatras_GehZuLares = TRUE;
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//Ke které gildě bych se měl přidat?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//Jsou zde pouze tři gildy, které jsou dostatečně vlivné a silné.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//Domobrana, mágové Ohně nebo žoldáci na Onarově farmě.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_0A");	//Přirozeně je tu hodně jiných gild, ale tyto tři jsou nejsilnější.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//Je to tvá volba.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Myslím, že Lares ti může pomoci s tímto obtížným rozhodováním. Navrhuju, aby sis s ním promluvil.
	VatrasTellOther = TRUE;
	B_LogEntry(TOPIC_Addon_RingOfWater,"Jsou zde tři mocné gildy ke kterým se můžeš přidat: mágové Ohně, domobrana nebo žoldáci na velkostatkářově dvoře. Také jsou tu další gildy, ale nejsou tak silné jako ty tři.");
	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass,"Udělám to.",DIA_Addon_Vatras_GuildBypass_BACK);
};

instance DIA_Addon_Vatras_GuildBypass_Other(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_GuildBypass_Other_condition;
	information = DIA_Addon_Vatras_GuildBypass_Other_info;
	permanent = FALSE;
	description = "Jaké jsou další vlivné gildy?";
};

func int DIA_Addon_Vatras_GuildBypass_Other_condition()
{
	if((VatrasTellOther == TRUE) && (TELLABOUTOTHERGUILD == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Other_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_Other_15_00");	//Jaké jsou další vlivné gildy?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_01");	//No, první jsme my - mágové Vody. Není nás mnoho, ale náš řád má velký vliv na Khorinisu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_02");	//Dále jsem slyšel, že se na ostrově usadilo Bratrstvo Spáče.
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_Other_15_03");	//A dál?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_04");	//Také jsou tu následovníci Beliara.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_05");	//Na to by ses měl zeptat Xardase.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_Other_15_06");	//Ten by o tom mohl něco vědět.
	TELLABOUTOTHERGUILD = TRUE;
};

instance DIA_ADDON_VATRAS_GUILDBYPASSKDW(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypasskdw_condition;
	information = dia_addon_vatras_guildbypasskdw_info;
	description = "Můžu se přidat k mágům Vody?";
};

func int dia_addon_vatras_guildbypasskdw_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_GuildBypass) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypasskdw_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypassKDW_15_00");	//Můžu se přidat k mágům Vody?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_01");	//Bojím se, že tady na ostrově bychom ti nemohli poskytnout potřebný trénink.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_02");	//Avšak za nějakých zvláštních okolností bys k nám mohl.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_03");	//Ale prvně musíš prokázat odvahu a udělat něco, pro Adana!
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_04");	//A kromě toho bys měl udržovat rovnováhu mezi božstvy.
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_05");	//Jenom tehdy se můžeš vydat naší cestou.
		MIS_BECOMEKDW = LOG_Running;
		VATRASSAYABOUTKDW = TRUE;
		Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
		B_LogEntry(TOPIC_BECOMEKDW,"Zeptal jsem se na službu Adanovi a Vatras řekl, že je možné se vydat cestou vody.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_GuildBypassKDW_15_06");	//Jestli se rozhodneš, nemůžeš to změnit.
	};
};

instance DIA_ADDON_VATRAS_HRAM(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HRAM_condition;
	information = DIA_ADDON_VATRAS_HRAM_info;
	permanent = FALSE;
	description = "A kde mají mágové Vody svůj chrám?";
};

func int DIA_ADDON_VATRAS_HRAM_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HRAM_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_ADDON_VATRAS_HRAM_01_00");	//A kde mají mágové Vody svůj chrám?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_01");	//Naneštěstí nemáme žádný.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_02");	//Avšak v dávných časech bylo postaveno mnoho velkolepých svatyň a chrámů! 
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_03");	//Pozůstatky těchto staveb je stále možné vidět ve světe.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HRAM_01_04");	//A na tomhle ostrově?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_05");	//Podle toho co víme tu kdysi sídlila vyspělá civilizace, která uctívala Adana.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HRAM_01_06");	//Ale než se sem dostali osadníci z Myrtany, tak tu zbyly jenom malé části budov na severo-východě ostrova.
};

instance DIA_ADDON_VATRAS_HOWBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_HOWBE_condition;
	information = DIA_ADDON_VATRAS_HOWBE_info;
	permanent = FALSE;
	description = "A jak jsem si zasloužil tuhle poctu?";
};

func int DIA_ADDON_VATRAS_HOWBE_condition()
{
	if((MIS_BECOMEKDW == LOG_Running) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_HOWBE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_00");	//A jak jsem si zasloužil tuhle poctu?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_01");	//Jěstli chceš mou radu, tak by bylo moudré zkusit si o tom pohovořit se Saturasem.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_02");	//Se Saturasem? Tím Saturasem, který vedl kruh Vody v Hornickém údolí?
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_03");	//On je... Teď je s ostatními mágy Vody ve vykopávkách.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_04");	//Pokus se získat si jeho důvěru a možná z tebe udělá novice.
	AI_Output(self,other,"DIA_ADDON_VATRAS_HOWBE_01_05");	//Pak budeš mít šanci se vyjádřit či se k nám chceš přidat.
	AI_Output(other,self,"DIA_ADDON_VATRAS_HOWBE_01_06");	//Dobře, chápu.
	B_LogEntry(TOPIC_BECOMEKDW,"Pokud se chci přidat k mágúm Vody, měl bych si pohovořit se Saturasem... Nemyslím si ale že bude zrovna šťastný že mě vidí potom co jsem udělal s jejich rudou v Novém táboře.");
};

instance DIA_ADDON_VATRAS_WATERLINE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_WATERLINE_condition;
	information = DIA_ADDON_VATRAS_WATERLINE_info;
	permanent = FALSE;
	description = "Jak ti mohu pomoci?";
};

func int DIA_ADDON_VATRAS_WATERLINE_condition()
{
	if(MIS_BECOMEKDW != FALSE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_WATERLINE_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_WATERLINE_01_00");	//Jak ti mohu pomoci?
	AI_Output(self,other,"DIA_ADDON_VATRAS_WATERLINE_01_01");	//Hmm... Měl bych pár věcí, které nesnesou odklad.
	AI_Output(self,other,"DIA_ADDON_VATRAS_WATERLINE_01_02");	//Naneštěstí nemohu odejít na dlouhou dobu z města a proto by se mi hodil pomocník jako jsi ty.
	Water_Line_Start = TRUE;
};

instance DIA_ADDON_VATRAS_LobartMeal(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_info;
	permanent = FALSE;
	description = "Co bych měl udělat?";
};

func int DIA_ADDON_VATRAS_LobartMeal_condition()
{
	if(Water_Line_Start == TRUE)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_01_00");	//Co bych měl udělat?
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_01");	//Půjdeš na Lobartovu farmu vyzdvihnout nějaké jídlo.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_02");	//Já ho potom rozdám chudým a potřebným.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_03");	//Tady máš 300 zlatých. Dej je Lobartovi za to jídlo.
	B_GiveInvItems(self,other,ItMi_VatrasPurse,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_01_04");	//Ani si je nezkoušej nechat pro sebe, jinak ti dále nebudu pomáhat.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_01_05");	//Jasně.
	MIS_LobartMeal = LOG_Running;
	Log_CreateTopic(TOPIC_LobartMeal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Running);
	B_LogEntry(TOPIC_LobartMeal,"Vatras mě požádal abych se zastavil na Lobratově farmě a vyzdvihl odtamtud jídlo pro chudé.");	
};

instance DIA_ADDON_VATRAS_LobartMeal_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LobartMeal_Done_condition;
	information = DIA_ADDON_VATRAS_LobartMeal_Done_info;
	permanent = FALSE;
	description = "Vyzvedl jsem to jídlo!";
};

func int DIA_ADDON_VATRAS_LobartMeal_Done_condition()
{
	if((MIS_LobartMeal == LOG_Running) && (Npc_HasItems(other,ItMi_VatrasPacket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LobartMeal_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_Done_01_00");	//Vyzvedl jsem to jídlo!
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_01");	//Dobře synu... Dej ho sem.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LobartMeal_Done_01_02");	//Tady.
	B_GiveInvItems(other,self,ItMi_VatrasPacket,1);
	Npc_RemoveInvItems(self,ItMi_VatrasPacket,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_03");	//Děkuji ti. Teď už lidé nemusejí hladovět.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_04");	//Za tuhle pomoc si zaslužíš malou odměnu.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LobartMeal_Done_01_05");	//Tady, vem si tyhle léčivé lektvary, budou se ti hodit.
	B_GiveInvItems(self,other,ItPo_Health_01,3);
	MIS_LobartMeal = LOG_Success;
	Log_SetTopicStatus(TOPIC_LobartMeal,LOG_Success);
	B_LogEntry(TOPIC_LobartMeal,"Přinesl jsem Vatrasovi jídlo od Lobarta.");	
};

instance DIA_ADDON_VATRAS_PureElixir(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_condition;
	information = DIA_ADDON_VATRAS_PureElixir_info;
	permanent = FALSE;
	description = "Ještě něco?";
};

func int DIA_ADDON_VATRAS_PureElixir_condition()
{
	if(MIS_LobartMeal == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_01_00");	//Ještě něco?
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_01");	//Dobře že se ptáš. Právě mi došly elixíry čisté magické moci.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_02");	//Je nezbytné abys šel za alchemistou Salandrilem a objednáš mi nové.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_03");	//Vem si těchto 200 zlatých jako platbu předem za jeho práci.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_01_04");	//Zbytek dostane když mi udelá mé elixíry.
	MIS_VatrasPotion = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Running);
	B_LogEntry(TOPIC_VatrasPotion,"Mám Vatrasovi objednat elixíry čisté magické moci od Salandrila.");	
};

instance DIA_ADDON_VATRAS_PureElixir_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_PureElixir_Done_condition;
	information = DIA_ADDON_VATRAS_PureElixir_Done_info;
	permanent = FALSE;
	description = "Vybavil jsem tvoji objednávku.";
};

func int DIA_ADDON_VATRAS_PureElixir_Done_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (SalandrilPureElixir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_01_00");	//Vybavil jsem tvoji objednávku.
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_01_01");	//Salandril říkal, že ti tento týden pošle tucet nových elixírů.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_02");	//Výborně.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_01_03");	//Ještě něco?
	MIS_VatrasPotion = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasPotion,LOG_Success);
	B_LogEntry(TOPIC_VatrasPotion,"Objednal jsem Vatrasovi elixíry, vypadal potěšeně!");	
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
	Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Ne, nic dalšího.",DIA_ADDON_VATRAS_PureElixir_Done_No);

	if(Npc_HasItems(other,ItPo_Mana_Addon_04) >= 2)
	{
		Info_AddChoice(DIA_ADDON_VATRAS_PureElixir_Done,"Skoro bych zapomněl...",DIA_ADDON_VATRAS_PureElixir_Done_Yes);
	};
};

func void DIA_ADDON_VATRAS_PureElixir_Done_No()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_01");	//Ne, nic dalšího.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_No_01_02");	//Hmmm... Ok.
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

func void DIA_ADDON_VATRAS_PureElixir_Done_Yes()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_01");	//Och, skoro bych zapomněl, tady máš dva elixíry předem, kdyby ti náhodou došly.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_03");	//Jsem rád, že Salandril prokázal takové obavy pro mé potřeby.
	AI_Output(self,other,"DIA_ADDON_VATRAS_PureElixir_Done_Yes_01_04");	//Ale klidně si je nechej synu, jako odměnu za tvou pomoc.
	VatrasPotionTruth = TRUE;
	Info_ClearChoices(DIA_ADDON_VATRAS_PureElixir_Done);
};

instance DIA_ADDON_VATRAS_ShadowBeast(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_info;
	permanent = FALSE;
	description = "Na co potřebuješ tolik elixírú many?";
};

func int DIA_ADDON_VATRAS_ShadowBeast_condition()
{
	if(MIS_VatrasPotion == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_00");	//Na co vlastně potřebuješ tolik elixírú many?

	if(VatrasPotionTruth == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_01");	//Víš, že každý den pomáhám raněným a chorým lidem.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_02");	//Tak to si vyžaduje dost magické energie.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_03");	//Někdy tak moc, že se musím uchýlit k používání léčivých lektvarů.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_04");	//Ale ty nedokážou vždy pomoci.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_05");	//Například včera zamnou přišel jeden muž...
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_06");	//Nejaké prokleté zvíře ho zmrzačilo tak moc, že ledva stál na nohou.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_07");	//Musel jsem použít magii abych zachránil jeho život.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_08");	//Po takových případech se cítím úplně zničený.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_09");	//A přesně tehdy přijdou vhod mana elixíry.
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_10");	//Aha. A jaký druh zvířete ho tak moc zmrzačilo?
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_12");	//Podle jeho slov to byla obrovská stínová šelma! Vypadá to, že ho napadla někde poblíž majáku.
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_13");	//Bylo by dobré, kdyby se o to zvíře někdo postaral dříve než napadne někoho dalšího.
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_14");	//Možná je ve městě nejaký lovec stínových šelem?
		MIS_VatrasBeast = LOG_Running;
		Log_CreateTopic(TOPIC_VatrasBeast,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Running);
		B_LogEntry(TOPIC_VatrasBeast,"Vatras mi řekl že při majáku vyčíní obrovská stínová šelma. Myslí si, že by se o to zvíře měl někdo postarat dříve než napadne někoho dalšího. Neřekl, že bych to měl udělat já! I když se to snažil naznačit...");	
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_01_15");	//To tě nemusí trápit synu...
		AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_01_16");	//Hmmm... ok.
	};
};

instance DIA_ADDON_VATRAS_ShadowBeast_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_ShadowBeast_Done_condition;
	information = DIA_ADDON_VATRAS_ShadowBeast_Done_info;
	permanent = FALSE;
	description = "Stínová šelma je mrtvá.";
};

func int DIA_ADDON_VATRAS_ShadowBeast_Done_condition()
{
	if((MIS_VatrasBeast == LOG_Running) && (Npc_IsDead(Shadowbeast_Vatras) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_ShadowBeast_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_00");	//Stínová šelma je mrtvá.
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_01");	//Udělal jsi správnou věc synu... I když já tě o to nežádal!
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_02");	//A proto zasluhuješ speciální odměnu.
	AI_Output(self,other,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_03");	//Tady, vezmi si tenhle svitek.
	B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	AI_Output(other,self,"DIA_ADDON_VATRAS_ShadowBeast_Done_01_04");	//Díky.
	MIS_VatrasBeast = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasBeast,LOG_Success);
	B_LogEntry(TOPIC_VatrasBeast,"Vatras byl potěšen, že sem se zbavil té stínové šelmy a náležitě mě odměnil.");	
};

instance DIA_ADDON_VATRAS_MagicBook(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_condition;
	information = DIA_ADDON_VATRAS_MagicBook_info;
	permanent = FALSE;
	description = "Máš pro mě něco dalšího?";
};

func int DIA_ADDON_VATRAS_MagicBook_condition()
{
	if((MIS_VatrasPotion == LOG_Success) && (Npc_IsDead(VLK_447_Cassia) == FALSE) && (Npc_IsDead(VLK_445_Ramirez) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_00");	//Máš pro mě něco dalšího?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_01");	//Hmmm... Nejsem si jistý, či ti mohu s tímhle důvěrovat.
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_02");	//O co se jedná?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_03");	//Nooo...(šeptá) Nedávno jsem byl okraden!
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_04");	//Vůbec mě netrápí že ukradli všechno zlato co dokázali najít v domě.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_05");	//Ale oni sebou sebrali i můj deník, kde jsem měl zapsané jak vytvářet runy.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_06");	//Ten deník byl pro mě neocenitelný.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_08");	//Požádal jsem o pomoc lorda Andreho, ale jeho domobrana nebyla velmi nápomocná...
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_01_09");	//Když to nedokázali oni, mohl bych to zkusit já?
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_01_10");	//Můžeš to zkusit synu, ale vypadá to, že svůj deník už nikdy neuvidím.
	MIS_VatrasMagicBook = LOG_Running;
	Log_CreateTopic(TOPIC_VatrasMagicBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Running);
	B_LogEntry(TOPIC_VatrasMagicBook,"Vatrase nedávno okradli. Myslím, že bych se na to mohl podívat!");	
};

instance DIA_ADDON_VATRAS_MagicBook_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Done_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Done_info;
	permanent = FALSE;
	description = "Našel jsem tvůj denník.";
};

func int DIA_ADDON_VATRAS_MagicBook_Done_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (Npc_HasItems(other,ItWr_VatrasDiary) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_00");	//Našel jsem tvůj deník.
	B_GiveInvItems(other,self,ItWr_VatrasDiary,1);
	Npc_RemoveInvItems(self,ItWr_VatrasDiary,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Done_01_01");	//Díky synu... Doufám, že jsem ti nezpůsobil žádné potíže.
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_02");	//Ne, všechno v pořádku.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Done_01_03");	//Tak tady máš nejaké magické svitky za svou námahu.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceCube,1);
	CreateInvItems(other,ITSC_SUMSHOAL,2);
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Done_01_04");	//Díky.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook,"Vrátil jsem Vatrasovi jeho denník. Stařík byl radostí bez sebe.");	
};

instance DIA_ADDON_VATRAS_MagicBook_Fail(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_MagicBook_Fail_condition;
	information = DIA_ADDON_VATRAS_MagicBook_Fail_info;
	permanent = FALSE;
	description = "Obávám se, že jsem nebyl schopen najít tvůj denník.";
};

func int DIA_ADDON_VATRAS_MagicBook_Fail_condition()
{
	if((MIS_VatrasMagicBook == LOG_Running) && (MagicBookCantFind == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_MagicBook_Fail_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_MagicBook_Fail_01_00");	//Obávám se, že jsem nebyl schopen najít tvůj denník.
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Fail_01_02");	//Žádné strachy synu... Alespoň jsi to zkusil!
	AI_Output(self,other,"DIA_ADDON_VATRAS_MagicBook_Fail_01_03");	//A to je to na čem záleží.
	MIS_VatrasMagicBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_VatrasMagicBook,LOG_Success);
	B_LogEntry(TOPIC_VatrasMagicBook,"Řekl jsem Vatrasovi, že jsem nebyl schopen najít jeho deník.");	
};

instance DIA_ADDON_VATRAS_LeeLetter(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetter_condition;
	information = DIA_ADDON_VATRAS_LeeLetter_info;
	permanent = FALSE;
	description = "Neměl bys pro mě nějakou další práci?";
};

func int DIA_ADDON_VATRAS_LeeLetter_condition()
{
	// if((MIS_VatrasPotion == LOG_Success) && (Kapitel >= 2))
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetter_info()
{
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetter_01_00");	//Neměl bys pro mě nějakou další práci?
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetter_01_01");	//Potřeboval bych abys doručil tenhle dopis vůdci žoldáků - Leemu.
	B_GiveInvItems(self,other,ItWr_VatrasLee,1);
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetter_01_02");	//Je to velmi naléhavé! Musíš si pospíšit!
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetter_01_03");	//Udělám, co bude možné.
	MIS_LeeLetter = LOG_Running;
	Log_CreateTopic(TOPIC_LeeLetter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Running);
	B_LogEntry(TOPIC_LeeLetter,"Dostal jsem od Vatrasa dopis pro Leeho, říkal, že je nezbytné aby ho dostal co nejdřív.");	
};

instance DIA_ADDON_VATRAS_LeeLetterDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_LeeLetterDone_condition;
	information = DIA_ADDON_VATRAS_LeeLetterDone_info;
	permanent = FALSE;
	description = "Doručil jsem tvůj dopis.";
};

func int DIA_ADDON_VATRAS_LeeLetterDone_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_LeeLetterDone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetterDone_01_00");	//Doručil jsem tvůj dopis.
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetterDone_01_01");	//Nooo... Doufám, že jsi s tím neměl žádné potíže.
	AI_Output(other,self,"DIA_ADDON_VATRAS_LeeLetterDone_01_02");	//Ne ani ne. 
	AI_Output(self,other,"DIA_ADDON_VATRAS_LeeLetterDone_01_03");	//To jsem rád! Tady vem si tohle zlato za svojí námahu.
	B_GiveInvItems(self,other,ItMi_Gold,200);
};

instance DIA_Addon_Vatras_NowRanger(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_NowRanger_Condition;
	information = DIA_Addon_Vatras_NowRanger_Info;
	permanent = TRUE;
	description = "Jsem připraven přidat se ke 'Kruhu Vody'!";
};

func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if((SC_IsRanger == FALSE) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//Jsem připraven přidat se ke 'Kruhu Vody'!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Donesl jsi svou zprávu lordu Hagenovi?
	if(Kapitel >= 1)
	{
		if((MIS_OLDWORLD != LOG_SUCCESS) && (Kapitel >= 2))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, řekl mi, že mám jít do Hornického údolí a přinést důkaz sých tvrzení!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Musíš se rozhodnout, co dál.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doručení zprávy bylo důležité pro mě. Teď je na něm, aby si pospíšil, nebo počkal na tvůj důkaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se týče tebe...
		}
		else if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Ještě ne.
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_05_18");	//Ale našel jsem chybějící části ornamenty na aktivaci portálu.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_17");	//Ano... To si zalouží respekt, ale stále máš nejaké nedokončené věci.
			AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Pohovoř si s lordem Hagenem!
			AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//Tohle je záležitost nesmírného významu.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrá.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//Dokázal jsi, že můžeš být pro nás důležitý. Můžeš být jedním z nás. Chodit po světě a šířit Adanovu vůli.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//Tímto ti uděluji prsten 'Kruhu Vody'. Pomůže ti najít spojence a starat se s nimi o rovnováhu světa.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//Jsem velmi potěšen tím, že jsi prvním mágem Ohně, který se k nám přidal.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//Nechť tě Adanos ochraňuje. Nyní běž a setkej se svými bratry.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//Čekají tě v hostinci 'U Mrtvé harpyje' na přijímací rituál.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//Předpokladám, že ten hostinec znáš. Procházíš kolem něj po cestě na Onarův statek.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Nezapomeň si nasadit prsten, tak mohou bratři poznat, že jsi jeden z nich.
		B_LogEntry(TOPIC_Addon_RingOfWater,"Teď patřím ke 'Kruhu Vody' a mám se setkat s naši partou v hostinci 'U Mrtvé harpyje'.");
		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_Running;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	};
};


instance DIA_Addon_Vatras_CloseMeeting(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_CloseMeeting_Condition;
	information = DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Bratři Kruhu mě poslali za tebou.";
};

func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if((Lares_TakeFirstMissionFromVatras == TRUE) && (CAPITANORDERDIAWAY == FALSE) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//Bratři Kruhu mě poslali za tebou.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Dobrá! Očekával jsem tě.
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//Doručil jsi zprávu lordu Hagenovi?

	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Pošlu tě portálem s ostatními.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Musíš najít Ravena a zjistit, kde jsou zmizelí lidé.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//Já tu budu hlídat kvůli banditům.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Přines tuto zprávu Saturasovi. Od této chvíle budeš získávat úkoly od něj.

			if(MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares ti pomůže dojít, kdybys nezvládal odnést ornament sám.
			};

			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Adanos tě provázej.
		B_LogEntry(TOPIC_Addon_KDW,"Vatras mě poslal s dopisem za Saturasem. Měl bych teď jít s ostatními mágy Vody skrze portál a najít bývalého rudobarona Ravena.");
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_LogEntry_Quiet(TOPIC_Addon_Sklaven,"Mám zjistit proč Raven unáší občany Khorinisu.");
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne, ještě ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Pospěš! Ta zpráva je velmi důležitá.
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};

instance DIA_ADDON_VATRAS_CANGOPORTAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_cangoportal_condition;
	information = dia_addon_vatras_cangoportal_info;
	permanent = FALSE;
	description = "Saturas čeká na zprávu.";
};

func int dia_addon_vatras_cangoportal_condition()
{
	if((SATURASWAITSVATRASMESSAGE == TRUE) && (CANGOTOPORTAL == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && !Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportal_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CanGoPortal_15_00");	//Saturas čeká na zprávu.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_01");	//Úplně jsem zapomněl, napíšu ti tu zprávu.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_02");	//Ale pro začátek mi odpověz na otázku.
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_04");	//Předal jsi zprávu Hagenovi?

	if(Kapitel >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Ano.

		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//Ale, řekl mi, že mám jít do Hornického údolí a přinést důkaz svých tvrzení!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//Musíš se rozhodnout, co dál.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//Doručení zprávy bylo důležité pro mě. Teď je na něm, aby si pospíšil, nebo počkal na tvůj důkaz.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//Co se týče tebe...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Dobrá.
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Pošlu tě portálem s ostatními.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Musíš najít Ravena a zjistit, kde jsou zmizelí lidé.
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//Já tu budu hlídat kvůli banditům.

		if(VatrasGiveLetterSaturas == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Přines tuto zprávu Saturasovi. Od této chvíle budeš získávat úkoly od něj.
			CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
			B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
			VatrasGiveLetterSaturas = TRUE;
		};

		if((SC_IsRanger == FALSE) && (hero.guild == GIL_NDW))
		{
			AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_05");	//Jako náš novic nemusíš vstoupit do 'Kruhu'.
			AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_06");	//Naši Bratři to přijmou.
			CreateInvItems(self,ItRi_Ranger_Addon,1);
			B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
		};

		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_07");	//Toď vše. Jdi za Saturasem!
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Adanos tě provázej.
		Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_Addon_Sklaven,"Mám zjistit proč Raven unáší občany Khorinisu.");
		B_LogEntry_Quiet(TOPIC_Addon_KDW,"Vatras mě poslal s dopisem za Saturasem. Měl bych teď jít s ostatními mágy Vody skrze portál a najít bývalého rudobarona Ravena.");
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
		CANGOTOPORTAL = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//Ne. Ještě ne.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Tak to udělej!
		VATRASSENDHAGEN = TRUE;

		if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
		{
			RangerMeetingRunning = LOG_SUCCESS;
			B_SchlussMitRangerMeeting();
		};
	};
};


instance DIA_ADDON_VATRAS_CANGOPORTALTWO(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_cangoportaltwo_condition;
	information = dia_addon_vatras_cangoportaltwo_info;
	permanent = FALSE;
	description = "Předal jsem zprávu Hagenovi.";
};

func int dia_addon_vatras_cangoportaltwo_condition()
{
	if((Kapitel >= 2) && (CANGOTOPORTAL == FALSE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cangoportaltwo_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CanGoPortalTwo_15_00");	//Předal jsem zprávu Hagenovi.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Dobrá!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//Pošlu tě portálem s ostatními.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//Musíš najít Ravena a zjistit, kde jsou zmizelí lidé.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//Já tu budu hlídat kvůli banditům.

	if(VatrasGiveLetterSaturas == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Přines tuto zprávu Saturasovi. Od této chvíle budeš získávat úkoly od něj.
		CreateInvItems(self,ItWr_Vatras2Saturas_FindRaven,1);
		B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
		VatrasGiveLetterSaturas = TRUE;
	};

	if((SC_IsRanger == FALSE) && (hero.guild == GIL_NDW))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_05");	//Jako náš novic nemusíš vztoupit do 'Kruhu'.
		AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortal_15_06");	//Naši Bratři to přijmou.
		CreateInvItems(self,ItRi_Ranger_Addon,1);
		B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
	};
	AI_Output(self,other,"DIA_Addon_Vatras_CanGoPortalTwo_15_03");	//Toď vše. Jdi!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//Adanos tě provázej.
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	B_GivePlayerXP(100);
	B_LogEntry_Quiet(TOPIC_Addon_Sklaven,"Mám zjistit proč Raven unáší občany Khorinisu.");
	B_LogEntry(TOPIC_Addon_KDW,"Vatras mě poslal, s dopisem, za Saturasem. Měl bych teď jít s ostatními mágy Vody skrze portál a najít bývalého rudobarona Ravena.");
	CANGOTOPORTAL = TRUE;

	if((Lares_TakeFirstMissionFromVatras == TRUE) || (SC_IsRanger == TRUE) || (hero.guild == GIL_NDW))
	{
		RangerMeetingRunning = LOG_SUCCESS;
		B_SchlussMitRangerMeeting();
	};
};



var int missingpeopleinfo[20];

instance DIA_Addon_Vatras_MissingPeople(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_MissingPeople_Condition;
	information = DIA_Addon_Vatras_MissingPeople_Info;
	permanent = TRUE;
	description = "O zmizelých lidech...";
};


func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;

func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//O zmizelých lidech...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Ano?
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople,Dialog_Back,DIA_Addon_Vatras_MissingPeople_BACK);
	if(SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Vím kde jsou!",DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Povím ti, co jsem doposud vypátral...",DIA_Addon_Vatras_MissingPeople_Report);
	};
	if(DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople,"Kde bych měl začít hledat stopy?",DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Kde bych měl začít hledat stopy?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Většina zmizela v přístavu. To zní jako dobré místo pro začátek.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Většina zmizela v přístavu. To zní jako dobré místo pro začátek.");
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	var int XP_Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Nech mě říci, co vím...
	if(((MIS_Akil_BringMissPeopleBack != 0) || (MIS_Bengar_BringMissPeopleBack != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//Farmáři také postrádají několik lidí.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((Elvrich_GoesBack2Thorben == TRUE) || (Elvrich_SCKnowsPirats == TRUE) || (SC_KnowsDexterAsKidnapper == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//Taky jsem se doslechl, že jsou za to odpovědní banditi.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, učeň mistra Thorbena, mi řekl, že banditi odvážejí zajaté lidi na moře.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((Elvrich_SCKnowsPirats == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Vypadá to, že s tím mají něco společného také piráti. Ale nejsem si jejich rolí v tom všem příliš jistý.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((Elvrich_GoesBack2Thorben == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//Osvobodil jsem Elvricha ze zajetí banditů.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KnowsLuciaCaughtByBandits == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//Dívka jménem Lucia byla taky unesena bandity.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,ItWr_LuciasLoveLetter_Addon) || (MIS_LuciasLetter == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Dívka jménem Lucia byla taky unesena bandity.
		if(MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//Vypadá to, že to udělala z vlastního přesvědčení.
		};
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KnowsDexterAsKidnapper == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//Dexter je vůdcem banditů. Je odpovědný za ty únosy.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//Pamatuju si Dextera z kolonie. Pracoval tenkrát pro rudobarona Gomeze.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//A on si určitě bude pamatovat tebe. Měl by sis dát pozor.
		Vatras_MissingPeopleReports = Vatras_MissingPeopleReports + 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//Myslím, že jsi na dobré cestě. Drž se ji.
		XP_Vatras_MissingPeopleReports = XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports;
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//Co jsi zjistil?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Bohužel, zatím nic směrodátného.
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//Vím, kde jsou zmizelí lidé.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//Co jsi zjistil?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//Byli uneseni a vzati na vzdálené místo na ostrově chlápkem jménem Raven.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//A proč sis tím tak jistý?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	///Četl jsem jeho rozkazy. Banditi všude okolo pracují pro něj.
	if(Npc_HasItems(other,ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Tady.
		B_UseFakeScroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Dobře. Dobrá práce. Už jsem se bál, že nikdy nezjistíme pravdu.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Vatras_WhereAreMissingPeople);
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_11");	//Dokázal jsi, že jsi hoden se k nám přidat.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_12");	//Pokud se rozhodneš přidat k mágům Vody, pohovoř si se Saturasem.
	};
};


instance DIA_Addon_Vatras_Free(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Free_Condition;
	information = DIA_Addon_Vatras_Free_Info;
	permanent = FALSE;
	description = "Ztracení lidé se vrátili!";
};


func int DIA_Addon_Vatras_Free_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//Ztracení lidé se vrátili. Osvobodil jsem je.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Ano, dokázal jsi to. Nakonec to dobře dopadlo.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//Avšak, tvá cesta ještě nekončí. Nechť ti Adanos požehná.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(modlí se) Adane, požehnej tomuto muži. Osviť jeho pouť, dej mu sílu obstát všem nebezpečím.
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_Addon_Vatras_Waffen(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_Waffen_Condition;
	information = DIA_Addon_Vatras_Waffen_Info;
	permanent = TRUE;
	description = "O dodavateli zbraní...";
};


func int DIA_Addon_Vatras_Waffen_Condition()
{
	if((MIS_Vatras_FindTheBanditTrader == LOG_Running) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//O dodavateli zbraní...
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen,Dialog_Back,DIA_Addon_Vatras_Waffen_BACK);
	if((Fernando_ImKnast == TRUE) || (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Znám toho dodavatele zbraní pro bandity!",DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen,"Co víš o tom prodejci zbraní?",DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//Co víš o tom prodejci zbraní?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Promluv si s Martinem, proviantmistrem paladinů. Může mít nějaké informace.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//Obdržel úkol odhalit toho dodavatele.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//Martina najdeš v přístavu. Pokud poběžíš podel těch beden, zásob a paladinů, měl bys ho najít.
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//Znám obchodníka, který dodává zbraně banditům!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//Jmenuje se Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Velmi dobře. Postaral se Martin o to, aby už Fernando nikdy nemohl prodávat zbraně?
	if(Fernando_ImKnast == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Jo. Martin se postaral, aby moc brzo neopustil kobky žaláře.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Skvělá práce, synu.
		if(Npc_KnowsInfo(other,DIA_Addon_Vatras_WannaBeRanger) && (SC_IsRanger == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(směle) Znamená to, že jsem nyní připraven vstoupit do 'Kruhu Vody'?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(usměv) To nebylo přesné znění naši dohody - a ty to moc dobře víš.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//Nechť Adanos osvítí tvou cestu.
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
		if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (other.guild == GIL_NONE))
		{
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_11");	//Dokázil jsi, že jsi hoden se k nám přidat.
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_12");	//Pokud se rozhodneš přidat k mágům Vody, pohovoř si se Saturasem.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Ještě ne.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Tak pospěš a zprav ho o tom! Toto musí být okamžitě zastaveno.
	};
};


instance DIA_Addon_Vatras_Stoneplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_Stoneplate_Condition;
	information = DIA_Addon_Vatras_Stoneplate_Info;
	description = "Mám zde kamennou tabulku...";
};


func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if((Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//Mám zde kamennou tabulku. Můžeš mi o ní něco říct?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Jsou to artefakty kultury, která tu žila před námi.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//Můžeme se z nich dozvědět o životě prastarých lidí.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//Přines mi všechny, které najdeš.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//Neboj, odměním tě.
	Log_CreateTopic(TOPIC_Addon_Stoneplates,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates,LOG_Running);
	B_LogEntry(TOPIC_Addon_Stoneplates,LogText_Addon_VatrasTrade);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTrader,LogText_Addon_VatrasTrade);
};


instance DIA_Addon_Vatras_SellStonplate(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_SellStonplate_Condition;
	information = DIA_Addon_Vatras_SellStonplate_Info;
	permanent = TRUE;
	description = "Mám pro tebe kamenné tabulky...";
};


func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Vatras_Stoneplate) && (Npc_HasItems(hero,ItWr_StonePlateCommon_Addon) >= 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl;
	anzahl = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

	AI_Output(other,self,"DIA_Addon_Vatras_SellStonplate_15_00");	//Mám pro tebe kamenné tabulky...
	B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,anzahl);
	Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
	AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_01");	//Chvályhodné!

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_02");	//Zvětším tvou magickou sílu!
		B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,anzahl);
		Npc_ChangeAttribute(other,ATR_MANA,anzahl);
	}
	else if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_04");	//Tady, vem si svitky jako odměnu...

		if(anzahl >= 25)
		{
			B_GiveInvItems(self,other,ItSc_AdanosBall,1);
			B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
			B_GiveInvItems(self,other,ItSc_Geyser,1);
		}
		else if(anzahl >= 15)
		{
			B_GiveInvItems(self,other,ItSc_IceWave,1);
			B_GiveInvItems(self,other,ItSc_LightningFlash,1);
		}
		else if(anzahl >= 10)
		{
			B_GiveInvItems(self,other,ItSc_Waterfist,1);
			B_GiveInvItems(self,other,ITSC_SUMSHOAL,1);
		}
		else if(anzahl >= 5)
		{
			B_GiveInvItems(self,other,ItSc_ThunderBall,1);
			B_GiveInvItems(self,other,ItSc_IceCube,1);
		}
		else if(anzahl > 1)
		{
			B_GiveInvItems(self,other,ItSc_Icebolt,1);
			B_GiveInvItems(self,other,ItSc_Icelance,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItSc_Zap,1);
		};
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_SellStonplate_05_03");	//Tady, vem si lektvary jako odměnu...
		B_GiveInvItems(self,other,ItPo_Health_03,anzahl + 1);
	};

	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};


var int Vatras_SentToDaron;

instance DIA_Addon_Vatras_GuildHelp(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = DIA_Addon_Vatras_GuildHelp_Condition;
	information = DIA_Addon_Vatras_GuildHelp_Info;
	description = "Lares řekl, že mi můžeš pomoci dostat se k mágům Ohně.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if((RangerHelp_gildeKDF == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares se zmínil že mi pomužeš přidat se k mágum Ohně.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//To je tá volba? Cesta Ohně?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Jo, hodlám se stát mágem Ohně.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//Pokud si dobře pamatuji, nepřestali přijímat novice. Proč chceš tedy mou pomoc?
	if(SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//Novic před klášterem po mně chce daň. Ovci a zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares se zmínil o dani na zaplacení ke vstupu do kláštera.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//No, nemohu ti přímo pomoci, protože jsem mágem Vody, jak víš. Ale znám velmi dobře mága Ohně Darona.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//Je obvykle blízko tržiště a vybírá dary.
	Vatras_SentToDaron = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//Ačkoliv to není jediná věc, o kterou se tady stará.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//Jednou mi říkal o sošce, kterou mu ukradli.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//Je to pro něj velmi důležité. Jsem si jistý, že ti pomůže, pokud získáš jeho sošku zpět.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Samozřejmě, tvé přijetí k mágům Ohně neznamená, že se nemůžeš připojit ke Kruhu.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//Pokud si to prokazatelně zasloužíš.
	MIS_Addon_Vatras_Go2Daron = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Mág Ohně Daron na tržišti potřebuje pomoci s malou vzácnou soškou. Může mi pomoci dostat se rychle do kláštera.");
};

instance DIA_Vatras_INFLUENCE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 92;
	condition = DIA_Vatras_INFLUENCE_Condition;
	information = DIA_Vatras_INFLUENCE_Info;
	permanent = FALSE;
	description = "Dej mi prosím své požehnání.";
};


func int DIA_Vatras_INFLUENCE_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Player_IsApprentice == APP_NONE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Dej mi prosím své požehnání.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//A proč bych ti měl požehnat, cizinče?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Chci se stát učedníkem u jednoho z mistrů v dolní čtvrti.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Jdi s Adanovým požehnáním, synu!
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry(TOPIC_Thorben,"Mág Vody Vatras mi požehnal.");
};


instance DIA_Vatras_WoKdF(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 93;
	condition = DIA_Vatras_WoKdF_Condition;
	information = DIA_Vatras_WoKdF_Info;
	permanent = FALSE;
	description = "Kde bych našel Innosova kněze?";
};


func int DIA_Vatras_WoKdF_Condition()
{
	if((MIS_Thorben_GetBlessings == LOG_Running) && (Vatras_Segen == TRUE) && (Vatras_SentToDaron == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Kde bych našel Innosova kněze?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Nejlépe bude, když se rozhlédneš po tržišti. Tam na někoho z kláštera jistě narazíš.
};

var int VatrasBonusMana;

instance DIA_Vatras_Spende(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 94;
	condition = DIA_Vatras_Spende_Condition;
	information = DIA_Vatras_Spende_Info;
	permanent = TRUE;
	description = "Rád bych Adanovi poskytl dar!";
};


func int DIA_Vatras_Spende_Condition()
{
	return TRUE;
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Rád bych Adanovi poskytl dar!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Darem Adanovu chrámu smyješ část hříchů, které jsi možná spáchal, synu.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Kolik můžeš věnovat?
	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende,"Zrovna teď nemám peněz nazbyt...",DIA_Vatras_Spende_BACK);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mám u sebe 50 zlatých.",DIA_Vatras_Spende_50);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende,"Mám u sebe 100 zlatých.",DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Zrovna teď nemám peněz nazbyt...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//To nevadí, své dobré úmysly můžeš vyjádřit později, synu.
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//Mám u sebe 50 zlatých...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Děkuji ti ve jménu Adana, synu. Tvé zlato bude rozděleno mezi potřebné.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	PRAYSUM_VATR += 50;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};


	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//Mám u sebe 100 zlatých...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Za tento šlechetný čin ti v Adanově jménu žehnám!
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Nechť ti Adanos na tvé cestě požehná!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	PRAYSUM_VATR += 100;

	if((PRAYSUM_VATR > 1000) && (VatrasBonusMana == FALSE))
	{
		B_RaiseAttribute_Bonus(hero,ATR_MANA_MAX,5);
		Npc_ChangeAttribute(hero,ATR_MANA,ATR_MANA_MAX);
		BONUSCOUNT += 1;
		VatrasBonusMana = TRUE;
	};

	Info_ClearChoices(DIA_Vatras_Spende);
};

instance DIA_Vatras_CanTeach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 95;
	condition = DIA_Vatras_CanTeach_Condition;
	information = DIA_Vatras_CanTeach_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco o magii?";
};

func int DIA_Vatras_CanTeach_Condition()
{
	return TRUE;
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Můžeš mě naučit něco o magii?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Pouze vyvoleným Innose nebo Adana je dovoleno používat runovou magii.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Ale obyčejní smrtelníci mohou používat magii za pomoci magických svitků.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Mohu ti ukázat, jak lze získat a rozšiřovat magické schopnosti.
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Mág Vody Vatras mi pomůže zvýšit magickou moc.");
};

instance DIA_Vatras_Teach(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 100;
	condition = DIA_Vatras_Teach_Condition;
	information = DIA_Vatras_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych posílit svoji magickou moc.";
};

func int DIA_Vatras_Teach_Condition()
{
	if(Vatras_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Chtěl bych posílit svoji magickou moc.
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (other.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Regenerace many (VB: 10, cena: 5000 zlatých)",DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= 500)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Tvá magická moc přesáhla mé schopnosti.
	};

	Info_ClearChoices(DIA_Vatras_Teach);
};

func void DIA_Vatras_Teach_RegenMana()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Nauč mě jak si regenerovat manu.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Vatras_Teach_regen_03_90");	//Nemáš na to dostatek zlata!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Regenerace many");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Regenerace many (VB: 10, cena: 5000 zlatých)",DIA_Vatras_Teach_RegenMana);
	};
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach,Dialog_Back,DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Vatras_Teach_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDW) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Vatras_Teach,"Regenerace many (VB: 10, cena: 5000 zlatých)",DIA_Vatras_Teach_RegenMana);
	};
};

instance DIA_Vatras_GODS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 98;
	condition = DIA_Vatras_GODS_Condition;
	information = DIA_Vatras_GODS_Info;
	permanent = TRUE;
	description = "Řekni mi něco o bozích.";
};

func int DIA_Vatras_GODS_Condition()
{
	return TRUE;
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Řekni mi něco o bozích.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Co přesně bys chtěl vědět?
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi něco o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Řekni mi něco o Innosovi.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Velmi dobře. (káže) Innos je prvním a nejvyšším bohem. Stvořil slunce a svět.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Ovládá světlo a oheň, své dary lidstvu. Je ztělesněním řádu a spravedlnosti.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Jeho kněží jsou mágové Ohně, paladinové jsou jeho válečníky.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Pověz mi něco o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Vyprávěj o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"A Beliar?",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Řekni mi něco o Adanovi.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos je bůh středu. Vymezuje právo a je strážcem rovnováhy mezi Innosem a Beliarem.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Ovládá sílu přeměn, jeho darem je voda všech oceánů, jezer a řek.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Jeho kněží jsou mágové Vody, stejně jako já jsem služebníkem a knězem Adanovým.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Řekni mi něco o Beliarovi.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar je Temný bůh smrti, zkázy a všech nepřirozených věcí.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Vede věčnou válku s Innosem, ale Adanos bdí nad tím, aby byly jejich síly stále vyrovnané.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Pouze několik málo lidí následuje volání Beliara - nicméně on těm, kdo tak činí, zajistí velkou moc.
	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS,Dialog_Back,DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Innosovi.",DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Adanovi.",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS,"Řekni mi o Beliarovi.",DIA_Vatras_GODS_BELIAR);
};


instance DIA_Vatras_HEAL(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 99;
	condition = DIA_Vatras_HEAL_Condition;
	information = DIA_Vatras_HEAL_Info;
	permanent = TRUE;
	description = "Můžeš mě vyléčit?";
};

func int DIA_Vatras_HEAL_Condition()
{
	return TRUE;
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Můžeš mě vyléčit?

	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		if((hero.guild == GIL_KDW) || (hero.guild == GIL_NDW))
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbožně) Adane, požehnej tomuto tělu. Zbav ho jeho zranění a posil ho novým životem.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			BONUSCOUNT += 1;
		}
		else if((PRAYSUM_VATR >= 500) && (PRAYDAY2_VATR != Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_05");	//Daroval jsi hodně a Adanos ti je vděčný, synu.
			AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(zbožně) Adane, požehnej tomuto tělu. Zbav ho jeho zranění a posil ho novým životem.
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			AI_Print(PRINT_FullyHealed);
			PRAYDAY2_VATR = Wld_GetDay();
			BONUSCOUNT += 1;
		}
		else if(PRAYDAY2_VATR == Wld_GetDay())
		{
			AI_Output(self,other,"DIA_Vatras_HEAL_05_03");	//Dnes jsem tě už jednou léčil. Moje schopnosti nejsou neomezené, vrať se zítra.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//A proč bych to dělal?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Právě teď nepotřebuješ žádné magické léčení.
	};
};


instance DIA_Vatras_MISSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MISSION_Condition;
	information = DIA_Vatras_MISSION_Info;
	important = TRUE;
};


func int DIA_Vatras_MISSION_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//Mám zprávu pro mistra Isgarotha. Střeží svatyni před klášterem.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Když mu ji doručíš, získáš odměnu podle vlastního výběru.
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Teď ne!",DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION,"Chápu.",DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Dobře. Tak teď pokračuj ve své cestě k mistru Isgarothovi.
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Udělám to.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Dobrá, tak si vezmi tu zprávu a vyber si jeden z těchto magických svitků.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//Až doručíš tu zprávu, čeká tě náležitá odměna.
	B_GiveInvItems(self,hero,ItWr_VatrasMessage,1);
	MIS_Vatras_Message = LOG_Running;
	Log_CreateTopic(TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_Running);
	B_LogEntry(TOPIC_Botschaft,"Vatras mi předal zprávu pro mistra Isgarota, kterého najdu ve svatyni naproti klášteru.");
	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION,"Chci světlo.",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION,"Malé léčení.",DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION,"Ledový šíp.",DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Teď ne!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//Žádný problém. Pošlu někoho jiného.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Vybral jsem si léčivý svitek.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_LightHeal,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Dej mi Ledový šíp.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Icebolt,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Vezmu si kouzlo Světla.
	B_SayVatrasGo();
	B_GiveInvItems(self,hero,ItSc_Light,1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};


instance DIA_Vatras_MESSAGE_SUCCESS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information = DIA_Vatras_MESSAGE_SUCCESS_Info;
	description = "Doručil jsem tvou zprávu.";
};


func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if((MIS_Vatras_Message == LOG_Running) && (Vatras_Return == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Doručil jsem tvou zprávu.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Přijmi mé díky. A teď si vezmi svou odměnu.
	MIS_Vatras_Message = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Botschaft,LOG_SUCCESS);
	B_LogEntry(TOPIC_Botschaft,"Řekl jsem Vatrasovi, že jsem doručil jeho zprávu Isgarotovi.");
	B_GivePlayerXP(XP_Vatras_Message);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Královský šťovík.",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Prsten obratnosti.",DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS,"Hrudka rudy.",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self,hero,ItPl_Perm_Herb,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self,hero,ItRi_Dex_01,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self,hero,ItMi_Nugget,1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};


const int kurz = 0;
const int lang = 1;
var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	if(Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Slyšte, lidé! Je mě potřeba někde jinde.
		if(dauer == kurz)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Nebude to mít dlouhého trvání. Až se vrátím, dopovím vám zbytek příběhu.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Nevím, jestli se ještě vrátím. Pokud chcete znát konec, přečtěte si ten příběh v Písmu.
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Adanos s vámi!
		B_TurnToNpc(self,other);
	};
	Vatras_SchickeLeuteWeg = TRUE;
};


instance DIA_Addon_Vatras_AbloesePre(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AbloesePre_Condition;
	information = DIA_Addon_Vatras_AbloesePre_Info;
	description = "Mám problém s Innosovým okem!";
};

func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if((Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == FALSE) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//Mám problém s Innosovým okem! Potřebuju tvoji pomoc.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//Budu kvůli tomu muset opustit město?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//To nevím. Možná.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//Čekám na svou náhradu už pár dní. Ostatní mágové Vody by se už měli vrátit.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//Ujisti se, že pošlou náhradníka a já ti pomohu.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_VatrasAbloesung = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Running);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Vatras mi nemůže pomoci s problémem 'Innosova oka' dokud ve městě nebude jiný mág Vody, který ho zastoupí.");
};

instance DIA_Addon_Vatras_AddonSolved(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Addon_Vatras_AddonSolved_Condition;
	information = DIA_Addon_Vatras_AddonSolved_Info;
	description = "Náhrada dorazila.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if((MIS_VatrasAbloesung == LOG_Running) && (CAPITANORDERDIAWAY == FALSE) && (MyxirIsBack == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Náhrada dorazila.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//To je vskutku dobrá zpráva. Doufejme, že podobné věci se už nikdy nestanou.
	if(Npc_KnowsInfo(other,DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//TEĎ ti mohu pomoci s tvým malým problémem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//Pokud si dobře pamatuji, týkalo se to Innosova oka, že?
	};
	MIS_VatrasAbloesung = LOG_Success;
	VatrasCanLeaveTown_Kap3 = TRUE;
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung,LOG_Success);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Vatras mi teď pomůže s Innosovým okem.");
};

instance DIA_Vatras_INNOSEYEKAPUTT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information = DIA_Vatras_INNOSEYEKAPUTT_Info;
	description = "Innosovo oko je rozbité.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if((Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (Kapitel == 3) && (VatrasCanLeaveTown_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if(MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Posílá mě Pyrokar!
	}
	else if(MIS_Xardas_GoToVatrasInnoseye == LOG_Running)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Posílá mě Xardas.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Innosovo oko je rozbité.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Já vím. Slyšel jsem o tom od nějakých velmi rozrušených noviců.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Pátrači zneužili kruh Slunce mágů Ohně ke zničení Oka.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Řekl bych, že jsou ovládáni nepřítelem.
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Po tomhle městě se novinky šíří rychle.",DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);
	if((hero.guild == GIL_KDF) && (MIS_Pyrokar_GoToVatrasInnoseye == LOG_Running))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Proč si Pyrokar ze všech lidí vybral právě tebe?",DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Co se stane s Okem teď?",DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Co se stane s Okem teď?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Musíme ho znovu opravit. Ale bojím se, že to nebude jen tak.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Objímka se rozbila na dva kusy. Zručný kovář by si s tím měl umět poradit.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Ale tohle není ten problém. Co mi dělá starosti, je samotný drahokam.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Je matný a bez moci. Zdá se, že nepřítel přesně věděl, jak ho oslabit.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde bych našel kováře, který by to dokázal opravit?",DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Jak může drahokam získat zpět svojí sílu?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Jak může drahokam získat zpět svojí sílu?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Vidím jen jedinou cestu. Spojení tří vládnoucích bohů by mohlo zajistit potřebný efekt.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Dobře připravený rituál zvratu provedený na místě zničení vrátí drahokamu jeho sílu.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Nicméně, problém je, že na to místo musíš dostat pozemské zástupce každého ze tří bohů.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Navíc je potřeba mnoho trávy z bažin. Odhaduju, že to budou nejméně tři stébla.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kdo by měli být ti tři pozemští zástupci bohů?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Kde najdu tu trávu z bažin?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Kde najdu tu trávu z bažin?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Slyšel jsem o staré mastičkářce v lesích, co si říká Sagitta. Mohla by ti ty rostliny prodat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Ale taky bys mohl zkusit štěstí dole v přístavu.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Kdo by měli být ti tři pozemští zástupci bohů?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Adana bych měl zastupovat já sám.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, nejvyšší mág Ohně, bude ten pravý představitel boha Innose.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Ale kdo by měl být za Beliara, to nevím.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Co Xardas?",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Co Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//To je ono. To by mohlo fungovat.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Ale ptám se sám sebe, jak ty dva dostat k sobě.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Dokážu si představit, jak se Pyrokar bude tvářit, až se dozví, že musí spolupracovat s Xardasem.
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT,"Už musím jít.",DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Kde najdu kováře schopného opravit objímku Oka?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Poptej se tady po okolí po někom, kdo umí opravit šperk.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Proč si Pyrokar ze všech lidí vybral právě tebe?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Měl jsem podezření, že se dříve či později něco podobného přihodí.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar se vždycky považoval za tak nezranitelného a mocného, že to skoro hraničilo s nerozvážností.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Proto byla jeho opatření na ochranu Oka také tak... ehm, lajdácká.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Prostě si myslím, že mimovolně spoléhal na schopnosti, jež mi Adanos propůjčil.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Raději ani nemyslím na to, co by se mohlo stát, kdybych teď nebyl k dispozici.
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//Po tomhle městě se novinky šíří rychle.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Taky dobře. Nepřítel se stejně bude mít na pozoru.
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Už musím jít.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Musím vyrazit a připravit v kruhu Slunce ten rituál.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Pošli tam Xardase a Pyrokara. A nezapomeň přinést trávu z bažin. Spoléhám na tebe.
	B_LogEntry(TOPIC_INNOSEYE,"Podle Vatrase mohu Oku navrátit moc pouze tak, že vykonám rituál v kruhu Slunce. Musím ovšem přimět Xardase a Pyrokara, aby se ho také zúčastnili, a zároveň najít kováře, který dokáže rozbitý amulet opravit.");
	MIS_RitualInnosEyeRepair = LOG_Running;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	Vatras_GoesToRitualInnosEye = TRUE;
	B_Vatras_GeheWeg(kurz);
	dmt_1201.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1202.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1203.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1204.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1205.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1206.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1207.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1208.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1209.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1210.aivar[AIV_EnemyOverride] = TRUE;
	dmt_1211.aivar[AIV_EnemyOverride] = TRUE;
	B_StartOtherRoutine(dmt_1201,"AfterRitual");
	B_StartOtherRoutine(dmt_1202,"AfterRitual");
	B_StartOtherRoutine(dmt_1203,"AfterRitual");
	B_StartOtherRoutine(dmt_1204,"AfterRitual");
	B_StartOtherRoutine(dmt_1205,"AfterRitual");
	B_StartOtherRoutine(dmt_1206,"AfterRitual");
	B_StartOtherRoutine(dmt_1207,"AfterRitual");
	B_StartOtherRoutine(dmt_1208,"AfterRitual");
	B_StartOtherRoutine(dmt_1209,"AfterRitual");
	B_StartOtherRoutine(dmt_1210,"AfterRitual");
	B_StartOtherRoutine(dmt_1211,"AfterRitual");
};

instance DIA_ADDON_VATRAS_SEEKERS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_ADDON_VATRAS_SEEKERS_condition;
	information = DIA_ADDON_VATRAS_SEEKERS_info;
	permanent = FALSE;
	description = "A kdo jsou ti cizinci v kapucích?";
};

func int DIA_ADDON_VATRAS_SEEKERS_condition()
{
	if(MIS_RitualInnosEyeRepair == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_ADDON_VATRAS_SEEKERS_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_ADDON_VATRAS_SEEKERS_01_00");	//A kdo jsou ti cizinci v kapucích?
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_01");	//Tihle mocní čarodejové začali sloužit Beliarovi už hodně dávno.
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_02");	//Dostali skoro neomezenou moc výměnou za svoji duši.
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_03");	//Dokonce i po smrti tihle lidé pokračují v sloužení svému pánovi.
	AI_Output(self,other,"DIA_ADDON_VATRAS_SEEKERS_01_04");	//Zkus se jim vyhýbat, jsou strašně nebezpeční!
};

instance DIA_Vatras_RitualInnosEyeRepair(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_RitualInnosEyeRepair_Condition;
	information = DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent = TRUE;
	description = "Jak se to má s Innosovým okem?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Jak se to má s Innosovým okem?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Pamatuj: jedině rituál zvratu v kruhu Slunce společně s Xardasem a Pyrokarem může Oku navrátit sílu.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//A nezapomeň přinést Oko s opravenou objímkou.
};


instance DIA_Vatras_BEGINN(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 31;
	condition = DIA_Vatras_BEGINN_Condition;
	information = DIA_Vatras_BEGINN_Info;
	description = "Udělal jsem vše, co jsi řekl. Tady je opravené Oko.";
};

func int DIA_Vatras_BEGINN_Condition()
{
	if((Kapitel == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(Pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) && (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Udělal jsem vše, co jsi řekl. Tady je opravené Oko.
	B_GivePlayerXP(XP_RitualInnosEyeRuns);
	B_GiveInvItems(other,self,ItMi_InnosEye_Broken_Mis,1);
	Npc_RemoveInvItem(self,ItMi_InnosEye_Broken_Mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Teď už nic nebrání provedení rituálu.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//A co tráva z bažin?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Á, ano. Tak máš ty tři rostlinky?
	if(B_GiveInvItems(other,self,ItPl_SwampHerb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ehm. Ano. Tady jsou ty tři rostlinky.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Výborně.
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Ne. Bohužel ne.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Dobrá. Tak to budeme muset udělat bez nich.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Udělals to dobře, ale teď se postav kousek stranou, ať můžeme začít s rituálem. Nechť se naše duše spojí!
	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN,Dialog_Ende,DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RitualInnosEyeRuns = LOG_Running;
};


instance DIA_Vatras_AUGEGEHEILT(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_AUGEGEHEILT_Condition;
	information = DIA_Vatras_AUGEGEHEILT_Info;
	important = TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if((Kapitel == 3) && (RitualInnosEyeRuns == LOG_Running) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Hotovo. Podařilo se nám překazit nepříteli plány a opravit Oko.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Ať ti Pyrokar vysvětlí, jak používat jeho sílu.

	if((JOINWATERRING == TRUE) && (YARKENDARTROUBLE == FALSE) && (RavenAway == TRUE) && (AWORCINVASIONSTART == FALSE))
	{
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_03");	//Mám pro tebe jeden velmi důležitý úkol.
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_04");	//Rozrušilo mě, že jsem již dlouho nedostal zprávu o expedici v Jharkendaru!
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_05");	//Měli by se ozvat co nejdříve, takže tam zajdi a zjisti, co se děje!
		AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_06");	//Ale před tím promluv s Pyrokarem.
		MIS_ADW_NEWSVATRAS = LOG_Running;
		Log_CreateTopic(TOPIC_ADW_NEWSVATRAS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_Running);
		Log_AddEntry(TOPIC_ADW_NEWSVATRAS,"Vatras dlouhý čas neslyšel nic a mázích v Jharkendaru, měl bych se tam podívat.");
		YARKENDARTROUBLE = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Doufám, že se ještě uvidíme, až dokončíš svou misi. 
	B_LogEntry(TOPIC_INNOSEYE,"Oko je již v pořádku. Pyrokar mi je vydá a pak půjdu lovit draky.");
	AI_StopProcessInfos(self);
	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;
	B_StartOtherRoutine(Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas,"RitualInnosEyeRepair");
	B_StartOtherRoutine(VLK_455_Buerger,"START");
	B_StartOtherRoutine(VLK_454_Buerger,"START");
	B_StartOtherRoutine(VLK_428_Buergerin,"START");
	B_StartOtherRoutine(VLK_450_Buerger,"START");
	B_StartOtherRoutine(VLK_426_Buergerin,"START");
};


instance DIA_VATRAS_NEWSFORVATRAS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = dia_vatras_newsforvatras_condition;
	information = dia_vatras_newsforvatras_info;
	description = "Ohledně expedice...";
};


func int dia_vatras_newsforvatras_condition()
{
	if((YARKENDARTROUBLE == TRUE) && (AWORCINVASIONSTOP == TRUE) && (NEWSFORVATRAS == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_newsforvatras_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_00");	//Ohledně expedice...
	AI_Output(self,other,"DIA_Vatras_NewsForVatras_01_01");	//Ano? Co o tom víš?
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_02");	//Skřeti obsadili údolí. Saturas a ostatní se ukryli u portálu.
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_03");	//Bojí se, že by se skřeti dostali portálem do Khorinisu a chtějí ho bránit.
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_06");	//Teď už je to vpořádku. Vyřešil jsem to!... Skřeti určitě brzy opustí údolí.
	AI_Output(other,self,"DIA_Vatras_NewsForVatras_01_07");	//Ostatní zůstanou tam.
	AI_Output(self,other,"DIA_Vatras_NewsForVatras_01_08");	//Adanos ti žehnej, synu. Máš opravdu dobré zprávy.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_ADW_NEWSVATRAS = LOG_SUCCESS;
	Log_AddEntry(TOPIC_ADW_NEWSVATRAS,"Řekl jsem Vatrasovi o pohromě v údolí. Byl potěšen jejím vyřešením.");
	Log_SetTopicStatus(TOPIC_ADW_NEWSVATRAS,LOG_SUCCESS);
	NEWSFORVATRAS = TRUE;
};


instance DIA_Vatras_PERMKAP3(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 33;
	condition = DIA_Vatras_PERMKAP3_Condition;
	information = DIA_Vatras_PERMKAP3_Info;
	description = "Díky za pomoc při obnovení síly Innosova oka.";
};


func int DIA_Vatras_PERMKAP3_Condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Díky za pomoc při obnovení síly Innosova oka.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Neplýtvej tak svými díky. Tvůj největší úkol na tebe ještě čeká.
	if(MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Promluv si s Pyrokarem, vysvětlí ti všechno ostatní.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Doufám, že tě ještě uvidím živého a zdravého, můj synu.
};


instance DIA_Vatras_HILDAKRANK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 34;
	condition = DIA_Vatras_HILDAKRANK_Condition;
	information = DIA_Vatras_HILDAKRANK_Info;
	description = "Lobartově ženě Hildě je špatně.";
};


func int DIA_Vatras_HILDAKRANK_Condition()
{
	if((MIS_HealHilda == LOG_Running) && Npc_KnowsInfo(other,DIA_Vatras_GREET) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobartově ženě Hildě je špatně.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Co? Už zase? Ta dobrá žena by na sebe měla dávat větší pozor.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Jedna tuhá zima a už tu s námi nebude. Dobrá, dám ti pro ni medicínu, co potlačí horečku.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//A víš, když už jsi v tom, měl bys na sebe taky dávat pozor.
	CreateInvItems(self,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
};


instance DIA_Vatras_OBSESSION(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 35;
	condition = DIA_Vatras_OBSESSION_Condition;
	information = DIA_Vatras_OBSESSION_Info;
	description = "Mám podivné pocity úzkosti.";
};


func int DIA_Vatras_OBSESSION_Condition()
{
	if((SC_IsObsessed == TRUE) && (SC_ObsessionTimes < 1) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Mám podivné pocity úzkosti.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Taky nevypadáš moc dobře. Byl jsi vystaven černému pohledu Pátračů příliš dlouhou dobu.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Všechno, co dokážu vyléčit, je tvé tělo, ale jedině v klášteře mohou očistit tvou duši. Promluv si s Pyrokarem. Pomůže ti.
};


instance DIA_Vatras_AllDragonsDead(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 59;
	condition = DIA_Vatras_AllDragonsDead_Condition;
	information = DIA_Vatras_AllDragonsDead_Info;
	description = "Ti draci už žádnou spoušť nezpůsobí.";
};


func int DIA_Vatras_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Ti draci už žádnou spoušť nezpůsobí.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Věděl jsem, že se vrátíš živý a zdravý. Nicméně, ještě pořád máš tu největší překážku před sebou.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Já vím.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Tak se pořádně připrav a přijď za mnou, kdykoli budeš něco potřebovat. Také pořád u sebe nos Innosovo oko, slyšíš? Nechť ti Adanos žehná.
};


instance DIA_Vatras_KnowWhereEnemy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_KnowWhereEnemy_Condition;
	information = DIA_Vatras_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Vím, kde jsou naši nepřátelé.";
};


func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Vatras_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Vím, kde jsou naši nepřátelé.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Tak to už nesmíme ztrácet čas. Musíme je vyhledat dřív, než si pro nás přijdou.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Chceš se ke mně přidat?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Dlouho jsem o tom přemýšlel a nikdy jsem si nebyl ničím tak jistý, příteli.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Vatras mi překvapivě nabídl, že mě na cestě doprovodí. Muž s jeho dovednostmi a zkušenostmi pro mě bude jistě velmi cenný.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//Už mám skupinu plnou. Obávám se, že pro tebe nezbylo místo.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Tak ho nějak udělej. Potřebuješ mě.
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Ještě o tom popřemýšlím...",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy,"Považuju za velkou poctu mít tě po svém boku. Uvidíme se v přístavu.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Považuju za velkou poctu mít tě po svém boku. Uvidíme se v přístavu.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Ať ti to netrvá moc dlouho. Nepřítel nikdy nespí, příteli.
	B_GivePlayerXP(XP_Crewmember_Success);
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	B_Vatras_GeheWeg(lang);
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Ještě o tom popřemýšlím.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Jak je libo. Vrať se, jestli si to rozmyslíš.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};


instance DIA_Vatras_LeaveMyShip(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_LeaveMyShip_Condition;
	information = DIA_Vatras_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Raději bys měl zůstat tady. Město tě potřebuje.";
};


func int DIA_Vatras_LeaveMyShip_Condition()
{
	if((Vatras_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Raději bys měl zůstat tady. Město tě potřebuje.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Možná máš pravdu. Ale stejně se k tobě přidám, jestli máš zájem. To snad víš.
	Vatras_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_Vatras_StillNeedYou(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 55;
	condition = DIA_Vatras_StillNeedYou_Condition;
	information = DIA_Vatras_StillNeedYou_Info;
	permanent = TRUE;
	description = "Pojeď se mnou na nepřátelský ostrov.";
};


func int DIA_Vatras_StillNeedYou_Condition()
{
	if(((Vatras_IsOnBoard == LOG_OBSOLETE) || (Vatras_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Pojeď se mnou na nepřátelský ostrov.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Moudré rozhodnutí. Doufám, že se toho budeš držet.
	Vatras_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_Vatras_GeheWeg(lang);
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information = DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if((VatrasPissedOffForever == TRUE) && (Kapitel >= 5) && Npc_IsInState(self,ZS_Talk) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_PRAYFORGOMEZ(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_prayforgomez_condition;
	information = dia_addon_vatras_prayforgomez_info;
	permanent = FALSE;
	description = "Nezbytně potřebuji Adanovo požehnání.";
};


func int dia_addon_vatras_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_00");	//Nezbytně potřebuji Adanovo požehnání. Ale ne pro mě.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_03");	//A o koho se jedná?
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_04");	//Chtěl bych, aby Adanos odpustil jedné duši, aby mohla opustit tento svět.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_05");	//Hmmm... (zamyšleně) To trochu mění věc.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_06");	//Koho je ta duše?
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_07");	//Během života si říkal Gomez. Ten - bývalý rudobaron!
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_20");	//Každého jiného bych s takovým požadavkem poslal pryč!
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_21");	//Ale ne tebe!
	AI_Output(other,self,"DIA_Addon_Vatras_PrayForGomez_01_22");	//Ať už to znamená cokoliv, můžeš mu dát Adanovo požehnání?!
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_01_23");	//Ano, pomůžu ti!
	Info_ClearChoices(dia_addon_vatras_prayforgomez);
	Info_AddChoice(dia_addon_vatras_prayforgomez,"(dává Adanovo požehnání)",dia_addon_vatras_prayforgomez_ok);
};

func void dia_addon_vatras_prayforgomez_ok()
{
	B_GivePlayerXP(200);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_00");	//Božské vědění Adana a síla Vody, kterou mi propůjčil...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_01");	//... tímto dávám vinné duši milost...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_02");	//... a nechť posvátná voda smyje hříchy...
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_03");	//... které tato duše spáchala v pozemském světě!
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_04");	//To je vše. Nyní můžeš jít, můj synu.
	AI_Output(self,other,"DIA_Addon_Vatras_PrayForGomez_Ok_01_05");	//Jdi spolu s Adanovým požehnáním!
	RESCUEGOMEZPRAYADANOS = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze Adanovo odpuštění od mága Vody Vatrase.");
	if((RESCUEGOMEZPRAYINNOS == TRUE) && (RESCUEGOMEZPRAYBELIAR == TRUE) && (RESCUEGOMEZPRAYADANOS == TRUE))
	{
		RESCUEGOMEZSTEPONEDONE = TRUE;
		RESCUEGOMEZSTEPTWO = TRUE;
		Log_AddEntry(TOPIC_RESCUEGOMEZ,"Získal jsem pro Gomeze odpuštění od všech třech bohů! Nyní bych měl navštívit Starý důl.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_VATRAS_ABOUTORKS(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutorks_condition;
	information = dia_addon_vatras_aboutorks_info;
	permanent = FALSE;
	description = "Jaká je situace v klášteře?";
};


func int dia_addon_vatras_aboutorks_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutorks_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_00");	//Jaká je situace v klášteře?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_01");	//Vše je v pořádku, můj synu... (odlehčeně) Zde jsme všichni v bezpečí!
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_02");	//Nicméně jsem silně rozrušen, kvůli věcem odehrávajícím se za těmito zdmi.
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_04");	//Bojím se, že tě to nepotěší, ale tam je situace mnohem horší!
	AI_Output(other,self,"DIA_Addon_Vatras_AboutOrks_01_05");	//Skřeti obsadili prakticky celou tuhle část ostrova od Khorinisu, přes farmy až po hostinec 'U Mrtvé harpyje' a pouze Onarova farma ještě nebyla napadena.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutOrks_01_06");	//U Adana!... (zoufale) Co si jenom počneme!
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermage_condition;
	information = dia_addon_vatras_aboutwatermage_info;
	permanent = FALSE;
	description = "A kde jsou ostatní mágové Vody?";
};


func int dia_addon_vatras_aboutwatermage_condition()
{
	if((KAPITELORCATC == TRUE) && (GATHERALLONBIGFARM == FALSE) && (BEWAREWATERMAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_00");	//A kde jsou ostatní mágové Vody?
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_01");	//Jsem si jistý, že někde na neznámé části ostrova.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_02");	//Abych řekl pravdu... celkem mě to znepokojuje!
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_03");	//Co přesně tě znepokojuje?!
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_04");	//To, že mí bratři jsou někde venku a skřeti vedou ofenzívu na Khorinis.
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_01_06");	//Je nutné je na to upozornit.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_07");	//Naprosto s tebou souhlasím, ale většina z nás nemůže opustit klášter.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_08");	//Musím pomoci Pyrokarovi s ochranou kláštera před těmi bestiemi.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_01_09");	//Hmmm... (zamyšleně) A měl bys mě informovat o dění mimo klášter!
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
	Info_AddChoice(dia_addon_vatras_aboutwatermage,"Já na to teď nemám čas.",dia_addon_vatras_aboutwatermage_no);
	Info_AddChoice(dia_addon_vatras_aboutwatermage,"Proč ne? Stejně nemám moc co dělat!",dia_addon_vatras_aboutwatermage_ok);
};

func void dia_addon_vatras_aboutwatermage_no()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_No_01_00");	//Já na to teď nemám čas.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_No_01_01");	//Přirozeně můj synu... Rozumím ti.
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};

func void dia_addon_vatras_aboutwatermage_ok()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_00");	//Proč ne? Stejně nemám moc co dělat!
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_01");	//Děkuji, můj synu... Jsem klidnější, když vím, že se můžu spolehnout na tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMage_Ok_01_02");	//Jen, prosím tě, spěchej! Každá minuta je drahá.
	MIS_BEWAREWATERMAGE = LOG_Running;
	Log_CreateTopic(TOPIC_BEWAREWATERMAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_Running);
	B_LogEntry(TOPIC_BEWAREWATERMAGE,"Vatras mi řekl, abych ostatní mágy Vody varoval před nebezpečím, které je teď na Khorinisu. Souhlasil jsem, že mu s tím pomůžu!");
	Info_ClearChoices(dia_addon_vatras_aboutwatermage);
};


instance DIA_ADDON_VATRAS_ABOUTWATERMAGEDONE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutwatermagedone_condition;
	information = dia_addon_vatras_aboutwatermagedone_info;
	permanent = FALSE;
	description = "Varoval jsem ostatní mágy Vody před nebezpečím.";
};


func int dia_addon_vatras_aboutwatermagedone_condition()
{
	if((MIS_BEWAREWATERMAGE == LOG_SUCCESS) && (MOVEFORCESCOMPLETE_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutwatermagedone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_AboutWaterMageDone_01_01");	//Varoval jsem ostatní mágy Vody před nebezpečím.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMageDone_01_02");	//Dobrá, můj synu... Jsem rád, že jsi to udělal!
	AI_Output(self,other,"DIA_Addon_Vatras_AboutWaterMageDone_01_03");	//Takže zde - přijmi ode mě toto zlato jako poděkování. Zasloužíš si tuto odměnu!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_ADDON_VATRAS_ABOUTBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_aboutbigbattle_condition;
	information = dia_addon_vatras_aboutbigbattle_info;
	permanent = FALSE;
	description = "Bitva se skřety bude obtížná.";
};


func int dia_addon_vatras_aboutbigbattle_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_aboutbigbattle_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AboutBigBattle_01_00");	//Bitva se skřety bude obtížná.
	AI_Output(self,other,"DIA_Addon_Vatras_AboutBigBattle_01_01");	//Nedělej si o nás starosti... (usmívá se) Jsme na to připraveni!
};


instance DIA_ADDON_VATRAS_AFTERBIGBATTLE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_afterbigbattle_condition;
	information = dia_addon_vatras_afterbigbattle_info;
	permanent = FALSE;
	description = "Jsi v pořádku?!";
};


func int dia_addon_vatras_afterbigbattle_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGUARDIANSKILLED == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_afterbigbattle_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AfterBigBattle_01_00");	//Jsi v pořádku?!
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_01");	//Jsem vpořádku můj synu...
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_02");	//Jak vidíš, bohužel to není možné říci o všech.
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_03");	//Tolik jsme jich ztratili... (smutný) A ti budou ztraceni navždy!
	AI_Output(self,other,"DIA_Addon_Vatras_AfterBigBattle_01_04");	//Nejtěžší je to vše sledovat.
};


instance DIA_ADDON_VATRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = dia_addon_vatras_runemagicnotwork_condition;
	information = dia_addon_vatras_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš stále používat runovou magii?";
};


func int dia_addon_vatras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_RuneMagicNotWork_01_00");	//Můžeš stále používat runovou magii?
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_01");	//Obávám se, že ne... (zklamaně, smutně) Všechny mé runy ztratily svou sílu.
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_02");	//A nejen moje, ale od ostatních mágů Vody také! Nevím, co teď budeme dělat.
	AI_Output(self,other,"DIA_Addon_Vatras_RuneMagicNotWork_01_03");	//Pravděpodobně se v tomto světě stalo něco strašného a my přišli o svůj dar.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};


//--------------------lineyka Yarkendara pro nezhit'-------------------------------

instance DIA_Vatras_JarCurse(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_JarCurse_Condition;
	information = DIA_Vatras_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Vatras_JarCurse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_DarkOrden == LOG_Success) && (HagenSendVat == TRUE) && (DO_SendToHagen == TRUE) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurse_Info()
{
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_00");	//Dobře že jsi přišel, synu!
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_01");	//Co jsi chtěl?
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_02");	//Vypadá to, že jsou před námi temné časy. A proto jsem nucen tě požádat o pomoc.
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_03");	//Poslouchám.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_04");	//Nedávno jsem zaslech chýry, že nedaleko pyramid bylo vidět pár nemrtvých.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_05");	//Ale nebyli to obyčejní nemrtví s jakými jsme se setkali doposud.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_06");	//Už jsem poslal Myxira a jednoho z našich bratrů aby se na to podívali.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_07");	//Ale stále jsem od nich nedostal žádné zprávy.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_08");	//Jsem velmi znepokojený. Doufám, že se jim nic zlého nestalo.
	AI_Output(other,self,"DIA_Vatras_JarCurse_01_09");	//Chápu, kam tím směruješ.
	AI_Output(self,other,"DIA_Vatras_JarCurse_01_10");	//Takže se mohu spolehnout na tvoji pomoc?
	Info_ClearChoices(DIA_Vatras_JarCurse);
	Info_AddChoice(DIA_Vatras_JarCurse,"Samozřejmě.",DIA_Vatras_JarCurse_Yes);
	//Info_AddChoice(DIA_Vatras_JarCurse,"Izvini, no u menya seychas net na eto vremeni.",DIA_Vatras_JarCurse_No);
};

func void DIA_Vatras_JarCurse_Yes()
{
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_01");	//Samozřejmě.
	AI_Output(self,other,"DIA_Vatras_JarCurse_Yes_01_02");	//Díky ti, synu.
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_03");	//Jak dávno jsi je poslal to prověřit?
	AI_Output(self,other,"DIA_Vatras_JarCurse_Yes_01_04");	//Už to jsou 3 dny. Měl by sis pospíšit než je příliš pozdě!
	AI_Output(other,self,"DIA_Vatras_JarCurse_Yes_01_05");	//Jdu hned na to.
	MIS_JarCurse = LOG_Running;
	Log_CreateTopic(TOPIC_JarCurse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarCurse,LOG_Running);
	B_LogEntry(TOPIC_JarCurse,"Vatras mě poslal zkontrolovat situaci v pyramidach a zjistit co se tam děje.");	
	AI_StopProcessInfos(self);
	B_KillNpc(pal_188_ritter);
	B_KillNpc(pal_189_ritter);
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_04");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_10");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_09");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_12");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_24");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_20");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_19");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_17");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_16");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_NW_TROLLAREA_PORTALTEMPEL_18");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_22");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_21");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_23");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_25");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_01");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_STUDY_03");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_06");
	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTAL_KDWWAIT_04A");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_SMALLTALK_NW_TROLLAREA_PORTALTEMPEL_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_JC,"EXIT_ADDON");

	//------ataka Miksira i Mitrasa--------------------------------

	Wld_InsertNpc(Ancient_Warrior_01,"NW_TROLLAREA_PORTALTEMPEL_41");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_02");
	Wld_InsertNpc(Ancient_Warrior_02,"NW_TROLLAREA_PORTALTEMPEL_40");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"NW_TROLLAREA_PORTALTEMPEL_STUDY_04");
};

func void DIA_Vatras_JarCurse_No()
{
	AI_Output(other,self,"DIA_Vatras_JarCurse_No_01_01");	//Promiň, ale nemám na to teď čas.
	AI_Output(self,other,"DIA_Vatras_JarCurse_No_01_02");	//Škoda...(Zklamaně) Ale aspoň jsi mě vyslyšel.
	AI_StopProcessInfos(self);
};

instance DIA_Vatras_JarCurseDone(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 1;
	condition = DIA_Vatras_JarCurseDone_condition;
	information = DIA_Vatras_JarCurseDone_info;
	permanent = FALSE;
	description = "Myxir se vrátil do města.";
};

func int DIA_Vatras_JarCurseDone_condition()
{
	if((MyxirSendSaturas == TRUE) && (Npc_IsDead(KDW_140300_Addon_Myxir_CITY) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_JarCurseDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_01");	//Myxir se vrátil do města.
	AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_02");	//Ano, já vím. Všechno mi povědel.
	AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_03");	//Doufám, že už jsi byl za Saturasem.

	if(MeetSaturasOkPortal == TRUE)
	{
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_04");	//Samozřejmě.
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_05");	//Takže jsou naživu...
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_06");	//Díky za pomoc s Myxirem.
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_07");	//Ještě ne.
		AI_Output(self,other,"DIA_Vatras_JarCurseDone_01_08");	//Tak to okamžitě udělej!
		AI_Output(other,self,"DIA_Vatras_JarCurseDone_01_09");	//Ok, ok. Už jdu.
	};
};

instance DIA_Vatras_MAXROBE(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_condition;
	information = DIA_Vatras_MAXROBE_info;
	permanent = FALSE;
	description = "A co takhle lepší roucho?";
};

func int DIA_Vatras_MAXROBE_condition()
{
	if((hero.guild == GIL_KDW) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDW == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Vatras_MAXROBE_01_00");	//A co takhle lepší roucho?
	AI_Output(self,other,"DIA_Vatras_MAXROBE_01_01");	//Protože ovládáš všech šest kruhů magie, zasloužíš si nosit roucho arcimága Vody!
	AI_Output(self,other,"DIA_Vatras_MAXROBE_01_02");	//Ale musíš si za něj zaplatit, jeho výroba je příliš drahá.
	AI_Output(other,self,"DIA_Vatras_MAXROBE_01_03");	//Aha.
	LastRobeKDW = TRUE;
};

instance DIA_Vatras_MAXROBE_Buy(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_MAXROBE_Buy_condition;
	information = DIA_Vatras_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Koupit roucho arcimága Vody! (cena: 20000 zlatých)";
};

func int DIA_Vatras_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDW) && (LastRobeKDW == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Vatras_MAXROBE_Buy_01_00");	//Koupit roucho arcimága Vody!

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_01");	//Výborně! Ať ti slouží.
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_02");	//Ne každý má tu čest nosit tohle roucho. Pamatuj si to!
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_MAXROBE_Buy_01_03");	//Nemáš dost zlata!
	};
};

instance DIA_Vatras_WolfAndMan(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 2;
	condition = DIA_Vatras_WolfAndMan_condition;
	information = DIA_Vatras_WolfAndMan_info;
	permanent = FALSE;
	description = "Mám pro tebe velmi neobyčejný případ.";
};

func int DIA_Vatras_WolfAndMan_condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (SagittaWereWolf == TRUE) && (WereWolfIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WolfAndMan_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_00");	//Mám pro tebe velmi neobyčejný případ.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_01");	//Poslouchám.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_02");	//Jeden člověk by skutočně potřeboval tvou pomoc! Teda není to přesně člověk...
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_03");	//Hovoříš v hádankách synu.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_04");	//No, je to muž, ale má tělo zvířete!
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_05");	//Používal kouzlo proměny, ale nezvládl se proměnit zpět.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_06");	//A ty chceš abych ti pomohol proměnit ho zpět.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_07");	//Ano!
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_08");	//Promiň, nechci tě zklamat, ale myslím, že tady už nikdo nepomůže.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_09");	//Takovéhle věci jdou mimo nás. Ani nejsilnější mágové světa by mu nedokázali pomoct.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_10");	//Jediné, co jsem schopen udělat je navrátit mu jeho lidské vědomí.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_11");	//Zůstane v těle zvířete, ale bude myslet a hovořit jako člověk.
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_12");	//Tak udělej aspoň to.
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_13");	//Počkej chvíli...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_14");	//Tady, vezmi si tenhle svitek a použij ho na to zvíře.
	B_GiveInvItems(self,other,ItWr_VatrasTransferMagic,1);
	AI_Output(self,other,"DIA_Vatras_WolfAndMan_01_15");	//Ale nechtěj po mě nic víc...
	AI_Output(other,self,"DIA_Vatras_WolfAndMan_01_16");	//Rozumím.
	VatrasGiveSpell = TRUE;
	B_LogEntry(TOPIC_WolfAndMan,"Vatras je schopný vrátit Ignazovu asistentovi alespoň jeho lidské vědomí. Dal mi magický svitek, který mám použít na stínovou šelmu.");
};

instance DIA_ADDON_VATRAS_WISP(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Mohol by si mi pomocť v mojom hladaní?";
};

func int dia_addon_vatras_wisp_condition()
{
	if(MIS_Vatras_FindTheBanditTrader != FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Mohol by si mi pomocť v mojom hladaní?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//Si velmi neodbytný chlapče. Ale skutočne ti možem dať niečo, čo by ti malo pomocť s tvojou úlohou.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//Dám ti tento amulet. Budeš ho potrebovať.
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//Toto je amulet hladacej bludičky.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//Velmi vzácna vec! Bludička, čo žije v tomto amulete má špeciálne schopnosti.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//Pomože ti v hladaní vecí, čo by si bez nej nenašiel.
	//AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//Chtoby vyzvat' ogon'ka, prosto naden' amulet.
	//AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//Yesli ogonek poteryayet svoyu silu ili poteryayetsya, snimi amulet i naden' yego snova, i ogonek vernetsya.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Nechaj si ho, nikdy ťa nezklame.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Vďaka. Určite ho využijem.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"A čo ešte tá bludička dokáže?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Hladať bludičku v amulete?",dia_addon_vatras_wisp_amulett);
	SC_GotWisp = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Vďaka. Určite ho využijem.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//A čo ešte tá bludička dokáže?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//Myslím, že Riordian vie ako tieto veci trénovať. Je to jeden z nás a práve cestuje zo Saturasom.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Možno ti povie viac.
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//Hladacia bludička v amulete?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Hladacie bludičky sú úžasné tvory. Sú celé tvorené magickou energiou.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//Sú spojené s magickou rudou tohto sveta. Dáva im silu.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//Neprekvapuje ma, že si o nich ešte nepočul. Ukazujú sa iba luďom, čo majú zo sebou magickú rudu.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Bludičky boli silou vypudené zo svojich zemí.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//Nemožeme týmto nešťastným tvorom pomocť. Mal by si sa od nich držať ďalej.
};

var int VatrasInspectRing;
var int VatrasInspectScroll;

instance DIA_Addon_Vatras_DarkWeb(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Info;
	permanent = FALSE;
	description = "Mohol by si sa pozrieť na tento prsteň?";
};

func int DIA_Addon_Vatras_DarkWeb_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_HasItems(hero,ItMi_LotarRing) >= 1) && (FindLotarRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_01");	//Mohol by si sa pozrieť na tento prsteň?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_02");	//Samozrejme. Ukáž ho sem.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_03");	//Tu je.
	B_GiveInvItems(other,self,ItMi_LotarRing,1);
	Npc_RemoveInvItems(self,ItMi_LotarRing,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_04");	//Na pohled vyzerá ako obyčajný strieborný prsteň. Aj keď...
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_05");	//Vidíš tú slabú magickú auru, ktorá z neho vyžaruje? Pravdepodobne následok nejakej mágie, čo naň posobila.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_06");	//A pokial dokážem povedať, vcelku silná! Iba ona by dokázala nechať magický otlačok na tomto prsteni.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_01_07");	//A čo to je za mágiu?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_01_08");	//Ešte neviem. Potrebujem čas na preštudovanie všetkých možností. Nechaj mi ho a vráť sa zajtra.
	VatrasInspectRing = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb,"Vatras potrebuje na preskúmanie prsteňa viac Času. Mám sa vrátiť zajtra.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Done(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Done_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Done_Info;
	permanent = FALSE;
	description = "Zistil si niečo?";
};

func int DIA_Addon_Vatras_DarkWeb_Done_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb) == TRUE) && (VatrasInspectRing < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_01");	//Zistil si niečo?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_02");	//Dokonca viac ako som dúfal. Ale najprv mám pre teba jedno otázočku - a síce, odkial ten prsteň máš?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_03");	//Patril paladinovi Lotharovi ktorý bol nedávno zabitý. Našiel som ho kúsok od miesta činu.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_04");	//Tak to vysvetluje mnoho. Táto mágia nie je nič iné ako Beliarova čierna mágia.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_05");	//A taká silná, že už samotný kontakt s ňou je nebezpečný. Ten kto ju použil je pravdepodobne silný mág.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_06");	//Čokolvek čo by ti pomohlo ho nájšt?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_07");	//Čo máš za lubom?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_08");	//Lord Hagen by chcel vrahovu hlavu na striebornom podnose a nezastaví sa pred ničím, kým ju nedostane.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_09");	//Uvedomuješ si vobec čomu sa budeš musieť postaviť?
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_10");	//Úplne. Takže mi pomožeš?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Done_01_11");	//Dobre. Ale na to budem potrebovať nejakú vec, ktorá tomu mágovi patrila. Bez toho budú všetky moje pokusy zistiť jeho polohu zbytočné.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Done_01_12");	//Skúsim niečo nájsť.

	B_LogEntry(TOPIC_DarkWeb,"Magický otlačok na prsteni očividne zanechal nejaký mocný mág. Aby sme ho našli Vatras potebuje nejakú jeho vec alebo aspoň vec, ktorej sa ten mág dotkol.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Wait(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Wait_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Wait_Info;
	permanent = FALSE;
	description = "Mám magický zvitok, ktorý Lotharov vrah použil.";
};

func int DIA_Addon_Vatras_DarkWeb_Wait_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb_Done) == TRUE) && (Npc_HasItems(hero,ItMi_DarkScroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Wait_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Wait_01_01");	//Mám magický zvitok, ktorý Lotharov vrah použil. Bude to stačiť?
	B_GiveInvItems(other,self,ItMi_DarkScroll,1);
	Npc_RemoveInvItems(self,ItMi_DarkScroll,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_02");	//Už teraz z neho cítim jeho mágiu.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_03");	//Teraz sa musím pripraviť. Ty si zatial odpočiň.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Wait_01_04");	//Nebude to trvať viac ako deň.
	VatrasInspectScroll = Wld_GetDay();
	B_LogEntry(TOPIC_DarkWeb,"Dal som magický zvitok Vatrasovi. Teraz musím len počkať kým sa Vatras pripraví. Takže zajtra.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Vatras_DarkWeb_Ready(C_Info)
{
	npc = VLK_439_Vatras;
	nr = 3;
	condition = DIA_Addon_Vatras_DarkWeb_Ready_Condition;
	information = DIA_Addon_Vatras_DarkWeb_Ready_Info;
	permanent = FALSE;
	description = "Prípravy hotové?";
};

func int DIA_Addon_Vatras_DarkWeb_Ready_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_DarkWeb == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Addon_Vatras_DarkWeb_Wait) == TRUE) && (VatrasInspectScroll < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_DarkWeb_Ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Ready_01_01");	//Prípravy hotové?
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_02");	//Áno. Zober si túto magickú runu.
	B_GiveInvItems(self,other,ItMi_Darktransfer,1);
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_03");	//Použi ju a prenesie ťa na miesto, kde nájdeš odpovede na svoje otázky.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_04");	//Ale byť tebou sa predtým poriadne pripravím. To čo ťa tam bude čakať može byť nad tvoje sily.
	AI_Output(other,self,"DIA_Addon_Vatras_DarkWeb_Ready_01_05");	//Vďaka.
	AI_Output(self,other,"DIA_Addon_Vatras_DarkWeb_Ready_01_06");	//Nech ťa Adanos ochraňuje.
	B_LogEntry(TOPIC_DarkWeb,"Vatras mi dal runu, ktorá ma vezme za Lotharovým vrahom. Mal by som sa poriadne pripraviť než sa tam vydám.");
	AI_StopProcessInfos(self);
};