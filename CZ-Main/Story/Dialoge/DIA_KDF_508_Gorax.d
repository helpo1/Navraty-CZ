
instance DIA_Gorax_Kap1_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap1_EXIT_Condition;
	information = DIA_Gorax_KAp1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KAp1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gorax_NoEnter_PissOff(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_Gorax_NoEnter_PissOff_Condition;
	information = DIA_Gorax_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gorax_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Gorax_NoEnter_PissOff_01_00");	//Hmm... (naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Gorax_PICKPOCKET(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 888;
	condition = DIA_Gorax_PICKPOCKET_Condition;
	information = DIA_Gorax_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(pokusit se ukrást jeho klíč)";
};

func int DIA_Gorax_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,Dialog_Back,DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		CreateInvItems(self,ItKe_KlosterStore,1);
		B_GiveInvItems(self,other,ItKe_KlosterStore,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	}
	else
	{
		Print("Požadovaná obratnost: 100");

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

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};


instance DIA_Gorax_HELP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_HELP_Condition;
	information = DIA_Gorax_HELP_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gorax_HELP_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Můžu ti s něčím pomoct?
};


instance DIA_Gorax_GOLD(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_GOLD_Condition;
	information = DIA_Gorax_GOLD_Info;
	permanent = TRUE;
	description = "Přinesl jsem spoustu zlata.";
};


var int DIA_Gorax_GOLD_perm;

func int DIA_Gorax_GOLD_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//Přinesl jsem spoustu zlata.
	if(Npc_HasItems(other,ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(s radostí) Ach - dar Innosovi! Velmi dobře, synu.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//Použiji ho na dobro kláštera. Innose to velmi potěší.
		DIA_Gorax_GOLD_perm = TRUE;
		B_GiveInvItems(other,self,ItMi_Gold,Summe_Kloster);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi udělal s tím zlatem? Ztratil si ho? Běž ho získat zpátky a potom se vrať!
	};
};


instance DIA_Addon_Gorax_DaronsStatue(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Addon_Gorax_DaronsStatue_Condition;
	information = DIA_Addon_Gorax_DaronsStatue_Info;
	permanent = TRUE;
	description = "Mám sošku, kterou měl Daron přinést do kláštera.";
};


func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if((other.guild == GIL_NOV) && (DIA_Gorax_GOLD_perm == FALSE) && (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Podívej se, mám sošku, kterou měl Daron přinést do kláštera.
	if(Npc_HasItems(other,ItMi_LostInnosStatue_Daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(povzdechne si) Je vážně zahanbující, že nám takový cenný kus musel přinést novic.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Ať už je to jakkoli, toto dokazuje, že jsi připraven oddaně sloužit Innosovi.
		if(B_GiveInvItems(other,self,ItMi_LostInnosStatue_Daron,1))
		{
			Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//Jsem ti velice zavázán, mladíku.
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Soška? Nevidím žádnou sošku. Přines mi ji a snad ti uvěřím.
	};
};


instance DIA_Gorax_SLEEP(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 4;
	condition = DIA_Gorax_SLEEP_Condition;
	information = DIA_Gorax_SLEEP_Info;
	description = "Hledám místo, kde bych se mohl vyspat.";
};


func int DIA_Gorax_SLEEP_Condition()
{
	if((DIA_Gorax_GOLD_perm == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//Hledám místo, kde bych se mohl vyspat.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//Jedna prázdná postel je ve vedlejší místnosti. První napravo, hned při dveřích. Můžeš spát tam.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//Své věci si můžeš uložit do prázdné truhly.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//A pamatuj si – v komnatách mágů nemáš co dělat. Taktéž bez povolení nemůžeš vstoupit do knihovny.
};


instance DIA_Gorax_Aufgabe(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe_Condition;
	information = DIA_Gorax_Aufgabe_Info;
	permanent = FALSE;
	description = "Máš pro mě úkol?";
};


func int DIA_Gorax_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//Máš pro mě úkol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//Vy novici v posledním čase pracujete velice tvrdě. A ti, co mnoho pracují, by měli i mnoho jíst.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//Proto ti dávám klíč od spižírny. Najdi tam nějaké skopové klobásy. Rozděl je novicům, ale buď férový!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//Jakmile skončíš, přijď znovu za mnou.
	CreateInvItems(self,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	MIS_GoraxEssen = LOG_Running;
	Log_CreateTopic(Topic_GoraxEssen,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen,LOG_Running);
	B_LogEntry(Topic_GoraxEssen,"Mistr Gorax chce, abych férově rozdělil klobásy ze spížírny mezi ostatní novice. Kromě mě je jich tu ještě třináct.");
};


instance DIA_Gorax_Wurst(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_Wurst_Condition;
	information = DIA_Gorax_Wurst_Info;
	permanent = TRUE;
	description = "Rozdal jsem všechny klobásy.";
};


func int DIA_Gorax_Wurst_Condition()
{
	if((MIS_GoraxEssen == LOG_Running) && (Mob_HasItems("WURSTTRUHE",ItFo_Schafswurst) == 0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//Rozdal jsem všechny klobásy.

	if(Wurst_Gegeben >= 14)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//A udělal jsi to férově. Přijmi tyto svitky léčení a vrať se ke své práci.
		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self,other,ItSc_LightHeal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Vážně? Zřejmě jsi nevynaložil dostatečné úsilí na splnění svého úkolu.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//Takže, buď jsi ty klobásy snědl sám, anebo jsi dal někomu víc, než mu náleželo.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Poslouchej, jelikož jsi tu nový – a to jen a jen proto – ti to pro tentokrát odpustím. Nechci, aby se to opakovalo, novici!
		MIS_GoraxEssen = LOG_FAILED;
	};
};


instance DIA_Gorax_Aufgabe2(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Aufgabe2_Condition;
	information = DIA_Gorax_Aufgabe2_Info;
	permanent = FALSE;
	description = "Máš pro mě ještě nějaký úkol?";
};


func int DIA_Gorax_Aufgabe2_Condition()
{
	if(((MIS_GoraxEssen == LOG_SUCCESS) || (MIS_GoraxEssen == LOG_FAILED)) && (Npc_IsDead(Orlan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe2_Info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//Máš pro mě ještě nějaký úkol?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Ano. Jak jistě víš, tak tady vyrábíme i prodáváme excelentní víno.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, majitel hostince 'U Mrtvé harpyje', si objednal dodávku. Dohodli jsme se na 240 zlatých za všechno.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Přines mu tyto láhve, ale nenechej se jím ošátit.
	B_GiveInvItems(self,other,ItFo_Wine,12);
	MIS_GoraxWein = LOG_Running;
	Log_CreateTopic(Topic_GoraxWein,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein,LOG_Running);
	B_LogEntry(Topic_GoraxWein,"Mistr Gorax chce, abych donesl Orlanovi, majiteli hostince, 12 láhví vína. Měl by mi za ně zaplatit 240 zlatých.");
};


instance DIA_Gorax_Orlan(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Orlan_Condition;
	information = DIA_Gorax_Orlan_Info;
	permanent = TRUE;
	description = "Odnesl jsem víno Orlanovi.";
};

var int DIA_Gorax_Orlan_permanent;

func int DIA_Gorax_Orlan_Condition()
{
	if((MIS_GoraxWein == LOG_Running) && Npc_KnowsInfo(other,DIA_Orlan_Wein) && (DIA_Gorax_Orlan_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//Byl jsem u Orlana.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//A? Máš 240 zlatých?
		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices(DIA_Gorax_Orlan);
		Info_AddChoice(DIA_Gorax_Orlan,"Podvedl mě! (dát mu 100 zlatých)",DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan,"Tady je zlato. (dát mu 240 zlatých)",DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//Co jsi udělal s tím zlatem? Ztratil si ho? Běž ho získat zpátky a potom se vrať!
	};
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//Podvedl mě!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//Prodal jsi mu to lacině? Ó ne, proč jsem musel, ze všech lidí, poslat právě TEBE?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//Jsi kompletně neužitečný! Teď mi zmiz z očí!
	B_GiveInvItems(other,self,ItMi_Gold,100);
	MIS_GoraxWein = LOG_FAILED;
	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//Mám zlato.
	if(B_GiveInvItems(other,self,ItMi_Gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Skvěle! Jsi vážně užitečný. Vem si tento léčivý svitek jako odměnu. A teď jdi a najdi si nějakou jinou práci.
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxWein);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//Ale ty jsi už část ztratil, že? Nejsi ničeho hoden, jdi už!
		MIS_GoraxWein = LOG_FAILED;
		B_GiveInvItems(other,self,ItMi_Gold,Npc_HasItems(other,ItMi_Gold));
	};
	Info_ClearChoices(DIA_Gorax_Orlan);
};

instance DIA_Gorax_Wineberrys(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Condition;
	information = DIA_Gorax_Wineberrys_Info;
	permanent = FALSE;
	description = "Nějaký další úkol, mistře?";
};

func int DIA_Gorax_Wineberrys_Condition()
{
	if((MIS_GoraxWein == LOG_SUCCESS) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Info()
{
	AI_Output(other,self,"DIA_Gorax_Wineberrys_01_00");	//Nějaký další úkol, mistře?
	AI_Output(self,other,"DIA_Gorax_Wineberrys_01_01");	//Hmm... Je potřeba shromáždit sklizeň hroznů, které vyrostly zde v klášteře.
	AI_Output(self,other,"DIA_Gorax_Wineberrys_01_02");	//Potřebuji alespoň 10 svazků! Jdi a postarej se o to novici.
	MIS_GoraxWineberrys = LOG_Running;
	Log_CreateTopic(Topic_GoraxWineberrys,LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_Running);
	B_LogEntry(Topic_GoraxWineberrys,"Mistr Gorax mě požádal shromáždit sklizeň hroznů, které rostou zde v klášteře. Potřebuje jich alespoň deset.");
};

instance DIA_Gorax_Wineberrys_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_Wineberrys_Done_Condition;
	information = DIA_Gorax_Wineberrys_Done_Info;
	permanent = FALSE;
	description = "Přinesl jsem hrozny.";
};

func int DIA_Gorax_Wineberrys_Done_Condition()
{
	if((MIS_GoraxWineberrys == LOG_Running) && (Npc_HasItems(hero,ITFO_WINEBERRYS) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wineberrys_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorax_Wineberrys_Done_01_00");	//Přinesl jsem hrozny.
	AI_Output(self,other,"DIA_Gorax_Wineberrys_Done_01_01");	//Výborně! Pak ti snad nebude vadit, když si je vezmu.
	AI_Output(other,self,"DIA_Gorax_Wineberrys_Done_01_02");	//Samozřejmě, mistře. Tady jsou.
	B_GiveInvItems(other,self,ITFO_WINEBERRYS,10);
	Npc_RemoveInvItems(self,ITFO_WINEBERRYS,10);
	AI_Output(self,other,"DIA_Gorax_Wineberrys_Done_01_03");	//Dobrá práce! Jsem si jistý, že Innos oslaví tvé úsilí ve prospěch našeho kláštera.
	MIS_GoraxWineberrys = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_GoraxWineberrys,LOG_SUCCESS);
	B_LogEntry(Topic_GoraxWineberrys,"Donesl jsem mistru Goraxovi sklizené hrozny.");
};

instance DIA_Gorax_JOB(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 35;
	condition = DIA_Gorax_JOB_Condition;
	information = DIA_Gorax_JOB_Info;
	permanent = FALSE;
	description = "A jaké jsou tu tvé povinnosti?";
};

func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//A jaké jsou tu tvé povinnosti?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//Mám na starosti mnoho různých věcí. Jsem nejenom průvodce, ale i pokladník.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//K tomu mám ještě dohled nad vinicí a klášterními zásobami jídla.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//Takže pokud bys něco potřeboval, vždy ke mně můžeš přijít a za malý poplatek si to koupit.
	Log_CreateTopic(Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader,"Mistr Gorax mi může v klášteře opatřit všechno, co potřebuji.");
};


instance DIA_Gorax_TRADE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 99;
	condition = DIA_Gorax_TRADE_Condition;
	information = DIA_Gorax_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Potřebuji pár věcí...";
};

func int DIA_Gorax_TRADE_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Gorax_JOB) == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
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

	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//Potřebuji pár věcí...
	B_GiveTradeInv(self);
};

instance DIA_Gorax_KDF(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 5;
	condition = DIA_Gorax_KDF_Condition;
	information = DIA_Gorax_KDF_Info;
	permanent = FALSE;
	description = "Potřebuji nové místo na spaní.";
};


func int DIA_Gorax_KDF_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//Potřebuji nové místo na spaní.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//Napravo je volná komnata. Vezmi si klíč. Najdeš tam všechno, co potřebuješ.
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	Wld_InsertItem(ItPo_Perm_Mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_Gorax_Kap2_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap2_EXIT_Condition;
	information = DIA_Gorax_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap3_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap3_EXIT_Condition;
	information = DIA_Gorax_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_KILLPEDRO(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = DIA_Gorax_KILLPEDRO_Condition;
	information = DIA_Gorax_KILLPEDRO_Info;
	important = TRUE;
};


func int DIA_Gorax_KILLPEDRO_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Počkej, žoldáku. Potřebuju s tebou mluvit.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//Klášter čelí velmi choulostivé situaci.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//Momentálně to vypadá tak, že nikdo nikomu nevěří. A potom, tahle věc s Pedrem je extrémně... (polkne)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//Mám pro tebe úkol od těch nejvyšších. Jsi jediný, kdo to může urovnat, neboť nejsi členem Kruhu Ohně.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//Ale musím tě varovat. Pokud ti dám tento úkol, budeš zavázán ho splnit. Nebudeš mít na výběr. Chápeš?
	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Zapomeň na to! Je to příliš riskantní.",DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO,"Dobrá, řekni mi co chceš.",DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Zapomeň na to! Je to příliš riskantní.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//V pořádku. V tom případě zapomeň, že jsem něco řekl.
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Dobrá, řekni mi co chceš.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//Výborně. Poslouchej teda dobře, řeknu to jenom jednou.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes chce, abys Pedra za jeho zradu zabil.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//Bude ti zaplaceno hned poté, co úkol splníš.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//Nikdy jsem tohle neřekl. A tys nič neslyšel, ano?
	MIS_Gorax_KillPedro = LOG_Running;
	Log_CreateTopic(Topic_Gorax_KillPedro,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_Running);
	B_LogEntry(Topic_Gorax_KillPedro,"Gorax mě informoval, že Serpentes chce, abych Pedra zabil za jeho zradu.");
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap4_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap4_EXIT_Condition;
	information = DIA_Gorax_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gorax_Kap5_EXIT(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 999;
	condition = DIA_Gorax_Kap5_EXIT_Condition;
	information = DIA_Gorax_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gorax_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_ARMOR(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor_condition;
	information = dia_gorax_armor_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_armor_condition()
{
	if(Npc_KnowsInfo(other,DIA_Gorax_JOB) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor_info()
{
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_01");	//Vítám tě, bratře! Jelikož jsi jeden z nás, můžu ti teď nabídnout speciální zboží. Například tohle roucho mágů Ohně.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_01A");	//Je trochu lepší jako ta, co ti dal Pyrokar.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_02");	//Popravdě bys nejdřív měl přinést malý dar klášteru.
	AI_Output(self,other,"DIA_Gorax_ARMOR_14_03");	//Jenom mi řekni v případě, že bys ji chtěl koupit.
};


instance DIA_GORAX_ARMOR01(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = dia_gorax_armor01_condition;
	information = dia_gorax_armor01_info;
	permanent = FALSE;
	description = "Prodej mi roucho.";
};


func int dia_gorax_armor01_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_armor01_info()
{
	AI_Output(other,self,"DIA_Gorax_Armor01_15_01");	//Prodej mi roucho.
	AI_Output(self,other,"DIA_Gorax_Armor01_14_01");	//Věř mi, nebudeš litovat.
	AI_Output(self,other,"DIA_Gorax_Armor01_14_02");	//Počkej tady, přinesu ji ze sklepa.
	AI_GotoWP(self,"NW_MONASTERY_STAIRS_05");
	AI_GotoWP(self,"NW_MONASTERY_WINEMAKER_02");
	AI_GotoFP(self,"FP_STAND_GUARDING_WINE_01");
	AI_LookAtNpc(self,other);
	AI_Output(self,other,"DIA_Gorax_Armor01_14_03");	//Tady je! Koukni se, je vážně dobrá.
};


var int gorax_kdflbought;

instance DIA_GORAX_KDFL(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_kdfl_condition;
	information = dia_gorax_kdfl_info;
	permanent = TRUE;
	description = "Koupit roucho mága Ohně. (cena: 2500 zlatých)";
};


func int dia_gorax_kdfl_condition()
{
	if(Npc_KnowsInfo(other,dia_gorax_armor01) && (GORAX_KDFLBOUGHT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_gorax_kdfl_info()
{
	AI_Output(other,self,"DIA_Gorax_KDFL_15_01");	//Prodej mi tohle roucho.

	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_KDF_M))
	{
		AI_Output(self,other,"DIA_Gorax_KDFL_12_01");	//Tady máš, teď je tvoje!
		B_GiveInvItems(self,other,itar_kdf_m,1);
		GORAX_KDFLBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_KDFL_12_02");	//Lituji, ale nemůžu ti ho dát zadarmo!
	};
};


var int goraxmood;
var int goraxminprice;

instance DIA_GORAX_TRADEMEWINE(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 860;
	condition = dia_gorax_trademewine_condition;
	information = dia_gorax_trademewine_info;
	permanent = FALSE;
	description = "Poslal mě Lutero.";
};


func int dia_gorax_trademewine_condition()
{
	if(MIS_CHURCHDEAL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gorax_trademewine_choices()
{
	Info_ClearChoices(dia_gorax_trademewine);
	Info_AddChoice(dia_gorax_trademewine,"Skončil jsem s tebou!",dia_gorax_trademewine_deal);
	Info_AddChoice(dia_gorax_trademewine,"(zkontrolovat aktuální cenu)",dia_gorax_trademewine_current);
	Info_AddChoice(dia_gorax_trademewine,"(zkontrolovat Goraxovu náladu)",dia_gorax_trademewine_mood);

	if(GORAXCURRENTPRICE > 50)
	{
		Info_AddChoice(dia_gorax_trademewine,"Vyjednávat (zvýšit cenu o 10 % z nynější)",dia_gorax_trademewine_up10);
		Info_AddChoice(dia_gorax_trademewine,"Vyjednávat (zvýšit cenu o 5 % z nynější)",dia_gorax_trademewine_up5);
		Info_AddChoice(dia_gorax_trademewine,"Vyjednávat (snížit cenu o 10 % z nynější)",dia_gorax_trademewine_down10);
		Info_AddChoice(dia_gorax_trademewine,"Vyjednávat (snížit cenu o 5 % z nynější)",dia_gorax_trademewine_down5);
	};
};

func void dia_gorax_trademewine_info()
{
	GORAXCURRENTPRICE = 600;
	GORAXMOOD = 75;
	AI_Output(other,self,"DIA_Gorax_TradeMeWine_01_00");	//Poslal mě Lutero. Měl bych od tebe koupit čerstvé klášterní víno.
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_04");	//Víno je připravené. Je jenom potřebné přijít na to, kolik je drahý pán Lutero ochotný zaplatit.
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_06");	//Hmmm... (přemýšlí) Myslím, že šest stovek zlatých by mělo stačit... (lišácky)
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_01_07");	//Co říkáš?
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up10()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 10) / 100);
	GORAXMOOD = GORAXMOOD + Hlp_Random(20);
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100;
	};
	concatText = ConcatStrings("Současná cena vína: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," zlatých");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_up5()
{
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE + ((GORAXCURRENTPRICE * 5) / 100);
	GORAXMOOD = GORAXMOOD + Hlp_Random(10);
	if(GORAXMOOD > 100)
	{
		GORAXMOOD = 100;
	};
	concatText = ConcatStrings("Současná cena vína: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," zlatých");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_nodeal()
{
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_00");	//Promiň, ale nejsem povinný s tebou vyjednávat! (zachmouřený)
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_01");	//Tahle cena za víno, to mě jednoduše uráží!
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_02");	//Vypadám jako úplný idiot?!
	AI_Output(self,other,"DIA_Gorax_TradeMeWine_NoDeal_01_05");	//Neprodám ti žádné víno. Takže můžeš odejít a říct to Luterovi!
	B_LogEntry(TOPIC_CHURCHDEAL,"Asi jsem vyjednáváním s Goraxem zašel příliš daleko. Pravděpodobně považoval mé poslední jednání za urážku, a tak o tom nechtěl dál mluvit. Teď se potřebuji vrátit k Luterovi a říct mu tu nešťastnou zprávu.");
	GORAXSNOTRADEMEWINE = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gorax_trademewine_down10()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 10) / 100);
	currentmood = Hlp_Random(14);

	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings("Současná cena vína: ",IntToString(GORAXCURRENTPRICE));
		concatText = ConcatStrings(concatText," zlatých");
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_down5()
{
	var int currentmood;
	var string concatText;
	GORAXCURRENTPRICE = GORAXCURRENTPRICE - ((GORAXCURRENTPRICE * 5) / 100);
	currentmood = Hlp_Random(7);
	if(GORAXMOOD >= currentmood)
	{
		GORAXMOOD = GORAXMOOD - currentmood;
		concatText = ConcatStrings("Současná cena vína: ",IntToString(GORAXCURRENTPRICE));
		concatText = ConcatStrings(concatText," zlatých");
		AI_Print(concatText);
		dia_gorax_trademewine_choices();
	}
	else
	{
		dia_gorax_trademewine_nodeal();
	};
};

func void dia_gorax_trademewine_current()
{
	var string concatText;
	concatText = ConcatStrings("Současná cena vína: ",IntToString(GORAXCURRENTPRICE));
	concatText = ConcatStrings(concatText," zlatých");
	AI_Print(concatText);
	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_mood()
{
	var string concatText;

	if(GORAXMOOD >= 100)
	{
		concatText = "Goraxova nálada: nemůže už být lepší!";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 90)
	{
		concatText = "Goraxova nálada: skvělá";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 80)
	{
		concatText = "Goraxová nálada: velmi dobrá";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 70)
	{
		concatText = "Goraxova nálada: dobrá";
		AI_PrintClr(concatText,83,152,48);
	}
	else if(GORAXMOOD >= 60)
	{
		concatText = "Goraxova nálada: nadprůměrná";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 50)
	{
		concatText = "Goraxova nálada: průměrná";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 40)
	{
		concatText = "Goraxova nálada: podprůměrná";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 30)
	{
		concatText = "Goraxova nálada: nespokojená";
		AI_Print(concatText);
	}
	else if(GORAXMOOD >= 20)
	{
		concatText = "Goraxova nálada: zlá";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 10)
	{
		concatText = "Goraxova nálada: nepříjemná";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD >= 5)
	{
		concatText = "Goraxova nálada: hrozná";
		AI_PrintClr(concatText,177,58,17);
	}
	else if(GORAXMOOD > 0)
	{
		concatText = "Goraxova nálada: kritická!";
		AI_PrintClr(concatText,177,58,17);
	};

	dia_gorax_trademewine_choices();
};

func void dia_gorax_trademewine_deal()
{
	AI_Output(other,self,"DIA_Gorax_TradeMeWine_Deal_01_00");	//Dohodnuto! Tady jsou tvé peníze za víno.

	if(Npc_HasItems(hero,ItMi_Gold) >= GORAXCURRENTPRICE)
	{
		B_GiveInvItems(other,self,ItMi_Gold,GORAXCURRENTPRICE);
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_01");	//Je mi potěšením s tebou obchodovat.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_02");	//Tady to máš – 25 láhví úžasného klášterního vína s mým pozdravem pro pána Lutera!
		B_GiveInvItems(self,other,ItFo_Wine,25);
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_03");	//A teď mě omluv – je čas na to, abych se vrátil k mým každodenním povinnostem.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_05");	//V pořádku, mágu.
		B_LogEntry(TOPIC_CHURCHDEAL,"Koupil jsem víno u Goraxe. Teď ho musím donést Luterovi.");
		GORAXSTRADEMEWINE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_06");	//Ale nemáš dost zlata!
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_07");	//Chceš mě naštvat?... (naštvaně)
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_09");	//Nikomu nedovolím, aby mě vodil za nos!
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_10");	//Můžeš zapomenout na naši dohodu.
		AI_Output(self,other,"DIA_Gorax_TradeMeWine_Deal_01_11");	//Tobě víno neprodám. Můžeš to jít říct Luterovi!
		B_LogEntry(TOPIC_CHURCHDEAL,"Dohodl jsem se s Goraxem na ceně, ale na poslední chvíli se ukázalo, že nemám dost peněz. Gorax byl vzteky bez sebe! Myslel si, že z něho chci udělat hlupáka a odmítl se mnou obchodovat. Teď potřebuju oznámit Luterovi tuhle smutnou správu.");
		GORAXSNOTRADEMEWINE = TRUE;
		GORAXSNOTENOUGHTGOLD = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORAX_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = dia_gorax_runemagicnotwork_condition;
	information = dia_gorax_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_gorax_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorax_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Gorax_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A nedokážu pochopit proč!
	AI_Output(self,other,"DIA_Gorax_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_GORAX_GoldForGorax(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_GoldForGorax_condition;
	information = DIA_GORAX_GoldForGorax_info;
	permanent = FALSE;
	description = "Přinesl jsem dary od Darona.";
};

func int DIA_GORAX_GoldForGorax_condition()
{
	if((MIS_DARON_GIVEGOLD == LOG_Running) && (Npc_HasItems(other,itmi_daron_suma) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GORAX_GoldForGorax_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GORAX_GoldForGorax_01_00");	//Přinesl jsem dary od Darona.
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_01");	//Vynikající! Už jsem na ně čekal.
	AI_Output(other,self,"DIA_GORAX_GoldForGorax_01_02");	//Mám tu tento měšec. Je zde všechno zlato, které se mu podařilo shromáždit.
	B_GiveInvItems(other,self,itmi_daron_suma,1);
	Npc_RemoveInvItems(self,itmi_daron_suma,1);
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_03");	//(vezme měšec) No, soudě podle hmotnosti, je množství slušné.
	AI_Output(self,other,"DIA_GORAX_GoldForGorax_01_04");	//Děkuji za pomoc. Nechť Innos svítí na tvou cestu!
	B_LogEntry(TOPIC_DARON_GIVEGOLD,"Přinesl jsem měšec s dary mistru Goraxovi.");
	Log_CreateTopic(TOPIC_DARON_GIVEGOLD,LOG_SUCCESS);
	MIS_DARON_GIVEGOLD = LOG_SUCCESS;
};

var int COUNTER_GORAX_PAPERS;

instance DIA_GORAX_FIND_PAPERS(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 3;
	condition = dia_gorax_find_papers_condition;
	information = dia_gorax_find_papers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_find_papers_condition()
{
	if((GORAXSTRADEMEWINE == TRUE) && (MIS_GORAX_FIND_PAPERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_find_papers_info()
{
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_01");	//Počkej. Chci tě požádat o laskavost. Máš rád zlato, že ano?
	AI_Output(other,self,"DIA_Gorax_Find_Papers_01_02");	//No... Kdo ho nemá rád.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_03");	//Náš klášter je známý pro své víno na ostrově, a já jsem zodpovědný za jeho přípravu a kvalitu...
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_04");	//Teď mám zájem o vzácné recepty vín, které mohou mít příznivé účinky po zkonzumování.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_05");	//Zjistil jsem, že se na ostrově nějaké ty recepty nacházejí.
	AI_Output(other,self,"DIA_Gorax_Find_Papers_01_06");	//No dobře, když tedy získám pár těchto receptů...
	AI_Output(self,other,"DIA_Gorax_Find_Papers_01_07");	//Spoléhám na tebe. A samozřejmě víš, že moje vděčnost nezná mezí...
	MIS_GORAX_FIND_PAPERS = LOG_Running;
	Log_CreateTopic(TOPIC_GORAX_FIND_PAPERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_Running);
	B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Mistr Gorax se chce naučit připravovat speciální druhy vína. Mým úkolem je, abych mu poskytl nové recepty, které jsou rozmístěny po celém ostrově.");
};


instance DIA_GORAX_FIND_PAPERS_OK(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 1;
	condition = DIA_GORAX_FIND_PAPERS_OK_condition;
	information = DIA_GORAX_FIND_PAPERS_OK_info;
	permanent = TRUE;
	important = FALSE;
	description = "Přinesl jsem ti pár vinných receptur.";
};

func int DIA_GORAX_FIND_PAPERS_OK_condition()
{
	if((MIS_GORAX_FIND_PAPERS == LOG_Running) && ((Npc_HasItems(hero,rezepturen) >= 1) || (Npc_HasItems(hero,rezepturen2) >= 1) || (Npc_HasItems(hero,itwr_glintvein) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_GORAX_FIND_PAPERS_OK_info()
{
	AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_01");	//Přinesl jsem ti pár vinných receptur.
	AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_02");	//Výborně! Jaké?

	if(Npc_HasItems(hero,rezepturen) >= 1)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_03");	//Zde je recept na balzám prozřetelnosti.
		B_GiveInvItems(other,self,rezepturen,1);
		Npc_RemoveInvItems(self,rezepturen,1);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_04");	//Získat ho nebylo snadné!
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_05");	//Balzám? Jak zajímavé. I když to není nezbytně víno, tak dobře.
		COUNTER_GORAX_PAPERS += 1;

		if((hero.guild != GIL_KDF) && (hero.guild != GIL_KDM) && (hero.guild != GIL_GUR) && (hero.guild != GIL_KDW))
		{
			AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_06");	//Tady, vem si toto jako odměnu - tyto magické svitky. Jsem si jistý, že pro tebe budou velmi užitečné.
			B_GiveInvItems(self,other,ItSc_Firestorm,2);
			B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Přinesl jsem mistru Goraxovi recept na balzám Prozřetelnosti a jako odměnu získal několik svitků. Není to zas tak špatné, na to, že recept mi již laskavost přinesl.");
		}
		else
		{
			AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_07");	//Tady, vem si jako odměnu lektvary many. Jsem si jistý, že jednoho dne budou chránit tvůj život, když se magická energie vyčerpá.
			B_GiveInvItems(self,other,ItPo_Mana_02,3);
			B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Přinesl jsem mistru Goraxovi recept na balzám Prozřetelnosti a obdržel lektvary. Není to zas tak špatné, na to, že recept mi již laskavost přinesl.");
		};
	};
	if(Npc_HasItems(hero,rezepturen2) >= 1)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_08");	//Zde je recept na víno zapomnění.
		B_GiveInvItems(other,self,rezepturen2,1);
		Npc_RemoveInvItems(self,rezepturen2,1);
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_09");	//(zamyšleně) Velice zvláštní složení...
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_10");	//Těžko to můžeme vařit v blízké budoucnosti. Ale tak jako tak, děkuji ti za tvou práci.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_11");	//Tady, vezmi si tento svitek vyvolání ohnivého golema jako odměnu.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_12");	//Použij ho pouze tehdy, když se budeš cítit dostatečně silný, jinak to může skončit špatně...
		B_GiveInvItems(self,other,itsc_sumfiregol,1);
		COUNTER_GORAX_PAPERS += 1;
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Přinesl jsem mistru Goraxovi recept na víno zapomnění a získal svitek golema.");
	};
	if(Npc_HasItems(hero,itwr_glintvein) >= 1)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_13");	//Tento recept je na svařené víno.
		B_GiveInvItems(other,self,itwr_glintvein,1);
		Npc_RemoveInvItems(self,itwr_glintvein,1);
		COUNTER_GORAX_PAPERS += 1;
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_14");	//(překvapeně) Jak jsi to...?
		AI_Output(other,self,"DIA_Gorax_Find_Papers_Ok_01_15");	//Je to dlouhý příběh...
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_16");	//No, i když to není přesně to, co potřebuji, dodržím své slovo.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_17");	//Jen tak dále.
		B_GiveInvItems(self,other,ItMi_Gold,250);
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Přinesl jsem mistru Goraxovi recept na svařené víno - nemůžu říct, že by ho nějak nadchl, ale i přesto mi dal nějaké zlato za moji námahu.");
	};
	if(COUNTER_GORAX_PAPERS >= 3)
	{
		hero.lp = hero.lp + 1;
		AI_Print("+ 1 VB");
		Snd_Play("LevelUp");
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_19");	//No, myslím, že teď jsme významně rozšířili náš sortiment vín a dalších receptů nám již není zapotřebí.
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_20");	//Děkuji jménem kláštera za tvou pomoc. 
		AI_Output(self,other,"DIA_Gorax_Find_Papers_Ok_01_21");	//Nechť tě Innos ochrání!
		MIS_GORAX_FIND_PAPERS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GORAX_FIND_PAPERS,LOG_SUCCESS);
		B_LogEntry(TOPIC_GORAX_FIND_PAPERS,"Tak jsem naprosto splnil úkoly mistra Goraxe, a on mi požehnal k mým novým úspěchům.");
	};
};

instance DIA_Gorax_LoaParty(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Condition;
	information = DIA_Gorax_LoaParty_Info;
	permanent = FALSE;
	description = "Potřebuji nějaké speciální víno.";
};

func int DIA_Gorax_LoaParty_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Info()
{
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_01");	//Potřebuji nějaké speciální víno.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_02");	//Co tím myslíš?!
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_03");	//Každé naše víno je speciální. Používáme pouze naše hrozny, které nemají konkurenci.
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_04");	//Nerozumíš mi. Slovem speciální mám na mysli delikátní víno které obvykle nejde do prodeje.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_05");	//Aha. Hmmm... Možná mám něco takového.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_06");	//Ale pochop. I cena bude - speciální.
	AI_Output(other,self,"DIA_Gorax_LoaParty_01_07");	//Kolik?
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_08");	//Dva tisíce zlatých. Pokud je nemáš nemrhej mým časem.
	AI_Output(self,other,"DIA_Gorax_LoaParty_01_09");	//Slevu nedostaneš.
	B_LogEntry(TOPIC_LoaSecret,"Gorax mi může prodat speciální víno. Ale bude stát 2000 zlatých.");
};

instance DIA_Gorax_LoaParty_Done(C_Info)
{
	npc = KDF_508_Gorax;
	nr = 2;
	condition = DIA_Gorax_LoaParty_Done_Condition;
	information = DIA_Gorax_LoaParty_Done_Info;
	permanent = FALSE;
	description = "Tady je zlato.";
};

func int DIA_Gorax_LoaParty_Done_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_KnowsInfo(other,DIA_Gorax_LoaParty) == TRUE) && (MakeLoaParty == TRUE) && (Npc_HasItems(other,ItMi_Gold) > 1000))
	{
		return TRUE;
	};
};

func void DIA_Gorax_LoaParty_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Gorax_LoaParty_Done_01_01");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Gorax_LoaParty_Done_01_02");	//Skvěle. Tady, dvě láhve jsou tvoje.
	B_GiveInvItems(self,other,ItMi_LoaWine,2);
	AI_Output(other,self,"DIA_Gorax_LoaParty_Done_01_03");	//Doufám, že to za to stálo.
	AI_Output(self,other,"DIA_Gorax_LoaParty_Done_01_04");	//Nepochybuj.
	B_LogEntry(TOPIC_LoaSecret,"Koupil jsem drahé víno od Goraxe.");
	LoaPartyWine = TRUE;

	if((LoaPartyWine == TRUE) && (LoaPartyFood == TRUE))
	{
		B_LogEntry(TOPIC_LoaSecret,"Nyní se mohu vrátit za Loou a prodiskutovat další záležitosti tykající se oslavy.");
	};

	AI_StopProcessInfos(self);
};
