
instance DIA_Grimbald_EXIT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 999;
	condition = DIA_Grimbald_EXIT_Condition;
	information = DIA_Grimbald_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grimbald_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimbald_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimbald_HALLO(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_HALLO_Condition;
	information = DIA_Grimbald_HALLO_Info;
	description = "Čekáš na něco?";
};

func int DIA_Grimbald_HALLO_Condition()
{
	return TRUE;
};


var int Grimbald_PissOff;
var int GrimbaldTellBT;

func void DIA_Grimbald_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Čekáš na něco?

	if((Npc_IsDead(Grimbald_Snapper1) == FALSE) && (Npc_IsDead(Grimbald_Snapper2) == FALSE) && (Npc_IsDead(Grimbald_Snapper3) == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Teď už ne, už jsi přišel ty.
		Info_ClearChoices(DIA_Grimbald_HALLO);
		Info_AddChoice(DIA_Grimbald_HALLO,"Čeká na mě práce.",DIA_Grimbald_HALLO_nein);
		Info_AddChoice(DIA_Grimbald_HALLO,"Co tím myslíš?",DIA_Grimbald_HALLO_Was);
		Info_AddChoice(DIA_Grimbald_HALLO,"Proč já?",DIA_Grimbald_HALLO_ich);
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Jsem na lovu. To je snad jasné.
	};
};

func void DIA_Grimbald_HALLO_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Proč já?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Vypadáš silně. Chlápek jako ty se mi může hodit.
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_02");	//Všichni ostatní lovci jsou v táboře, takže ty jsi jediný, kdo mi může pomoct.
};

func void DIA_Grimbald_HALLO_Was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Chtěl bych ulovit ty chňapavce támhle nahoře, ale mám dojem, že je jich na mě samotného moc.
	Info_AddChoice(DIA_Grimbald_HALLO,"Se mnou nepočítej.",DIA_Grimbald_HALLO_Was_neinnein);
	Info_AddChoice(DIA_Grimbald_HALLO,"Dobrá. Pomůžu ti. Jdi první.",DIA_Grimbald_HALLO_Was_ja);
};

func void DIA_Grimbald_HALLO_Was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Se mnou nepočítej.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Tak to mi jdi z očí, zbabělče!
	Grimbald_PissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Grimbald_HALLO_Was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Dobrá. Pomůžu ti. Jdi první.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Jasná věc. Ale moc se nepřibližuj k tomu černému trolovi tam nahoře. Jinak tě rozseká na kousky, jasný?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//Čeho se bojíš, že se držíš tak zpátky?
	GrimbaldTellBT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Jagd");
};

func void DIA_Grimbald_HALLO_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Čeká na mě práce.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Nevykládej nesmysly. Co by mohlo být tady, uprostřed divočiny, tak důležité?
};

instance DIA_Grimbald_TrollTell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_TrollTell_Condition;
	information = DIA_Grimbald_TrollTell_Info;
	permanent = FALSE;
	description = "Co víš o černém trolovi?";
};


func int DIA_Grimbald_TrollTell_Condition()
{
	if((Npc_IsDead(troll_black_ext) == FALSE) && (GrimbaldTellBT == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_TrollTell_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_00");	//Co víš o černém trolovi?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_01");	//To zvíře sem přišlo velmi dávno. Zalíbila se mu jeskyně, a od té doby se stala jeho trvalým doupětem.
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_02");	//Pořád tam jen sedí?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_03");	//Já nevím. Obvykle trolové žijí vysoko v horách, a jen zřídka sestupují do údolí.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_04");	//Zdá se, že se mu tady líbí. A nejspíš neodejde.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_05");	//Bejt tebou, moc bych se o něj nezajímal.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_06");	//Černej trol je schopnej rozdrtit tkáň i kosti napadrť!
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_07");	//Jen s velmi silnou zbrojí nezemřeš hned.
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_08");	//Pokusil se ho už někdo zabít?
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_09");	//Mnoho lidí to již zkoušelo, ale všichni zemřeli.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_10");	//Pár lovců bylo posledních, kteří se ho pokusili napadnout.
	AI_Output(self,other,"DIA_Grimbald_TrollTell_01_11");	//Nejspíš jejich těla leží stále v té jeskyni...
	AI_Output(other,self,"DIA_Grimbald_TrollTell_01_12");	//Ach.
};

instance DIA_Grimbald_Trolltot(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Trolltot_Condition;
	information = DIA_Grimbald_Trolltot_Info;
	important = TRUE;
};


func int DIA_Grimbald_Trolltot_Condition()
{
	if(Npc_IsDead(troll_black_ext))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Trolltot_Info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Černý trol je mrtev. Skvělá práce. Nikdy jsem si nemyslel, že ho lze zabít. Na tohle nikdy nezapomenu.
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_01");	//S Falkem a ostatními jsme se dohodli, že kdo ho uloví, vyhraje.
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_02");	//Ale nikdo nepočítal s tebou!
		AI_Output(self,other,"DIA_Grimbald_Trolltot_07_03");	//Falk bude překvapen!
	};
};


instance DIA_Grimbald_Jagd(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_Jagd_Condition;
	information = DIA_Grimbald_Jagd_Info;
	permanent = TRUE;
	description = "Můžeš mě naučit něco o lovu?";
};

func int DIA_Grimbald_Jagd_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimbald_HALLO) && (Grimbald_TeachAnimalTrophy == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimbald_Jagd_Info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Můžeš mě naučit něco o lovu?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == TRUE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Už znáš všechno, co tě můžu naučit.
		GrimbaldTeachFinish = TRUE;
	}
	else
	{
		if(HEROISHUNTER == TRUE)
		{
			if((Grimbald_PissOff == FALSE) && (Npc_IsDead(Grimbald_Snapper1) == TRUE) && (Npc_IsDead(Grimbald_Snapper2) == TRUE) && (Npc_IsDead(Grimbald_Snapper3) == TRUE))
			{
				AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Staň se lovcem chlape, pak si promluvíme.
				Grimbald_TeachAnimalTrophy = TRUE;
				Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
				Log_AddEntry(TOPIC_HUNTERTEACHERS,"Grimbald mě může učit lovu.");
			}
			else
			{
				AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Jasně. Ale bude tě to něco stát.
				B_Say_Gold(self,other,200);
				Info_ClearChoices(DIA_Grimbald_Jagd);
				Info_AddChoice(DIA_Grimbald_Jagd,"Budu o tom přemýšlet.",DIA_Grimbald_Jagd_zuviel);
				Info_AddChoice(DIA_Grimbald_Jagd,"Dobrá. Tady jsou peníze.",DIA_Grimbald_Jagd_ja);
			};
		}
		else if(Npc_KnowsInfo(other,DIA_Grimbald_Trolltot))
		{
			AI_Output(self,other,"DIA_Grimbald_Jagd_07_03");	//Zabil jsi černého trola - pro mě je to čest tě něco naučit.
			Grimbald_TeachAnimalTrophy = TRUE;
			Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
			Log_AddEntry(TOPIC_HUNTERTEACHERS,"Grimbald mě může učit technikám lovu.");
		}
		else
		{
			AI_Output(self,other,"DIA_Grimbald_Jagd_07_04");	//Staň se lovcem chlape, pak si promluvíme.
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Grimbald_Jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Tady jsou peníze.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Dobře. Řekni mi, až budeš chtít začít.
		Grimbald_TeachAnimalTrophy = TRUE;
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		Log_AddEntry(TOPIC_HUNTERTEACHERS,"Grimbald mě může učit lovecké techniky.");
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Přines mi peníze a něco tě naučím.
	};
	Info_ClearChoices(DIA_Grimbald_Jagd);
};

func void DIA_Grimbald_Jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Dobrá, popřemýšlím o tom.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Jak chceš.
	Info_ClearChoices(DIA_Grimbald_Jagd);
};


instance DIA_Grimbald_TEACHHUNTING(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 12;
	condition = DIA_Grimbald_TEACHHUNTING_Condition;
	information = DIA_Grimbald_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Rád bych se naučil nějakým loveckým technikám.";
};


func int DIA_Grimbald_TEACHHUNTING_Condition()
{
	if((Grimbald_TeachAnimalTrophy == TRUE) && (GrimbaldTeachFinish == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Grimbald_TEACHHUNTING_OneTime;

func void DIA_Grimbald_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Rád bych se učil.

	if(DIA_Grimbald_TEACHHUNTING_OneTime == FALSE)
	{
		Npc_ExchangeRoutine(self,"JagdOver");
		DIA_Grimbald_TEACHHUNTING_OneTime = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Co přesně chceš vědět?
		Info_AddChoice(DIA_Grimbald_TEACHHUNTING,Dialog_Back,DIA_Grimbald_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání žihadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Grimbald_TEACHHUNTING_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání křídel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Grimbald_TEACHHUNTING_BFWing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Grimbald_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grimbald_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání krunýřů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Grimbald_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grimbald_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání rohů dračích chňapavců",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Už víš vše, co bych tě mohl naučit.
		GrimbaldTeachFinish = TRUE;
	};
};

func void DIA_Grimbald_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_01");	//Musíš vrazit nůž hluboko do zvířecího čela a jemně páčením uvolnit.
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_DrgSnapperHorn_03_02");	//Pokud se neoddělí od lebky, použij druhý nuž na druhé straně čela.
		CreateInvItems(Gaans_Snapper,ItAt_DrgSnapperHorn,1);
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Odříznutí žihadla krvavé mouchy je poměrně jednoduché. Stačí najít jen kořen žihadla a silou ho uřezat.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Křídla z krvavé mouchy stačí utrhnout nebo odříznout ostrým nožem.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Je několik způsobů, jak získat drápy. U některých zvířat je nutný silný a přesný řez nožem, zatímco u jiných je třeba je velmi opatrně ořezávat.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//Důlní červi a polní škůdci mají silná kusadla, která můžeš z jejich hlavy dostat silným trhnutím.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};

func void DIA_Grimbald_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Krunýř důlních červů přiléhá k jejich tělu velmi těsně, ale velkým ostrým předmětem se dá snadno oddělit.
	};
	Info_ClearChoices(DIA_Grimbald_TEACHHUNTING);
};


instance DIA_Grimbald_NovChase(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 3;
	condition = DIA_Grimbald_NovChase_Condition;
	information = DIA_Grimbald_NovChase_Info;
	description = "Neviděl jsi tudy procházet nějakého novice?";
};


func int DIA_Grimbald_NovChase_Condition()
{
	if(MIS_NovizenChase == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Grimbald_NovChase_Info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Neviděl jsi tudy procházet nějakého novice?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Dneska tudy prošlo hodně podivných osob - včetně těch dvou vtipálků od toho kamenného oblouku.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//Taky s nima byl nějaký novic od mágů Ohně.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Grimbald_PICKPOCKET(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 900;
	condition = DIA_Grimbald_PICKPOCKET_Condition;
	information = DIA_Grimbald_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimbald_PICKPOCKET_Condition()
{
	return C_Beklauen(85,250);
};

func void DIA_Grimbald_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,Dialog_Back,DIA_Grimbald_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimbald_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimbald_PICKPOCKET_DoIt);
};

func void DIA_Grimbald_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};

func void DIA_Grimbald_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimbald_PICKPOCKET);
};


instance DIA_GRIMBALD_RESPECT(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respect_condition;
	information = dia_grimbald_respect_info;
	permanent = FALSE;
	description = "Potřebuji tvoji podporu.";
};


func int dia_grimbald_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (GRIMBALD_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_respect_info()
{
	AI_Output(other,self,"DIA_Grimbald_Respect_01_00");	//Potřebuji tvoji podporu.
	AI_Output(self,other,"DIA_Grimbald_Respect_01_01");	//Co tím myslíš? (udiveně)
	AI_Output(other,self,"DIA_Grimbald_Respect_01_02");	//Chci vyzvat Falka o titul nejlepšího lovce.
	AI_Output(other,self,"DIA_Grimbald_Respect_01_03");	//Podpoříš mě?

	if(Npc_IsDead(troll_black_ext))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Grimbald_Respect_01_04");	//Proč ne. Narozdíl od Falka ses vypořádal s černým trolem.
		AI_Output(self,other,"DIA_Grimbald_Respect_01_05");	//Takže máš můj hlas.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_06");	//Díky.
		GRIMBALD_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Grimbald mi dá svůj hlas.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Respect_01_07");	//Klidně, ale musíš si ho něčím zasloužit.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_08");	//Co bych měl udělat?
		AI_Output(self,other,"DIA_Grimbald_Respect_01_09");	//Sejmi toho černýho trola - a máš můj hlas.
		AI_Output(other,self,"DIA_Grimbald_Respect_01_10");	//Dobrá.
	};
};

instance DIA_GRIMBALD_RESPECTDONE(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_respectdone_condition;
	information = dia_grimbald_respectdone_info;
	permanent = FALSE;
	description = "Je po trolovi.";
};

func int dia_grimbald_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GRIMBALD_RESPECT == FALSE) && Npc_IsDead(troll_black_ext))
	{
		return TRUE;
	};
};

func void dia_grimbald_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grimbald_RespectDone_01_00");	//Je po trolovi, dáš mi svůj hlas?
	AI_Output(self,other,"DIA_Grimbald_RespectDone_01_01");	//Samozřejmě, tak jsme se dohodli.
	GRIMBALD_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Grimblad mi dá svůj hlas.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_GRIMBALD_Furs(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_condition;
	information = dia_grimbald_Furs_info;
	permanent = FALSE;
	description = "Potřebuji ovčí kůži.";
};

func int dia_grimbald_Furs_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_01_00");	//Potřebuji ovčí kůži.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_01");	//Dobře. A co má být?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_02");	//Máš ji, že? 
	AI_Output(self,other,"DIA_Grimbald_Furs_01_03");	//(dotčen) Jak tě to napadlo?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_04");	//Ale ty jsi lovec. Nebo ne?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_05");	//No jistě. Jsem lovec, ne farmář! Nebo vidíš snad vedle mě stádo ovcí?
	AI_Output(other,self,"DIA_Grimbald_Furs_01_06");	//No, doufal jsem že se někde tady něco najde.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_07");	//Ne, člověče. Vydal ses na špatnou adresu.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_08");	//Jediné kůže, které mám, obsahují části dravých potvor, které lovím.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_09");	//Takové ti mohu nabídnout.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_10");	//Dá se s nimi dobře zahřát v noci?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_12");	//Víc než to! Jediný důvod, proč lidé kupují ovčí kůže je, že jsou poměrně levné.
	AI_Output(self,other,"DIA_Grimbald_Furs_01_13");	//A ti, kteří mají spousty pěnez jdou do stínových šelem, wargů nebo dokonce trolů.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_14");	//Až tak?
	AI_Output(self,other,"DIA_Grimbald_Furs_01_15");	//Nekecám. Teďkom mám hlavně kožešiny stínových šelem. 
	AI_Output(self,other,"DIA_Grimbald_Furs_01_16");	//Takže ti můžu nabídnout pouze ty.
	AI_Output(other,self,"DIA_Grimbald_Furs_01_17");	//Dobře. Kolik za ně chceš?

	if(HEROISHUNTER == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Grimbald_Furs_01_18");	//No, když ty jsi jedním z nás... Dám ti je zdarma.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_19");	//Tady. Doufám že se ti budou hodit.
		B_GiveInvItems(self,other,ItAt_ShadowFur,2);
		AI_Output(other,self,"DIA_Grimbald_Furs_01_20");	//Vynikající kůže. Díky.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_21");	//Nemáš zač.
		GrimbaldTellSellFur = TRUE;
		B_LogEntry(TOPIC_TiraksFur,"Grimbald nenabízí ovčí kůže, zato má pořádné teplé kožešiny stínových šelem. Dal mi dvě zadarmo.");
	}
	else if(Npc_IsDead(troll_black_ext) == TRUE)
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Grimbald_Furs_01_22");	//No... (zamyšleně) Vzhledem k tomu že jsi to ty, trolobijec, dám ti je zadarmo.
		AI_Output(self,other,"DIA_Grimbald_Furs_01_23");	//Ale jen jednu. Tady máš.
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		AI_Output(other,self,"DIA_Grimbald_Furs_01_24");	//Vynikající kůže. A kolik stojí druhá?
		AI_Output(self,other,"DIA_Grimbald_Furs_01_25");	//Pro tebe 200 zlatých. Věř mi, je to slušná cena.
		GrimbaldSellFur = TRUE;
		B_LogEntry(TOPIC_TiraksFur,"Grimbald nenabízí ovčí kůže, zato má pořádné teplé kožešiny stínových šelem. Dal mi jednu zadarmo a za druhou si chce nechat zaplatit 200 zlatých.");
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_01_27");	//Pro tebe 200 zlatých. Věř mi, je to slušná cena.
		B_LogEntry(TOPIC_TiraksFur,"Grimbald nenabízí ovčí kůže, zato má pořádné teplé kožešiny stínových šelem. Prodává je 200 za kus, budu potřebovat nejspíš dvě.");
		GrimbaldSellFurAll = TRUE;
	};
};

instance DIA_GRIMBALD_Furs_Tell(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Tell_condition;
	information = dia_grimbald_Furs_Tell_info;
	permanent = FALSE;
	description = "Můžeš mi prodat další kožešiny?";
};

func int dia_grimbald_Furs_Tell_condition()
{
	if(GrimbaldTellSellFur == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Tell_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Tell_01_00");	//Můžeš mi prodat další kožešiny?
	AI_Output(self,other,"DIA_Grimbald_Furs_Tell_01_01");	//Jasně. Ale budeš mi muset zaplatit.
	GrimbaldSellFur = TRUE;
};

instance DIA_GRIMBALD_Furs_Trade(C_Info)
{
	npc = BAU_982_Grimbald;
	nr = 1;
	condition = dia_grimbald_Furs_Trade_condition;
	information = dia_grimbald_Furs_Trade_info;
	permanent = TRUE;
	description = "Chtěl bych si opatřit kůže.";
};

func int dia_grimbald_Furs_Trade_condition()
{
	if((GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimbald_Furs_Trade_info()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_01_00");	//Chtěl bych si opatřit kůže.

	if(KapitelGrimbaldSell == Kapitel)
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_01");	//Zatím na prodej nic nemám. Vrať se později.
	}
	else
	{
		if(MIS_TiraksFur == LOG_Running)
		{
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_03");	//Jak jsem řekl, za stínovou šelmu chci 200 zlatých.
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_04");	//Máš na to vůbec?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Zloději.",DIA_Grimbald_Furs_Trade_no);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Tady máš.",DIA_Grimbald_Furs_Trade_geld);
		}
		else
		{
			AI_Output(self,other,"DIA_Grimbald_Furs_Trade_01_05");	//Dobře, jaký typ kožešiny si přeješ?
			Info_ClearChoices(DIA_Grimbald_Furs_Trade);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Rozmyslel jsem se.",DIA_Grimbald_Furs_Trade_NoSale);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Kůže warga. (cena: 100 zlatých)",DIA_Grimbald_Furs_Trade_Warg);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Kůže stínové šelmy. (cena: 200 zlatých)",DIA_Grimbald_Furs_Trade_Shadow);
			Info_AddChoice(DIA_Grimbald_Furs_Trade,"Trolí kůže. (cena: 500 zlatých)",DIA_Grimbald_Furs_Trade_troll);
		};
	};
};

func void DIA_Grimbald_Furs_Trade_geld()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_geld_15_00");	//Zde jsou peníze.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_geld_17_01");	//Velmi dobře. Tady to je.
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_geld_17_02");	//Díky.
		KapitelGrimbaldSell = Kapitel;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_geld_17_03");	//Dokud nebudeš mít příslušnou sumu, nemáme se o čem bavit.
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_Warg()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Warg_15_00");	//Chci si koupit kůži warga.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_01");	//Dobře, tady máš.
		CreateInvItems(self,ItAt_WargFur,1);
		B_GiveInvItems(self,other,ItAt_WargFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,100);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Warg_17_02");	//Díky.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_03");	//Nemáš dost zlata.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Warg_17_04");	//Nesnaž se mě ošidit!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_Shadow()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Shadow_15_00");	//Chci si koupit kůži stínové šelmy.

	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_01");	//Dobře, tady to máš.
		CreateInvItems(self,ItAt_ShadowFur,1);
		B_GiveInvItems(self,other,ItAt_ShadowFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,200);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_Shadow_17_02");	//Díky.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_03");	//Nemáš dost zlata.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_Shadow_17_04");	//Nesnaž se mě ošidit!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_troll()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_troll_15_00");	//Chci si koupit trolí kůži.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_01");	//Dobře, tady to je.
		CreateInvItems(self,ItAt_TrollFur,1);
		B_GiveInvItems(self,other,ItAt_TrollFur,1);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Grimbald_Furs_Trade_troll_17_02");	//Díky.

		GrimbaldSellCount = GrimbaldSellCount + 1;

		if(GrimbaldSellCount >= 5)
		{
			GrimbaldSellCount = FALSE;
			KapitelGrimbaldSell = Kapitel;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_03");	//Nemáš dost zlata.
		AI_Output(self,other,"DIA_Grimbald_Furs_Trade_troll_17_04");	//Nesnaž se mě znovu ošidit!
	};

	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};

func void DIA_Grimbald_Furs_Trade_NoSale()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_NoSale_15_00");	//Rozmyslel jsem si to.
	AI_Output(self,other,"DIA_Grimbald_Furs_Trade_NoSale_17_01");	//No, jak myslíš.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};


func void DIA_Grimbald_Furs_Trade_no()
{
	AI_Output(other,self,"DIA_Grimbald_Furs_Trade_no_15_00");	//Zloději.
	AI_Output(self,other,"DIA_Grimbald_Furs_Trade_no_17_01");	//Pak nemáme o čem mluvit.
	Info_ClearChoices(DIA_Grimbald_Furs_Trade);
};
