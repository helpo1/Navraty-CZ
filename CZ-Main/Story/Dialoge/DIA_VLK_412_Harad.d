/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Harad_SellBlades_Info - upraveny výpisy

*/




instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

var int FirstTalkHarad;

instance DIA_Harad_NoTalkAtAll(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_NoTalkAtAll_Condition;
	information = DIA_Harad_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_NoTalkAtAll_Info()
{
	if(FirstTalkHarad == FALSE)
	{
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_00");	//(přísně) Hej, co tady děláš?
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_01");	//Tady nemáš co dělat! Vypadni odsud!
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_02");	//Už tě tady nechci vidět!
		FirstTalkHarad = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_03");	//Řekl jsem, vypadni!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Harad_Hallo(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(nevrle) Co chceš?
};

instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "Hledám práci.";
};

func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Hledám práci.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - hodil by se mi nový učedník.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian brzy dokončí své učení a potom opustí město.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Umíš něco?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Jestli máš na mysli kovářství...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Ne, to jsem zrovna nemyslel.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Dřív nebo později skřeti celé tohle město obklíčí a pak budou něco platní pouze ti, kteří ho dokáží ubránit.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//A já si do učení nevezmu žádného budižkničemu, který při první známce potíží uteče z města se ženami a ostatními poseroutky, místo aby zůstal tady a bránil pevnost.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Pokud se mi podaří přesvědčit Harada, že nejsem žádný budižkničemu, přijme mě za svého učně.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "Já nejsem žádný budižkničemu!";
};

func int DIA_Harad_Taugenichts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Já nejsem žádný budižkničemu!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//To jsou silná slova! Můžeš to ale podložit i nějakými skutky?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//A to jakými?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Přines mi nějakou skřetí zbraň.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Skřeti už byli zpozorováni přímo u města, takže s trochou štěstí nebudeš hledat dlouho.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Jestli se ti povede nějakého skolit, pak tě přijmu do učení.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Pokud s tím tedy budou souhlasit i ostatní mistři.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"Za městem se usadil skřet, kterého mám na prosbu kováře Harada zabít. Jako důkaz mu postačí jakákoliv skřetí zbraň.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "Promluvme si ještě o té skřetí věci...";
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Promluvme si ještě o té skřetí věci...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(stroze) Co?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"Tvůj skřet už je teď mrtvý!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"Ale skřet je zatraceně tuhý protivník...",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Ale skřet je zatraceně tuhý protivník...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - jak tak na tebe koukám, možná máš pravdu. Jsi fakt docela vyžle, ale to se může změnit.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Stejně mi musíš dokázat, že se nebojíš bojovat.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//Takže by to mohlo být něco menšího?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (přemýšlí) Hakon, co na tržišti obchoduje se zbraněmi, se mi svěřil, že ho před pár dny přepadli banditi.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Prý se potulují někde za jižní branou.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Ti zbabělí lupiči nejspíš moc rozumu nepobrali.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Tak je všechny pochytej - až do posledního! Tak mi dokážeš, že nám tady ve městě snad přece jen budeš něco platný.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);

	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi řekl, že nějací banditi okradli za městem kupce Hakona. Jestli se mi je podaří dostihnout, přesvědčím ho, že za něco stojím. Měl bych si tedy promluvit s Hakonem - snad bude spíš vědět, kde se ti banditi potloukají.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"Harad mi řekl, že nějací banditi okradli za městem kupce Hakona. Jestli se mi je podaří dostihnout, přesvědčím ho, že za něco stojím.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Tvůj skřet už je teď mrtvý!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Dobře! Tak teď přestaň plýtvat dechem a koukej, ať za tebe mluví činy.
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "Získal jsem tu skřetí zbraň, jak jsi chtěl.";
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if((Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0) || (Npc_HasItems(other,itmw_addon_keule_1h_03) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Získal jsem tu skřetí zbraň, jak jsi chtěl.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Ukaž...

	if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_04,1);
	}
	else if(Npc_HasItems(other,itmw_addon_keule_1h_03) > 0)
	{
		B_GiveInvItems(other,self,itmw_addon_keule_1h_03,1);
		Npc_RemoveInvItems(self,itmw_addon_keule_1h_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_04,1);
	};

	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Tak tys to PŘECE dokázal! Tos tedy fakt dobrý!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Takovou zbraň už jsem neměl v ruce, ani nepamatuju - naposledy, když jsem sloužil jako voják ve skřetí válce.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//To byly krušné časy, to ti povím.

	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Já věděl, že udělám dobře, když tě přijmu do učení. Skvělá práce!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Nevěřil jsem, že to zvládneš. Je to obdivuhodné.
		B_LogEntry(TOPIC_Lehrling,"Harad dal souhlas k mému učení.");
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Škoda že ses rozhodl pro jinou dráhu.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Opravdu bych tu pro tebe našel uplatnění.
	};

	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
};

instance DIA_Harad_OrcWar(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Condition;
	information = DIA_Harad_OrcWar_Info;
	permanent = FALSE;
	description = "Říkal jsi, že jsi byl ve válce se skřety.";
};

func int DIA_Harad_OrcWar_Condition()
{
	if(MIS_Harad_Orc == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcWar_01_00");	//Říkal jsi, že jsi byl ve válce se skřety.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_01");	//Bylo to už dávno... (zamyšleně) Byl jsem ještě kluk jako ty.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_02");	//Možná bys mi mohl říct něco víc?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_03");	//(vážně) Chceš to slyšet? No, dobře.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_04");	//...(kašle) Sloužil jsem v královské armádě a střežil horský průsmyk vedoucí z Nordmaru v Myrtaně.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_05");	//Skřetí útoky pro nás byly zcela běžné.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_06");	//To je pochopitelné. Koneckonců, průsmyk byl nesmírně důležitým strategickým bodem.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_07");	//Otevíral průchod nejen do Myrtany, ale také do hlavního města království - Vengard!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_08");	//Z tohoto důvodu skřeti podnikali opakované pokusy o vyhnání nás z pevnosti.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_09");	//Zdá se, že se jim to nepodařilo...
	AI_Output(self,other,"DIA_Harad_OrcWar_01_10");	//Ano, máš pravdu... (smích) Všechno se to v podstatě scvrkáválo na drobné potyčky na okraji průsmyku.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_11");	//To trvalo velmi dlouhou dobu... (zamyšleně) Až na rozhodující okamžik!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_12");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_13");	//Mluvím o bitvě, která je známá po celém světě jako - 'Bitva o sněžnou horu'.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_14");	//Měl jsem možnost účastnit se jí, a právě tam se ze mě stal opravdový muž!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_15");	//Řekni mi. Jaké to bylo.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_16");	//Bylo to peklo, člověče... (vážně) Skřeti byli dobře připraveni k boji!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_17");	//Stáli jsme proti alespoň dvou tisícům skřetů.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_18");	//A oporou jejich armád byli elitní černí skřeti, to je vzácnost.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_19");	//První dva dny jsme byli pod palbou jejich obrovských katapultů. A za úsvitu třetího dne zaútočili!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_20");	//Nebudu ti popisovat hrůzy boje, ale přežili jsme jen díky naší odvaze a statečnosti.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_21");	//Hmmm... (kašel) Malá četa paladinů nám přišla na pomoc.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_22");	//S jejich pomocí jsme večer byli schopni zatlačit skřety přicházející z Nordmaru.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_23");	//A tak skončila tato velká bitva!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_24");	//Protože jsem měl jen můj meč, kterým jsem bojoval celý tento den.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_25");	//Nechal jsem jsi ho jako připomínku toho, již je zapotřebí odvahy a statečnosti lidí!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_26");	//A co je to za meč?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_27");	//Dal jsem mu jméno - 'Skřetobij'! Hodný svého jména.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_28");	//Zabil jsem s ním tak tucet skřetů...
	AI_Output(self,other,"DIA_Harad_OrcWar_01_29");	//Ještě jsou na něm skvrny zaschlé krve skřetů.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_30");	//Působivé! A nechceš ho náhodou prodat?
	AI_Output(other,self,"DIA_Harad_OrcWar_01_31");	//Nebylo by na škodu mít po ruce legendární zbraň.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_32");	//Ne! Říkal jsem ti, že není na prodej. Ani ve snu!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_33");	//Ale pokud ho opravdu chceš, přines mi amulet skřetího válečníka.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_34");	//Pak budu vědět, že můj meč dostal odvážný a statečný chlap!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_35");	//Jaký to je amulet?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_36");	//Obvykle ho nosí skřetí elitní válečníci. Tím se odlišují od zbytku válečníků.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_37");	//Získej ho! A pak dostaneš odměnu.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_38");	//Dobře, zkusím to.
	MIS_HaradOrcWar = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrcWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_Running);
	B_LogEntry(TOPIC_HaradOrcWar,"Harad mi řekl o památné bitvě se skřety, která se konala na zasněženém horském průsmyku mezi Nordmarem a Myrtanou. Bojoval v ní a zabil mnoho skřetů. Jako vzpomínku na tuto bitvu si stále uchovává svůj meč, kterým bojoval v ten osudný den a nazval ho Skřetobij. Když mu přinesu amulet elitného skřetího válečníka, je ochotný mi svůj meč dát.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcElite_Roam_Harad,"NW_FOREST_PATH_12");
};

instance DIA_Harad_OrcWar_Done(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Done_Condition;
	information = DIA_Harad_OrcWar_Done_Info;
	permanent = FALSE;
	description = "Přinesl jsem ti amulet elitní skřeta.";
};

func int DIA_Harad_OrcWar_Done_Condition()
{
	if((MIS_HaradOrcWar == LOG_Running) && (Npc_HasItems(other,ItMi_BlackOrcTalisman) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_00");	//Přinesl jsem ti amulet elitního skřeta.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_01");	//Opravdu?! Neuvěřím, dokud ho neuvidím na vlastní oči.
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_02");	//Tady, podívej se.
	B_GiveInvItems(other,self,ItMi_BlackOrcTalisman,1);
	Npc_RemoveInvItems(self,ItMi_BlackOrcTalisman,1);
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_03");	//(dívá se) Jo, člověče zdá se, že je to on...
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_04");	//I když... je to už mnoho let... ale ano, je to on!
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_05");	//No, vidíš? Já bych ti nelhal.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_06");	//Dobře, dobře... (respekt) Odpusť starému muži... Jsem na tebe hrdý!
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_07");	//Jen pár lidí v dnešní době je schopno se vypořádat s elitním skřetem. Ale ty jsi to dokázal!
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_08");	//A proto, tady je můj starý meč! Nyní je tvůj...
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_09");	//Děkuji.
	B_GiveInvItems(self,other,ITMW_1H_SWORD_ORCSLAYER_01,1);
	MIS_HaradOrcWar = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_HaradOrcWar,"Donesl jsem Haradovi amulet elitního skřeta a on, jak slíbil, mi dal svůj meč.");
};

var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "Kdy můžu jako tvůj učedník začít?";
};


func int DIA_Harad_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Kdy můžu jako tvůj učedník začít?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Chlap, který dokáže skolit skřeta, se nám opravdu hodí.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Krom toho se mi Hakon pochlubil, jak statečně ses vypořádal s bandity. To tě šlechtí!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Sice jsi nezabil žádného skřeta, ale Hakon se chlubil, jak skvěle ses vypořádal s bandity. To tě šlechtí!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Co se mě týče, můžeš začít třeba hned.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//A co se týče ostatních mistrů...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben ti dal své požehnání.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Starý dobrý Thorben by byl rád, kdyby sis napřed vyprosil boží požehnání. Myslím, že to je dobrý nápad.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben prý s tebou ještě nikdy nemluvil.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper se mi to snažil vymluvit - chce tě totiž za učedníka sám.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Měl jsem s ním na tohle téma krátkou, ale ostrou diskusi.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//Nakonec souhlasil.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Požádal mě, zda bych mu nedovolil, aby ti mohl svou profesi aspoň představit.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Takže si to omrkni - potom se můžeš vždycky rozhodnout. Tedy leda že bys nechtěl jeho hlas, samozřejmě.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//A Bosper tě zatím vůbec nezná.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Constantinovi je jako vždycky všecko jedno. Co se jeho týče, tak prý můžeš začít, u koho chceš.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino tvrdí, žes tady ve městě spáchal nějaký zločin - je to pravda?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Jestli jo, tak bys to měl jít okamžitě napravit!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino o tobě ještě nikdy neslyšel.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//A Matteo hlásí, žes mu vrátil jeho zlato. Zdá se mi, že jsi opravdu čestný muž.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//A Matteo hlásí, že mu ještě pořád něco dlužíš. Nevím, co mezi sebou máte, ale měl bys to dát rychle do pořádku.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//A Matteo prý s tebou na tohle téma ještě vůbec nemluvil.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//A Matteo tě prý ve svém krámku ještě neviděl.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//To znamená, žes získal doporučení ode všech mistrů!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//To znamená, žes získal doporučení od čtyř mistrů. Což pro přijetí do učení stačí.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Chceš tedy vstoupit do učení ke mně?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"No, měl bych si to promyslet.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"Jdu do toho",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Potřebuješ doporučení alespoň od čtyř mistrů, jinak tě nikdo v dolní čtvrti do učení nepřijme.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Měl by sis proto promluvit se všemi, které jsi ještě nepřesvědčil.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Dokud mi nedokážeš, že nejsi úplný budižkničemu, nemáš šanci.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	var int temp1;
	temp1 = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Jdu do toho!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Výborně! A teď tě naučím, jak vykovat pěkný meč.

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//To už umím!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//No tak tím líp!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Krom toho bys měl taky trochu posilovat. Vždyť se mi úplně ztrácíš před očima!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04A");	//Jako můj žák dostaneš lekce zadarmo.
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00A");	//Dobrá...
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,10);
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04B");	//Hmm, tvá síla se zvýšila.
	};
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04C");	//Na, zde máš příhodnější oblečení pro práci.
	B_GiveInvItems(self,other,itar_smith_nov,1);
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04D");	//A tohle kladivo máš jako nástroj.
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_04,1);
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04E");	//No, a pár kousků oceli. Ze začátku to bude stačit.
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	CreateInvItems(VLK_407_Hakon,itmiswordblade_1,2);
	CreateInvItems(hero,ItMiSwordraw,5);
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Harad mě přijal za učedníka. Teď mám přístup do horní čtvrti města.");
	B_LogEntry(Topic_Bonus,"Harad za dobrou cenu odkoupí zbraně, které vykovám.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"Harad mě vyučí kovářskému umění a také se s jeho pomocí mohu stát silnějším.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Dobře - rozmyslím si to.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Žádný spěch, Brian tu ještě nějakou dobu zůstane.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_Zustimmung(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Zustimmung_Condition;
	information = DIA_Harad_Zustimmung_Info;
	permanent = TRUE;
	description = "Mohu se zapsat do učení k některému z ostatních mistrů?";
};

func int DIA_Harad_Zustimmung_Condition()
{
	if((Player_IsApprentice == APP_NONE) && Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (DIA_Harad_Zustimmung_Permanent == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Harad_Zustimmung_Permanent;

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Mohu se zapsat do učení k některému z ostatních mistrů?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Jsi dobrý člověk.

		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon mi líčil, jak ses vypořádal s bandity.
		};

		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Dám ti své doporučení.

		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
			B_LogEntry(TOPIC_Lehrling,"Harad mě doporučí, pokud se budu chtít stát učedníkem někde jinde.");
		};

		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian tu ještě nějakou dobu pobude. A časem jistě najdu jiného siláka, který ho zastoupí.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Ostatní mistři ti své svolení klidně dát mohou, ale já tě nedoporučím, dokud mě nepřesvědčíš, že nejsi jenom neschopné jelito!
	};
};


var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;
var int Harad_KDWKommentar;
var int Harad_SEKKommentar;
var int Harad_KDMKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Harad_StartGuild != GIL_MIL) && (Harad_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Takže tys vstoupil do řad domobrany? Jsem na tebe hrdý!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Během služby v armádě nejspíš nebudeš moci zároveň plnit své učednické povinnosti. Ani to od tebe nečekám.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Ale když budeš něco potřebovat, klidně přijď.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Koukám, že ses dokázal dostat mezi paladiny!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Jsem rád, že jsem tě přijal do učení. I když jsi za kovadlinou zrovna moc času nestrávil.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Takže tys vstoupil do kláštera. Já osobně bych byl radši, kdybys zůstal ve městě. Potřebujeme každého muže.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Ale když tě Innos povolal, asi to tak má být.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Když budeš něco potřebovat, jsem ti vždycky k dispozici.
		Harad_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Harad_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_10");	//Och, ty jsi se dal na cestu mága jako Vatras! Jen neber kladivo do ruky v tomhle rouchu, jinak umřu smíchy.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_11");	//Ok. Je to tvoja volba. Volba mého studenta!
		Harad_KDWKommentar = TRUE;
	}
	else if((Harad_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_12");	//Takže si podlehl kouzlu drogy z bažin? Jo, silné tělo nemusí vždy znamenať i silného ducha.

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Harad_AlsLehrling_12_13");	//Jsi ve zbroji a s mečem. To mi dělá radost. Takže jsi navázal na kovářské řemeslo.
		};

		Harad_SEKKommentar = TRUE;
	}
	else if((Harad_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_14");	//Mně, veteránu války se skřety, rmoutí když vím, že jsi na straně protivníka a že meč co vykuješ bude namířen proti služebníkům Innose.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_15");	//Ale život máš jen jeden a sám se musíš rozhodnout jak ho prožiješ. Nebudu marně naříkat. 
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_16");	//A litovat, že jsem tě naučil kovářství také nebudu. Co se stalo, stalo se a co přijde, to přijde.
		Harad_KDMKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Už ses tu hezkou dobu neukázal. Kdepak ses toulal, co?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Tak tě tu máme zas.
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

instance DIA_Harad_Romantic(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Romantic_Condition;
	information = DIA_Harad_Romantic_Info;
	permanent = FALSE;
	description = "Je ještě něco na co bych se chtěl zeptat...";
};

func int DIA_Harad_Romantic_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Romantic_Info()
{
	AI_Output(other,self,"DIA_Harad_Romantic_01_00");	//Je ještě něco na co bych se chtěl zeptat...
	AI_Output(self,other,"DIA_Harad_Romantic_01_01");	//Ano?
	AI_Output(other,self,"DIA_Harad_Romantic_01_02");	//Celý den tvrdě pracuješ.
	AI_Output(self,other,"DIA_Harad_Romantic_01_03");	//No, no...
	AI_Output(other,self,"DIA_Harad_Romantic_01_04");	//Existuje alespoň nějaká romantika v kovářské profesi?
	AI_Output(self,other,"DIA_Harad_Romantic_01_05");	//Romantika?! (zamyšleně) Heh, no, tak to jsi mě opravdu zaskočil. Romantika...
	AI_Output(other,self,"DIA_Harad_Romantic_01_06");	//Znamená to, že ne.
	AI_Output(self,other,"DIA_Harad_Romantic_01_07");	//No, mušlema pokryté pobřeží a mořské pany s krásnýma prsama, ovšem. Věčně rozpálený hrnek od horka, mozoly od kladiva a zvonění v uších- to je veškerá romantika.
	AI_Output(self,other,"DIA_Harad_Romantic_01_08");	//No kováři jsou silní chlapi a dívky milují silné chlapy.
	AI_Output(other,self,"DIA_Harad_Romantic_01_09");	//Nemluvím o tělesných rozkoších, já mluvím o...
	AI_Output(self,other,"DIA_Harad_Romantic_01_10");	//Nic jiného není. Naše řemeslo je takové jaké je. Není pro žádné usmrkance!
	AI_Output(other,self,"DIA_Harad_Romantic_01_11");	//Zřejmě.
	AI_Output(self,other,"DIA_Harad_Romantic_01_12");	//Ach ano! Kováři mají ještě svoje motto! Já ti to neřekl?
	AI_Output(other,self,"DIA_Harad_Romantic_01_13");	//Ne.
	AI_Output(self,other,"DIA_Harad_Romantic_01_14");	//Nekováš, tak jsi bez peněz a cti.
	AI_Output(other,self,"DIA_Harad_Romantic_01_15");	//Zábavné.
	AI_Output(self,other,"DIA_Harad_Romantic_01_16");	//Stejně jako beznaděj odrazuje, ale zároveň dává naději.
	AI_Output(self,other,"DIA_Harad_Romantic_01_17");	//Dobře. A teď už musím do práce.
	AI_Output(other,self,"DIA_Harad_Romantic_01_18");	//I já musím jít.
	AI_StopProcessInfos(self);
};

instance DIA_Harad_Waffen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Waffen_Info;
	permanent = FALSE;
	description = "Prodáváš také zbraně?";
};


func int DIA_Harad_Waffen_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Prodáváš také zbraně?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Na to zapomeň. Všechno, co vyrobím, si berou paladinové nebo domobrana.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//Od lorda Hagena jsem dostal zakázku na 100 mečů - chce s nimi vybavit městskou stráž.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "Jaké mám jako učedník povinnosti?";
};


func int DIA_Harad_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Jaké mám jako učedník povinnosti?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Celkem tři.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Kovat, kovat a kovat?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Nejsi tak hloupý, jak vypadáš. Za každý meč ti zaplatím - takže když se budeš flákat, žádné penízky se neposypou. Jak prosté.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Krom toho tě můžu naučit, jak vyrobit prostý meč.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Magické meče mohou vyrábět pouze zkušení kováři - a k tomu máš ještě hodně daleko...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Jestli potřebuješ nocleh, můžeš se uložit někde v mém domě. Už je ti všechno jasné?
};

var int HaradBuyMiscWeap;

instance DIA_Harad_MiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_MiscWeap_Condition;
	information = DIA_Harad_MiscWeap_Info;
	permanent = FALSE;
	description = "Co kromě vykovaných zbraní ti ještě mohu prodat?";
};

func int DIA_Harad_MiscWeap_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Harad_MiscWeap_Info()
{
	AI_Output(other,self,"DIA_Harad_MiscWeap_01_00");	//Co kromě vykovaných zbraní ti ještě mohu prodat?
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_01");	//Pokud najdeš staré rezavé meče, pak je přines ke mně.
	AI_Output(other,self,"DIA_Harad_MiscWeap_01_02");	//Proč?
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_03");	//Tuto zbraň i tak draze neprodáš, ale dá se z něj ještě použít ocel.
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_04");	//Koneckonců, ocel měla vždy svojí cenu. Zejména s ohledem na současný stav věcí.
	B_LogEntry(TOPIC_CityTrader,"Harad kupuje rezavé zbraně.");
	HaradBuyMiscWeap = TRUE;
};


instance DIA_Harad_HaradBuyMiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_HaradBuyMiscWeap_Condition;
	information = DIA_Harad_HaradBuyMiscWeap_Info;
	permanent = TRUE;
	description = "Přinesl jsem ti zrezivělé zbraně.";
};

func int DIA_Harad_HaradBuyMiscWeap_Condition()
{
	if((HaradBuyMiscWeap == TRUE) && ((Npc_HasItems(other,ItMw_1h_MISC_Sword) >= 1) || (Npc_HasItems(other,ITMW_1H_MISC_GSWORD) >= 1) || (Npc_HasItems(other,ItMw_1h_Misc_Axe) >= 1) || (Npc_HasItems(other,ItMw_2H_Sword_M_01) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Harad_HaradBuyMiscWeap_Info()
{
	var C_Item EquipWeap;
	var int misc_01;
	var int misc_02;
	var int misc_03;
	var int misc_04;
	var int misc_all;
	var int price_all;

	price_all = 2;
	
	AI_Output(other,self,"DIA_Harad_HaradBuyMiscWeap_01_00");	//Přinesl jsem ti zrezivělé zbraně.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_01");	//Dobře!
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_02");	//Vzhledem na to, že nemají skoro žádnou cenu, dám ti přesně dvě zlaté za ostří.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_03");	//Tak se podívejme, co tady máš...

	misc_01 = Npc_HasItems(other,ItMw_1h_MISC_Sword);
	misc_02 = Npc_HasItems(other,ITMW_1H_MISC_GSWORD);
	misc_03 = Npc_HasItems(other,ItMw_1h_Misc_Axe);
	misc_04 = Npc_HasItems(other,ItMw_2H_Sword_M_01);
	misc_all = misc_01 + misc_02 + misc_03 + misc_04;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword,Npc_HasItems(hero,ItMw_1h_MISC_Sword));
	Npc_RemoveInvItems(hero,ITMW_1H_MISC_GSWORD,Npc_HasItems(hero,ITMW_1H_MISC_GSWORD));
	Npc_RemoveInvItems(hero,ItMw_1h_Misc_Axe,Npc_HasItems(hero,ItMw_1h_Misc_Axe));
	Npc_RemoveInvItems(hero,ItMw_2H_Sword_M_01,Npc_HasItems(hero,ItMw_2H_Sword_M_01));

	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_04");	//No, dobře.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_05");	//Vezmu si všechny! A tady je tvoje zlato.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all * price_all);
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_06");	//Pokud najdeš nějaké další, přines mi je.
};

instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "Chtěl bych prodat zbraně, co jsem vykoval!";
};

func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concatText;
	var int lohn;
	var int del_common;
	var int del_schwert1;
	var int del_schwert4;
	var int del_rubinklinge;
	var int del_elbastardo;

	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Chtěl bych prodat zbraně, co jsem vykoval.
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);

	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE)
	{
		if(anzahl_common > 1)
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		anzahl_common -= 1;
	};

	anzahl_schwert1 = Npc_HasItems(other,ItMw_Schwert1);

	if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE)
	{
		if(anzahl_schwert1 > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		};
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};

	anzahl_schwert4 = Npc_HasItems(other,ItMw_Schwert4);

	if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE)
	{
		if(anzahl_schwert4 > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		};
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};

	anzahl_rubinklinge = Npc_HasItems(other,ItMw_Rubinklinge);

	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE)
	{
		if(anzahl_rubinklinge > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		};
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};

	anzahl_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);

	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE)
	{
		if(anzahl_elbastardo > 1)
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		};
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};

	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;

	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Jedinou, kterou bych mohl přijmout, máš zrovna připnutou u pasu, a tu si radši nechej.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Tak nějaké vykovej! Přijímám pouze prosté meče.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Prima - dej to sem.
		if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		};
		// concatText = b_formgivestring(other,gesamt);
		concatText = ConcatStrings("Předáno ",IntToString(gesamt));
		concatText = ConcatStrings(concatText," předmětů");
		AI_Print(concatText);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Tak! Tady máš výplatu.
		lohn = (anzahl_common * 45) + (anzahl_schwert1 * 60) + (anzahl_schwert4 * 75) + (anzahl_rubinklinge * 90) + (anzahl_elbastardo * 135);
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Je to docela snadné, hochu. Stačí mít kousek surové oceli a podržet ji v ohni, dokud nezčervená.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Pak čepel na kovadlině náležitě vyklepeš.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "Nauč mě vykovat prostý meč!";
};

func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Nauč mě vykovat prostý meč!
		B_HaradSmithChoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//Pro dnešek jsem už s prací v kovárně skončil...
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_03");	//Přijď zítra ráno, pak si o tom můžeme promluvit.
	};
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Napoprvé to asi nebude žádný zázrak, ale všechno ostatní se časem taky naučíš.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = "Chci se stát silnějším!";
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Chci se stát silnějším.
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Už jsi zase o něco svalnatější.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Vrať se, až se budeš chtít dozvědět víc.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = "Ještě pořád pracuješ pro paladiny?";
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ještě pořád pracuješ pro paladiny?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Se službou u lorda Hagena jsem už skončil.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Teď pro něj vyrábím meče z magické rudy - ale tentokrát mi za ně platí.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Ale aspoň teď sem tam můžu bokem vyrobit pár zbraní, které poskytnu kupcům na tržišti.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Takže jestli hledáš dobrý meč, měl bys to zkusit u nich.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "Prozraď mi něco bližšího o břitech z magické rudy!";
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Prozraď mi něco bližšího o břitech z magické rudy!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Proces výroby magických břitů je velmi složitý a drahý, ale výsledkem je čepel, která se velmi dobře ovládá a je prakticky nezničitelná.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Meč je určitě velmi kvalitní, ale jeho skutečná moc se projeví teprve v rukou paladina.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Paladinský meč je zasvěcený Innosovi. Výsledkem je, že takto očarovaná zbraň je neskutečně účinná!
};

var int OreBladeBoughtOut;

instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "Chci si koupit meč z magické rudy.";
};

func int DIA_Harad_Erzklingen_Condition()
{
	if((OreBladeBought == FALSE) && (OreBladeBoughtOut == FALSE) && Npc_KnowsInfo(other,DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};
};

var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Chci si koupit meč z magické rudy.

	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Magické břity prodávám pouze paladinům, a to vždy pouze jeden kus.

		if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_NONE))
		{
			OreBladeBoughtOut = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Jako paladinové můžete být rádi, že můžete třímat tak skvělé zbraně.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Dle rozkazu lorda Hagena ti mohu prodat pouze jedinou magickou zbraň.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Takže co ti mohu nabídnout?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Prostý rudný obouruční meč (cena: 2000 zlatých)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Prostý rudný meč (cena: 2000 zlatých)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//Nemáš dost zlata.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Starej se o svou novou zbraň dobře. Je cennější než všechen tvůj majetek.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Vezmu si obouruční meč!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouruční meč (2000 zlatých)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoruční meč (2000 zlatých)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Jednoruční meč!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Obouruční meč (2000 zlatých)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Jednoruční meč (2000 zlatých)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Jsem kovář, ne zlatník. Budeš si tady ve městě muset najít někoho jiného, kdo ti pomůže.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Lidi mají jednu kapsu prázdnou a druhou vysypanou - už hezkou dobu tady nikdo nezbohatnul.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Většinou jsou rádi, že mají co do úst.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "Kde bych sehnal nějakého zlatníka?";
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Kde bych sehnal nějakého zlatníka?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Nějaký dobrý kovář se prý přidal k žoldákům na Onarově farmě.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Zkus se po něm poohlédnout tam.
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};


instance DIA_HARAD_ARMORCANTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorcanteach_condition;
	information = dia_harad_armorcanteach_info;
	permanent = TRUE;
	description = "Rozumíš kování zbrojí?";
};


func int dia_harad_armorcanteach_condition()
{
	if((HARAD_TEACHARMOR == FALSE) && (other.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_harad_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_00");	//Rozumíš kování zbrojí?
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_01");	//Ne, že jim rozumím! Já je vyrábím, dítě! Samozřejmě, ale jen paladinům a jen z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_03A");	//A taky jsem řekl, že je vyrábím pouze na zakázku lorda Hagena. A já jsem žádný rozkaz nedostal. Poslouchal jsi mě dobře?!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_04");	//Ale protože byste je měli dostat všichni - můžu ti ukázat, jak vylepšit zbroj, za použití magické rudy.
	AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_05");	//Magické rudy?!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_06");	//Jo, chlape, magické rudy. S její pomocí rytířská zbroj dostane opravdu kolosální trvanlivost a bude spolehlivě nesrovnatelná proti většině jiných zbrojí.
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_07");	//Ale rudná zbroj rytíře je to nejlepší, co jsem viděl!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_08");	//Ale abys takovou mohl udělat, musíš se NAUČIT ji udělat!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_09");	//Výrobní technika je velmi složitá a nedá se naučit koukáním přes rameno.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_10");	//I tak jsem připraven to vykovat!
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_11");	//O tom není pochyb...!
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_12");	//Je však třeba upozornit, že výroba takové zbroje vyjde velmi draho a ne všichni členové paladinského řádu jsou při velkých penězích... Mluvíme o astronomických výdajích...
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_14");	//Takže, jsme připraveni a až budeš chtít začít s tréninkem, přijď.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_15");	//A zdá se, že i ty!
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_16");	//Je však třeba upozornit, že výroba takové zbroje vyjde velmi draho a ne všichni členové paladinského řádu jsou při velkých penězích... Mluvíme o astronomických výdajích...
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_17");	//A to jsou velké náklady, věř mi dítě.
	};

	HARAD_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Harad mě může naučit, jak vylepšit paladinské zbroje.");
};

func void b_harad_teacharmor_1()
{
	AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_01");	//Dobrá, sleduj pozorně a uč se. Jestli něco spleteš, budeš muset začít znovu...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_02");	//... A tak! Pro začátek si ověř, jestli máš vše potřebné.
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_03");	//... Vezmi kousek magické rudy, rozžhav surovou ocel a zpracuj tyto dva kovy. Vznikne lepší materiál, než ze dvou stejných kovů.
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_04");	//... Dále přidej slitinu ve správném poměru, ale hlavně to nemíchej až nakonec!
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_05");	//... Poté pomocí formovacích desek udělej ze slitiny rudy a oceli pláty, které díky ocelovým úchytkám připevníš k povrchu již hotové zbroje.
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_06");	//... Tady tohle, vidíš jak to vypadá... (ukazuje)... Plát pevně sedí na zbroji a je s ní praktycky spojený.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_07");	//... To je vše. Nyní bys měl být schopný to vytvořit.
		HARADTELLSMARDUK_P1 = TRUE;
	};
};

func void b_harad_teacharmor_2()
{
	AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_01");	//Jestli se skutečně chopíš této možnosti, budeš moci vytvářet nejlepši zbroje světa.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_02");	//... Rožhav ocel, nech ji trošku vychladnout a rozlámej ji na kousky. Pak vyzkoušej, které by se ti hodily.
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_03");	//... Pak vem kus rudy a místo stejnorodé slitiny ocel-ocel vem roztavenou rudu a udělej slitinu ruda-ocel.
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_04");	//... Pak je třeba vytvořený plát pečlivě prokovat se zbytkem zbroje...
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_05");	//... a za druhé, konečná forma plátu, prokovaná s první částí zbroje je velmi důležitá...
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_06");	//... Tak tady... Vidíš... (ukazuje)... Posílí to trvanlivost kovu!
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_07");	//... Vyžaduje to trochu více úsilí.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_08");	//... Je to připravené! Zde je celé tajmeství. Teď už víš dost o výrobě těžké rudné zbroje paladina.
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_09");	//Už tě nemohu víc naučit. Doufám že znalosti co jsem ti předal ti pomohou s tvojím posláním.
		HARADTELLSMARDUK_P2 = TRUE;
	};
};

func void b_haradarmorchoices()
{
	Info_ClearChoices(dia_harad_armorteach);
	Info_AddChoice(dia_harad_armorteach,Dialog_Back,dia_harad_armorteach_back);

	if(PLAYER_TALENT_SMITH[15] == FALSE)
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx("Zbroj rytíře (cena: 3500 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_PAL_M_V1)),dia_harad_armorteach_itar_pal_m_v1);
	};
	if((PLAYER_TALENT_SMITH[16] == FALSE) && (SHOW_ITAR_PAL_H == TRUE))
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx("Zbroj paladina (cena: 5000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_PAL_H_V1)),dia_harad_armorteach_itar_pal_h_v1);
	};
};


instance DIA_HARAD_ARMORTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorteach_condition;
	information = dia_harad_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};


func int dia_harad_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (HARAD_TEACHARMOR == TRUE) && (other.guild == GIL_PAL))
	{
		if((PLAYER_TALENT_SMITH[16] == FALSE) || (PLAYER_TALENT_SMITH[15] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_armorteach_info()
{
	AI_Output(other,self,"DIA_Harad_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.

	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_01");	//Dobrá, snad můžeme začít...
		b_haradarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_02");	//Ale teď už bude večer!... (naštvaný)
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_03");	//Přijď ráno a začneme s tvým tréninkem.
	};
};

func void dia_harad_armorteach_back()
{
	Info_ClearChoices(dia_harad_armorteach);
};

func void dia_harad_armorteach_itar_pal_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3500);
			b_harad_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_TeachArmor_01_00");	//Ale vždyť nemáš dost zlata! Jak chceš zaplatit?!
	};
	b_haradarmorchoices();
};

func void dia_harad_armorteach_itar_pal_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_harad_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_TeachArmor_01_00");	//Ale vždyť nemáš dost zlata! Jak chceš zaplatit?!
	};
	b_haradarmorchoices();
};


instance DIA_HARAD_TELLSMARDUK(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_tellsmarduk_condition;
	information = dia_harad_tellsmarduk_info;
	permanent = FALSE;
	description = "Jak je možno vylepšit rudnou zbroj paladina?";
};


func int dia_harad_tellsmarduk_condition()
{
	if((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_tellsmarduk_info()
{
	AI_Output(other,self,"DIA_Harad_TellsMarduk_01_00");	//Jak je možno vylepšit rudnou zbroj paladina?
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_01");	//Já už ji vylepšit nedokážu, to by dokázali jen mí mistři v Nordmaru...
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_02");	//Ale slyšel jsem, že mágové Ohně dokážou posvětit rudu a tím jí dají božskou podstatu. Něco jako posvěcení rudného meče.
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_03");	//Samozřejmě to jsou jen kecy - ale kdo ví, kdo ví...
	Log_CreateTopic(TOPIC_MAGICINNOSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MAGICINNOSARMOR,LOG_Running);
	B_LogEntry(TOPIC_MAGICINNOSARMOR,"Harad mi řekl, že mágové Ohně by byli schopni rudě na mé zbroji dát božskou podstatu a to jejím posvěcením...");
};


instance DIA_HARAD_SARAHELPSTHREE(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = dia_harad_sarahelpsthree_condition;
	information = dia_harad_sarahelpsthree_info;
	permanent = TRUE;
	description = "Chci zaplatit Sářin dluh.";
};


func int dia_harad_sarahelpsthree_condition()
{
	if((MIS_SARAHELPSTHREE == LOG_Running) && (SARADOBTPAYED == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_sarahelpsthree_info()
{
	AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_00");	//Chci zaplatit Sářin dluh.
	if(HAKONTOSARADOBT == FALSE)
	{
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_01");	//CO?! TY?!... (udiveně) dluh Sáry?!
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_02");	//Měla zaplatit za poslední dodávku zbraní... Nebo jsi zapomněl?
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_03");	//Já nezapomněl nic!... (naštvaný) pouze mě udivuje, že chceš zaplatit její dluh. Jak to?!
		HAKONTOSARADOBT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_06");	//Dobrá.
	};
	AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_07");	//Jak si pamatuji, dluží mi dva tisíce zlatých.
	AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_08");	//Ty je máš?
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GivePlayerXP(300);
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_09");	//Tady.
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_10");	//Nemožné!... (udiveně) Jseš opravdu rozhodnut to udělat?!
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_16");	//Vrazím do tě meč!
		B_GiveInvItems(self,other,ItMw_Schwert4,1);
		SARADOBTPAYED = TRUE;
		B_LogEntry(TOPIC_SARAHELPSTHREE,"Zaplatil jsem Haradovi Sářin dluh.");
	}
	else
	{
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_22");	//Bohužel, tolik nemám.
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_23");	//Dobrá! Tak přijď později až je budeš mít, vtipálku... (naštvaný) Mor na tě!
	};
};


instance DIA_HARAD_ABOUTSWBL(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = dia_harad_aboutswbl_condition;
	information = dia_harad_aboutswbl_info;
	permanent = FALSE;
	description = "Odkud bereš ocelové ingoty?";
};

func int dia_harad_aboutswbl_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_aboutswbl_info()
{
	AI_Output(other,self,"DIA_Harad_aboutswbl_01_00");	//Odkud bereš ocelové ingoty?
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_01");	//Nyní je těžké je sehnat - v Hornickém údolí je stále těžší dobývat rudu a tavit ingoty.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_02");	//Můžeš to zkusit u obchodníků, nebo sám odlévat ingoty z rudy.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_03");	//Nicméně musíš nejprve vytěžit nějakou rudu a pak najít někoho, kdo rozumí tavení.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_04");	//Můžeš se pokusit najít učitele z bývalé trestanecké kolonie, ale nevím jestli v Khorinisu někoho seženeš.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry(TOPIC_STEELDRAW,"Harad mi řekl, že ocelové ingoty lze buď koupit od obchodníků, nebo se můžu pokusit si je odlít sám. To bych ale musel nejprve nějakou železnou rudu vytěžit a pak mezi bývalými trestanci najít někoho, kdo mě naučí ji tavit. A jak rudu těžit jsem už také téměř zapomněl.");
};

instance DIA_Harad_PrioratBlade(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_PrioratBlade_condition;
	information = DIA_Harad_PrioratBlade_info;
	permanent = FALSE;
	description = "Jsi zkušený kovář?";
};

func int DIA_Harad_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_01");	//Jsi zkušený kovář?
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_02");	//(Vážně) No, to záleží, jak se to vezme...
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_03");	//Zkus se podívat na tuto čepel. Myslím, že by si o tom mohl vědět víc...
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_04");	//No, uvidíme.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_05");	//To je ono.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_06");	//(Vážně) No, mohu ti říci jednu věc - tato zbraň není vyrobena zde v Khorinisu!
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_07");	//Toto není práce ledajakého kováře, ale skutečného mistra zbrojíra!
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_08");	//A takyto mistr, pokud je mi známo, na ostrově nikdy nebyl!
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_09");	//Víc ti nemohu říci.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_10");	//To je v pořádku, řekl jsi mi dost...
	B_LogEntry(TOPIC_PrioratStart,"Harad mi řekl pouze to, že meč byl vykovaný velmi zkušeným zbrojířem. Ale taký prý na ostrově nikdy nebyl...");
};

instance DIA_Harad_DoCrossBow(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_DoCrossBow_condition;
	information = DIA_Harad_DoCrossBow_info;
	permanent = FALSE;
	description = "Víš, jak vyrobit kuši?";
};

func int DIA_Harad_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harad_DoCrossBow_01_01");	//Víš, jak vyrobit kuši?
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_02");	//(překvapeně) Kuši? To jsi na špatném místě, kámo.
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_03");	//Potřebuješ najít dobrého tesaře nebo truhláře!
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_04");	//S tímhle ti může pomoct jen někdo takový.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Naučit mě, jak vyrobit kuši, může jen tesař nebo truhlář...");
};

instance DIA_Harad_HauntedLH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_HauntedLH_condition;
	information = DIA_Harad_HauntedLH_info;
	permanent = FALSE;
	description = "Neříká ti něco jméno Stefan?";
};

func int DIA_Harad_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Harad_HauntedLH_01_01");	//Neříká ti něco jméno Stefan?
	AI_Output(self,other,"DIA_Harad_HauntedLH_01_02");	//Muže s takovým jménem neznám.
	B_LogEntry(TOPIC_HauntedLighthouse,"Harad o člověku Stefan nic neví.");
};
