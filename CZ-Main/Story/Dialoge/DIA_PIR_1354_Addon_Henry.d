/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Addon_Henry_Hello_Info - opraveno pořadí dialogů

*/




instance DIA_Addon_Henry_EXIT(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 999;
	condition = DIA_Addon_Henry_EXIT_Condition;
	information = DIA_Addon_Henry_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Henry_Gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 zlatých.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 zlatých.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 zlatých.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 zlatých.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 zlatých.
	}
	else
	{
		B_Say_Gold(self,other,gold);
	};
};


instance DIA_Addon_Henry_PICKPOCKET(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 900;
	condition = DIA_Addon_Henry_PICKPOCKET_Condition;
	information = DIA_Addon_Henry_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	return C_Beklauen(40,60);
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,Dialog_Back,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};


const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";
var int HenryBonusPerm;

instance DIA_Addon_Henry_Hello(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Hello_Condition;
	information = DIA_Addon_Henry_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Hello_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//STÁT!

	if((HenryBonus == TRUE) && (HenryBonusPerm == FALSE))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Jak by ses mohl dostat do našeho táboru bez povšimnutí?! (překvapeně)
		HenryBonusPerm = TRUE;
	};

	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_02");	//Přítel nebo nepřítel?
	HenryTalk = TRUE;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Nepřítel!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice(DIA_Addon_Henry_Hello,"Přítel!",DIA_Addon_Henry_Hello_Freund);
};


var int Henry_SC_Frech;

func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Nepřítel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Hlupáku. Jsi připravený na výprask?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Pověz co chceš, nebo vypadni.
	Henry_SC_Frech = TRUE;
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Přítel!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//To může říct každý! Ani tě neznám. Co tu vlastně děláš?
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

instance DIA_Addon_Henry_SecondWarn(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_SecondWarn_Condition;
	information = DIA_Addon_Henry_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//Přibliž se ještě o krok blíž k táboru a nakrmím s tebou žraloky.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PIR_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Henry_Attack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Attack_Condition;
	information = DIA_Addon_Henry_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Henry_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(other,PIR_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Koledoval sis o to...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


var int Henry_Zoll_WhatFor;

instance DIA_Addon_Henry_WantEnter(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_WantEnter_Condition;
	information = DIA_Addon_Henry_WantEnter_Info;
	permanent = FALSE;
	description = "Chci jít do tábora!";
};


func int DIA_Addon_Henry_WantEnter_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chci jít do tábora!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Fakt? Tak to tě výjde pěkně draze.
	B_Henry_Gold(500);

	if(Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Cože? A proč?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Ty jseš nějak neodbytnej.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//Tady v táboře je mnoho věcí, o které by ses mohl zajímat...
		Henry_Zoll_WhatFor = TRUE;
	};

	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Určitě máš nějaké zlato, že?
};

func void B_Henry_NoJoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Jestli se k nám chceš přidat, tak tě asi musím zklamat, mládenče!
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapitán s polovinou chlapů z tábora odplul na moře. A on je jediný, kdo přijímá nové členy.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale můžeš počkat, dokud se nevrátí.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Nesnaž se tu ovšem zpusobit nějaký problém!
};


instance DIA_Addon_Henry_Einigen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 2;
	condition = DIA_Addon_Henry_Einigen2_Condition;
	information = DIA_Addon_Henry_Einigen2_Info;
	description = "Tu maš 500 zlatých.";
};


func int DIA_Addon_Henry_Einigen2_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter) && !Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (Npc_HasItems(other,ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Tu maš 500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//Výborně. Vítám tě v táboře.
	B_Henry_NoJoin();
	self.aivar[AIV_PASSGATE] = TRUE;
	Knows_HenrysEntertrupp = TRUE;
};


instance DIA_Addon_Henry_Einigen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 3;
	condition = DIA_Addon_Henry_Einigen_Condition;
	information = DIA_Addon_Henry_Einigen_Info;
	description = "Nemohli bychom se dohodnut nějak líp?";
};


func int DIA_Addon_Henry_Einigen_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Nemohli bychom se dohodnut nějak líp?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Možná. Dej mi nějaký dobrý důvod a možná tě to vyjde levněji.
};


instance DIA_Addon_Henry_MeatForMorgan(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 4;
	condition = DIA_Addon_Henry_MeatForMorgan_Condition;
	information = DIA_Addon_Henry_MeatForMorgan_Info;
	permanent = FALSE;
	description = "Mám přinést Morganovi tohle maso.";
};


func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//Mám přinést Morganovi tohle maso.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//(ostře) A kdo tě poslal?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Alligator Jack. Řekl mi, že Morgan na něj už čeká.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Rozumím, rozumím. Přece se nebude obtěžovat sám, že?
};


instance DIA_Addon_Henry_Malcom(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 5;
	condition = DIA_Addon_Henry_Malcom_Condition;
	information = DIA_Addon_Henry_Malcom_Info;
	description = "Posíla mě Malcom...";
};


func int DIA_Addon_Henry_Malcom_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Posíla mě Malcom. Mám ti vzkázat, že na ty trámy potřebuje ještě nějaký čas.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(lamentování) Och ano, ano. To jsem si mohl myslet. Určitě mu to bude trvat celou věčnost.
	B_MalcomExident();
};


instance DIA_Addon_Henry_BaltramPack(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_BaltramPack_Condition;
	information = DIA_Addon_Henry_BaltramPack_Info;
	description = "Mám zásilku pro Skipa. Je v táboře?";
};


func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//Mám zásilku pro Skipa. Je v táboře?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Ano. Skip tu je. A co ještě chceš?
};


var int Henry_Amount;

instance DIA_Addon_Henry_Tribut(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 7;
	condition = DIA_Addon_Henry_Tribut_Condition;
	information = DIA_Addon_Henry_Tribut_Info;
	permanent = TRUE;
	description = "Pusť mě dovnitř.";
};


func int DIA_Addon_Henry_Tribut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Pusť mě dovnitř.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm...

	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//Přinesl jsi mi vzkaz od dřevorubce.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Chceš si hrát na poslíčka Alligatora Jacka a doručit maso z močálových krys Morganovi.
		Henry_Amount = Henry_Amount - 100;
	};
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//Máš zásilku pro Skipa.
		Henry_Amount = Henry_Amount - 100;
	};
	if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if(Henry_Amount < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A nejlepší na tom je:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Postaral ses o ty spráskaný psy na věži.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nemyslel jsem si, že to vzládneš sám.
		Henry_Amount = Henry_Amount - 200;
	};
	if(Henry_Amount <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Víš co, můžeš jít dovnitř zadarmo.
		self.aivar[AIV_PASSGATE] = TRUE;
		Knows_HenrysEntertrupp = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//... anebo znovu zmizneš. Je to jednoduché.
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut,"To je dost.",DIA_Addon_Henry_Tribut_nein);
		if(Npc_HasItems(other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut,"Dobrá. Tu je tvé zlato.",DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobrá. Tu je tvé zlato
	B_GiveInvItems(other,self,ItMi_Gold,Henry_Amount);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Děkuji. Vítam tě v našem táboře.
	B_Henry_NoJoin();
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To je dost.
	if(Henry_Amount < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No tak, už jsem ti to dost zlevnil.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Tak potom vypadni.
	};
	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};


instance DIA_Addon_Henry_Palisade(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Condition;
	information = DIA_Addon_Henry_Palisade_Info;
	permanent = FALSE;
	description = "Co tu delaš?";
};


func int DIA_Addon_Henry_Palisade_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co tu delaš?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//Co si myslíš? Musím dohlídnut na tyhle slabochy, aby dostavěli palisádu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Jak to nepostavíme, tak mě kapitán Greg nakope do zadku.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Navíc musím dohlížet na to, aby sem nenapochodoval každý, komu se zachce!
};


instance DIA_Addon_Henry_Palisade_WhatFor(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 12;
	condition = DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information = DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent = FALSE;
	description = "Proč tu stavíte palisadu?";
};


func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Proč tu stavíte palisadu?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Aby to banditi neměli tak jednoduché!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Ti bastardi jsou čímdál drzejší. Již několik dní obkličují náš tábor. Přesně jako žraloci obkličují ztroskotance na moři.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Několik těch bastardů se ukrylo do věže na jih od tábora.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale jsem si jistý, že je to jen výzvědná hlídka.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Jestli jsou tak blbí, že na nás zaútočí, tak je přivítáme jak se patří.
	Log_CreateTopic(TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower,LOG_Running);
	B_LogEntry(TOPIC_Addon_BanditsTower,"Několik banditů se usadilo ve věži na jih od pirátského tábora a zabarikádovali se tam.");
};

func void B_Henry_WhereIsTower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Kde přesně je ta věž?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Vyjdi odsud a drž se vpravo.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//Tam, na malém útesu, najdeš věž.
};


instance DIA_Addon_Henry_Turmbanditen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 13;
	condition = DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information = DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent = TRUE;
	description = "Ohledně těch banditů z věže...";
};


func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor) && (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Ohledně těch banditů z věže...
	if(C_TowerBanditsDead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Ano?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Postaral jsem se o to.
		if(MIS_Henry_FreeBDTTower == LOG_Running)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Vyborně! O jeden problém míň.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Fakt jsi je vyhnal sám? Jseš dobrej!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kdo ví, možná se z tebe jednou stane opravdový pirát!
		};
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(HammerPirate,"START");
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		B_LogEntry(TOPIC_Addon_BanditsTower,"Banditi z věže jsou mrtví.");
		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if(MIS_Henry_FreeBDTTower == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co teď?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Jestli se chystáš jít na ně SÁM, tak na to zapomeň!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//Přinejhorším tam pošlu dva své chlapy. Oni se o ty bandity postarají.
	};
};


instance DIA_Addon_Henry_Palisade_Bandits(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 14;
	condition = DIA_Addon_Henry_Palisade_Bandits_Condition;
	information = DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent = FALSE;
	description = "Proč na vás banditi útočí?";
};


func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Proč na vás banditi útočí?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Protože boj mezi námi a nimi pokračuje! Co sis myslel?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na začátku to bylo v pořádku. Přivezli jsme je sem a oni se usadili v bažinách, nechajíc nás na pokoji.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Ale teď začali napadat každého, kdo k nim nepatří.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Co jsem se doslechl, démoni je vyhnali.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Myslel jsem, že chtějí naše lodě. Prece jen - není žádnej jinej způsob, jak se odsud dostat.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Zeptej se na to Skipa. Byl tam - a vyvázl živej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//Je to zajímavý příběh. Už mi o tom hodně říkal.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(podezřívavě) Škoda že si to nemůžeš poslechnout, když teď nemáš na zaplacení vstupu.
		Henry_Zoll_WhatFor = TRUE;
	};
};


var int Henry_EnterCrewMember;

instance DIA_Addon_Henry_Entercrew(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 31;
	condition = DIA_Addon_Henry_Entercrew_Condition;
	information = DIA_Addon_Henry_Entercrew_Info;
	permanent = TRUE;
	description = "Chci se přidat do vaší party.";
};


func int DIA_Addon_Henry_Entercrew_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chci se přidat do vaší party.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(smích) To není tak jednoduchý dostat se k nám, chlapče!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Nejdřív si musíme popovídat, zda tě vůbec pustím do tábora.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Jó, vítám tě v naší partě!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//O jednoho muže víc, který nám pomůže ubránit se před bandity.
		if(MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm, chtěl jsem říct, aby sis vzal jednoho chlapa a vymydlil ty lumpy z věže.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ty jsi to už udělal.
		}
		else
		{
			if(Npc_IsDead(SawPirate) && Npc_IsDead(HammerPirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Oba moji chlapi jsou mrtví. Vypadá to tak, že si budeš muset poradit sám.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Zbav sa těch banditů ve věži.
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z věže. Nedal mi ovšem nic na obranu.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Seber si jednoho chlapa a vyžeňte ty bandity z věže.
				Henry_GetPartyMember = TRUE;
				B_LogEntry(TOPIC_Addon_BanditsTower,"Henry chce abych vyhnal bandity z věže. Můžu sebou vzít jednoho muže.");
			};
			B_Henry_WhereIsTower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Ano, pane!
			MIS_Henry_FreeBDTTower = LOG_Running;
		};
		Henry_EnterCrewMember = TRUE;
	};
};


instance DIA_Addon_Henry_Owen(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 32;
	condition = DIA_Addon_Henry_Owen_Condition;
	information = DIA_Addon_Henry_Owen_Info;
	description = "Je ještě něco, s čím bych mohl pomoct?";
};


func int DIA_Addon_Henry_Owen_Condition()
{
	if((MIS_Henry_FreeBDTTower == LOG_SUCCESS) && (Henry_EnterCrewMember == TRUE) && !Npc_IsDead(Malcom))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Je ještě něco, s čím bych mohl pomoct?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Už několik dní čekáme na zásilku trámů na palisádu.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcom a Owen to měli donést už dávno.
	if(!Npc_KnowsInfo(other,DIA_Addon_Henry_Malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Dřevorubecký tábor je nedaleko odsud, u jezera na jihovýchodě.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcom síce řekl že to může trvat trochu déle, ale neřekl že to bude trvat celou věčnost.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Řekni jim, že čekáme na ty trámy.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nezdržuj se. Pověz to radši OWENOVI. Malcom není spolehlivý.
	B_MalcomExident();
	MIS_Henry_HolOwen = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_Running);
	B_LogEntry(TOPIC_Addon_HolOwen,"Henry čeká na trámy na hradby. Oznámil jsem to Owenovi. Stojí u jezera spolu s Malcomem.");
};

func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Stalo se něco Malcomovi?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Je mrtvý.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Vypadá to, že jeho štěstí pominulo, co?
};


instance DIA_Addon_Henry_Owen2(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 33;
	condition = DIA_Addon_Henry_Owen2_Condition;
	information = DIA_Addon_Henry_Owen2_Info;
	permanent = TRUE;
	description = "O dřevorubci Owenovi...";
};


func int DIA_Addon_Henry_Owen2_Condition()
{
	if(MIS_Henry_HolOwen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//O dřevorubci Owenovi...
	if(Npc_IsDead(PIR_1367_Addon_Owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Je mrtvý.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Sakra! To znamená, že se o to musí postarat někdo jiný.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//(podrážděně) Je načase, aby Morgan začal dělat svoji práci pořádně a vyčistil oblast od všech příšer.
		B_Addon_Henry_MalcomsDead();
		MIS_Henry_HolOwen = LOG_OBSOLETE;
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen a Malcom jsou mrtví.");
		Log_SetTopicStatus(TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	}
	else if(Owen_ComesToHenry == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen brzo pošle trámy.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Výborně, už bylo načase.
		B_Addon_Henry_MalcomsDead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Tady je tvá odměna.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		B_StartOtherRoutine(PIR_1367_Addon_Owen,"PostStart");
		B_LogEntry(TOPIC_Addon_HolOwen,"Owen pošle trámy Henrymu.");
		MIS_Henry_HolOwen = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Kde se zase utábořil?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Není to daleko odsud, směrem na jihovýchod, blízko jezera.
	};
};


var int Henry_PERM_Once;

instance DIA_Addon_Henry_Palisade_CanHelp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 34;
	condition = DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information = DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent = TRUE;
	description = "Potřebuješ pomoc?";
};


func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if((MIS_Henry_HolOwen == LOG_SUCCESS) || (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Potřebuješ pomoc?
	if(Henry_PERM_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Máš zkušenosti se stavěním palisád?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Ne, vůbec.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//V tom případě pro tebe nemám využití. Jdi pomoct někam jinam.
		Henry_PERM_Once = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//UH! A teď běž pro mě za mě kam chceš, ale hlavně nevyrušuj mé dělníky.
};


instance DIA_Addon_Henry_WhatTeach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 21;
	condition = DIA_Addon_Henry_WhatTeach_Condition;
	information = DIA_Addon_Henry_WhatTeach_Info;
	permanent = TRUE;
	description = "Můžeš mi pomoct zlepšit se v boji?";
};


func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if((Knows_HenrysEntertrupp == TRUE) && (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Můžeš mi pomoct zlepšit se v boji?

	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(smích) Nejprve si splň povinnosti. Až potom ti povím něco o zlepšení boje!
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//(šibalsky) Moje povolání zahrnuje vše.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Jistě, proč ne?
		Henry_Addon_TeachPlayer = TRUE;
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};


var int Henry_merke2h;
var int Henry_Labercount;

func void B_Henry_CommentFightSkill()
{
	if(Henry_Labercount == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//Učíš se rychle, jako správnej pirát.
		Henry_Labercount = 1;
	}
	else if(Henry_Labercount == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Jak budeš takhle pokračovat, můžeš nastoupit na galeje celkem sám.
		Henry_Labercount = 2;
	}
	else if(Henry_Labercount == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//A pamatuj, kdo se kryje, žije déle.
		Henry_Labercount = 0;
	};
};


instance DIA_Addon_Henry_Teach(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 6;
	condition = DIA_Addon_Henry_Teach_Condition;
	information = DIA_Addon_Henry_Teach_Info;
	permanent = TRUE;
	description = "Uč mě!";
};


func int DIA_Addon_Henry_Teach_Condition()
{
	if(Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Uč mě!
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] > Henry_merke2h)
	{
		B_Henry_CommentFightSkill();
	}
	else if(other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Pekelně ses zlepšil.
	};
	Info_ClearChoices(DIA_Addon_Henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75);
	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach,Dialog_Back,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,1) * 5),DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Addon_Henry_Teach_CB_5);
};


instance DIA_Addon_Henry_Palisade_Train(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 11;
	condition = DIA_Addon_Henry_Palisade_Train_Condition;
	information = DIA_Addon_Henry_Palisade_Train_Info;
	permanent = FALSE;
	description = "Greg je tvuj šéf?";
};


func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Henry_Palisade) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg je tvuj šéf?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//Přesně tak. A pro tebe je to KAPITÁN Greg. Mám ti to vysvětlit?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//Je to skvělý muž. Když ho potkáš, tak na něj nezkoušej žadnej podraz. Nemusela by se ti líbit jeho reakce.
	if(PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ve skutečnosti jsem se s ním už potkal.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Ach tak. Takže víš o čem mluvím.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Nanešťěstí teď není v táboře.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jeho zástupce se jmenuje Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Po celý den sedí před Gregovou chatrčí, a zírá na nás, jak pracujeme.
};


instance DIA_Addon_Henry_YourOwnTrupp(C_Info)
{
	npc = PIR_1354_Addon_Henry;
	nr = 1;
	condition = DIA_Addon_Henry_YourOwnTrupp_Condition;
	information = DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapitán z vás udělal řádnou partu, co?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ano, dřív než se ujistíme, že chlapi začali pracovat!
	AI_StopProcessInfos(self);
};

