
instance DIA_Addon_Esteban_EXIT(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 999;
	condition = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Esteban_EXIT_Condition()
{
	if(Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Esteban_PICKPOCKET(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 900;
	condition = DIA_Addon_Esteban_PICKPOCKET_Condition;
	information = DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	return C_Beklauen(105,500);
};

func void DIA_Addon_Esteban_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,Dialog_Back,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};


instance DIA_Addon_Esteban_Hi(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 2;
	condition = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Esteban_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Esteban_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//Takže, ty jsi ten chlápek co si vybojoval přístup do tábora.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//No, tady se novinky šíří rychle...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franco byl tuhý chlápek. Nikdo se mu neodvážil odporovat. Nikdo - kromě tebe.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Ale chápej, zabil bych tě, kdybys zkusil stejnou věc se mnou.
};


instance DIA_Addon_Esteban_Mine(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent = FALSE;
	description = "Chci se dostat do dolu!";
};


func int DIA_Addon_Esteban_Mine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//Chci se dostat do dolu!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(šklebí se) Jak jinak. A mluvíš se správnou osobou.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Každý, kdo kope v dole, si může ponechat slušnou porci zlata.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//A já mám na starosti červené kameny, které potřebuješ, aby tě Thorus pustil.
};


instance DIA_Addon_Esteban_Rot(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 3;
	condition = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent = FALSE;
	description = "Dej mi jeden z těch červených kamenů.";
};


func int DIA_Addon_Esteban_Rot_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Dej mi jeden z těch červených kamenů.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Jistě, ale nebude to zadarmo.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Obvykle sice beru slušnou sumu zlata abych se nechal přesvědčit.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//(uznale) A co tvoje kopáčské schopnosti?!
	if(Hero_HackChance > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//Už znáš pár triků, že?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//Ještě pořád nejsi expert.
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(arogantně) Nedám ti červený kámen, jen protože jsi celkem zkušený kopáč.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//Ne, mám pro tebe jiný úkol...
};


instance DIA_Addon_Esteban_MIS(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 4;
	condition = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent = FALSE;
	description = "A jaký úkol by to měl být?";
};


func int DIA_Addon_Esteban_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//A jaký úkol by to měl být?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//Jeden ze zdejších banditů se mě pokusil zabít. Nicméně, ON byl zabit mými strážemi.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//Asi chtěl na tvé místo, co?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//Byl to idiot! Vygumovaný kriminálník. Pochybuju, že to byl jeho nápad mě zavraždit.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//Ne, dělal pro někoho jiného...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//A teď je na mě, abych našel lidi, co jsou za to odpovědní chápeš?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//Ať to byl kdokoliv, zaplatí za to. Najdi ho a já tě pustím do dolu.
	if(!Npc_IsDead(Senyan) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Senyan mě za tebou kvůli tomu poslal.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? Ten pro mě dělá taky. Řekl jsem mu, aby měl oči otevřené.
	};
	MIS_Judas = LOG_Running;
	Log_CreateTopic(Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban,LOG_Running);
	B_LogEntry(Topic_Addon_Esteban,"Byl tady pokus o zavraždění Estebana. Mám zjistit, kdo za tím stojí.");
};


instance DIA_Addon_Esteban_Kerl(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent = FALSE;
	description = "Kde mám začít s pátráním?";
};


func int DIA_Addon_Esteban_Kerl_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//Kde mám začít s pátráním?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Každý v táboře o tom ví. Není to žádné tajemství.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Zkus zjistit, kdo je na mé straně a kdo ne. A nenech ty chlápky, aby tě dostali!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Promluv si se Snafem. Ten tlustý kuchař toho ví hodně.
	B_LogEntry(Topic_Addon_Esteban,"Abych tomu přišel na kloub, měl bych si promluvit s lidmi v táboře a zjistit, na čí straně jsou. Snaf je dobrý pro začátek. Zaslechne hodně klepů.");
};


instance DIA_Addon_Esteban_Armor(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 9;
	condition = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent = FALSE;
	description = "Potřebuju lepší zbroj.";
};


func int DIA_Addon_Esteban_Armor_Condition()
{
	if(Huno_ArmorCheap == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//Potřebuju lepší zbroj.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Na co? Vždyť už jednu máš. Ta ti musí stačit!
	if(MIS_Judas == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//Zeptej se mě znovu až splníš svůj úkol...
	};
};


instance DIA_Addon_Esteban_Auftrag(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent = TRUE;
	description = "O tom úkolu...";
};


func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if(((MIS_Judas == LOG_Running) || (MIS_Judas == LOG_SUCCESS)) && (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//O tom úkolu...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Poslouchej, je tady ještě hodně věcí o které se musím starat.

	if(MIS_Judas == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//No jo, ale myslel jsem si, že tě bude zajímat, kdo stojí za tím pokusem o vraždu...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Kdo? Řekni mi jeho jméno a moje stráže ho okamžitě podřežou...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//Fisk, ten obchodník, je za to zodpovědný. Teď je zrovna v hospodě a nasává. Nemá o ničem ani tušení...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Dobrá práce, kámo. Stráže se o něho postarají.
		AI_TurnToNPC(self,Wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//Hoši, slyšeli jste. Jděte a dostaňte Fiska.
		AI_TurnToNPC(self,other);
		Bodyguard_Killer = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(BDT_10005_Addon_Wache_02,"AMBUSH");
		B_StartOtherRoutine(BDT_10005_Addon_Wache_02,"AMBUSH");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Vrať se až zase něco zjistíš o tom pachateli.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Esteban_Away(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent = FALSE;
	description = "A teď?";
};

func int DIA_Addon_Esteban_Away_Condition()
{
	if(Bodyguard_Killer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//A teď?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//Teď? Já ti řeknu, co bude teď.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk zemře bolestivou smrtí a každý v táboře se o tom dozví.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//To bude varování pro všechny ostatní.
};


instance DIA_Addon_Esteban_Stone(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent = FALSE;
	description = "Ok, dáš mi teď ten červený kámen?";
};


func int DIA_Addon_Esteban_Stone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Away) && (Bodyguard_Killer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Ok, dáš mi teď ten červený kámen?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//Pracovals dobře. Někdo jako ty nemá v dole co napráci.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//Budeš užitečnější tady v táboře. Zůstaneš tady a budeš dále pracovat pro mě.
	AI_Teleport(BDT_10005_Addon_Wache_02,"BL_INN_OUTSIDE_01");
	AI_Teleport(BDT_1081_Addon_Wache_01,"BL_INN_OUTSIDE_02");
};


instance DIA_Addon_Esteban_not(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 5;
	condition = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent = FALSE;
	description = "Budu o tom přemýšlet.";
};


func int DIA_Addon_Esteban_not_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//Asi jsi zapomněl, s kým mluvíš. Jsem jeden z předních lidí tohoto tábora a budeš dělat, co ti řeknu.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//A já říkám, že budeš dělat pro mě a pro nikoho jiného. Rozumíš?
};


instance DIA_Addon_Esteban_fight(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 6;
	condition = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent = FALSE;
	description = "To si děláš srandu?";
};


func int DIA_Addon_Esteban_fight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//To si děláš srandu? O tomhle naše dohoda nebyla.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//Vidíš, je tady pár lidí, co mohou dělat takové nabídky jako tahle. Samozřejmě, pokud se ti nelíbí, můžeš kdykoliv odejít z tábora.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//A co takhle dodržet svůj slib a dát mi, co mi patří?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hej - ještě jedno slovo a moje stráže se o tebe postarají.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//Jaké stráže...? (šklebí se) 
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//Co...? Aha, chápu... snažíš se mě zradit. Špatný nápad!
	Bodyguard_Killer = FALSE;
	AI_StopProcessInfos(self);
	B_KillNpc(BDT_10005_Addon_Wache_02);
	B_KillNpc(BDT_1081_Addon_Wache_01);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Esteban_Duell(C_Info)
{
	npc = BDT_1083_Addon_Esteban;
	nr = 99;
	condition = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent = FALSE;
	description = "Okamžitě mi dej ten ŠUTR nebo si ho vezmu sám!";
};


func int DIA_Addon_Esteban_Duell_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Esteban_Rot) && (Bodyguard_Killer != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Okamžitě mi dej ten ŠUTR nebo si ho vezmu sám!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//Život tě už musí nudit. Tak jo, něco s tím uděláme!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);

	if(Npc_IsDead(BDT_10005_Addon_Wache_02) == FALSE)
	{
		B_Attack(BDT_10005_Addon_Wache_02,other,AR_NONE,1);
	};
	if(Npc_IsDead(BDT_1081_Addon_Wache_01) == FALSE)
	{
		B_Attack(BDT_1081_Addon_Wache_01,other,AR_NONE,1);
	};
};