
instance DIA_PAL_9122_RITTER_EXIT(C_Info)
{
	npc = pal_9122_ritter;
	nr = 999;
	condition = dia_pal_9122_ritter_exit_condition;
	information = dia_pal_9122_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9122_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9122_RITTER_WHO(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_who_condition;
	information = dia_pal_9122_ritter_who_info;
	permanent = FALSE;
	description = "Vítej, kdo jsi?";
};


func int dia_pal_9122_ritter_who_condition()
{
	return TRUE;
};

func void dia_pal_9122_ritter_who_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_Who_01_00");	//Vítej, kdo jsi?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_Who_01_01");	//Mé jméno je Ferdinand, cizinče... (smutný povzdech)
};


instance DIA_PAL_9122_RITTER_SILVERCUP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercup_condition;
	information = dia_pal_9122_ritter_silvercup_info;
	permanent = FALSE;
	description = "Nějaké problémy?";
};


func int dia_pal_9122_ritter_silvercup_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercup_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_01_00");	//Co je s tebou? Nikdy jsem neviděl paladina trpícího melancholií.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_01");	//Bohužel, mám dobrý důvod.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_02");	//Jsem vyschlej jak troud, už dlouhou dobu nemohou pít své oblíbené víno.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_01_03");	//Co, prohrál jsi všechny peníze v kostkách, a teď nemáš na zaplacení v hospodě? (zasměje se)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_04");	//Bohužel, můj problém je mnohem horší!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_05");	//Víš, v mé rodině je taková tradice, že muž může pít víno pouze ze stříbrného nádobí.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_06");	//Svůj pohár jsem zapomněl na lodi. Ve skladu je několik stříbrných pohárů, ale správce skladu mě žádný nechce prodat.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_01_07");	//Lord Varus nás nepouští z pevnosti, takže si nemůžu koupit pohár někde jinde.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Možná ti mohu pomoct?",dia_pal_9122_ritter_silvercup_help);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Myslím, že si děláš zbytečné starosti.",dia_pal_9122_ritter_silvercup_crazy);
	if(Npc_HasItems(other,ItMi_SilverCup) >= 1)
	{
		Info_AddChoice(dia_pal_9122_ritter_silvercup,"Mám u sebe stříbrný pohár.",dia_pal_9122_ritter_silvercup_have);
	};
};

func void dia_pal_9122_ritter_silvercup_help()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Help_01_00");	//Chceš já ti pomůžu, najdu tvůj pohár!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Help_01_01");	//Opravdu to uděláš. Budu ti za to nezkonale vděčnej.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	MIS_FERDSILVERCUP = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSILVERCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_Running);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Slíbil jsem, že seženu paladinovi Ferdinandovi stříbrný pohár, aby mohl pít své víno.");
};

func void dia_pal_9122_ritter_silvercup_crazy()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_00");	//Ty co se lituješ? Není čas přemýšlet o takových maličkostech! Zapomeň, na svou tradici.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_01");	//Co? Ty zřejmě neznáš, takové věci jako čest a věrnost. Nech mě na pokoji, cizinče.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_02");	//A jak jsi získal takové postavení ve společnosti?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Crazy_01_03");	//(pohrdavě) A kdo sem pouští takové jako ty?
	};
	FERDINPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_have()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Have_01_00");	//Mám u sebe stříbrný pohár.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Have_01_01");	//Opravdu? Děláš si srandu?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Have_01_02");	//Můžeš po mě chtít cokoliv co ti mohu nabídnout.
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Myslím, že 1000 zlatých bude úplně stačit.",dia_pal_9122_ritter_silvercup_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercup,"Nic nechci, na vem si ho.",dia_pal_9122_ritter_silvercup_give);
};

func void dia_pal_9122_ritter_silvercup_gold()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_00");	//Myslím, že 1000 zlatých bude úplně stačit.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_01");	//Vysmíváš se mi? I kdyby byl celý ze zlata tak by nestál ani polovinu.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_02");	//No, jestli ho nepotřebuješ tak já...
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_03");	//(netrpělivě) Počkej - tady máš své peníze, jseš nechutnej lichvář.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_04");	//Výborně. Tady máš svůj pohár.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_05");	//S tebou se dobře obchoduje - pokud budeš něco potřebovat ozvi se! (posměšně)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_06");	//Jdi mi z očí lichváři!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_07");	//Nechci s tebou mít nic společného.

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_08");	//A jak jsi získal takové postavení ve společnosti?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Gold_01_09");	//(pohrdavě) A kdo sem pouští takové jako ty?
	};
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		B_LogEntry_Failed(TOPIC_FERDSPECWINE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercup_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCup_Give_01_00");	//Nic nechci, na vem si ho!
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Give_01_01");	//Tvoje štědrost nezná mezí, příteli, ale nemohu si ho jen tak vzít.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCup_Give_01_02");	//Vezmi si kousek černé rudy, je velmi vzácná.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	Info_ClearChoices(dia_pal_9122_ritter_silvercup);
};


instance DIA_PAL_9122_RITTER_SILVERCUPDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_silvercupdone_condition;
	information = dia_pal_9122_ritter_silvercupdone_info;
	permanent = FALSE;
	description = "Mám pro tebe pohár.";
};

func int dia_pal_9122_ritter_silvercupdone_condition()
{
	if((MIS_FERDSILVERCUP == LOG_Running) && (Npc_HasItems(hero,ItMi_SilverCup) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_silvercupdone_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_01_00");	//Mám pro tebe pohár.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_01_01");	//Opravdu a nekecáš?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_01_02");	//Můžeš si říct o cokoliv chceš.
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone,"Myslím, že 1000 zlatých bude úplně stačit.",dia_pal_9122_ritter_silvercupdone_gold);
	Info_AddChoice(dia_pal_9122_ritter_silvercupdone,"Nic nechci, na vem si ho!",dia_pal_9122_ritter_silvercupdone_give);
};

func void dia_pal_9122_ritter_silvercupdone_gold()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_00");	//Myslím, že 1000 zlatých bude úplně stačit.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_01");	//Vysmíváš se mi? I kdyby byl celý ze zlata tak by nestál ani polovinu.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_02");	//No, jestli ho nepotřebuješ tak já...
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_03");	//(netrpělivě) Počkej - tady máš své peníze, jseš nechutnej lichvář.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_04");	//Výborně. Tady máš svůj pohár.
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_05");	//S tebou se dobře obchoduje - pokud budeš něco potřebovat ozvi se! (posměšně)
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_06");	//Jdi mi z očí lichváři!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_07");	//Nechci s tebou mít nic společného.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_08");	//A jak jsi získal takové postavení ve společnosti?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Gold_01_09");	//(pohrdavě) A kdo sem pouští takové jako ty?
	};
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Prodal jsem Ferdinandovi pohár za 1000 zlatých, příště už se mnou asi ani nepromluví.");
	FERDINPISSOFF = TRUE;

	if(MIS_FERDSPECWINE == LOG_Running)
	{
		MIS_FERDSPECWINE = LOG_Failed;
		Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_OBSOLETE);
	};

	AI_StopProcessInfos(self);
};

func void dia_pal_9122_ritter_silvercupdone_give()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_00");	//Nic nechci, na vem si ho!
	B_GiveInvItems(other,self,ItMi_SilverCup,1);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_01");	//Tvoje štědrost nezná mezí, příteli, ale nemohu si ho jen tak vzít.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SilverCupDone_Give_01_02");	//Vezmi si kousek černé rudy, je velmi vzácná.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	MIS_FERDSILVERCUP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSILVERCUP,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSILVERCUP,"Daroval jsem Ferdinandovi stříbrný pohár.");
	Info_ClearChoices(dia_pal_9122_ritter_silvercupdone);
};

instance DIA_PAL_9122_RITTER_FUCKOFF(C_Info)
{
	npc = pal_9122_ritter;
	nr = 10;
	condition = dia_pal_9122_ritter_fuckoff_condition;
	information = dia_pal_9122_ritter_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_9122_ritter_fuckoff_condition()
{
	if((FERDINPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PAL_9122_RITTER_THINGS(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_things_condition;
	information = dia_pal_9122_ritter_things_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_pal_9122_ritter_things_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_who))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_things_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_Things_01_00");	//Jak jde život?
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_01");	//Pořád stejně, a u tebe něco nového v pátrání?
		AI_Output(other,self,"DIA_Pal_9122_Ritter_Things_01_02");	//Právě se tím zabývám.
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_03");	//Ach jo... (nešťastně)
		AI_StopProcessInfos(self);
	}
	else if(MIS_FERDSILVERCUP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_04");	//Rád tě vidím příteli!
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_05");	//Vše v pořádku!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9122_Ritter_Things_01_06");	//Nech mně na pokoji!
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9122_RITTER_SPECWINE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwine_condition;
	information = dia_pal_9122_ritter_specwine_info;
	permanent = FALSE;
	description = "A co piješ za víno?";
};


func int dia_pal_9122_ritter_specwine_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9122_ritter_silvercup) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwine_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_00");	//A co piješ za víno?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_01");	//(směje se) Zajímá tě to?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_02");	//Nazývá se 'Slzy štěstí'. 
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_03");	//Jsou to nejlepší hrozny z nejlepších vinohradů! Proto je velmi vzácné a drahé!
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_04");	//Na ostrově ho nekoupíš.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_05");	//A jak ses k němu dostal?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_06");	//Za prvé... připluli jsme z pevniny kde se prodává.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_07");	//Za druhé... zjistil jsem, že jeden z obchodníků ve městě má malou zásobičku tohodle vína.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_09");	//Myslím, že se jmenuje Matteo. Ale je nepravděpodobné, že by ho prodal.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_10");	//Proč?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_11");	//Poslal jsem k němu člověka, aby koupil všechno jeho víno - měl všehovšudy - několik láhví.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_01_12");	//Poslal jsi kurýra do města? A proč jsi mu sakra neřek ať ti koupí taky pohár?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_13");	//Pochop, že člověk co kupuje víno nikoho nezajímá.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_14");	//A za stříbrný pohár ti lidi klidně podříznou krk.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_15");	//Hmm... I když je divné že má můj kurýr zpoždění.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_16");	//Poslyš, nemohl bys zjistit co se s ním stalo?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_01_17");	//Jak se vrátíš, pohostím tě tímdle znamenitým vínem!
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
	Info_AddChoice(dia_pal_9122_ritter_specwine,"Nemám na to čas.",dia_pal_9122_ritter_specwine_no);
	Info_AddChoice(dia_pal_9122_ritter_specwine,"Dobrá, půjdu do města a zjistím co se dá.",dia_pal_9122_ritter_specwine_yes);
};

func void dia_pal_9122_ritter_specwine_no()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_No_01_00");	//Bojím se, že na to nemám čas.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_No_01_01");	//Rozumím... (smutně) Jsi zaneprázdněný člověk.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_No_01_02");	//Nestrachuj se, určitě je v pořádku a každou chvíli se vrátí.
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

func void dia_pal_9122_ritter_specwine_yes()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_00");	//Dobrá, půjdu do města a zjistím co se dá.
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_01");	//Kolik ti měl přinést vína?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWine_Yes_01_02");	//Dvě láhve vína, to bylo vše co mě Matteo chtěl prodat.	
	MIS_FERDSPECWINE = LOG_Running;
	Log_CreateTopic(TOPIC_FERDSPECWINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_Running);
	B_LogEntry(TOPIC_FERDSPECWINE,"Ferdinand je znepokojen tím, že kurýr kterého poslal pro víno, ještě nedorazil. Nabídl jsem se, že mu pomůžu zjistit co se stalo. Asi začnu tím, že zajdu za Matteem a promluvím s ním.");
	Info_ClearChoices(dia_pal_9122_ritter_specwine);
};

instance DIA_PAL_9122_RITTER_SPECWINEDONE(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_specwinedone_condition;
	information = dia_pal_9122_ritter_specwinedone_info;
	permanent = FALSE;
	description = "Našel jsem tvého kurýra.";
};

func int dia_pal_9122_ritter_specwinedone_condition()
{
	if((MIS_FERDSPECWINE == LOG_Running) && (Npc_HasItems(hero,itfo_specwine) >= 2))
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_specwinedone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_00");	//Našel jsem tvého kurýra.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_01");	//A kde je ten hlupák?
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_02");	//Je mrtvý - daleko od města narazil na smečku vlků.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_03");	//(lítostně) Hmmm, to není pěkný osud.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_04");	//A co je s vínem?
	AI_Output(other,self,"DIA_Pal_9122_Ritter_SpecWineDone_01_05");	//Víno mám já - tady. Dvě láhve, jak jsi řekl.
	B_GiveInvItems(other,self,itfo_specwine,2);
	Npc_RemoveInvItems(self,itfo_specwine,2);
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_06");	//No, alespoň to je dobrá zpráva.	
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_07");	//A jak jsem slíbil pohostím tě tímdle vínem.
	AI_Output(self,other,"DIA_Pal_9122_Ritter_SpecWineDone_01_08");	//Tumáš jedna láhev je tvoje, připijme si na zdraví.
	B_GiveInvItems(self,other,itfo_specwine_hp,1);
	MIS_FERDSPECWINE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FERDSPECWINE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FERDSPECWINE,"Přinesl jsem Ferdinandovi dvě láhve vína 'Slzy štěstí'. Jednu z nich mi daroval.");
};

instance DIA_PAL_9122_RITTER_RAYNEHELP(C_Info)
{
	npc = pal_9122_ritter;
	nr = 1;
	condition = dia_pal_9122_ritter_raynehelp_condition;
	information = dia_pal_9122_ritter_raynehelp_info;
	permanent = FALSE;
	description = "Mohl bys pomoct Rayneovi ve skladě?";
};


func int dia_pal_9122_ritter_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9122_ritter_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9122_Ritter_RayneHelp_01_00");	//Mohl bys pomoct Rayneovi ve skladě?
	AI_Output(self,other,"DIA_Pal_9122_Ritter_RayneHelp_01_01");	//Co ještě, myslíš že nemám nic na práci!
	AI_Output(other,self,"DIA_Pal_9122_Ritter_RayneHelp_01_02");	//Dobře, zapomeň na to.
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Zdá se, že jen marním čas - žádný z paladinů není nakloněn myšlence Rayneovi pomoct. Možná bych měl zvolit poněkud drastičtější přístup...");
	};
};


instance DIA_PAL_9122_RITTER_PICKPOCKET(C_Info)
{
	npc = pal_9122_ritter;
	nr = 900;
	condition = dia_pal_9122_ritter_pickpocket_condition;
	information = dia_pal_9122_ritter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9122_ritter_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9122_ritter_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,Dialog_Back,dia_pal_9122_ritter_pickpocket_back);
	Info_AddChoice(dia_pal_9122_ritter_pickpocket,DIALOG_PICKPOCKET,dia_pal_9122_ritter_pickpocket_doit);
};

func void dia_pal_9122_ritter_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

func void dia_pal_9122_ritter_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9122_ritter_pickpocket);
};

