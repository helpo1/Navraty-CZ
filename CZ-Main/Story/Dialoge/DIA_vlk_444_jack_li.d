/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int dia_jack_li_bringfooddone_condition - upraveny podmínky dialogu

*/



instance DIA_JACK_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 999;
	condition = dia_jack_li_kap3_exit_condition;
	information = dia_jack_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jack_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jack_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_LI_PICKPOCKET(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 900;
	condition = dia_jack_li_pickpocket_condition;
	information = dia_jack_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jack_li_pickpocket_condition()
{
	return C_Beklauen(76,120);
};

func void dia_jack_li_pickpocket_info()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
	Info_AddChoice(dia_jack_li_pickpocket,Dialog_Back,dia_jack_li_pickpocket_back);
	Info_AddChoice(dia_jack_li_pickpocket,DIALOG_PICKPOCKET,dia_jack_li_pickpocket_doit);
};

func void dia_jack_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_jack_li_pickpocket);
};

func void dia_jack_li_pickpocket_back()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
};


instance DIA_JACK_LI_STORM(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_storm_condition;
	information = dia_jack_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_storm_condition()
{
	return TRUE;
};

func void dia_jack_li_storm_info()
{
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_01");	//No konečně jsi přišel k sobě! Jak se cítíš?!
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_02");	//Jo, ujde to! Jenom mě ještě trochu bolí hlava, jakoby mi tam někdo vrazil hřebík.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_03");	//No jo příteli... měl jsi fakt štěstí! (usmívá se)
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_04");	//A co se stalo?!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_07");	//Hmmm... (vážným tónem) Během bouře jsi mi pomáhal držet kormidlo, abychom se nepřevrátili, a šlo to celkem dobře...
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_08");	//Ale, pak to začlo být dost divoké a jedna z vln prudce narazila na levobok a odmrštilo tě to pryč, bouchl ses do hlavy, a málem přepadl přes palubu.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_09");	//Asi to musel být silný náraz, protože jsi okamžitě omdlel a vlastně ses vzbudil až teď...
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_11");	//Já, společně s pár chlapy sme tě na poslední chvíli stačili zachytit, a odtáhnout do kajuty. Jinak by teď z tebe byla tak akorát snídaně pro žraloky.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_13");	//Nicméně!... (znepokojeně) tato bouře nás zahnala skoro na konec světa!
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_14");	//Ale máme štěstí, že vůbec žijeme!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_15");	//Ano, štěstí!... (radostně) Díky Innosovi, že jsme alespoň ve zdraví přežili tohle přistání! Ještě kousek a naše loď by se zlomila vejpůl!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_20");	//Eh, no dobrá... (klidně) Alespoň potěší fakt, že se bouře stočila jiným směrem.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_23");	//Ale na radovánky je ještě brzy! Teď je třeba přijít na to, jak opravit loď!
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_24");	//A co je potřeba opravit?!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_25");	//Ozubenné kolo u kormidla! Bouře ho pořádně zřídila.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_26");	//Opravit pár děr v trupu nebude problém, ale to kormidlo ano! Bez něj sme nahraní.
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_27");	//Jak dlouho ta oprava asi potrvá?!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_28");	//To nevím... (zamyšleně) možná jen pár dní, možná týden. Teď to nedokážu přesně říci!
};


instance DIA_JACK_LI_REPAIR(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repair_condition;
	information = dia_jack_li_repair_info;
	permanent = FALSE;
	description = "Jak bych asi tak mohl pomoct s opravou lodi?";
};


func int dia_jack_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_repair_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Repair_01_01");	//Jak bych asi tak mohl pomoct s opravou lodi?
	AI_Output(self,other,"DIA_Jack_LI_Repair_01_02");	//Pro začátek by se měli zjistit škody, a pak teprve přemýšlet, nad jejich opravami.
	AI_Output(self,other,"DIA_Jack_LI_Repair_01_04");	//Takže, teď mi moc nepomůžeš... možná později.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry(TOPIC_REPAIRSHIP,"Naznačil jsem Jackovi, že mu pomůžu s opravou. Ale odpověděl mi, že je potřeba nejdříve zjistit škody na lodi a pak řešit jejich opravu. Takže, teď Jackovi moc nepomůžu. Zeptám se ho později.");
};


instance DIA_JACK_LI_REPAIRHELP(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelp_condition;
	information = dia_jack_li_repairhelp_info;
	permanent = FALSE;
	description = "Jak pokračují opravy lodě?";
};


func int dia_jack_li_repairhelp_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelp_info()
{
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_01");	//Jak pokračují opravy lodě?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_02");	//No, vypadá to, že nakonec tvou pomoc budu potřebovat.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_03");	//Já jsem připraven.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_04");	//Tak se dejme do toho!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_05");	//Prozatím jsme zjistili rozsah všech poškození a došli jsme k závěru, že většina z nich je snadno opravitelná.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_06");	//Ty dokážu opravit i já sám!... (usmívá se) ale náš největší problém je poškozené ozubenné kolo u kormidla!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_08");	//Prostě nefunguje. Je to v trolím zadku! A bez toho kola je kormidlo k ničemu...
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_10");	//A co tedy budeme dělat?!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_11");	//No, nezbývá nám nic jiného... než sehnat nové.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_12");	//Protože ozubení na kole je komplet na padrť, vedení je také zlomené, ale to se dá zpravit s kusem oceli a dobrým kovářem.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_13");	//Takže, když najdeš někde nové ozubenné kolo... pravděpodobně tím vyřešíš náš problém!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_14");	//Ale, kde takové kolo vezmu?! 
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_15");	//To je právě ono... já nevím. Najdi, půjč si, ukradni...!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_16");	//To asi nebude tak jednoduché... (sarkasticky)
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_17");	//Chápu, ale nic jiného nám nezbývá... Buď to, nebo tady skejsnem na hodně dlouhou dobu!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_18");	//No dobrá, zkusím se po něm podívat.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_19");	//Tak dobrá. A už neztrácejme čas, ty škody se samy neopraví!
	B_LogEntry(TOPIC_REPAIRSHIP,"Jack mě požádal o pomoc. Naše ozubené kolo se při bouři rozbilo. Podle jeho slov, je teď loď neovladatelná a vpodstatě na odpis. Pomůže nám jedině nové ozubenné kolo a vedení. Já se mám podívat po novém kole... jak jednoduché.");
};


instance DIA_JACK_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelpdone_condition;
	information = dia_jack_li_repairhelpdone_info;
	permanent = FALSE;
	description = "Podívej, něco jsem našel!";
};


func int dia_jack_li_repairhelpdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_01");	//Podívej, něco jsem našel!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_02");	//Co je to?!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_03");	//Tady, dívej.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_04");	//Helemse, jaké zajímavé kolo!... (udiveně) Kde jsi ho splašil?!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_05");	//No, tady kousek za starou pyramidou.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_07");	//Raději mi ale řekni, jestli to bude fungovat.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_08");	//Hmmm... (zamyšleně) Tak se podíváme...
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_09");	//Tak co?!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_10");	//Chlape, Zdá se, že to opravdu funguje...! (nadšeně) Nemůžu uvěřit vlastním očím!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_11");	//Takže naše kormidlo zase funguje?!
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_12");	//Ještě chvilku počkej... (zvážněl) Mělo by se to překontrolovat!
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_13");	//A teď?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_14");	//Ano! vypadá to, že všechno funguje. Pravda, že už taky není v nejlepší stavu, ale mělo by to vydržet.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_15");	//Ale hlavní věc je, že se nyní můžeme dostat konečně z ostrova!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_16");	//Skvělé zprávy. Kdy tedy můžeme vyrazit?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_REPAIRSHIP,"Přinesl jsem Jackovi nové ozubenné kolo. A překvapeně, skvěle zapadlo do mechanismu kormidla lodě.");

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_17");	//Dobrá, můžeme vyrazit!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_18");	//Ale nejprve musíš informovat posádku, co je na pobřeží, až poté můžeme zvednout kotvu.
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_19");	//Nemůžeme je tu nechat. (usmívá se)
			AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_20");	//Dobrá, řeknu jim a nalodíme se.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry(TOPIC_GATHERCREW,"Jack mě požádal, ať informuji posádku. Zvedáme kotvy!");
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_21");	//Takže, stačí říct a my napneme plachtu!... (široce se usmívá)
			AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_22");	//Dobrá.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_23");	//Né tak rychle příteli! Kormidlo už sice máme opravené ale... (zamyslí se) ale vůbec nevím, kde jsme, takže ani nevím, kudy plout.
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_24");	//Stále nemáme opravená menší poškození, a takhle bych vystavil loď dalšímu zbytečnému nebezpečí, kdybych nevěděl kam pluji!

		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_25");	//Zvlášť, když stále nevíme, kde jsme!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_26");	//Zvláště, když jsem do teď nevyřešili, kterým směrem vyplout.
		};

		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_27");	//Takže, raději nic neuspěcháme!
		AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_28");	//No dobrá, uděláme to jak říkáš.
	};
};


instance DIA_JACK_LI_AWAY(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_away_condition;
	information = dia_jack_li_away_info;
	permanent = TRUE;
	description = "Kdy vyplujeme?";
};

func int dia_jack_li_away_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((MIS_REPAIRSHIP == LOG_SUCCESS) && (CANAWAYFROMLI == FALSE) && (TORLOFLITIMERAWAY <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_jack_li_away_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Away_01_00");	//Kdy vyplujeme?

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_01");	//Právě teď!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jack_LI_Away_01_02");	//Nejprve musíš informovat posádku, co je na pobřeží, až poté můžeme zvednout kotvu.
			AI_Output(self,other,"DIA_Jack_LI_Away_01_03");	//Nemůžeme je tu nechat. (usmívá se)
			AI_Output(other,self,"DIA_Jack_LI_Away_01_04");	//Dobrá, řeknu jim a nalodíme se.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry(TOPIC_GATHERCREW,"Jack mě požádal, ať informuji posádku. Zvedáme kotvy!");
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_Away_01_05");	//Takže, stačí říct a my napneme plachtu!... (široce se usmívá)
			AI_Output(other,self,"DIA_Jack_LI_Away_01_06");	//Dobrá.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else if(MIS_LOSTISLAND == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_07");	//Ale ne tak rychle příteli! Kormidlo už sice máme opravené ale... (zamyslí se) ale vůbec nevím, kde jsme, takže ani nevím, kudy plout.
		AI_Output(self,other,"DIA_Jack_LI_Away_01_08");	//Takže, raději nic neuspěcháme!
		AI_Output(other,self,"DIA_Jack_LI_Away_01_09");	//Dobrá, jak říkáš.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_10");	//A navíc, jsme do teď nevyřešili, kterým směrem vyplout.
		AI_Output(self,other,"DIA_Jack_LI_Away_01_11");	//Takže, raději nic neuspěcháme!
		AI_Output(other,self,"DIA_Jack_LI_Away_01_12");	//Dobrá, jak říkáš.
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_13");	//Dokavaď jsem nedokončil opravu lodi, je příliš brzy na to pomýšlet.
		AI_Output(self,other,"DIA_Jack_LI_Away_01_14");	//Takže, nebudeme nikam spěchat.
		AI_Output(other,self,"DIA_Jack_LI_Away_01_15");	//Dobrá, jak říkáš.
	};
};

instance DIA_JACK_LI_AWAYDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_awaydone_condition;
	information = dia_jack_li_awaydone_info;
	permanent = TRUE;
	description = "Je na čase vyplout.";
};

func int dia_jack_li_awaydone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((CANAWAYFROMLI == TRUE) && (CAPITANORDERLIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_00");	//Je na čase vyplout.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_01");	//Dobrá posádko! Zvedněte kotvu!
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_02");	//A ty by sis měl jít do své kajuty dát dvacet... (kření se) moc jsi toho určitě nenaspal za tu dobu.
		AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_03");	//Ani ne.
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_04");	//Tak vidíš. Jdi se prospat. A my vyrazíme!
		CAPITANORDERLIAWAY = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIONBOARD == TRUE) && (GORNLIHERE == TRUE) && (GORNLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_fighter_li,"RunAway");
			AI_Teleport(pc_fighter_li,"SHIP_DECK_03");
			GORNLIHEREDONE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE) && (MILTENLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_mage_li,"RunAway");
			AI_Teleport(pc_mage_li,"SHIP_CREW_19");
			MILTENLIHEREDONE = TRUE;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE) && (LESTERLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_psionic_li,"RunAway");
			AI_Teleport(pc_psionic_li,"SHIP_DECK_28");
			LESTERLIHEREDONE = TRUE;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE) && (DIEGOLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_thief_li,"RunAway");
			AI_Teleport(pc_thief_li,"SHIP_CREW_04");
			DIEGOLIHEREDONE = TRUE;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE) && (ANGARLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(djg_705_angar_li,"RunAway");
			AI_Teleport(djg_705_angar_li,"SHIP_CREW_03");
			ANGARLIHEREDONE = TRUE;
		};
		if(LICREWONBOARD == TRUE)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_06");	//Dobrá, všichni jsou už na palubě, můžeme zvednout kotvy!
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_07");	//A ty by sis měl jít do své kajuty dát dvacet... (kření se) moc jsi toho určitě nenaspal za tu dobu.
			AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_08");	//Ani ne.
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_09");	//Tak vidíš. Jdi se prospat. A my vyrazíme!
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry(TOPIC_GATHERCREW,"Celá posádka je naloděná, můžeme vyrazit!");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_11");	//Ale stále tu ještě není zbytek posádky... (překvapeně) Nemůžeme je tu nechat!
			AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_12");	//A kdo chybí?!
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_13");	//Hmmm, zdá se, že nám chybí... (rozhlíží se) ...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_14");	//... Gorn!
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_15");	//... Milten!
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_16");	//... Lester!
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_17");	//... Diego!
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_18");	//... Cor Angar!
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_19");	//Všichni jsou na místě!
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_20");	//Řeknu jim, aby se vrátili na loď.
			}
			else
			{
				AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_21");	//Řeknu mu, aby se vrátil na loď.
			};
		};
	};
};


instance DIA_JACK_LI_ISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_island_condition;
	information = dia_jack_li_island_info;
	permanent = FALSE;
	description = "Kde to jsme, a co je to za ostrov?!";
};


func int dia_jack_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_island_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Island_01_01");	//Kde to jsme, a co je to za ostrov?!
	AI_Output(self,other,"DIA_Jack_LI_Island_01_02");	//To nemám tušení příteli... Tento ostrov vidím poprvé stejně jako ty!
	AI_Output(other,self,"DIA_Jack_LI_Island_01_04");	//Zdá se, že jsem se asi vážně ztratili.
	AI_Output(self,other,"DIA_Jack_LI_Island_01_05");	//Vypadá to tak!... Jenom Innos ví, kde jsme.
	AI_Output(self,other,"DIA_Jack_LI_Island_01_06");	//Asi ano. Ještě bychom se mohli zkusit plavit kousek dál, ale obávám se, že nám to k ničemu nebude.
	AI_Output(other,self,"DIA_Jack_LI_Island_01_07");	//A co teda uděláme?
	AI_Output(self,other,"DIA_Jack_LI_Island_01_13");	//Jestli se nám podaří přijít na to, v jaké přesně prdeli jsme, tak bych nás mohl zase v klidu vrátit na původní směr.
	AI_Output(other,self,"DIA_Jack_LI_Island_01_14");	//Ale jak to provedem?!
	AI_Output(self,other,"DIA_Jack_LI_Island_01_15");	//Tak to nevím!... Pravděpodobně budeš muset jít na ostrov. A možná tam najdeš odpověď.
	MIS_LOSTISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry(TOPIC_LOSTISLAND,"Zdá se, že jsme ztratili směr, kudy plout. Náš kapitán nemá žádnou představu o tom, co je to za ostrov a ani kde se nacházíme. Takže, jediná věc co je potřeba udělat je, zachovat klid a pokusit se přijít na to, kam jsem se to dostali.");
	Log_AddEntry(TOPIC_LOSTISLAND,"Mluvil jsem s Jackem na toto téma - Po vzájemné diskusi mě vyslal na průzkum ostrova, abych tam něco našel. Nějakou stopu, vodítko, cokoliv, co nám pomůže objasnit naši situaci, ve které se nacházíme.");
};


instance DIA_JACK_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogress_condition;
	information = dia_jack_li_islandprogress_info;
	permanent = FALSE;
	description = "Podívej, našel jsem tuhle tabulku.";
};


func int dia_jack_li_islandprogress_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (Npc_HasItems(hero,itwr_lostislandmap) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_00");	//Podívej, našel jsem tuhle tabulku.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_01");	//Hmmm... (překvapeně) jaký zajímavý kousek! Vypadá to, že máš na takové věci štěstí.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_03");	//To je možné. Mimochodem, když se podíváš, jsou na ní vyryty nějaké symboly neznámého původu.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_05");	//... ukaž, podívám se... (se zájmem)
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_06");	//Na, tady.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_07");	//Hmmm... (zamyšleně) Jsou opravdu velmi zvláštní.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_08");	//No ale, když se na to podívám z jiného úhlu, tak to připomíná...
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_09");	//Co?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_10");	//Nemůžu to říct přesně ale, tahle tabulka trochu připomíná mapu.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_11");	//Mapu?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_12");	//Ano, mapu! Ale jakou polohu ukazuje, to nemohu říct.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_13");	//Zdá se, že na druhé straně jsou ještě nějaké údaje. Možná že, jsou klíčem k rozluštění té mapy!
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_14");	//A mohl bys to zkusit přeložit?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_15");	//Jo, ale vůbec nevím jak začít!... (zamyšleně) ale možná... Jsou to jen odhady, ale je možné, že tyto symboly označují zeměpisnou šířku a délku tohoto ostrova.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_18");	//Pokud se nemýlím, mohl bych celkem snadno určit naši polohu. Ale budu k tomu potřebovat sextant.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_20");	//A to je problém?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_21");	//Ano, já u sebe žádný nemám... (skepticky) a bez něj nebudu moct provést výpočty.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_22");	//Zkusím se tedy po nějakém podívat.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_23");	//Zkus to! I když, si nemyslím, že by se takovéhle věci vyskytovaly na tomhle bohem zapomenutém ostrově.
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Ukázal jsem Jackovi kamennou tabulku, kterou jsem našel na ostrově. Říkal, že ten objekt blíž prozkoumá ale už teď si myslí, že by se mohlo jednat o jakousi mapu. Mimo to, na zadní straně tabulky jsou vyryta čísla, která prý znázorňují zeměpisnou šířku a délku. Ale aby to Jack mohl potvrdit, a také provést skutečné výpočty, potřebuje k tomu sextant.");
};


instance DIA_JACK_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogressnext_condition;
	information = dia_jack_li_islandprogressnext_info;
	permanent = FALSE;
	description = "Mám ten sextant.";
};


func int dia_jack_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_00");	//Mám ten sextant.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_01");	//Opravdu?!... (překvapeně) a kde jsi ho našel?!
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_02");	//To není důležité.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_03");	//No tak dobrá příteli, jak říkáš... (potěšen) podej mi ho.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_04");	//Tady.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_05");	//Skvělé! Teď už můžu konečně rozluštit ty zvláštní symboly.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_06");	//A kolik času na to potřebuješ?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_07");	//Myslím, že... tak pár dní.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Přinesl jsem Jackovi sextant. A nyní může začít vypočítávat. A jak řekl, nemělo by to trvat dýl než pár dní.");
};


instance DIA_JACK_LI_SEARCH(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_search_condition;
	information = dia_jack_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_search_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Jack_LI_Search_01_00");	//Á, konečně ses ukázal! Dokončil jsem svoje propočty.
	AI_Output(other,self,"DIA_Jack_LI_Search_01_01");	//A na co jsi přišel?
	AI_Output(self,other,"DIA_Jack_LI_Search_01_04");	//Opravdu jsem měl pravdu, když jsem říkal, že ty symboly něco znamenají.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_05");	//Ověřil jsem to na mapě s naší původní rychlostí a směrem. Jsou tu sice malé odchylky, ale ty nastaly pravděpodobně vinou té bouře.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_06");	//A tak tedy, jsem ty odchylky nahradil těmi čísly z kamenné tabulky, co jsi donesl a provedl znovu výpočty.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_09");	//A pokud je použijeme pomocí sextantu a s mapou v určitém pořadí, tak zjistíme naši zeměpisnou polohu!
	AI_Output(self,other,"DIA_Jack_LI_Search_01_10");	//Ale samozřejmě, ty výpočty nebudou tak úplně přesné... (skepticky) ale alespoň dostaneme přibližný směr, kudy se máme plavit!
	AI_Output(other,self,"DIA_Jack_LI_Search_01_11");	//Chceš mi tím říct, že už KONEČNĚ můžeme z tohodle ostrova vypadnout?
	AI_Output(self,other,"DIA_Jack_LI_Search_01_12");	//Přesně!... Můžeme vyrazit hned, jakmile bude loď a posádka připravena! (natěšeně)
	AI_Output(other,self,"DIA_Jack_LI_Search_01_13");	//Potom tedy už neztrácejme čas...
	AI_Output(self,other,"DIA_Jack_LI_Search_01_17");	//Na, vem si tuhle mapu! Zaznamenal jsem na ni přesnou polohu tohodle ostrova.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_Jack_LI_Search_01_18");	//Pravděpodobně, tenhle kontraband bude pro nás ještě užitečný. Pokud se tedy nerozhodneš jinak - je to na tobě.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry(TOPIC_LOSTISLAND,"Jack mě informoval o tom, že dokončil svoje výpočty. A zdá se, že jsou poměrně přesné! Ta tabulka, co jsem na ostrově našel je podobná našim moderním mapám a díky ní mohl Jack určit naši přesnou polohu. Takže, odsud vypadnem hned, jakmile to bude možné.");
};


instance DIA_JACK_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_aboutisland_condition;
	information = dia_jack_li_aboutisland_info;
	permanent = FALSE;
	description = "Zajímavé, žije někdo na tomhle ostrově?";
};


func int dia_jack_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_aboutisland_info()
{
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_01");	//Zajímavé, žije někdo na tomhle ostrově?
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_02");	//Neřekl bych!... (skepticky) pravděpobodně je neobydlený.
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_03");	//Jsi si tím jistý?
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_04");	//Eh, no... To ani ne...
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_05");	//Ale když se na to podíváme logicky, tak naší přítomnost nemohla nikomu na ostrově ujít. A tedy kdyby tady někdo žil, pravděpodobně by se ukázal.
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_07");	//Navíc, krom pár ohnivých ještěrů jsme na pobřeží nikoho nezahlédli.
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_08");	//Nikdy nevíš...
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_09");	//Jo... (nervózně) nemám rád překvapení, takže mě raději hned informuj.
};


instance DIA_JACK_LI_WHEREGUYS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_whereguys_condition;
	information = dia_jack_li_whereguys_info;
	permanent = FALSE;
	description = "A kde je zbytek posádky?";
};


func int dia_jack_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_whereguys_info()
{
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_01");	//A kde je zbytek posádky?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_02");	//Většina posádky se ihned po zakotvení vylodila na pobřeží.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_03");	//Proč?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_04");	//No... říkali, že chtějí ten ostrov prozkoumat blíž.
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_05");	//I když si myslím, že je v tom něco jiného.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_06");	//To jest?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_07");	//Podle mě, mají jen nasráno v gatích! Proč by jinak nechtěli zůstat tady na lodi?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_08");	//To se mě, starýmu mořskýmu vlkovi nemůže stát... (vznešeně) Já prožil už stovky bouří!
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_09");	//A ani tahle mi bláto na hřišti neudělá!
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_10");	//Takže, když je po bouři a loď pořád stojí, (usmívá se) tak už ji nic neskolí a je to nejbezpečnější místo v okolí!
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_11");	//Alespoň že ty máš kuráž.
};


instance DIA_JACK_LI_WHEREGOLD(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregold_condition;
	information = dia_jack_li_wheregold_info;
	permanent = FALSE;
	description = "A... kam se podělo moje zlato?";
};


func int dia_jack_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregold_info()
{
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_01");	//A... kam se podělo moje zlato?
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_02");	//A jaké můj příteli?...
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_03");	//Přece ten obří náklad zlata, které jsme si odvezli z ostrova Irdorath! Loď jím byla napěchovaná!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_04");	//A co s tím?...
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_05");	//No prostě tady není!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_08");	//Promiň příteli... ale já vůbec nevím, kde by mohlo být!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_09");	//A jak bych si mohl já schovat tolik zlata do vlastní kapsy? Klidně si mě prohledej!
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_10");	//Aargh, kašli na to... A co teď?!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_11");	//To nevím!... (zmateně) Můžeš se poptat zbytku posádky, oni třeba něco budou vědět.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry(TOPIC_MISSMYGOLD,"Jack povídal, že neví kam se podělo moje zlato. Ale poradil mi, abych se poptal zbytku posádky.");
};


instance DIA_JACK_LI_MISSCOMPAS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_misscompas_condition;
	information = dia_jack_li_misscompas_info;
	permanent = FALSE;
	description = "Gorn říkal, že jsi ztratil svůj kompas.";
};


func int dia_jack_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_jack_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_01");	//Gorn říkal, že jsi ztratil svůj kompas.
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_02");	//(naštvaně) Ano, ztratil jsem ho!... Musel mi vypadnout z kapsy někdy během bouře. 
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_06");	//Asi pro tebe ten kompas hodně znamená, když jsi tak naštvaný.
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_07");	//Eh!... (smutně) Tahle maličkost má pro mě velkou cenu. Byl to dar, od mého starého přítele...
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_08");	//Vždycky jsem věřil, že mi přináší štěstí. A opravdu přinášel.
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_09");	//A teď už chápu, proč se k nám štěstí obrátilo zády.
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_10");	//A nezkoušel ses po něm podívat?
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_11");	//Samozřejmě že zkoušel!... Obrátil jsem naruby celou horní palubu, ale nikde není!
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_12");	//Takže, nejreálnější možnost je, že vypadl přes palubu do moře, a je nadobro ztracen.
	B_LogEntry(TOPIC_MISSMYGOLD,"Ptal jsem se Jacka na jeho kompas. Zdá se, že ho tato ztráta velmi poznamenala. Jak sám řekl, prohledal celou horní palubu v domnění, že ho najde, ale bohužel marně.");
};


instance DIA_JACK_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregolddone_condition;
	information = dia_jack_li_wheregolddone_info;
	permanent = FALSE;
	description = "Není tohle tvůj kompas?";
};


func int dia_jack_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_01");	//Není tohle tvůj kompas?
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_04");	//(nadšeně) Je to on! Můj kompas!... Ale, kde jsi našel?
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_06");	//Kde jsem ho našel je druhá věc.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_07");	//A kde teda?
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_08");	//Přesně tam, kde mi chybí můj náklad zlata.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_09");	//Ale... na co narážiš?... 
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_10");	//Ty o tom ztraceném zlatě určitě něco víš!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_11");	//Ale už jsem ti jednou říkal, že nemám ponětí, kam se podělo... (zmateně)
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_12");	//Na tvém místě bych raději řekl pravdu!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_13");	//Pravdu?! Hmmm... (kompletně zmatený) Ale...
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_15");	//Eh, No dobrá! Jak myslíš... Je mi líto, ale na radu většiny členů posádky, muselo být vyhozeno přes palubu...
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_17");	//Proč jste ho pro Innose vyhodili?!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_18");	//Loď se nebezpečně nakláněla, kdybychom to neudělali, bylo by teď z nás tak akorát žrádlo pro ryby.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_19");	//Ale bylo opravdu nutné vyhodit VŠECHNO zlato?!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_20");	//Promiň, ale to mi nějak nedošlo. Nepřemýšlel jsem o tom, nebylo to pro nás lehké!
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_22");	//A proč jste to přede mnou chtěli zatajit?
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_23");	//Nechtěli jsme se o tom zmiňovat, protože jsme věděli, že budeš hodně naštvaný.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_25");	//Máte štěstí, že jsem celkem klidná osobnost!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_26");	//Příteli!... (usmívá se) Na tvém místě bych nebyl zas až tak naštvaný.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_27");	//Zlato je pomíjivé a ještě budeš mít hodně času na to, abys zbohatnul.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_28");	//Je lepší děkovat Innosovi, že nám pomohl přežít tu bouři. To je mnohem důležitější!
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_29");	//No, asi máš pravdu.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_30");	//A je načase, ukončit tento rozhovor a věnovat se důležitějším věcem.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_MISSMYGOLD,"Teď už je všechno jasné - Moje zlato prostě vyhodili přes palubu během bouře, protože loď byla až moc přetížená. Bylo to nouzové řešení. Chlapci o tom nechtěli mluvit, protože si mysleli, že bych mohl být hodně naštvaný a měli pravdu. Ale protože nám tím zachránili život, nemám právo být na ně naštvaný. Já se s tou ztrátou už nějak vyrovnám.");
};


instance DIA_JACK_LI_HALLO(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 4;
	condition = dia_jack_li_hallo_condition;
	information = dia_jack_li_hallo_info;
	permanent = TRUE;
	description = "Všechno v pohodě?";
};


func int dia_jack_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_aboutisland) && Npc_KnowsInfo(hero,dia_jack_li_whereguys) && Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_hallo_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Hallo_15_00");	//Všechno v pohodě?
	AI_Output(self,other,"DIA_Jack_LI_Hallo_01_01");	//Co vím tak ano.
};


instance DIA_JACK_LI_BRINGFOODDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddone_condition;
	information = dia_jack_li_bringfooddone_info;
	permanent = FALSE;
	description = "Jak to vypadá se zásobami?";
};


func int dia_jack_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && ((Npc_HasItems(hero,ItFoMuttonRaw) >= 24) || (Npc_HasItems(hero,ItFoMutton) >= 24)))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_01");	//Jak to vypadá se zásobami?
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_02");	//Nic moc, za chvilku budeme na suchu. Proč se ptáš?
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_04");	//Někteří členové posádky si stěžují, že jsi jim snížil příděly jídla.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_06");	//Bohužel, jsem neměl na výběr. Jídla je opravdu málo. Někteří jsou takový žrouti, že jim obyčejný příděl nestačí...
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_08");	//Hlavně, takovej Gorn! Pokud se on dostane na poslední zásoby jídla tady na galéře, je schopný to všechno spořádat.
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_12");	//Žádný strach, přinesl jsem ti 60 kusů čerstvého masa.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_13");	//Masa? Ty jsi ho šel nalovit?!
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_14");	//Jo, řekněme, že jsem na tomto ostrově trochu upravil stavy. Tady, vem si ho!
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_19");	//Ne, ne, ne!... (podrážděně) Takhle přece ne! Takhle se to nedá jíst.
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_20");	//Ale proč?
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_21");	//Musí se nejdříve zpracovat, chceš abychom se udávili syrovým masem? Ale já na jeho upečení nemám čas.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_22");	//Já se musím soustředit na opravy lodě! Navíc pečené nám vydrží déle!
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_23");	//Takže, jdi do podpalubí a opeč na plotně všechno maso... A až to budeš mít, tak mi ho zase přines.
	B_LogEntry(TOPIC_BRINGFOOD,"Jack byl překvapen, kolik jsem mu dal čerstvého masa. Nicméně, i tak si ho nevzal. To maso je potřeba opéct a on na to nemá čas. Mám tedy jít do lodní kuchyňky a všechno maso opéct a pak mu ho zase dát!");
};


instance DIA_JACK_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddoneext_condition;
	information = dia_jack_li_bringfooddoneext_info;
	permanent = FALSE;
	description = "Mám to opečené maso.";
};


func int dia_jack_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddoneext_info()
{
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_01_01");	//Mám to opečené maso.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_01_02");	//Dobrá, dej mi ho.
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jack_li_bringfooddoneext,"Na, tady... (dát 14 kusů masa)",dia_jack_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jack_li_bringfooddoneext,"Na, tady... (dát 24 kusů masa)",dia_jack_li_bringfooddoneext_sixty);
};

func void dia_jack_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_00");	//Na tady.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_01");	//Hmmm... (zamyšleně) A kde je zbytek? Zdá se mi, že jsi mi přinesl míň masa, než bylo dohodnuto.
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_03");	//Rozhodl jsem se pro menší příděly.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_04");	//No teda! Nevypadáš na to, že bys byl schopen toho tolik spořádat.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_09");	//No, byl jsi to ty, kdo ho nalovil...
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_11");	//Já prostě jen chtěl zvýšit o něco příděly pro naši posádku. Byli celí pohublí když jsem je viděl.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_13");	//Ale dobrá, už o tom nemluvme. V každém případě, díky.
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Jackovi pečené maso, pravda je, že jsem nezapomněl ani na Gorna! Jack byl trochu naštvaný, že nemůže zvýšit příděly jídla posádce, ale teď už je to jedno.");
};

func void dia_jack_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_00");	//Na, tady máš.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_01");	//Skvělé! Teď můžu nakrmit celou posádku a ještě nám zbyde hodně na další dny.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_02");	//Krom toho, můžu trochu zvýšit příděly jídla mezi ostatní členy posádky.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_03");	//Pro některé, kteří pár dní skoro drželi hladovku to bude skvělá zpráva!
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Jackovi ono pečené maso, a teď už konečně může nakrmit celou posádku a taky jim o něco zvýšit příděly.");
};


instance DIA_JACK_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecave_condition;
	information = dia_jack_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Mám nějaké zajímavé novinky.";
};


func int dia_jack_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_01");	//Mám nějaké zajímavé novinky.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_02");	//Opravdu? A o čem?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_03");	//Našel jsem na ostrově jeskyně se spoustou nalezišť magické rudy.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_04");	//Opravdu?... (překvapeně)
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_05");	//Jo, o tom nepochybuj! Řekl bych, že ty doly jsou tím ostrovem doslova protkány.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_06");	//Hmmm... (zamyšleně) To jsou opravdu zajímavé zprávy.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_07");	//Naleziště magické rudy, to je hodně velká rarita! Zvláště jak říkáš, v takovém množství.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_08");	//Jak asi víš, nejznámější a jediné naleziště rudy je v Hornickém údolí.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_09");	//Takže, pokud máš pravdu, je tohle velký objev!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_10");	//Ale v dnešní době potřebuješ důkazy, aby ti někdo věřil... (pochybuje) Možná sis jenom popletl rudu s obyčejným magickým kamínkem.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_11");	//Tak co mám tedy udělat, abys mi věřil?
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_12");	//Hmmm... (přemýšlí) Možná by stačilo, kdybych tu horninu viděl na vlastní oči!
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_13");	//Tak pojď se mnou! Ukážu ti jednu z těch jeskyní.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_14");	//To ne, neopustím tuhle loď... (usmívá se) Na tohle teď vážně nemám čas.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_15");	//Krom toho, jsem stále nedokončil opravu lodi!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_16");	//Takže, pokud ti to nevadí, mohl bys mi přinést ukázat kousek té magické horniny, kterou si tady našel.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_17");	//Myslím si, že to bohatě postačí na potvrzení tvých slov.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_18");	//Tak dobrá! Zkusím ti vykutat vzorek.
		LITESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Jackovi, že jsem na ostrově našel velká naleziště magické rudy. Byl trochu zaskočen a moc mi nevěřil, chce důkaz. Požádal mě, ať mu ukážu kousek té rudy.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_19");	//V jedné z jeskyní na ostrově, jsem našel velké naleziště magické rudy.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_20");	//Pravděpodobně, to ale není jediné naleziště. Je tam toho spousta!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_21");	//Hmmm... (přemýšlí) To jsou opravdu zajímavé zprávy.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_22");	//Naleziště magické rudy... Velmi zajímavý objev! Zvlášť v takovém množství.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_23");	//Jak asi víš, nejznámější a jediné naleziště rudy je v Hornickém údolí.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_24");	//Takže, pokud máš pravdu, je tohle velký objev!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_25");	//Ale v dnešní době potřebuješ důkazy, aby ti někdo věřil... (pochybuje) Možná sis jenom popletl rudu s obyčejným magickým kamínkem.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_26");	//Krom toho, jedna jeskyně ještě neznamená, že je tu celé naleziště.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_27");	//Může to být jen náhoda.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_28");	//Co mám tedy udělat?
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_29");	//Na tvém místě bych ostrov ještě jednou důkladněji prohledal.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_30");	//Možná že, pak budem vědět o téhle 'rudě' víc, tedy, o dalších nalezištích!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_31");	//Takže, až najdeš něco dalšího, pak mi to přijď ohlásit.
		LIBEFORETESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Informoval jsem Jacka, o nalezišti magické rudy na ostrově. Má silné pochybnosti o mém tvrzení, tak mě požádal, abych ostrov ještě jednou důkladně prozkoumal a případně našel další naleziště.");
	};
};


instance DIA_JACK_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecaveprogress_condition;
	information = dia_jack_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = "Prohledal jsem ostrov.";
};


func int dia_jack_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_01");	//Prohledal jsem ostrov...
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_02");	//A?
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_03");	//... Našel jsem ještě jednu jeskyni. Bylo v ní ještě víc rudy, než v té první!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_04");	//Hmmm... (zamyšleně) Jsi si tím jistý?
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_05");	//To mi jako nevěříš?!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_06");	//No, popravdě moc ne!... Prostě, tomu nějak moc nevěřím!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_07");	//A co mám tedy udělat, abys mi uvěřil?!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_08");	//Hmmm... (přemýšlí) možná že, kdybych tu 'rudu' viděl na vlastní oči, přehodnotil bych situaci!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_09");	//Tak pojď se mnou! Ukážu ti jednu z těch jeskyní.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_10");	//To ne, neopustím tuhle loď... (usmívá se) na tohle teď vážně nemám čas.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_11");	//Krom toho, jsem stále nedokončil opravu lodi!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_12");	//Takže, pokud ti to nevadí, mohl bys mi přinést ukázat kousek té magické horniny, kterou si tady našel.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_13");	//Myslím si, že to bohatě postačí na potvrzení tvé teorie.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_14");	//Dobrá, jdu na to.
	LITESTOK = TRUE;
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Jackovi o dalších nalezištích magické rudy. Moc mi nevěří, a tak mě požádal, ať mu donesu ukázat vzorek této magické rudy, aby se ujistil, že mluvím pravdu.");
};


instance DIA_JACK_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecavedone_condition;
	information = dia_jack_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti ten kus magické rudy.";
};


func int dia_jack_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (TESTNUGGETGAVE == TRUE) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_01");	//Přinesl jsem ti ten kus magické rudy.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_02");	//To je skvělé!... (se zájmem) Ukáž!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_03");	//Tady, posluž si.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_04");	//Hmmm... (velmi překvapeně) Ano, měl jsi pravdu!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_05");	//Je to opravdu magická ruda. A když se tak dívám, je v dost dobré kvalitě!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_06");	//Takže už mi věříš?!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_07");	//Ano a omlouvám se, že jsem ti nevěřil. Prostě neuvěřím něčemu, co neuvidím na vlastní oči!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_08");	//Chápu.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Přinesl jsem Jackovi kus magické rudy, kterou jsem vykutal z ložiska. Po tomhle důkazu už mi konečně věří.");
};


instance DIA_JACK_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecourse_condition;
	information = dia_jack_li_changecourse_info;
	permanent = FALSE;
	description = "A co budeme dělat teď?";
};


func int dia_jack_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jack_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_01_01");	//A co budeme dělat teď?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_03");	//Samozřejmě, že se takové množství rudy dá využít. V lepším případě za ni můžeme dostat hromadu zlata!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_01_05");	//To zní dobře!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_06");	//Jo!... (zamyslí se) Je jenom na nás, jak s ní naložíme!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_07");	//Ale... naše loď ji všechnu neuveze!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_08");	//Krom toho, ještě se musí vytěžit. A na to bychom potřebovali armádu kopáčů.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_09");	//Takže... Napadá tě něco?!
	Info_ClearChoices(dia_jack_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jack_li_changecourse,"Myslím si, že bychom o tom měli informovat lorda Hagena!",dia_jack_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jack_li_changecourse,"Můžeme tento ostrov prodat paladinům!",dia_jack_li_changecourse_sell);
	Info_AddChoice(dia_jack_li_changecourse,"Můžeme tu rudu zkusit vytěžit.",dia_jack_li_changecourse_here);
};

func void dia_jack_li_changecourse_paladin()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_01");	//Myslím si, že bychom o tom měli informovat lorda Hagena!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_02");	//Cože?!... (překvapeně) Dát rudu paladinům?!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_03");	//Oni ji potřebují víc než my! S takovým množstvím rudy to pro ně může znamenat zvrat v tého válce.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_04");	//A co z toho?!... Stejně ji už tak mají ztracenou!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_05");	//Stále nevíme, jak to vypadá na kontinentu, ale co jsem slyšel, tak už jsou skřeti před branami hlavního města!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_06");	//Pokud ano, tak už přece nemáme co ztratit.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_07");	//Eh... No dobrá, ať je tedy po tvým.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_08");	//V tom případě, bychom se měli vrátit na Khorinis. Myslím si, že tato myšlenka bude pro většinu chlapů studenou sprchou...
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_10");	//Zkusím je přemluvit!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_11");	//Dobrá, tak to udělej, jsem na jejich názory zvědavej.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_12");	//V každém případě, je potřeba položit obě možnosti a musí si vybrat jednu z nich, tak to bude nejlepší!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_13");	//Rozumím!
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Teď je pro nás důležité, co uděláme s tou rudou, kterou jsme našli na tomto tajemném ostrově! Naznačil jsem Jackovi, že bychom se mohli vrátit do Khorinisu a říct o něm paladinům. Ale z neznámého důvodu se tato myšlenka kapitánovi nezdá. A tak jsme dospěli k názoru, že bude nejlepší demokratické hlasování všech členů posádky. Jedině tak situaci vyřešíme!");
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_sell()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_01");	//Můžeme tento ostrov společně s rudou prodat!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_02");	//Zajímavé... (s pochybnostmi) A a kdo by ho odkoupil?
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_04");	//Možná paladinové?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_05");	//Hmmm... (zamýšlí se) To rozhodně není špatný nápad!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_06");	//Vzhledem k jejich situaci za to ještě moc rádi zaplatí!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_07");	//Ale naskýtá se otázka, kterému z nich? Kdo by přijmul naši nabídku?
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_08");	//Možná bych to mohl zkusit u lorda Hagena.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_10");	//Jako vždy, máš asi pravdu... (souhlasně) Ale nemyslím si, že takové důležité rozhodnutí bychom měli dělat bez informování posádky.
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_13");	//Zkusím se s nimi dohodnout.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_14");	//Dobrá, tak to udělej, jsem na jejich názory zvědavej.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_15");	//V každém případě, je potřeba položit obě možnosti a musí si vybrat jednu z nich, tak to bude nejlepší!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_16");	//Rozumím!
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Teď je pro nás důležité, co uděláme s tou rudou, kterou jsme našli na tomto tajemném ostrově! Napadlo mě, že bychom mohli ostrov i s rudou prodat paladinům. Samozřejmě, že to kapitána moc potěšilo, ale na druhou stranu, bychom se museli vrátit na Khorinis a proto je nutné, poradit se o tom se zbytkem posádky. Jedině tak situaci vyřešíme!");
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_here()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Here_01_01");	//Můžeme tu rudu zkusit vytěžit, a naložit na loď.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_02");	//Hmmm... (přemýšlí) Nemyslím si, že je to dobrý nápad.
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Here_01_03");	//Proč?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_04");	//Protože, kdybys byl v dole od rána do noci s krumpáčem, než bys vytěžil co i jen jednu bednu, dřív by ti upadli ruce.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_05");	//Na vytěžení tolik rudy, kolik zamýšlíš, jsou potřeba roky! A to ještě se zkušenými kopáči.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_06");	//Krom toho, nechci strávit zbytek života na tomto ztraceném ostrově.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_08");	//Proto bude nejlepší, když na tento nápad ihned zapomeneš.
};


instance DIA_JACK_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecoursedone_condition;
	information = dia_jack_li_changecoursedone_info;
	permanent = FALSE;
	description = "Mluvil jsem s celou posádkou.";
};


func int dia_jack_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_changecoursedone_info()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_01");	//Mluvil jsem s celou posádkou.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_02");	//A co říkali?... (se zájmem)
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_03");	//Většina z nich souhlasila plavit se zpět na Khorinis a informovat paladiny.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_05");	//No, tak dobrá... pokud se tak rozhodla většina, učiníme tak!
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_06");	//Zůstává otázka, jestli to lord Hagen opravdu přijme, tedy, jestli nám to uvěří.
		B_LogEntry(TOPIC_CHANGECOURSE,"Výsledky jsou takové, že se většina posádky rozhodla vrátit zpět na Khorinis a informovat paladiny o tomto ostrově a jeho zásobě magické rudy.");
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_10");	//Většina z nich souhlasila plavit se zpět na Khorinis a prodat ostrov i s rudou paladinům.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_12");	//Tak se mi to líbí... (usmívá se) je to férové, a já nic jiného taky neočekával!
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_13");	//Odkud máš takovou důvěru?!
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_14");	//Je to velmi prosté. Nikdo nechce riskovat svůj život nadarmo!
		B_LogEntry(TOPIC_CHANGECOURSE,"Výsledky jsou takové, že se většina posádky rozhodla vrátit zpět na Khorinis a prodat ostrov i s rudou paladinům. Zdá se, že je čas vyrazit!");
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_16");	//Výsledky jsou nerozhodné! Půlka chce ostrov prodat paladinům, druzí jsou proti.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_17");	//Hmmm... (zamyslí se) Nelehká situace!
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_18");	//Tak co teda uděláme?
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_19");	//To nevím! V každém případě bychom se měli vrátit, a naplno se rozhodnout až tam dorazíme.
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_20");	//Dobrá.
		B_LogEntry(TOPIC_CHANGECOURSE,"Výsledek je nerozhodný, půlka posádky se rozhodla vrátit zpět na Khorinis a prodat ostrov i s rudou paladinům, druhá půlka je proti! Ale i přesto jsme se s Jackem rozhodli vrátit se zpět na Khorinis, a až tam vyřešit tuhle situaci.");
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


