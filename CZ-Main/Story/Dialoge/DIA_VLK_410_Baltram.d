
instance DIA_Baltram_EXIT(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 999;
	condition = DIA_Baltram_EXIT_Condition;
	information = DIA_Baltram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Baltram_Sperre(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Sperre_Condition;
	information = DIA_Baltram_Sperre_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Baltram_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Sperre_Info()
{
	AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Ty ode mě nic nedostaneš!
	AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//A teď vypadni! Desíš všechny mé klienty.
	AI_StopProcessInfos(self);
};

instance DIA_Baltram_Hallo(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_Hallo_Condition;
	information = DIA_Baltram_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Vítej, cizinče, jmenuji se Baltram. Přišel ses zásobit jídlem?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//Obávám se, že tě zklamu. Moc toho právě teď na skladě nemám.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//Ale každým dnem bych měl dostat nové zboží.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//Pokud jsi přišel ke mně nakoupit jídlo, můžeš jít klidně zase pryč.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//Nemyslím si o vás žoldácích nic dobrého! Způsobujete mi jen samé problémy.
	};
};


instance DIA_Addon_Baltram_LaresAbloese(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 1;
	condition = DIA_Addon_Baltram_LaresAbloese_Condition;
	information = DIA_Addon_Baltram_LaresAbloese_Info;
	important = TRUE;
};


func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SCIsWearingRangerRing == TRUE) && (MIS_Lares_BringRangerToMe == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Proč vypadáš tak skepticky?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//Vidím, že máš znamení 'Kruhu Vody'.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//Jsi jedním z nich?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//A pokud by to byl ten případ?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//To bych ti pak řekl, že Lares chce někoho jiného, kdo se postará o jeho úkol v přístavu.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Ok. Pokusím se najít někoho, kdo bude ochoten to udělat.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//Výborně.
	B_GivePlayerXP(XP_Ambient);
	B_LogEntry(TOPIC_Addon_BringRangerToLares,"Baltram, obchodník na tržišti, se postará o Laresův úkol. Možná bude moci Lares KONEČNĚ opustit přístav.");
	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};


instance DIA_Baltram_Job(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 3;
	condition = DIA_Baltram_Job_Condition;
	information = DIA_Baltram_Job_Info;
	permanent = FALSE;
	description = "Máš pro mě práci?";
};


func int DIA_Baltram_Job_Condition()
{
	if((MIS_Nagur_Bote != LOG_Running) && (MIS_Nagur_Bote != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Máš pro mě práci?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//Ne, poslíčka už mám. Zkus to u jiného obchodníka.
};


instance DIA_Baltram_Trick(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_Trick_Condition;
	information = DIA_Baltram_Trick_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Baltram_Trick_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_Nagur_Bote == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Hledáš práci?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Jasně, o co jde?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//Můj poslíček se ještě nevrátil zpátky a já čekám dodávku od farmáře Akila.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//A kolik mi za to dáš?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//Dám ti 50 zlaťáků.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Dobrá, to beru.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Dobrá, jenom řekni Akilovi, že tě posílám. Dá ti balík. Přines mi ho.
	MIS_Baltram_ScoutAkil = LOG_Running;
	B_LogEntry_Quiet(TOPIC_Nagur,"Baltram mě zaměstnal jako poslíčka. Mám mu přinést nějakou zásilku z Akilova statku.");
	Log_CreateTopic(TOPIC_Baltram,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram,LOG_Running);
	B_LogEntry(TOPIC_Baltram,"Když Baltramovi doručím jeho zásilku, zaplatí mi 50 zlatých.");
};


var int Baltram_TradeLOG;

instance DIA_Baltram_WAREZ(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 2;
	condition = DIA_Baltram_WAREZ_Condition;
	information = DIA_Baltram_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Baltram_WAREZ_Condition()
{
	if(Wld_IsTime(5,5,20,5))
	{
		return TRUE;
	};
};

func void DIA_Baltram_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Ukaž mi své zboží.

	if(Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Baltram prodává na tržišti potraviny.");
		Baltram_TradeLOG = TRUE;
	};
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//Neměli to nechat dojít tak daleko. Teď jeden ze žoldáků zavraždil paladina.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Něco by se mělo stát!
	};
	if((BaltramCantTradeAgain == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//Lidé jako ty ode mne nic nedostanou.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Proč?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//Nejdřív znesváříte farmáře a potom děláte, jako by se nic nestalo.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Teď vypadni, odháníš mi zákazníky.
		BaltramCantTrade = TRUE;
		AI_StopProcessInfos(self);
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Baltram_Skip(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_Skip_Condition;
	information = DIA_Addon_Baltram_Skip_Info;
	description = "Mimochodem, ty jsi v kontaktu s piráty?";
};


func int DIA_Addon_Baltram_Skip_Condition()
{
	if(SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//Mimochodem, ty jsi v kontaktu s piráty?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(cítí se odhalen) Co? Kdo to říkal?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//Mluvil jsem s jedním. Vypadá to, že na tebe čeká ve svém zálivu.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//Dobře, a co bych měl teda dělat? Těžké časy, vždyť víš. Musím se nějak živit.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Nebojíš se, že tě přitom chytí?",DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Budeš muset čelit důsledkům svých činů!",DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//Ok, to je vše, co jsem chtěl vědět.
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//Budeš muset čelit důsledkům svých činů!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Hej, poslouchej. Řeknu ti všechno, co vím a ty to na mě na oplátku neřekneš, dobře?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Jaké zboží vyměňuješ?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Co víš o pirátech?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Nebojíš se, že tě přitom chytí?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//No, může se to stát. Nakonec ty jsi to přece zjistil.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//Ale ty to nikomu neřekneš, že ne?
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Jaké zboží vyměňuješ?",DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Co víš o pirátech?",DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//Jaké zboží vyměňuješ?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//Obvykle jídlo.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//A výměnou za to dostávám ten nejlepší rum, jaký můžes v Khorinisu dostat.
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Ok, to je vše, co jsem chtěl vědět.",DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip,"Mohl bych ti pomoci.",DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_Ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(s úsměvem) Mohl bych ti pomoci.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//To není špatný nápad. Teď zrovna nemůžu opustit Khorinis.
	CreateInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Tady, vezmi si tento balíček a řekni Skipovi, ať tentokrát s tím rumem nešetří.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//Nemělo by to být míň než 3 flašky.
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Baltram mi dal balíček. Měl bych ho doručit Skipovi.");
	MIS_Addon_Baltram_Paket4Skip = LOG_Running;
};

func void DIA_Addon_Baltram_Skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//(tvrdě) Co víš o pirátech?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//(spěšně) Žijí někde schovaní na ostrově.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//Pokud vím, tak se tam dá dostat jedině lodí.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//Občané Khorinisu se jich bojí. Oprávněně. V podstatě je to banda smradlavých hrdlořezů.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Na druhou stranu si myslím, že pořád nejsou tak strašní jako banditi.
};


instance DIA_Addon_Baltram_SkipsRum(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Addon_Baltram_SkipsRum_Condition;
	information = DIA_Addon_Baltram_SkipsRum_Info;
	description = "Mám ten rum. Bohužel mi Skip dal jen 2 flašky.";
};


func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if((Skip_Rum4Baltram == TRUE) && (MIS_Addon_Baltram_Paket4Skip == LOG_Running) && (Npc_HasItems(other,ItFo_Addon_Rum) >= 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//Mám ten rum. Bohužel mi Skip dal jen 2 flašky.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(naštvaně) Zatraceně drahé. Co si o sobě ten Skip vůbec myslí? Ale dobře, dej to sem.
	B_GiveInvItems(other,self,ItFo_Addon_Rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//Nemůžu ti za to dát mnoho. To je vše, co mám.
	CreateInvItems(self,ItMi_Gold,10);
	B_GiveInvItems(self,other,ItMi_Gold,10);
	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Baltram_AkilsHof(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 4;
	condition = DIA_Baltram_AkilsHof_Condition;
	information = DIA_Baltram_AkilsHof_Info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int DIA_Baltram_AkilsHof_Condition()
{
	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Projdi východní branou a drž se cesty vedoucí na jihovýchod.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//Po chvíli přijdeš ke kamennému schodišti. Vyjdi nahoru a odtud už uvidíš Akilovu farmu.
};


instance DIA_Baltram_Lieferung(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 5;
	condition = DIA_Baltram_Lieferung_Condition;
	information = DIA_Baltram_Lieferung_Info;
	permanent = FALSE;
	description = "Mám Akilovu dodávku.";
};

func int DIA_Baltram_Lieferung_Condition()
{
	if(Npc_HasItems(other,ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//Mám Akilovu dodávku.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Výborně. Konečně zase můžu nabízet čerstvé zboží. Tady máš 50 zlatých.
	B_GiveInvItems(other,self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);
	Npc_RemoveInvItems(self,ItMi_BaltramPaket,1);
	CreateInvItems(self,ItFo_Cheese,5);
	CreateInvItems(self,ItFo_Apple,10);
	CreateInvItems(self,ItFo_Beer,5);
	CreateInvItems(self,ItFo_Bacon,5);
	CreateInvItems(self,ItFo_Sausage,5);
};

instance DIA_Baltram_LetUsTrade(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_LetUsTrade_Condition;
	information = DIA_Baltram_LetUsTrade_Info;
	permanent = FALSE;
	description = "Mohli bychom po tom všem spolu uzavřít obchod?";
};

func int DIA_Baltram_LetUsTrade_Condition()
{
	if((BaltramCantTrade == TRUE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Mohli bychom po tom všem spolu uzavřít obchod?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Poslouchej, když mi přineseš 10 šunek a 10 láhví vína, potom s tebou budu zase obchodovat.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//Uvidím, co se dá dělat.
	MIS_BaltramTradeAgain = LOG_Running;
	Log_CreateTopic(TOPIC_BaltramTradeAgain,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BaltramTradeAgain,LOG_Running);
	B_LogEntry(TOPIC_BaltramTradeAgain,"Pokud donesu Baltramovi 10 šunek a 10 láhví vína, pak se mnou bude zase obchodovat.");
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

instance DIA_Baltram_HaveYourWarez(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 6;
	condition = DIA_Baltram_HaveYourWarez_Condition;
	information = DIA_Baltram_HaveYourWarez_Info;
	permanent = TRUE;
	description = "Mám tvé zboží.";
};

func int DIA_Baltram_HaveYourWarez_Condition()
{
	if(MIS_BaltramTradeAgain == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//Mám tvé zboží.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Ukaž mi to.

	if(Npc_HasItems(other,ItFo_Bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//Dohodli jsme se snad na 10 šunkách. Přijď, až jich budeš mít dost.
		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};
	if(Npc_HasItems(other,ItFo_Wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//A co 10 láhví vína? Na ty jsi zapomněl?
		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};
	if((BaltramEnoughBacon == TRUE) && (BaltramEnoughWine == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	///Hmm, není to sice nejlepší kvalita, ale v těchto dobách nemůžeš být moc vybíravý.
		B_GiveInvItems(other,self,ItFo_Bacon,10);
		B_GiveInvItems(other,self,ItFo_Wine,10);
		MIS_BaltramTradeAgain = LOG_SUCCESS;
		MIS_BaltramTrade = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BaltramTradeAgain,LOG_SUCCESS);
		B_LogEntry(TOPIC_BaltramTradeAgain,"Baltram se mnou bude zase obchodovat.");
		B_GivePlayerXP(XP_BaltramTrade);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Teď nám nic nebrání v uzavření obchodu.
		BaltramCantTradeAgain = TRUE;
	};
};


instance DIA_Baltram_PICKPOCKET(C_Info)
{
	npc = VLK_410_Baltram;
	nr = 900;
	condition = DIA_Baltram_PICKPOCKET_Condition;
	information = DIA_Baltram_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Baltram_PICKPOCKET_Condition()
{
	return C_Beklauen(76,175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,Dialog_Back,DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

