
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Dobrá, ať se propadnu! Koukáš, jak si vydělat, co? Věděl jsem to! Máš žoldáckou duši.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Hele, jestli si myslíš, že si tu můžeš nahrabat, tak to se fakt pleteš. Byl jsem tu první.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hej, ty! Mágové mě znervózňují! Běž někam jinam! Tady pro tebe nic není.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02A");	//Hej, ty! Padej někam jinam, tady pro tebe není místo.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hej, ty, paladine! Vrať se zpátky do těch svejch dolů. Tady pro tebe nic není.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Jasný. Nikdo se nechce dělit o svou kořist.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Přesně tak. Zmizni.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "A co když se mi nechce?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//A co když se mi nechce?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Nehraj si na tvrďáka, pískle, jinak skončíš jako ty mizerný svině, co se válej támhle na sněhu.
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "To byli tví lidé?";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//To byli tví lidé?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Ne tak docela. Žádný velký ztráty. Ti idioti stejně nestáli za nic.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Co se jim stalo?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Co se jim stalo?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Nebyli schopný se dostat tam přes ty ledový obry. Zůstali tam.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Když jseš tak tvrdej, tak proč to nezkusíš?
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Tak dobrá. Proč ne?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"K čemu ti bude dobrý, když to udělám?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co z toho budu mít?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Proč to nevyřídíš sám?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Sylvio se bojí dvou ledových golemů před vchodem do zamrzlé části Hornického údolí.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Proč to nevyřídíš sám?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Hele, nech si ty nafoukaný řeči.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//Jak to já vidím, jseš podělanej strachy.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Nemám v úmyslu přistoupit na tvoji hru.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Co z toho budu mít?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Hodně. Řekněme... 100 zlatých. To zní dobře, ne?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//K čemu ti bude dobrý, když to udělám?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//K tomu samýmu, co tobě. Ale abych ti odpověděl na otázku, chci se dostat do té zamrzlé oblasti.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Bohužel, v cestě mi stojej ty zatracený věci.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Co chceš v té zamrzlé oblasti dělat?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Nemám v úmyslu přistoupit na tvoji hru.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Aha. Tak odsud koukej sypat, ty zbabělče.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Co chceš v té zamrzlé oblasti dělat?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ty s těma otázkama nepřestaneš, co? Dobrá, povím ti to.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Tady, za tím srázem, je taková ledová pustina, jakou jsi nikdy předtím neviděl.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Spolu s tučnými zásobami tam je ukrytý poklad ledového draka.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Chci ho dostat. Tak jak? Ano, nebo ne?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Tak dobrá. Proč ne?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Tak honem. Nemám na to celý den.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Cesta je volná!";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Cesta je volná! Ti ledoví obři už tam zaclánět nebudou.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Dobrá práce. Podíváme se na to.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Tak moment. A co prachy?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Všechno má svůj čas.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Co dál?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Co dál?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//No... Řekl bych, že to vypadá pěkně na levačku!
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Nejlíp bude, když půjdeš první a já za tebou.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Tak dobrá.",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Bojíš se?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Nebudu za tebe dělat špinavou práci.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Nejdřív bych rád viděl ty prachy.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Bojíš se?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nesmysl! Přestaň žvanit. Jdeme!
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Tak dobrá.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Fajn, pokračuj, do toho!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Nebudu za tebe dělat špinavou práci.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Zbabělče!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Nejdřív bych rád viděl ty prachy.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Až dostaneme toho draka, budeš mít peněz, kolik uneseš.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Chci ty peníze hned.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Chci ty peníze hned.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Buď půjdeš vpředu, nebo si to s tebou vyřídim.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Myslel jsem, že máme namířeno do té zamrzlé oblasti.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (TOPIC_END_SylvioKillIceGolem == FALSE) && (Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Myslel jsem, že máme namířeno do té zamrzlé oblasti.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Pokračuj dál! Budu hned za tebou.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Potřeboval bych nějakou pomoc.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE) && (TOPIC_END_SylvioKillIceGolem == FALSE) && (Npc_IsDead(IceDragon) == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Potřeboval bych nějakou pomoc.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nesmysl! Vedeš si dobře.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ledový drak je mrtvý! A teď mi dej všechno, co u sebe máš!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ani náhodou!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Budu to já, koho nemine sláva za zabití ledového draka.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Tvoje nepodstatná role je právě u konce!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Ten hajzl Sylvio si dělal nároky na moje vítězství nad ledovým drakem! Trochu jsme se kvůli tomu pohádali...");
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};

instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT) && (SylvioCampUp == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};



//--------------------------------Otryad Sil'vio----------------------------------------------


instance DIA_SylvioDJG_Camp_Hello(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Hello_Condition;
	information = DIA_SylvioDJG_Camp_Hello_Info;
	important = TRUE;
};

func int DIA_SylvioDJG_Camp_Hello_Condition()
{
	if(SylvioCampUp == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Hello_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_00");	//Zase ty. Věčně se mě pleteš pod nohama.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_01");	//Zřejmě jsi neztrácel čas. Rozhodl ses přisvojit si poklady ledového draka?!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_02");	//Nyní jsou jen moje. (výhružně) Takže se koukej od nich držet dál! Jestli je ti drahý tvůj život.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_03");	//Myslel jsem, že se podělíš s ostatními.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_04");	//Samo sebou. Ale my pokud vím, jsme neřešili, co uděláme s toudle horou zlata. 
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_05");	//Vy nevíte, co dělat se zlatem?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_06");	//Představ si! Tady nám bude k ničemu.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_07");	//A v Khorinisu situace také není příznivá.
};

instance DIA_SylvioDJG_Camp_Plan(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Plan_Condition;
	information = DIA_SylvioDJG_Camp_Plan_Info;
	permanent = FALSE;
	description = "Máš plán?";
};

func int DIA_SylvioDJG_Camp_Plan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Plan_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_00");	//Máš plán?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_01");	//(rozmrzele) Ano, mám plán. Proto tomu tady velím!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_02");	//A v čem spočívá?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_03");	//Chci se dostat ven z tohoto prokletého ostrova a vzít s sebou všechno zlato.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_04");	//Ale k tomu potřebuješ loď.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_05");	//Chytrolíne... to vím i bez tebe.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_06");	//Ale jediná loď na ostrově Khorinis, nyní stojí v přístavu.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_07");	//A pochybuju, že nás paladinové na ní nechaj odplout.
};

instance DIA_SylvioDJG_Camp_Bullco(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Bullco_Condition;
	information = DIA_SylvioDJG_Camp_Bullco_Info;
	permanent = FALSE;
	description = "Kde je tvůj přítel Bullco?";
};

func int DIA_SylvioDJG_Camp_Bullco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Bullco_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Bullco_01_00");	//Kde je tvůj přítel Bullco?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Bullco_01_01");	//Ten darebák zdrhnul. Říkal, že už má dost všech těch problémů.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Bullco_01_02");	//Doufám, že ho sežrali místní potvory!
};

instance DIA_SylvioDJG_Camp_Drakar(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Info;
	permanent = FALSE;
	description = "Je zde ještě jedna loď!";
};

func int DIA_SylvioDJG_Camp_Drakar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Plan) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_00");	//Je zde ještě jedna loď!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_02");	//Opravdu?! A kde je?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_03");	//Na druhý straně údolí je obrovský skřetí Drakar.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_04");	//Hmmm... To je zajímavé! Ale on je jistě dobře střežen.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_05");	//To asi jo.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_06");	//To znamená, že se musíme nějak zbavit skřetů.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_07");	//Tak vpřed, ukážem jim!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_08");	//Ty nerozumíš, nemůžeme tady to zlato nechat.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_09");	//Jak odsud odejdem, strčej sem skřeti ty svý tlamy.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_10");	//A potom ho od nich už nedostanem!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_11");	//Co navrhuješ?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_12");	//(úlisně) No ty jsi tady hrdina! Tak řeš problémy.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_13");	//A co s tím mám dělat?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_14");	//(s úsměvem) No do teď jsme měli určité neschody.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_15");	//Ale jestli nám pomůžeš, jsem ochotnej se s tebou podělit.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_16");	//Nabízíš mě zlato, které mě po právu náleží?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_17");	//Ale ono už není tvoje, příteli... (posměšně) Tak jestli chceš nějaký podíl, budeš nám muset pomoct.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_18");	//Tak co souhlasíš?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_19");	//Dobře. Pokusím se něco vymyslet.
	MIS_SylvioDrakar = LOG_Running;
	Log_CreateTopic(Topic_SylvioDrakar,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Running);
	B_LogEntry(Topic_SylvioDrakar,"Sylvio chce, abych jim pomohl získat skřetí Drakar. Pak se se mnou podělí o zlato ledového draka.");
	AI_StopProcessInfos(self);

	if(FLAG_ORCS_DRAKAR == TRUE)
	{
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_01");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_03");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_04");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_05");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_06");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_07");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_08");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_09");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_10");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_11");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_12");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_13");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_14");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_15");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_16");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_17");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_18");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_19");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_20");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_21");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_22");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_23");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_24");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_25");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_26");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_27");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_28");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_29");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_30");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_31");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_32");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_33");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_34");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_35");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_01");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_02");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_03");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_04");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_05");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_01");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_02");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_03");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_04");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_05");
		Wld_InsertNpc(ORKELITE_CHKFLG_SYLVIODRAKAR_CAPITAN,"FP_CAMPFIRE_DRAKARSHIP_CAPITAN");
	};
};

instance DIA_SylvioDJG_Camp_Orcs(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Info;
	permanent = FALSE;
	description = "Skřeti už se pokusily zaútočit na váš tábor?";
};

func int DIA_SylvioDJG_Camp_Orcs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_01_00");	//Skřeti už se pokusily zaútočit na váš tábor?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_01");	//Ano. Ale jak vidíš, neuspěli.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_02");	//Tohle místo je ideální, pro bránění.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_03");	//Takže teď nemá žádnej smysl opouštět tábor.
};

instance DIA_SylvioDJG_Camp_OthTre(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_OthTre_Condition;
	information = DIA_SylvioDJG_Camp_OthTre_Info;
	permanent = FALSE;
	description = "A co poklady ostatních draků?";
};

func int DIA_SylvioDJG_Camp_OthTre_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_OthTre_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_OthTre_01_00");	//A co poklady ostatních draků?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_01");	//Hmm... Rádi bychom vzali i je, ale je to příliš nebezpečné!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_02");	//Údolí se hemží skřety a tohle je jediné místo, kde se cítíme trochu bezpečně.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_03");	//Takže nemáme šanci se k nim dostat!
};

instance DIA_SylvioDJG_Camp_Drakar_Done(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Done_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Done_Info;
	permanent = FALSE;
	description = "Skřetí drakar... čistý!";
};

func int DIA_SylvioDJG_Camp_Drakar_Done_Condition()
{
	if((MIS_SylvioDrakar == LOG_Running) && (FLAG_ORCS_DRAKAR_02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_00");	//Skřetí drakar... čistý!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_01");	//Výborně... (starostlivě) teď budeme muset vyřešit, jak dostat zlato na loď.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_02");	//A co můj podíl?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_03");	//Nespěchej! Máme tady ještě další problém.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_04");	//Jaký?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_05");	//Mluvil jsem s chlapcema a ukázalo se, že nikdo z nich nezvládne ovládací mechanizmus.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_06");	//Takže nemůžem ani odplout.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_07");	//Chcete abych vám našel kapitána?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_08");	//(s úsměvem) Nejseš až takovej pitomec, jak vidím.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_09");	//Přirozeně, potřebujeme člověka, který by si poradil s toudle bárkou.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_10");	//Koneckonců, to byl tvůj nápad sebrat loď skřetům.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_11");	//Teď se můžeš vytáčet jak chceš!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_12");	//Jo, a taky... (nedbale) By se nám hodila dobrá kuchařka.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_13");	//Nemám zájem umřít na moři hladem, než budu mít šanci, užít si svého bohatství.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_14");	//Doufám, že jsem to řekl dost jasně?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_15");	//Je to tak.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_16");	//Tak se dej do práce. Víš, že nemáme moc času!
	MIS_SylvioDrakar = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Success);
	B_LogEntry(Topic_SylvioDrakar,"Sylvio byl rád, že drakar skřetů již není chráněný.");
	MIS_SylvioCrew = LOG_Running;
	Log_CreateTopic(Topic_SylvioCrew,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioCrew,LOG_Running);
	B_LogEntry_Quiet(Topic_SylvioCrew,"Sylvio chce abych našel někoho, kdo dokáže řídit skřetí drakar. Kromě toho potřebuje taky kuchaře. Ano, je to pořád něco s čím otravuje! Ale co bych neudělal pro zlato.");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Info;
	permanent = FALSE;
	description = "A co skřeti nad touto jeskyní?";
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Orcs) == TRUE) && (FLAG_ORCS_CHK_27 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_00");	//A co skřeti nad touto jeskyní?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_01");	//Co tím myslíš?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_02");	//Mají tam malý tábor. Ty o tom nevíš?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_03");	//Ne, sakra a proč jsi to neřek dřív?!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_04");	//Neptal ses.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_05");	//(zoufale) Teď jsme všichni ve velkém nebezpečí! Musíme se jich zbavit! Zabí je všechny! 
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_06");	//Co, zase já?!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_07");	//Ale to ty jsi mě řek o jejich táboře. Kromě toho teď zrovna nemůžeme vypadnout!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_08");	//Tak se do toho pusť.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_09");	//Všichni skřeti jsou mrtví!
	MIS_SylvioOrcs = LOG_Running;
	Log_CreateTopic(Topic_SylvioOrcs,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Running);
	B_LogEntry(Topic_SylvioOrcs,"Když se Sylvio dozvěděl, že nad jeskyní ledového draka je skřetí tábor, málem omdlel. Mám se postarat, aby mu skřeti už nedělali těžkou hlavu.");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up_Done(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Done_Info;
	permanent = FALSE;
	description = "Na skřety nad jeskyní můžeš zapomenout.";
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition()
{
	if((MIS_SylvioOrcs == LOG_Running) && (FLAG_ORCS_CHK_27 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_00");	//Na skřety nad jeskyní můžeš zapomenout.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_01");	//Jak to myslíš?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_02");	//Už tam nejsou.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_03");	//Dobře. To mě trošku uklidnilo.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_04");	//Teď se můžeš zabývat něčím jiným. Věřím, že něco máš.
	MIS_SylvioOrcs = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Success);
	B_LogEntry(Topic_SylvioOrcs,"Uklidnil jsem Sylvia, když jsem mu řek, že skřeti nad jeskyní už nejsou problém.");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Drakar_Crew(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Crew_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Crew_Info;
	permanent = TRUE;
	description = "Co se týče vašeho kapitána...";
};

func int DIA_SylvioDJG_Camp_Drakar_Crew_Condition()
{
	if(MIS_SylvioCrew == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Crew_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_00");	//Co se týče vašeho kapitána...
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_01");	//Ano? Co máš?


	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_02");	//Obávám se, že kapitána zde nenajdu.
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_03");	//A v Khorinisu také, málokdo by souhlasil vydat se do Hornického údolí.
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_04");	//Proklatě, budeme si muset poradit sami.
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_05");	//(vážně) Tak to máme čas se připravit...
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_06");	//Nezapomněl jsi na můj podíl?
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_07");	//Později! Až se dostanem k lodi tak si o tom promluvíme.
		MIS_SylvioCrew = LOG_Success;
		Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
		B_LogEntry(Topic_SylvioCrew,"Řekl jsem Sylviovi, že jen stěží seženu kapitána.");
		AI_StopProcessInfos(self);
	}
	else
	{
		if(RatfordAgree == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_08");	//Chlápek jménem Ratford je ochotnej tu práci vzít!
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_09");	//Ale nejdřív mu budem muset zaplatit aspoň 500 zlatých.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_10");	//(chamtivě) Pětset zlatých?! No, dobře! Stejně nemáme na výběr.
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_11");	//Řekl, že na vás bude čekat na lodi.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_12");	//Dobře! Brzy se tam sejdem.
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_13");	//Nezapomněl jsi na můj podíl?
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_14");	//Později! Probereme to, až tam budeme.
			MIS_SylvioCrew = LOG_Success;
			Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
			B_LogEntry(Topic_SylvioCrew,"Řekl jsem Sylviovi, že Ratford souhlasil, stát se jejich kapitánem.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_15");	//Zatím nic.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_16");	//Proč mě otravuješ s maličkostma? Radši se starej o práci!
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_SylvioDJG_Camp_Drakar_Cook(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Cook_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Cook_Info;
	permanent = FALSE;
	description = "Našel jsem kuchaře.";
};

func int DIA_SylvioDJG_Camp_Drakar_Cook_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_Done) == TRUE) && (Npc_IsDead(STRF_1107_Straefling) == FALSE) && (ClifAgree == TRUE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Cook_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Cook_01_00");	//Našel jsem kuchaře.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Cook_01_01");	//Dobře... (vzdychne) Doufám, že ví jak vařit.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Cook_01_02");	//Paladinové na hradě si na něj nestěžovali.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Cook_01_03");	//Jestli je to tak, tak je to v pořádku.
};

instance DIA_DJG_700_Sylvio_FuckOff(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOff_Condition;
	information = DIA_DJG_700_Sylvio_FuckOff_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOff_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MoveDracarBoard == TRUE) && (MIS_SylvioDebts == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOff_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_SylvioDJG_Camp_Drakar_LastChance(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChance_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_LastChance_Info;
	permanent = FALSE;
	description = "Ty jsi nezaplatil Ratfordovi!";
};

func int DIA_SylvioDJG_Camp_Drakar_LastChance_Condition()
{
	if((MoveDracarBoard == TRUE) && (MIS_SylvioDebts == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChance_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_00");	//Ty jsi nezaplatil Ratfordovi!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_01");	//A co?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_02");	//Slíbil jsi, že mu zaplatíš.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_03");	//(ležérně) A za co jsem mu měl platit?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_04");	//Myslel jsem, že vyplujem na moře a místo toho tady trčíme, protože na drakaru je rozbité kolo.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_05");	//Takže ode mě nedostane ani zlaťák, dokud ho neopraví.
};

instance DIA_SylvioDJG_Camp_Drakar_LastChanceKill(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info;
	permanent = FALSE;
	description = "Je čas mluvit o mém podílu.";
};

func int DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_LastChance) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_00");	//Je čas mluvit o mém podílu.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_01");	//(uchechtává se) No dobře, tady to máš.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_02");	//Co?! Taková mizérie... 100 zlatých? 
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_03");	//Víc sis nezasloužil.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_04");	//A co chceš, loď je rozbitá, my trčíme pořád tady a všude okolo je plno skřetů!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_05");	//Řekni děkuju, za to co jsi dostal a vypadni.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_06");	//Ne, počkej. Ještě nejsme hotoví!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_07");	//A ty co, chceš mě poučovat jak to mám dělat?!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_08");	//Ano! Buď mně dáš přesně polovinu vašeho pokladu nebo...
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_09");	//... nebo budu mít dobrý důvod malinko tě pomuchlat, ty chamtivý prase!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_10");	//(smích) No můžeš to zkusit, ty hajzle!
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	self.guild = GIL_NONE;
	CreateInvItems(self,ItMi_Gold,10000);
	CreateInvItems(self,ItPo_Perm_STR,1);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_DJG_700_Sylvio_FuckOffAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOffAgain_Condition;
	information = DIA_DJG_700_Sylvio_FuckOffAgain_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOffAgain_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SylvioDJG_Camp_Drakar_LastChanceKill) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOffAgain_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

//--------------------Okhrannik----------------------------

instance DIA_DJG_7312_ToterDrachenjaeger_EXIT(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 999;
	condition = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_HelloAgain(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition()
{
	if((MoveDracarBoard == FALSE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_00");	//(hrozivě) Hej kámo, kam jdeš?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_01");	//Sem. A co?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_02");	//Ale sem nemůžeš! Rozumíš?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_03");	//A to jako proč?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_04");	//Nyní je to naše místo a náš tábor a my jen tak někoho dovnitř nepustíme.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_05");	//(hrozivě) Tak co kdybys radši vypadnul.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_06");	//Zajímavé! Takže vy tady táboříte a kdo je váš šéf?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_07");	//Ty ho neznáš... (nedbale) Jmenuje se Sylvio.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_08");	//Sylvio? Toho znám. On byl jeden ze žoldáků na Onarově farmě.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_09");	//A vypadá to, že se dostal k pokladu ledového draka!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_10");	//(vyděšeně) Co?! To znamená, že o něm taky víš?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_11");	//Vím o čem?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_12");	//No, o tom, že tady nedaleko leží celá hora zlata!
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_13");	//Samozřejmě. Vždyť to já jsem zabil ledového draka.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_14");	//Ty?! (směje se) No ty jsi moc pil, chlapče.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_15");	//To co se nepovedlo celé armádě, jsi ty zvládnul sám! 
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_16");	//Aha, dobře. Takže, když už všechno víš, tak můžu projít.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_17");	//Jestli chceš mluvit se Sylviem, tak je ve velké jeskyni u pokladu.
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_BUTNOW(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 13;
	condition = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SylvioIsDead == FALSE) && ((Npc_KnowsInfo(other,DIA_DJG_7312_ToterDrachenjaeger_HelloAgain) == TRUE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_DJG_7312_ToterDrachenjaeger_KillHim(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition()
{
	if(SylvioIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info()
{
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_00");	//Dobře jsi udělal, že jsi zabil toho bastarda Sylvia!
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_01");	//Nikdo ho tady neměl rád.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_02");	//Takže nikomu chybět nebude.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_03");	//Nyní je důležité odsud rychle vypadnout, než se skřeti začnou shánět po lodi.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_04");	//Teď rychle pomozte Ratfordovi vypořádat se s rozbitým kormidlem.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_05");	//Samozřejmě pomůžem, příteli. Samozřejmě.
	AI_StopProcessInfos(self);
};
