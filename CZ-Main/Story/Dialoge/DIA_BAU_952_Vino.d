
instance DIA_Vino_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_HALLO(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_HALLO_Condition;
	information = DIA_Vino_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Vino_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_HALLO_Info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//Jak jde práce?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//Jako vždycky. Spousta dřiny, málo peněz a s trochou smůly zejtra přijdou skřeti a srovnají naši farmu se zemí.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//Královští paladinové obsadili celé město. Ale nechce se mi věřit, že by odtamtud zvedli ty svý velebný zadky a šli nám pomoct, až nás napadnou skřeti.
	};
};


instance DIA_Vino_SeekWork(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_SeekWork_Condition;
	information = DIA_Vino_SeekWork_Info;
	permanent = FALSE;
	description = "Můžu ti nějak pomoci? Hledám práci.";
};

func int DIA_Vino_SeekWork_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lobart_WorkNOW) || Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG)) && !Npc_IsDead(Lobart) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Můžu ti nějak pomoci? Hledám práci.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//Víš něco o polních pracích?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//Co na tom může být tak těžkého?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Á! V tom případě... Myslím, že si vystačíme sami, díky.
		if(!Npc_IsDead(Lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//Pokud chceš pro Lobarta pracovat jako nádeník, musím tě varovat. Lidem jako ty platí fakt mizerně!

			if((Lobart_Kleidung_Verkauft == FALSE) && (Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) || Npc_KnowsInfo(other,DIA_Lobart_WorkNOW)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//Nabídl mi, že mi prodá farmářské šaty se slevou, pokud pomůžu na farmě.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Hmm... Nemám pro tebe nic, ale můžeš mně a chlapům přinést něco k pití.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//(šklebí se) Přines mi láhev vína a já řeknu Lobartovi, žes nám 'opravdu pomohl'.
				MIS_Vino_Wein = LOG_Running;
				Log_CreateTopic(TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Vino,LOG_Running);
				B_LogEntry(TOPIC_Vino,"Jestli Vinovi přinesu láhev vína, poví Lobartovi, že jsem mu pomohl.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//Ale ode mě to nemáš, jasný?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//Neřekl bych. Někdo tvého postavení nemůže mít zájem o takový druh práce, co nabízím.
	};
};


instance DIA_Vino_BringWine(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = DIA_Vino_BringWine_Condition;
	information = DIA_Vino_BringWine_Info;
	permanent = FALSE;
	description = "Tady je tvoje víno.";
};


func int DIA_Vino_BringWine_Condition()
{
	if((MIS_Vino_Wein == LOG_Running) && (Npc_HasItems(other,ItFo_Wine) > 0) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_BringWine_Info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//Tady je tvoje víno.
	B_GiveInvItems(other,self,ItFo_Wine,1);
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//(směje se) Raději se nemám ptát, kdes ho sebral, co? Stejně, koho to zajímá, že?
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Jinak, díky.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Lobart o tobě uslyší jen to nejlepší.
		};
	};
	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
};


instance DIA_Vino_ToTheCity(C_Info)
{
	npc = BAU_952_Vino;
	nr = 3;
	condition = DIA_Vino_ToTheCity_Condition;
	information = DIA_Vino_ToTheCity_Info;
	permanent = FALSE;
	description = "Mám namířeno do města.";
};


func int DIA_Vino_ToTheCity_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Vino_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//Mám namířeno do města.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//A?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Můžeš mi o městě říci něco zajímavého?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Moc ne. Ale Maleth tam občas zajde - snad se od něj něco dozvíš... Myslím něco, co by tě mohlo zajímat.
};


var int Vino_Gossip_Orks;
var int Vino_Gossip_Bugs;

instance DIA_Vino_PERM(C_Info)
{
	npc = BAU_952_Vino;
	nr = 10;
	condition = DIA_Vino_PERM_Condition;
	information = DIA_Vino_PERM_Info;
	permanent = TRUE;
	description = "Nějaké zajímavé novinky?";
};

func int DIA_Vino_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Vino_HALLO) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Nějaké zajímavé novinky?

	if(Vino_Gossip_Orks == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//Přísahal bych, že jsem před dvěma dny na kraji lesa zahlédl skřeta.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//Od té doby mám v noci vždycky alespoň jedno oko otevřené.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
		MIS_KILL_VINO_ORK = LOG_Running;
		Log_CreateTopic(TOPIC_VINO_KILL_ORK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_VINO_KILL_ORK,LOG_Running);
		B_LogEntry(TOPIC_VINO_KILL_ORK,"Rolník Vino v noci nemůže spát, protože se bojí, že ho v noci zabije skřet.");
	}
	else if((Vino_Gossip_Bugs == FALSE) && (MIS_AndreHelpLobart == LOG_Running))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//Ti obrovští odporní brouci už jsou vážně hodně otravní. Jsou všude! Sežerou, co uvidí, když na chvíli nedáváš pozor.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//Před několika dny jsem ležel v trávě, myslel si na své, chvilku jsem si zdřímnul a najednou koukám, jak mi jedna z těch zatracenejch věcí ožužlává botu!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//Měls mě vidět, jak jsem mazal. Od tý doby se nemůžu ani pořádně vyspat.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Kromě toho, co jsem ti už říkal? Nic.
	};
};


instance DIA_Vino_KAP3_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP3_EXIT_Condition;
	information = DIA_Vino_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

instance DIA_Vino_DMTAMSTART(C_Info)
{
	npc = BAU_952_Vino;
	nr = 31;
	condition = DIA_Vino_DMTAMSTART_Condition;
	information = DIA_Vino_DMTAMSTART_Info;
	permanent = TRUE;
	description = "A jak se ti daří?";
};

func int DIA_Vino_DMTAMSTART_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Vino_DMTAMSTART_OneTime;

func void DIA_Vino_DMTAMSTART_Info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//A jak se ti daří?
	AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//Ti bastardi v černých kápích jsou snad všude. Někdo by jim ty jejich kápě měl hezky omotat kolem krku a zatáhnout.
};

instance DIA_Vino_Obesessed(C_Info)
{
	npc = BAU_952_Vino;
	nr = 32;
	condition = DIA_Vino_Obesessed_Condition;
	information = DIA_Vino_Obesessed_Info;
	permanent = TRUE;
	description = "Co je s tebou?";
};


func int DIA_Vino_Obesessed_Condition()
{
	if((NpcObsessedByDMT_Vino == FALSE) && (Kapitel >= 3) && (hero.guild == GIL_KDF) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vino_Obesessed_Info()
{
	if(Npc_IsDead(DMT_Vino1) && Npc_IsDead(DMT_Vino2) && Npc_IsDead(DMT_Vino3) && Npc_IsDead(DMT_Vino4))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//Co je to s tebou?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(řve) Zatraceně, zabij je, než oni zabijí nás!
		AI_StopProcessInfos(self);
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};


instance DIA_Vino_Heilung(C_Info)
{
	npc = BAU_952_Vino;
	nr = 55;
	condition = DIA_Vino_Heilung_Condition;
	information = DIA_Vino_Heilung_Info;
	permanent = TRUE;
	description = "Ty vůbec nejsi při smyslech.";
};


func int DIA_Vino_Heilung_Condition()
{
	if((NpcObsessedByDMT_Vino == TRUE) && (DarkPathStart == FALSE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Vino_Heilung_oneTime;

func void DIA_Vino_Heilung_Info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//Ty vůbec nejsi při smyslech.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//Moje hlava... Už to nemůžu dýl vydržet...
	if(DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//Měli bychom zajít do kláštera. Pyrokar, nejvyšší mág, ti snad pomůže.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Myslíš? Fajn. Tak to zkusíme.
		B_NpcClearObsessionByDMT(self);
		B_StartOtherRoutine(Vino,"Kloster");
		B_LogEntry(TOPIC_DEMENTOREN,"Vino je posedlý. Poslal jsem ho do kláštera, kde ho snad vyléčí. Doufám, že tam v pořádku dorazí.");
		B_GivePlayerXP(XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
};


instance DIA_Vino_KAP4_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP4_EXIT_Condition;
	information = DIA_Vino_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_PERM4OBSESSED(C_Info)
{
	npc = BAU_952_Vino;
	nr = 41;
	condition = DIA_Vino_PERM4OBSESSED_Condition;
	information = DIA_Vino_PERM4OBSESSED_Info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int DIA_Vino_PERM4OBSESSED_Condition()
{
	if((hero.guild == GIL_KDF) && (DarkPathStart == FALSE) && (NpcObsessedByDMT_Vino == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//Jak se máš?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Jo, jo, už je to v pořádku. Mám dojem, že mi tihle chlapci můžou pomoct. Ale ještě je mi dost divně.
	if(DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//Ale musím uznat, že jejich červené víno je to nejlepší, co jsem zatím měl možnost ochutnat.
		B_GivePlayerXP(XP_Ambient);
		DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE;
	};
};

instance DIA_Vino_PERM45UND6(C_Info)
{
	npc = BAU_952_Vino;
	nr = 42;
	condition = DIA_Vino_PERM45UND6_Condition;
	information = DIA_Vino_PERM45UND6_Info;
	permanent = TRUE;
	description = "Co je nového?";
};

func int DIA_Vino_PERM45UND6_Condition()
{
	if((Kapitel >= 4) && (hero.guild != GIL_KDF) && (NpcObsessedByDMT_Vino == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM45UND6_Info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Co je nového?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//Počet skřetů v okolí se nepříjemně zvýšil.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//Vy paladinové s nimi zatočíte, ne?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Bojím se, že už brzy budeme muset všeho nechat a přidat se k žoldákům na Onarově farmě.
	};
};


instance DIA_Vino_KAP5_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP5_EXIT_Condition;
	information = DIA_Vino_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Vino_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_KAP6_EXIT(C_Info)
{
	npc = BAU_952_Vino;
	nr = 999;
	condition = DIA_Vino_KAP6_EXIT_Condition;
	information = DIA_Vino_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Vino_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Vino_PICKPOCKET(C_Info)
{
	npc = BAU_952_Vino;
	nr = 900;
	condition = DIA_Vino_PICKPOCKET_Condition;
	information = DIA_Vino_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Vino_PICKPOCKET_Condition()
{
	return C_Beklauen(34,60);
};

func void DIA_Vino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
	Info_AddChoice(DIA_Vino_PICKPOCKET,Dialog_Back,DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vino_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveInvItems(self,other,ItMi_Gold,20);
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

func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
};


instance DIA_VINO_KILLORK(C_Info)
{
	npc = BAU_952_Vino;
	nr = 1;
	condition = dia_vino_killork_condition;
	information = dia_vino_killork_info;
	permanent = FALSE;
	description = "Zabil jsem toho skřeta.";
};

func int dia_vino_killork_condition()
{
	if(Npc_IsDead(OrcWarrior_Harad) && (MIS_KILL_VINO_ORK == LOG_Running) && (Npc_HasItems(other,itfo_addon_shnaps_orks) >= 1))
	{
		return TRUE;
	};
};

func void dia_vino_killork_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Vino_KillOrk_01_01");	//Zabil jsem toho skřeta.
	AI_Output(self,other,"DIA_Vino_KillOrk_01_02");	//(nevěřícně) Jsi si jistý?
	AI_Output(other,self,"DIA_Vino_KillOrk_01_03");	//Mám tady skřetí kořalku. Myslíš snad, že jsem si ji vycucal z prstu?
	B_GiveInvItems(other,self,itfo_addon_shnaps_orks,1);
	AI_Output(self,other,"DIA_Vino_KillOrk_01_04");	//Pak se tedy konečně zas v klidu vyspím.
	AI_UseItem(self,itfo_addon_shnaps_orks);
	AI_Output(self,other,"DIA_Vino_KillOrk_01_05");	//Díky, kámo.
	AI_Output(other,self,"DIA_Vino_KillOrk_01_06");	//A co takhle nějakou odměnu?
	AI_Output(self,other,"DIA_Vino_KillOrk_01_07");	//Za takovou práci si ji zasloužíš. Bohužel nemám žádné zlato, zato však jednu velmi vzácnou rostlinu.
	AI_Output(self,other,"DIA_Vino_KillOrk_01_08");	//Tady máš.
	B_GiveInvItems(self,other,ItPl_Temp_Herb,1);
	AI_Output(other,self,"DIA_Vino_KillOrk_01_09");	//Díky.
	MIS_KILL_VINO_ORK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_VINO_KILL_ORK,LOG_SUCCESS);
	B_LogEntry(TOPIC_VINO_KILL_ORK,"Vino může konečně klidně spát, zabil jsem jeho noční můru.");
};
