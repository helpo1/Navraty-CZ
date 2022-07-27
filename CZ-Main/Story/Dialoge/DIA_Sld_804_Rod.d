
instance DIA_Rod_EXIT(C_Info)
{
	npc = Sld_804_Rod;
	nr = 999;
	condition = DIA_Rod_EXIT_Condition;
	information = DIA_Rod_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rod_EXIT_Info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rod_Hello(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Hello_Condition;
	information = DIA_Rod_Hello_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Rod_Hello_Condition()
{
	return TRUE;
};

func void DIA_Rod_Hello_Info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//Jak se vede?

	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//Co ODE mne chceš, blbečku?

		if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Nemohli pro tebe najít v klášteře místo?
		};
	};
};


var int Rod_SchwachGesagt;
var int Rod_Merke_2h;

instance DIA_Rod_Teach(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Teach_Condition;
	information = DIA_Rod_Teach_Info;
	permanent = TRUE;
	description = "Nemůžeš mě naučit, jak zacházet s obouručními zbraněmi?";
};

func int DIA_Rod_Teach_Condition()
{
	if(Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rod_Teach_Info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Nemůžeš mě naučit, jak zacházet s obouručními zbraněmi?
	AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Nejsem špatný bojovník, ale to neznamená, že jsem dobrý učitel.
	AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Ale i tak ti můžu ukázat základy boje s obouručními zbraněmi.
	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_Back()
{
	if(Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//Už se začínáš lepšit.
	};
	Info_ClearChoices(DIA_Rod_Teach);
};

func void DIA_Rod_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};


instance DIA_Rod_WannaJoin(C_Info)
{
	npc = Sld_804_Rod;
	nr = 4;
	condition = DIA_Rod_WannaJoin_Condition;
	information = DIA_Rod_WannaJoin_Info;
	permanent = TRUE;
	description = "Chci se přidat k žoldákům!";
};


func int DIA_Rod_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (RodAgreed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Chci se přidat k žoldákům!

	if(Npc_HasItems(self,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//Co kdybys mi pro začátek vrátil zpátky můj meč, co?
	}
	else if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//Fajn! Nemám nic proti tomu.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//Můžeš bojovat a to je to, co se počítá.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//Většina hochů tady si z menších šarvátek mezi přáteli nedělá těžkou hlavu. Na to si brzy zvykneš.
		};

		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//No dobře, máš pořádný meč. Zbytek se naučíš.
		B_LogEntry(TOPIC_SLDRespekt,"Budu-li se chtít připojit k žoldákům, Rod se za mě přimluví.");
		RodAgreed = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Proč se neodplazíš na pastvinu a nezahraješ si tam s ovečkama chodí pešek okolo?
		Rod_SchwachGesagt = TRUE;
	};
};


instance DIA_Rod_Duell(C_Info)
{
	npc = Sld_804_Rod;
	nr = 6;
	condition = DIA_Rod_Duell_Condition;
	information = DIA_Rod_Duell_Info;
	permanent = TRUE;
	description = "Vypadá to, že ti budu muset ukázat několik triků, že jo?";
};


func int DIA_Rod_Duell_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if((Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE))
		{
			return TRUE;
		};
		if(MIS_Jarvis_SldKO == LOG_Running)
		{
			return TRUE;
		};
	};
};

func void DIA_Rod_Duell_Info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Vypadá to, že ti budu muset ukázat několik triků, že jo?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//No tak to zkus!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Ty se tohle stěží naučíš!
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_StarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_StarkGenug_Condition;
	information = DIA_Rod_StarkGenug_Info;
	permanent = FALSE;
	description = "Jsem dost silnej!";
};

func int DIA_Rod_StarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rod_StarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//Jsem dost silnej!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Blbost! Ty bys nemohl uzvednout dokonce ani meč, jako je ten můj!
	MIS_RodWette = LOG_Running;
	Log_CreateTopic(Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus(Topic_RodWette,LOG_Running);
	B_LogEntry(Topic_RodWette,"Žoldák Rod si myslí, že nedokážu uzvednout jeho meč.");
};


instance DIA_Rod_BINStarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_BINStarkGenug_Condition;
	information = DIA_Rod_BINStarkGenug_Info;
	permanent = FALSE;
	description = "Řekl jsem, že JSEM dost silnej!";
};


func int DIA_Rod_BINStarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};

func void DIA_Rod_BINStarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//Řekl jsem, že JSEM dost silnej!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Chachá, asi umřu smíchy. Chceš se vsadit?
};


var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
var int DoomSword1;
var int DoomSword2;

instance DIA_Rod_Wette(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_Wette_Condition;
	information = DIA_Rod_Wette_Info;
	permanent = TRUE;
	description = "Vsadím se, že zvládnu tvůj meč!";
};


func int DIA_Rod_Wette_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (MIS_RodWette == LOG_Running) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_BINStarkGenug) && (Npc_HasItems(self,ItMw_2h_Rod) > 0) && (Rod_WetteAngenommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_Wette_Info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Vsadím se, že zvládnu tvůj meč!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Opravdu? Hmm... (přemýšlí) O kolik se vsadíme?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//No... Vypadáš jako ubohej začátečník. Vsaďme se o 30 zlatých! Máš vůbec tolik?
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"Ne.",DIA_Rod_Wette_No);
	Info_AddChoice(DIA_Rod_Wette,"Jasně!",DIA_Rod_Wette_Yes);
	B_LogEntry(Topic_RodWette,"Rod se se mnou vsadil o 30 zlatých, že neuzvednu jeho meč.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//No, tak vypadni.
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_Yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Jasně!
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Nejdřív se kouknu...

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		Rod_WetteAngenommen = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Tady jsou!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//V pořádku, podíváme se tedy jak jsi silnej... (škodolibě) 
		B_GiveInvItems(self,other,ItMw_2h_Rod,1);

		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
			{
				DoomSword1 = Npc_HasItems(hero,ITMW_1H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
			};
			if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
			{
				DoomSword2 = Npc_HasItems(hero,ITMW_2H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
			};

			CreateInvItems(hero,ItMw_2h_Rod_Fake,1);
			AI_UnequipWeapons(hero);
			AI_EquipBestMeleeWeapon(hero);
			AI_ReadyMeleeWeapon(hero);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Tak co říkáš na mojí sílu?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//Vypadá to že... (zmatený) Tys mě porazil?
			AI_RemoveWeapon(hero);
			AI_UnequipWeapons(hero);
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Tohle sem vůbec nečekal. Opravdu nevypadáš na to, že máš v sobě tolik síly.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//No - řekl bych, že jsem právě přišel o 30 zlatých. Tady jsou!
			B_GiveInvItems(self,other,ItMi_Gold,60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP(XP_Rod);
			MIS_RodWette = LOG_SUCCESS;
			Log_SetTopicStatus(Topic_RodWette,LOG_SUCCESS);
			B_LogEntry(Topic_RodWette,"Zvedl jsem Rodův meč.");
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Tuhle zbraň neudržím.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(směje se) To ti přece říkám!
			MIS_RodWette = LOG_FAILED;
			B_LogEntry_Failed(Topic_RodWette);
		};

		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//A teď mi dej zpátky můj meč.
		Info_ClearChoices(DIA_Rod_Wette);
		Info_AddChoice(DIA_Rod_Wette,"Myslím, že ne!",DIA_Rod_Wette_KeepIt);
		Info_AddChoice(DIA_Rod_Wette,"Tady, máš.",DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Kam jsem ho tak mohl dát...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//To dává smysl. Vrať se zpátky až budeš mít peníze na sázku.
		Info_ClearChoices(DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon(other);
	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Tady, máš.
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"(dát mu zbraň)",DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	Rod_WetteAngenommen = FALSE;

	if(Rod_WetteGewonnen == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Nakonec nejsi stejně nic jinýho než strašpytel!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Už bylo na čase!
	};

	RodCanGiveRing = TRUE;
	CanBeatRodFist = FALSE;
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Nevím... nevím!
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(výhružně) Cože?!
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Myslím, že si ho ponechám ještě o trochu déle.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Počkej, ty parchante!
	Info_ClearChoices(DIA_Rod_Wette);
	AI_StopProcessInfos(self);
	CanBeatRodFist = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_GiveItBack(C_Info)
{
	npc = Sld_804_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = "Tady máš meč zpátky!";
};

func int DIA_Rod_GiveItBack_Condition()
{
	if(Npc_HasItems(other,ItMw_2h_Rod) > 0)
	{
		return TRUE;
	};
};

func void DIA_Rod_GiveItBack_Info()
{
	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Tady máš meč zpátky!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Byl nejvyšší čas!
	RodCanGiveRing = TRUE;

	if(Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};

	CanBeatRodFist = FALSE;
};

instance DIA_Rod_Quest(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Quest_Condition;
	information = DIA_Rod_Quest_Info;
	permanent = FALSE;
	description = "Co je tak zvláštního na tvém meči?";
};

func int DIA_Rod_Quest_Condition()
{
	if((RodCanGiveRing == TRUE) && (Npc_HasItems(self,ItMw_2h_Rod) > 0))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Info()
{
	AI_Output(other,self,"DIA_Rod_Quest_01_01");	//Co je tak zvláštního na tvém meči?
	AI_Output(self,other,"DIA_Rod_Quest_01_02");	//Nic. Já jen rád použivám obouruční zbraně. Zbytek nějak není pro mě.
	AI_Output(other,self,"DIA_Rod_Quest_01_04");	//A mohl bys mě naučit jak s ním zacházet?
	AI_Output(self,other,"DIA_Rod_Quest_01_05");	//Samozřejmě. Pro začátek mi dones nejméně tucet láhví kořalky.
	AI_Output(other,self,"DIA_Rod_Quest_01_06");	//Hmm... Jsi si jistý?
	AI_Output(self,other,"DIA_Rod_Quest_01_07");	//O tom není pochyb... (směje se) Přines mi pití - a já ti ukážu jak zacházet s obouručákem.
	MIS_RodRing = LOG_Running;
	Log_CreateTopic(TOPIC_RodRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Running);
	B_LogEntry(TOPIC_RodRing,"Rod mi pomůže vylepšit schopnosti s obouručními zbraněmi. Ale za to chce tucet láhví kořalky.");
};

instance DIA_Rod_Quest_Done(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Quest_Done_Condition;
	information = DIA_Rod_Quest_Done_Info;
	permanent = FALSE;
	description = "Tady je tvoje kořalka!";
};

func int DIA_Rod_Quest_Done_Condition()
{
	if((MIS_RodRing == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_01");	//Tady je tvoje kořalka!
	B_GiveInvItems(other,self,ItFo_Booze,12);
	Npc_RemoveInvItems(self,ItFo_Booze,12);
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_02");	//Hmm... (uznale) Ano, to je ona!
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_03");	//Konečně se mi bude líp trávit čas, tady na farmě!
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_04");	//A co školení?
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_05");	//Samozřejmě! Jak se slíbil.
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_06");	//Tady, vem si tento prsten.
	B_GiveInvItems(self,other,ItRi_Rod,1);
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_07");	//Prsten?! A co s ním mám dělat?
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_08");	//Dej si ho - a porozumíš, zlepší ti zacházení s obouručními zbraněmi.
	Rod_Teach2H = TRUE;
	MIS_RodRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Success);
	B_LogEntry(TOPIC_RodRing,"Přinesl jsem kořalku Rodovi a ten mi za to dal prsten. Podle něj mi pomůže abych lépe ovládal obouruční zbraně.");
};

instance DIA_Rod_PERM(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_PERM_Condition;
	information = DIA_Rod_PERM_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Rod_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rod_Hello))
	{
		return TRUE;
	};
};

func void DIA_Rod_PERM_Info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Jak se vede?
	if(Kapitel <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//To tě nemusí zajímat, padavko.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Jsem zvědavý, jestli ti dovolí se k nám přidat.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Jsi jedním z nás, chlapče. Tak se nějak dohodneme.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Ty sem nepatříš, radši by ses měl jít poflakovat někam jinam!
		};
	};
	if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Jestli všechny ty povídačky o dracích jsou skutečně pravdivé, měli bychom dát pár lidí dohromady a jít ty mrchy pozabíjet!
	};
};


instance DIA_RodSLD_PICKPOCKET(C_Info)
{
	npc = Sld_804_Rod;
	nr = 900;
	condition = DIA_RodSLD_PICKPOCKET_Condition;
	information = DIA_RodSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_RodSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void DIA_RodSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,Dialog_Back,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

