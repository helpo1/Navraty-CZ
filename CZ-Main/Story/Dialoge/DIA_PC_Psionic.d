
instance DIA_Lester_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_EXIT_Condition;
	information = DIA_Lester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if(self.flags == NPC_FLAG_IMMORTAL)
	{
		self.flags = 0;
	};
};

instance DIA_Lester_PREZHello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_PREZHello_Condition;
	information = DIA_Lester_PREZHello_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Lester_PREZHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void DIA_Lester_PREZHello_Info()
{
	B_Say_Overlay(self,other,"$SEKGREETINGS");
	AI_PlayAni(self,"T_GREETNOV");
};

instance DIA_Lester_Hello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hello_Condition;
	information = DIA_Lester_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lester_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Chlape ani nevíš jak rád tě vidím!
	Info_ClearChoices(DIA_Lester_Hello);
	Info_AddChoice(DIA_Lester_Hello,"Měl bych tě znát?",DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello,"Lestere! Jak ses sem dostal?",DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses se sem dostal?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to šílený útěk. Po výbuchu bariéry jsem se chvíli zmateně motal po okolí.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Potom jsem se musel prosekat lesem, až jsem pak došel do tohohle údolí.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou pořád v Hornickém údolí. Tedy aspoň myslím, že jsou.
	Info_ClearChoices(DIA_Lester_Hello);
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Měl bych tě znát?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Haló? Je někdo doma? Riskoval jsem svůj krk, abys mohl získat ten divný kámen.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Něco mi dlužíš. Tentokrát by sis to mohl zapamatovat.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//Pamatuješ ještě na Diega, Miltena a Gorna?
	Info_AddChoice(DIA_Lester_Hello,"Diego, Milten a KDO?",DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello,"Samozřejmě! Co je s nimi?",DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Samozřejmě. Co je s nimi?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud vím, tak by měli přežít zničení bariéry.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Ale nemám ponětí kde jsou teď - pravděpodobně jsou stále v Hornickém údolí.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Dej mi vědět, kdybys je náhodou potkal.
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Neříkej mi, že si nic nepamatuješ. Ohniskové kameny - ten trol - ohromná kopa magické rudy mágů Vody.
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jistý.
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To se spraví. Mně taky trvalo než jsem si to v hlavě srovnal.
};


instance DIA_Lester_WhatHappened(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_WhatHappened_Condition;
	information = DIA_Lester_WhatHappened_Info;
	permanent = FALSE;
	description = "Co se stalo?";
};


func int DIA_Lester_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Co se stalo?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//Poté co byl Spáč poražen, se celé Bratrstvo zbláznilo.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Bez svého vůdce byli jak prázdné skořápky.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Se mnou to bylo to stejné. Měl jsem noční můry a dokonce i halucinace. Ale jakmile se mi v hlavě trochu vyjasnilo, hned jsem od tam utekl.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zdálo, že vidím obrovský černý stín, který spálil na popel skupinu uprchlíků.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//V tu chvíli jsem si myslel, že mě přišel zabít drak.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Viděl jsi ještě něco?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Ne - vzal jsem nohy na ramena a utekl jsem!
};


instance DIA_Lester_MineColony(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_MineColony_Condition;
	information = DIA_Lester_MineColony_Info;
	permanent = FALSE;
	description = "Jak dlouho už jsi v tomhle údolí?";
};


func int DIA_Lester_MineColony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Jak dlouho už jsi v tomhle údolí?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Už ani nevím. Možná týden. Ale je tu ještě něco:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Když jsem sem večer přišel a podíval se nahoru na skály, bylo tam jen pár stromů.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//Ale když jsem se podíval den na to, byla tam věž. Přísahal bych, že předtím tam nebyla. Od té doby jsem tohle údolí neopustil.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Myslíš Xardasovu věž? Věděl jsem, že je mocný, ale jen tak vytvořit věž...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? On žije v té věži? Nevím, jestli jsem rád, že to vím...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Neboj, to on mě zachránil ze Spáčova chrámu. Je na naší straně.
};

instance DIA_Lester_SEND_XARDAS(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_SEND_XARDAS_Condition;
	information = DIA_Lester_SEND_XARDAS_Info;
	permanent = FALSE;
	description = "Měl bys Xardasovi říct o tom stínu...";
};

func int DIA_Lester_SEND_XARDAS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && (LesterGoXar == FALSE) && Npc_KnowsInfo(other,DIA_Lester_MineColony) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Měl bys Xardasovi říct o tom stínu, mohlo by to být důležité.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Myslíš, že to nebyl výplod mé fantazie? Myslíš, že to byl opravdový...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... drak. Ano.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Vrháš se do toho zase po hlavě, co?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Neřekl bych, že zrovna po hlavě... ještě ne.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(zívá) Dobře, jestli je to důležité, tak půjdu a řeknu mu o tom.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Ale prvně si trošku odpočinu. Ještě teď jsem utahaný z toho útěku.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Myslím, že máš důležité věci na práci. Uvidíme se později u Xardase.
	LesterCanGoXar = TRUE;
 	LesterCanGoXarDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lester_STADT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_STADT_Condition;
	information = DIA_Addon_Lester_STADT_Info;
	description = "Mám se vydat do Khorinisu. Co o tomhle městě víš?";
};


func int DIA_Addon_Lester_STADT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_STADT_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Mám se vydat do Khorinisu. Co o tomhle městě víš?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Khorinis? No, je to přístavní město. Nic zvláštního.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//Proč se ptáš?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Musím se setkat s paladiny, kteří by měli být ve městě.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(směje se) Vážně? Hah. Nepustí tě ani do města, natož tam, kde sídlí paladinové.
};


instance DIA_Addon_Lester_Vorschlag(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_Vorschlag_Condition;
	information = DIA_Addon_Lester_Vorschlag_Info;
	description = "Nenapadá tě, jak se dostat do města?";
};


func int DIA_Addon_Lester_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lester_STADT) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Nenapadá tě, jak se dostat do města?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Vlastně ano. Kdysi jsem pracoval pro starého alchymistu, Constantina.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Má ve městě velký vliv a nařídil strážím, aby pustili koholiv, kdo mu nese nějaké vzácné bylinky.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Takže je to poměrně jednoduché. Prostě posbíráš několik bylin, které tady všude rostou a budeš předstírat, že pro něj pracuješ.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Ale ujisti se, že jsou všechny jednoho druhu, ne jen náhodně nasbírané. Stráže nejsou zrovna nejbystřejší a neví skoro nic o alchymii.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Takže, když jim doneseš rostliny jen jednoho druhu, tak by je to mělo zmást.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Řekl bych, že bude stačit tak 10 rostlin od jednoho druhu.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Díky za radu.
	Log_CreateTopic(TOPIC_Addon_PickForConstantino,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino,LOG_Running);
	B_LogEntry(TOPIC_Addon_PickForConstantino,"Lester mi poradil, abych nasbíral 10 rostlin jednoho druhu a strážím řekl, že pracuji pro Constantina.");
	MIS_Addon_Lester_PickForConstantino = LOG_Running;
};


instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description = "Ten nápad s bylinkami vyšel. Stráže mě nechali projít.";
};


func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if((MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS) && (CheckTownPlants == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Ten nápad s bylinkami vyšel. Stráže mě nechali projít.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//Tak jak jsem řekl. Měl bys moje rady poslouchat častěji, kámo.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lester_Perm(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Perm_Condition;
	information = DIA_Lester_Perm_Info;
	permanent = FALSE;
	description = "Co víš o tomhle místě?";
};


func int DIA_Lester_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Co víš o tomhle místě?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Když se budeš držet té cesty, která vede dolů, tak dojdeš na farmu. Město je kousek za ní.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Ale buď opatrný. V okolí nejsou jen krysi a vlci, ale i goblini a banditi.

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_Perm_13_06");	//Radši si vezmi tuhle bederní roušku.
		AI_Output(self,other,"DIA_Lester_Perm_13_07");	//Když jsem odcházel z tábora, tak jsem si ji vzal pro jistotu s sebou.
		AI_Output(self,other,"DIA_Lester_Perm_13_08");	//Mně už je na nic a tobě by mohla chvíli dobře posloužit.
		B_GiveInvItems(self,other,itar_sekbed,1);
		LESTER_TERRAININFO = TRUE;
	};
};

instance DIA_LESTER_GETSMOKE(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_getsmoke_condition;
	information = dia_lester_getsmoke_info;
	permanent = FALSE;
	description = "Pořád vyčerpaný?";
};

func int dia_lester_getsmoke_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_getsmoke_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Pořád vyčerpaný?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//A jak. (zívne) Už jsem Xardasovi řekl všechno. Teď se prospím. Tak den...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//... dva... možná déle.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_00");	//Mohu ti s nečím pomoct?
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_01");	//Nemyslím si, že bys byl schopen mi pomoci. I když... (zamyslí se)
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_02");	//Co?
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_03");	//Dal bych si trochu trávy. Víš co, ty které jsme dělávali v Bažinném táboře.
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_04");	//Pamatuješ si například 'Severní soumrak'? Ten model ti dokázal vyhulit mozek z hlavy.
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_05");	//Možná, že by mě mohl na chvíli zbavit těch bolestí.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_06");	//Jestli chceš, tak se ti po něm mohu podívat.
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_07");	//Ale kde je chceš najít? (smutně) Slyšel jsem, že už je ani bratři u průsmyku nemají.
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_09");	//Ale budu rád, když se po nich pro mě podíváš.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_10");	//Udělám vše, co bude v mých silách.
	MIS_LESTERGETSMOKE = LOG_Running;
	Log_CreateTopic(TOPIC_LESTERGETSMOKE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_Running);
	B_LogEntry(TOPIC_LESTERGETSMOKE,"Lester mi řekl, že by si rád zakouřil 'Severní Soumrak'. Trávu, která byla vyrobena v Bratrstvu. Pokud tu trávu získám, donesu ji Lesterovy.");
};

instance DIA_LESTER_SMOKEFOUND(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_smokefound_condition;
	information = dia_lester_smokefound_info;
	permanent = FALSE;
	description = "Něco tu pro tebe mám.";
};


func int dia_lester_smokefound_condition()
{
	if((MIS_LESTERGETSMOKE == LOG_Running) && (Npc_HasItems(hero,itmi_joint_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_lester_smokefound_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lester_SmokeFound_01_00");	//Něco tu pro tebe mám.
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_01");	//Hmm... Co je to?
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_02");	//Neříkej, že jsi mi sehnal tu trávu.
	AI_Output(other,self,"DIA_Lester_SmokeFound_01_03");	//Uhádls! Tady to máš, 'Severní soumrak'.
	B_GiveInvItems(other,self,itmi_joint_02,1);
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_04");	//(překvapeně) To myslíš vážně? Skvěle, dej ho sem.
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_05");	//To je opravdu on! Kde jsi ho sehnal?
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_07");	//Dík, kámo. Tímhle jsi mě opravdu dostal.
	MIS_LESTERGETSMOKE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_SUCCESS);
	B_LogEntry(TOPIC_LESTERGETSMOKE,"Dal jsem Lesterovi 'Severní soumrak'. Byl tak šťastný, že ho může znovu ochutnat. A mělo by mu to pomoct, dostat se zase na nohy.");
};

instance DIA_Lester_KAP3_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP3_EXIT_Condition;
	information = DIA_Lester_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_BACKINTOWN(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_BACKINTOWN_Condition;
	information = DIA_Lester_BACKINTOWN_Info;
	important = TRUE;
};

func int DIA_Lester_BACKINTOWN_Condition()
{
	if((NoDarkInsMe == TRUE) && (Kapitel == 3) && (XarMeetPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//Hej, konečně ses vrátil! Musíš hned jít za Xardasem, máme problém.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//V to věřím.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//Všechno šlo z kopce, poté co jsi odešel.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Promluv si s Xardasem, čeká na tebe.
	AI_StopProcessInfos(self);
};

instance DIA_Lester_PERM3(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_Lester_PERM3_Condition;
	information = DIA_Lester_PERM3_Info;
	permanent = TRUE;
	description = "Nevypadáš zrovna nejlépe.";
};

func int DIA_Lester_PERM3_Condition()
{
	if((Kapitel >= 3) && (Lester_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Lester_PERM3_OneTime;

func void DIA_Lester_PERM3_Info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Nevypadáš zrovna nejlépe.

	if(hero.guild == GIL_KDF)
	{
		if(DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//Taky se necítím zrovna dobře, chlape. Jsem úplně vyřízený a pořád mě bolí hlava.
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Pokaždé, když se ukážou ti v černých kápích, tak se to zhorší.
			if(SC_KnowsMadPsi == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//A já vím proč.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Fakt? Já to radši asi vědět nechci.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Ti v černých kápích - nebo Pátrači, jak jim říkáme my mágové - bývali následovníci mocného arcidémona. Nepřipomíná ti to něco?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Hm, ne. Teda pokud nemluvíš o...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//Přesně tak. Pátrači byli přivrženci Spáče. Odpadlíci z tábora v bažinách.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//Jsou to tvoji bývalí přátelé, Lestere. Bývalé Bratrstvo Spáče. Teď ovšem nejsou nic než bezduší přisluhovači zla.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//Myslel jsem si to, ale doufal jsem, že to tak není. Chceš tím říct, že je zpět? Je Spáč opět mezi námi?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Dobrá otázka. Vím jen to, že musím Pátrače zastavit dřív, než budou příliš mocní.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Nelíbí se mi to, ale asi máš pravdu. Promiň, všechno už mi to začíná lézt na mozek.
				B_LogEntry(TOPIC_DEMENTOREN,"Mé podezření se potvrdilo. Dokonce Lester nepochybuje o tom, že Pátrači jsou bývalé Bratrstvo Spáče.");
				B_GivePlayerXP(XP_Lester_KnowsMadPsi);
				DIA_Lester_PERM3_OneTime = TRUE;
			};
		};
	}
	else if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//Bolesti hlavy neustávají, ale doufám, že se problém brzo vyřeší.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//Ať tak nebo tak.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Ta bolest hlavy se už skoro nedá vydržet. A teď navíc útočí ti ještěří lidé. Musím se sám sebe ptát, okdud se berou.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Ta bolest hlavy nechce ustoupit. Něco se chystá.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(zívá) Myslím, že si budu muset odpočinout.
};


instance DIA_Lester_KAP4_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP4_EXIT_Condition;
	information = DIA_Lester_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_KAP5_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP5_EXIT_Condition;
	information = DIA_Lester_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_XARDASWEG(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_XARDASWEG_Condition;
	information = DIA_Lester_XARDASWEG_Info;
	description = "Kde je Xardas?";
};


func int DIA_Lester_XARDASWEG_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Kde je Xardas?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Je pryč a ve své věži nechal ta démonická stvoření.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Hádám, že nechce aby někdo čmuchal v jeho věži, zatímco je pryč.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Kam odešel?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//To mi neřekl. Jen mě poprosil, abych ti dal tenhle dopis.
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Přečetl jsem si ho. Promiň, byl jsem zvědavý.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//A?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//Nemám ponětí, nerozuměl jsem ani slovo, chlape. Ale jedno mi je jasné: hned tak ho znovu neuvidíme.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Asi mu začalo hořet za patama a tak odešel do hor.
	XARDAS_MISS = TRUE;
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Xardas zmizel. Lester mi předal dopis, který mu Xardas pro mě nechal.");
};


instance DIA_Lester_KnowWhereEnemy(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_KnowWhereEnemy_Condition;
	information = DIA_Lester_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Zjistil jsem, kde se ukrývá nepřítel.";
};


func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lester_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Zjistil jsem, kde se ukrývá nepřítel.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Neptej se proč, ale cítím, že bych měl jít s tebou.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Neumím to vysvětlit, ale jsem si jistý, že odpověď zjistím, když půjdu s tebou.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Je mi líto, ale loď je plná.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Možná je. Možná je můj osud bezvýznamný v porovnání s věcmi, proti kterým stojíme.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Víš, co máš dělat. Postav se zlu - o mě se nestrachuj.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Já nejsem důležitý.
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Nemohu tě vzít s sebou.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Tak pojď se mnou a zjisti tu odpověď!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	B_GivePlayerXP(XP_Crewmember_Success);
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Tak pojď se mnou a zjisti tu odpověď!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Uvidíme se v přístavu. Až budu připravený, tak se tam vydám.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Pospěš si, nemáme moc času nazbyt.
	Lester_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Nemohu tě vzít s sebou.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Chápu. Stejně bych ti asi moc nepomohl.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//Ať už s sebou vezmeš kohokoliv, ujisti se, že jim můžeš věřit.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//Opatruj se.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};


instance DIA_Lester_LeaveMyShip(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_LeaveMyShip_Condition;
	information = DIA_Lester_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Nakonec na tebe nezbylo místo.";
};


func int DIA_Lester_LeaveMyShip_Condition()
{
	if((Lester_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//Nakonec na tebe nezbylo místo.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Rozumím. Pravděpodobně bych udělal to samé na tvém místě.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Pokud mě budeš potřebovat, tak ti pomohu. Víš kde mě najdeš.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lester_StillNeedYou(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_StillNeedYou_Condition;
	information = DIA_Lester_StillNeedYou_Info;
	permanent = TRUE;
	description = "Potřebuji přítele, který mi pomůže.";
};


func int DIA_Lester_StillNeedYou_Condition()
{
	if(((Lester_IsOnBoard == LOG_OBSOLETE) || (Lester_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Potřebuji přítele, který mi pomůže.
	if(Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Já to věděl! Projdem si tím bok po boku, tak jako dřív.
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Zlo by mělo být na pozoru. Začínáme mu šlapat na paty.
		Lester_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Myslím, že bude líp, když nakonec stejně zůstanu. Hodně štěstí.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lester_KAP6_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP6_EXIT_Condition;
	information = DIA_Lester_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Psionic_PICKPOCKET(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_PC_Psionic_PICKPOCKET_Condition;
	information = DIA_PC_Psionic_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_PC_Psionic_PICKPOCKET_Condition()
{
	return C_Beklauen(76,20);
};

func void DIA_PC_Psionic_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,Dialog_Back,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,DIALOG_PICKPOCKET,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

instance DIA_LESTER_OTHERBROTHER(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_otherbrother_condition;
	information = dia_lester_otherbrother_info;
	permanent = FALSE;
	description = "To znamená, že ostatní členové Bratrstva zemřeli?";
};


func int dia_lester_otherbrother_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_otherbrother_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_00");	//To znamená, že ostatní členové Bratrstva zemřeli?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_01");	//Všichni ne, někteří se zachránili.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_02");	//Jak to víš?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_03");	//Nedaleko od průsmyku, jsem potkal jednoho chlápka, který mi o tom řekl.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_04");	//Koho?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_05");	//Cavalorna.
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_06");	//Měl by sis ho pamatovat - byl jedním z Gomezových Stínů v kolonii.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_07");	//Pamatuji si ho. A co přesně ti řekl?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_08");	//No... (zamyslí se) Říkal, že se zachránili nějací Guru a potom vytvořili malý tábor vedle průsmyku do Hornického údolí.
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_09");	//Také říkal, že už neuctívají Spáče, že přešli na jinou víru.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_12");	//Tak to bys je měl jít navštívit, ne?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_13");	//Ne, už toho mám dost. (usmívá se) Navíc tady to je fajn.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_14");	//Když to říkáš.
};


instance DIA_LESTER_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_kapitelorcattack_condition;
	information = dia_lester_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Jak se teď odsud dostaneme?";
};


func int dia_lester_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (PSIONICBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_00");	//Jak se teď odsud dostaneme?
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_01");	//Pro tebe to určitě problém nebude. (pousmál se) Určitě jsi už něco vymyslel.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_03");	//Vždycky se nám podařilo vyjít z toho bez úhony.
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_05");	//Co tedy budeš dělat?
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_06");	//Ještě nevím. (zamyslí se) Napadá mě, že udělám to samé co ostatní.
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_07");	//Ostatní se pravděpodobně probijí městem. To se mi nezdá jako nejlepší nápad.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_08");	//(nešťastně) Ale budu muset. Nebo máš snad lepší nápad?
	Info_ClearChoices(dia_lester_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_lester_nw_kapitelorcattack,"(nabídnout teleportační runu k Bratrstvu)",dia_lester_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_lester_nw_kapitelorcattack,"Momentálně ne.",dia_lester_nw_kapitelorcattack_nogiverune);
};

func void dia_lester_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_01");	//Mám tu teleportační runu, vedoucí k Bratrstvu. Mohl bys ji použít.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_02");	//Teleportační runa? (zamyslí se) Myslím, že by se ti ještě mohla hodit.
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_04");	//(překvapeně) Děkuji. Nebudu tedy ztrácet čas a vyrážím.
	PSIONICNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem Lesterovi teleportační runu k Bratrstvu. Teď by měl bez problémů opustit přístav.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_lester_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_00");	//Momentálně ne.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_01");	//(zklamaně) Tak vidíš. Nic jiného mi tedy nezbývá.
	B_LogEntry(TOPIC_HELPCREW,"Lester se rozhodl, že pomůže ostatním chlapům probít se hordou skřetů ve městě. Myslím, že se jim to povede.");
	PSIONICBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ESCAPE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_escape_condition;
	information = dia_lester_nw_escape_info;
	permanent = FALSE;
	description = "Jsem rád, že jsi živý a zdravý!";
};


func int dia_lester_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lester_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Lester_NW_Escape_01_01");	//Jsem rád, že jsi živý a zdravý!
	AI_Output(self,other,"DIA_Lester_NW_Escape_01_02");	//(směje se) To samé mohu říct já o tobě!
	AI_Output(other,self,"DIA_Lester_NW_Escape_01_03");	//Takže se vám podařilo probít se městem?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_04");	//Jak vidíš, tak ano. Ale ne všem.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Lester_NW_Escape_01_05");	//Mnoho z nás zajali skřeti. Jen Innos ví, co s nimi bude.
			B_LogEntry(TOPIC_HELPCREW,"Skvělá zpráva! Potkal jsem Lestera v Bratrstvu - živého a zdravého.");
			Log_AddEntry(TOPIC_HELPCREW,"Lester mi řekl, že skřeti zajali spoustu chlapů, při průboji městem. Doufám, že jsou stále naživu.");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Lester_NW_Escape_01_06");	//Spoustu z nás skřeti zajali... (zarmouceně) Někteří i padli.
			B_LogEntry(TOPIC_HELPCREW,"Skvělá zpráva! Potkal jsem Lestera v Bratrstvu - živého a zdravého.");
			Log_AddEntry(TOPIC_HELPCREW,"Lester mi řekl, že skřeti zajali spoustu chlapů, při průboji městem. Někteří dokonce padli.");
		};
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_07");	//To už není tak dobrá zpráva.
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_08");	//To není. S tím už asi nic neuděláme.
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_09");	//To se teprve uvidí.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_10");	//Jak vidíš, tak ano. Uprchli všichni, co byli na lodi.
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_11");	//To je úžasná zpráva!
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_12");	//To vskutku je. (směje se) Ještě teď nevím, komu mám děkovat, že nám tam pomohl.
		B_LogEntry(TOPIC_HELPCREW,"Skvělá zpráva! Potkal jsem Lestera v Bratrstvu - živého a zdravého. A ještě jedna úchvatná zpráva: Všichni ostatní také přežili.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LESTER_NW_SOONBATTLE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattle_condition;
	information = dia_lester_nw_soonbattle_info;
	permanent = FALSE;
	description = "Jak to tady v táboře jde?";
};


func int dia_lester_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattle_info()
{
	AI_Output(other,self,"DIA_Lester_NW_SoonBattle_01_00");	//Jak to tady v táboře jde?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_01");	//Jako vždy. I když teď každý mluví o skřetech.
	AI_Output(other,self,"DIA_Lester_NW_SoonBattle_01_03");	//Pokusili se zaútočit?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_04");	//Ne. Ještě se ani nepřiblížili.
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_05");	//Zdá se, že jejich hlavní cíl bylo město. Ale to je teď jedno.
};


instance DIA_LESTER_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattlenow_condition;
	information = dia_lester_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Zúčastníš se boje se skřety?";
};


func int dia_lester_nw_soonbattlenow_condition()
{
	if((KAPITELORCATC == TRUE) && (TPL_JOINHAGEN == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattlenow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_SoonBattleNow_01_00");	//Zúčastníš se boje se skřety?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_01");	//Jistě. Teď je to boj nás všech. Kde se mám hlásit?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_02");	//Myslím si, že se připojí i další z tábora.
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_03");	//Takže budu bojovat po jejich boku.
	AI_Output(other,self,"DIA_Lester_NW_SoonBattleNow_01_05");	//Jsem rád, že pomůžete.
};


instance DIA_LESTER_NW_BATTLEWIN(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_battlewin_condition;
	information = dia_lester_nw_battlewin_info;
	permanent = FALSE;
	description = "Bitva je naše!";
};


func int dia_lester_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_BattleWin_01_00");	//Bitva je naše!
	AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_01");	//Ano, ukázali jsme skřetům, kdo je tu pán.
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_02");	//Nicméně, neměli bychom přeceňovat důležitost téhle výhry.
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_03");	//Nepřítel je stále velice mocný a určitě využije téhle situace ve svůj prospěch.
		AI_Output(other,self,"DIA_Lester_NW_BattleWin_01_04");	//V tom případě mu v tom budeme muset zabránit.
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_05");	//Asi ano. Ale raději bych se neukvapoval.
	};
};


instance DIA_LESTER_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_goonorkshunt_condition;
	information = dia_lester_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Lord Hagen mi zadal úkol.";
};


func int dia_lester_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (LESTERTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_lester_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_lester_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_00");	//Lord Hagen mi zadal úkol.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_01");	//(vážně) Jaký?
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_02");	//Mám zabít několik skřetů, aby se báli postupovat dál.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_03");	//To nebude jednoduché. Potřeboval bys někoho, kdo tě bude krýt.
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_04");	//O to jsem tě právě chtěl poprosit.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_05");	//Samo sebou! Příteli pomohu vždy.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_06");	//Jen mi řekni, kdy chceš vyrazit. Bude mi potěšením ti pomoci.
	LESTERJOINMEHUNT = TRUE;
};


instance DIA_LESTER_NW_FOLLOWME(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_followme_condition;
	information = dia_lester_nw_followme_info;
	permanent = TRUE;
	description = "Následuj mne.";
};


func int dia_lester_nw_followme_condition()
{
	if((LESTERJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_followme_info()
{
	AI_Output(other,self,"DIA_Lester_NW_FollowMe_01_00");	//Následuj mne.
	AI_Output(self,other,"DIA_Lester_NW_FollowMe_01_01");	//Dobře. Ukážeme těm bestiím.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_STOPHERE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_stophere_condition;
	information = dia_lester_nw_stophere_info;
	permanent = TRUE;
	description = "Počkej tady!";
};


func int dia_lester_nw_stophere_condition()
{
	if((LESTERJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Lester_NW_StopHere_01_00");	//Počkej tady!
	AI_Output(self,other,"DIA_Lester_NW_StopHere_01_01");	//Když to říkáš. I když se mi zdá, že na odpočinek je příliš brzy.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_allgreatvictory_condition;
	information = dia_lester_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Co se děje?";
};


func int dia_lester_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lester_NW_AllGreatVictory_01_00");	//Co se děje?
	AI_Output(self,other,"DIA_Lester_NW_AllGreatVictory_01_01");	//Myslím, že bys to zvládl i beze mě. Ale hlavní je, že skřeti již nadále nejsou hrozbou.
	AI_Output(self,other,"DIA_Lester_NW_AllGreatVictory_01_02");	//Vše se začíná vracet do starých kolejí a brzy si již nikdo ani nevzpomene, že se něco takového stalo.
};


instance DIA_LESTER_NW_WHATDONOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_whatdonow_condition;
	information = dia_lester_nw_whatdonow_info;
	permanent = FALSE;
	description = "Co budeš dělat teď?";
};


func int dia_lester_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Lester_NW_WhatDoNow_01_00");	//Co budeš dělat teď?
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_01");	//Chvíli zůstanu v táboře, budu pomáhat Baalu Orunovi...
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_02");	//Někdo by se měl přeci starat o nové novice.
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_03");	//Navíc je tu klid a ticho, jaké lepší místo si přát?
};


instance DIA_LESTER_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_travelonbigland_condition;
	information = dia_lester_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Mám pro tebe novinu.";
};


func int dia_lester_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_00");	//Mám pro tebe novinu.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_01");	//(úsměvně) Co se děje teď?
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_05");	//Jen jsem se chtěl zeptat, jestli se mnou nechceš odplout na pevninu?
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_06");	//Proč?
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_07");	//Mám velmi důležitou zprávu pro krále.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_08");	//(zamyslí se) Hmm... to je opravdu důležité. A hádám, že budeš opět potřebovat pomoc od starého přítele.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_09");	//Takže opustím tuhle nádheru a půjdu s tebou.
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_11");	//Dobře. Počkám tedy u lodi.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_12");	//Uvidíme se tam.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LESTERTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Lester se mnou odpluje na pevninu. Myslím, že mě tam prostě nechce nechat jít samotného.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

