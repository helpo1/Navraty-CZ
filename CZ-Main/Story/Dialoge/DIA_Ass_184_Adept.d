instance DIA_Ass_184_Adept_EXIT(C_Info)
{
	npc = Ass_184_Adept;
	nr = 999;
	condition = DIA_Ass_184_Adept_exit_condition;
	information = DIA_Ass_184_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_184_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_184_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_Hello(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = DIA_Ass_184_Adept_hello_condition;
	information = DIA_Ass_184_Adept_hello_info;
	permanent = FALSE;
	important = TRUE;
};
	
func int DIA_Ass_184_Adept_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_hello_info()
{
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_01");	//Hele! Kohopak to tu máme? Další novic, který se rozhodl zkusit své štěstí?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_03");	//Jak jako, co tím myslím? Přišel jsi sem, abys udělal dojem na mistra Osaira!
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_04");	//Na tom mi nezáleží.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_05");	//Proč?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_06");	//Už jsem pracoval pro mistra Osaira a za to mě povýšil na jeho murida.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_07");	//(sklíčeně) Co? Takže ty jsi jeho murid, jo? 

	if(PlayerIsAssNow == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_08");	//Jsi snad slepý? Není snad poznat, že už jsem zasvěcen jako stín bratrstva?
		AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_09");	//Prosím, odpusť mi to, bratře. Jen mne zaskočilo, že mistr Osair už murida má.
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_10");	//A ty by ses jím chtěl stát?
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_11");	//Ano. Brzy budu přijat ke stínům bratrstva.
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_12");	//Takže máš stále ještě šanci se jím stát.
	};

	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_13");	//Och! Dal bych za to všechno. Jen aby mi dali takovou možnost.
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_14");	//Možná bych ti s tím mohl pomoc.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_15");	//A jak?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_16");	//No, řekněme, že vím, jak udělat dojem na mistra Osaira. 
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_17");	//A jak? 
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_18");	//Přines mu kůži jakéhokoli vzácného zvířete. 
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_19");	//Jak už vím, mistr Osair má rád takovéhle věci. 
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_20");	//Avšak musí to být doopravdy kvalitní kůže a ne nějaká laciná. 
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_21");	//Jestli všechno uděláš správně - počítej, že jednou nohou jsi už jeho muridem. 
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_22");	//Chápu. Ale kde mám sehnat takovou kůži?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_23");	//Tady ti už nepomůžu. U někoho ji kup nebo vyměň.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_24");	//Dobře, chápu. Zkusím udělat vše, co jsi mi poradil. 
	TiamantNeedsSlaves = TRUE;
	B_LogEntry(TOPIC_Intriges,"V jeskyni mistra Osaira jsem potkal novice Hoakina, který sní o tom stát se jeho muridem. Rozhodl jsem se mu pomoct s radou, jak by mohl převora zaujmout. Jestli to zvládne, budoucí murid mistra Osaira mi bude v budoucnu něco dlužit.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_HelpWithAssair(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_HelpWithAssair_condition;
	information = dia_Ass_184_Adept_HelpWithAssair_info;
	permanent = FALSE;
	description = "Jak se ti daří?";
};

func int dia_Ass_184_Adept_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_HelpWithAssair_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_184_Adept_HelpWithAssair_01_01");	//Jak se ti daří?
	AI_Output(self,other,"DIA_Ass_184_Adept_HelpWithAssair_01_02");	//Líp by to nešlo. Jak jsi říkal, mistr Osair opravdu ocenil mou nabídku.
	AI_Output(self,other,"DIA_Ass_184_Adept_HelpWithAssair_01_03");	//Takže teď mu dělám asistenta. 
	AI_Output(other,self,"DIA_Ass_184_Adept_HelpWithAssair_01_04");	//Rád vidím, že jsi nepropásl svou šanci. 
};

instance DIA_Ass_184_Adept_GiveLetter(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_GiveLetter_condition;
	information = dia_Ass_184_Adept_GiveLetter_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int dia_Ass_184_Adept_GiveLetter_condition()
{
	if(MIS_PW_GOLDSHAHT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GiveLetter_info()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_01");	//Co tady děláš?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_02");	//Nemáš náhodou být na cestě k chrámu, abys mistru Tiamantovi předal dopis?
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_03");	//Taky to tak je... (váhavě) Ale rozhodl jsem se, že se tu trochu pomodlím.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_04");	//To je pochopitelné. Ale jestli se to mistr Osair dozví, tak ten z tebe sedře kůži zaživa.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_05");	//(nervózně) Jistě, máš pravdu. Okamžitě jdu do chrámu. 
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_06");	//Počkej! Ten dopis pro mistra Tiamanta - máš ho?
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_07");	//Ano, mám. Proč se ptáš? 
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_08");	//Nech mě ho přečíst.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_09");	//Cože? Ale já... tohle nemůžu udělat!
	Info_ClearChoices(DIA_Ass_184_Adept_GiveLetter);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Dej mi ten dopis, nebo tě zabiju!",DIA_Ass_184_Adept_GiveLetter_M1);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Myslím, že mistr Osair se o tobě rád dozví pár věcí.",DIA_Ass_184_Adept_GiveLetter_M2);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Neblázni. Nikdo se o tom nedozví.",DIA_Ass_184_Adept_GiveLetter_M3);
};


func void DIA_Ass_184_Adept_GiveLetter_M1()
{
	CreateInvItems(self,ItWr_OsaitToTiamant,1);
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M1_01_01");	//Dej mi ten dopis, nebo tě zabiju!
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M1_01_02");	//Poslouchej, mě jen tak nevystrašíš! Stejně ti ho nedám.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M1_01_03");	//Dobře, jak chceš. Řekl sis o to sám.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_184_Adept_GiveLetter_M2()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_01");	//Myslím, že mistr Osair se o tobě rád dozví pár věcí.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_02");	//Pak se na tebe štěstí určitě neusměje!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_03");	//Beliar tě vem! No dobře. Tady, vem si ho.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_04");	//Prosím tě, neboj se tak. Jen to přečtu a máš ho zpět.
	B_GiveInvItems(self,other,ItWr_OsaitToTiamant,1);
	B_HeroUseFakeScroll();
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_05");	//Tak a je to! A ty ses bál.
	B_GiveInvItems(other,self,ItWr_OsaitToTiamant,1);
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_06");	//Doufám, že to zůstane jen mezi námi. Jinak mi mistr Osair určitě setne hlavu.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_07");	//Samozřejmě. Teď jdi okamžitě do chrámu. Pak tě budu očekávat v jeskyni u mistra Osaira.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_08");	//(nedůvěřivě) Proč tam?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_09");	//Mistr mi přikázal, abych tebe a ještě několik otroků odvedl ke zlaté rudě, kterou nedávno nalezli v podhorském průchodu.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_10");	//Takže to dlouho nenatahuj.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_11");	//Dobře, uvidíme se tam.
	B_LogEntry(TOPIC_Intriges,"Podle textu z dopisu, mistr Osair je celkem dost nespokojen s mistrem Tiamantem. Jsem si jistý, že o tom mistr Haniar bude chtít něco vědět.");
	KnowOsairToTiamant = TRUE;
	TiamantNeedsSlaves = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_184_Adept,"Tiamant");
};

func void DIA_Ass_184_Adept_GiveLetter_M3()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M3_01_01");	//Neblázni. Nikdo se o tom nedozví.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M3_01_02");	//Ne, je to dost riskantní.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M3_01_03");	//Kdo jako jsi, abys četl korespondenci převorů?
};

instance DIA_Ass_184_Adept_GoShaht(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_GoShaht_condition;
	information = dia_Ass_184_Adept_GoShaht_info;
	permanent = FALSE;
	description = "Je čas jít. Jsou otroci připraveni?";
};

func int dia_Ass_184_Adept_GoShaht_condition()
{
	if((HaniarBlameTiamant == TRUE) && (HoakinIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GoShaht_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_01_01");	//Je čas jít. Jsou otroci připraveni? 
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_01_02");	//Ano, vše je v pořádku. Vybral jsem pár silnějších...
	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_01_03");	//Tak je veď za mnou a nezpomaluj. 
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_01_04");	//Dobře.
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Vedu Hoakina a otroky ke zlaté žíle na žádost mistra Osaira.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_184_Adept_GoShaht_Done(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = DIA_Ass_184_Adept_GoShaht_Done_condition;
	information = DIA_Ass_184_Adept_GoShaht_Done_info;
	permanent = FALSE;
	description = "Jsme na místě.";
};
	
func int DIA_Ass_184_Adept_GoShaht_Done_condition()
{
	if((MIS_PW_FollowGoldOre == LOG_Running) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_GUARD_03") <= 750))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_GoShaht_Done_info()
{
	var C_Npc Hoakin;
	var C_Npc Slave_01;
	var C_Npc Slave_02;
	var int XP_Count;

	Hoakin = Hlp_GetNpc(Ass_184_Adept);
	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	if(HoakinIsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Hoakin.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if(GoldSlave_01_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_01.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if(GoldSlave_02_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_02.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	XP_Count = 500 + (XP_Count * 500);
	B_GivePlayerXP(XP_Count);
	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_Done_01_00");	//Jsme na místě.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_Done_01_01");	//Díky, že jsi nás doprovodil.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_Done_01_02");	//Ale je to tady dost nebezpečné místo! Myslím, že bys tu měl zůstat do příchodu stráží.
	OsairWarriorWait = TRUE;
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Přivedl jsem otroky do dolu. Teď musím počkat na lidi mistra Osaira a pak ho o všem informovat. Myslím, že bych neměl opouštět Hoakina a otroky. Jestli zemřou do příchodu stráží, bude to pouze má vina. A to by mi nenahrálo přímo do karet.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(SEK_387_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(SEK_186_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(Ass_184_Adept,"GoldOre");
};
