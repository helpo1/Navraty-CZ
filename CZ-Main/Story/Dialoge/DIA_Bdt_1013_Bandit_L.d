/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(4x) JessGoSld - opravena implementace proměnné

*/




instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//Bejt tebou, nahoru do jeskyně nechodím - mí kámoši tam z tebe stáhnou kůži. A věř tomu, že bojovat umí.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	if(CAVALORNGOBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	self.guild = GIL_BDT;
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hej chlape, odkud to jdeš, hm?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Přišel jsem z hor.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Přišel jsem od Xardase.",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Přišel jsem z hor.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//Přesně. Přišel jsi z hor. A to je pro tebe zlé.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Velmi zlé.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Hledají tě... Celá banda zlejch chlapů.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Je tady někdo, s kým by sis měl za každou cenu promluvit! Pojď za mnou!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Kdo mě hledá?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn, jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Přišel jsem od Xardase.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//To je ten starý nekromant?! Dobře, to bude zajímavé.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Fajn, jdi první!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Tak pojď za mnou, jeskyně je hned tady nahoře.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Kdo mě hledá?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Jde po tobě půlka Khorinisu a ty mi chceš tvrdit, že o tom nic nevíš?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Á! Už vím! Ty o tom prostě se mnou nechceš mluvit, hm? Jak chceš - je to tvoje věc.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//Tak jdeš, nebo ne?!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"S kým bych to měl mluvit?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn, jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//S kým bych to měl mluvit?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//S mým šéfem Bragem. Vysvětlí ti to líp, než já.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//Tak jdeme?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Jak mám vědět, že to není past?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn, jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Jak mám vědět, že to není past?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Hele, už mě začínáš unavovat! Když chceš, tak si táhni do města, a nech se od domobrany šoupnout do basy!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Buďto půjdeš hned se mnou, nebo na tuhle záležitost zapomeneme!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Pomalu kámo, podruhý se napálit nenechám...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn, jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Pomalu kámo, podruhý se napálit nenechám...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Hm?... (zaujatě)
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Jeden chlapík navrhnul, abychom společně získali nějakej amulet a pak se rozdělili o to, co z toho kápne.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Jakmile se nám to podařilo, společně s přáteli mě napadl.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Tak to tak vypadá, že ses zapletl se špatnými lidmi - kde se to stalo?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Na tom až tak nezáleží.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Byl jsem trestancem v Hornickém údolí.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//Byl jsem trestancem v Hornickém údolí.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(ohromeně) Ty jsi přišel zpoza bariéry? Chlape, to jsme tam byli společně.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Nevím...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//Byl jsem kopáčem ve Starém táboře. Neměl jsem s tím vším moc co do činění.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(spiklenecky) Ale co je teď důležitější - jsi v pěkným maléru!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Někdo nabídl za tvou hlavu slušnou odměnu. A vyvěsil několik oznámení - s tvým ksichtem!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//Bejt tebou, tak jsem velmi, velmi opatrný. Je mezi náma pár lidí, co by pro prachy zabili i vlastní mámu.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Ale mám dojem, že my, chlapi z kolonie, bychom měli držet spolu!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Tak to abych ti raději poděkoval.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Za nic... Prostě koukej zůstat naživu.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//Na tom až tak nezáleží.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Jak je libo. Tak jdeme, nebo ne?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Možná později...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fajn, jdi první!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Možná později...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Žádné později neexistuje, kámo!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//To od tebe byla pěkná blbost, žes šel za mnou...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hej lidi, koukejte koho jsem vám přivedl...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "Kdo je ten chlápek, co nabídl odměnu?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Kdo je ten chlápek, co nabídl odměnu?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//To nevím... U nás to ví jen jeden jediný.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//A kdo to má jako být?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hele chlape, tohle ti fakt říct nemůžu. Víš přece jak to chodí...
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"Jdou po mně nějací banditi, kteří chtějí získat odměnu, vypsanou na mou hlavu. Zajímalo by mě, co za tím vším vězí...");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "10 zlatých za jméno toho kdo vypsal tu odměnu.";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 zlatých za jméno toho kdo vypsal tu odměnu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Ach jo chlape... Tohle fakt nemůžu...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Tak už to vyklop!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(s hlubokým povzdechem) No dobrá. Jmenuje se Dexter. Poblíž farmy velkostatkáře narazíš na takovou strmou skálu.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//Úplně nahoře je strážní věž a několik dolů. Někde poblíž má svůj úkryt.
	B_LogEntry(Topic_Bandits,"Bandity vede bývalý Stín Dexter. Skrývá se v dolu poblíž velkostatkářova sídla.");

	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Ani to nebolelo, co? Tady je tvé zlato.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//Eh, teď jsem si vzpomněl, že nemám 10 zlatých.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Co? No nic... zapomeň na to. Je to moje chyba, neměl jsem ti to jméno říkat dřív, než jsi ukázal peníze.
	};

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//Hlavně jim neříkej, kdo ti to vyklopil.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "Můžu dostat ten obrázek?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Můžu dostat ten obrázek?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Jasně... (se smíchem) Je to přeci TVŮJ ksicht!
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "Jeden z farmářů mě poslal...";
};

func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && (self.guild != GIL_SLD) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;

	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Jeden z farmářů mě poslal...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Co, farmáři o tom úkrytu vědí?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Všimli si, že jim mizí ovce.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Sakra! Tak to bych sebou měl hodit. Když našli ten úkryt prázdný, možná po mně ještě pátrají.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//Chtějí tě vidět mrtvého...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Počkej - nehodláš mě oddělat, že ne - po tom, co jsem ti pomohl?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Jen do toho, pozabíjej všechny ostatní, když tak bažíš po krvi - já s tím nechci nic mít!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};

instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "Brzy tu bude hodně dusno!";
};

func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Brzy tu bude hodně dusno!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Co se děje?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Znáš Cavalorna? Chystá se na tebe!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//Sakra! Je naživu... Mizím!
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "Je tu ještě něco dalšího, co by mě mělo zajímat?";
};

func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Je tu ještě něco dalšího, co by mě mělo zajímat?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Myslíš tady v okolí? Jestli chceš zůstat naživu, nescházej z cesty.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Čím dál zajdeš do divočiny, tím větší na tebe bude číhat nebezpečí.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Už jsem ti řekl všechno, co jsem mohl!
	};
};

instance DIA_1013_BANDIT_LeeFarm(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_LeeFarm_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Info;
	permanent = FALSE;
	description = "Na tvém místě bych šel na Onarovu farmu.";
};

func int DIA_1013_BANDIT_LeeFarm_Condition()
{
	if((Bdt_1013_Away == TRUE) && (LeeMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_00");	//Na tvém místě bych šel na Onarovu farmu.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_01");	//Mezi žoldáky kteří byli taky za bariérou se budeš cítit jako doma. Velí jim Lee.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_03");	//Už jsem o tom přemýšlel... Ale je tady malý problém.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_04");	//Jakmile mě uvidí v této zbroji okamžitě mě zabijí.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_05");	//A jít tak dlouhou cestu nahý je šílenství!
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_06");	//Pak je potřeba najít novou zbroj.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_07");	//To se lehko řekne. Dobrá zbroj se tu bude těžko hledat.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_08");	//Nebudu nosit nějaký otrhaný hadry.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_09");	//Dobře pokusím se pro tebe sehnat zbroj, která se ti bude zamlouvat.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_10");	//Díky kámo. Neboj jednou ti to vrátím.
	MIS_JessArmor = LOG_Running;
	Log_CreateTopic(TOPIC_JessArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Running);
	B_LogEntry(TOPIC_JessArmor,"Slíbil jsem Jessemu, že mu seženu slušnou zbroj, aby mohl jít na Onarovu farmu.");
};

instance DIA_1013_BANDIT_LeeFarm_Done(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_LeeFarm_Done_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Done_Info;
	permanent = FALSE;
	description = "Mám pro tebe novou zbroj.";
};

func int DIA_1013_BANDIT_LeeFarm_Done_Condition()
{
	if((MIS_JessArmor == LOG_Running) && ((Npc_HasItems(hero,ItAr_Sld_L) >= 1) || (Npc_HasItems(hero,itar_sld_M) >= 1) || (Npc_HasItems(hero,ItAr_Sld_H) >= 1) || (Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Done_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_00");	//Mám pro tebe novou zbroj.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_01");	//(pochybuje) Dovol mi, abych se na ni podíval. Bude mi pasovat?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_02");	//Zkus si ji.

	Info_ClearChoices(DIA_1013_BANDIT_LeeFarm_Done);

	if(Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(dát zbroj dobrodruha)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01);
	};
	if(Npc_HasItems(hero,ItAr_Sld_L) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(dát lehkou zbroj žoldáka)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02);
	};
	if(Npc_HasItems(hero,itar_sld_M) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(dát zbroj žoldáka)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03);
	};
	if(Npc_HasItems(hero,ItAr_Sld_H) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(dát těžkou zbroj žoldáka)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04);
	};
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_03");	//Ano příteli, je nejvyšší čas.
	AI_EquipArmor(self,ITAR_ADVENTURE_HERO);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_04");	//Nyní se můžu přidat k žoldákům.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_05");	//Najdeš sám cestu?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_06");	//Samozřejmě. Díky za pomoc! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_07");	//Tady, vezmi si tento prsten.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_08");	//Vzal jsem ho z truhly jednoho strážce ve Starém táboře, když jsem od tamtud utíkal.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_09");	//Myslím, že se ti může hodit. Ještě uvidíš.
	MIS_JessArmor = LOG_Success;
	JessGoSld = TRUE;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Přinesl jsem Jessemu zbroj. Teď může jít na farmu k žoldákům za Leem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_03");	//Ano příteli, je nejvyšší čas.
	AI_EquipArmor(self,ItAr_Sld_L);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_04");	//Nyní se můžu přidat k žoldákům.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_05");	//Najdeš sám cestu?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_06");	//Samozřejmě. Díky za pomoc! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_07");	//Tady, vezmi si tento prsten.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_08");	//Vzal jsem ho z truhly jednoho strážce ve Starém táboře, když jsem od tamtud utíkal.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_09");	//Myslím, že se ti může hodit. Ještě uvidíš.
	MIS_JessArmor = LOG_Success;
	JessGoSld = TRUE;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Přinesl jsem Jessemu zbroj. Teď může jít na farmu k žoldákům za Leem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03()
{
	B_GivePlayerXP(750);
	B_GiveInvItems(other,self,itar_sld_M,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_03");	//Ano příteli, je nejvyšší čas.
	AI_EquipArmor(self,itar_sld_M);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_04");	//Nyní se můžu přidat k žoldákům.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_05");	//Najdeš sám cestu?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_06");	//Samozřejmě. Díky za pomoc!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_07");	//Tady, vezmi si tento prsten.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_08");	//Vzal jsem ho z truhly jednoho strážce ve Starém táboře, když jsem od tamtud utíkal.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_09");	//Myslím, že se ti může hodit. Ještě uvidíš.
	MIS_JessArmor = LOG_Success;
	JessGoSld = TRUE;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Přinesl jsem Jessemu zbroj. Teď může jít na farmu k žoldákům za Leem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_03");	//Ano příteli, je nejvyšší čas.
	AI_EquipArmor(self,ItAr_Sld_H);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_04");	//Nyní se můžu přidat k žoldákům.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_05");	//Najdeš sám cestu?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_06");	//Samozřejmě. Díky za pomoc! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_07");	//Tady, vezmi si tento prsten.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_08");	//Vzal jsem ho z truhly jednoho strážce ve Starém táboře, když jsem od tamtud utíkal.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_09");	//Myslím, že se ti může hodit. Ještě uvidíš.
	MIS_JessArmor = LOG_Success;
	JessGoSld = TRUE;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Přinesl jsem Jessemu zbroj. Teď může jít na farmu k žoldákům za Leem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};