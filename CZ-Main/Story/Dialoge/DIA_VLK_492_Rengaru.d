
instance DIA_Rengaru_EXIT(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 999;
	condition = DIA_Rengaru_EXIT_Condition;
	information = DIA_Rengaru_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rengaru_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rengaru_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rengaru_PICKPOCKET(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 900;
	condition = DIA_Rengaru_PICKPOCKET_Condition;
	information = DIA_Rengaru_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Rengaru_PICKPOCKET_Condition()
{
	return C_Beklauen(20,5);
};

func void DIA_Rengaru_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,Dialog_Back,DIA_Rengaru_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rengaru_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rengaru_PICKPOCKET_DoIt);
};

func void DIA_Rengaru_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
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

func void DIA_Rengaru_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rengaru_PICKPOCKET);
};


instance DIA_Rengaru_Hauab(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Hauab_Condition;
	information = DIA_Rengaru_Hauab_Info;
	permanent = TRUE;
	description = "Co tady děláš?";
};


func int DIA_Rengaru_Hauab_Condition()
{
	if((Jora_Dieb != LOG_Running) && (Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Hauab_Info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Myslím si, že ti do toho nic není. Ztrať se!
	AI_StopProcessInfos(self);
};

instance DIA_Rengaru_HALLODIEB(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_HALLODIEB_Condition;
	information = DIA_Rengaru_HALLODIEB_Info;
	permanent = FALSE;
	description = "Jora říkal, že jsi mu ukradl jeho peníze...";
};

func int DIA_Rengaru_HALLODIEB_Condition()
{
	if(Jora_Dieb == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Rengaru_HALLODIEB_Info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora říkal, že jsi mu ukradl jeho peníze...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Sakra! Padám pryč!
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,50);
	Npc_ExchangeRoutine(self,"RunAway");
};

instance DIA_Rengaru_GOTYOU(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 3;
	condition = DIA_Rengaru_GOTYOU_Condition;
	information = DIA_Rengaru_GOTYOU_Info;
	permanent = FALSE;
	description = "Mám tě!";
};

func int DIA_Rengaru_GOTYOU_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Rengaru_HALLODIEB) == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") < 500))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_GOTYOU_Info()
{
	B_GivePlayerXP(XP_RengaruGotThief);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Mám tě!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Co ode mě chceš?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Okradl jsi Joru o jeho měšec za denního světla a on tě při tom viděl.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Tak jsem ti přišel říct, že jsi zavšivenej zloděj a že...
	Info_ClearChoices(DIA_Rengaru_GOTYOU);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... já si zasloužím podíl na kořisti.",DIA_Rengaru_GOTYOU_Anteil);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... uděláš líp, když mu to hned vrátíš.",DIA_Rengaru_GOTYOU_YouThief);
	Info_AddChoice(DIA_Rengaru_GOTYOU,"... mi teď pěkně řekneš, kdo jsi.",DIA_Rengaru_GOTYOU_WhoAreYou);
};

func void DIA_Rengaru_GOTYOU_YouThief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//... uděláš líp, když mu to hned vrátíš.

	if(Npc_HasItems(self,ItMi_Gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Tady jsou prachy, chlape! Ale teď mě nech jít. Už to nikdy neudělám.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//Já už to zlato nemám.

		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Ale proč ti to vlastně říkám? To jsi byl ty, kdo mě okradl!
		};
	};

	Info_ClearChoices(DIA_Rengaru_GOTYOU);
};

func void DIA_Rengaru_GOTYOU_Anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//... já si zasloužím podíl na kořisti.

	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (Npc_HasItems(self,ItMi_Gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Vzal sis všechno, co jsem měl u sebe, jak si mě srazil na zem! Tak mě nech jít!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Dobrá, vypadá to, že nemám navybranou. Dám ti půlku.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Ne, dáš mi to všechno!",DIA_Rengaru_GOTYOU_Anteil_alles);
		Info_AddChoice(DIA_Rengaru_GOTYOU,"Fajn, tak mi dej půlku.",DIA_Rengaru_GOTYOU_Anteil_GehtKlar);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Ne, dáš mi to všechno!

	if(Npc_HasItems(self,ItMi_Gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Právě jsi mě okradl. Fajn, tak si to zlato vezmi. A teď mě nech na pokoji.
		B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Dal bych ti to zlato, ale už ho nemám.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_Anteil_GehtKlar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Fajn, tak mi dej půlku.

	if(B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Tady je tvoje polovina! A teď mě nech jít!
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Nebyl bych proti tomu dát ti polovinu zlata, ale já už ho nemám.
		Info_ClearChoices(DIA_Rengaru_GOTYOU);
	};
};

func void DIA_Rengaru_GOTYOU_WhoAreYou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//... mi teď pěkně řekneš, kdo jsi.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Jsem jen ubohý chudák, co se snaží vyjít s penězi, jak se dá.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Co ještě můžu udělat? Nemůžu ve městě vůbec najít práci...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//Dobrá, to vím. Přestaň kňourat!
};

instance DIA_Rengaru_INKNAST(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 4;
	condition = DIA_Rengaru_INKNAST_Condition;
	information = DIA_Rengaru_INKNAST_Info;
	permanent = FALSE;
	description = "Měl bych tě předhodit domobraně.";
};

func int DIA_Rengaru_INKNAST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_INKNAST_Info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Měl bych tě předhodit domobraně.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Co ještě chceš? Nezůstalo mi vůbec nic! Pusť mě, co?!
	Info_AddChoice(DIA_Rengaru_INKNAST,"Proč bych tě měl nechat jít?",DIA_Rengaru_INKNAST_keinKnast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Postarám se, abys skončil za mřížema.",DIA_Rengaru_INKNAST_Knast);
	Info_AddChoice(DIA_Rengaru_INKNAST,"Ztrať se! Ať už tě tady vícekrát neuvidím!",DIA_Rengaru_INKNAST_HauAb);
};

func void DIA_Rengaru_INKNAST_HauAb()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Ztrať se! Ať už tě tady vícekrát neuvidím!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Nebudeš toho litovat! Díky, chlape!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	Diebesgilde_Okay = Diebesgilde_Okay + 1;
};

func void DIA_Rengaru_INKNAST_Knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Postarám se, abys skončil za mřížema.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(unaveně) Už jsem z toho všeho unavený. Jestli máš dojem, že je to to, co bys měl udělat, tak dělej jak myslíš.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(varovně) Dávej si bacha - mí kamarádi to jen tak nenechají...
	Rengaru_InKnast = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Rengaru_INKNAST_keinKnast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Proč bych tě měl nechat jít?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//Ve městě není nikdy dobré si štvát proti sobě důležité lidi - a kazit dobré vztahy s nimi.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Mohl bych za tebe ztratit dobré slovo. Více nechci ani nemohu mluvit. Rozhodnutí je na tobě.
};


instance DIA_Rengaru_LastInfoKap1(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 6;
	condition = DIA_Rengaru_LastInfoKap1_Condition;
	information = DIA_Rengaru_LastInfoKap1_Info;
	permanent = TRUE;
	description = "Jak to jde? Vše pořádku?";
};


func int DIA_Rengaru_LastInfoKap1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rengaru_INKNAST))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_LastInfoKap1_Info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Jak to jde? Vše pořádku?
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Jen si posluž, jen si dráždi. jednou za to zaplatíš. Slibuju!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Co ještě chceš? Nic dalšího už jsem neukradl, vážně, chlape!
	};
};


instance DIA_Rengaru_Zeichen(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 2;
	condition = DIA_Rengaru_Zeichen_Condition;
	information = DIA_Rengaru_Zeichen_Info;
	permanent = FALSE;
	description = "(předvést zlodějský signál)";
};


func int DIA_Rengaru_Zeichen_Condition()
{
	if((Knows_SecretSign == TRUE) && (Rengaru_InKnast == FALSE) && Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void DIA_Rengaru_Zeichen_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hej, jsi jedním z nás.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Tak teď ti něco řeknu. Jestli se chystáš dostat do něčí kapsy tady ve městě, tak si dávej zvlášť pozor na kupce!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Jsou fakt opatrní a nespustí oči z jejich vlastních věcí. Ale můžu ti dát tip.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Pokus se vybranou věc vzít jednou rukou a tou druhou mávej. To jim odvede pozornost.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};


var int is_rengaru_trade;

instance DIA_RENGARU_ISTRADE(C_Info)
{
	npc = VLK_492_Rengaru;
	nr = 1;
	condition = dia_rengaru_istrade_condition;
	information = dia_rengaru_istrade_info;
	permanent = TRUE;
	description = "Nemáš něco na prodej?";
	trade = TRUE;
};


func int dia_rengaru_istrade_condition()
{
	if((Knows_SecretSign == TRUE) && (Rengaru_InKnast == FALSE) && Npc_KnowsInfo(other,DIA_Rengaru_GOTYOU))
	{
		return TRUE;
	};
};

func void dia_rengaru_istrade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Rengaru_Trade_00");	//Nemáš něco na prodej?
	AI_Output(self,other,"DIA_Rengaru_Trade_01");	//Ale jo. Mám u sebe nějaké věcičky navíc.

	if(IS_RENGARU_TRADE != 1)
	{
		B_LogEntry(TOPIC_CityTrader,"Pokud budu potřebovat paklíče nebo něco podobného, můžu je obstarat u Rengaru.");
		IS_RENGARU_TRADE = 1;
	};

	B_GiveTradeInv(self);
};
