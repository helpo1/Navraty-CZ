/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Pedro_EXIT(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 999;
	condition = DIA_Pedro_EXIT_Condition;
	information = DIA_Pedro_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pedro_WELCOME(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 1;
	condition = DIA_Pedro_WELCOME_Condition;
	information = DIA_Pedro_WELCOME_Info;
	important = TRUE;
};


func int DIA_Pedro_WELCOME_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Vítej v Innosově klášteře, cizinče.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Jsem bratr Pedro, služebník Innose a strážce brány.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Co si přeješ?
};


instance DIA_Pedro_Wurst(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Wurst_Condition;
	information = DIA_Pedro_Wurst_Info;
	permanent = FALSE;
	description = "Tady, vem si klobásu, bratře!";
};


func int DIA_Pedro_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Tady, vem si klobásu, bratře!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Díky, že sis na mě vzpomněl.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Nemáš ještě?
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Na to zapomeň, pak nezbude na ostatní.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//Hele, jedna klobása... A řeknu ti, kde rostou ohnivé kopřivy.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Za ty ti Neoras určitě dá klíč od knihovny, co říkáš?
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	Info_ClearChoices(DIA_Pedro_Wurst);

	// if((Npc_HasItems(hero,ItFo_Sausage) == TRUE) && (RhetorikSkillValue[1] >= 30))
	if(Npc_HasItems(hero,ItFo_Sausage) == TRUE)
	{
		Info_AddChoice(DIA_Pedro_Wurst,
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 30, TRUE), "Tak si vezmi tuhle klobásu!"),
			// "Tak si vezmi tuhle klobásu!",
			dia_pedro_wurst_new);
	};
	if(Npc_HasItems(hero,ItFo_Schafswurst) == TRUE)
	{
		Info_AddChoice(DIA_Pedro_Wurst,"Dobře, tady máš.",DIA_Pedro_Wurst_JA);
	};

	Info_AddChoice(DIA_Pedro_Wurst,"Ne, zapomeň na to.",DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Dobře, tady máš.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Skvěle! Ty ohnivé kopřivy rostou na druhé straně mostu, po jeho stranách.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT - 3;
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Ne, zapomeň na to.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Chceš podlézat Goraxovi? Všichni novicové jsou stejní...
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

func void dia_pedro_wurst_new()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_61_01");	//Tak si vezmi tuhle klobásu!
	B_GiveInvItems(hero,self,ItFo_Sausage,1);
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_61_02");	//Díky, bratře!
	AI_UseItem(self,ItFo_Sausage);
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Ty ohnivé kopřivy rostou na druhé straně mostu, po jeho stranách.
	Info_ClearChoices(DIA_Pedro_Wurst);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
};

instance DIA_Pedro_EINLASS(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_EINLASS_Condition;
	information = DIA_Pedro_EINLASS_Info;
	permanent = FALSE;
	description = "Chci vstoupit do kláštera.";
};

func int DIA_Pedro_EINLASS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_WELCOME) && (CAPITANORDERDIAWAY == FALSE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Chci vstoupit do kláštera.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Přístup do kláštera je jen pro služebníky Innose.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Pokud se chceš pomodlit, můžeš tak učinit u některé ze svatyň podél cest.
};

instance DIA_Pedro_TEMPEL(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_TEMPEL_Condition;
	information = DIA_Pedro_TEMPEL_Info;
	permanent = FALSE;
	description = "Co musím udělat, abych mohl do kláštera?";
};

func int DIA_Pedro_TEMPEL_Condition()
{
	if((hero.guild != GIL_NOV) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Co musím udělat, abych mohl do kláštera?

	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Pro tebe není možno vstoupit.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Chceš-li být přijat mezi Innosovy služebníky, musíš žít dle pravidel kláštera.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Jestli se chceš stát novicem, měl bys přinést dar.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//Ovci a tisíc zlatých!
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//To je dost zlata!
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Je to známka toho, že se vzdáváš starého života a jeho hříchů.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//Rozmysli si to dobře, není cesty zpět.
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster,LOG_Running);
		B_LogEntry(Topic_Kloster,"Abych byl přijat mezi novice kláštera, musím přinést ovci a tisíc zlatých.");
	};
};


instance DIA_Addon_Pedro_Statuette(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Condition;
	information = DIA_Addon_Pedro_Statuette_Info;
	permanent = FALSE;
	description = "Mám tady takovou sošku...";
};


func int DIA_Addon_Pedro_Statuette_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && (MIS_Addon_Daron_GetStatue == LOG_Running) && Npc_KnowsInfo(other,DIA_Pedro_Rules) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//Mám tady takovou sošku... Myslím, že je odsud.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//Můžu nyní vstoupit?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//No, myslím, že ve výjimečných případech jako je tento, je možné odpustit dar.
		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF,LOG_Running);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF,"Pedro mě pustil do kláštera, když jsem přinesl sošku. Měl bych ji tam někomu dát.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//Obávám se, že ani tento šperk ti neotevře cestu.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//Již ses vydal jinou, klášter je ti uzavřen.
	};
};


instance DIA_Addon_Pedro_Statuette_Abgeben(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information = DIA_Addon_Pedro_Statuette_Abgeben_Info;
	permanent = FALSE;
	description = "Můžu dát tu sošku tobě?";
};


func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron) && Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//Můžu dát tu sošku tobě?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Samozřejmě, postarám se o ni, díky.
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};


instance DIA_Pedro_Rules(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 2;
	condition = DIA_Pedro_Rules_Condition;
	information = DIA_Pedro_Rules_Info;
	permanent = FALSE;
	description = "Jaká jsou pravidla, dle kterých žijete?";
};


func int DIA_Pedro_Rules_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_TEMPEL) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Jaká jsou pravidla, dle kterých žijete?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos je bůh pravdy a práva. Nesmíš lhát a páchat zločiny.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Pokud zhřešíš proti svým bratrům, musíš zaplatit pokutu.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos je bůh ohně.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Jako novic bys měl prokazovat úctu k jeho mágům.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Pochopitelně.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Kromě toho musíš pracovat pro dobro komunity.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Pokud jsi připraven ctít tato pravidla, můžeš se k nám přidat.
	};
};


instance DIA_Pedro_AUFNAHME(C_Info)
{
	npc = NOV_600_Pedro;
	condition = DIA_Pedro_AUFNAHME_Condition;
	information = DIA_Pedro_AUFNAHME_Info;
	permanent = TRUE;
	description = "Chci se stát novicem.";
};


var int DIA_Pedro_AUFNAHME_NOPERM;

func int DIA_Pedro_AUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pedro_Rules) && (DIA_Pedro_AUFNAHME_NOPERM == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Ještě o tom musím přemýšlet.",DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME,"Chci zasvětit svůj život Innosovi.",DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Chci se stát novicem.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Již sis zvolil svou cestu, brány kláštera jsou ti uzavřeny.
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Jsi si jistý? Není cesty zpět.
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,ItMi_Gold) >= Summe_Kloster) && Wld_DetectNpc(self,Follow_Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Vidím, že máš nezbytné dary. Jestli chceš, můžeš se stát novicem.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Nicméně rozmysli si to dobře, není cesty zpět!
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Nemáš požadované dary.
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Chci zasvětit svůj život Innosovi.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Pak vítej, bratře, zde je tvůj klíč od kláštera.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//Jako důkaz svého dobrovolného vstupu si každý musí odemknout bránu sám.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//V klášteře se hlas Parlanovi, postará se o tebe.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Mé hříchy jsou nyní smazány?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Ještě ne. Promluv si s mistrem Parlanem, dá ti své požehnání a sejme tvé hříchy.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	hero.guild = GIL_NOV;
	CheckHeroGuild[0] = TRUE;
	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	CanEnterKloster = TRUE;
	B_GivePlayerXP(XP_AufnahmeNovize);

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(Npc_KnowsInfo(other,DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE;
	};
	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Ještě o tom popřemýšlím.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Vrať se až budeš připraven.
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};


instance DIA_Pedro_Monastery(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 90;
	condition = DIA_Pedro_Monastery_Condition;
	information = DIA_Pedro_Monastery_Info;
	permanent = TRUE;
	description = "Řekni mi něco o životě v klášteře.";
};


func int DIA_Pedro_Monastery_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Řekni mi něco o životě v klášteře.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Sloužíme Innosovi, pracujeme pro komunitu a učíme se Písmu.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Mágové nás také učí umění magie.
};

instance DIA_Pedro_PICKPOCKET(C_Info)
{
	npc = NOV_600_Pedro;
	nr = 900;
	condition = DIA_Pedro_PICKPOCKET_Condition;
	information = DIA_Pedro_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Pokusit se ukrást klíč)";
};

func int DIA_Pedro_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,Dialog_Back,DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		B_Attack(self,other,AR_Theft,1);
		self.vars[0] = TRUE;
	};
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};


instance DIA_PEDRO_PASSKLOSTER(C_Info)
{
	npc = NOV_600_Pedro;
	condition = dia_pedro_passkloster_condition;
	information = dia_pedro_passkloster_info;
	permanent = FALSE;
	description = "Musím za mistrem Goraxem.";
};


func int dia_pedro_passkloster_condition()
{
	if((MIS_CHURCHDEAL == LOG_Running) && (CAPITANORDERDIAWAY == FALSE) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && !Npc_KnowsInfo(hero,dia_gorax_trademewine))
	{
		return TRUE;
	};
};

func void dia_pedro_passkloster_info()
{
	if(!Npc_HasItems(other,ItKe_Innos_MIS))
	{
		AI_Output(other,self,"DIA_Pedro_PassKloster_01_00");	//Musím za mistrem Goraxem.
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_01");	//Proč?
		AI_Output(other,self,"DIA_Pedro_PassKloster_01_02");	//Mám u něj domluvit obchod s vínem. Je v klášteře?
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_03");	//Ano. Tady máš klíč od brány, ale moc se tam nezdržuj.
		B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
		CanEnterKloster = TRUE;
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_04");	//Mistr Gorax je v budově napravo od vchodu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Pedro_PassKloster_01_06");	//Musím za Goraxem.	
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_07");	//Proč?
		AI_Output(other,self,"DIA_Pedro_PassKloster_01_08");	//Musím domluvit obchod s vínem, pomůžeš mi?
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_10");	//No, buď zdvořilý, to je vše, co ti můžu říct.
		AI_Output(self,other,"DIA_Pedro_PassKloster_01_11");	//Je v budově napravo od vchodu.
		CanEnterKloster = TRUE;
		AI_StopProcessInfos(self);
	};
};