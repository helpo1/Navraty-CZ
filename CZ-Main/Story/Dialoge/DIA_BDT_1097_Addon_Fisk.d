
instance DIA_Addon_Fisk_EXIT(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 999;
	condition = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Fisk_PICKPOCKET(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 900;
	condition = DIA_Addon_Fisk_PICKPOCKET_Condition;
	information = DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	return C_Beklauen(118,300);
};

func void DIA_Addon_Fisk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,Dialog_Back,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fisk_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};

func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fisk_PICKPOCKET);
};


instance DIA_Addon_Fisk_Hi(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 1;
	condition = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Fisk_Hi_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hej, jestli hledáš férového obchodníka, tak jsi ho právě našel.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//Moje chatrč stojí přesně za Estebanovou. Takže, pokud budeš něco potřebovat, zastav se.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Fisk obchoduje se všemi druhy zbraní.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


var int fiskarrowsday;

instance DIA_Addon_Fisk_Trade(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 888;
	condition = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int DIA_Addon_Fisk_Trade_Condition()
{
	if(((Npc_GetDistToWP(self,"BL_INN_UP_06") > 500) && (FISK_TP == FALSE)) || (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_Trade_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	daynow = Wld_GetDay();

	if(FISKARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (FISKARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - FISKARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			FISKARROWSDAY = daynow;
		};
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Fisk_Attentat(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Fisk_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void DIA_Addon_Fisk_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Pozorně poslouchej, nemám s tím nic společného, jasný?!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//(nevinně) Mám své vlastní problémy, jsem jen oběť.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//Jaké problémy?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//Za svoji poslední dodávku jsem zaplatil kopu zlata.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//Ale ta nikdy nedorazila! Nějaká svině ji musela sebrat.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//(zhnuseně) Někdo mi ji ukradl - asi jeden z mých chlapů!
};


instance DIA_Addon_Fisk_Lieferung(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 3;
	condition = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent = FALSE;
	description = "Co to bylo za dodávku?";
};


func int DIA_Addon_Fisk_Lieferung_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Fisk_Attentat)) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//Co to bylo za dodávku?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//Balíček plný paklíčů. Někdo by je mohl střelit pirátům.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//Ale ten chlápek Juan se jí zmocnil. (naštvaný) Se vším zlatem, co jsem mu dal!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//Ten bastard se schovává někde v bažině.
	MIS_Lennar_Lockpick = LOG_Running;
	Log_CreateTopic(Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Fisk,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Nějaký chlápek jménem Juan byl pověřen obchodovat s bandity. Říká se, že se ukryl někde v bažinách.");
	B_LogEntry_Quiet(Topic_Addon_Fisk,"Juan ukradl Fiskovu dodávku (balíček s paklíči). Schovává se někde v bažině.");
};

func void B_Addon_Fisk_AboutJuan()
{
	if(Npc_IsDead(Juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//Je mrtvý.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Dobrý, už nemůže dále podvádět!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//Pořád žije...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//Ty jsi tu svini nechal žít?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//Nebyl sám...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Co už - zlikviduju i ty chlápky, co jsou s ním...
	};
};

func void B_Addon_Fisk_Belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//Pokud jde o tebe...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//Mám dobré styky s Hunem.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//Zajistím, abys dostal zbraně velmi levně.
	Huno_ArmorCheap = TRUE;
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//Podívej, jednou jsem dostal tenhle kámen od Corrista.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//Je to moje jediná věc, kterou jsem zachránil po úniku z bariéry. Myslím, že se ti bude hodit více než mě.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//A ještě navíc ti dám jednu z mých zbraní.
		if(other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])
		{
			B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_Bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//(podivínsky) Podrazíš mě a já podrazím tebe - to platí pořád.
};


instance DIA_Addon_Fisk_GivePaket(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 4;
	condition = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent = FALSE;
	description = "Mám tvůj balíček.";
};


func int DIA_Addon_Fisk_GivePaket_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Lennar_Paket) >= 1) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//Mám tvůj balíček.
	B_GiveInvItems(other,self,ItMi_Addon_Lennar_Paket,1);
	Npc_RemoveInvItems(self,ItMi_Addon_Lennar_Paket,1);
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_LennarPaket);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//(štastně) Fakt! (podezřívavě) A co Juan?
	B_Addon_Fisk_AboutJuan();
	B_Addon_Fisk_Belohnung();
};


instance DIA_Addon_Fisk_PaketOpen(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 5;
	condition = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent = FALSE;
	description = "Otevřel jsem tvůj balíček!";
};


func int DIA_Addon_Fisk_PaketOpen_Condition()
{
	if((MIS_Lennar_Lockpick == LOG_Running) && (LennarPaket_Open == TRUE) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//Otevřel jsem tvůj balíček!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(směje se) To se dalo čekat! Nemohl ses dočkat, že?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Máš aspoň ty paklíče?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//A co je důležitější - co se stalo s Juanem?
	B_Addon_Fisk_AboutJuan();
};


instance DIA_Addon_Fisk_GivePicks(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 6;
	condition = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent = TRUE;
	description = "Tady máš ty paklíče...";
};


func int DIA_Addon_Fisk_GivePicks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_PaketOpen) && (MIS_Lennar_Lockpick == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Tady máš ty paklíče...
	if(B_GiveInvItems(other,self,ItKE_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Perfektní. Kdo si počká, ten se dočká.
		B_Addon_Fisk_Belohnung();
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//To není všechno! (chytře) Nechceš jen zboží přenášet, co?
	};
};


instance DIA_Addon_Fisk_Inspektor(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 7;
	condition = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent = FALSE;
	description = "Juan pracoval pro Estebana!";
};


func int DIA_Addon_Fisk_Inspektor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Fisk_Lieferung) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan pracoval pro Estebana!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//(ohromeně) Cože?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Nehraj si se mnou! Věděl jsi to!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(s jistotou) Dobře. Máš pravdu. Doufám, že ale chápeš, proč jsem ti to neřekl.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Všichni v tomhle táboře ví, že děláš pro Estebana.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//Nechci se do toho moc míchat jenom kvůli tomu, že ty chceš ten svůj červený kámen.
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Já nedělám pro Estebana.",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Nevěřím ti!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice(DIA_Addon_Fisk_Inspektor,"Tomu rozumím!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//Tomu rozumím!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Dobře! Teď buď zticha! Jinak nás někdo uslyší!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//Nevěřím ti!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Věř si čemu chceš! Ale dám ti radu - pokud bys chtěl o mě Estebanovi navykládat nějaké lži, tak si to s tebou vyřídím!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//Já nedělám pro Estebana...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//Aha? Tak ty bys chtěl toho blba ošidit? To není jen tak.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Potom ti poradím - nech si to pro sebe.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//Pokud jde o Estebana, nemůžeš nikomu věřit - jenom sobě, chápeš?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Ale teď už dost těch řečí - někdo nás uslyší!
	Info_ClearChoices(DIA_Addon_Fisk_Inspektor);
};


instance DIA_Addon_Fisk_Meeting(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent = FALSE;
	description = "TY jsi za tou vraždou!";
};


func int DIA_Addon_Fisk_Meeting_Condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,ZS_Talk) && (MIS_Judas == LOG_Running) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//TY jsi za tou vraždou!
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Ano. Esteban je mi trnem v oku.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//Žádného z banditů, kteří pro mě dělají, nepustí do dolu. Ujistil se, že VŠICHNI dělají pro něho - jen pro něho.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//Takže si může vzít provizi z každého obchodu a tak může ovládat celý tábor.
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"A co chceš dělat?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice(DIA_Addon_Fisk_Meeting,"Předpokládám že chceš na jeho místo.",DIA_Addon_Fisk_Meeting_You);
	if(!Npc_IsDead(Esteban))
	{
		Info_AddChoice(DIA_Addon_Fisk_Meeting,"Mohl bych tě vydat Estebanovi.",DIA_Addon_Fisk_Meeting_sell);
	};
};

func void DIA_Addon_Fisk_Meeting_You()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Předpokládám že chceš na jeho místo.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//Ne, já jsem jen obchodník - jen nechci, aby se mi někdo míchal do řemesla.
};

func void DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//Mohl bych tě vydat Estebanovi.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//A pak? Co by bylo potom? Ty fakt věříš, že ti dá, co chceš?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Zapomeň na to a poslouchej - mám lepší nápad.
};

func void DIA_Addon_Fisk_Meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//Co chceš dělat?
	if(!Npc_IsDead(Esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//Zbavíme se Estebana. To znamená, že ho zabiješ a nastoupíš na jeho místo.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//Ale jak, má kolem sebe ty stráže, nemám šanci.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Proto je musíme nějak odlákat. A odlákáme je pravdou.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//Jakou pravdou?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//Udělal jsi svou práci. Víš, že já stojím za tou vraždou.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Řekni to Estebanovi a on pošle stráže, aby mě zabily. Budu je čekat.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//Až budou pryč, můžeš si to s tím bastardem vyřídit a já se postarám o stráže.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban je mrtvý. Budu se dál věnovat své práci.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Tady, to je pro tebe.
		B_GiveInvItems(self,other,ItMi_Gold,500);
	};
	Info_ClearChoices(DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	B_LogEntry(Topic_Addon_Esteban,"Fisk stojí za tím atentátem na Estebana.");
};


instance DIA_Addon_Fisk_Sieg(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent = FALSE;
	description = "Esteban byl zabit!";
};


func int DIA_Addon_Fisk_Sieg_Condition()
{
	if((MIS_Judas == LOG_SUCCESS) && (Npc_IsDead(Esteban) == TRUE) && (FISK_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban byl zabit.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//Na to jsem čekal věčnost.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//Myslím, že máš ještě udělat dost práce a já taky.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//Pokud bys něco potřeboval, víš, kde mě najít.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_ADDON_FISK_RETFORD(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = dia_addon_fisk_retford_condition;
	information = dia_addon_fisk_retford_info;
	permanent = FALSE;
	description = "Ratford tě pozdravuje!";
};

func int dia_addon_fisk_retford_condition()
{
	if((MIS_RATFORDFISK == LOG_Running) && (HIFROMRATFORD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_retford_info()
{
	B_GivePlayerXP(XP_FISKRETFORD);
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_00");	//Ratford tě pozdravuje!
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_03");	//Takže ten zmetek to dal! A kde je?!
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_04");	//Našel jsem ho v Hornickém údolí!
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_05");	//Jen mě nepráskni...
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_06");	//A co se děje?
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_07");	//Ale, no... Nic! Starý dluh!
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_08");	//Ty mu něco dlužíš?
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_09");	//To není tvoje věc, příteli! Ale jestli ho někdy uvidíš, dej mu tenhle balíček.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_11");	//Neboj, zaplatím ti za to.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_13");	//Řekněme sto zlatých! Domluveno?
	AI_Output(other,self,"DIA_Addon_Fisk_Retford_01_14");	//To je dost zlata. Dobře, vezmu mu ho.
	AI_Output(self,other,"DIA_Addon_Fisk_Retford_01_15");	//Tady, jen to neztrať!
	AI_Wait(self,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,itmi_fiskpacket,1);
	CreateInvItems(hero,ItMi_Gold,100);
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_RATFORDFISK,"Vyřídil jsem Fiskovy pozdravy od Ratforda. Byl trochu nervózní a mlel něco o starých dluzích. Dal mi balíček, který mám doručit Ratfordovi. Odměna je pět set zlatých, takže to bude něco opravdu důležitého.");
	HIFROMRATFORD = TRUE;
};

var int FiskABoutFingers;

instance DIA_ADDON_FISK_ORCINVASION(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	condition = dia_addon_fisk_orcinvasion_condition;
	information = dia_addon_fisk_orcinvasion_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_addon_fisk_orcinvasion_condition()
{
	if((FISK_TP == TRUE) && Npc_IsInState(self,ZS_Talk) && (MIS_RATFORDFISK == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_orcinvasion_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_OrcInvasion_01_00");	//Nemám teď náladu na řeči. Běž pryč.

	if((MIS_WhereFingers == LOG_SUCCESS) || (FingersMeet == TRUE) || (FiskABoutFingers == TRUE))
	{
		AI_StopProcessInfos(self);
		FISK_TP = TRUE;
	};
};

instance DIA_Addon_Fisk_WhereFingers(C_Info)
{
	npc = BDT_1097_Addon_Fisk;
	nr = 2;
	condition = DIA_Addon_Fisk_WhereFingers_condition;
	information = DIA_Addon_Fisk_WhereFingers_info;
	permanent = FALSE;
	description = "Víš něco o Fingersovi?";
};

func int DIA_Addon_Fisk_WhereFingers_condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == FALSE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fisk_WhereFingers_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Fisk_WhereFingers_01_00");	//Víš něco o Fingersovi?
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_01");	//Hmm... Jeho jsem neviděl od té doby co spadla bariera.
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_02");	//Někteří říkají že zemřel. Ale já tomu nevěřím.
	AI_Output(other,self,"DIA_Addon_Fisk_WhereFingers_01_03");	//Proč?
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_04");	//On nebyl takový člověk, co by se nechal jen tak zabít.
	AI_Output(self,other,"DIA_Addon_Fisk_WhereFingers_01_05");	//Ale je to jen můj názor.
	FiskABoutFingers = TRUE;
	B_LogEntry(TOPIC_WhereFingers,"Podle Fiska je Fingers stále naživu, ale nikdo neví kde je.");
};

//---------------------------


instance DIA_NONE_1801_Fingers_EXIT(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 999;
	condition = DIA_NONE_1801_Fingers_EXIT_Condition;
	information = DIA_NONE_1801_Fingers_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_NONE_1801_Fingers_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1801_Fingers_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_1801_Fingers_PICKPOCKET(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 900;
	condition = DIA_NONE_1801_Fingers_PICKPOCKET_Condition;
	information = DIA_NONE_1801_Fingers_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1801_Fingers_PICKPOCKET_Condition()
{
	if((hero.attribute[ATR_DEXTERITY] >= 250) && (FingersPocket == FALSE) && ((MIS_TellAboutFingers == LOG_Running) || (MIS_TellAboutFingers == LOG_Success)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,Dialog_Back,DIA_NONE_1801_Fingers_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1801_Fingers_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1801_Fingers_PICKPOCKET_DoIt);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_DoIt()
{
	B_Beklauen_Fingers();
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

func void DIA_NONE_1801_Fingers_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1801_Fingers_PICKPOCKET);
};

instance DIA_NONE_1801_Fingers_Hi(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Hi_Condition;
	information = DIA_NONE_1801_Fingers_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Hi_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_00");	//S kýmpak se tu potkávám!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_01");	//Kdo jsi? (hrubě) Počkej. Myslím, že poznávám toji tvář...
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_02");	//No, ano, vzpomínám si! Ty jsi ten kluk, kterého jsem učil řemeslu zlodějů ve Starém táboře.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_03");	//Fingers! Myslel jsem, že jsi mrtvý.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_04");	//(Se smíchem) není to tak lehký, starý příteli, aby mě někdo poslal na onen svět.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_05");	//Jak ses sem dostal?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_06");	//Ani sám nevím... Připlul asi - jak jinak? Přes moře.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_07");	//Nic si nepamatuješ?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_08");	//Proč bych si měl něco pamatovat.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_09");	//Když se zhroutila bariéra, všichni spěchali pryč z toho prokletého vězení.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_10");	//Většina stráží a Stínů šla s Ravenem! Mluvil něco o severozápadní části ostrova.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_11");	//A proč jsi s nima nešel?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_12");	//Nebyly mi po chuti jeho způsoby.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_13");	//Tím spíš, že jsem nechtěl jen vypadnout z Hornického údolí, ale opustit navždy celý tento ostrov.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_14");	//Na východním pobřeží jsem si pro tento případ připravil loď.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Hi_01_15");	//A co jsi dělal?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_16");	//Jak co? Plavil jsem se na ni, ale ne moc daleko jak vidíš.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_17");	//Nejdřív přišla silná bouře. A pak mam všechno rozmlžený.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Hi_01_18");	//Když jsem se probral byl jsem zde. 
	FingersMeet = TRUE;
	B_LogEntry(TOPIC_WhereFingers,"Našel jsem Fingerse na pobřeží ostrova u pevnosti Azgan. Myslím, že tato zpráva potěší Cassiu.");
};

instance DIA_NONE_1801_Fingers_Place(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Place_Condition;
	information = DIA_NONE_1801_Fingers_Place_Info;
	permanent = FALSE;
	description = "Máš tušení, co je to za místo?";
};

func int DIA_NONE_1801_Fingers_Place_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Place_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Place_01_00");	//Máš tušení, co je to za místo?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_01");	//Až donedávna jsem nevěděl.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_02");	//Ale když sem přišla armáda paladinů, bylo mi vše jasné!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Place_01_03");	//Takže se z tohodle místa nehnu.
};

instance DIA_NONE_1801_Fingers_How(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_How_Condition;
	information = DIA_NONE_1801_Fingers_How_Info;
	permanent = FALSE;
	description = "Jak se tady máš?";
};

func int DIA_NONE_1801_Fingers_How_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_How_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_How_01_00");	//Jak se tady máš?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_01");	//Nic-moc! Ale lepší než v kolonii.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_How_01_02");	//Tam teď vládnou skřeti.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_03");	//Ani se tomu nedivím. Ale je nepravděpodobné, že se dostanou až sem.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_How_01_04");	//Není to tady přepychové místo, ale klidné.
};

instance DIA_NONE_1801_Fingers_WhatNext(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_WhatNext_Condition;
	information = DIA_NONE_1801_Fingers_WhatNext_Info;
	permanent = FALSE;
	description = "Co budeš dělat dál?";
};

func int DIA_NONE_1801_Fingers_WhatNext_Condition()
{
	if((Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Hi) == TRUE) && (FingersInFort == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_WhatNext_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_WhatNext_01_00");	//Co budeš dělat dál?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_02");	//A co mi zbývá? Akorát tak, tady sedět a čekat na šanci, že se dostanu z této díry pryč.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_WhatNext_01_03");	//Mohl bys jít do pevnosti.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_04");	//Blázníš?! (směje se) Ve tváři mám vepsáno, že jsem zločinec.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_05");	//Pověsí mě na první větvi.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_WhatNext_01_06");	//Ne, příteli! Neudělám odtud ani krok.
};

instance DIA_NONE_1801_Fingers_Stolen(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Stolen_Condition;
	information = DIA_NONE_1801_Fingers_Stolen_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1801_Fingers_Stolen_Condition()
{
 	if((Npc_HasItems(hero,ItMi_PocketFingers) >= 1) && (FingersPocket == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Info()
{
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_00");	//(směje se) Samozřejmě! Oloupit samotného Fingerse! Kdo by si to mohl pomyslet...
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_01");	//Ano, příteli. Nezapomněl jsi. Skutečný mistr svého řemesla!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_01_02");	//A teď prosím, vrať mi měšec.
	Info_ClearChoices(DIA_NONE_1801_Fingers_Stolen);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"Ne, je můj...",DIA_NONE_1801_Fingers_Stolen_No);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"Dobře, tady je.",DIA_NONE_1801_Fingers_Stolen_Yes);
	Info_AddChoice(DIA_NONE_1801_Fingers_Stolen,"A co za to dostanu?",DIA_NONE_1801_Fingers_Stolen_What);
};

func void DIA_NONE_1801_Fingers_Stolen_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_No_01_00");	//Ne, je můj...
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_No_01_01");	//Jak to víš.
	AI_StopProcessInfos(self);

	if(FingersInFort == FALSE)
	{
		B_Attack(self,other,AR_KILL,1);
	};
};

func void DIA_NONE_1801_Fingers_Stolen_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_Yes_01_00");	//Dobře, tady je.
	B_GiveInvItems(other,self,ItMi_PocketFingers,1);
	Npc_RemoveInvItems(self,ItMi_PocketFingers,1);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_01");	//Dobře... Myslí ti to stejně, jak šikovný máš ruce.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_02");	//A pokud ano, vezmi si tenhle klíč.
	B_GiveInvItems(self,other,ItKe_FingersKey,1);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_03");	//On je od mé truhly, co zůstal v Hornickém údolí.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_Yes_01_04");	//Pro mně je teď bezcenná a ty v ní najdeš spoustu užitečných věcí.
	AI_StopProcessInfos(self);
};

func void DIA_NONE_1801_Fingers_Stolen_What()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Stolen_What_15_00");	//A co za to dostanu?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Stolen_What_01_00");	//(ušklíbne se) Sám uvidíš!
};

instance DIA_NONE_1801_Fingers_Master(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Condition;
	information = DIA_NONE_1801_Fingers_Master_Info;
	permanent = FALSE;
	description = "Vyznáš se v zámcích?";
};

func int DIA_NONE_1801_Fingers_Master_Condition()
{
	if(MIS_FingersOpenDoor == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_00");	//Vyznáš se v zámcích?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_01");	//(směje se) V tom jsem nejlepší!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_02");	//A proč tě to zajímá?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_03");	//Paladinové ztratili klíč ke skladu. A zámek na těch dveřích je příliš složitý.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_04");	//Tak mě napadlo, pokud mluvíš pravdu, neměl by být pro tebe problém se na ten zámek podívat?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_05");	//To je pravda, ale budou si to muset vyřešit sami.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_06");	//Já se k pevnosti ani nepřiblížím!
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_07");	//A když se dohodnu s paladiny, že ti nezkřiví ani vlas?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_08");	//(zamyšleně) A můžu jim věřit?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_09");	//Máš snad na výběr nebo tady chceš sedět celý život?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_01_10");	//Och... Dobře pomůžu jim, ale jen pod podmínkou, že se mi nic nestane.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_01_11");	//Výborně. Promluvím s jejich velitelem.
	FingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor,"Fingers souhlasil, že pomůže paladinům s dveřmi. Ale pod podmínkou, že se ho ani nedotknou.");
};

instance DIA_NONE_1801_Fingers_Master_Ok(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Ok_Condition;
	information = DIA_NONE_1801_Fingers_Master_Ok_Info;
	permanent = FALSE;
	description = "Promluvil jsem s paladiny.";
};

func int DIA_NONE_1801_Fingers_Master_Ok_Condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (VarusFingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Ok_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_00");	//Promluvil jsem s paladiny.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_01");	//(zvědavě) A co?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_02");	//Lord Varus, jejich velitel, dal své slovo, že se tě ani nedotknou, pokud jim pomůžeš otevřít ty dveře.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_03");	//Ale nesnaž se je okrást, jinak ti nebude pomoci.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_04");	//Samo sebou, máš mě za idiota!
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_05");	//V tomto případě jsi očekáván v pevnosti.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Ok_01_06");	//Dobře, ale ještě jeden den tady chci zůstat a utřídit si myšlenky. A pak můžem vyrazit.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Ok_01_07");	//Jak chceš.
	FingersCrack = TRUE;
	FingersGoFort = Wld_GetDay();
	B_LogEntry(TOPIC_FingersOpenDoor,"Fingers se vydá do pevnosti druhý den. Doufejme, že paladinové ocení jeho schopnosti, když jim otevře dveře.");
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1801_Fingers_Master_Finish(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_Master_Finish_Condition;
	information = DIA_NONE_1801_Fingers_Master_Finish_Info;
	permanent = FALSE;
	description = "Tak jak to dopadlo?";
};

func int DIA_NONE_1801_Fingers_Master_Finish_Condition()
{
	if(FingersInFort == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_Master_Finish_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Finish_01_00");	//Tak jak to dopadlo?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_01");	//Zámek byl opravdu složitý!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_02");	//Ten kdo ho dělal, je opravdu mistr.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_03");	//Ale jak víš tohle mě nezastaví. (zasměje se) Otevřel jsem ho a ani se nezapotil!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_04");	//Teď jsem zadobře s lordem Varusem. Což je divné i pro mě...
	AI_Output(other,self,"DIA_NONE_1801_Fingers_Master_Finish_01_05");	//Vypadá to, že se věci pohnuly k lepšímu?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_06");	//(usmívá se) Tak to je! Nemohu říct, že jsem nejšťastnější.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_07");	//Ale tady se dobře najím a můžu si i něco vypít!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_Master_Finish_01_08");	//A to je určitě lepší, než viset s provazem kolem krku! (Směje se)
	THIEF_REPUTATION = THIEF_REPUTATION + 15;

	if(MIS_FingersOpenDoor == LOG_Running)
	{
		B_LogEntry(TOPIC_FingersOpenDoor,"Jak se dalo očekávat, Fingers snadno otevřel zámek u skladu.");
	};
};

instance DIA_NONE_1801_Fingers_OpenSkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_OpenSkald_Condition;
	information = DIA_NONE_1801_Fingers_OpenSkald_Info;
	permanent = FALSE;
	description = "Takže, sklad je znova otevřený?";
};

func int DIA_NONE_1801_Fingers_OpenSkald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_1801_Fingers_Master_Finish) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_OpenSkald_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_OpenSkald_01_00");	//Takže, sklad je znovu otevřený?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_OpenSkald_01_01");	//Ne. Udělal jsem nový klíč a dal ho Varusovi.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_OpenSkald_01_02");	//Takže to je pořád složitý zámek.
	FingersTellKey = TRUE;
};

var int FingersCanGaveMeKey;

instance DIA_NONE_1801_Fingers_GetKeySkald(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Info;
	permanent = FALSE;
	description = "A můžeš udělat ještě jeden takový?";
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Condition()
{
	if((FingersTellKey == TRUE) && (HavePalSkladMeKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_00");	//A můžeš udělat ještě jeden takový?
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_01");	//Hmmm... (přimhouří oči) Co, chceš osobně zkontrolovat jejich sklad?
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_02");	//I tak se dá říct.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_03");	//Samozřejmě to zvládnu... Ale je to příliš riskantní! Koneckonců něco se ztratí a všechna obvinění padnou na mě. 
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_04");	//Dobře ti zaplatím. Kromě toho jsem si jistý, že paladinové tak pečlivě nedodržují všechna svá pravidla.
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_01_05");	//Nyní mají důležitější věci na práci. Například skřety!
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_01_06");	//No dobrá, dobrá. Přesvědčil jsi mě. Ale bude tě to stát 2000 zlatých.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald,"Pak bychom si o tom měli promluvit později.",DIA_NONE_1801_Fingers_GetKeySkald_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald,"Výborně. Tady jsou tvé peníze.",DIA_NONE_1801_Fingers_GetKeySkald_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_00");	//Pak bychom si o tom měli promluvit později.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_01");	//Jak říkáš.
	FingersCanGaveMeKey = TRUE;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00");	//Výborně. Tady jsou tvé peníze.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01");	//Skvělé, tady je tvůj klíč.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02");	//Ale, ale! Tak ty už ho máš připravený. Vypadá to, že ses sám chtěl na ten sklad podívat.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03");	//Na tom, co jsem chtěl, nezáleží. (úšklebek) Hlavní je, že oba máme to, co jsme chtěli.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald);
};

instance DIA_NONE_1801_Fingers_GetKeySkald_Again(C_Info)
{
	npc = NONE_1801_Fingers;
	nr = 1;
	condition = DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition;
	information = DIA_NONE_1801_Fingers_GetKeySkald_Again_Info;
	permanent = TRUE;
	description = "Prodej mi klíč od skladu.";
};

func int DIA_NONE_1801_Fingers_GetKeySkald_Again_Condition()
{
	if((FingersCanGaveMeKey == TRUE) && (HavePalSkladMeKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Info()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Again_01_00");	//Prodej mi klíč od skladu.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Again_01_01");	//Jak už jsem řekl, bude tě to stát nejméně 2000 zlatých.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
	Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again,"Pak bychom si o tom měli promluvit později.",DIA_NONE_1801_Fingers_GetKeySkald_Again_No);

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(DIA_NONE_1801_Fingers_GetKeySkald_Again,"Dobrá. Tady jsou tvé peníze.",DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes);
	};
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_No()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_00");	//Pak bychom si o tom měli promluvit později.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_No_01_01");	//Jak říkáš.
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};

func void DIA_NONE_1801_Fingers_GetKeySkald_Again_Yes()
{
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_00");	//Dobrá. Tady jsou tvé peníze.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_01");	//Skvělé, tady je tvůj klíč.
	B_GiveInvItems(self,other,itke_varuskey,1);
	AI_Output(other,self,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_02");	//Ale, ale! Tak ty už ho máš připravený. Vypadá to, že ses sám chtěl na ten sklad podívat.
	AI_Output(self,other,"DIA_NONE_1801_Fingers_GetKeySkald_Yes_01_03");	//Na tom, co jsem chtěl, nezáleží. (úšklebek) Hlavní je, že oba máme to, co jsme chtěli.
	HavePalSkladMeKey = TRUE;
	Info_ClearChoices(DIA_NONE_1801_Fingers_GetKeySkald_Again);
};
