
var int nugget_all;
var int parcivalday;

instance DIA_Parcival_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Schurfer(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Schurfer_Condition;
	information = DIA_Parcival_Schurfer_Info;
	permanent = FALSE;
	description = "Co mi můžeš říci o těch kopáčích?";
};


func int DIA_Parcival_Schurfer_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Co mi můžeš říci o těch kopáčích?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Vyslal jsem tři skupiny.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Marcos, Fajeth a Silvestro jsou paladinové, kteří jim velí.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Marcosova skupina šla směrem ke Starému dolu. Průvodce jim dělal starý kopáč Grimes.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Další dvě šly spolu.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Jergan, jeden zvěd, přinesl zprávu o tom, že se utábořili pod jednou obrovskou věží.
	B_LogEntry(TOPIC_ScoutMine,"Skupinky paladinů vedou Marcos, Fajeth a Silvestro. Skupina Marcose šla směrem ke starému dolu. Průvodce jim dělá kopáč Grimes. Další dvě skupinky šli spolu k nějaké velké věži.");
};

instance DIA_Parcival_Diego(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 9;
	condition = DIA_Parcival_Diego_Condition;
	information = DIA_Parcival_Diego_Info;
	permanent = FALSE;
	description = "A se kterou skupinou šel Diego?";
};


func int DIA_Parcival_Diego_Condition()
{
	if((SearchForDiego == LOG_Running) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//A se kterou skupinou šel Diego?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Vězeň Diego byl se skupinou paladina Silvestra.
	B_LogEntry(TOPIC_ScoutMine,"Diego šel se skupinou paladina Silvestra.");
};


instance DIA_Parcival_Weg(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_Weg_Condition;
	information = DIA_Parcival_Weg_Info;
	permanent = FALSE;
	description = "Víš jak se dostanu na ty naleziště rudy?";
};


func int DIA_Parcival_Weg_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Víš jak se dostanu na ty naleziště rudy?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Ani v údolí není bezpečná cesta. Ale je to lepší než přímá cesta hordou skřetů.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Drž se dál od skřetů a lesů - ať ti Innos požehná.
	B_LogEntry(TOPIC_ScoutMine,"Zdá se, že přímá cesta k kopáčům nemusí být tou nejlepší volbou. Půjdu radši stranou od lesů a skřetích táborů.");
};


instance DIA_Parcival_DRAGON(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGON_Condition;
	information = DIA_Parcival_DRAGON_Info;
	description = "Jaká je situace?";
};


func int DIA_Parcival_DRAGON_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Jsme obklopeni skřety. Vypadá to, že se tu chvíly zdržíme.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Ale to mi zdaleka nedělá největší starost, mnohem horší je šance dračího útoku. Už stihli zničit stavění kolem hradu.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Další dračí útok by znamenal strašné ztráty.
};


instance DIA_Parcival_DRAGONS(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_DRAGONS_Condition;
	information = DIA_Parcival_DRAGONS_Info;
	description = "Kolik je zde draků?";
};


func int DIA_Parcival_DRAGONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Kolik je zde draků?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Nevíme kolik přesně, ale více než jeden.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Ale to není vše. Jsou tu také stvoření, která drakům slouží.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Nemá cenu si něco nalhávat - bez pomoci z venčí jsou naše šance dostat se odsud živý nulové.
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_BRAVE(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 8;
	condition = DIA_Parcival_BRAVE_Condition;
	information = DIA_Parcival_BRAVE_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Parcival_BRAVE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(hero,DIA_Parcival_DRAGONS) && (Kapitel < 3) && (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};


var int Parcival_BRAVE_LaberCount;

func void DIA_Parcival_BRAVE_Info()
{
	var int randy;
	if(Parcival_BRAVE_LaberCount < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Zatím je vš v pořádku, ale to se může rychle změnit.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Budeme tu tak dlouho, jak budeme moci.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos nás ochrání a zaseje zrnka odvahy do našich srdcí!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hej! Nemáš nic jiného na práci, než tady se mnou kecat? Vypadni!
		B_GivePlayerXP(XP_Ambient);
	};
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


instance DIA_Parcival_KAP3_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP3_EXIT_Condition;
	information = DIA_Parcival_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_ALLESKLAR(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_ALLESKLAR_Condition;
	information = DIA_Parcival_ALLESKLAR_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Parcival_ALLESKLAR_Condition()
{
	if((Kapitel == 3) && (DIA_Parcival_ALLESKLAR_NervCounter < 3) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};


var int DIA_Parcival_ALLESKLAR_NervCounter;

func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Všechno v pořádku?
	if(DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Co já vím, tak jo!
	}
	else if(DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Ano, zatraceně.
	}
	else if(Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(smích) Teď už vím co jsi zač! Ne, můj příteli, tentokrát ne.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Neobtěžuj mě!
	};
	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
};


instance DIA_Parcival_KAP4_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP4_EXIT_Condition;
	information = DIA_Parcival_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_AnyNews(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_AnyNews_Condition;
	information = DIA_Parcival_AnyNews_Info;
	description = "Stalo se něco důležitého?";
};


func int DIA_Parcival_AnyNews_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Stalo se něco důležitého?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ty patříš k té spodině, co si říká drakobijci?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Myslel jsem, že máš čest. Ne, že se budeš paktovat s těmito lidmi.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Jsem zklamán, velmi zklamán.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Proč?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//V poslední době se tu objevili lidé, kteří si říkají drakobijci.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//Pokud jde o mě, nejsou to válečníci, ale zločinci.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Kdyby bylo po mém, vyhnal bych je z hradu, aby si skřeti užili.
	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews,"Ale jsou tady - narozdíl od Hagena.",DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews,"Měl bys jim dát šanci.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews,"Nemyslíš, že přeháníš?",DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Ale jsou tady - narozdíl od lorda Hagena.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//Ano, bohužel jsou jediná pomoc co přišla.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos nás těžce zkouší.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Měl bys jim dát šanci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//Taky ji dostanou. Bohužel.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond říká, že nám pomohou.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Ale já z nich oči nespustím. Máme dost problémů se skřety. A další potíže nepotřebujem.
	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Nemyslíš, že přeháníš?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Rozhodně ne. V naší situaci potřebujeme, aby muži měli dobrý příklad. Ne tohle.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Válečníci potřebují objevit plamen Innose ve svém srdci.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//A místo toho ničí morálku mých lidí.
};


instance DIA_Parcival_Jan(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_Jan_Condition;
	information = DIA_Parcival_Jan_Info;
	permanent = FALSE;
	description = "Chci si s tebou promluvit ohledně Jana.";
};


func int DIA_Parcival_Jan_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Chci si s tebou promluvit ohledně Jana.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan? Kdo je to?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Drokobijec. Je to kovář.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Aha, ten... Co je s ním?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Chtěl by pracovat v kovárně.	
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Ani nápad. Není to náš člověk - nevěřím mu.
};


instance DIA_Parcival_ThinkAgain(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_ThinkAgain_Condition;
	information = DIA_Parcival_ThinkAgain_Info;
	permanent = TRUE;
	description = "Nechceš přehodnotit svůj názor na Jana?";
};


func int DIA_Parcival_ThinkAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Nechceš přehodnotit svůj názor na Jana?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Ne, mé rozhodnutí je pevné.
};


instance DIA_Parcival_TalkedGarond(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = DIA_Parcival_TalkedGarond_Condition;
	information = DIA_Parcival_TalkedGarond_Info;
	description = "Garond chce, aby Jan pracoval v kovárně.";
};

func int DIA_Parcival_TalkedGarond_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_DRAGON) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond chce, aby Jan pracoval v kovárně.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Hmm... No jestli je to tak, tak nic nenamítám.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Ale zaručíš se za něj.
};


instance DIA_Parcival_PERMKAP4(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 43;
	condition = DIA_Parcival_PERMKAP4_Condition;
	information = DIA_Parcival_PERMKAP4_Info;
	permanent = TRUE;
	description = "A kromě toho?";
};


func int DIA_Parcival_PERMKAP4_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Parcival_AnyNews) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//A kromě toho?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Nech mě být!
};


instance DIA_Parcival_KAP5_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP5_EXIT_Condition;
	information = DIA_Parcival_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_VERRAETER(C_Info)
{
	npc = PAL_252_Parcival;
	condition = DIA_Parcival_VERRAETER_Condition;
	information = DIA_Parcival_VERRAETER_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Parcival_VERRAETER_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGateOpen == TRUE) && (other.guild == GIL_DJG) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Zrádce! Vím přesně, že ty jsi otevřel tu bránu.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Zaplatíš za to.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Parcival_KAP6_EXIT(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 999;
	condition = DIA_Parcival_KAP6_EXIT_Condition;
	information = DIA_Parcival_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parcival_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Parcival_PICKPOCKET(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 900;
	condition = DIA_Parcival_PICKPOCKET_Condition;
	information = DIA_Parcival_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Parcival_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,Dialog_Back,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};

		B_GiveInvItems(self,other,ITKE_TWOSTORE,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};


instance DIA_PARCIVAL_CAPTURED(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 2;
	condition = dia_parcival_captured_condition;
	information = dia_parcival_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parcival_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_parcival_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_Parcival_Kill_Arbaleters(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_condition;
	information = DIA_Parcival_Kill_Arbaleters_info;
	permanent = FALSE;
	description = "Máš pro mě nějaké rozkazy?";
};

func int DIA_Parcival_Kill_Arbaleters_condition()
{
	if((Kapitel >= 2) && (MIS_ScoutMine == LOG_SUCCESS) && (Npc_KnowsInfo(hero,DIA_Parcival_DRAGON) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_info()
{
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_00");	//Máš pro mě nějaké rozkazy?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_01");	//(uznale) Podařilo se ti dostat až do hradu. Takže, opravdu za něco stojíš.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_02");	//Ale chci tě předem upozornit, že se jedná o velmi obtížnou a nebezpečnou záležitost!
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_03");	//A já myslel že už mám obtížné věci za sebou.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_04");	//Tak už to je, že musíš nést břímně, které by nikdo z mých lidí neunes.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_05");	//K věci, co to je tentokrát?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_06");	//Potřebuju aby ses postaral o tu skřetí pozorovatelnu.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_07");	//Nedávno tam poslali novou četu válečníků.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_08");	//Nemůžem si dovolit nechat skřety na... pro ně, tak strategické pozici.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_09");	//Proto musíme stanoviště zničit.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_10");	//A v čem je problém?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_11");	//Problém je v tom, že skřeti přijali veškerá bezpečnostní opatření.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_12");	//Skřetí kušiníci, kteří jsou v obrané skupině - jsou opravdu tvrdým oříškem pro každého kdo by se chtěl přiblížit!
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_13");	//A nemůžu riskovat své muže, kteří zajišťují obranu hradu.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_14");	//Aha. Proto budu riskovat já.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_15");	//No... jenom ty, u tebe je největší šance že to přežiješ.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_01_16");	//Buď ostražitý - můžou tam být nejen střelci, ale i elitní válečníci.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_01_17");	//Dobře, udělám, co budu moct.
	MISS_ELITE_GROUP_ORKS = LOG_Running;
	Log_CreateTopic(TOPIC_ELITE_GROUP_ORKS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_Running);
	B_LogEntry(TOPIC_ELITE_GROUP_ORKS,"Parcival mi řekl, že pozorovatelnu, mají skřeti silně zabezpečenou. A byl by rád kdybych se o tenhle problém postaral. Také mě varoval, že je třeba se před odchodem připravit.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrkElite_Warrior_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Warrior_Persival_02,"OW_PATH_015");
	Wld_InsertNpc(OrkElite_Warrior_Persival_03,"LOCATION_16_OUT");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_01,"OW_PATH_019");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_02,"OW_PATH_028");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_03,"OW_PATH_027");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_04,"OW_PATH_025");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_05,"OW_PATH_024");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_06,"OW_PATH_023");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_07,"OW_PATH_022");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_08,"OW_PATH_021");
	Wld_InsertNpc(OrkElite_Arbaletchik_Persival_09,"OW_PATH_020");
	Wld_InsertNpc(OrkElite_Elder_Persival_01,"LOCATION_16_IN");
};

instance DIA_Parcival_Kill_Arbaleters_Done(C_Info)
{
	npc = PAL_252_Parcival;
	nr = 31;
	condition = DIA_Parcival_Kill_Arbaleters_Done_condition;
	information = DIA_Parcival_Kill_Arbaleters_Done_info;
	permanent = FALSE;
	description = "Četa skřetů zničena.";
};

func int DIA_Parcival_Kill_Arbaleters_Done_condition()
{
	if((MISS_ELITE_GROUP_ORKS == LOG_Running) && Npc_IsDead(OrkElite_Warrior_Persival_01) && Npc_IsDead(OrkElite_Warrior_Persival_02) && Npc_IsDead(OrkElite_Warrior_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_01) && Npc_IsDead(OrkElite_Arbaletchik_Persival_02) && Npc_IsDead(OrkElite_Arbaletchik_Persival_03) && Npc_IsDead(OrkElite_Arbaletchik_Persival_04) && Npc_IsDead(OrkElite_Arbaletchik_Persival_05) && Npc_IsDead(OrkElite_Arbaletchik_Persival_06) && Npc_IsDead(OrkElite_Arbaletchik_Persival_07) && Npc_IsDead(OrkElite_Arbaletchik_Persival_08) && Npc_IsDead(OrkElite_Arbaletchik_Persival_09) && Npc_IsDead(OrkElite_Elder_Persival_01))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Kill_Arbaleters_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_01");	//Četa skřetů zničena.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_02");	//Pozorovatelé mi ohlásili, že skřeti utrpěli strašné ztráty v oblasti kopce.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_03");	//Udělal jsi pro nás velkou službu! To nám poskytne chvilkovou výhodu.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_04");	//Co takhle malou odměnu?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_05");	//Tu si samozřejmě zasloužíš.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_06");	//Nicméně, spekuloval jsem, jak tě nejlépe odměnit.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_07");	//Co zlato, magické lektvary nebo jakékoliv jiné cennosti?
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_08");	//Ano, už jsem o tom přemýšlel.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_09");	//Ale naše rezervy v zámku extrémně zchudli, a nemohu je jen tak rozdávat napravo - nalevo.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_10");	//Počkej, přišel jsem na to jak ti dostatečně poděkovat.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_12");	//Tady, vezmi tento meč. Jsem si jistý, že s takovou zbraní ses ještě nikdy nesetkal!
	B_GiveInvItems(self,other,ITMW_2H_KATANA,1);
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_13");	//Máš pravdu. Takovou zbraň jsem nikdy neviděl.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_14");	//Je to pochopitelné. Koneckonců, je to čepel ze vzdáleného Varantu.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_15");	//Dostala se ke mně jako válečná kořist od jednoho velmi zkušeného asasínského bojovníka!
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_16");	//Stále si pamatuji tento boj. A na památku těch časů jsem po celé roky opatroval tento meč.
	AI_Output(self,other,"DIA_Parcival_Kill_Arbaleters_Done_01_17");	//A teď patří tobě.
	AI_Output(other,self,"DIA_Parcival_Kill_Arbaleters_Done_01_18");	//Děkuji! Je to opravdu hodnotná odměna.
	MISS_ELITE_GROUP_ORKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ELITE_GROUP_ORKS,LOG_SUCCESS);
	B_LogEntry(TOPIC_ELITE_GROUP_ORKS,"Zvládl jsem úkol.");
};
