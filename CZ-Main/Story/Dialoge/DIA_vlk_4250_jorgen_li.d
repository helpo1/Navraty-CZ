/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int dia_jorgen_li_bringfooddone_condition - upraveny podmínky dialogu

*/



instance DIA_JORGEN_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 999;
	condition = dia_jorgen_li_kap3_exit_condition;
	information = dia_jorgen_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jorgen_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_LI_PICKPOCKET(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 900;
	condition = dia_jorgen_li_pickpocket_condition;
	information = dia_jorgen_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jorgen_li_pickpocket_condition()
{
	return C_Beklauen(76,120);
};

func void dia_jorgen_li_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
	Info_AddChoice(dia_jorgen_li_pickpocket,Dialog_Back,dia_jorgen_li_pickpocket_back);
	Info_AddChoice(dia_jorgen_li_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_li_pickpocket_doit);
};

func void dia_jorgen_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};

func void dia_jorgen_li_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};


instance DIA_JORGEN_LI_STORM(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_storm_condition;
	information = dia_jorgen_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_storm_condition()
{
	return TRUE;
};

func void dia_jorgen_li_storm_info()
{
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_01");	//Konečně jsi přišel k sobě! Jak se cítíš?!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_02");	//Normálně, jen hlava mi třeští, jako kdybych se praštil.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_03");	//No, to opravdu praštil!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_04");	//Co se stalo?!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_05");	//Pravděpodobně si toho moc nepamatuješ.
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_06");	//Jo, to je pravda.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_07");	//Hmm... (vážně) V průběhu bouře se podělalo kormidlo a všechno bylo v hajzlu...
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_08");	//Ale aby toho nebylo málo, přišla jedna velká vlna a narazila do lodi!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_09");	//Pravděpodobně to bude důvod, proč ses tak praštil.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_11");	//Na poslední chvíli jsme tě s ostatníma donesli sem.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_12");	//Jinak by vlna smetla tvý tělo z paluby.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_13");	//Tahle bouře nás málem všechny zabila!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_14");	//Ale zvládli jsme to, ne?
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_15");	//Ano, zvládli! Díky Innosovi, že nás dovedl na tento ostrov!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_16");	//Ještě chvíli a loď by se přelomila!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_17");	//To by bylo po nás!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_18");	//Jo, ale teď budou problémy s opravou lodi...
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_20");	//Eh, to jo... Tahle bouře ale naší loď pocuchala trochu více!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_21");	//Ale alespoň teď jsme v relativním bezpečí.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_23");	//To už je jedno, loď je na sračky. Teda, téměř...
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_24");	//A jak jí jako opravíme?!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_25");	//Prvně musíme zhodnotit škody.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_26");	//Pár prken není problém, ale kormidlo je v háji a bez něj nikam nedoplujem!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_27");	//A jak dlouho nám potrvá oprava?!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_28");	//Nevím... Pár dní, týden. Přesně se to říct nedá!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_29");	//Rozumím.
};


instance DIA_JORGEN_LI_REPAIR(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repair_condition;
	information = dia_jorgen_li_repair_info;
	permanent = FALSE;
	description = "Můžu ti nějak pomoci s opravou?";
};


func int dia_jorgen_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repair_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Repair_01_01");	//Můžu ti nějak pomoci s opravou?
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_02");	//Ty?! Hmm... (zaskočen) To nevím.
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_03");	//Pro začátek musíme zkontrolovat rozsah poškození a teprve potom můžeme přemýšlet nad opravou.
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_04");	//Takže teďka mi tvá pomoc k ničemu nebude, možná později...
	AI_Output(other,self,"DIA_Jorgen_LI_Repair_01_05");	//Jasně.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry(TOPIC_REPAIRSHIP,"Nabídl jsem Jorgenovi pomoc s opravou lodi. On mi ale řekl, že nejdřív musí zhodnotit všechny škody. Měl bych si s ním promluvit později.");
};


instance DIA_JORGEN_LI_REPAIRHELP(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelp_condition;
	information = dia_jorgen_li_repairhelp_info;
	permanent = FALSE;
	description = "Jak pokračuje oprava?";
};


func int dia_jorgen_li_repairhelp_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelp_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_01");	//Jak pokračuje oprava?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_02");	//To je dobře, že se ptáš - budu potřebovat tvou pomoc.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_03");	//Klidně.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_04");	//Takže k věci!
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_05");	//Zhodnotil jsem poškození a došel k závěru, že většina je celkem zanedbatelná.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_06");	//Vpohodě to zvládnem!... (úsměv) Ale máme jeden velký problém! Jak jsem předpokládal, tak kormidlo je v prdeli!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_07");	//A co je s ním?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_08");	//Nefachá! Je v něm neco rozlámaný.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_09");	//A jak jistě chápeš, tak bez něj nedojedeme ani do řite psí mateři!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_10");	//A co tedy budeme dělat?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_11");	//Myslím si, že problém je v jednom z ozubených kol.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_12");	//Pravděpodobně se rozlomilo pod tlakem vln na zadní část kormidla.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_13");	//Musíme najít náhradu, jinak to nepůjde.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_14");	//Ale kde vezmeme nový kolečko?!
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_15");	//To asi nikde, budeme muset použít jakýkoliv svinstvo, co najdem!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_16");	//To nebude jednoduché.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_17");	//Chápu, ale nic jinýho se dělat nedá!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_18");	//Dobrá, po něčem se poohlédnu.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_19");	//Výborně, já se zatím postarám o další veci.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_20");	//Dobrá.
	B_LogEntry(TOPIC_REPAIRSHIP,"Jorgen mě požádal o pomoc s opravou kormidla. Podle jeho slov se podělalo jedno z ozubených koleček u zadní části kormidla! Jorgen mě požádal, abych se podíval po jakékoliv přijatelné náhradě.");
};


instance DIA_JORGEN_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelpdone_condition;
	information = dia_jorgen_li_repairhelpdone_info;
	permanent = FALSE;
	description = "Něco jsem našel.";
};


func int dia_jorgen_li_repairhelpdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_jorgen_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_01");	//Něco jsem našel.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_02");	//Co přesně?!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_03");	//Koukni.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_04");	//Zajímavý, kde jsi to vyhrabal?!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_05");	//Bylo to na vrcholku malý pyramidy tady na ostrově.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_06");	//To není špatné.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_07");	//Půjde to použít?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_08");	//Hmm... To uvidíme.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_09");	//Takže?!
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_10");	//No, nevěřím svým očím!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_11");	//Takže kormidlo je opravené?!
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_12");	//Počkej chvíli, ještě to zkontroluji!
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_13");	//A?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_14");	//Ano, nyní to je funkční.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_15");	//Hlavní věc je nyní dostat se z ostrova!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_16");	//To jsou výborné zprávy. Kdy odplouváme?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_REPAIRSHIP,"Donesl jsem Jorgenovi součástku do mechanizmu kormidla. Perfektně seděla.");
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_17");	//Hned!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_18");	//Musíme dát vědet chlapům na pláži.
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_19");	//Přece je zde nenecháme!
			AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_20");	//Jasně, zajdu pro ně.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry(TOPIC_GATHERCREW,"Jorgen si myslí, že bych měl dát vědět chlapům na pobřeží, že už můžeme odplout.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_21");	//Takže jen řekni a zvedáme kotvy... (smích)
			AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_22");	//Výborně.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_23");	//Ne tak rychle, chlape!... Kormidlo je, ale neznamená to, že je připraven i zbytek lodi.
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_24");	//Neměl jsem dost času opravit ostatní, menší, trhliny, takže to by byla zasraně nebezpečná plavba!
		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_25");	//A hlavně, když ješte nevíme, kde jsme!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_26");	//A ještě ani nevíme, kam poplujeme.
		};
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_27");	//Takže nijak nespěchej!
		AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_28");	//Když to říkáš.
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_29");	//Říkám.
	};
};


instance DIA_JORGEN_LI_AWAY(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_away_condition;
	information = dia_jorgen_li_away_info;
	permanent = TRUE;
	description = "Kdy vyplujeme?";
};


func int dia_jorgen_li_away_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_SUCCESS) && (CANAWAYFROMLI == FALSE) && (TORLOFLITIMERAWAY <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_away_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Away_01_00");	//Kdy vyplujeme?
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_01");	//Hned!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_02");	//Jen zavolej posádku z pobřeží.
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_03");	//Přece je zde nenecháme!...
			AI_Output(other,self,"DIA_Jorgen_LI_Away_01_04");	//Dám jim vědět.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry(TOPIC_GATHERCREW,"Jorgen mi řekl, abych chlapům na pevnině řekl, že odplouváme.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_05");	//Stačí říci a zvedáme plachty... (úsměv)
			AI_Output(other,self,"DIA_Jorgen_LI_Away_01_06");	//Dobře.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else if(MIS_LOSTISLAND == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_07");	//Ale stále nevíme, kde jsme!
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_08");	//Takže není o čem přemýšlet.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_09");	//Podívám se po něčem, co nám pomůže.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_10");	//Ale ještě jsme se nedohodli kam plout!
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_11");	//Takže bychom o tom měli rychle popřemýšlet.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_12");	//Když to říkáš.
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_13");	//Dokud nedokončíme opravy lodi, nikam se nejede.
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_14");	//Ani bychom se nevzdálili od ostrova.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_15");	//Jasně...
	};
};


instance DIA_JORGEN_LI_AWAYDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_awaydone_condition;
	information = dia_jorgen_li_awaydone_info;
	permanent = TRUE;
	description = "Čas vyrazit.";
};


func int dia_jorgen_li_awaydone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((CANAWAYFROMLI == TRUE) && (CAPITANORDERLIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_00");	//Čas vyrazit.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_01");	//Výborně, vyrážíme.
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_02");	//Heh, nejsi za posledních pár dní trochu unavenej?!
		AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_03");	//Jen trochu.
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_04");	//Tak jdi do své kajuty a vyspi se!
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
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_06");	//Ale měli by se vrátit chlapi z pevniny.
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_07");	//A neměl by sis trochu odpočinout ve své kajutě? Musíš být hodně unavenej!
			AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_08");	//Tak trochu.
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_09");	//Tak se jdi vyspat, brzo odplouváme!
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry(TOPIC_GATHERCREW,"Všichni jsou na palubě!");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_11");	//Všichni ne... Přece je tu nenecháme!
			AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_12");	//A kdo chybí?!
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_13");	//...(rozhlíží se)...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_14");	//... Gorn
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_15");	//... Milten
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_16");	//... Lester
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_17");	//... Diego
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_18");	//... Angar
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_19");	//Ostatní jsou na lodi!
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_20");	//Už pro ně jdu.
			}
			else
			{
				AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_21");	//Už pro ně jdu.
			};
		};
	};
};


instance DIA_JORGEN_LI_ISLAND(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_island_condition;
	information = dia_jorgen_li_island_info;
	permanent = FALSE;
	description = "Víš co je tohle za ostrov?";
};


func int dia_jorgen_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_island_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_01");	//Víš co je tohle za ostrov?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_02");	//Stejně jako ty ho vidím poprvé v životě!
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_03");	//Takže nemám páru kde leží.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_04");	//To jsme to celkem vážně posrali.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_05");	//Jen Innos ví, kde jsme skončili.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_06");	//Jasně, můžeme zkusit plout někam do prdele, ale nemyslím si, že je to dobrý nápad.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_07");	//A co teda budeme dělat?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_08");	//To je těžká otázka...
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_09");	//Nějaké nápady co v této situaci dělat?!
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_10");	//Hmm... (zaskočen) No, jestli, tak jen jeden.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_11");	//A to?!
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_12");	//Zkusit zjistit, kde to jsme.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_13");	//Jestli zjistíme polohu alespoň části moře, ve kterém jsme, v pohodě se vrátíme.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_14");	//A jak to mám udělat?!
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_15");	//Nemám tucha, zkus projít ostrov.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_16");	//Myslím, že jiná cesta, jak získat odpovědi na otázky není!
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_17");	//Výbornej nápad...
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_18");	//No, tys lepší neměl.
	MIS_LOSTISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry(TOPIC_LOSTISLAND,"Kapitán neví, kde jsme, takže bych se na ostrově měl podívat po jakékoliv věci, která by nám mohla prozradit polohu.");
	Log_AddEntry(TOPIC_LOSTISLAND,"Když budu postupně prohledávat ostrov, musím na něco narazit!");
};


instance DIA_JORGEN_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogress_condition;
	information = dia_jorgen_li_islandprogress_info;
	permanent = FALSE;
	description = "Podívej, našel jsem tuhle tabulku.";
};


func int dia_jorgen_li_islandprogress_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (Npc_HasItems(hero,itwr_lostislandmap) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_00");	//Podívej, našel jsem tuhle tabulku.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_01");	//Hmm... Zajímavý kousek!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_02");	//Ale co znamenají tady ty vrypy...
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_03");	//Možná ty symboly znamenají něco důležitého.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_04");	//Co to znamená, to vůbec nevím.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_05");	//Ukaž mi ji pořádně... (se zájmem)
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_06");	//Chytej.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_07");	//Hmm... To je opravdu divné.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_08");	//No, vypadá to čím dál více jako...
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_09");	//Jako co?!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_10");	//Možná to tak není, ale ten šutr připomíná mapu.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_11");	//Mapu?!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_12");	//Jo, mapu! Ale co ukazuje, to nevím.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_13");	//Možná ty figurky kolem jsou klíčem!
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_14");	//A jak je chceš použít k rozluštění té mapy?!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_15");	//To ještě nevím... Možná bych měl jeden nápad.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_17");	//Jen hádám, ale možná ty figurky určují zeměpisnou šířku a délku tohoto ostrova.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_18");	//Jestli to tak opravdu je, mohlo by nás to odsud dostat.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_19");	//Ale potřeboval bych sextant.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_20");	//A to je problém?!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_21");	//Jo, ztratil se uprostřed bouře a bez něj proste nedokážu provést ty výpočty.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_22");	//No, po nějakým se ti podívám.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_23");	//Zkus to, ale nemyslím si, že na tomhle ostrově bys nejaký našel.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_24");	//Ale možná... Kdo ví!
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Ukázal jsem Jorgenovi kamennou tabulku, kterou jsem našel na ostrově. Podle nej připomíná námořní mapu. Jsou tam i nějaké figurky, které považuje za klíč k zemepisné šířce a délce, ale bez sextantu jí nikdy nenameří. Musím se po nějakém podívat.");
};


instance DIA_JORGEN_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogressnext_condition;
	information = dia_jorgen_li_islandprogressnext_info;
	permanent = FALSE;
	description = "Splašil jsem sextant.";
};


func int dia_jorgen_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_00");	//Splašil jsem sextant.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_01");	//Opravdu? Ale kde?!
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_02");	//To není důležité.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_03");	//Dobrá, dej mi ho.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_04");	//Tady.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_05");	//Výborně, nyní ho můžu použít k výpočtům.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_06");	//A jak dlouho ti to potrvá?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_07");	//Nanejvýš pár dní.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_08");	//Dobrá, počkám.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Donesl jsem Jorgenovi sextant. Nanejvýš za dva dny by měl mít výpočty hotové.");
};


instance DIA_JORGEN_LI_SEARCH(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_search_condition;
	information = dia_jorgen_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_search_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_00");	//Dobře, že jsi tady - už jsem dokončil výpočty.
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_01");	//A jak jsme na tom?!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_02");	//Vůbec ne špatně... (smích) Nádherně!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_04");	//Vypadá to, že když jsem si myslel, že ty symboly něco znamenají, byla to pravda!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_05");	//Podle mapy jsme vpluli do oblasti, kde už moc bouří není.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_06");	//A není to ani moc daleko od našeho původního kurzu - podle mých výpočtů.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_07");	//Vlastně je to hodně blízko!... (nadějně)
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_08");	//Opravdu?!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_09");	//A tady, to je místo, kde bychom měli být.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_10");	//Samozřejmě, že mé výpočty nejsou úplně přesné, ale alespoň víme, kam plout!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_11");	//Takže až budeme chtít, můžeme odplout?!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_12");	//Jakmile bude naše loď připravena, můžeme.
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_13");	//To jsou opravdu dobré zprávy!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_14");	//Taky bych řekl!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_15");	//Pak už nesmíme ztrácet čas.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_16");	//Lépe bych to neřekl.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_17");	//Na, vezmi si tuhle mapu.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_18");	//Možná ji využiješ.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry(TOPIC_LOSTISLAND,"Jorgen mi řekl, že už dokončil výpočty. To, co jsem mu přinesl, byla opravdu mapa a dokázal zjistit, že jsme kousek od našeho původního kurzu, v místě, kde už se nevyskytují tak velké bouře, jako byla ta, co nás stihla cestou sem.");
};


instance DIA_JORGEN_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_aboutisland_condition;
	information = dia_jorgen_li_aboutisland_info;
	permanent = FALSE;
	description = "Zajímavé, žije zde na ostrově někdo?";
};


func int dia_jorgen_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_island))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_aboutisland_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_01");	//Zajímavé, žije zde na ostrově někdo?
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_02");	//Navryadli!... Pravděpodobně je neobydlený.
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_03");	//Jseš si tím jistý?!
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_04");	//Eh, ne, ale nikdo se zatím neukázal!
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_05");	//Už bychom to dávno věděli.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_06");	//Jestli zde někdo je, bojí se nás.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_07");	//Kromě tlupy ještěrů na pobřeží se nic neukázalo.
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_08");	//Vše se může změnit.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_09");	//Může... Ale to bych byl hodně překvapen!
};


instance DIA_JORGEN_LI_WHEREGUYS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_whereguys_condition;
	information = dia_jorgen_li_whereguys_info;
	permanent = FALSE;
	description = "Kde jsou všichni chlapi?!";
};


func int dia_jorgen_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_whereguys_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_01");	//Kde jsou všichni chlapi?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_02");	//Šli na pobřeží, protáhnout se po plavbě. Teda jen nekteří.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_03");	//Proč?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_04");	//No... Některým plavba nesedla.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_05");	//Teda myslím.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_06");	//Cože?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_07");	//Dobře, prostě jsem je vyhodil - kompletně zblili palubu...
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_08");	//Tohle se mi v životě nestalo!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_09");	//A na souši jim to alespoň přestane.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_10");	//A taky tam maj alespoň sucho!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_11");	//Zrovna na ně tyhle podmínky nejsou.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_12");	//Jasně.
};


instance DIA_JORGEN_LI_WHEREGOLD(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregold_condition;
	information = dia_jorgen_li_wheregold_info;
	permanent = FALSE;
	description = "A kde je moje zlato?";
};


func int dia_jorgen_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregold_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_01");	//A kde je moje zlato?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_02");	//Tvoje co, příteli?!... (nechápavě)
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_03");	//Velká hromada zlata, kterou jsme odvezli z Irdorathu. Byla ho plná loď!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_04");	//A co já s ním?!... (udiveně)
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_05");	//Není tu!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_06");	//Opravdu?... (ještě více udiveně) A kde je?!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_07");	//To bych chtěl taky vědět! Proste zmizelo.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_08");	//Promiň, příteli, ale nevím, kde by mohlo být!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_09");	//Taková hromada se jen tak nepřehlídne, myslíš si snad, že jsem ji narval do kapsy?!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_10");	//No, to ne... Ale co mám jako dělat?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_11");	//Nevím, zeptej se ostatních.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry(TOPIC_MISSMYGOLD,"Jorgen říká, že o mém zlatu neví, ale měl bych se zeptat ostatních.");
};


instance DIA_JORGEN_LI_MISSCOMPAS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_misscompas_condition;
	information = dia_jorgen_li_misscompas_info;
	permanent = FALSE;
	description = "Gorn říká, že jsi ztratil svůj kompas.";
};


func int dia_jorgen_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_01");	//Gorn říká, že jsi ztratil svůj kompas.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_02");	//Jo, to je pravda!...
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_03");	//A víš, kde jsi ho vytratil?!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_04");	//Nevím, asi mi vypadl z kapsy v průběhu bouře.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_05");	//Ale jistě to nevím...
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_06");	//Asi pro tebe hodně znamenal.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_07");	//Eh!... Byl to dar na památku od jednoho starého přítele!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_08");	//Věřil jsem, že mi přinese štěstí, a když jsem ho ztratil, skončil jsem tady na rozbité lodi!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_09");	//Asi bych se měl smířit s tím, že už ho neuvidím.
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_10");	//Nezkoušel jsi ho hledat?!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_11");	//Zkoušel, ale nenašel!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_12");	//Asi spadl přes palubu...
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_13");	//Aha.
	B_LogEntry(TOPIC_MISSMYGOLD,"Jorgen ztratil kompas - byl to cenný dar na památku od jeho starého přítele. Měl bych se po něm podívat.");
};


instance DIA_JORGEN_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregolddone_condition;
	information = dia_jorgen_li_wheregolddone_info;
	permanent = FALSE;
	description = "Není tohle tvoje?!";
};


func int dia_jorgen_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_01");	//Není tohle tvoje?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_02");	//Co?!... (udiveně)
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_03");	//Tohle.
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_04");	//Ano, můj kompas...
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_05");	//Jak jsi ho našel?!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_06");	//To není důležité.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_07");	//A kde to bylo?!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_08");	//No, zajímalo by mě, kde skončilo mé zlato.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_09");	//Co tím myslíš?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_10");	//Že bys něco mohl vědět!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_11");	//Ale já jsem ti řekl, že... (zaskočen)
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_12");	//Na tvém místě bych mluvil pravdu.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_13");	//Pravdu?! Hmm... (absolutně zaskočen) Ale...
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_14");	//Nu?! Mluv!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_15");	//Eh, dobře! S ostatními z posádky jsme ho shodili z paluby...
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_16");	//Ale to proto, že život je nám milejší!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_17");	//To jsi ho jen tak vyhodil?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_18");	//Jo, ale loď se tak kymácela, že kdyby se převrhla, bylo by po nás (vážně).
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_19");	//Ale bylo nutné vyhodit VŠECHNO zlato?!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_20");	//Promiň, ale na to jsme vážně nemysleli!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_21");	//No, to je jedno - zlato prostě není.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_22");	//Ale proč jste mi to neřekli?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_23");	//Nechtěli jsme ti to říkat, protože jsme mysleli, že tě to hodně naštve!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_24");	//Tak jsme dělali, že nic nevíme.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_25");	//No, máš pravdu - opravdu nejsem zrovna rád!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_26");	//Příteli!... (úsměv) Na tvém míste bych nebyl tak pochmurně naladěn.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_27");	//Zlata bude ještě hodně a ty získáš svou šanci stát se bohatým!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_28");	//Nejdůležitější je, že nás Innos ochránil!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_29");	//No, to je asi pravda.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_30");	//No, myslím, že už jsme domluvili.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_MISSMYGOLD,"Nyní je mi jasné, kde zmizelo mé zlato. V průběhu bouře ho posádka vyhodila, protože loď byla přetížená. Bohužel je nenapadlo nechat alespoň část zlata na palubě. Tajili mi to proto, že si mysleli, že budu zuřit.");
};


instance DIA_JORGEN_LI_HALLO(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 4;
	condition = dia_jorgen_li_hallo_condition;
	information = dia_jorgen_li_hallo_info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int dia_jorgen_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_aboutisland) && Npc_KnowsInfo(hero,dia_jorgen_li_whereguys) && Npc_KnowsInfo(hero,dia_jorgen_li_island))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Hallo_15_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Jorgen_LI_Hallo_01_01");	//Zatím jo.
};


instance DIA_JORGEN_LI_BRINGFOODDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddone_condition;
	information = dia_jorgen_li_bringfooddone_info;
	permanent = FALSE;
	description = "Jak jsou na tom naše zásoby?";
};


func int dia_jorgen_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && ((Npc_HasItems(hero,ItFoMuttonRaw) >= 24) || (Npc_HasItems(hero,ItFoMutton) >= 24)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_01");	//Jak jsou na tom naše zásoby?
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_02");	//Ne moc dobře... (vážně) Pomalu se blíží ke konci.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_03");	//Proč se ale ptáš?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_04");	//Některým chlapům vadí málo jídla.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_05");	//A ne zrovna menšině!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_06");	//Bohužel jim nic dát nemůžu...
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_07");	//S tím, co někteří dokážou sežrat, bychom byli bez zásob za pár dní.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_08");	//To se týká hlavně Gorna! Ten troglodyt by byl schopen zežrat jídlo pro všechny!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_09");	//Co mám teda dělat, co?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_10");	//Nic, prostě si chvíli odpočiň.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_11");	//Proč?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_12");	//Protože ti dokážu sehnat hodně syrového masa. Čerstvého.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_13");	//To jako, že bys šel na lov?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_14");	//No, ten, kdo kráčí po tomhle ostrově, narazí na pár stvůr snadno.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_15");	//A kolik masa máš?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_16");	//Můžu ti dát pět kusů.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_17");	//Ohó!... To nás určitě spasí.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_18");	//Tu ho máš.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_19");	//Ne, ne, ne!... Tohle prostě nestačí.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_20");	//Kolik potřebuješ?!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_21");	//Tolik, abych nakrmil všechny na lodi!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_22");	//Posádka si jinak začne hledat vlastní potravu a ještě je něco sežere.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_23");	//Zkus sehnat 100 kusů masa a pěkne je opeč.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_24");	//Pak se vrať, jo?
	B_LogEntry(TOPIC_BRINGFOOD,"Jorgen chce, abych sehnal alespoň 60 kusů opečeného masa pro posádku!");
};


instance DIA_JORGEN_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddoneext_condition;
	information = dia_jorgen_li_bringfooddoneext_info;
	permanent = FALSE;
	description = "Mám to maso.";
};


func int dia_jorgen_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jorgen_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddoneext_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_01_01");	//Mám to maso.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_01_02");	//Bezva, dej ho sem.
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jorgen_li_bringfooddoneext,"Tady máš... (pouze 14 kusů)",dia_jorgen_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jorgen_li_bringfooddoneext,"Tady máš!",dia_jorgen_li_bringfooddoneext_sixty);
};

func void dia_jorgen_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_00");	//Tady máš!
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_01");	//Hmm... (zamyšleně) A kde je zbytek?!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_02");	//Vypadalo to, že jsi měl více kusů, než teď.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_03");	//No, měl jsem hlad...
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_04");	//Chlape... (udiveně) To jsi to sežral sám? Tak to jsi hodně dobrej!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_05");	//To ti to nedojde?!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_06");	//Co?!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_07");	//Nemohl jsi sníst více než 5 kusů!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_08");	//To není přesně, přidej dalších 5.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_09");	//No, dobrá. Alespoň máš pro nás tady těch 50.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_10");	//Ale nevěřím tomu, že jsi to zežral sám.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_11");	//Chtěl jsem alespoň trochu zvednout příděly a teď nemůžu!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_12");	//Ach...
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_13");	//No, teď už je to jedno.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_14");	//Ale stejně, díky!
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Jorgenovi pouze půlku masa!");
};

func void dia_jorgen_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_00");	//Tady máš.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_01");	//Výborně, to vystačí na zvýšení přídelů.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_02");	//A taky to dlouho vydrží.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_03");	//Po tomhle hladomoru je to jako požehnání.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_04");	//A to vše díky tobě, příteli!... (úsměv)
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Dal jsem Jorgenovi opečené maso.");
};


instance DIA_JORGEN_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecave_condition;
	information = dia_jorgen_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Mám zajímavé zprávy.";
};


func int dia_jorgen_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_01");	//Mám zajímavé zprávy.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_02");	//A v čem spočívají?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_03");	//Našel jsem dvě jeskyně s ložiskem magické rudy.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_04");	//Opravdu?!... (udiveně)
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_05");	//Bez pochyb! Myslím, že ostrov je celý provrtaný.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_06");	//To jsou opravdu zajímavé zprávy.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_07");	//Ložisko takové rozlohy, to je velmi neobvyklá věc.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_08");	//Co já vím, tak takovéhlé zásoby nebyly ani v Hornickém údolí.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_09");	//Takže jestli máš pravdu, je to úplně nový začátek!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_10");	//Ale nejspíše je tu jen obyčejná ruda smíšená s kamenem.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_11");	//A co mám zatraceně dělat, abys mi uveřil?!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_12");	//No, musel bych kus rudy vidět, abych zhodnotil její kvalitu!
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_13");	//Tak pojď se mnou, ukážu ti ty jeskyně.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_14");	//Chlape, na to teď absolutně nemám čas (úsměv).
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_15");	//Ještě jsem nedokončil opravy lodi!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_16");	//Prostě mi přines malý kousek rudy a já ti řeknu, jestli je to opravdu ruda.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_17");	//Pak nám bude jasné, co to je.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_18");	//Dobrá, tak já ti kousek donesu.
		LITESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Jorgenovi o jeskyních na ostrově. Chce, abych mu donesl vzorek rudy.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_19");	//V jedné jeskyni jsem našel ložisko rudy.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_20");	//Vypadá to na velké zásoby!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_21");	//To jsou skutečně neobvyklé novinky.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_22");	//Aby tady bylo ložisko rudy.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_23");	//Co já vím, tak takové rozlohy by překonaly doly v Hornickým údolí.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_24");	//To by bylo úplně něco jiného!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_25");	//Ale musím tě zchladit. Pravdepodobně je to jen obyčejný rudný odpad v kameni.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_26");	//Takových je hodně, něco v tom je, ale skutečná těžba z toho nevzejde.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_27");	//Mohl jsi jednoduše narazit na takovou žilku!
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_28");	//A co teda budem dělat?
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_29");	//Na tvém místě bych tento ostrov prohlédl podrobněji.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_30");	//Možná tu najdeš ještě další ložiska!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_31");	//Takže jestli najdeš něco zajímavého, dej mi vědět... (úsměv)
		LIBEFORETESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Měl bych se porozhlédnout na ostrove, jestli tu nebude ještě jiná žíla rudy.");
	};
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecaveprogress_condition;
	information = dia_jorgen_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = "Prohledal jsem ostrov.";
};


func int dia_jorgen_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_01");	//Prohledal jsem ostrov...
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_02");	//A?!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_03");	//... Našel jsem ještě jednu jeskyni a je v ní více rudy než v té první!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_04");	//Jseš si tím jistý?
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_05");	//Ty nevěříš mým slovům?!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_06");	//Ale jo, ale ruda tady na tomhle ostrově!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_07");	//Co mám do prdele udělat, abys mi uvěřil?!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_08");	//Hmm... Musím tu rudu vidět!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_09");	//Tak pojď se mnou, dovedu tě do těch jeskyní.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_10");	//Na to nemám čas, chlape.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_11");	//Ještě nejsou hotovy opravy!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_12");	//Jestli to pro tebe není tak těžké, zajdi tam a přines mi pár kousků.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_13");	//Pak si můžeme být skutečně jistí.
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_14");	//Jasně, kapitáne!... (pro sebe) prašivej hajzl...
	LITESTOK = TRUE;
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Řekl jsem Jorgenovi o rudě. Chce, abych mu donesl pár vzorků.");
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecavedone_condition;
	information = dia_jorgen_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti tenhle kousek rudy.";
};


func int dia_jorgen_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_01");	//Přinesl jsem ti tenhle kousek rudy.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_02");	//Ukaž ji.
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_03");	//Tady.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_04");	//To vypadá, že jsi měl pravdu!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_05");	//To je opravdu magická ruda té nejvyšší kvality!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_06");	//Takže už mi věříš?!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_07");	//Odpusť, že jsem pochyboval o tvých slovech!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_08");	//Tak je to lepší.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Jorgen mi konečně uveřil, že na ostrově je ruda.");
};


instance DIA_JORGEN_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecourse_condition;
	information = dia_jorgen_li_changecourse_info;
	permanent = FALSE;
	description = "A co budeme dělat teď?";
};


func int dia_jorgen_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_01_01");	//A co budeme dělat teď?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_02");	//Hmm... O tom jsem ještě nepřemýšlel!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_03");	//Bude dobré něco udelat s tou rudou.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_04");	//Na pevnině by za ni byla hromada zlata!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_01_05");	//To zní dobře!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_06");	//To jo! Ale jak to uděláme?!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_07");	//Naše loď moc neunese a ta ruda není zrovna lehká!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_08");	//A taky bychom potřebovali dobré kopáče. Hodně kopáčů.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_09");	//Takže... (smutně) Nejaké nápady?!
	Info_ClearChoices(dia_jorgen_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jorgen_li_changecourse,"Mohli bychom o ní říci Hagenovi!",dia_jorgen_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jorgen_li_changecourse,"Můžeme někomu prodat ostrov i s rudou!",dia_jorgen_li_changecourse_sell);
	Info_AddChoice(dia_jorgen_li_changecourse,"Mohli bychom začít těžit.",dia_jorgen_li_changecourse_here);
};

func void dia_jorgen_li_changecourse_paladin()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_01");	//Mohli bychom o ní říci Hagenovi!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_02");	//Cože?! Dát rudu paladinům?!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_03");	//Potřebují ji více než my, pomůže jim vyhrát válku.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_04");	//A co z toho?!... Beztak to podělá!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_05");	//Stále nevíme, jaká je situace na kontinentu. Ale říká se, že skřeti jsou už u královského města!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_06");	//Pak pro rudu nemáme jiné využití.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_07");	//Dobře, nechám to na tobě.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_08");	//Nicméně pak bychom se měli navrátit na Khorinis.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_09");	//Ale nemyslím si, že většina posádky ten nápad zrovna uvítá... (pochybně)
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_10");	//No, vysvětlím jim to a uvidíme!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_11");	//Když to říkáš, přesvědči si je sám... (zlomyslně)
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_12");	//V každém případě jim to nejak vysvětli!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_13");	//Jasně!
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Dohodli jsme se, že o rudě dáme vědět paladinům. Jen to musím nějak sdělit ostatním členům posádky!");
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_sell()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_01");	//Můžeme někomu prodat ostrov i s rudou!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_02");	//Zajímavé, ale kdo by ho od nás koupil?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_03");	//Kdo by chtěl ostrov plný rudy?!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_04");	//Paladinové tě nenapadli? Životně jí potřebujou.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_05");	//Hmm... To není špatný nápad!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_06");	//V jejich situaci po této nabídce skočí.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_07");	//Ale kdo z paladinů má tyto pravomoce?!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_08");	//Ty jseš asi hodně vadnej, přece je na Khorinisu jejich generál...
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_09");	//... který mi určitě bude naslouchat...
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_10");	//To je asi to nejlepší, co s rudou můžeme udělat!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_11");	//Dobrá, vracíme se na Khorinis.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_12");	//Myslím, že chlapi budou rádi za trochu zlata...
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_13");	//Určitě budou souhlasit!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_14");	//Dobrá, tak jim dej vědět, jestli budeš moci... (zlomyslně)
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_15");	//Každopádně to bude podle většiny posádky!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_16");	//Samozřejmě!
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Řekl jsem si, že bych mohl rudu prodat paladinům - teď se o tom jen poradit se zbytkem posádky!");
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_here()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Here_01_01");	//Mohli bychom začít těžit.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_02");	//Hmmm... (Zadumaně) Nemyslím si, že to je dobrý nápad.
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Here_01_03");	//Proč?!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_04");	//Ano, protože i kdybychom zde od rána do večera kopali s krumpáčem v ruce - nic z toho mít nebudem.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_05");	//Těžba dostatečného množství rudy vyžaduje roky tvrdé práce...
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_06");	//Mimo to, nechce se mi na tomto ostrově strávit zbytek svýho života.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_07");	//A rád bych se ještě někdy pořádně nažral!... (Ukřičeně)
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_08");	//Bude lepší, když na to prostě zapomeneš.
};


instance DIA_JORGEN_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecoursedone_condition;
	information = dia_jorgen_li_changecoursedone_info;
	permanent = FALSE;
	description = "Mluvil jsem se všemi chlapy.";
};


func int dia_jorgen_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecoursedone_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_01");	//Mluvil jsem se všemi chlapy.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_02");	//A co ti řekli?!... (se zájmem)
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_03");	//Většina chce na Khorinis pomoci paladinům.
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_04");	//Takže tak...
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_05");	//No, jestli to chce většina, tak to tak bude!
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_06");	//Hagenovi a jeho lidem to opravdu pomůže.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_07");	//Jen jestli zvládneme zpáteční cestu!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_08");	//Bez obav.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_09");	//Tak dík za důvěru... (zlomyslně)
		B_LogEntry(TOPIC_CHANGECOURSE,"Vypadá to, že poplujeme na Khorinis pomoci paladinům.");
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_10");	//Většina se rozhodla, že bychom mohli paladinům o rudě říct za nějaké to zlato.
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_11");	//Takže tak...
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_12");	//Heh, nic jiného jsem ani nečekal!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_13");	//Proč?!
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_14");	//Lidi, co jsou tu s námi byli tolikrát podvedeni paladiny, že jim to chtějí vrátit!
		B_LogEntry(TOPIC_CHANGECOURSE,"Většina se rozhodla, že se vrátíme na Khorinis a prodáme paladinům informace o rudě!");
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_16");	//Půlka chce pomoci paladinům, půlka je proti.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_17");	//Hmm... Nelehká situace!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_18");	//A co teda budeme dělat?!
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_19");	//To nevím, ale asi se vrátíme na ostrov!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_20");	//No, tak dobře.
		B_LogEntry(TOPIC_CHANGECOURSE,"Polovina posádky chce pomoci paladinům, polovina je proti. Vypadá to, že rozhodnutí bude na mě, až se vrátíme na Khorinis!");
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


