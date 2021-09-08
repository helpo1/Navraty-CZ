
instance DIA_Akil_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_EXIT_Condition;
	information = DIA_Akil_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//Musím jít.
	if(Akil_Sauer == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Nebudu tě zdržovat.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//Tak zatím. Rád bych toho pro tebe udělal víc.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Hallo(C_Info)
{
	npc = BAU_940_Akil;
	nr = 4;
	condition = DIA_Akil_Hallo_Condition;
	information = DIA_Akil_Hallo_Info;
	permanent = FALSE;
	description = "Problémy?";
};


func int DIA_Akil_Hallo_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Problémy?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(nervózně) ... Eh... ne, ne... Všechno je v pořádku. Bude... Bude lepší, když půjdeš pryč.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Opravdu?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//Eh... jo, jo... Všechno v pohodě. Ty... eh... Já... Teď s tebou nemůžu mluvit.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci.");
	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Akil_Nichtjetzt(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Nichtjetzt_Condition;
	information = DIA_Akil_Nichtjetzt_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Akil_Nichtjetzt_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_KnowsInfo(other,DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Eh... Teď ne, teď s tebou nemůžu mluvit.
	AI_StopProcessInfos(self);
};


instance DIA_Akil_NachKampf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Akil_NachKampf_Condition;
	information = DIA_Akil_NachKampf_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Akil_NachKampf_Condition()
{
	if(Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Díky Innosovi. Přišel jsi právě včas.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//Jmenuji se Akil. Jsem farmářem na tomto skromném kousku země.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Kdo byli ti lidé?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//Měl bys je znát. To byli žoldáci z Onarovy farmy. Stejně jako ty.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//Byli to žoldáci z Onarovy farmy. Ti bastardi se zabývají jen tím, koho oloupit nebo zabít.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//Už jsem se bál nejhoršího...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(hluboký nádech) ... No, díky Innosovi, že na to nedošlo. Řekni mi, co pro tebe můžu udělat?
	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf,"Nic, hlavně, že jste všichni v pořádku.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf,"Co takhle trochu zlata?",DIA_Akil_NachKampf_Gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(Kati) && !Npc_IsDead(Kati))
	{
		Npc_ExchangeRoutine(Kati,"Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0;
	};
	if(Hlp_IsValidNpc(Randolph) && !Npc_IsDead(Randolph))
	{
		Npc_ExchangeRoutine(Randolph,"Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Nic, hlavně že jste všichni v pořádku.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//Jsi výjimečný člověk. Kéž tě Innos provází.
	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//Co takhle trochu zlata?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//Bojím se, že tě budu muset zklamat - jsme pouze chudí farmáři. Máme jen to, co potřebujeme k životu.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//Všechno, co ti můžu dát je trochu jídla. Jdi za Kati, ona se o tebe postará.
	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};


instance DIA_Akil_Soeldner(C_Info)
{
	npc = BAU_940_Akil;
	nr = 7;
	condition = DIA_Akil_Soeldner_Condition;
	information = DIA_Akil_Soeldner_Info;
	permanent = FALSE;
	description = "Co od tebe ti žoldáci chtěli?";
};


func int DIA_Akil_Soeldner_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//Co od tebe ti žoldáci chtěli?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//Děláš si ze mě legraci? Ti žoldáci vybírají nájemné!
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//Vážně to nevíš? Onar, statkář, je poslal. Střeží jeho farmu a vybírají pro něj nájemné.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//To znamená, že chodí od farmy k farmě a berou si všechno, na co přijdou. A kdo jim nemůže zaplatit, toho zabijí.
	};
};


instance DIA_Addon_Akil_MissingPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_MissingPeople_Condition;
	information = DIA_Addon_Akil_MissingPeople_Info;
	description = "Slyšel jsi něco o těch ztracených lidech?";
};


func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Slyšel jsi něco o těch ztracených lidech?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Nechtěj mě rozesmát. Slyšet? Dokonce někteří z mých lidí se ztratili!
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Tonak a Telbor pracovali na mých polích. Zmizeli před třemi dny.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//A vím jistě, že by farmu nikdy jen tak neopustili.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//Oni prostě jednoduše zmizeli a nikdo neví, kde jen mohli jít.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//Pokud se ti podaří je najít, dáš mi vědět?
	B_GivePlayerXP(XP_Ambient);
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Farmáři Akilovi se ztratili dva rolníci: Tonak a Telbor.");
	MIS_Akil_BringMissPeopleBack = LOG_Running;
};


instance DIA_Addon_Akil_ReturnPeople(C_Info)
{
	npc = BAU_940_Akil;
	nr = 5;
	condition = DIA_Addon_Akil_ReturnPeople_Condition;
	information = DIA_Addon_Akil_ReturnPeople_Info;
	permanent = FALSE;
	description = "Ohledně tvých rolníků...";
};


func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if((MIS_Akil_BringMissPeopleBack == LOG_Running) && (MissingPeopleReturnedHome == TRUE) && ((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//Ohledně tvých rolníků...
	if((Npc_GetDistToWP(Tonak_NW,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(Telbor_NW,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//Přivedl jsi je zpět, jsi statečný muž.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//Naneštěstí jeden z nich nepřežil.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Vem si toto zlato jako projev vděčnosti.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	B_GivePlayerXP(XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};


instance DIA_Akil_Lieferung(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Lieferung_Condition;
	information = DIA_Akil_Lieferung_Info;
	permanent = FALSE;
	description = "Posílá mě Baltram.";
};


func int DIA_Akil_Lieferung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_NachKampf) && (MIS_Baltram_ScoutAkil == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Posílá mě Baltram. Mám pro něj vyzvednout zásilku.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//Takže jsi jeho nový poslíček. Dobře, už jsem ti to připravil.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	B_LogEntry(TOPIC_Baltram,"Dostal jsem balíček. Nyní ho mohu doručit Baltramovi...");
	B_LogEntry_Quiet(TOPIC_Nagur,"Dostal jsem balíček. Nyní ho mohu vzít... Nagurovi.");
};


instance DIA_Akil_Gegend(C_Info)
{
	npc = BAU_940_Akil;
	nr = 90;
	condition = DIA_Akil_Gegend_Condition;
	information = DIA_Akil_Gegend_Info;
	permanent = FALSE;
	description = "Jistě se vyznáš v okolí...";
};


func int DIA_Akil_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Knows_Taverne;

func void DIA_Akil_Gegend_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//Jistě se vyznáš v okolí...
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Co potřebuješ vědět?
};


instance DIA_Akil_Hof(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Hof_Condition;
	information = DIA_Akil_Hof_Info;
	permanent = FALSE;
	description = "Kde najdu Onarovu farmu?";
};


func int DIA_Akil_Hof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Kde najdu Onarovu farmu?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Vrať se dolů po kamenných schodech a jdi po stezce směrem na východ.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//Cestou narazíš na hostinec. Od ní běž dál na východ. Za polem je farma, kde žijí žoldáci.
	Knows_Taverne = TRUE;
};


instance DIA_Akil_Taverne(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Taverne_Condition;
	information = DIA_Akil_Taverne_Info;
	permanent = FALSE;
	description = "Co ten hostinec na východě?";
};


func int DIA_Akil_Taverne_Condition()
{
	if(Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//Co ten hostinec na východě?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Zeptej se Randolpha. Ví toho o ní víc, než já. Už tam několikrát byl.
};


instance DIA_Akil_Wald(C_Info)
{
	npc = BAU_940_Akil;
	nr = 20;
	condition = DIA_Akil_Wald_Condition;
	information = DIA_Akil_Wald_Info;
	permanent = FALSE;
	description = "Co najdu v lese za tvou farmou?";
};


func int DIA_Akil_Wald_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//Co najdu v lese za tvou farmou?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//Je tam spousta příšer - a vlci jsou z nich ty nejméně nebezpečné.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//Nějací banditi tam také určitě budou, mají tam jeskyni. No, nikdy jsem tak daleko od farmy sám nebyl.
};


instance DIA_Akil_Perm(C_Info)
{
	npc = BAU_940_Akil;
	nr = 32;
	condition = DIA_Akil_Perm_Condition;
	information = DIA_Akil_Perm_Info;
	permanent = TRUE;
	description = "Stalo se něco zajímavého?";
};


func int DIA_Akil_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Akil_Soeldner) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Stalo se něco zajímavého?
	if(Kapitel == 3)
	{
		if(MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//Ne. Doufám, že mé ovce zůstanou tam, kde právě jsou.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//Moje ovce stále mizí. Brzy již nebudu moci nakrmit ani svou rodinu.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//Stále se tu ukazují skřeti. Někdo říkal, že dokonce viděl jejich vůdce. Zeptej se na to farmáře Lobarta.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//Také jsme si všimli nějakých ještěranů. Nechtěl bych jít do jeskyní, kde právě jsou.
		};
		if((hero.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//Černé kápě tě hledají.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//To je mi novinka.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//Dobře. Jen jsem si myslel, že by bylo dobré se o tom zmínit.
		};
		if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_08");	//Náš kraj oplývá divokou zvěří. Na tvém místě bych byl opatrnější...
		};
	};
};


instance DIA_Akil_KAP3_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP3_EXIT_Condition;
	information = DIA_Akil_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_SCHAFDIEB(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEB_Condition;
	information = DIA_Akil_SCHAFDIEB_Info;
	description = "Něco nového?";
};


func int DIA_Akil_SCHAFDIEB_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Něco nového?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//V poslední době mi někdo stále krade ovce. Už ani nemůžu v noci spát.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"To je tvůj problém.",DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Kolik ovcí se ti ztratilo?",DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB,"Kdo to mohl udělat?",DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_Running;
	Log_CreateTopic(TOPIC_AkilSchafDiebe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe,LOG_Running);
	B_LogEntry(TOPIC_AkilSchafDiebe,"Akil si myslí, že ti banditi, co se nedávno usadili v jeskyních v lese, mohli ty ovce ukrást.");
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Kdo to mohl udělat?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//Mám takové tušení...
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//Nějací banditi se usadili v jeskyni v lese.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//Je těžké uvěřit, že by se v tom lese živili sběrem borůvek a jiných bobulí. Jsem si téměř jistý, že to jsou oni, kdo krade mé ovce.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//Kolik ovcí ti zmizelo?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//Už zmizely nejméně tři.
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//To je tvůj problém.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//Chápu. Máš jiné starosti.
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};


instance DIA_Akil_SCHAFDIEBEPLATT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information = DIA_Akil_SCHAFDIEBEPLATT_Info;
	description = "Našel jsem ty, kteří ukradli tvé ovce.";
};


func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if((Kapitel >= 3) && (MIS_Akil_SchafDiebe == LOG_Running) && Npc_IsDead(BDT_1025_Bandit_H) && Npc_IsDead(BDT_1026_Bandit_H) && Npc_IsDead(BDT_1027_Bandit_H))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//Našel jsem ty, kteří ukradli tvé ovce.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//Měl jsi pravdu. Udělali to ti chlapi z té jeskyně v lese. Už to nikdy znovu neudělají.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Děkuji ti, vznešený Innosův služebníku.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Díky ti. Takže domobrana se opravdu stará o malé farmy. To je dobře.
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03A");	//Děkuji ti, Adanův následovníku.
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03B");	//Ačkoli jsem slyšel divné zvuky... (vystrašeně) Děkuji ti, temný mágu.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_0C");	//Díky. Ačkoli jsou sektáři trochu divní lidé, soucit s druhými vám očividně není cizí.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Díky. Opravdu nejsi jako jiní žoldáci, jsi statečný a ochotný.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Přijmi prosím toto zlato jako odměnu za tvou nesmírnou laskavost.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};


instance DIA_Akil_AkilsSchaf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 2;
	condition = DIA_Akil_AkilsSchaf_Condition;
	information = DIA_Akil_AkilsSchaf_Info;
	description = "(vrátit Akilovi ovci)";
};


func int DIA_Akil_AkilsSchaf_Condition()
{
	if((Kapitel >= 3) && (Npc_GetDistToNpc(self,Follow_Sheep_AKIL) < 1000) && (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Výborně. Tady máš nějaké zlato. Snad ti pomůže.
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;
	B_GivePlayerXP(XP_AkilsSchaf);
};


instance DIA_Akil_KAP4_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP4_EXIT_Condition;
	information = DIA_Akil_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP5_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP5_EXIT_Condition;
	information = DIA_Akil_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_KAP6_EXIT(C_Info)
{
	npc = BAU_940_Akil;
	nr = 999;
	condition = DIA_Akil_KAP6_EXIT_Condition;
	information = DIA_Akil_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Akil_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Akil_PICKPOCKET(C_Info)
{
	npc = BAU_940_Akil;
	nr = 900;
	condition = DIA_Akil_PICKPOCKET_Condition;
	information = DIA_Akil_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Akil_PICKPOCKET_Condition()
{
	return C_Beklauen(37,30);
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET,Dialog_Back,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

instance DIA_Akil_Werewolf(C_Info)
{
	npc = BAU_940_Akil;
	nr = 3;
	condition = DIA_Akil_Werewolf_Condition;
	information = DIA_Akil_Werewolf_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o nedávných útocích?";
};

func int DIA_Akil_Werewolf_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Mika_Werewolf) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Akil_Werewolf_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Akil_Werewolf_01_00");	//Co mi můžeš říct o nedávných útocích?
	AI_Output(self,other,"DIA_Akil_Werewolf_01_01");	//Ach, ta strašná událost...
	AI_Output(self,other,"DIA_Akil_Werewolf_01_03");	//Jeden z mých rolníků šel k Orlanovi do hostince, aby před spaním smočil hrdlo.
	AI_Output(self,other,"DIA_Akil_Werewolf_01_04");	//Právě když jsem se rozhodl jít do domu, uslyšel jsem za zády zoufalý křik a řev šelmy.
	AI_Output(self,other,"DIA_Akil_Werewolf_01_05");	//Otočil jsem se a šel se podívat co se stalo. Ale ve skutečnosti jsem nic neviděl, protože už byla tma.
	AI_Output(self,other,"DIA_Akil_Werewolf_01_06");	//Pak jsem utíkal do domu, abych přivolal pomoc.
	AI_Output(self,other,"DIA_Akil_Werewolf_01_07");	//Ale když jsme se vrátili - ani šelma, ani rolník, nikde nic nebylo.
	AI_Output(self,other,"DIA_Akil_Werewolf_01_08");	//Našli jsme kus roztrhané látky a kaluž krve... (pokrčí rameny) To je vše.
	AI_Output(other,self,"DIA_Akil_Werewolf_01_09");	//A kde jste to našli?
	AI_Output(self,other,"DIA_Akil_Werewolf_01_10");	//Tady, přímo pod mostem, být tebou tak bych tam nechodil. Nikdy nevíš...
	B_LogEntry(TOPIC_WolfAndMan,"Akil uvedl, že jednoho z jeho rolníků napadlo obrovské zvíře. Stalo se to v blízkosti Orlanova hostince - pod mostem.");
};