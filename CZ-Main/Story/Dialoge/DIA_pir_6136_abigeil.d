
instance DIA_PIR_6136_ABIGEIL_EXIT(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 999;
	condition = dia_pir_6136_abigeil_exit_condition;
	information = dia_pir_6136_abigeil_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pir_6136_abigeil_exit_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_PICKPOCKET(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 900;
	condition = dia_pir_6136_abigeil_pickpocket_condition;
	information = dia_pir_6136_abigeil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pir_6136_abigeil_pickpocket_condition()
{
	return C_Beklauen(80,100);
};

func void dia_pir_6136_abigeil_pickpocket_info()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,Dialog_Back,dia_pir_6136_abigeil_pickpocket_back);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,DIALOG_PICKPOCKET,dia_pir_6136_abigeil_pickpocket_doit);
};

func void dia_pir_6136_abigeil_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};

func void dia_pir_6136_abigeil_pickpocket_back()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};


instance DIA_PIR_6136_ABIGEIL_HELLO(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_hello_condition;
	information = dia_pir_6136_abigeil_hello_info;
	permanent = FALSE;
	description = "Zdravím, maličká, kdo jsi?!";
};


func int dia_pir_6136_abigeil_hello_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_hello_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_00");	//Zdravím, maličká, kdo jsi?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_01");	//Já ti dám maličkou, hajzle!... (vážně) Co tu chceš?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_02");	//Jen jsem se chtěl zeptat na tvé jméno.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_03");	//Hmm... Můžeš mi říkat Abigail.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_04");	//Jen si do hlavy neber to, že mě dostaneš - nebo to dostane tvoje hlava!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_05");	//Huh, pěkně vychovaná... Ty jsi také pirát?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_06");	//Ne, tvoje babička!... (agresivně)
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_09");	//Co je to sakra za otázku!
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPON(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapon_condition;
	information = dia_pir_6136_abigeil_missweapon_info;
	permanent = FALSE;
	description = "V čem je problém?";
};


func int dia_pir_6136_abigeil_missweapon_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapon_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_00");	//V čem je problém?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_01");	//Copak to nevidíš?!... (už zase agresivní) Nemám můj meč!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_03");	//No, já... Já... Já, (zaskočena) ztratila jsem ho!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_04");	//To je tak velký problém najít si jinou zbraň?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_05");	//Jo, protože ten meč je jediná zbraň, kterou chci... (v brutální agresi)
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_08");	//Hmm... (zamyšleně) Dobrá, poslouchej. Ten meč - je dědictví po mém otci.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_09");	//A ne jen to.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_11");	//V mých rukou ta čepel brala život hajzlům jako jsi ty.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_12");	//Aha! Dobrá věcička... A kde jsi ho ztratila?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_13");	//Ha, ha!... Ty bys chtěl můj meč.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_16");	//Jen já můžu používat tu čepel, každého jiného zabije!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_17");	//Ale kde jsi ho ztratila?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_18");	//Při lovení močálových krys jsem chtěla prohlédnout tábor banditů.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_21");	//Kdybych neměla svůj meč, bylo by po mně!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_22");	//První dva byli hned mrtví, ale...
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_24");	//Někde se tam vzala ohnivá stínová šelma!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_25");	//Ohnivá stínová šelma?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_26");	//Ta ohnivá děvka mě sejmula tlapou a já upustila svůj meč.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_29");	//Odplazila jsem se do bezpečí a slíbila pomstu Beliarovi a jeho ohnivým sviním!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_30");	//A co se stalo s mečem?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_31");	//Zůstal tam ležet, byla jsem raněna a v té trávě jsem ho nemohla najít.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_32");	//A teď přijde nějakej týpek jako ty, kterej se mě bude takhle blbě ptát a já ho nemám čím zabít.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_33");	//Chudinko... A proč se nevrátíš pro svůj meč?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_34");	//Protože bez něj se odsud nehnu!... (nervózně)
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_35");	//A s jinou zbraní to neumím
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_36");	//A taky se nechci potkat s tou ohnivou bestií...
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon,"No, hodně štěstí!",dia_pir_6136_abigeil_missweapon_no);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon,"Co dostanu, když ti ho vrátím?",dia_pir_6136_abigeil_missweapon_yes);
};

func void dia_pir_6136_abigeil_missweapon_no()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_No_01_01");	//No, hodně štěstí!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_No_01_03");	//Jdi do prdele!... (agresivně)
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_missweapon_yes()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_00");	//Co dostanu, když ti ho vrátím?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_01");	//Cože?!... (udiveně) Ty mi chceš pomoct?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_03");	//No... Bojím se, že nemám nic, co by tě mohlo zajímat.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_04");	//Možná tato kamenná tabulka, jsou na ní nějaké zajímavé znaky.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_05");	//Našla jsem ji v jedné z jeskyní v kaňonu.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_06");	//Vypadá magicky a něco z ní vyzařuje, ale nevím co to je.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_08");	//Tak mi vrať meč a je tvá! Souhlasíš?!... (úsměv)
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	MIS_ABIGEILMISSWEAPON = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILMISSWEAPON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_Running);
	B_LogEntry(TOPIC_ABIGEILMISSWEAPON,"V táboře pirátů jsem potkal nádhernou mladou dívku jménem Abigail. Řekla mi, že někde v bažinách ztratila svůj meč, který jí daroval otec. Je to magická zbraň a může ji užívat jen ona, jinak budou fatální následky! Za odměnu mi nabízí jednu z magických tabulek, které tu zbyly po původních obyvatelích. Ale dostal jsem varování, že poblíž by měla být schována ohnivá stínová šelma!");
};


instance DIA_PIR_6136_ABIGEIL_FUCKOFF(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_fuckoff_condition;
	information = dia_pir_6136_abigeil_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pir_6136_abigeil_fuckoff_condition()
{
	if((ABIGEILPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PIR_6136_ABIGEIL_LIFE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_life_condition;
	information = dia_pir_6136_abigeil_life_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_pir_6136_abigeil_life_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_life_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Life_01_00");	//Jak to jde?
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_01");	//Výborně, přítelíčku... (potěšeně)
		AI_ReadyMeleeWeapon(self);
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_07");	//Podívejme se...
		AI_RemoveWeapon(self);
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_09");	//... Ale je to dobré ne?
	}
	else if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_10");	//Lépe být nemůže.
	}
	else
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_16");	//Už mě neser, jasný?!
	};
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapondone_condition;
	information = dia_pir_6136_abigeil_missweapondone_info;
	permanent = FALSE;
	description = "Našel jsem tvůj meč.";
};


func int dia_pir_6136_abigeil_missweapondone_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_Running) && (Npc_HasItems(hero,itmw_abigeilspage) >= 1))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapondone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_00");	//Našel jsem tvůj meč.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_01");	//Opravdu? Je to opravdu on?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_04");	//Chytej.
	B_GiveInvItems(other,self,itmw_abigeilspage,1);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_05");	//Hmm?...(podívá se na meč)
	Info_ClearChoices(dia_pir_6136_abigeil_missweapondone);
	Info_AddChoice(dia_pir_6136_abigeil_missweapondone,"Tak?",dia_pir_6136_abigeil_missweapondone_give);
};

func void dia_pir_6136_abigeil_missweapondone_give()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_00");	//Tak?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_01");	//Wow! Skutečně, to je on... (štěstím bezsebe)
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_02");	//Ááá, můj miláček je opět jen můj!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_04");	//Ach, ano - ta tabulka, tu ji máš!
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate2_Addon,1);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_06");	//Ani jsem si nemyslela, že bys prolézal takováto místa! Díky, příteli, ještě jednou díky!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_09");	//Není zač, to je v pohodě.
	MIS_ABIGEILMISSWEAPON = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_SUCCESS);
	B_LogEntry(TOPIC_ABIGEILMISSWEAPON,"Donesl jsem Abigail její meč.");
};

instance DIA_PIR_6136_ABIGEIL_ABIGEILHELPHANNA(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_abigeilhelphanna_condition;
	information = dia_pir_6136_abigeil_abigeilhelphanna_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pir_6136_abigeil_abigeilhelphanna_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_abigeilhelphanna_info()
{
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_00");	//Hej, počkej chvilku. Mohla bych tě požádat ještě o jednu službu?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_02");	//Slíbila jsem, že sestře donesu jistý náhrdelník.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_09");	//Prostě jsem jí slíbila, že jí ho doručím!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_11");	//Moje sestra žije v Khorinisu a tam se bez lodi jen tak nedostanu...
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_12");	//Takže je na mně, abych se dostal do Khorinisu?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_13");	//No, slyšela jsem, že máš svůj způsob cestování.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_15");	//No, každá práce něco stojí.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_17");	//Jestli mi tedy pomůžeš, tak ti dám... pět set zlatých mincí!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_18");	//Šlo by?
	Info_ClearChoices(dia_pir_6136_abigeil_abigeilhelphanna);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna,"To nepůjde.",dia_pir_6136_abigeil_abigeilhelphanna_no);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna,"Dohodnuto.",dia_pir_6136_abigeil_abigeilhelphanna_yes);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_no()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_00");	//To nepůjde.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_01");	//Tak do řitě s tebou, dobytku, jen se na sebe podívej!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_06");	//Táhni hajzle... (agresivně)
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_yes()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_00");	//Dohodnuto!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_01");	//Tak vem tento zlatý náhrdelník a doruč ho mé sestře.
	B_GiveInvItems(self,other,ITMI_HANNAGOLDNECKLACE,1);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_02");	//A jak se tvá sestra jmenuje?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_03");	//Hanna, je hostinská v Khorinisu.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_04");	//Hanna je tvá sestra?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_05");	//Hmm... (nechápavě) A co je na tom sakra divnýho?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_09");	//Takové sprosté otázky...
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_10");	//Dobrá, jen klid.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_11");	//Bezva, takže neztrácej čas a jdi!
	MIS_ABIGEILHELPHANNA = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILHELPHANNA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_Running);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Abigail mě požádala, abych její sestře Hanně v Khorinisu donesl zlatý náhrdelník. Odměnou mi přislíbila 500 zlatých.");
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISION(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprision_condition;
	information = dia_pir_6136_abigeil_inprision_info;
	permanent = FALSE;
	description = "Bojím se, že mám pro tebe špatnou zprávu.";
};


func int dia_pir_6136_abigeil_inprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONABIGEIL == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprision_info()
{
	var C_Npc gregcap;
	gregcap = Hlp_GetNpc(PIR_1320_Addon_Greg);
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_00");	//Bojím se, že mám pro tebe špatnou zprávu.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_01");	//Co se stalo?... (udiveně)
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_02");	//Tvá sestra je v base.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_03");	//Cože? K čertu! Jak se to stalo?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_04");	//Zkouším ji vysvobodit, ale potřebuji tvou pomoc.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_05");	//A jak to chceš udělat?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_06");	//Abigail, poslouchej mě - musíš mi pomoci!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_07");	//... Jak jsem ji jen mohla opustit!
	AI_TurnToNPC(self,gregcap);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_08");	//Greguuu!... (křičí) Okamžitě shromáždi ostatní, útočíme na Khorinis!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_09");	//... (Greg: 'Abigail, ty ses pomátla? Jací ostatní, jaký Khorinis?!')
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_10");	//ABIGAIL, POSLOUCHEJ MĚ! ŘÍKÁM, ŽE POTŘEBUJI TVOU POMOC!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_11");	//Jak ti můžu pomoci - má sestra je v královských celách!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_16");	//Řekni mi - znáš nějakého člověka jménem Gaspar?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_17");	//Gaspar?! Hmm... To jméno mi něco říká.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_22");	//Hanna mi řekla, že jeden hajzl, kterej se takhle jmenoval, chtěl, aby mu prodala hotel.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_24");	//Aha, tak už je mi to jasný.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_25");	//Co je ti jasný?!... (se zájmem)
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_26");	//To, jak s tím souvisí Gaspar.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_29");	//Myslím, že to on dostal Hannu do cely!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_30");	//Cože? Jak tomu mám rozumět?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_33");	//Já se vrátím do Khorinisu a najdu důkazy proti Gasparovi.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_41");	//Ale slib mi, že se postaráš o mou sestřičku!
	KNOWSHANNAINPRISIONCARAGON = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Po dlouhém rozhovoru, a vlastně i hodně emotivním rozhovoru, s Abigail je mi vše jasné. Ten hajzl Gaspar chtěl už delší dobu získat Hannin hotel. Myslím, že ten zloděj u Hakona byl on. Musím jen najít potřebné důkazy, že Hanna je nevinná - měl bych se stavit za Hakonem.");
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISIONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprisiondone_condition;
	information = dia_pir_6136_abigeil_inprisiondone_info;
	permanent = FALSE;
	description = "Mám pro tebe novinky!";
};


func int dia_pir_6136_abigeil_inprisiondone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && (HANNATAKESNECKLACE == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprisiondone_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_00");	//Mám pro tebe novinky!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_01");	//Jaké novinky? Něco o sestře?! Tak nenapínej!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_02");	//Bez obav, vše je v pohodě!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_03");	//Gaspar je v base a tvá sestřička má svůj náhrdelník, co jsi jí poslala!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_04");	//Ach! Jsi můj hrdina!... (s dojetím)
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_11");	//Jak jsme se dohodli - pět set zlatých!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_ABIGEILHELPHANNA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_SUCCESS);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Abigail mi poděkovala za záchranu sestry. A dokonce i políbila!");
};