
instance DIA_Till_EXIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 999;
	condition = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Till_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Till_HALLO(C_Info)
{
	npc = BAU_931_Till;
	nr = 3;
	condition = DIA_Till_HALLO_Condition;
	information = DIA_Till_HALLO_Info;
	description = "Ahoj, chlapečku.";
};


func int DIA_Till_HALLO_Condition()
{
	if(Kapitel < 5)
	{
		return TRUE;
	};
};

func void DIA_Till_HALLO_Info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Ahoj, chlapečku.
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Takhle se mnou žádnej usoplenej rolník mluvit nebude - kolikrát vám všem to ještě budu připomínat?
	B_StartOtherRoutine(Till,"Start");
	Info_ClearChoices(DIA_Till_HALLO);

	if(Kapitel < 5)
	{
		Info_AddChoice(DIA_Till_HALLO,"Nejsem rolník.",DIA_Till_HALLO_keinervoneuch);

		if(Npc_IsDead(Sekob) == FALSE)
		{
			Info_AddChoice(DIA_Till_HALLO,"Ty to tady vedeš?",DIA_Till_HALLO_selber);
		};
	};
};

func void DIA_Till_HALLO_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ty to tady vedeš?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//(ustrašeně) Eh. Ne, jsem jen Sekobův syn. Ale až můj stařičký otec jednou nebude mezi námi, tohle všechno mi tu bude patřit.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Úžasné!
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Takhle jednáš se všemi rolníky?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Jasně - potřebujou to. Jestliže nebudu udržovat disciplínu já, neudělá to nikdo - takhle to prostě funguje.
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nejsem rolník.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//Tak co tady chceš? Nemáme nic. Takže zase můžeš jít.
	AI_StopProcessInfos(self);
};

func void DIA_Till_HALLO_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Nejsem rolník.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//Tak co tady chceš? Nemáme nic. Takže zase můžeš jít.
	AI_StopProcessInfos(self);
};

instance DIA_Till_SEKOB(C_Info)
{
	npc = BAU_931_Till;
	nr = 9;
	condition = DIA_Till_SEKOB_Condition;
	information = DIA_Till_SEKOB_Info;
	description = "Potřebuju mluvit s tvým otcem.";
};

func int DIA_Till_SEKOB_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (Npc_KnowsInfo(other,DIA_Sekob_HALLO) == FALSE) && (Kapitel < 3) && (Npc_IsDead(Sekob) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Till_SEKOB_Info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Potřebuju mluvit s tvým otcem.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//Nemá čas. Ale já ho zastupuju. Jak ti můžu pomoct?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Zaveď mě ke svému otci.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Ty jsi opravdu neústupný chlápek a zřejmě i dobrý bojovník, co?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Ten nejlepší.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Tak to asi bude lepší, když tě za ním vezmu.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Nedělej si starosti, hochu. Najdu ho sám. Určitě.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Když to říkáš.
	AI_StopProcessInfos(self);
};

instance DIA_Till_WASMACHSTDU(C_Info)
{
	npc = BAU_931_Till;
	nr = 10;
	condition = DIA_Till_WASMACHSTDU_Condition;
	information = DIA_Till_WASMACHSTDU_Info;
	description = "Tak co děláš, když si zrovna nehraješ na pána farmy?";
};

func int DIA_Till_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//Tak co děláš, když si zrovna nehraješ na pána farmy?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Hlídám.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Ta mizerná domobrana z města leze na náš pozemek čím dál tím častějc a krade všechno, co se dá odnést.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Byli tu minulý týden a vzali si několik našich ovcí.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Kdyby se mi někdo z nich dostal do rukou, udělal bych s ním krátký proces.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//No jistě!
};


instance DIA_Till_WARUMNICHTSLD(C_Info)
{
	npc = BAU_931_Till;
	nr = 11;
	condition = DIA_Till_WARUMNICHTSLD_Condition;
	information = DIA_Till_WARUMNICHTSLD_Info;
	description = "Proč vám proti domobraně nepomůžou žoldáci?";
};


func int DIA_Till_WARUMNICHTSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_WASMACHSTDU) && (hero.guild != GIL_MIL) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WARUMNICHTSLD_Info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Proč vám proti domobraně nepomůžou žoldáci?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Než ty se na něco zmůžou, já už je dávno zaženu sám.
};


instance DIA_Till_BRONKO(C_Info)
{
	npc = BAU_931_Till;
	nr = 5;
	condition = DIA_Till_BRONKO_Condition;
	information = DIA_Till_BRONKO_Info;
	description = "(zeptat se na Bronka)";
};


func int DIA_Till_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) && Npc_KnowsInfo(other,DIA_Bronko_HALLO) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Je tady chlápek, co chce po každém kolemjdoucím mýtné a tvrdí o sobě, že je tady farmářem.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(rozpačitě) Eh. Ano. Já vím. To je Bronko. Dělá si, co chce.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Jako bych ho milionkrát nedokopával k tomu, aby se vrátil do práce...
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Ale?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Prostě furt nechce pracovat.
	if(Npc_IsDead(Sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Můj otec je na mě pěkně naštvaný, že jsem ho ještě nedokázal přinutit, aby se vrátil do práce.
	};
};


instance DIA_Till_BRONKOZURARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 6;
	condition = DIA_Till_BRONKOZURARBEIT_Condition;
	information = DIA_Till_BRONKOZURARBEIT_Info;
	permanent = TRUE;
	description = "Možná bych ti mohl pomoct.";
};


var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_BRONKO) && (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOZURARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Možná bych ti mohl pomoct.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Myslíš s ním? Fajn, poslouchej, když se ti podaří Bronka dostat zpátky do práce, zaplatím ti. Řekněme deset zlatých. Co říkáš?
	Till_Angebot = 10;
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Žádný problém. Ale chci víc peněz.",DIA_Till_BRONKOZURARBEIT_mehr);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Budu o tom přemýšlet.",DIA_Till_BRONKOZURARBEIT_nochnicht);
};

func void DIA_Till_BRONKOZURARBEIT_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Jak je libo.
	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//Dobrá. Uvidím, co se dá dělat.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Ale pospěš si s tím.
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_Running;
	Log_CreateTopic(TOPIC_Bronkoeingeschuechtert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert,LOG_Running);
	B_LogEntry(TOPIC_Bronkoeingeschuechtert,"Till nedokáže Bronka přimět k práci, a proto mě požádal, abych se o to pokusil já.");
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr()
{
	if(Till_IchMachsNurEinmal == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Chci víc.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Žádný problém. Ale chci víc peněz.
		Till_IchMachsNurEinmal = TRUE;
	};
	if(Till_Angebot == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//Dobrá. Tak tedy dvacet zlatých.
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Chci víc.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 20;
	}
	else if(Till_Angebot == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//Třicet?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Chci víc.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 30;
	}
	else if(Till_Angebot == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Možná... padesát?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Chci víc.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 50;
	}
	else if(Till_Angebot == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Fajn. Sedmdesát?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Chci víc.",DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 70;
	}
	else if(Till_Angebot == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Tak dobře, dobře! Dám ti sto zlatých. Ale to je všechno, co mám.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
		};

		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT,"Dobrá. Uvidím, co se dá dělat.",DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 100;
	};
};


instance DIA_Till_BRONKOWIEDERANARBEIT(C_Info)
{
	npc = BAU_931_Till;
	nr = 7;
	condition = DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information = DIA_Till_BRONKOWIEDERANARBEIT_Info;
	description = "Bronko se vrátil do práce.";
};


func int DIA_Till_BRONKOWIEDERANARBEIT_Condition()
{
	if((MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS) && (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronko se vrátil do práce.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Vážně? To je úžasný.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Jo. A teď k mojí odměně.
	IntToFloat(Till_Angebot);
	if(Till_Angebot <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(váhavě) Hmm... Dobrá. Obchod je obchod, co?
		CreateInvItems(self,ItMi_Gold,Till_Angebot);
		B_GiveInvItems(self,other,ItMi_Gold,Till_Angebot);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Bohužel, nemám tolik peněz. Ale za tvou pomoc jsem ti velmi zavázán.
		Till_HatSeinGeldBehalten = TRUE;
	};
	B_GivePlayerXP(XP_BronkoGehtAnDieArbeit);
	AI_StopProcessInfos(self);
};


instance DIA_Till_PERMKAP1(C_Info)
{
	npc = BAU_931_Till;
	nr = 99;
	condition = DIA_Till_PERMKAP1_Condition;
	information = DIA_Till_PERMKAP1_Info;
	permanent = TRUE;
	description = "(otravovat Tilla)";
};


func int DIA_Till_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Till_HALLO) || (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Till_PERMKAP1_Info()
{
	if(Kapitel == 5)
	{
		if((MIS_bringRosiBackToSekob != LOG_SUCCESS) && (Rosi_FleeFromSekob_Kap5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Daleko od domova, že ano chlapečku? Tady ti tvůj tatík nepomůže.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Nebude to dlouho trvat a zavřu tu tvojí nevymáchanou hubu.
		};

		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ty břídile, ještě budeš mluvit o štěstí, když tě nechám naživu.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Teď mě nech na pokoji.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Možná bys měl víc jíst, abys víc vyrostl a byl silnějším.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Jednou ti ukážu.
		AI_StopProcessInfos(self);
	}
	else if(Till_HatSeinGeldBehalten == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ty jsi tak mizernej malej...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Prostě vypadni.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Máš někoho, kdo ti bude dneska foukat na nosánek?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Nech mě být, ty idiote.
	};
};

instance DIA_Till_PICKPOCKET(C_Info)
{
	npc = BAU_931_Till;
	nr = 900;
	condition = DIA_Till_PICKPOCKET_Condition;
	information = DIA_Till_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Till_PICKPOCKET_Condition()
{
	return C_Beklauen(36,40);
};

func void DIA_Till_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
	Info_AddChoice(DIA_Till_PICKPOCKET,Dialog_Back,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Till_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};

func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};