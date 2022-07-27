/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(2x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



instance DIA_Karras_KAP1_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_Hello(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_Hello_Condition;
	information = DIA_Karras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NovizenChase != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Co pro tebe můžu udělat, novici?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Co pro tebe můžu udělat, bratře?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Ctěni Innosovi válečníci se jenom zřídka zatoulají do těchhle komnat.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Co pro tebe můžu udělat?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(nedůvěřivě) Co tady děláš?
	};
};


instance DIA_Karras_Mission(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Mission_Condition;
	information = DIA_Karras_Mission_Info;
	permanent = FALSE;
	description = "Jsem tady, abych si přečetl nějaké spisy.";
};


func int DIA_Karras_Mission_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Jsem tady, abych si přečetl nějaké spisy.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Chápu. Kdyby sis našel čas mezi svými únavnými studiemi, přistup sem ke mně.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Je tu jedna záležitost, při které by mi diskrétní novic přišel vhod.
};


instance DIA_Karras_Aufgabe(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Aufgabe_Condition;
	information = DIA_Karras_Aufgabe_Info;
	permanent = FALSE;
	description = "Máš pro mne nějaký úkol?";
};


func int DIA_Karras_Aufgabe_Condition()
{
	return TRUE;
};

func void DIA_Karras_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//Máš pro mne nějaký úkol?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Ano. Jde o toho šílence Ignaze. Žije v Khorinisu a experimentuje s různými lektvary a léčivými nápoji. Taktéž svitky.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//A toho přesně se obávám. Ptám se sám sebe, jestli tato magie Innose těší.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Abych to otestoval, potřebuji nějaké z jeho svitků.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Chci, abys šel do města a sehnal mi tři svitky.
	B_GiveInvItems(self,other,ItMi_Gold,600);
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Nikomu ani slovo, jasně?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Jasný.
	MIS_KarrasVergessen = LOG_Running;
	Log_CreateTopic(Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm,LOG_Running);
	B_LogEntry(Topic_KarrasCharm,"Mistr Karras mě poslal do města. Měl bych mu donést tři svitky kouzla, které vynašel Ignaz, pro studijní účely.");
};


instance DIA_Karras_Success(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Success_Condition;
	information = DIA_Karras_Success_Info;
	permanent = FALSE;
	description = "Přinesl jsem ty svitky, které si chtěl.";
};


func int DIA_Karras_Success_Condition()
{
	if((MIS_KarrasVergessen == LOG_Running) && (Npc_HasItems(other,ItSc_Charm) >= 3))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Přinesl jsem ty svitky, které si chtěl.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Velmi dobře, můj mladý příteli.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//Teď je čas na to, aby ses vrátil ke svým studiím.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//Za odměnu si seber tento magický svitek.
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
	B_GiveInvItems(other,self,ItSc_Charm,3);
	B_GiveInvItems(self,other,ItSc_SumWolf,1);
};


instance DIA_Karras_JOB(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_JOB_Condition;
	information = DIA_Karras_JOB_Info;
	permanent = FALSE;
	description = "Co je tvoje práce?";
};


func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//Co je tvoje práce?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Zodpovídám za trénink mágů v umění sférického zjevování.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Co to znamená?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Učím je povolávat monstra z jiných sfér.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Obyčejně se to nazývá vyvolávání, i když tenhle výraz ani zdaleka nevystihuje umění povolávání společníka z jiných sfér.
};


instance DIA_Karras_CIRCLE4(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE4_Condition;
	information = DIA_Karras_CIRCLE4_Info;
	permanent = TRUE;
	description = "Chci umět čtvrtý kruh magie. (VB: 60)";
};


func int DIA_Karras_CIRCLE4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Chci umět čtvrtý kruh magie.
	if(CanLearnMagicCircleNext_ABCZ(4) == TRUE)
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Dobře. Splnil jsi všechny požadavky. Vstup teď do čtvrtého kruhu a nech sebou přetékat magickou energii.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Přešel jsi dlouhou cestu a Innos ti jí bude osvětlovat dál.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Ještě stále nemůžeš.
	};
};

instance DIA_Karras_CIRCLE5(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE5_Condition;
	information = DIA_Karras_CIRCLE5_Info;
	permanent = TRUE;
	description = "Chci umět pátý kruh magie. (VB: 80)";
};

func int DIA_Karras_CIRCLE5_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Chci umět pátý kruh magie.

	if(CanLearnMagicCircleNext_ABCZ(5) == TRUE)
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Vstup teď do pátého kruhu magie. Tvá magie bude silnější než kdykoli předtím.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//Používej tvoji sílu moudře, Bratře – temnota je silná a tví nepřátelé taky.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Nemůžu tě provázet šestým a nejvyšším kruhem magie. Sám Pyrokar tě vysvětí, až nadejde čas.
			B_LogEntry(Topic_KlosterTeacher,"Šestý kruh magie mě může naučit jen Pyrokar.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Čas ještě nenadešel.
	};
};


instance DIA_Karras_KAP2_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP3_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ChasePedro(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_ChasePedro_Condition;
	information = DIA_Karras_ChasePedro_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_ChasePedro_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 3) && (MIS_NovizenChase == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Bratře, nemůžeš ztrácet čas. Musíš vypátrat Pedra a vrátit Innosovo oko do kláštera.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Když Oko nebude navráceno, jsme všichni ztraceni.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Co tady děláš? Neměl bys být na cestě za zrádcem Pedrem?
		Info_ClearChoices(DIA_Karras_ChasePedro);
		Info_AddChoice(DIA_Karras_ChasePedro,"Později. Nejprve musím ještě něco udělat.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro,"Nezajde daleko.",DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Později. Nejprve musím ještě něco udělat.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Máš vůbec potuchy, co pro nás tato ztráta znamená? Innosovo oko je mocná zbraň.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Nikdo nemůže předvídat, co s ním nepřítel udělá, avšak určitě něco plánuje a musíme tomu předejít.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Tak jdi a najdi ho!
	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePedro_WontEscape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Nezajde daleko.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//Pro tvé dobro v to doufám. Když uteče proto, že ty ses tu poflakoval, osobně tě dotáhnu před soud.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//Z čeho bys mě obvinil?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//Spolčení se s nepřítelem. Nemusíš mít mnoho fantazie na to, aby sis představil trest, který následuje.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//Teď ať nevidím, že ztrácíš víc času, neboť při našem příštím střetnutí bude tvůj život ve stávce.
	AI_StopProcessInfos(self);
};


instance DIA_Karras_NeedInfo(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_NeedInfo_Condition;
	information = DIA_Karras_NeedInfo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Karras_NeedInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Karras_ChasePedro) && (Kapitel == 3) && (hero.guild != GIL_KDF) && (MIS_NovizenChase == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Víš vše, co potřebuješ vědět. Teď jdi!
	AI_StopProcessInfos(self);
};


instance DIA_Karras_InnosEyeRetrieved(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_InnosEyeRetrieved_Condition;
	information = DIA_Karras_InnosEyeRetrieved_Info;
	permanent = FALSE;
	description = "Získal jsem zpět Innosovo oko.";
};


func int DIA_Karras_InnosEyeRetrieved_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Získal jsem zpět Innosovo oko.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//Ulevilo se mi, žes byl schopen sebrat nepříteli Oko.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Ale nebezpečí nebylo zažehnáno. Zlo plánuje dál a postupuje neobyčejně agresivně.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//To jsem už zjistil sám.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Nezahrávej si se mnou. Situace je vážná, velice vážná, a my nevíme, komu můžeme věřit.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Nepřítel už uvedl do pokušení novice Pedra a může uspět i u ostatních.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Karras_KAP3_Perm(C_Info)
{
	npc = KDF_503_Karras;
	nr = 5;
	condition = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent = TRUE;
	description = "Co bych měl vědět?";
};


func int DIA_Karras_KAP3_Perm_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Co bych měl vědět?
	if((MIS_KarrasResearchDMT == FALSE) && (PyrokarToldKarrasToResearchDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Byl jsem schopen zjistit něco o Pátračích.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//A to je...?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Jsou celkem očividně démonického původu. Nebo alespoň jsou, či byli, pod vplyvem démonů.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Měj se na pozoru při střetnutí s nimi.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//Značně pokroková myšlenka.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Je mi líto, avšak nemám dostatek materiálů na to, abych ti řekl víc.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Ale kdybys mi zvládl donést něco jejich, co bych mohl prozkoumat...
		MIS_KarrasResearchDMT = LOG_Running;
		B_LogEntry(TOPIC_DEMENTOREN,"Karras požaduje něco, co přišlo do styku s Pátrači, aby mohl udělat bližší průzkum.");
		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm,Dialog_Back,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Uvidím, co mohu udělat.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Může v tom mít prsty Spáč?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Co přesně potřebuješ?",DIA_Karras_KAP3_Perm_Material);
	}
	else if(MIS_KarrasResearchDMT == LOG_Running)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Ještě stále pracuji na vysvětlení té věci s Pátrači.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Jakmile budu vědět víc, okamžitě tě samozřejmě informuju.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//Nepřítel má mnoho tváří a je velmi těžké určit, která z nich je pro klášter největším nebezpečím.
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Může v tom mít prsty Spáč?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//Slyšel jsem příběh o Spáči. Nemohu ti ale nic bližšího říct.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//Existuje nespočetně démonů a každý z nich by s tím mohl něco mít.
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Mám ti tedy přinést mrtvolu?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Ne, zbláznil ses? Nebezpečí, které představuje démonická bytost za zdmi kláštera, je příliš velké.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Bude stačit, když najdeš nějaké věci, které jsou pro tyto bytosti typické.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Pozůstatky démonické aury, která se k nim váže, by měli pro výzkum stačit.
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//Co přesně potřebuješ?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Co já vím – něco, co těm bytostem patřilo.
	Info_AddChoice(DIA_Karras_KAP3_Perm,"Mám ti tedy přinést mrtvolu?",DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Uvidím, co mohu udělat.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//Bylo by to určitě velmi užitečné. Mezitím budu provádět můj osobní výzkum.
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};


instance DIA_Karras_HaveBook(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent = FALSE;
	description = "Mám tady Almanach Posedlých.";
};


func int DIA_Karras_HaveBook_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_Running) && (Npc_HasItems(hero,ITWR_DementorObsessionBook_MIS) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int KarrasGotResearchDMTBook_Day;

func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Mám tady Almanach Posedlých. Možná pro něj najdeš nějaké využití.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Ukaž mi.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Ano, možná. Prozkoumám tu knihu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//Jednou věcí jsem si ale jistý.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//Podle mého názoru jsou Pátrači zkažené formy života, stvořené Beliarem.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//Jsou zčásti démonického a zčásti lidského původu.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Nemůžu ti ale říct, jestli jsou duševně posedlí, anebo zmutováni čistě fyzicky.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Vrať se za nějaký čas. Pak budu vědět víc.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"Karras pokračuje ve výzkumu Almanachu Posedlých. Měl bych se k němu později pak vrátit.");
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};


instance DIA_Karras_ResearchDMTEnd(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent = TRUE;
	description = "Zjistil jsi něco nového o Pátračích?";
};


func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Zjistil jsi něco nového o Pátračích?
	if(KarrasGotResearchDMTBook_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Ano. Vím, kdo Pátrači vážně jsou.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Povídej!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Kdysi byli lidmi, jako já a ty. Pak udělali hroznou chybu, oddali se nečisté magii velmi silného arcidémona.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Pod jeho vlivem a vlivem velmi silných drog, žili jenom aby mu sloužili a byli pak jenom pouhými stíny sebe.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Dnes jsou už jenom loutkami bez vůle a nikdy nepřestanou nahánět následovníky Innose.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Musíme se mít na pozoru. Stále se zdá, že se těmto síním Innosovým vyhýbají.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Když ale bude jejich síla stoupat, obávám se, že tady už nebudeme v bezpečí.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Děkuji. Objasnilo mi to mnoho.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Vážně? Přede mne to staví jen nové otázky. Například, kým byli před tím, a který arcidémon jim to udělal?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//Mám nápad. Zní to jako Bratrstvo Spáče. Poznám je.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Doufám, že víš, do čeho jsi zapletený. Dávej si na sebe pozor, můj bratře.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//Ale samozřejmě, tady je tvůj almanach. Dál ho už nepotřebuji.
		B_GiveInvItems(self,other,ITWR_DementorObsessionBook_MIS,1);
		SC_KnowsMadPsi = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Karrasův výzkum poskytl mnoho nových informací. Mezi Pátrači a Bratrstvem Spáče je nějaké spojení.");
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Pracuji na tom. Vrať se později.
	};
};


instance DIA_Karras_Prot_BlackEye(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent = TRUE;
	description = "Existuje nějaká ochrana před útoky Pátračů?";
};


func int DIA_Karras_Prot_BlackEye_Condition()
{
	if((hero.guild == GIL_KDF) && (Pyrokar_AskKarrasAboutDMTAmulett == TRUE) && (MIS_Karras_FindBlessedStone == FALSE) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Existuje nějaká ochrana před útoky Pátračů?
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Jistěže. Amulet z kamene ze svaté půdy by mohl mít ochranné účinky.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Naneštěstí, teď jich tady nemám dost.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Některé z našich oltářů jsou z nich složeny.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//V pořádku, nějaké pohledám.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Ano, vykonej to. Ale ani nepomysli, že bys je poškodil, slyšíš mě?
		B_LogEntry(TOPIC_DEMENTOREN,"Karras mi může vyrobit obranu proti útokům Pátračů. Na tento účel potřebuje kámen ze svaté půdy. Některé Innosovy sochy jsou z něho vyrobeny.");
		MIS_Karras_FindBlessedStone = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Netuším. Stále nevím dost. Zeptej se mě později.
	};
};


instance DIA_Karras_KarrasBlessedStone(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;
	description = "Tady je kámen z posvátné půdy.";
};


func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,ItMi_KarrasBlessedStone_Mis) && (MIS_Karras_FindBlessedStone == LOG_Running))
	{
		return TRUE;
	};
};


var int KarrasMakesBlessedStone_Day;

func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Tady je kámen z posvátné půdy.
	B_GiveInvItems(other,self,ItMi_KarrasBlessedStone_Mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Dobře, doufám, že všechny sochy jsou stále na svém místě.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//V pořádku. Teď ti vyrobím amulet proti temnému pohledu Pátračů.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Dej mi nějaký čas. Hned se pustím do práce.
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"Karras mi dá amulet, který mě ochrání před magickými útoky Pátračů. Ulehčí mi to práci.");
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ItAm_Prot_BlackEye_Mis(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent = TRUE;
	description = "Jak se ti daří s amuletem, kterýs mi slíbil?";
};


var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;

func int DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Karras_FindBlessedStone == LOG_SUCCESS) && (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Tak jak je to s tím amuletem, cos mi slíbil?
	if(KarrasMakesBlessedStone_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//Dokončil jsem ho. Tady, podívej se. Vydařil se krásně.
		CreateInvItems(self,ItAm_Prot_BlackEye_Mis,1);
		B_GiveInvItems(self,other,ItAm_Prot_BlackEye_Mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Vždy ho nos s sebou a Pátrači tě nebudou moci zatáhnout do svojí pasti.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Děkuji.
		B_LogEntry(TOPIC_DEMENTOREN,"Od Karrasa jsem obdržel ochranný amulet proti temným pohledům Pátračů.");
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Trpělivost. Stále na něm pracuji.
	};
};


instance DIA_Karras_KAP4_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP5_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_PICKPOCKET(C_Info)
{
	npc = KDF_503_Karras;
	nr = 900;
	condition = DIA_Karras_PICKPOCKET_Condition;
	information = DIA_Karras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Karras_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Karras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
	Info_AddChoice(DIA_Karras_PICKPOCKET,Dialog_Back,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Karras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};

func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};


instance DIA_KARRAS_KILLIGNAZ(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_condition;
	information = dia_karras_killignaz_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_killignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_SMFOREST_09") < 2000))
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_00");	//Jsi tu, Ortego! To je dobře... (naznačuje) Neměli bychom tedy ztrácet čas.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_01");	//Ano, jsem tady. Ale nejsem Ortego!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_02");	//Co?!... (zmateně) Jak to je...?! Kdo jsi?!... Ukaž se, nevidím tě.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_03");	//Ten, kdo zařídil, aby se tvůj přítel opět svítal s předky.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_05");	//Tedy nemyslel jsem si, že se mágové Ohně angažují v těchto záležitostech. Můžeš mi vysvětlit, co se děje?
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_06");	//Je to velice jednoduché... Bylo to (lichotí) jednoduše potřebné! Nemohli jsme konat jinak.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_08");	//Výzkum toho blázna ohrožoval samotnou podstatu magie a všechno s ní spojené.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_09");	//Mimo toho jsem také slyšel, že Ignaz zpřístupnil některé experimenty veřejnosti. Takže taky proto, jak jistě chápeš!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_10");	//Vrchnost udělala toto rozhodnutí, i když možná nebylo nejšťastnější, jak vidíš.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_11");	//Říkáš mi, že jsou v tom zapojeni všichni mágové Ohně? Taky Pyrokar?!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_12");	//To ti neřeknu. Už i tak víš moc!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_15");	//Myslím ale, že by bylo správné, kdybys o tomto střetnutí nikomu neřekl.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_16");	//Jsem si jistý, že mnoho lidí ti věřit nebude. Mágové Ohně jsou vždy mimo podezření, konají podle Innose!
	KARRASTELLABOUTIGNAZ = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Zjistil jsem, kdo stojí za vraždou Ignaza. Byli to mágové Ohně! Považovali jeho pokusy za nebezpečné a proti jejich víře, protože je prováděl na ubohých zvířatech. Teď rozmýšlím, co dál – nemusím to říct nikomu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_503_Karras,"Start");
};


instance DIA_KARRAS_KILLIGNAZ_AFTER(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_after_condition;
	information = dia_karras_killignaz_after_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_killignaz_after_condition()
{
	if((MIS_KILLIGNAZ == LOG_SUCCESS) && (KARRASTELLABOUTIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_after_info()
{
	if(TELLANDRETRUTH == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_00");	//Čili ses rozhodl povědět Andremu o našem střetnutí.
		AI_Output(other,self,"DIA_Karras_KillIgnaz_After_01_01");	//Nemohl jsem konat jinak.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_02");	//Hmmm... (vyčítavě) dobře, tvoje věc! Ale myslím si, že to od tebe nebylo velmi moudré.
		if(INNOSPRAYCOUNT >= 10)
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 10;
		}
		else
		{
			INNOSPRAYCOUNT = 0;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_07");	//Čili jsi neřekl Andremu o našem stretnutí.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_09");	//Tedy... (usmívá se) To bylo od tebe velmi moudré!
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_10");	//Holá pravda může někdy přinést omnoho víc zla než malá lež.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_11");	//Tady, přijmi tento malý dar jako důkaz mé vděčnosti. Myslím, že sis ho zasloužil!
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		AI_Output(other,self,"DIA_Karras_KillIgnaz_After_01_12");	//Ano?! Tedy, děkuji. I když jsem to nečekal!
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_13");	//Innosovy cesty jsou nevyzpytatelné, synu... (usmívá se) Teď jdi a nechť tě převází!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KARRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = dia_karras_runemagicnotwork_condition;
	information = dia_karras_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy - stále fungují?";
};


func int dia_karras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Karras_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Karras_RuneMagicNotWork_01_01");	//Momentálně ne... (nechápavě) A ani za svět nedokážu pochopit proč!
	AI_Output(self,other,"DIA_Karras_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny! Ostatním mágům Ohně se také nic nedaří.
	AI_Output(other,self,"DIA_Karras_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_Karras_HelpBooks(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_condition;
	information = DIA_Karras_HelpBooks_info;
	permanent = FALSE;
	description = "Pyrokar mě za tebou poslal...";
};

func int DIA_Karras_HelpBooks_condition()
{
	if(MIS_KARRAS_BOOKS == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_info()
{
	AI_Output(other,self,"DIA_Karras_HelpBooks_0131_012");	//Pyrokar mě za tebou poslal...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_01");	//Zrovna jsem tě hledal novici.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_02");	//Slyšel jsem, že se ti podařilo projít zkouškou - a to je neuvěřitelné!
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_03");	//A to je důvod, proč na můj rozkaz postoupíš jenom ty.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_04");	//V současné době studuji díla našich předků, pradávných mágů Khorinisu...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_05");	//Oni také sloužily Innosovi, ale mnohé jejich rituály nechápu a jsou pro mě neznámé.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_06");	//Zdá se, že jejich magie je velmi odlišná od té na kterou jsme zvyklí...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_07");	//Shromáždil jsem již spoustu informací...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_08");	//A vím, že některé z knih, které jsem potřeboval jsou stále někde v Khorinisu.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_09");	//Bohužel ti nemohu poradit, kde je můžeš najít, ale vkládám naděje do tvojí představivosti a znalostí ostrova!
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_10");	//Musíš najít pět knih a svitek s poznámkami k nim. Bez něho by bylo obtížné pochopit co je v nich psáno.
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Karras mi vyprávěl o dávných čarodějích, kteří kdysi žili na ostrově Khorinis. Musím najít pět knih, které zanechaly tito lidé, stejně jako svitek s poznámkami ke knihám. Žádné stopy, kde najít tyto knihy, nemá - budu muset hledat naslepo a doufat v intuici...");
};

instance DIA_Karras_HelpBooks_Ok(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_Ok_condition;
	information = DIA_Karras_HelpBooks_Ok_info;
	permanent = FALSE;
	description = "Našel jsem knihy i svitek.";
};

func int DIA_Karras_HelpBooks_Ok_condition()
{
	if((MIS_KARRAS_BOOKS == LOG_Running) && Npc_HasItems(hero,itwr_oldbook1) && Npc_HasItems(hero,itwr_oldbook2) && Npc_HasItems(hero,itwr_oldbook3) && Npc_HasItems(hero,itwr_oldbook4) && Npc_HasItems(hero,itwr_oldbook5) && Npc_HasItems(hero,itwr_oldbook6))
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_Ok_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Karras_HelpBooks_Ok_01_01");	//Našel jsem knihy i svitek.
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_02");	//(udiveně) To není možný, ukaž!
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,itwr_oldbook1,1);
	Npc_RemoveInvItems(other,itwr_oldbook2,1);
	Npc_RemoveInvItems(other,itwr_oldbook3,1);
	Npc_RemoveInvItems(other,itwr_oldbook4,1);
	Npc_RemoveInvItems(other,itwr_oldbook5,1);
	Npc_RemoveInvItems(other,itwr_oldbook6,1);
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_03");	//Ó, Innosi, dokázal jsi to! Aniž bys měl nějakou představu, jak zajímavé a důležité informace z těch svazků získáme.
	AI_Output(other,self,"DIA_Karras_HelpBooks_Ok_01_04");	//Podělíš se pak o své znalosti se mnou?
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_05");	//Kdoví, kdoví... (sarkasticky) Běž za Pyrokarem, už tě netrpělivě očekává, aby tě přijal do Kruhu Ohně! Než půjdeš, zde máš ode mně runový kámen, bude se ti hodit.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	MIS_KARRAS_BOOKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Nakonec se mi podařilo najít všechny starověké svazky, měl jsem z toho dobrý pocit, hlavně Karrase to potěšilo. Jejich obsah pro mě zůstane záhadou, aspoň zatím...");
};
