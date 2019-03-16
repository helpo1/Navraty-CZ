
var int GaanTeachFinish;

func void B_WasMachtJagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Jak jde lov?
};


instance DIA_Gaan_EXIT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 999;
	condition = DIA_Gaan_EXIT_Condition;
	information = DIA_Gaan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int DIA_Gaan_EXIT_oneTime;

func int DIA_Gaan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if(DIA_Gaan_EXIT_oneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

instance DIA_Gaan_WASMACHSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 4;
	condition = DIA_Gaan_WASMACHSTDU_Condition;
	information = DIA_Gaan_WASMACHSTDU_Info;
	description = "Kdo jsi?";
};


func int DIA_Gaan_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_Gaan_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Mé jméno je Gaan. Jsem lovec a občas pracuji pro Bengara, farmáře který obdělává támhle tu velkou pastvinu.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Většinu času trávím tady venku. Pěkne na slunci, to je moje.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_01_00");	//Á vidím dalšího člena našeho spolku! Lovce.
		AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_01_01");	//Samozřejmě!
		AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_01_02");	//Sice to někdy je tvrdá práce ale neměnil bych!
		AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_01_03");	//Jasně.
	};
};


instance DIA_Gaan_HALLO(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 3;
	condition = DIA_Gaan_HALLO_Condition;
	information = DIA_Gaan_HALLO_Info;
	description = "Tady nahoře je docela hezky.";
};


func int DIA_Gaan_HALLO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//Tady nahoře je docela hezky.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//Je to tu docela pěkné. Ale jakmile projdeš tím průsmykem támhle, přestaneš si to myslet.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Jestli na tebe tenhle kus země udělal dojem, tak počkej, co pak uvidíš v Hornickém údolí.
};


instance DIA_Gaan_WALD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 5;
	condition = DIA_Gaan_WALD_Condition;
	information = DIA_Gaan_WALD_Info;
	description = "Co bych měl vědět o Hornickém údolí?";
};


func int DIA_Gaan_WALD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WALD_Info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Co bych měl vědět o Hornickém údolí?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Tak to nevím. Byl jsem tam jen na skok. Vypadá to tam pěkně nebezpečně.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Nejlepší věc, jakou můžeš udělat, je držet se po vstupu do průsmyku vyšlapané stezky.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Buď můžeš jít velkou strží, nebo po cestě přes most. Je to kratší a bezpečnější.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Teď, když se to všude hemží skřety, musíš být hodně opatrný.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Nerad bych tě táhnul k bylinkářce.
};


instance DIA_Gaan_SAGITTA(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 7;
	condition = DIA_Gaan_SAGITTA_Condition;
	information = DIA_Gaan_SAGITTA_Info;
	description = "Bylinkářce?";
};


func int DIA_Gaan_SAGITTA_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WALD))
	{
		return TRUE;
	};
};

func void DIA_Gaan_SAGITTA_Info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Bylinkářce?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Jmenuje se Sagitta. Léčí rolníky a ostatní lidi, co žijí mimo město.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Vážně podivná ženština.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Nikdo za ní ve skutečnosti nechce chodit a všichni o ní rozšiřují různé fámy.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Ale když je ti zle, nenajdeš nic lepšího než Sagittu a její kuchyň plnou léčivých bylin.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Najdeš ji v tom pruhu lesa za Sekobovou farmou.
};


instance DIA_Gaan_JAGD(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 80;
	condition = DIA_Gaan_JAGD_Condition;
	information = DIA_Gaan_JAGD_Info;
	permanent = FALSE;
	description = "Jak jde lov?";
};


func int DIA_Gaan_JAGD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_JAGD_Info()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Jak jde lov?
	AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Poslední zvíře které jsem zabil byla velká krysa.

	if(Npc_IsDead(Gaans_Snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Posledních několik dní se tu potuluje nějaká ufuněná bestie.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Nejen, že zabíjí všechno, co se hýbe, ale taky mi kazí moji práci!
		MIS_Gaan_Snapper = LOG_Running;
		Log_CreateTopic(TOPIC_GaanSchnaubi,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_Running);
		B_LogEntry(TOPIC_GaanSchnaubi,"Lovce Gaana trápí nějaká podivná nestvůra. Dokud ji nezabiju, nebude moci dál lovit.");
	};
};


instance DIA_Gaan_MONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 8;
	condition = DIA_Gaan_MONSTER_Condition;
	information = DIA_Gaan_MONSTER_Info;
	description = "Jak ta nebezpečná bestie vypadá?";
};


func int DIA_Gaan_MONSTER_Condition()
{
	if((MIS_Gaan_Snapper == LOG_Running) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//Jak ta nebezpečná bestie vypadá?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Pořádně nevím. Až doteď jsem jen slyšel vrčení a škrábání. Ale dokážu si představit, co ty zvuky vydávalo.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Před tím nejsou v bezpečí ani vlci. Ta bestie už je do jednoho vyvraždila.
};


instance DIA_Gaan_WOHERMONSTER(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_WOHERMONSTER_Condition;
	information = DIA_Gaan_WOHERMONSTER_Info;
	description = "Kde ta zatracená bestie žije?";
};


func int DIA_Gaan_WOHERMONSTER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_MONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WOHERMONSTER_Info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Kde ta zatracená bestie žije?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Někde mimo les. Možná sem chodí z Hornického údolí. Ale nejsem si tím jistý.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Nikdy jsem v Hornickém údolí nebyl.
};


instance DIA_Gaan_WASZAHLSTDU(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 9;
	condition = DIA_Gaan_WASZAHLSTDU_Condition;
	information = DIA_Gaan_WASZAHLSTDU_Info;
	description = "Kolik mi dáš, když tu bestii zabiju?";
};


func int DIA_Gaan_WASZAHLSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WOHERMONSTER) && (Npc_IsDead(Gaans_Snapper) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASZAHLSTDU_Info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Kolik mi dáš, když tu bestii zabiju?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Někomu, kdo to zabije, bych dal všechno, co můžu postrádat.
	B_Say_Gold(self,other,30);
	MIS_Gaan_Deal = LOG_Running;
};


instance DIA_Gaan_MONSTERTOT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_MONSTERTOT_Condition;
	information = DIA_Gaan_MONSTERTOT_Info;
	important = TRUE;
};


func int DIA_Gaan_MONSTERTOT_Condition()
{
	if((Npc_IsDead(Gaans_Snapper) == TRUE) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTERTOT_Info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//To odporné zvíře je mrtvé.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Tak to zase můžu bez obav začít lovit.
	if(MIS_Gaan_Deal == LOG_Running)
	{
		B_GivePlayerXP(XP_Gaan_WaldSnapper);
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Tady jsou peníze, co jsem ti slíbil.
		CreateInvItems(self,ItMi_Gold,30);
		B_GiveInvItems(self,other,ItMi_Gold,30);
	};
	MIS_Gaan_Snapper = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GaanSchnaubi,LOG_SUCCESS);
};


instance DIA_GAAN_WHATSNEW(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = dia_gaan_whatsnew_condition;
	information = dia_gaan_whatsnew_info;
	permanent = TRUE;
	description = "Co se děje?";
};


func int dia_gaan_whatsnew_condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_JAGD) && (RangerMeetingRunning != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gaan_whatsnew_info()
{
	AI_Output(other,self,"DIA_Gaan_WhatsNew_01_00");	//Co se děje?

	if(MIS_Gaan_Snapper == LOG_Running)
	{
		if(Kapitel >= 3)
		{
			AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Začíná tu být pěkný blázinec. Z průsmyku už se sem mezitím stihla nahrnout spousta těch funících zvířat.
		};

		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Za těchto okolností je lov čím dál tím obtížnější.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Nemůžu si stěžovat.
	};
};


instance DIA_Addon_Gaan_Ranger(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_Ranger_Condition;
	information = DIA_Addon_Gaan_Ranger_Info;
	description = "Proč ten vážný obličej?";
};


func int DIA_Addon_Gaan_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU) && (SCIsWearingRangerRing == TRUE) && (RangerMeetingRunning == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Proč ten vážný obličej?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Nosíš náš akvamarínový prsten.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Patříš ke 'Kruhu Vody'?.
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Skvělé. Rád vidím nováčky v našem spolku.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Gaan_MeetingIsRunning(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information = DIA_Addon_Gaan_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Addon_Gaan_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};


var int DIA_Addon_Gaan_MeetingIsRunning_One_time;

func void DIA_Addon_Gaan_MeetingIsRunning_Info()
{
	if(DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Nováček. Vítej v 'Kruhu Vody'.
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras se po tobě ptal, měl bys ho navštívit.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Gaan_AufgabeBeimRing(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information = DIA_Addon_Gaan_AufgabeBeimRing_Info;
	description = "Jakou máš funkci v 'Kruhu Vody'?";
};


func int DIA_Addon_Gaan_AufgabeBeimRing_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Gaan_Ranger) || (RangerMeetingRunning != 0)) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//Jakou máš funkci v 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Hlídal jsem vchod do průsmyku a kontroloval, kdo jde dovnitř a kdo leze ven.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Ale nějací paladinové se sem nastěhovali, že si to prej ohlídaj a od tý doby se tam pohybuje míň lidí.
};


instance DIA_Addon_Gaan_MissingPeople(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 2;
	condition = DIA_Addon_Gaan_MissingPeople_Condition;
	information = DIA_Addon_Gaan_MissingPeople_Info;
	description = "Už jsi slyšel o zmizelých lidech?";
};


func int DIA_Addon_Gaan_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Gaan_AufgabeBeimRing) && (SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Už jsi slyšel o zmizelých lidech?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Jistěže. To je důvod proč nám všichni říkají ať máme oči dokořán.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Ale zatím jsem nic nespatřil, takže ti toho moc nepovím.
};


instance DIA_Gaan_AskTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 10;
	condition = DIA_Gaan_AskTeacher_Condition;
	information = DIA_Gaan_AskTeacher_Info;
	description = "Mohl bys mě učit umění lovu?";
};


func int DIA_Gaan_AskTeacher_Condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Mohl bys mě učit umění lovu?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Nemůžu tě naučit nic, o čem bys nevěděl. Promiň!
		GaanTeachFinish = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Žádný problém! Za sto zlatých ti mohu ukázat, jak rozbourat zvířata, který sejmeš.
		AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Kůže a jiné části se dají dobře prodávat.
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Gaan mě naučí porcovat kořist.");
	};
};

instance DIA_Gaan_PayTeacher(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 11;
	condition = DIA_Gaan_PayTeacher_Condition;
	information = DIA_Gaan_PayTeacher_Info;
	permanent = TRUE;
	description = "Tady. 100 zlatých za tvůj výklad o vyvrhování zvířat.";
};

var int DIA_Gaan_PayTeacher_noPerm;

func int DIA_Gaan_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaan_AskTeacher) && (DIA_Gaan_PayTeacher_noPerm == FALSE))
	{
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Tady. 100 zlatých za tvůj výklad o vyvrhování zvířat.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//Díky. Tak se mi to líbí.
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Přijď později, až budeš mít nějaké peníze.
	};
};


instance DIA_Gaan_TEACHHUNTING(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 12;
	condition = DIA_Gaan_TEACHHUNTING_Condition;
	information = DIA_Gaan_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Co mě můžeš naučit?";
};

func int DIA_Gaan_TEACHHUNTING_Condition()
{
	if((Gaan_TeachPlayer == TRUE) && (GaanTeachFinish == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Co mě můžeš naučit?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//Záleží na tom, co chceš znát.
		Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Gaan_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Gaan_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Gaan_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání žihadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Gaan_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání křídel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Gaan_TEACHHUNTING_BFWing);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Teď už tě nemůžu naučit nic, co bys ještě neznal. Promiň.
		GaanTeachFinish = TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
};

func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Zvířata o své drápy přicházejí opravdu nerada. Řez musíš vést velmi přesně.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Tvé ruce by se měly lehce překrývat. Pak silným trhnutím dráp odděl od okolní tkáně.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Obchodníci se mohou vždycky přetrhnout, aby za drápy vysolili pěknou sumičku.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Nejsnadněji se z mrtvých zvířat získávají zuby. Řez musíš v jejich tlamě vést těsně kolem nich.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Pak je silným trhnutím oddělíš od lebky.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Nejlepší způsob, jak získat kožešinu, je vést hluboký řez podél končetin.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//Pak už je hračka stáhnout kůži od hlavy k ocasu.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//Tyhle mouchy mají na hřbetě měkké místo.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Když na něj zatlačíš, vytlačí se žihadlo daleko ze zadečku a pak ho stačí oddělit nožem.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

func void DIA_Gaan_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Nejlepší způsob, jak oddělit křídla od těla, je odříznout je ostrým nožem těsně nad hrudí.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Musíš si dávat velký pozor, abys nepoškodil velmi jemnou tkáň křídel. Pokud budeš při jejich oddělování neopatrný, získáš akorát bezcennou hromadu smetí.
	};
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING,Dialog_Back,DIA_Gaan_TEACHHUNTING_BACK);
};

instance DIA_Gaan_PICKPOCKET(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 900;
	condition = DIA_Gaan_PICKPOCKET_Condition;
	information = DIA_Gaan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaan_PICKPOCKET_Condition()
{
	return C_Beklauen(23,35);
};

func void DIA_Gaan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,Dialog_Back,DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};


instance DIA_GAAN_RESPECT(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = dia_gaan_respect_condition;
	information = dia_gaan_respect_info;
	permanent = TRUE;
	description = "Rád bych vyzval Falka.";
};


func int dia_gaan_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GAAN_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Gaan_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void dia_gaan_respect_info()
{
	AI_Output(other,self,"DIA_Gaan_Respect_01_00");	//Rád bych vyzval Falka
	AI_Output(self,other,"DIA_Gaan_Respect_01_01");	//Dobře, a co já stím?
	AI_Output(other,self,"DIA_Gaan_Respect_01_02");	//Je nutné abych získal podporu většiny lovců, proto jdu za tebou.
	AI_Output(other,self,"DIA_Gaan_Respect_01_03");	//Co na to říkáš?
	AI_Output(self,other,"DIA_Gaan_Respect_01_04");	//Chceš můj hlas?

	if(MIS_Gaan_Snapper == LOG_SUCCESS)
	{
		Info_ClearChoices(dia_gaan_respect);
		Info_AddChoice(dia_gaan_respect,"Jo!",dia_gaan_respect_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_Respect_01_05");	//Ty jsi mě s ničím nepomohl. Nevidím důvod pomáhat tobě.
		AI_Output(other,self,"DIA_Gaan_Respect_01_06");	//Dobře!
	};
};

func void dia_gaan_respect_yes()
{
	AI_Output(other,self,"DIA_Gaan_Respect_Yes_01_00");	//Jo!
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_01");	//Hmm... (zamyšleně) Každý by měl dostat šanci.
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_02");	//Jseš opravdu dobrej lovec.
	AI_Output(self,other,"DIA_Gaan_Respect_Yes_01_03");	//Pokud bude Falk chtít, máš můj hlas.
	Info_ClearChoices(dia_gaan_respect);
	AI_StopProcessInfos(self);
	GAAN_RESPECT = TRUE;
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	B_LogEntry(TOPIC_HUNTERSWORK,"Lovec Gaan bude hlasovat pro mě v souboji mezi mnou a Falkem.");
};

instance DIA_Addon_Gaan_WhatHappen(C_Info)
{
	npc = BAU_961_Gaan;
	nr = 1;
	condition = DIA_Addon_Gaan_WhatHappen_Condition;
	information = DIA_Addon_Gaan_WhatHappen_Info;
	description = "Co se stalo?";
};

func int DIA_Addon_Gaan_WhatHappen_Condition()
{
	if((Kapitel >= 3) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_WhatHappen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_01");	//Strašidelné věci, kámo... (nervózně) stále nemůžu přijít ke smyslům.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_02");	//Radši si lokni něčeho tvrdého a vše mi pověz.
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_03");	//Obecně... (povzdech) Na paladiny, kteří střeží průchod do Hornického údolí, zaútočili nějací mágové v černých hábitech.
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_04");	//Paladinové bojovali statečně, ale mágů bylo více! 
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_05");	//A když paladinové padli, všichni mířili směrem do města.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_06");	//Kolik jich tam bylo?
	AI_Output(self,other,"DIA_Addon_Gaan_WhatHappen_01_07");	//Asi tucet, ale nedokážu to s jistotou říci.
	AI_Output(other,self,"DIA_Addon_Gaan_WhatHappen_01_08");	//Ok, je mi to jasné.
};