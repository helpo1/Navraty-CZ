/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Serpentes_MinenAnteileBringen_Info - upraveny výpisy

*/




instance DIA_Serpentes_Kap1_EXIT(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 999;
	condition = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Serpentes_Kap1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Serpentes_NoEnter_PissOff(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = DIA_Serpentes_NoEnter_PissOff_Condition;
	information = DIA_Serpentes_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Serpentes_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NoEnter_PissOff_01_00");	//Hmmm... (naštvaně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};


instance DIA_Serpentes_NOTALK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOTALK_Condition;
	information = DIA_Serpentes_NOTALK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Serpentes_NOTALK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(naštvaně) Opovažuješ se mě oslovit, novici? Vrať se ke své praci.
	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK,"Právě jsem odcházel... (KONEC)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK,"Ještě mám jednu otázku...",DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//Ještě mám jednu otázku...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(zuřivě) Nevypadá to, že bys to chtěl pochopit. Já se rozhodnu, kdy s tebou chci mluvit. Kdo si myslíš, že jsi?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//A teď se vrať ke své práci!
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_GOAWAY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_GOAWAY_Condition;
	information = DIA_Serpentes_GOAWAY_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_GOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Serpentes_NOTALK) && Npc_IsInState(self,ZS_Talk) && !Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Tvá přítomnost zde demonstruje nejenom, že ti chybí jakýkoliv respekt, ale taky tvou stupiditu, novici!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_YOURSTORY(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 24;
	condition = DIA_Serpentes_YOURSTORY_Condition;
	information = DIA_Serpentes_YOURSTORY_Info;
	permanent = FALSE;
	description = "Slyšel jsem, žes prošel Zkouškou Ohně.";
};


func int DIA_Serpentes_YOURSTORY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ulthar_TEST) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,DIA_Pyrokar_MAGICAN) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//Slyšel jsem, žes prošel Zkouškou Ohně.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//(namyšleně) S veškerou pokorou ti můžu říct tohle. Každý, kdo se o to pokoušel, je mrtvý.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(povýšeně) Vážně by ses neměl pokoušet podstoupit Zkoušku. Tvůj duch je slabý. Raději služ v kláštere a možná tě za pár let vyberou.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//Projdu Zkouškou.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//Když je to vůle Innosova. Ale když ne – nepodaří se ti to.
};



instance DIA_Serpentes_TEST(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_TEST_Condition;
	information = DIA_Serpentes_TEST_Info;
	permanent = FALSE;
	description = "Jsem připraven podstoupit Zkoušku, mistře.";
};


func int DIA_Serpentes_TEST_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//Jsem připraven podstoupit Zkoušku, mistře.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//Takže se chceš podrobit Zkoušce. To požaduje jenom odvážný novic. Kuráž však není vše.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Jsi dostatečně šikovný? Jsi dostatečně silný na to, abys porazil všechna nebezpečenství, co na tebe čekají?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//Pokud ne, zaplatíš za to životem.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//A teď slyš svůj úkol: Tam, kde Kámen leží, hledej toho, který se nikdy nenarodil – najdi toho, jež byl vyvolán.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Poraz toho, jež nemůže být poražen – postav se proti žijící skále, bojuj s nemrtvým kamenem – a znič ho.
	Wld_InsertNpc(MagicGolem,"FP_MAGICGOLEM");
	Magic_Golem = Hlp_GetNpc(MagicGolem);
	MIS_GOLEM = LOG_Running;
	Log_CreateTopic(TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem,LOG_Running);
	B_LogEntry(TOPIC_Golem,"Serpentes mi zadal úkol. Mám najít žijící skálu a porazit ji. Nic mě nenapadá...");
};

instance DIA_Serpentes_NOIDEA(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOIDEA_Condition;
	information = DIA_Serpentes_NOIDEA_Info;
	permanent = FALSE;
	description = "Co přesnď by to mělo být?";
};

func int DIA_Serpentes_NOIDEA_Condition()
{
	if((MIS_GOLEM == LOG_Running) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOIDEA_Info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//Žijící skála...? Co za monstrum by to mělo být?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//Řekl jsem ti všechno. (posměšně) Anebo je to pro tebe příliš?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Teď se naučíš, co znamená podstoupit Zkoušku Ohně - neodpovím na žádné tvé další otázky.
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_NOHELP(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 10;
	condition = DIA_Serpentes_NOHELP_Condition;
	information = DIA_Serpentes_NOHELP_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Serpentes_NOHELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Serpentes_NOIDEA) && (Npc_IsDead(Magic_Golem) == FALSE) && (MIS_GOLEM == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,DIA_Ulthar_TEST) == FALSE) || Npc_KnowsInfo(other,DIA_Serpentes_YOURSTORY)))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(pohrdavě) Jdi a plň svou úlohu, novici!
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_SUCCESS(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 3;
	condition = DIA_Serpentes_SUCCESS_Condition;
	information = DIA_Serpentes_SUCCESS_Info;
	permanent = FALSE;
	description = "Porazil jsem magického golema.";
};


func int DIA_Serpentes_SUCCESS_Condition()
{
	if(Npc_IsDead(MagicGolem) && (MIS_GOLEM == LOG_Running) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	var C_Npc Garwig;
	Garwig = Hlp_GetNpc(Nov_608_Garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//Porazil jsem magického golema.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//Co? Tys to vážně zvládl? Ale nemohl bys to udělat bez Innosovho kladiva.
	if(Npc_IsDead(Garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(vítězně) Ale teď ses prozradil! To tys zabil Garwiga!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//BUDEŠ POTRESTÁN ZA VRAŽDU INNOSOVA SLUŽEBNÍKA!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_HumanMurderedHuman,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(lítostivě) Jakkoliv to je, musím přiznat, žes splnil úkol, který jsem ti zadal.
	};
	if(Npc_HasItems(other,Holy_Hammer_MIS) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//A nejlepší bude, když si to kladivo vezmu nazpět sám.
		Npc_RemoveInvItems(other,Holy_Hammer_MIS,1);
		Wld_InsertItem(Holy_Hammer_MIS,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};


instance DIA_Serpentes_PERM(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 99;
	condition = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent = TRUE;
	description = "Ještě něco?";
};


func int DIA_Serpentes_PERM_Condition()
{
	if((Kapitel >= 3) || Npc_KnowsInfo(other,DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Chtěl bys mi ještě něco říct?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//Ne. Teď ne, Bratře.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Odchod. Víš, co máš dělat.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Serpentes_MinenAnteile(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 30;
	condition = DIA_Serpentes_MinenAnteile_Condition;
	information = DIA_Serpentes_MinenAnteile_Info;
	important = TRUE;
};


func int DIA_Serpentes_MinenAnteile_Condition()
{
	if((Pedro_Traitor == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Ne tak rychle. Mám pro tebe další úkol.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(povzdechne si) A to je?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Teď když patříš k bratrstvu Ohně, musíš taktéž plnit povinnosti, jež tomu přináleží.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//Zajímáme se nejenom o magii, ale taky jsme nejvyšší autorita v právu, jak jistě víš.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//Poslední případ nám ukázal bezednou propast, se kterou se musí jednou a provždy zkoncovat.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Najdi si někoho jiného.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Čeho se to týká?",DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Není to spíše záležitost domobrany?",DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//Žoldák tvého kalibru by nám mohl přijít vhod.
		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Najdi si někoho jiného.",DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile,"Koho bych měl zabít?",DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenAnteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Není to spíše záležitost domobrany?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//Ta zodpovídá jenom za město, tohle sáhá mnohem dál.
};

func void DIA_Serpentes_MinenAnteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//Mám toho momentálně víc než dost. Najdi si někoho jiného.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//Tímto tě napomínám. Doufám, že se to víc nestane – jinak nedopadneš dobře.
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//O co jde?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//Někdo ve městě prodává zfalšované podíly dolů v bývalé kolonii.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//Tyto papíry jsou úplně bezcenné a nedůležité, vážně. I tak ale můžou způsobit nějaké problémy mezi lidmi, a to si teď nemůžeme dovolit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//Podvodník již oslovil všechny významné obchodníky ve městě a krajině a dokonce jim už nějaké podíly prodal.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Najdi tohoto zloducha a přiveď ho sem. V těchto těžkých časech nemůžeme trpět zločince.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//Musíme z něho zpravit příklad, aby nikdo nepokračoval.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Žádný problém. Postarám se o to.",DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenAnteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//Pokusím se to vyřešit.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//Ještě jedna věc. Když navštívíš obchodníky, nedej najevo, že hledáš ty podíly.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//Myslím, že je chtějí prodat dál a neobchodovali by s tebou, kdyby věděli, že si z církvi, chápeš?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Ano.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Tak do toho. Přeji ti mnoho úspěchů, Bratře.
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	MIS_Serpentes_MinenAnteil_KDF = LOG_Running;
	if(Npc_IsDead(Salandril) == FALSE)
	{
		CreateInvItems(Salandril,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if(Npc_IsDead(VLK_416_Matteo) == FALSE)
	{
		CreateInvItems(VLK_416_Matteo,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_413_Bosper) == FALSE)
	{
		CreateInvItems(VLK_413_Bosper,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_409_Zuris) == FALSE)
	{
		CreateInvItems(VLK_409_Zuris,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(BAU_911_Elena) == FALSE)
	{
		CreateInvItems(BAU_911_Elena,ItWr_MinenAnteil_Mis,2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};
	if(Npc_IsDead(BAU_970_Orlan) == FALSE)
	{
		CreateInvItems(BAU_970_Orlan,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(VLK_407_Hakon) == FALSE)
	{
		CreateInvItems(VLK_407_Hakon,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if(Npc_IsDead(BAU_936_Rosi) == FALSE)
	{
		CreateInvItems(BAU_936_Rosi,ItWr_MinenAnteil_Mis,1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};
	if((Npc_IsDead(VLK_468_Canthar) == FALSE) && (CANTHAR_AUSGELIEFERT2 == FALSE))
	{
		CreateInvItems(VLK_468_Canthar,ItWr_MinenAnteil_Mis,3);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	};
	SalandrilVerteilteMinenAnteil = SalandrilMinenAnteil_MAINCounter;
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile,"Někdo prodává zfalšované certifikáty rudných dolů. Měl bych vypátrat, kdo za tím stojí a stáhnout papíry z oběhu. Serpentes chce, abych mu je všechny přinesl.");
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Koho bych měl zabít?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//Pro Innosa. Nikoho samozřejmě. Tahle záležitost požaduje jemnější manýry, ty surovče.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, alchymista z horní čtvrti, je obviněný z vážného trestného činu a musí být potrestán.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//Jelikož odmítá přijít sem do kláštera, musíš ho přivést.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//Nezáleží nám na tom, jak to vykonáš. Budeš samozřejmě odměněn.
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Není to spíše záležitost domobrany?",DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile,"Žádný problém. Postarám se o to.",DIA_Serpentes_MinenAnteile_was_jaSLD);
};


var int MIS_Serpentes_BringSalandril_SLD;

func void DIA_Serpentes_MinenAnteile_was_jaSLD()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//Žádný problém. Postarám se o to.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Dobře. Očekávám, že se ozveš za pár dní.
	MIS_Serpentes_BringSalandril_SLD = LOG_Running;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);
	Log_CreateTopic(TOPIC_MinenAnteile,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile,LOG_Running);
	B_LogEntry(TOPIC_MinenAnteile,"Měl bych přivést alchymistu Salandrila z horní čtvrti města před soud v kláštere. Nezáleží na tom, co provedl. Hlavně, že dostanu zaplaceno.");
};


instance DIA_Serpentes_MinenAnteileBringen(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 2;
	condition = DIA_Serpentes_MinenAnteileBringen_Condition;
	information = DIA_Serpentes_MinenAnteileBringen_Info;
	permanent = TRUE;
	description = "O těch falešných papírech...";
};


func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if((MIS_Serpentes_MinenAnteil_KDF == LOG_Running) && Npc_HasItems(other,ItWr_MinenAnteil_Mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int SerpentesMinenAnteilCounter;

func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int XP_BringSerpentesMinenAnteils;
	var int SerpentesMinenAnteilOffer;
	var int SerpentesMinenAnteilGeld;
	var string MinenAnteilText;
	var string MinenAnteilLeft;
	SerpentesMinenAnteilCount = Npc_HasItems(other,ItWr_MinenAnteil_Mis);
	SerpentesMinenAnteilOffer = 200;
	if(SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//Získal jsem jeden důlní podíl.
		B_GivePlayerXP(XP_BringSerpentesMinenAnteil);
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,1);
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//Získal jsem několik důlních podílů.
		B_GiveInvItems(other,self,ItWr_MinenAnteil_Mis,SerpentesMinenAnteilCount);
		XP_BringSerpentesMinenAnteils = SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil;
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount;
		B_GivePlayerXP(XP_BringSerpentesMinenAnteils);
	};
	SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
	MinenAnteilLeft = IntToString(SalandrilMinenAnteil_MAINCounter);
	// MinenAnteilText = ConcatStrings(MinenAnteilLeft,PRINT_NumberLeft);
	MinenAnteilText = ConcatStrings("Zbývá ",MinenAnteilLeft);
	MinenAnteilText = ConcatStrings(MinenAnteilText," důlních podílů");	
	AI_Print(MinenAnteilText);

	if(SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Velmi dobře. Musíš je všechny stáhnout z oběhu. Toto je jako jed. Přines mi je všechny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Tady máš nevyhnutné prostředky.
	}
	else if(SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Myslím, že to byly všechny.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Výborně. Vysloužil sis odměnu.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Přijmi tenhle ochranný amulet. Pomůže ti na tvých budoucích cestách.
		CreateInvItems(self,ItAm_Prot_Mage_01,1);
		B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//Tenhle je vážně poslední?
	};
	SerpentesMinenAnteilGeld = SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer;
	CreateInvItems(self,ItMi_Gold,SerpentesMinenAnteilGeld);
	B_GiveInvItems(self,other,ItMi_Gold,SerpentesMinenAnteilGeld);
};


instance DIA_Serpentes_GOTSalandril(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 32;
	condition = DIA_Serpentes_GOTSalandril_Condition;
	information = DIA_Serpentes_GOTSalandril_Info;
	description = "Vím, kdo prodává ty falešné papíry.";
};


func int DIA_Serpentes_GOTSalandril_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//Vím, kdo přinesl ty podíly do oběhu. Byl to Salandril, alchymista z horní čtvrti města.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Tak ho přiveď. Musíme to s ním prodiskutovat.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_SalandrilHERE(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilHERE_Condition;
	information = DIA_Serpentes_SalandrilHERE_Info;
	description = "Salandril je v kláštere.";
};


func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if(Npc_GetDistToWP(Salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	return FALSE;
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Salandril je tady, v kláštere.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Velmi dobře. Pak se s ním vypořádáme.

	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Tady je tvá odměna. A nikomu ani slovo, pochopil jsi?
		CreateInvItems(self,ItMi_Gold,400);
		B_GiveInvItems(self,other,ItMi_Gold,400);
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};


instance DIA_Serpentes_SalandrilDEAD(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 33;
	condition = DIA_Serpentes_SalandrilDEAD_Condition;
	information = DIA_Serpentes_SalandrilDEAD_Info;
	description = "Salandril je mrtvý.";
};


func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Serpentes_GOTSalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_Serpentes_BringSalandril_SLD == LOG_Running))) && Npc_IsDead(Salandril))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril je mrtvý.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Pak jeho skutek nezůstal nepotrestaný. Ať se Innos smiluje nad jeho bídnou duší.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Serpentes_PICKPOCKET(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 900;
	condition = DIA_Serpentes_PICKPOCKET_Condition;
	information = DIA_Serpentes_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Serpentes_PICKPOCKET_Condition()
{
	return C_Beklauen(86,380);
};

func void DIA_Serpentes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET,Dialog_Back,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 70)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,50);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
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

func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
};


instance DIA_SERPENTES_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_501_Serpentes;
	nr = 1;
	condition = dia_serpentes_runemagicnotwork_condition;
	information = dia_serpentes_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_serpentes_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_serpentes_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Serpentes_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_02");	//A co ostatní?!
	AI_Output(self,other,"DIA_Serpentes_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Serpentes_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

