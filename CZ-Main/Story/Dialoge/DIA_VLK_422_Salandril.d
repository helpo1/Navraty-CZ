
instance DIA_Salandril_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_PICKPOCKET(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_Salandril_PICKPOCKET_Condition;
	information = DIA_Salandril_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Tenhle klíč lze snadno ukrást)";
};


var int DIA_Salandril_PICKPOCKET_perm;

func int DIA_Salandril_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (DIA_Salandril_PICKPOCKET_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,Dialog_Back,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		CreateInvItems(self,ItKe_Salandril,1);
		B_GiveInvItems(self,other,ItKe_Salandril,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
};


instance DIA_Salandril_Hallo(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Hallo_Condition;
	information = DIA_Salandril_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Vítej, poutníku, hledáš nějaký dobrý lektvar?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//U mě najdeš velký výběr za přijatelné ceny, a mé lektvary jsou mnohem lepší než ty patoky, které prodává Zuris.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Salandril prodává lektvary. Jeho obchod najdu v horní čtvrti.");
};

instance DIA_Salandril_Trade(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 9;
	condition = DIA_Salandril_Trade_Condition;
	information = DIA_Salandril_Trade_Info;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
	trade = TRUE;
};


func int DIA_Salandril_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Salandril_KLOSTER) == FALSE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Ukaž mi své zboží.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//Je mi potěšením, ctihodný bratře.
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//Je mi potěšením, šlechetný válečníku.
	};
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_03");	//S radostí!
	};

	B_GiveTradeInv(self);
};


instance DIA_Salandril_KAP3_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP3_EXIT_Condition;
	information = DIA_Salandril_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Salandril_KLOSTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_KLOSTER_Condition;
	information = DIA_Salandril_KLOSTER_Info;
	description = "Teď se vyprav do kláštera - budeš souzen.";
};

func int DIA_Salandril_KLOSTER_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//Teď se vyprav do kláštera - budeš souzen.
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//Cože? To jako abych zvednul zadek? Houby s octem! Ti mizerní mágové proti mně nemají jediný důkaz!

	if((hero.guild == GIL_KDF) && (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//A co ty falešné důlní akcie, které jsi prodával na ulicích po celé zemi? Nesou tvůj podpis. Jsi vinen.
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//Mám své příkazy a ty taky vyplním. Takže buď půjdeš po dobrém, nebo po zlém.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//Cože? Klidně tě přes město potáhnu za límec jako kus špinavého hadru!
	CreateInvItems(self,ItKe_Salandril,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Salandril_GehinsKloster(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_GehinsKloster_Condition;
	information = DIA_Salandril_GehinsKloster_Info;
	description = "Tak půjdeš do toho kláštera, nebo chceš ještě jednu?";
};

func int DIA_Salandril_GehinsKloster_Condition()
{
	if(((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running)) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(other,DIA_Salandril_KLOSTER))
	{
		return TRUE;
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//Tak půjdeš do toho kláštera, nebo chceš ještě jednu?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//Toho budeš litovat. Jo, ksakru, půjdu do toho pitomýho kláštera, ale nemysli si, že je to vyřízené.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;

	if(MIS_SALANDRILRESECH == LOG_Running)
	{
		MIS_SALANDRILRESECH = LOG_OBSOLETE;
	};
};


instance DIA_Salandril_Verschwinde(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Verschwinde_Condition;
	information = DIA_Salandril_Verschwinde_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Salandril_Verschwinde_Condition()
{
	if((MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Verschwinde_Info()
{
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SALANDRILHELP);
	};
	B_Verschwinde_Stimme13();
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP4_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP4_EXIT_Condition;
	information = DIA_Salandril_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP5_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP5_EXIT_Condition;
	information = DIA_Salandril_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP6_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP6_EXIT_Condition;
	information = DIA_Salandril_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_RECEPTFORTYON(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_receptfortyon_condition;
	information = dia_salandril_receptfortyon_info;
	permanent = FALSE;
	description = "Mám otázku. Slyšel jsem o jednom velmi zvláštním lektvaru.";
};


func int dia_salandril_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_salandril_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Salandril_ReceptForTyon_01_00");	//Mám otázku. Slyšel jsem o jednom velmi zvláštním lektvaru.
	AI_Output(other,self,"DIA_Salandril_ReceptForTyon_01_02");	//Je schopen ovlivnit vědomí člověka. Neslyšel jsi o tom?
	AI_Output(self,other,"DIA_Salandril_ReceptForTyon_01_03");	//Ne... O takových lektvarech slyším poprvé!
	AI_Output(self,other,"DIA_Salandril_ReceptForTyon_01_05");	//Nuuu... Zkus se zeptat ostatních alchymistů ve městě.
};


instance DIA_SALANDRIL_TALIASANLETTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_taliasanletter_condition;
	information = dia_salandril_taliasanletter_info;
	permanent = FALSE;
	description = "Můžeš mi pomoci?";
};


func int dia_salandril_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_00");	//Můžeš mi pomoci?
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_01");	//A s čím?!... (udiveně)
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_02");	//Je pro mě velmi důležité, abys pro jednu osobu napsal dopis s doporučením o tom, že je dobrý občan.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_03");	//Možná výměnou za jednu službičku, abych do toho dopisu měl co napsat, chápeš?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_06");	//Ty jsi mi moc nerozuměl - já nejsem ta osoba.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_07");	//A kdo tedy, jestli to není tajemství?!... (udiveně)
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_08");	//Jmenuje se Gallahad.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_13");	//A kvůli komu?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_14");	//Mno, kvůli Lariusovi.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_20");	//Asi máš pravdu... (zaskočen) Dobrá, napíši to doporučení.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_21");	//Ale budu za to chtít menší službu.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_24");	//Nic nemožného. Prostě mi seženeš jeden lektvar a já ti dám ten dopis.
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_32");	//A?
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_33");	//Údajně tento lektvar skřeti používají ke zvýšení síly a vytrvalosti.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_34");	//Takže se k němu dostaneš asi jen u skřeta...
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_38");	//No dobrá, zkusím ho získat.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_39");	//Slyšel jsem, že jeden lovec nedávno viděl skřeta za jižní bránou.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_40");	//Možná tam něco najdeš.
	Wld_InsertNpc(orcwarrior_salandril,"NW_CITY_SMFOREST_03_M");
	MIS_SALANDRILHELP = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_Running);
	B_LogEntry(TOPIC_SALANDRILHELP,"Salandril mi napíše doporučující dopis pro Gallahada, když mu přinesu skřetí lektvar. V blízkosti jižní brány města byl viděn skřet.");
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_GIVEPOTION(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_givepotion_condition;
	information = dia_salandril_givepotion_info;
	permanent = FALSE;
	description = "Mám ten skřetí lektvar.";
};


func int dia_salandril_givepotion_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_SALANDRILHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itpo_xorcpotion) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_givepotion_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_00");	//Mám ten skřetí lektvar.
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_01");	//Opravdu?!... Ukaž!
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_02");	//Tady! Patřil jednomu skřetovi.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_03");	//Bezva! Nyní můžu studovat jeho strukturu!
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_04");	//Studuj co chceš, ale chci ten dopis pro Gallahada.
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_05");	//Ach ano! Málem bych zapomněl! Zde je!
	B_GiveInvItems(self,other,itwr_salandrilletter,1);
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_09");	//Nádhera! A teď odpusť, jdu studovat ten elixír!
	MIS_SALANDRILHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_SALANDRILHELP,"Donesl jsem Salandrilovi ten lektvar a on mi dal dopis s doporučením pro Gallahada.");
	AI_StopProcessInfos(self);
};

instance DIA_SALANDRIL_ORCRUM(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum_condition;
	information = dia_salandril_orcrum_info;
	permanent = FALSE;
	description = "Podívej co mám.";
};

func int dia_salandril_orcrum_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (MIS_SALANDRILHELP == LOG_SUCCESS) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itfo_addon_orcrum) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Salandril_ORCRUM_01_00");	//Podívej co mám. Nějaký skřetí dryák.
	B_GiveInvItems(other,self,itfo_addon_orcrum,1);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,1);
	AI_Output(self,other,"DIA_Salandril_ORCRUM_01_01");	//Něco takového jsem ještě neviděl. Nechej mi ho tu a vrať se za pár dní. Potřebuji čas na to, abych zjistil, co to je.
	ORCRUMDAY = Wld_GetDay();
	MIS_SALANDRILRESECH = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILRESECH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_Running);
	B_LogEntry(TOPIC_SALANDRILRESECH,"Salandril se snaží zjistit, na co by ten skřetí dryák mohl být. Mám se vrátit za pár dní.");
};


instance DIA_SALANDRIL_ORCRUM2(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum2_condition;
	information = dia_salandril_orcrum2_info;
	permanent = FALSE;
	description = "Tak na co jsi přišel?";
};

func int dia_salandril_orcrum2_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (ORCRUMDAY < (Wld_GetDay() - 1)))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum2_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Salandril_ORCRUM2_01_00");	//Tak na co jsi přišel?
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_01");	//Dryáku bylo strašně málo, takže jsem byl schopný udělat jen základní testy.
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_02");	//Ale je jasné, že má zajímavé a unikátní vlastnosti, které odhalí jen další výzkum.
	AI_Output(other,self,"DIA_Salandril_ORCRUM2_01_04");	//Takže chceš, abych ti toho dryáku přinesl víc?
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_05");	//Pochopil jsi to správně. Pokud mi doneseš dalších 10 flašek, tak budu pokračovat ve výzkumu.
	SALFIRST = TRUE;
	B_LogEntry(TOPIC_SALANDRILRESECH,"Salandril chce, abych mu donesl 10 flašek toho skřetího dryáku.");
};


instance DIA_SALANDRIL_ORCRUM3(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum3_condition;
	information = dia_salandril_orcrum3_info;
	permanent = FALSE;
	description = "Mám těch 10 flašek.";
};

func int dia_salandril_orcrum3_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALFIRST == TRUE) && (Npc_HasItems(other,itfo_addon_orcrum) >= 10))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum3_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Salandril_ORCRUM3_01_00");	//Mám těch 10 flašek.
	B_GiveInvItems(other,self,itfo_addon_orcrum,10);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
	AI_Output(self,other,"DIA_Salandril_ORCRUM3_01_01");	//Perfektní. Takže můj výzkum může pokračovat.
	AI_Output(self,other,"DIA_Salandril_ORCRUM3_01_03");	//Vrať se později a možná o tom dryáku budu vědět víc.
	SALANDRILRESECHPOTION = Wld_GetDay();
	B_LogEntry(TOPIC_SALANDRILRESECH,"Salandril dostal těch 10 flašek na výzkum. Mám se zastavit později.");
};


instance DIA_SALANDRIL_ORCRUM4(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum4_condition;
	information = dia_salandril_orcrum4_info;
	permanent = TRUE;
	description = "Něco nového?";
};

func int dia_salandril_orcrum4_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALANDRILRESECHPOTION != FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum4_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM4_01_00");	//Něco nového?

	if((Kapitel >= 2) && (SALANDRILRESECHPOTION <= (Wld_GetDay() - 2)))
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_01");	//Mám objev...
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_02");	//Dokážu vytvořit s pomocí toho skřetího dryáku zajímavý lektvar.
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_03");	//Na jeden lektvar potřebuji 10 flašek toho skřetího dryáku a 300 zlatých. A to už máš i se slevou.
		CanMakeSimpleOrcPotion = TRUE;
		MIS_SALANDRILRESECH = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALANDRILRESECH,"Salandril mi dokáže vyrobit nějaký nový lektvar, bude potřebovat 10 flašek toho skřetího dryáku a 300 zlatých.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_09");	//Ještě jsem neskončil s pokusy. Vrať se za pár dní.
	};
};

instance DIA_SALANDRIL_ORCRUM5(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum5_condition;
	information = dia_salandril_orcrum5_info;
	permanent = FALSE;
	description = "Uvař mi lektvar. (cena: 300 zlatých)";
};

func int dia_salandril_orcrum5_condition()
{
	if((CanMakeSimpleOrcPotion == TRUE) && (Npc_HasItems(other,itfo_addon_orcrum) >= 10) && (SalPotionOneTime == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum5_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM51_01_00");	//Uvař mi lektvar.

	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		B_GiveInvItems(other,self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(other,ItMi_Gold,300);
		AI_Output(self,other,"DIA_Salandril_ORCRUM51_01_01");	//Takže ses rozhodl ho zkusit. Výborně! Přijď zítra, lektvar bude připravený.
		ORCRUMDAY4 = Wld_GetDay();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Salandril_ORCRUM51_03_90");	//Nemáš dost zlata!
		AI_StopProcessInfos(self);
	};
};

instance DIA_SALANDRIL_ORCRUM6(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum6_condition;
	information = dia_salandril_orcrum6_info;
	permanent = FALSE;
	description = "Je můj lektvar připravený?";
};

func int dia_salandril_orcrum6_condition()
{
	var int DaySNow;

	DaySNow = Wld_GetDay();

	if((CanMakeSimpleOrcPotion == TRUE) && (ORCRUMDAY4 < DaySNow) && (ORCRUMDAY4 > 0))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum6_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM6_01_00");	//Je můj lektvar připravený?
	AI_Output(self,other,"DIA_Salandril_ORCRUM6_01_01");	//Ano. Tu je.
	B_GiveInvItems(self,other,itfo_addon_orcrumsal,1);
	AI_Output(self,other,"DIA_Salandril_ORCRUM6_01_02");	//Jeho efekt může být vcelku nečekaný. Nezodpovídám za následky.
	SalPotionOneTime = TRUE;
};

instance DIA_SALANDRIL_MyBrew(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_MyBrew_condition;
	information = dia_salandril_MyBrew_info;
	permanent = FALSE;
	description = "Mohl by ses podívat na jeden alchymistický recept?";
};

func int dia_salandril_MyBrew_condition()
{
	if((MIS_MyBrew == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,ItWr_ConstRecept) >= 1) && (FTConsPotion == TRUE) && (KnowFakeRecept == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_MyBrew_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_00");	//Mohl bys ses podívat na jeden alchymistický recept?
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_01");	//Samozřejmě! Ukaž mi ho.
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_02");	//Tu je.
	B_GiveInvItems(other,self,ItWr_ConstRecept,1);
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_03");	//Takže, co to tu máme...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_04");	//Hmm... Co za blázna toto napsal?
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_05");	//Cože?!
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_06");	//Přísady toho lektvaru jsou nespojitelné.
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_07");	//Navíc některé z nich se ani v alchymii nepoužívají. Totální blbost!
	B_GiveInvItems(self,other,ItWr_ConstRecept,1);
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_08");	//Takže kdo to napsal?
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_09");	//Bude lepší, když ti to nepovím.
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_10");	//Dobře, nechceš - tak mi to neříkej... (pochechtávání) Ale ten, kdo to psal, by měl jednoznačně změnit zaměstnání.
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_11");	//Jako alchymista je nanic.
	KnowFakeRecept = TRUE;
	B_LogEntry(TOPIC_MyBrew,"Ukázal jsem Salandrilovi Constantinův recept. Vypadá to, že se mě pokusil podvést, protože pro skutečného alchymistu je úplně na nic.");
};

instance DIA_SALANDRIL_PureElixir(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_PureElixir_condition;
	information = dia_salandril_PureElixir_info;
	permanent = FALSE;
	description = "Vatras si chce objednat nějaké lektvary čisté magické síly.";
};

func int dia_salandril_PureElixir_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (Npc_HasItems(other,ItMi_Gold) >= 200))
	{
		return TRUE;
	};
};

func void dia_salandril_PureElixir_info()
{
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_00");	//Vatras si chce objednat nějaké lektvary čisté magické síly.
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_01");	//Tu je 200 zlatých, které máš jako zálohu za práci.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_02");	//Samozřejmě je pro mě velkou poctou splnit tuto objednávku.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_03");	//Ale formule tohoto lektvaru je příliš komplexní, takže budu potřebovat aspoň týden.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_04");	//Určitě bych nechtěl nechat Vatrase tak dlouho čekat, ale jinak to nejde.
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_05");	//Dobře, povím mu to.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_06");	//Eh, počkej chvilku... (nervózně) Myslím, že tu ještě pár těch lektvarů mám.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_07");	//Ach ano, tady jsou. Pár lektvarů, aby mu náhodou nedošly.
	B_GiveInvItems(self,other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_08");	//Dej mu je a pozdravuj ho. Nezapomeň.
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_09");	//Samozřejmě.
	SalandrilPureElixir = TRUE;
	B_LogEntry(TOPIC_VatrasPotion,"Salandril přijal Vatrasovu objednávku, ale než se lektvary uvaří, potrvá to aspoň týden. Takže mi dal pár lektvarů do zásoby pro Vatrase.");
};

//------------------------------------------kosti-------------------------------------

instance DIA_VLK_422_Salandril_Game(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_Game_condition;
	information = DIA_VLK_422_Salandril_Game_info;
	description = "Kardif říkal, že hraješ kostky.";
};

func int DIA_VLK_422_Salandril_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Salandril_Hallo) && (GameOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_Game_info()
{
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_00"); //Kardif říkal, že hraješ kostky.
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_01"); //Ano, to má pravdu. Ale ne s kýmkoliv!
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_02"); //A se mnou by sis zahrál?
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_03"); //S tebou? Někdo tě na to nalákal?
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_04"); //Pojďme hrát a možná to zjistíš.
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_05"); //Dobře. Jak myslíš.
	SalandrilPlayResult = 250;
	Menu_WriteInt("AST","SysTimer02",0);
};

instance DIA_VLK_422_Salandril_GamePlay(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_VLK_422_Salandril_GamePlay_condition;
	information = DIA_VLK_422_Salandril_GamePlay_info;
	permanent = TRUE;
	description = "Pojďme hrát kostky!";
};

func int DIA_VLK_422_Salandril_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_422_Salandril_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer02");

	if(CheckLastGame >= SalandrilPlayResult)
	{
		CheckLastSum = CheckLastGame - SalandrilPlayResult;
	};

	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_01_00");	//Pojďme hrát kostky!

	if(SalandrilPlayResult >= CheckLastGame)
	{
		if((SalandrilPlayResult > 0) && (SalandrilDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_01");	//Pojďme teda na to!
			PlayPocker(1,self);
		}
		else
		{
			if(SalandrilDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_02");	//Ne, stačilo! Už mi skoro nic nezůstalo. 
				SalandrilDayPlay = Wld_GetDay();
				SalandrilDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_03");	//Ani náhodou.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_04");	//Naposledy jsi mi nedal mojí výhru.
		AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_05");	//No tak, já čekám!
		Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_422_Salandril_GamePlay,"Tu jsou tvoje peníze.",DIA_VLK_422_Salandril_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_422_Salandril_GamePlay,"Nemám tolik.",DIA_VLK_422_Salandril_GamePlay_No);
	};
};

func void DIA_VLK_422_Salandril_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SalandrilPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_Here_01_01");	//Tu jsou tvoje peníze.
	AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_Here_01_02");	//Dobře. Teď můžeme hrát...
	PlayPocker(1,self);
};

func void DIA_VLK_422_Salandril_GamePlay_No()
{
	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_No_01_01");	//Nemám tolik.
	AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_No_01_02");	//To není můj problém.
	Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);
};

instance DIA_VLK_422_Salandril_GameEnd(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_GameEnd_condition;
	information = DIA_VLK_422_Salandril_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_422_Salandril_GameEnd_condition()
{
	if((MustTellResult_Salandril == TRUE) && ((SalandrilLost == TRUE) || (SalandrilWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GameEnd_info()
{
	if(SalandrilLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GameEnd_00");	//Jak jsi to dokázal? To není možné.
		SalandrilLost = FALSE;
	}
	else if(SalandrilWon == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GameEnd_01");	//Tentokrát stála štěstěna na mojí straně.
		SalandrilWon = FALSE;
	};

	MustTellResult_Salandril = FALSE;
};

instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Fernando_Minental_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hej ty - počkej chvíli. Tebe poslali do Hornického údolí, že?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//A?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Mám pro tebe návrh. Ty mi povíš, co se děje s rudou a já ti dám...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... runový kámen.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... prsten, co ti zvýší výdrž.
	};

	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Uvidím, co se dá udělat.
	MIS_SalandrilOre = LOG_Running;
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Salandril chce vědět, co se děje v Hornickém údolí.");
};

instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Byl jsem v Hornickém údolí.";
};

func int DIA_Fernando_Success_Condition()
{
	if((MIS_SalandrilOre == LOG_Running) && (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Byl jsem v Hornickém údolí.
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//A? Jak to tam vypadá?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Doly jsou vytěžené. Bylo možné vytěžit jen pár beden rudy. Je nepravděpodobné, že se to vyplatilo.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//To není možné! Jsem totálně v prdeli...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//A naše dohoda?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Nuže...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Tu, seber si tento runový kámen.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Tu máš svůj prsten.
		B_GiveInvItems(self,other,ItRi_Hp_02,1);
	};

	MIS_SalandrilOre = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Fernando,LOG_SUCCESS);
	B_LogEntry(TOPIC_Fernando,"Salandril nebyl ze situace v údolí zrovna nadšený. Je divné, že ho ty zprávy tak zasáhly.");
};
