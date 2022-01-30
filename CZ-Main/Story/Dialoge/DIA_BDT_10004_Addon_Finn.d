var int FinnTellFT;

instance DIA_Addon_Finn_EXIT(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 999;
	condition = DIA_Addon_Finn_EXIT_Condition;
	information = DIA_Addon_Finn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Finn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Finn_PICKPOCKET(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 900;
	condition = DIA_Addon_Finn_PICKPOCKET_Condition;
	information = DIA_Addon_Finn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Finn_PICKPOCKET_Condition()
{
	return C_Beklauen(35,50);
};

func void DIA_Addon_Finn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,Dialog_Back,DIA_Addon_Finn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Finn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Finn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Finn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};

func void DIA_Addon_Finn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Finn_PICKPOCKET);
};


instance DIA_Addon_Finn_Hacker(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Hacker_Condition;
	information = DIA_Addon_Finn_Hacker_Info;
	permanent = TRUE;
	description = "Znovu v práci?";
};


func int DIA_Addon_Finn_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Znovu v práci?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Nyní dostanu tady z toho dolu poslední kousek zlata.
};


instance DIA_Addon_Finn_Hi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 1;
	condition = DIA_Addon_Finn_Hi_Condition;
	information = DIA_Addon_Finn_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Finn_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Zdar!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//(naštvaně) Co chceš?
};


instance DIA_Addon_Finn_Hacke(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 2;
	condition = DIA_Addon_Finn_Hacke_Condition;
	information = DIA_Addon_Finn_Hacke_Info;
	permanent = FALSE;
	description = "Kde tady seženu krumpáč?";
};


func int DIA_Addon_Finn_Hacke_Condition()
{
	return TRUE;
};

func void DIA_Addon_Finn_Hacke_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Kde tady seženu krumpáč?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//Běž za Hunem - je to kovář. Ale to, že máš krumpáč ještě neznamená, že se dostaneš do dolu.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//Jestli tam chceš vstoupit, musíš prvně promluvit s Estebanem.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Ani nechoď za Thorusem - nepustí tě, dokud nebudeš mít červený kámen.
};


instance DIA_Addon_Finn_Esteban(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 3;
	condition = DIA_Addon_Finn_Esteban_Condition;
	information = DIA_Addon_Finn_Esteban_Info;
	permanent = FALSE;
	description = "Co si myslíš o Estebanovi?";
};


func int DIA_Addon_Finn_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Hacke))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Co si myslíš o Estebanovi?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(opatrně) Hmm... je tady kápo... on... myslím, že je v klidu.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(váhavě) Posílá vždy nejlepší muže do dolu. Myslím ty, kteří vědí něco o dolování.
};


instance DIA_Addon_Finn_Profi(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 4;
	condition = DIA_Addon_Finn_Profi_Condition;
	information = DIA_Addon_Finn_Profi_Info;
	permanent = FALSE;
	description = "A ty víš něco o dolování?";
};


func int DIA_Addon_Finn_Profi_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Esteban))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Profi_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//A ty víš něco o dolování?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//Jsem nejlepší!
};


instance DIA_Addon_BDT_10004_Finn_Mine(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 5;
	condition = DIA_Addon_Finn_Mine_Condition;
	information = DIA_Addon_Finn_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Finn_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Dobrá, šéfe. Chceš vědět, kdo nejlépe pracuje v dole? Tak tady to je...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//A další věc: Řeknu ti Kopáčovo tajemství.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Občas je lepší dát do toho i pořádnou ránu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//Jestli už dlouho doluješ a nevypadlo ti nic, tak bouchni krumpáčem šikmo přes skálu.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//S trochou štěstí něco tímto způsobem vyděláš.
	Knows_Truemmerschlag = TRUE;
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};

instance DIA_Addon_Finn_Gold(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 6;
	condition = DIA_Addon_Finn_Gold_Condition;
	information = DIA_Addon_Finn_Gold_Info;
	permanent = TRUE;
	description = "Nauč mě jak těžit zlato.";
};

func int DIA_Addon_Finn_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi) && (Hero_HackChance < 100))
	{
		return TRUE;
	};
};

func void DIA_Addon_Finn_Gold_Info()
{
	if(KNOWHOWPICKGOLD == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Řekni mi něco o tom jak těžit zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Finn_Gold_07_04");	//Nauč mě jak těžit zlato.
	};

	Info_ClearChoices(DIA_Addon_Finn_Gold);
	Info_AddChoice(DIA_Addon_Finn_Gold,Dialog_Back,DIA_Addon_Finn_Gold_Back);
	Info_AddChoice(DIA_Addon_Finn_Gold,b_buildlearnstringforgoldhunt("Těžba zlata",B_GetLearnCostTalent(other,NPC_TALENT_GOLDWORK,1)),DIA_Addon_Finn_Gold_GOLDWORK);
};

func void DIA_Addon_Finn_Gold_Back()
{
	Info_ClearChoices(DIA_Addon_Finn_Gold);
};

func void DIA_Addon_Finn_Gold_GOLDWORK()
{
	if(b_teachplayertalentgoldhunt(self,other,NPC_TALENT_GOLDWORK))
	{
		if(FINNTEACHMOREGOLD == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Je tu ještě několik věcí, které bys měl vědět: zlato není magická ruda - to je obrovský rozdíl.
			AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//Myslím - že žádná žena nebude nosit řetěz z rudy na krku.
			AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//Kopej zhora dolů. Tak ti to půjde nejlépe.
			AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//Někteří kopáči to dělají jinak - ale je to mnohem těžší.
			FINNTEACHMOREGOLD = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Finn_Gold_07_05");	//Žádný problém! Teď mě poslouchej. (mluví)
		};
	};

	Info_ClearChoices(DIA_Addon_Finn_Gold);
};

instance DIA_Addon_Finn_ein(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 7;
	condition = DIA_Addon_Finn_ein_Condition;
	information = DIA_Addon_Finn_ein_Info;
	permanent = TRUE;
	description = "Můžeš ohodnotit mou techniku dolování?";
};


func int DIA_Addon_Finn_ein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Profi) && (KNOWHOWPICKGOLD == TRUE))
	{
		return TRUE;
	};
};


var int Finn_einmal;
var int Finn_Gratulation;

func void DIA_Addon_Finn_ein_Info()
{
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Můžeš ohodnotit mou techniku dolování?
	if(Finn_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Jistě. Dělám to už 35 let. Není tu nic, co bych nepoznal!
		Finn_einmal = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//O tobě bych řekl, že jsi...
	if(Hero_HackChance < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//... těžký začátečník.
	}
	else if(Hero_HackChance < 35)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//... ne zas úplnej začátečník.
	}
	else if(Hero_HackChance < 50)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//... zkušený kopáč.
	}
	else if(Hero_HackChance < 65)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//... rozený kopáč.
	}
	else if(Hero_HackChance < 80)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//... zatraceně dobrý kopáč.
	}
	else if(Hero_HackChance < 95)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//... mistr kopáč.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//... guru mezi kopáči.
		if(Finn_Gratulation == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//Už jsi stejně dobrý, jako já. Gratuluju, parťáku!
			B_GivePlayerXP(200);
			Snd_Play("LevelUP");
			Finn_Gratulation = TRUE;
		};
	};
	concatText = ConcatStrings("Úroveň těžby zlata: ",IntToString(Hero_HackChance));
	AI_Print(concatText);
};


instance DIA_Addon_Finn_Attentat(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 8;
	condition = DIA_Addon_Finn_Attentat_Condition;
	information = DIA_Addon_Finn_Attentat_Info;
	permanent = FALSE;
	description = "O pokusu o atentát na Estebana...";
};


func int DIA_Addon_Finn_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(nedůvěřivě) Ano?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Nic o tom nevíš?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Proč to chceš vědět?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci mluvit s tím chlápkem...",DIA_Addon_Finn_Attentat_WannaTalk);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Esteban chce vidět jeho smrt!",DIA_Addon_Finn_Attentat_ForTheBoss);
};

func void B_Addon_Finn_TellAll()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(vysvětluje) Když se měl stát atentát, šel jsem za Hunem - kovářem.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//Nicméně tam nikdo nebyl.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//A?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//VŽDYCKY tam je. DOCELA podezřelé, když se mě ptáš!
	Finn_TellAll = TRUE;

	if(FinnTellFT == FALSE)
	{
		B_LogEntry(Topic_Addon_Esteban,"Finn mi řekl, že Huno v době pokusu o atentát nebyl v kovárně. Zdá se mu to podezřelé.");
		FinnTellFT = TRUE;
	};
};

func void DIA_Addon_Finn_Attentat_ForTheBoss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban chce vidět jeho smrt!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Och! Ty pracuješ pro šéfa?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Pak ti řeknu, co vím.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_WannaTalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//Chci mluvit s tím chlápkem...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(nedůvěřivě) A? Co od něj chceš?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"To není tvá starost!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Mám pro něj zajímavé informace!",DIA_Addon_Finn_Attentat_HaveInfos);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci odstranit Estebana a hledám spojence!",DIA_Addon_Finn_Attentat_KillEsteban);
};

func void DIA_Addon_Finn_Attentat_KillEsteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//Chci odstranit Estebana a hledám spojence!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//Nechci s tím nic mít!
	Finn_Petzt = TRUE;
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Finn_Attentat_HaveInfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//Mám pro něj zajímavé informace!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//Ty s ním nejsi spojenec, nebo snad ano?
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Chci odstranit Estebana a hledám spojence!",DIA_Addon_Finn_Attentat_KillEsteban);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"To není tvá starost!",DIA_Addon_Finn_Attentat_ForgetIt);
	Info_AddChoice(DIA_Addon_Finn_Attentat,"Nikdy!",DIA_Addon_Finn_Attentat_NoNo);
};

func void DIA_Addon_Finn_Attentat_NoNo()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(uctivě) Dobře! Řeknu ti, co vím.
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};

func void DIA_Addon_Finn_Attentat_ForgetIt()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//To není tvá starost!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//Tak to je? Pak o tom nic nevím.
	Info_ClearChoices(DIA_Addon_Finn_Attentat);
};


instance DIA_Addon_Finn_Again(C_Info)
{
	npc = BDT_10004_Addon_Finn;
	nr = 9;
	condition = DIA_Addon_Finn_Again_Condition;
	information = DIA_Addon_Finn_Again_Info;
	permanent = TRUE;
	description = "Ještě k tomu atentátu...";
};


func int DIA_Addon_Finn_Again_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Finn_Attentat) && !Npc_IsDead(Esteban))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Finn_Again_Info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//Ještě k tomu atentátu...

	if(Finn_TellAll == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//Řekl jsem ti vše, co vím.
		Info_ClearChoices(DIA_Addon_Finn_Again);
		Info_AddChoice(DIA_Addon_Finn_Again,"Dobře...",DIA_Addon_Finn_Again_Exit);
		Info_AddChoice(DIA_Addon_Finn_Again,"Zopakuj mi to!",DIA_Addon_Finn_Again_Nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//S tím nechci nic mít!
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Finn_Again_Exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//Hmm... (uznale) V pořádku...
	Info_ClearChoices(DIA_Addon_Finn_Again);
};

func void DIA_Addon_Finn_Again_Nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Zopakuj mi to!
	B_Addon_Finn_TellAll();
	Info_ClearChoices(DIA_Addon_Finn_Again);
};
