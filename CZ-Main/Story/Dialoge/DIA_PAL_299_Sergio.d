
instance DIA_Sergio_EXIT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 999;
	condition = DIA_Sergio_EXIT_Condition;
	information = DIA_Sergio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Nechť Innos osvětlí tvou cestu.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_WELCOME(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 5;
	condition = DIA_Sergio_WELCOME_Condition;
	information = DIA_Sergio_WELCOME_Info;
	important = TRUE;
};


func int DIA_Sergio_WELCOME_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,DIA_Sergio_Isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Innos s tebou, co pro tebe můžu udělat?
};


instance DIA_Sergio_Isgaroth(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Isgaroth_Condition;
	information = DIA_Sergio_Isgaroth_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Isgaroth_Condition()
{
	if(Npc_KnowsInfo(hero,PC_PrayShrine_Paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Pomodlil ses za mé bratry. Děkuji ti za to. Řekni mi, jestli něco potřebuješ.
	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth,"Co takhle malá dotace?",DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth,"Podělíš se se mnou o své bojové zkušenosti?",DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Co takhle malá dotace?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Ať ti tohle zlato dobře poslouží.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Podělíš se se mnou o své bojové zkušenosti?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Když bojuješ, hlídej si, jestli ti někdo nejde po zádech.
	other.HitChance[NPC_TALENT_2H] = other.HitChance[NPC_TALENT_2H] + 2;
	AI_Print(PRINT_Learn2H);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};


instance DIA_Sergio_Aufgabe(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Aufgabe_Condition;
	information = DIA_Sergio_Aufgabe_Info;
	description = "Potřebuji přístup do knihovny.";
};


func int DIA_Sergio_Aufgabe_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Sergio_Isgaroth))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Potřebuji přístup do knihovny.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//No, nemůžu ti dát klíč. Prvně musíš splnit své úkoly.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Ale můžu ti pomoci. Jdi za mistrem Isgarothem. Říkal, že by se mu hodila pomoc. Chtěl jsem za ním jít sám, ale svěřím ti tenhle úkol.
	Sergio_Sends = TRUE;
	Wld_InsertNpc(BlackWolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(Topic_IsgarothWolf,LOG_MISSION);
	Log_SetTopicStatus(Topic_IsgarothWolf,LOG_Running);
	B_LogEntry(Topic_IsgarothWolf,"Mistr Isgaroth prý potřebuje pomoc v kapli. Měl bych ho navštívit.");
};


instance DIA_Sergio_WHAT(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_WHAT_Condition;
	information = DIA_Sergio_WHAT_Info;
	description = "Co tady děláš?";
};


func int DIA_Sergio_WHAT_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Modlím se k Innosovi, aby mi propůjčil sílu.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//S jeho požehnáním a v jeho jménu pak budu připraven porazit všechny své nepřátele.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//Jaké nepřátele?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//Všechny, kteří bojují proti Innosovi - ať už lidi nebo bestie.
};


instance DIA_Sergio_Babo(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 3;
	condition = DIA_Sergio_Babo_Condition;
	information = DIA_Sergio_Babo_Info;
	description = "Nemohl bys trochu trénovat s Babem?";
};


func int DIA_Sergio_Babo_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Anliegen))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Nemohl bys trochu trénovat s Babem?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//Proč se mě nezeptá sám?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Myslím, že se stydí.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Aha. No, jestli to pro něj tolik znamená, můžeme trénovat dvě hodiny vždy za svítání. Začneme v pět, řekni mu to.
	Npc_ExchangeRoutine(self,"TRAIN");
	B_StartOtherRoutine(Babo,"TRAIN");
	B_LogEntry(Topic_BaboTrain,"Sergio souhlasil, že bude s Babem cvičit dvě hodiny každý den na svítání.");
};


instance DIA_Sergio_WHY(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 4;
	condition = DIA_Sergio_WHY_Condition;
	information = DIA_Sergio_WHY_Info;
	description = "Proč nejsi s ostatními paladiny?";
};


func int DIA_Sergio_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WELCOME) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Proč nejsi s ostatními paladiny?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//Může to sice vypadat zvláštně, nicméně paladinové slouží i mágům hlásajícím Innosovu vůli.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//My paladinové jsme Innosovi válečníci. Jeho vůle je náš zákon. Já například právě teď čekám na nové rozkazy od mágů.
};


instance DIA_Sergio_ORDERS(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_ORDERS_Condition;
	information = DIA_Sergio_ORDERS_Info;
	permanent = TRUE;
	description = "Už jsi obdržel nové rozkazy?";
};


func int DIA_Sergio_ORDERS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Sergio_WHY) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//Už jsi obdržel nové rozkazy?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Ne. Do té doby budu hledat sílu v modlitbě.
};


instance DIA_Sergio_Start(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Start_Condition;
	information = DIA_Sergio_Start_Info;
	permanent = FALSE;
	description = "Máš mě doprovodit k průsmyku.";
};


func int DIA_Sergio_Start_Condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (Sergio_Follow == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//Máš mě doprovodit k průsmyku.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Dobrá. Znám cestu, následuj mě.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npcType = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Sergio_Guide(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 10;
	condition = DIA_Sergio_Guide_Condition;
	information = DIA_Sergio_Guide_Info;
	permanent = TRUE;
	description = "Co se děje?";
};


func int DIA_Sergio_Guide_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Co se děje?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Mám tě doprovodit k průsmyku, ale nebezpečná část cesty začne teprve tam.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//Ale neztrácejme čas.
	AI_StopProcessInfos(self);
};


instance DIA_Sergio_Ende(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Ende_Condition;
	information = DIA_Sergio_Ende_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Ende_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Tak jsme tu. Ať tě už čeká v Hornickém údolí cokoli, doufám, že najdeš cestu zpět.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Bez obav, vrátím se.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Jdi s Innosem. On tě bude ochraňovat.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Sergio_Perm(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 2;
	condition = DIA_Sergio_Perm_Condition;
	information = DIA_Sergio_Perm_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sergio_Perm_Condition()
{
	if((Kapitel >= 3) && (Kapitel < 6) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Perm_Info()
{
	if(other.guild == GIL_PAL)
	{
		if(Kapitel >= 4)
		{
			AI_Output(self,other,"DIA_Sergio_Perm_04_02");	//Za Innose, bratře.
		}
		else
		{
			AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//Chvála Innosovi, bratře. Jestli se chceš dozvědět něco o posvěcení meče, jdi za Mardukem.
		};
	}
	else if((other.guild == GIL_DJG) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//Slyšel jsem o tobě. Ty jsi ten chlápek z farmy, co byl v Hornickém údolí. Máš můj respekt.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_03");	//Máš můj respekt, ctihodný mágu Vody.
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_04");	//(neochotně) I když nekromanty zrovna nemusím, tak ty... máš můj respekt.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_05");	//Slyšel jsem o tobě. Jsi jeden z toho Bratrstva, které vzniklo za bariérou. Máš můj respekt.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_06");	//Vítám tě, poutníku.
	};
	AI_StopProcessInfos(self);
};

instance DIA_Sergio_PICKPOCKET(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 900;
	condition = DIA_Sergio_PICKPOCKET_Condition;
	information = DIA_Sergio_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Sergio_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,Dialog_Back,DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sergio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,hero,ItKe_Innos_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	}
	else
	{
		Print("Potřebná obratnost: 150");

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

func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};


instance DIA_SERGIO_TELLSERGIO(C_Info)
{
	npc = PAL_299_Sergio;
	nr = 49;
	condition = dia_sergio_tellsergio_condition;
	information = dia_sergio_tellsergio_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_tellsergio_condition()
{
	if((MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_tellsergio_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_00");	//Co tady děláš? Zmiz!
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_02");	//Chci být sám.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_03");	//A vůbec, proč jsi sem přišel?
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_04");	//Přišel jsem ti pomoct.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_05");	//Nikdo mi už nedokáže pomoci... (zdrceně) Můj osud se už nedá zvrátit ani smrtí...
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_06");	//Mýlíš se. Pouze smrt tě může vysvobodit!
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_07");	//Co? (naštvaně) Co ty o tom víš?
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_08");	//Věř mi, vím to! Stejně jako to, co se s tebou pak stane.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_09");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_10");	//Přestaň! Moc dobře víš, co myslím.
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_11");	//Po smrti se staneš Pánem stínů. A to je jen začátek noční můry, která na tebe čeká.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_13");	//Hmm... Ano, máš pravdu.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_14");	//Nicméně to už nelze změnit. Síla temnoty mě již téměř ovládla a už se jí nedokážu bránit.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_15");	//Brzy budu muset odejít do světa stínů. Mé místo tam bylo již předurčeno. A ty tomu nezabráníš!
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_17");	//Nemáš ani ponětí, jaké síle se chceš vzepřít!
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_18");	//Ale neboj se! Já ti ukážu její hněv!
	AI_Output(other,self,"DIA_Sergio_TellSergio_01_19");	//Nu, zkus to.
	AI_Output(self,other,"DIA_Sergio_TellSergio_01_20");	//(naštvaně) Zemři!
	self.aivar[93] = FALSE;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	B_LogEntry(TOPIC_FARIONTEST,"Přišel jsem pozdě - Sergio už není, co býval. Jeho mysl je již ztracena v temnotě. Musím ukončit jeho trápení.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

