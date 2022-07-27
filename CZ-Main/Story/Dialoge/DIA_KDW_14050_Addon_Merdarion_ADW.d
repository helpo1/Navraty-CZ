
instance DIA_Addon_Merdarion_ADW_EXIT(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 999;
	condition = DIA_Addon_Merdarion_ADW_EXIT_Condition;
	information = DIA_Addon_Merdarion_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Merdarion_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Merdarion_ADWHello(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADWHello_Condition;
	information = DIA_Addon_Merdarion_ADWHello_Info;
	description = "Jak to jde?";
};


func int DIA_Addon_Merdarion_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_ADWHello_Back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//Slyšel jsem dost.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
};

func void DIA_Addon_Merdarion_ADWHello_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(poslouchej) Slyšels to? ... Zvláštní, ne?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Hmmmm...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//Tyto teleportační kameny vypadají, jako kdyby již nefungovali, ale někdy jde slyšet, jak vrčí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//I když jsou nečinné, skrývá se v nich mnoho energie.
	Info_ClearChoices(DIA_Addon_Merdarion_ADWHello);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co pohání teleportační kameny?",DIA_Addon_Merdarion_ADWHello_reaktor);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co si myslíš, že by je mohlo aktivovat?",DIA_Addon_Merdarion_ADWHello_was);
};

func void DIA_Addon_Merdarion_ADWHello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//Co si myslíš, že by je mohlo aktivovat?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//Mám nápad. Potřeboval bych ale dokázat svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//Před pár dny, jsem měl pocit, jako kdybych styl těchto budov už viděl.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//Myslím, že jim budeme muset dodat velké množství magické energie, abychom je znovu zprovoznili.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsi už viděl tyto teleportační kameny?",DIA_Addon_Merdarion_ADWHello_wo);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Co by mohlo dodat magickou energii...",DIA_Addon_Merdarion_ADWHello_focus);
};

func void DIA_Addon_Merdarion_ADWHello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//Co by mohlo dodat magickou energii...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//Myslím, že pouze jediná věc. A to energie z ohniskových kamenů.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//Myslím ty ohniskové kameny, které byly použity k vytvoření magické bariéry v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//Pokud vím, tak jsi je pro nás nedávno sbíral.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Ano, vzpomínám si.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Říkáš, že potřebuješ ověřit svou teorii.",DIA_Addon_Merdarion_ADWHello_focusProof);
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Kde jsou nyní ohniskové kameny?",DIA_Addon_Merdarion_ADWHello_focusWo);
};

func void DIA_Addon_Merdarion_ADWHello_focusWo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Kde jsou nyní ohniskové kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//Byly mi svěřeny. Měl jsem je opatrovat dokud pro ně nenajdeme další využití.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//Myslím, že jsme ho právě našli.
	Info_AddChoice(DIA_Addon_Merdarion_ADWHello,"Slyšel jsem dost.",DIA_Addon_Merdarion_ADWHello_Back);
};

func void DIA_Addon_Merdarion_ADWHello_focusProof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//Říkáš, že potřebuješ ověřit svou teorii.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//Někdo by musel umístit ohniskový kámen k teleportačnímu kamenu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//Ale nevím kam.
};

func void DIA_Addon_Merdarion_ADWHello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Kde jsi viděl tyto teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//Byl jsi také v trestanecké kolonii. Tos nikdy nenarazil na teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//Jsem si celkem jistý, že tam mohou být i nyní.
};

func void DIA_Addon_Merdarion_ADWHello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//Co pohání teleportační kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//Stavitelé byli velmi pokrokoví lidé.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//Používali magii takovým způsobem, jaký jsem neviděl nikdy předtím.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//Síť teleportačních kamenů byla postavena tak, aby dopravovala rychle po městě.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//Kameny na TOMTO místě se zdají jako výchozí místo pro ostatní.
};

instance DIA_Addon_Merdarion_ADW_Portal(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_Portal_Condition;
	information = DIA_Addon_Merdarion_ADW_Portal_Info;
	description = "Je zde ještě něco zajímavého?";
};


func int DIA_Addon_Merdarion_ADW_Portal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_Portal_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_Portal_01_00");	//Je zde ještě něco zajímavého?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_01");	//V pouštním kaňonu, v severní části tohoto údolí je malá kamenná budova, zřejmě pozůstatek po Stavitelích.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_02");	//Vzhledem připomíná chrám, ale podle mého názoru, to jsou zbytky magického portálu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_Portal_01_03");	//Takže pokud se ti podaří něco zjistit, dej mi vědět.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_Portal_01_04");	//Dobře, podívám se na to.
	MIS_MerdarionPortal = LOG_Running;
	Log_CreateTopic(TOPIC_MerdarionPortal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Running);
	B_LogEntry(TOPIC_MerdarionPortal,"Podle Merdariona, jsou v kaňonu ruiny některých starověkých budov. Myslí si, že je to magický portál. Merdarion mě požádal, abych mu řekl, jestli se dozvím něco bližšího.");
};

instance DIA_Addon_Merdarion_ADW_PortalDone(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PortalDone_Condition;
	information = DIA_Addon_Merdarion_ADW_PortalDone_Info;
	description = "Měl jsi pravdu o tom portálu.";
};

func int DIA_Addon_Merdarion_ADW_PortalDone_Condition()
{
	if((MIS_MerdarionPortal == LOG_Running) && (AV_ENTER == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PortalDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_00");	//Měl jsi pravdu o tom portálu.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_01");	//Opravdu... (se zájmem) A kam vede?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_02");	//Podle všeho se to místo nazývalo plošina Pradávných.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_03");	//V zápiscích Stavitelů se praví, že se jedná o posvátné dědictví Adana.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_04");	//Tam on poprvé vstoupil do světa lidí a promluvil k nim.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_05");	//Ó bohové! (v úžasu) Nemůžu uvěřit! Je to... Je to prostě, neuvěřitelné.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_06");	//Tak se pojď sám podívat na to místo.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_07");	//Moc rád bych se na to místo podíval, ale sužují mě jakési neblahé předtuchy. 
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_08");	//Pokud Stavitelé toto místo skryli, pak možná, pak by naše přítomnost mohla způsobit nepředvídatelné následky.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PortalDone_01_09");	//Proto ať toto místo zůstane skryté před světem. Bude to tak lepší pro všechny!
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PortalDone_01_10");	//Dobře, jak myslíš.
	MIS_MerdarionPortal = LOG_Success;
	Log_SetTopicStatus(TOPIC_MerdarionPortal,LOG_Success);
	B_LogEntry(TOPIC_MerdarionPortal,"Řekl jsem Merdarionovi o portálu na Pradávné plošině. Byl ohromen když to slyšel. Nicméně, mágové Vody nechtějí portálem projít. Podle nich, by měli některé tajemství zůstat utajeny.");
};

instance DIA_Addon_Merdarion_FokusGeben(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FokusGeben_Condition;
	information = DIA_Addon_Merdarion_FokusGeben_Info;
	description = "Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.";
};

func int DIA_Addon_Merdarion_FokusGeben_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_FokusGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Dej mi ohniskový kámen. Uvidím, zda-li budu moci teleport zprovoznit.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//Dobrá tedy, v pořádku. Ale starej se o něj dobře, slyšíš?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas by mi rozbil hlavu, kdybychom je ztratili.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Log_CreateTopic(TOPIC_Addon_TeleportsADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsADW,LOG_Running);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Mág Vody Merdarion mi dal jeden starý ohniskový kámen, který byl použit k vztyčení magické bariéry v Hornickém údolí. Chce abych s ním aktivoval jeden teleportační kámen.");
};


instance DIA_Addon_Merdarion_FirstFocus(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_FirstFocus_Condition;
	information = DIA_Addon_Merdarion_FirstFocus_Info;
	description = "Aktivoval jsem jeden teleportační kámen.";
};

func int DIA_Addon_Merdarion_FirstFocus_Condition()
{
	if(TriggeredTeleporterADW != 0)
	{
		return TRUE;
	};
	return FALSE;
};


var int Merdarion_GotFocusCount;

func void DIA_Addon_Merdarion_FirstFocus_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//Aktivoval jsem jeden teleportační kámen.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//To vidím. Vypadá to, že jsem měl pravdu.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//Už jsem o tom mluvil s ostatními.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//Chceme zkusit aktivovat i ostatní teleportační kameny.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//Velmi nám to pomůže v našich studiích, pokud se budeme moci rychle pohybovat z jedné části města na jiné.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Zde je další ohniskový kámen.
	CreateInvItems(self,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	Merdarion_GotFocusCount = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Aktivuj ostatní, pokud budeš moci.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//Uvidím, co budu moct udělat.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	B_LogEntry(TOPIC_Addon_TeleportsADW,"Merdarion mi dal další ohnisko. Chce, abych aktivoval i další teleportační kameny. Pokaždé když aktivuji další, dostanu i další ohnisko.");
};


instance DIA_Addon_Merdarion_ActivateTeleports(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ActivateTeleports_Condition;
	information = DIA_Addon_Merdarion_ActivateTeleports_Info;
	permanent = TRUE;
	description = "Aktivoval jsem další teleportační kámen.";
};


func int DIA_Addon_Merdarion_ActivateTeleports_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_FirstFocus) && (TriggeredTeleporterADW > Merdarion_GotFocusCount) && (Merdarion_GotFocusCount < 6))
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Merdarion_ActivateTeleports_OneTime;

func void DIA_Addon_Merdarion_ActivateTeleports_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//Aktivoval jsem další teleportační kámen.
	if(SC_ADW_ActivatedAllTelePortStones == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Dej mi další ohnisko.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Samozřejmě, tady je.
		CreateInvItems(self,ItMi_Focus,1);
		B_GiveInvItems(self,other,ItMi_Focus,1);
	};
	if(DIA_Addon_Merdarion_ActivateTeleports_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Bylo to obtížné?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Ano a ne. Mohl bych dostat malou podporu?
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//Můžu ti dát trochu peněz. Pomohlo by?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//To nemůže škodit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Podívejme se...
		DIA_Addon_Merdarion_ActivateTeleports_OneTime = TRUE;
	};
	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//Udělal jsi to opravdu dobře. Můžu ti pouze pogratulovat k tvé práci.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//Nyní všechny znovu fungují. Nádherný pohled, nemyslíš?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Zde je pár zlatých mincí.
	B_GivePlayerXP(XP_Addon_ActivatedTeleportStone);
	CreateInvItems(self,ItMi_Gold,150);
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Merdarion_GotFocusCount = Merdarion_GotFocusCount + 1;
	if((Merdarion_GotFocusCount >= 1) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (MIS_Saturas_LookingForHousesOfRulers == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//O, málem bych zapomněl. Saturas s tebou chtěl mluvit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//Měl bys za ním jít, hned jak budeš moci.
	};
};


instance DIA_Addon_Merdarion_ADW_PreTeachMana(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_ADW_PreTeachMana_Condition;
	information = DIA_Addon_Merdarion_ADW_PreTeachMana_Info;
	description = "Můžeš mě naučit něco ze svých magických schopností?";
};


func int DIA_Addon_Merdarion_ADW_PreTeachMana_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Merdarion_ADWHello) && (hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_PreTeachMana_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Můžeš mě naučit něco ze svých magických schopností?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//Můžu tě naučit, jak zvednout tvou magickou moc.
	Merdarion_Addon_TeachMana = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,"Merdarion mi může zvednout manu.");
};


instance DIA_Addon_Merdarion_ADW_TEACH_MANA(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 99;
	condition = DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition;
	information = DIA_Addon_Merdarion_ADW_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou moc.";
};


var int Merdarion_ADW_Empty;

func int DIA_Addon_Merdarion_ADW_TEACH_MANA_Condition()
{
	if((Merdarion_ADW_Empty == FALSE) && (Merdarion_Addon_TeachMana == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//Chci zvýšit svou magickou moc.
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Žádáš po mně víc, než můžu splnit.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//Už tě víc nemohu naučit.
		Merdarion_ADW_Empty = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};

func void DIA_Addon_Merdarion_ADW_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(DIA_Addon_Merdarion_ADW_TEACH_MANA);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,Dialog_Back,DIA_Addon_Merdarion_ADW_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Addon_Merdarion_ADW_TEACH_MANA_1);
	Info_AddChoice(DIA_Addon_Merdarion_ADW_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Addon_Merdarion_ADW_TEACH_MANA_5);
};


instance DIA_ADDON_MERDARION_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_prayforgomez_condition;
	information = dia_addon_merdarion_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_merdarion_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_03");	//Myslím, že ti pomůže.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PrayForGomez_01_04");	//Děkuji za radu.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_MERDARION_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 1;
	condition = dia_addon_merdarion_adw_duringritual_condition;
	information = dia_addon_merdarion_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_merdarion_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

var int MerdarionDoUnitors;

instance DIA_Addon_Merdarion_AncientAltar(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_AncientAltar_Condition;
	information = DIA_Addon_Merdarion_AncientAltar_Info;
	permanent = FALSE;
	description = "O ohniskových kamenech.";
};

func int DIA_Addon_Merdarion_AncientAltar_Condition()
{
	if(AltarToMerdarion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_AncientAltar_Info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_00");	//O ohniskových kamenech. Ještě nějaké potřebuji.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_01");	//Bohužel, nemohu ti pomoci.

	if(SC_ADW_ActivatedAllTelePortStones == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_02");	//Všechny ohniskové kameny, které jsem měl, jsme již použil k aktivaci magických portálů.
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_03");	//Jiné už nemám. Mimochodem, proč je najednou tolik potřebuješ?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_04");	//Ty ohniskové kameny, které mě dal Saturas, chci použít jenom v případě nouze.
		AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_05");	//Ještě jsi mě nevysvětlil, proč je vlastně potřebuješ!
	};

	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_06");	//Saturas řekl, že s jejich pomocí je možné vrátit magii Pradávným oltářům.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_07");	//(zamyšleně) V tomto případě, je nebudeš potřebovat.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_08");	//A z jakého důvodu?
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_09");	//Protože tyto ohniskové kameny, nejsou vhodné pro tyto účely.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_10");	//S největší pravděpodobností, potřebuješ speciální krystaly, které samy v sobě ukládají magickou energii.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_11");	//Ale takové jsem tady neviděl.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_12");	//A kdybych ti našel takové krystaly, můžeš z nich udělat ohniskové kameny?
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_13");	//(zamyšleně) Proč ne. Stačí jim dát správný tvar a připevnit do rámu.
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_14");	//Jelikož nestabilní krystalová struktura snadno zničí sama sebe!
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_15");	//Proto, když takové najdeš, přines mi je. 
	AI_Output(self,other,"DIA_Addon_Merdarion_AncientAltar_01_16");	//A já ti s tím problémem pomůžu.
	AI_Output(other,self,"DIA_Addon_Merdarion_AncientAltar_01_17");	//Dobrá, vše jsem pochopil.
	MerdarionDoUnitors = TRUE;
};

instance DIA_Addon_Merdarion_MakeUnitor(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Info;
	permanent = FALSE;
	description = "Mám pro tebe kus magického krystalu.";
};

func int DIA_Addon_Merdarion_MakeUnitor_Condition()
{
	if((MerdarionDoUnitors == TRUE) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_00");	//Mám pro tebe kus magického krystalu.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_01");	//Opravdu? (překvapeně) Podívám se na něj.
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_02");	//Tady je.
	B_GiveInvItems(other,self,ItMi_UnSharp_MagicCrystal,1);
	Npc_RemoveInvItems(self,ItMi_UnSharp_MagicCrystal,1);
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_03");	//(se zájmem si ho prohlíží) Vypadá to, že je opravdu v pořádku!
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_04");	//Bude vhodný pro tvé účely, k vytvoření ohniskového kamene. Kde jsi ho našel?
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_05");	//Bude pro tebe lepší, to nevědět.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_06");	//No, pokud ano... (směje se) Počkej! Nepotrvá to dlouho.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_07");	//Tvůj magický ohniskový kámen je hotov. Můžeš ho použít.
	B_GiveInvItems(self,other,ItMi_MagicCrystal,1);
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_01_08");	//Děkuju. A co když budu potřebovat víc ohniskových kamenů?
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_01_09");	//Je to velmi jednoduché, stačí když mi přineseš krystaly.
};

instance DIA_Addon_Merdarion_MakeUnitor_Done(C_Info)
{
	npc = KDW_14050_Addon_Merdarion_ADW;
	nr = 5;
	condition = DIA_Addon_Merdarion_MakeUnitor_Done_Condition;
	information = DIA_Addon_Merdarion_MakeUnitor_Done_Info;
	permanent = TRUE;
	description = "Udělej pro mě ještě několik ohniskových kamenů.";
};

func int DIA_Addon_Merdarion_MakeUnitor_Done_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Addon_Merdarion_MakeUnitor) && (Npc_HasItems(hero,ItMi_UnSharp_MagicCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_MakeUnitor_Done_Info()
{
	var int anzahl_common;

	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_Done_01_00");	//Udělej pro mě ještě několik ohniskových kamenů.
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_01");	//A krystaly máš?
	AI_Output(other,self,"DIA_Addon_Merdarion_MakeUnitor_Done_01_02");	//Samozřejmě! Tady.
	b_giveinvitemsmanythings(other,self);
	anzahl_common = Npc_HasItems(other,ItMi_UnSharp_MagicCrystal);
	Npc_RemoveInvItems(other,ItMi_UnSharp_MagicCrystal,anzahl_common);
	CreateInvItems(other,ItMi_MagicCrystal,anzahl_common);
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_03");	//Dobře. Počkej minutku.
	B_UseFakeUnitor();
	AI_Output(self,other,"DIA_Addon_Merdarion_MakeUnitor_Done_01_04");	//A je to hotový. Můžeš si vzít svůj ohniskový kámen.
	b_giveinvitemsmanythings(self,other);
};
