
instance DIA_Hyglas_Kap1_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Feuer(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Feuer_Condition;
	information = DIA_Hyglas_Feuer_Info;
	permanent = FALSE;
	description = "Musím projít zkouškou Ohně.";
};


func int DIA_Hyglas_Feuer_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//Musím projít zkouškou Ohně.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//Zkouška Ohně je z dávných dob a nikdo jí už dlouho nepodstoupil.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//To co žádáš je příliš nebezpečné. Radši už o tom nepřemýšlej.
};


instance DIA_Hyglas_Hallo(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_Hallo_Condition;
	information = DIA_Hyglas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hyglas_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//Jsem mistr Hyglas, mág Ohně a Strážce Vědomostí.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//Takže ti mistr Parlan dovolil studovat spisy.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Pak je to jen na tobě. Studuj, abys v spisech našel osvícení.
	};
};


instance DIA_Hyglas_JOB(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_JOB_Condition;
	information = DIA_Hyglas_JOB_Info;
	permanent = FALSE;
	description = "Na čem pracuješ, mistře?";
};


func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//Na čem pracuješ, mistře?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//Můj výzkum se soustřeďuje na oheň, silu Innose.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//Je to dar a současně mocná zbraň – a já vytvářím runy, které tuto moc obsahují.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Velmi zajímavé. Můžeš mě to naučit?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//Tuto moc dává Innos. Jak jí zvládat je dané jen mágům Ohně, služebníkům Innose.
	};
};


instance DIA_Hyglas_CONTEST(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_CONTEST_Condition;
	information = DIA_Hyglas_CONTEST_Info;
	permanent = FALSE;
	description = "Žádal jsem o podstoupení Zkoušky Ohně.";
};


func int DIA_Hyglas_CONTEST_Condition()
{
	if(MIS_RUNE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//Žádal jsem o podstoupení Zkoušky Ohně. Ulthar mi dal úlohu vytvořit runu Ohnivého šípu.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//A teď chceš, abych tě naučil, jak?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//Nevím, jak jinak by to mohlo být.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//V pořádku, naučím tě to. Ale nejprve musíš najít všechny potřebné ingredience.
	B_LogEntry(TOPIC_Rune,"Hyglas je připravený naučit mě vyrobit runu Ohnivého šípu, pokud budu mít všechny věci na její výrobu.");
};


instance DIA_Hyglas_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_FIREBOLT_Condition;
	information = DIA_Hyglas_FIREBOLT_Info;
	permanent = FALSE;
	description = "Jaké věci jsou potřebné na výrobu runy Ohnivého šípu?";
};


func int DIA_Hyglas_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (MIS_RUNE == LOG_Running) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//Jaké věci jsou potřebné na výrobu runy Ohnivého šípu?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Přečti si to – je to v tamtěch knihách.
};


instance DIA_Hyglas_TALENT_FIREBOLT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 990;
	condition = DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information = DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent = TRUE;
	description = "Nauč mě vyrobit runu OHNIVÉHO ŠÍPU.";
};


func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_CONTEST) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE) && (Npc_HasItems(other,ItMi_RuneBlank) >= 1) && (Npc_HasItems(other,ItSc_Firebolt) >= 1) && (Npc_HasItems(other,ItMi_Sulfur) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Nauč mě vyrobit runu OHNIVÉHO ŠÍPU.

	if(B_TeachPlayerTalentRunes(self,other,SPL_Firebolt))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//Abys ji vyrobil, potřebuješ spojit pryskyřici s prázdným runovým kamenem.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//Síla svitku Ohnivého šípu projde do runy a ty budeš mít Innosův nástroj.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//Jakmile budeš mít všechny potřebné věci, přistup k runovému stolu a vytvoř runu.
	};
};


instance DIA_Hyglas_BLANK_RUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 9;
	condition = DIA_Hyglas_BLANK_RUNE_Condition;
	information = DIA_Hyglas_BLANK_RUNE_Info;
	permanent = FALSE;
	description = "Kde můžu získat prázdnou runu?";
};


func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Hyglas_FIREBOLT) && (MIS_RUNE == LOG_Running) && (Npc_HasItems(other,ItMi_RuneBlank) < 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Kde můžu získat prázdnou runu?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Tys požádal o Zkoušku ohně, ne já. Najít ji je část Zkoušky.
};


instance DIA_Hyglas_GOTRUNE(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 2;
	condition = DIA_Hyglas_GOTRUNE_Condition;
	information = DIA_Hyglas_GOTRUNE_Info;
	permanent = FALSE;
	description = "Vytvořil jsem runu.";
};


func int DIA_Hyglas_GOTRUNE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Ulthar_SUCCESS) == FALSE) && (Npc_HasItems(hero,ItRu_FireBolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//Vytvořil jsem runu.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Výtečně. Vypadá to, žes prošel zkouškou. Ani to nebylo tak těžké.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Jdi k Ultharovi a ukaž mu runu.
	B_LogEntry(TOPIC_Rune,"Runa Ohnivého šípu je vytvořena.");
};


instance DIA_Hyglas_Kap2_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap3_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_BringBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent = FALSE;
	description = "Jsou nějaké novinky?";
};


func int DIA_Hyglas_BringBook_Condition()
{
	if((Kapitel >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Jsou nějaké novinky?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, ano. Pravděpodobně jsi již spatřil ty postavy v černých kápích.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//Střetl jsem je.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//Tohle nás přivádí k jádru situace. Momentálně pozorujeme velice vzácné postavení hvězd.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//Abych byl přesný, znamení až teď stojí v přesné rovině se znamením Válečníka. Předpokládám, že víš, co to znamená.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmm. Abych byl upřímný...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Ha. Nemohu ti to teď vše vykládat, ale určitě to předznamenává veliké změny. A já změny rád nemám.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Chci abys mi donesl knihu. Jmenuje se Božská moc hvězd. Možná po ní budeš muset chvíli pátrat, ale jsem si jistý, že jí najdeš.
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook,"Najdi si ji sám.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook,"Co za to dostanu?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook,"Uvidím, zda se mi ji podaří najít.",DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Najdi si ji sám.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//Ty se opovažuješ hovořit se mnou takovým tónem? Tvé chování mi neprokazuje dostatečný respekt.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Zmiz mi z očí a popřemýšlej o sobě.
	MIS_HyglasBringBook = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//Co tím myslíš?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//Chtěl bych vědět, co mi dáš, když ti tu knihu přinesu.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nic. Cos čekal? Když máš čas jít do města, je tvou povinností mi pomoct.
	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//Uvidím, zda se mi ji podaří najít.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//To je dobře – teď mám čas prověřit i pár dalších věcí.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//Ale ať ti to netrvá příliš dlouho – nemáme již mnoho času.
	MIS_HyglasBringBook = LOG_Running;
	Info_ClearChoices(DIA_Hyglas_BringBook);
	Log_CreateTopic(TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook,LOG_Running);
	B_LogEntry(TOPIC_HyglasBringBook,"Měl bych opatřit Hyglasovi knihu 'Božská moc hvězd'. Měl bych hledat u obchodníků ve městě.");
};


instance DIA_Hyglas_HaveBook(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 38;
	condition = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent = FALSE;
	description = "Mám tu tvoji knihu.";
};


func int DIA_Hyglas_HaveBook_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook) && (Npc_HasItems(other,ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//Mám tu tvoji knihu.

	if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Výtečně, dej mi ji.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//Takže tys nakonec změnil svůj názor. Výtečně. Kde je ta kniha?
	};
	B_GiveInvItems(other,self,ItWr_Astronomy_Mis,1);
	MIS_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//Můžeš odejít. Budu dál studovat.
};


instance DIA_Hyglas_Kap4_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_Kap4_PERM(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 49;
	condition = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent = TRUE;
	description = "A na cos přišel?";
};


func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//A na cos přišel?
	if(MIS_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Nemůžu si být úplně jistý, ale současné postavení hvězd předznamenáva jisté nebezpečí.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//Jaké nebezpečí.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Hranice mezi světy se zdá být velice slabá. Jenom malá síla by byla potřebná na vytvoření díry do ní.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Démoni by jí mohli použít na vstup do nášho světa bez odporu.
		Hyglas_SendsToKarras = TRUE;
	}
	else if(MIS_HyglasBringBook == LOG_Running)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//Ne, stále čekám na knihu.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//Řekl jsem ti, že to stále zkoumám, ale bez potřebných materiálu to samozřejmě bude trvat déle.
	};
};


instance DIA_Hyglas_Kap5_EXIT(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 999;
	condition = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hyglas_PICKPOCKET(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 900;
	condition = DIA_Hyglas_PICKPOCKET_Condition;
	information = DIA_Hyglas_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_80;
};


func int DIA_Hyglas_PICKPOCKET_Condition()
{
	return C_Beklauen(73,200);
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,Dialog_Back,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 90)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,50);
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

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};


instance DIA_HYGLAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 1;
	condition = dia_hyglas_runemagicnotwork_condition;
	information = dia_hyglas_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_hyglas_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Hyglas_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Hyglas_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Hyglas_RuneMagicNotWork_01_02");	//A co ostatni?
	AI_Output(self,other,"DIA_Hyglas_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatnim mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Hyglas_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_HIGLAS_TEACHBLROBS(C_Info)
{
	npc = KDF_510_Hyglas;
	nr = 1;
	condition = dia_higlas_teachblrobs_condition;
	information = dia_higlas_teachblrobs_info;
	permanent = FALSE;
	description = "Můžeš mě něčemu naučit?";
};

func int dia_higlas_teachblrobs_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_higlas_teachblrobs_info()
{
	AI_Output(other,self,"DIA_higlas_TeachBlRobs_01_01");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_higlas_TeachBlRobs_01_02");	//Jestli máš na mysli magii - neučím nováčky. Na to je ještě příliš brzy.
};