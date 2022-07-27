/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(5x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_ORC_8566_URHAN_EXIT(C_Info)
{
	npc = orc_8566_urhan;
	nr = 999;
	condition = dia_orc_8566_urhan_exit_condition;
	information = dia_orc_8566_urhan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orc_8566_urhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8566_urhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_HELLO(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_hello_condition;
	information = dia_orc_8566_urhan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_hello_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_01");	//KHATAG BAT NAR! Člověk?! Kdo tě sem pustit?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_Hello_01_02");	//Nikdo! Přišel jsem sám.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_04");	//Arrgh... (bojovně) Člověk být moc smělý nebo moc hloupý, že sem přijít!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_05");	//I když nést znak síly skřetů, to nespasit člověk. Stačí říct slovo a moji válečníci tě rozsekat na kousky!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_Hello_01_06");	//To je možné, ale já to risknu!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_07");	//Hmmm... (mírněji) Dobře! A co ode mne člověk tedy chtít?
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};


instance DIA_ORC_8566_URHAN_WHOYOU(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_whoyou_condition;
	information = dia_orc_8566_urhan_whoyou_info;
	permanent = FALSE;
	description = "Kdo vlastně jsi?";
};


func int dia_orc_8566_urhan_whoyou_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_whoyou_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_WhoYou_01_01");	//Kdo vlastně jsi?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoYou_01_02");	//Jmenuji se Hag-Tar, člověče.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoYou_01_03");	//(agresivně) A na co se chce člověk zeptat?!
};


instance DIA_ORC_8566_URHAN_WHOLEADER(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_wholeader_condition;
	information = dia_orc_8566_urhan_wholeader_info;
	permanent = FALSE;
	description = "Kdo vede skupinu v pevnosti?";
};


func int dia_orc_8566_urhan_wholeader_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_wholeader_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_WhoLeader_01_01");	//Kdo vede skupinu v pevnosti?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoLeader_01_02");	//Hag-Tar je zde nejdůležitější! Poslouchají ho všichni.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoLeader_01_03");	//Člověk musí být velmi hloupý, jestli nerozumí.
};


instance DIA_ORC_8566_URHAN_PALADINSAFE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladinsafe_condition;
	information = dia_orc_8566_urhan_paladinsafe_info;
	permanent = FALSE;
	description = "Proč jsi zachoval život paladinů?";
};


func int dia_orc_8566_urhan_paladinsafe_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (KNOWABOUTGAROND == TRUE) && (URSHAKTELLPALADIN == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladinsafe_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinSafe_01_01");	//Proč jsi zachoval život paladinů?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinSafe_01_02");	//Člověk klade moc otázek... (hrozivě) Hag-Tar začíná být rozzloben!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinSafe_01_04");	//Arrgh!... (agresivně)
};


instance DIA_ORC_8566_URHAN_PALADINCOST(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladincost_condition;
	information = dia_orc_8566_urhan_paladincost_info;
	permanent = FALSE;
	description = "Co chceš výměnou za vězně?";
};


func int dia_orc_8566_urhan_paladincost_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (KNOWABOUTGAROND == TRUE) && (MIS_STURMCASTLE == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladincost_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_01_01");	//Co chceš výměnou za vězně?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_04");	//Osvobodit lidi?! Arrgh... Hag-Tar neví jak bys jej přinutil pustit lidi.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_05");	//Já lidi vždy jen zabíjím nebo k jídlu! Nikdy nepouštím - jen zabíjím.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_01_06");	//Tak proč jsi je ještě nezabil? Na co čekáš?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_07");	//(zamyšleně) Hmm... Hag-Tar je ještě potřebuje! Říkal to šaman.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_08");	//Nyní je zabít nemůžu - musím počkat.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_11");	//Co člověk může vyměnit za jejich svobodu?!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Myslím, že osvobodit Garonda a jeho muže nebude jednoduché - pevnost je zabrána skřety.");
	};
	BOGNARTALK = TRUE;
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Nemám páru.",dia_orc_8566_urhan_paladincost_dontknow);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Propusť paladiny a nezabiju tě!",dia_orc_8566_urhan_paladincost_live);
	if(FreDragnIsDead == TRUE)
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"A co zlato, skřete?",dia_orc_8566_urhan_paladincost_gold);
	};
	if((DGJMOVEPALADIN == FALSE) && (KILLGLOBALCOUNTDJG > 0))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"A co chceš?",dia_orc_8566_urhan_paladincost_quest);
	};
	if((URSHAKTELLSSECRET == TRUE) && (ORCLEADERISDEAD == FALSE))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"Slyšel jsem, že se chceš stát vůdcem.",dia_orc_8566_urhan_paladincost_leader);
	};
};

func void dia_orc_8566_urhan_paladincost_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_01");	//Nemám páru.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_02");	//Pak člověk jít! Hag-Tar s ním už nebude více mluvit.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_03");	//Jestli to řekneš ještě jednou, zabiju tě!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_04");	//Nyní jdi!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Obávám se, že teď už Hag-Tar paladiny nepropustí.");
	};
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_gold()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_01");	//Co takhle zlato, skřete?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_02");	//Hag-Tar nemít zájem o zlato! Zlato být pro skřety nic víc než prach.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_03");	//Skřeti ctít pouze sílu, být velký válečník klanu!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_04");	//Takže se mnou zkřížíš zbraně?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_05");	//Cože? Člověk chce bojovat s Hag-Tarem?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_07");	//(smích) Jaký to hloupý člověk! Když tohle říkat, chce jistě zemřít. 
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_09");	//Nemáš šanci mě porazit - jsem nejsilnější skřet na hradě a dokonce ani největší váleční vůdci se mi nerovnají.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_11");	//To je možné, ale když vyhraju - pustíš paladiny.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_13");	//Pustit paladiny? Hmm... Hag-Tar bude přemýšlet.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_14");	//Tak mysli rychle - nebo se prostě bojíš?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_15");	//CO?! KHROTOK YABART!... (naštvaně) Člověk pochybuje o síle Hag-Tara?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_19");	//Člověk půjde na velkou horu - tam kde dříve sídlil drak a ještě dříve měli lidé pevnost.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_20");	//Tam tě rozsekám na kousky... Arrgh!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_21");	//Bezva, uvidíme se tam.
	MIS_CHALLANGEORC = LOG_Running;
	Log_CreateTopic(TOPIC_CHALLANGEORC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_Running);
	B_LogEntry(TOPIC_CHALLANGEORC,"Přesvědčil jsem skřetího vůdce Hag-Tara, aby se se mnou utkal v duelu v hnízdě ohnivého draka! Jestli ho porazím, pustí paladiny.");
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_live()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Live_01_01");	//Propusť paladiny, hned!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Live_01_02");	//Člověk odporuje Hag-Tarovi? Teď tě ani Ulu-Mulu nezachrání!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Bojím se, že teď se s Hag-Tarem už nedohodnu.");
	};
	URHANFUCKOFF = TRUE;
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_quest()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_01");	//A co potřebuješ?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_02");	//Člověk se ptá co Hag-Tar potřebovat?! Hmm...
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_06");	//Hag-Tar myslí, že někde v údolí být další lidé.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_07");	//Přišli sem zabíjet draky. Musí být velmi silní a nebezpeční protivníci!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_08");	//Skřeti je již dlouho hledají, ale ještě je nenašli.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_09");	//A co to má co dělat se mnou?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_10");	//Člověk je půjde hledat a až je najde, tak je zabije!... (krvelačně) KHROTOK YABART!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_11");	//Hag-Tar si přeje jejich smrt! Jejich životy výměnou za životy paladinů.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_12");	//Souhlasí člověk?!
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Dobře! Souhlasím.",dia_orc_8566_urhan_paladincost_questagreed);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Ty myslíš, že bych s tím souhlasil?!",dia_orc_8566_urhan_paladincost_questnotagreed);
};

func void dia_orc_8566_urhan_paladincost_questagreed()
{
	var C_Npc outter;
	outter = Hlp_GetNpc(DJG_708_Kurgan);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_01");	//Dobře! Souhlasím.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_05");	//Pak člověk dělat to, co Hag-Tar říct.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_06");	//Nyní jdi a zabij je!
	MIS_KILLDRAGONHUNTER = LOG_Running;
	Log_CreateTopic(TOPIC_KILLDRAGONHUNTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_Running);
	B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Hag-Tar, skřetí náčelník na hradě, mi řekl, že propustí paladiny pokud zabiju drakobijce v údolí. Jak se říká - život za život. Souhlasil jsem s těmito podmínkami - odpusť mi Innos...");
	outter.aivar[93] = FALSE;
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 50;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_questnotagreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_01");	//Ty myslíš, že bych s tím souhlasil?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_04");	//Když je to tak, Hag-Tar už nebude víc mluvit s člověk.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_05");	//(vztekle) Teď jdi a už se nevracej - jinak tě zabiju!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Bojím se, že už se se skřety nedohodnu.");
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};

func void dia_orc_8566_urhan_paladincost_leader()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_01");	//Slyšel jsem, že se chceš stát vůdcem...
	AI_Standup(self);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_03");	//Možná bych ti mohl pomoct.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_04");	//Na oplátku chci abys osvobodil paladiny.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_06");	//Hmmm... Hag-Tar ještě neví, on nevěří lidem!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_07");	//Kromě toho není jisté jestli by to člověk dokázal.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_13");	//Hmmm... (přemýšlí) Hag-Tar bude souhlasit!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_14");	//Jestli člověk pomůže stát se vůdcem a zabije Ur-Thralla, pustím paladiny.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_15");	//Nicméně, Hag-Tar potřebuje důkaz, že Ur-Thrall mrtvý.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_16");	//Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_17");	//Arrgh... Běž a hodně štěstí!
	MIS_KILLURTRALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLURTRALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_Running);
	B_LogEntry(TOPIC_KILLURTRALL,"Hag-Tar mi řekl, že když dokážu zabít vůdce skřetů Ur-Thralla, pustí lidi z hradu.");
	Log_AddEntry(TOPIC_KILLURTRALL,"Musím mu přinést nějaký důkaz o smrti Ur-Thralla.");
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_BOGNARREFUSETALK(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_bognarrefusetalk_condition;
	information = dia_orc_8566_urhan_bognarrefusetalk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8566_urhan_bognarrefusetalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BOGNARREFUSETALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_bognarrefusetalk_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_01");	//Hej, ty!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_02");	//Varuji tě, už na mě nemluv!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_03");	//Člověk neposlouchal Hag-Tar a teď za to zemře... (vztekle) Teď ani Ulu-Mulu nezachránit!
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLDRGHUNTERS(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_killdrghunters_condition;
	information = dia_orc_8566_urhan_killdrghunters_info;
	permanent = FALSE;
	description = "Zabil jsem ty lidi.";
};


func int dia_orc_8566_urhan_killdrghunters_condition()
{
	if((MIS_KILLDRAGONHUNTER == LOG_Running) && (ALLDRGHUNTERSISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killdrghunters_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_01");	//Zabil jsem ty lidi.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_02");	//Dobrá... Hag-Tar je teď šťastný! Je vždy šťastný, když lidé zemřou.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_03");	//A co paladinové? Pustíš je?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_04");	//Ha, ha, ha... Člověk byl velmi hloupý, když věřil Hag-Tarovi!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_05");	//Hag-Tar oklamat člověk - vězně nepustím!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_06");	//Ale slíbil jsi to!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_07");	//Hag-Tar už nemluvit s člověk - on nenávidět lidi! Vězni nikdy neodejdou živí.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_08");	//Nyní jdi a nevracej se, jinak zemřeš.
	MIS_KILLDRAGONHUNTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Hag-Tar mě podvedl! Nikdy neměl v úmyslu pustit paladiny. Nyní zůstala jediná cesta - dobýt pevnost!");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Bojím se, že Hag-Tar paladiny nepustí.");
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};


instance DIA_ORC_8566_URHAN_CHALLANGE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challange_condition;
	information = dia_orc_8566_urhan_challange_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challange_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (HAGTARISINSERTED == TRUE) && (URHANBEATEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challange_info()
{
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_01");	//Tak člověk je zde, bojovat s Hag-Tarem.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_03");	//(agresivně) Tak pojď!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_05");	//Arrgh!
	URHANSPEAKBEFOREBATTLE = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_ORC_8566_URHAN_CHALLANGEORCDONE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challangeorcdone_condition;
	information = dia_orc_8566_urhan_challangeorcdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challangeorcdone_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (URHANBEATEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challangeorcdone_info()
{
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_01");	//Stůj, člověče... Vyhrál jsi, není třeba bojovat více.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_02");	//Nyní Hag-Tar vědet, že člověk silný a velký válečník!
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_03");	//Dobře, diky. A co paladinové - propustíš je?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_04");	//(podrážděně) No dobře! Hag-Tar dodržet slib. Jsou teď volní a můžou jít!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_08");	//Ale člověk musí slíbit, že nikomu neřekne o svém vítězství nad Hag-Tarem!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_09");	//Říct, že Hag-Tar porazil člověk - že Hag-Tar být největší válečník!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_10");	//Proč?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_11");	//Jestli bratři zjistí, že Hag-Tar prohrál, vysmáli by se mi.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_12");	//Pak Hag-Tar nebude velký válečník jako bratři myslet. Všichni mluvit, že Hag-Tar je slabý!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_14");	//Když člověk slíbit, Hag-Tar mu dát jednu velmi cennou věc. 
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_15");	//A co to je?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_16");	//Je to velmi užítečná věc - udělá tě silným a rychlým.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_17");	//Jaká je tvá odpověď?!
	CANFREEPALADIN = TRUE;
	B_LogEntry(TOPIC_CHALLANGEORC,"Nyní Hag-Tar pustí paladiny a nabízí mi jednu cennou věc, když nikomu neřeknu o mém vítězství.");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Paladinové jsou volní, měl bych za nimi zajít.");
	};
	Info_ClearChoices(dia_orc_8566_urhan_challangeorcdone);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone,"Dobře, souhlasím.",dia_orc_8566_urhan_challangeorcdone_ok);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone,"Nezajímá mě to.",dia_orc_8566_urhan_challangeorcdone_no);
};

func void dia_orc_8566_urhan_challangeorcdone_ok()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_01");	//Dobře, souhlasím.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_02");	//Tady, udělá tě silným a rychlým!
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_03");	//A pamatuj co jsi slíbil. Říkej, že Hag-Tar vyhrát bitvu!
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry(TOPIC_CHALLANGEORC,"Souhlasil jsem s jeho podmínkami.");
	self.aivar[AIV_EnemyOverride] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_challangeorcdone_no()
{
	B_GivePlayerXP(300);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_01");	//Nezajímá mě to.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_02");	//(vztekle) Arrgh! Člověk dělá špatně, že odmítnout nabídku Hag-Tar.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_03");	//Nyní tě musím zabít, jinak bys to všem řekl.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_05");	//Zabiju tě! KHROTOK YABART!
	REFUSEURHAN = TRUE;
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry(TOPIC_CHALLANGEORC,"Nepřijal jsem Hag-Tarovu nabídku a on mě chce zabít, protože se lekl, abych nevyzradil jeho prohru.");
	self.aivar[AIV_EnemyOverride] = FALSE;
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLURTRALLDONE(C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killurtralldone_condition;
	information = dia_orc_8566_urhan_killurtralldone_info;
	permanent = FALSE;
	description = "Nyní se můžeš stát vůdcem.";
};


func int dia_orc_8566_urhan_killurtralldone_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (ORCLEADERISDEAD == TRUE) && (Npc_HasItems(hero,itmi_orcmaintotem) >= 1))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killurtralldone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_01");	//Nyní se můžeš stát vůdcem.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_02");	//Hmm... Člověk opravdu porazil Ur-Thralla?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_03");	//Už to tak bude, tady je důkaz mých slov.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_04");	//Myslím, že by to mělo stačit.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_05");	//GAR TAGAN SAKH!... Totem síly! Nevěřím svým očím...
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_07");	//Arrgh! Tak je to správně.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_08");	//Hag-Tar je velmi šťastný - všichni bratři jej budou poslouchat.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_09");	//Jsem rád, že tě to potěšilo, ale pustíš už paladiny?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_10");	//Hmmm... Jsou volní jak jsem slíbil!
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	CANFREEPALADIN = TRUE;
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLURTRALL,"Zabil jsem Ur-Thralla a dal totem síly Hag-Tarovi - ten teď pustil paladiny!");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Paladinové jsou volní, měl bych za nima zajít.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLHAGTARDO(C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killhagtardo_condition;
	information = dia_orc_8566_urhan_killhagtardo_info;
	permanent = FALSE;
	description = "Vůdce Ur-Thrall chce tvou smrt!";
};


func int dia_orc_8566_urhan_killhagtardo_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (ORCLEADERISDEAD == FALSE) && (Npc_HasItems(hero,itmi_orcmaintotem) >= 1) && (URNAZULGIVETASK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killhagtardo_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_01");	//Vůdce Ur-Thrall chce tvou smrt!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_02");	//Co to člověk řekl?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_03");	//Vše jsem mu řekl a on mě poslal, abych tě odklidil.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_04");	//KHATAG BAT NAR!... Zabiju tě! Jak jsi mohl mé tajemství vyzradit Ur-Thrallovi?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_06");	//Arrgh!... Mí vojáci tě rozsekají...
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_07");	//Ne tak rychle! Podívej co mám.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_08");	//Co to je? (vystrašeně) Totem síly?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_09");	//Ano, symbol vůdce.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_10");	//Tví vojáci na mě teď nesmí vztáhnout ruku. Budeš muset bojovat sám! 
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_11");	//Arrgh!... Zabiju tě teď hned!
	B_LogEntry(TOPIC_KILLURTRALL,"Hag-Tar nevěřil, že jsem jeho plány vyzradil Ur-Thrallovi. Poštval na mě své vojsko, ale to mi nesmí nic udělat kvůli totemu síly - teď ho zabiju.");
	self.guild = GIL_WOLF;
	TELLHAGTARKILLYOU = TRUE;
	URHANFUCKOFF = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_StopProcessInfos(self);
};

