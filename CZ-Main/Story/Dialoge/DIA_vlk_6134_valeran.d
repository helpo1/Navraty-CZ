
instance DIA_VLK_6134_VALERAN_EXIT(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 999;
	condition = dia_vlk_6134_valeran_exit_condition;
	information = dia_vlk_6134_valeran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6134_valeran_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6134_valeran_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6134_VALERAN_HALLO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hallo_condition;
	information = dia_vlk_6134_valeran_hallo_info;
	permanent = FALSE;
	description = "Zdravím, kdo jsi?";
};


func int dia_vlk_6134_valeran_hallo_condition()
{
	if((Fernando_ImKnast == FALSE) && !Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_00");	//Zdravím, kdo jsi?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_01");	//Vítej, cizinče, mně říkají Valeran.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_02");	//A čím se zabýváš?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_03");	//Pracuji jako vedoucí u obchodníka Fernanda - pomáhám mu vést obchod.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_04");	//Je to těžké a náročná práce, a proto si mě Fernando najmul.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_05");	//A jak ti jde tvoje práce?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_06");	//Nemám si na co stěžovat - platí mi dobré peníze, jestli je to to, na co ses ptal.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_07");	//Dokonce i sám Fernando se ke mně pěkně chová.
};


instance DIA_VLK_6134_VALERAN_HALLOAFTER(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_halloafter_condition;
	information = dia_vlk_6134_valeran_halloafter_info;
	permanent = FALSE;
	description = "Zdravím, kdo jsi?";
};


func int dia_vlk_6134_valeran_halloafter_condition()
{
	if((Fernando_ImKnast == TRUE) && !Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_halloafter_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hallo_01_00");	//Zdravím, kdo jsi?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hallo_01_01");	//Vítám tě cizinče. Mé jméno je Valeran.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_02");	//Tvůj obličej je mi povědomý, Nepotkali jsme se dříve?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_03");	//No, je možné, že jsme se potkali ve meste, v horní čtvrti.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_04");	//Pracoval jsem tam jako vedoucí u jednoho obchodníka jménem Fernando.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_05");	//Znám Fernanda. Zdá, že má poslední dobou nějaké problémy se zákonem.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_06");	//To si slyšel zcela správně! Nedávno ho zatkla městská domobrana. Bylo to proto, že prodával zbraně banditům.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_07");	//Nikdy bych si nepomyslel, že zrovna on půjde tímto směrem. Velice mě to překvapilo!
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HalloAfter_01_08");	//A co se stalo tobě?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_09");	//Co se týče mě, jsem kvůli tomu bez práce.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HalloAfter_01_10");	//A teď tu sedím a čekám... Sám nevím na co.
	CanHireValeran = TRUE;
};


instance DIA_VLK_6134_VALERAN_CANTRADENO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantradeno_condition;
	information = dia_vlk_6134_valeran_cantradeno_info;
	permanent = FALSE;
	description = "Prodáváš něco?";
};


func int dia_vlk_6134_valeran_cantradeno_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter) && (Fernando_ImKnast == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantradeno_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_CanTradeNo_01_00");	//Prodáváš něco?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_CanTradeNo_01_01");	//Ne, už ne.
	VALERANCANTRADE = TRUE;
};


instance DIA_VLK_6134_VALERAN_CANTRADE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_cantrade_condition;
	information = dia_vlk_6134_valeran_cantrade_info;
	permanent = FALSE;
	description = "Prodáváš něco?";
};


func int dia_vlk_6134_valeran_cantrade_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo) && (Fernando_ImKnast == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_cantrade_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_CanTrade_01_00");	//Prodáváš něco?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_CanTrade_01_01");	//Ode mne koupíš vše, co potřebuješ, a za dobrou cenu!
	VALERANCANTRADE = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Valeran mi může prodat různé zboží v horní čtvrti města.");
};


instance DIA_VLK_6134_VALERAN_WAREZ(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 700;
	condition = dia_vlk_6134_valeran_warez_condition;
	information = dia_vlk_6134_valeran_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi, co máš na skladě.";
};


func int dia_vlk_6134_valeran_warez_condition()
{
	if(((VALERANHIRED == TRUE) && (VALERANCANTRADE == TRUE)) || ((Fernando_ImKnast == FALSE) && (VALERANCANTRADE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_VLK_6134_Valeran_Warez_01_00");	//Ukaž mi, co máš na skladě.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Warez_01_01");	//Vyber si...
	B_GiveTradeInv(self);
};


instance DIA_VLK_6134_VALERAN_WHATYOUDO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_whatyoudo_condition;
	information = dia_vlk_6134_valeran_whatyoudo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_vlk_6134_valeran_whatyoudo_condition()
{
	if((Fernando_ImKnast == TRUE) && Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_whatyoudo_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_01");	//Copak to není jasné? Sedím a čekám tu na nějakou práci.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_02");	//Teď když zatkli Fernanda, zůstal jsem bez práce.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_04");	//Proč sis něco nezkusil zařídit ve městě?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_05");	//A kdo myslíš, že mi jako dá práci? Ty Fernandova aféra značně poškodila i mou reputaci.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_07");	//A v tomto typu práce je to docela závažná věc.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_WhatYouDo_01_08");	//No jo. A jak to jde?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_WhatYouDo_01_09");	//Jak můžeš vidět, není se čím chlubit.
	CanHireValeran = TRUE;
};


instance DIA_VLK_6134_VALERAN_PERM(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_perm_condition;
	information = dia_vlk_6134_valeran_perm_info;
	permanent = TRUE;
	description = "Něco zajímavého?";
};


func int dia_vlk_6134_valeran_perm_condition()
{
	if((FINDPERSONTHREE == FALSE) && (VALERANRECRUITEDDT == FALSE) && (Fernando_ImKnast == TRUE) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo) || Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_perm_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Perm_01_00");	//Něco zajímavého?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Perm_01_01");	//Obávám se, že není proč se radovat - jsem zrovna bez práce. Celé dny tu jen sedím a stále nic.
};


instance DIA_VLK_6134_VALERAN_HIRE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hire_condition;
	information = dia_vlk_6134_valeran_hire_info;
	permanent = FALSE;
	description = "Našel jsem ti práci.";
};


func int dia_vlk_6134_valeran_hire_condition()
{
	if((MIS_TRADEHELPER == LOG_Running) && (Fernando_ImKnast == TRUE) && (Npc_KnowsInfo(hero,dia_vlk_6134_valeran_whatyoudo) || Npc_KnowsInfo(hero,dia_vlk_6134_valeran_halloafter)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_00");	//Našel jsem ti práci.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_01");	//Fakt? (se zájmem) A jakou?
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_03");	//Jeden vlivný obchodník v horní čtvrti hledá člověka na pozici jeho pomocníka.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_04");	//Práce spočívá v tom, dělat pro něj různou těžkou práci a pomáhat mu vést obchod.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_05");	//A co je to za obchodníka?
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_06");	//Jmenuje se Lutero. Znáš ho?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_07");	//Lutero?! Samozřejmě... (směje se) Kdo by ho neznal.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_08");	//Počkej ale... (udiveně) On ale měl pomocníka!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_09");	//Zdá se, že se jmenoval Benchel, pokud mě paměť nešálí.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_10");	//Ano, máš pravdu! Ale on už u Lutera nepracuje.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_16");	//Lutero mi už jednou práci nabídl, ale já ji tehdy odmítl. Já vůl!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_17");	//Nicméně, kdo mohl tehdy vědět, že je Fernando nečestný!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_19");	//A teď ty přijdeš sem a nabízíš mi pracovat pro Lutera!
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Hire_01_20");	//Takže souhlasíš?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_21");	//No jasně, že souhlásím! Mám snad na výběr?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Hire_01_22");	//Kromě toho, znám Lutera dost dobře - je to čestný obchodník a pracovat u něj je velká čest.
	B_LogEntry(TOPIC_TRADEHELPER,"Hovořil jsem s Valeranem, bývalým vedoucím u obchodníka Fernanda, a ten souhlasil pracovat u Lutera. Vypadá to, že lepšího kandidáta na místo pomocníka už nenajdu. Ale předtím než mu dám kladnou odpověď by stálo za to popřemýšlet nebo najít ještě někoho dalšího.");
	VALERANAGREE = TRUE;
};


instance DIA_VLK_6134_VALERAN_HIREOK(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_hireok_condition;
	information = dia_vlk_6134_valeran_hireok_info;
	permanent = FALSE;
	description = "Jdeme za Luterem.";
};


func int dia_vlk_6134_valeran_hireok_condition()
{
	if((VALERANAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HireOk_01_00");	//Jdeme za Luterem.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_HireOk_01_01");	//Myslím, že ty jsi ten člověk, kterého potřebuje.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_HireOk_01_02");	//Jak říkáš! Pojďme.
	B_LogEntry(TOPIC_TRADEHELPER,"Rozhodl jsem se vybrat Valerana. Myslím, že Luterovi se tento kandidát na jeho pomocníka líbit bude!");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONTHREE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6134_VALERAN_THANKS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_thanks_condition;
	information = dia_vlk_6134_valeran_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6134_valeran_thanks_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_thanks_info()
{
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_00");	//Díky, že jsi mi pomohl!
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_01");	//Konečně znovu pracuji a za to ti moc děkuji. Teď jsem tvým dlužníkem.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Thanks_01_02");	//V pohodě, nebylo to tak těžké.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_05");	//Chci ti nějak poděkovat. Na - Vem si tuhle věcičku.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_06");	//Těžko něco takového najdeš u jiných obchodníků. Je to velká vzácnost!
	B_GiveInvItems(self,other,itwr_kampfkunst,1);
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_07");	//Určitě se ti bude hodit.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_10");	//Mimochodem teď, ti budu moct prodávat znovu různé zboží.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_11");	//Jestli něco budeš potřebovat, zajdi za mnou.
	AI_Output(other,self,"DIA_VLK_6134_Valeran_Thanks_01_12");	//Dobře, budu nad tím uvažovat.
	AI_Output(self,other,"DIA_VLK_6134_Valeran_Thanks_01_13");	//Tak zatím!
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6134_VALERAN_NEWLIFE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_newlife_condition;
	information = dia_vlk_6134_valeran_newlife_info;
	permanent = TRUE;
	description = "Jak jde tvá nová práce?";
};


func int dia_vlk_6134_valeran_newlife_condition()
{
	if(VALERANHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_newlife_info()
{
	AI_Output(other,self,"DIA_VLK_6134_Valeran_NewLife_01_00");	//Jak jde tvá nová práce?
	AI_Output(self,other,"DIA_VLK_6134_Valeran_NewLife_01_01");	//Vše je naprosto v pořádku! Díky za optání.
};


instance DIA_VLK_6134_VALERAN_PICKPOCKET(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 900;
	condition = dia_vlk_6134_valeran_pickpocket_condition;
	information = dia_vlk_6134_valeran_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6134_valeran_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_vlk_6134_valeran_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket,Dialog_Back,dia_vlk_6134_valeran_pickpocket_back);
	Info_AddChoice(dia_vlk_6134_valeran_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6134_valeran_pickpocket_doit);
};

func void dia_vlk_6134_valeran_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

func void dia_vlk_6134_valeran_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6134_valeran_pickpocket);
};

instance DIA_VLK_6134_VALERAN_RECRFAIL(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrfail_condition;
	information = dia_vlk_6134_valeran_recrfail_info;
	permanent = FALSE;
	description = "Jak jde práce?";
};

func int dia_vlk_6134_valeran_recrfail_condition()
{
	if((VALERANHIRED == TRUE) && (EROLRECRUITEDDT == FALSE) && (MIS_PPL_FOR_TOWER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrfail_info()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_00");	//Jak jde práce?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_01");	//Je to ideální! Jsem ti velmi vděčnej za to, že jsi mě našel práci.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_02");	//Tak to bude asi hloupé, se tě ptát, jestli bys neuvažoval o změně.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_03");	//Změně? O, ne. Ne teď, když jsem se teprve zapracoval.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_04");	//A Lutero platí dobře, pracovat u něho je radost. Když budu tak často měnit zaměstnavatele, tak si mě ostatní přestanou vážit.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_05");	//A s jakým návrhem jsi ke mě přišel... Stejně ho budu muset odmítnout.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrFail_15_06");	//Dobrá. V takovém případě hodně štěstí.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrFail_01_07");	//Děkuji, za vše co jsi pro mě udělal.
};

//--------------------CEO----------------------------------------------

instance DIA_VLK_6134_VALERAN_RECRDT(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 2;
	condition = dia_vlk_6134_valeran_recrdt_condition;
	information = dia_vlk_6134_valeran_recrdt_info;
	permanent = FALSE;
	description = "Jak to jde v práci?";
};

func int dia_vlk_6134_valeran_recrdt_condition()
{
	if((CanHireValeran == TRUE) && (PasswordSet == TRUE) && (VALERANHIRED == FALSE) && (EROLRECRUITEDDT == FALSE) && (MIS_PPL_FOR_TOWER == LOG_Running) && ((Npc_KnowsInfo(hero,dia_vlk_6134_valeran_hallo) == TRUE) || (Npc_KnowsInfo(hero,DIA_VLK_6134_VALERAN_HALLOAFTER) == TRUE)))
	{
		return TRUE;
	};
};

func void dia_vlk_6134_valeran_recrdt_info()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_00");	//Jak to jde v práci? Stále jsi žádnou nenašel?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_01");	//Ne. Zdá se, že mé služby nikdo nepotřebuje. Už jsem přemýšlel, že půjdu dělat farmáře na některou farmu. 
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_02");	//Nechápu proč jsem tolik let strávil studiem obchodu a financí?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_03");	//Byl jsem nejlepší a teď nemůžu sehnat práci, místo toho tady sedím bez práce s pár zlatýma v kapse.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_04");	//A co bys říkal nato, kdybych ti sehnal práci?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_05");	//(překvapeně) Práci? Kde? Děláš si srandu?
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_06");	//Ani trochu. Pro své nové sídlo potřebuju správce co by se mě staral o obchod v době mé nepřítomnosti.
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_07");	//Jedná se o starou tvrz vedle Onarovy farmy, ve které chci vybudovat malý tábor. Ubytování a strava je na můj účet.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_08");	//Ó, Innosi, já musím snít! Věř mi, nenajdeš nikoho lepšího, kdo si poradí s financemi, než jsem já!
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_09");	//Já souhlasím, kdy mám nastoupit?
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_01_10");	//Můžeš nastoupit hned. A jaký by sis představoval plat?
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_01_11");	//(zamyšleně) Fernando mi platil 80 zlatých na den, ale pro tebe jsem ochoten pracovat za padesát!
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Padesát zlatých? To zní rozumně. Jsi přijat.",dia_vlk_6134_valeran_recrdt_yes);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Bojím se, že to je moc.",dia_vlk_6134_valeran_recrdt_no);
	};
};

func void dia_vlk_6134_valeran_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_yes_15_00");	//Jsi přijat. Uvidíme se v tvrzi. Pokud budeš vyzván k sdělení hesla, je to 'dračí poklad'.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_yes_01_01");	//Věř mi, nebudeš litovat svého rozhodnutí!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Valeran souhlasil, že pro mne bude pracovat jako správce.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VALERANRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_15_00");	//Bojím se, že to je moc.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_no_01_01");	//(zoufale) Počkej! A co 35 zlatých? Jsem ochotnej pracovat za 35 zlatých!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Dobře, jsi přijat.",dia_vlk_6134_valeran_recrdt_no_yes);
	Info_AddChoice(dia_vlk_6134_valeran_recrdt,"Pořád příliš. Bojím se, že nemůžu využít tvých služeb.",dia_vlk_6134_valeran_recrdt_no_no);
};

func void dia_vlk_6134_valeran_recrdt_no_yes()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_yes_15_00");	//Dobře, jsi přijat. Uvidíme se v tvrzi. Pokud budeš vyzván k sdělení hesla, je to 'dračí poklad'.
	AI_Output(self,other,"DIA_VLK_6134_VALERAN_RecrDT_no_yes_01_01");	//Děkuji. Vydám se hned na cestu!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Valeran souhlasil, že mě bude dělat správce.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	VALERANRECRUITEDDT = TRUE;
	VALERANBONUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_vlk_6134_valeran_recrdt_no_no()
{
	AI_Output(other,self,"DIA_VLK_6134_VALERAN_RecrDT_no_no_15_00");	//Pořád příliš. Bojím se, že nemůžu využít tvých služeb.
	Info_ClearChoices(dia_vlk_6134_valeran_recrdt);
};

instance DIA_VALERAN_FIRSTCEO(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_condition;
	information = dia_valeran_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_valeran_firstceo_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_info()
{
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_00");	//Pěkná tvrz.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_01");	//Zatím je to tu sice hrozný, ale tohle místo má velký potenciál.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_02");	//Říkal jsi, že zde chceš vybudovat tábor. Nepletu se?
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_03");	//Ano. Lord Hagen chce, abych v této oblasti nastolil pořádek a z toho důvodu mě byla přenechána tahle tvrz.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_04");	//A ze stejného důvodu souhlasil i Onar.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_05");	//Ale nemůžu spravovat a chránit tuhle tvrz sám, potřebuju lidi. S prvními dvěma ses už seznámil.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_06");	//Líbí se mi tvé plány. Poslouchej, nejprve budeme muset tohle místo trochu zkulturnit.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_07");	//No úplně nejdřív od tebe budu potřebovat určitý obnos na nejnutnější výdaje.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_15_08");	//Kolik?
	AI_Output(self,other,"DIA_Valeran_FirstCEO_10_09");	//Myslím, že 5000 zlatých bude stačit.
	CEONEEDSFIRSTMONEY = TRUE;
};


instance DIA_VALERAN_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_moneylate_condition;
	information = dia_valeran_firstceo_moneylate_info;
	permanent = FALSE;
	description = "Tady je 5000 zlatých.";
};


func int dia_valeran_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Valeran_FirstCEO_MoneyLate_15_00");	//Tady je 5000 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_01");	//Dobře. S penězi si nyní nemusíme dělat starosti a já můžu začít s parcí.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_02");	//Mimo to, já i ostaní potřebujem něco k jídlu.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_MoneyLate_10_03");	//Myslím, že pro začátek by mohlo stačit 50 kusů opečeného masa, 25 kusů čerstvých ryb a 10 chlebů.
	CEONEEDSFIRSTFOOD = TRUE;
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Pro lidi, co žijí v mé tvrzi potřebuji zásoby jídla - pro začátek 50 kusů opečeného masa, 25 ryb a 10 chlebů.");
};

instance DIA_VALERAN_FIRSTCEO_FOODLATE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = dia_valeran_firstceo_foodlate_condition;
	information = dia_valeran_firstceo_foodlate_info;
	permanent = FALSE;
	description = "Tady je všechno potřebné jídlo.";
};

func int dia_valeran_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_00");	//Tady je všechno potřebné jídlo.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_01");	//Výborně! Teď mám dost peněz i jídla, abych vedl hospodářství bez problémů.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_02");	//Ale bude to stačit jen na určitou dobu. Nechceš přeci, aby se ti to tady celé zhroutilo?
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_03");	//Samozřejmě, že ne. Řekni mi, co mám dělat, abych tomu předešel?
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_04");	//Najdi lidi, co pro tebe budou chtít pracovat. 	
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_05");	//Například lovce, kteří budou zajišťovat maso pro zdejší obyvatele.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_06");	//Také je tady důl, možná v něm ještě zůstala nějaká ruda. Měl bys to prověřit.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_07");	//Jedním slovem, přemýšlej. Hodně cestuješ, ne jako já, tak sežeň lidi, kteří se k tobě budou chtít přidat.
	AI_Output(other,self,"DIA_Valeran_FirstCEO_FoodLate_15_08");	//Dobře... Myslím, že mě pár lidí napadá.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_09");	//Hodně štěstí při hledání. A pamatuj, že dodávky jídla a finanční zajištění jsou na tobě a že většina lidí by chtěla jíst třikrát denně.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_10");	//Já se tím nemohu zabývat, jelikož to vyžaduje cestování mimo tvrz, a pak bych se nemohl věnovat svým povinnostem - řízení a organizaci tábora.
	AI_Output(self,other,"DIA_Valeran_FirstCEO_FoodLate_10_11");	//Nemůžeš dopustit, aby v tvrzi došli peníze a jídlo.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Teď, když mám správce, mohu přemýšlet o vylepšeních a hledání lidí, co budou ochotni pro mě pracovat. Zároveň musím myslet na to, aby v táboře nedošli peníze a jídlo.");
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireCook(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireCook_condition;
	information = DIA_VALERAN_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireCook_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireCook == TRUE) && (EddaIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireCook_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_00");	//Do tábora začali přicházet první dodávky potravin. To je dobrá zpráva!
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_01");	//Teď vyvstává otázka jeho skladování. Bez dobrého uskladnění se budou potraviny kazit.
	AI_Output(other,self,"DIA_VALERAN_CanHireCook_10_02");	//A co navrhuješ?
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_03");	//Podle mého názoru by se šiknul dobrý kuchař, který by si s tím problémem dokázal poradit.
	AI_Output(self,other,"DIA_VALERAN_CanHireCook_10_04");	//Popřemýšlej nad tím, je to vážná věc.
	AI_Output(other,self,"DIA_VALERAN_CanHireCook_10_05");	//Dobře, zkusím to nějak zařídit.
	EddaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"V táboře je potřeba kuchař, který by se postaral i o skladování potravin. Zajímalo by mě, kde se na něj poptat?");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireSmith(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireSmith_condition;
	information = DIA_VALERAN_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireSmith_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanHireSmith == TRUE) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireSmith_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_00");	//V táboře započala těžba rudy.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_01");	//Je čas přemýšlet o tom, kde sehnat dobrého kováře. Tím spíš, že kovárnu tady už máme.
	AI_Output(other,self,"DIA_VALERAN_CanHireSmith_10_02");	//A kde ho mám hledat? Dobrých kovářů je na tomhle ostrově už tak málo.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_03");	//Souhlasím. Ale jestli chceš, aby tvůj tábor za něco stál, tak bys ho měl najít.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_04");	//Nabrousit zbraně, vyspravit zbroj a vyrábět předměty z rudy, kterou těžíme, dokáže jenom kovář.
	AI_Output(self,other,"DIA_VALERAN_CanHireSmith_10_05");	//Tak co kdybys radši zapnul mozkové závity a popřemýšlel, kdo by to místo mohl vzít.
	AI_Output(other,self,"DIA_VALERAN_CanHireSmith_10_06");	//Dobře, zkusím něco vymyslet.
	CarlNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Tábor potřebuje kováře. Bez něho se nemůže dál rozvíjet.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanHireHealer(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanHireHealer_condition;
	information = DIA_VALERAN_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanHireHealer_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_00");	//V posledních dnech v táboře přibylo stráží.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_01");	//To je dobře, protože jsem nedávno byl napaden několika dravými potvorami.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_02");	//Jeden ze strážců utrpěl v tom souboji zranění, no naštěstí nejsou příliš vážná.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_03");	//Ale jestli to tak půjde dál, tak budem za chvilku bez lidí.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_04");	//Na co narážíš?
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_05");	//Potřebujeme léčitele. A také alchymistu, který dokáže na ošetření takových zranění vařit lektvary.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_06");	//Hmm... To bude větší problém, než s kovářem.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_07");	//Chápu, že to není snadný úkol, ale od jeho vyřešení závisí životy lidí v táboře.
	AI_Output(self,other,"DIA_VALERAN_CanHireHealer_10_08");	//Proto bys s tím měl něco udělat.
	AI_Output(other,self,"DIA_VALERAN_CanHireHealer_10_09");	//Dobře, seženu nám léčitele.
	SagittaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Tábor potřebuje léčitele. Bez něj tu lidé dlouho nepřežijí.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceSmith(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceSmith_condition;
	information = DIA_VALERAN_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanProduceSmith_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_00");	//Carl začal pracovat v kovárně. Jsem rád, že se ti ho povedlo přemluvit, aby pro nás pracoval.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_01");	//Teď si musíme promluvit o tom hlavním.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_03");	//Kovárna musí přinášet zisky, jinak je k ničemu.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_04");	//Dobrá, jaké máš nápady?
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_05");	//Mohli bychom naše zásoby rudy přetavit na ingoty.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_06");	//To je tovar, po kterém je nyní největší poptávka, a taky nám to umožní snížit náklady na provoz tábora.
	AI_Output(other,self,"DIA_VALERAN_CanProduceSmith_10_07");	//To zní dobře.
	AI_Output(self,other,"DIA_VALERAN_CanProduceSmith_10_08");	//Mně se to taky líbí. Tak nad tím popřemýšlej. 
	CanSellOre = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Erol navrhl použít zásoby rudy pro výrobu železných ingotů, které pak můžeme dál prodávat. To nám bude poskytovat dostatečný příjem.");
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CanProduceWeapon(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CanProduceWeapon_condition;
	information = DIA_VALERAN_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((VALERANRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CanProduceWeapon_info()
{
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_01");	//V poslední době v táboře přibylo lidí. Myslím, že bychom měli lépe vyzbrojit naše stráže.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_02");	//Tím spíš, že jsou těžké časy, kolem dokola se to hemží dravou zvěří.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_03");	//Někdo nedávno dokonce viděl poblíž živého skřeta!
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_04");	//Jestli se nebudeme starat o svou bezpečnost, stane se tohle místo brzo kořistí zločinců nebo skřetů.
	AI_Output(other,self,"DIA_VALERAN_CanProduceWeapon_10_05");	//Co pro to můžeme udělat?
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_06");	//Zbraně nám vyková Carl. Není to sice mistr kovář, ale vykovat dobrý meč dovede.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_07");	//Ale naši chlapci potřebují lepší zbroje. To co mají teď, je nezachrání ani před krvavou mouchou.
	AI_Output(other,self,"DIA_VALERAN_CanProduceWeapon_10_08");	//Co navrhuješ?
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_13");	//Abychom mohli vyrábět vlastní zbroje, potřebujeme schémata a nákresy.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_14");	//Vím, že jsi navštívil různá místa, tak jsi třeba něco podobného už viděl.
	AI_Output(self,other,"DIA_VALERAN_CanProduceWeapon_10_15");	//Jestli něco získáš, dones to ke mně a já se už postarám, aby naši chlapci nechodili v hadrech.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_CrawlerArmor(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_CrawlerArmor_condition;
	information = DIA_VALERAN_CrawlerArmor_info;
	permanent = FALSE;
	description = "Přinesl jsem plány zbroje.";
};

func int DIA_VALERAN_CrawlerArmor_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_VALERAN_CrawlerArmor_15_00");	//Přinesl jsem plány zbroje.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other,"DIA_VALERAN_CrawlerArmor_15_01");	//Dobře, dej mi je. Dám ty nákresy Carlovi, aby se s nimi seznámil.
	AI_Output(self,other,"DIA_VALERAN_CrawlerArmor_15_02");	//Jestli jim porozumí, možná dokáže tu zbroj i vyrobit a za pár dní by už všechny stráže mohly být pořádně vyzbrojeny.
	AI_Output(other,self,"DIA_VALERAN_CrawlerArmor_15_03");	//V to doufám.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instance DIA_VALERAN_ArmorDone(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 5;
	condition = DIA_VALERAN_ArmorDone_condition;
	information = DIA_VALERAN_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VALERAN_ArmorDone_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VALERAN_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_00");	//Carl vyrobil zbroje a já je rozdal mezi kluky.
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_01");	//Teď se o jejich bezpečnost už nemusíme starat, zbroje vypadají velmi silně.
	AI_Output(self,other,"DIA_VALERAN_ArmorDone_15_02");	//Tady, ber! Tenhle kousek jsem nechal vyrobit speciálně pro tebe. Určitě ti přijde vhod.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self,"DIA_VALERAN_ArmorDone_15_03");	//Děkuju.
};

instance DIA_VALERAN_BUSINESSACTION(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 21;
	condition = dia_valeran_businessaction_condition;
	information = dia_valeran_businessaction_info;
	permanent = TRUE;
	description = "Chtěl bych něco udělat...";
};

func int dia_valeran_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_businessaction_info()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_15_00");	//Chtěl bych něco udělat.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_10_01");	//Co konkrétně?		
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Vybrat zlato z táborové pokladnice.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Uložit zlato do táborové pokladnice.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Prodat proviant ze skladu v táboře.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Uložit proviant do skladu v táboře.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Začít s výrobou železných ingotů.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Zastavit výrobu železných ingotů.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_oretake()
{
	AI_Output(other,self,"dia_valeran_businessaction_oretake_15_00");	//Chtěl bych sebrat magickou rudu ze skladu v táboře.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other,"dia_valeran_businessaction_oretake_10_01");	//Bohužel na to teď nemáme dostatečné zásoby rudy.
	}
	else
	{
		AI_Output(self,other,"dia_valeran_businessaction_oretake_10_02");	//Dobře, tady je veškerá magická ruda, co máme.
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Vybrat zlato z táborové pokladnice.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Uložit zlato do táborové pokladnice.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Prodat proviant ze skladu v táboře.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Uložit proviant do skladu v táboře.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Začít s výrobou železných ingotů.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Zastavit výrobu železných ingotů.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_irontake()
{
	AI_Output(other,self,"dia_valeran_businessaction_irontake_15_00");	//Chtěl bych sebrat železnou rudu ze skladu v táboře.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other,"dia_valeran_businessaction_irontake_10_01");	//Bohužel na to teď nemáme dostatečné zásoby rudy.
	}
	else
	{
		AI_Output(self,other,"dia_valeran_businessaction_irontake_10_02");	//Dobře, tady je veškerá železná ruda, co máme.
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Vybrat zlato z táborové pokladnice.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Uložit zlato do táborové pokladnice.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Prodat proviant ze skladu v táboře.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Uložit proviant do skladu v táboře.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Zahájit výrobu železných ingotů.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Ukončit výrobu železných ingotů.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Vybrat zlato z táborové pokladnice.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Uložit zlato do táborové pokladnice.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Prodat proviant ze skladu v táboře.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Uložit proviant do skladu v táboře.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Začít s výrobou železných ingotů.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Zastavit výrobu železných ingotů.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_valeran_businessaction);
	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	Info_AddChoice(dia_valeran_businessaction,"Vybrat zlato z táborové pokladnice.",dia_valeran_businessaction_budgettake);
	Info_AddChoice(dia_valeran_businessaction,"Uložit zlato do táborové pokladnice.",dia_valeran_businessaction_budgetgive);
	Info_AddChoice(dia_valeran_businessaction,"Prodat proviant ze skladu v táboře.",dia_valeran_businessaction_foodsell);
	Info_AddChoice(dia_valeran_businessaction,"Uložit proviant do skladu v táboře.",dia_valeran_businessaction_foodgive);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat magickou rudu ze skladu v táboře.",DIA_valeran_businessaction_oretake);
	Info_AddChoice(DIA_valeran_businessaction,"Sebrat železnou rudu ze skladu v táboře.",DIA_valeran_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_valeran_businessaction,"Začít s výrobou železných ingotů.",DIA_valeran_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_valeran_businessaction,"Zastavit výrobu železných ingotů.",DIA_valeran_businessaction_produce_off);
		};
	};
};

func void dia_valeran_businessaction_back()
{
	Info_ClearChoices(dia_valeran_businessaction);
};

func void dia_valeran_businessaction_budgetgive()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_15_00");	//Chtěl bych uložit zlato do táborové pokladnice.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetGive_10_01");	//O jakou sumu jde?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_small()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Small_15_00");	//500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_medium()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Medium_15_00");	//1500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgetgive_huge()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetGive_Huge_15_00");	//2500 zlatých.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_15_00");	//Chtěl bych vybrat zlato z táborové pokladnice.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetTake_10_01");	//Bohužel ti teď zlato dát nemohu, mám v kase jen minimum potřebné k provozu tábora.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_BudgetTake_10_02");	//A kolik?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_budgettake_small()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Small_15_00");	//500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_medium()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Medium_15_00");	//1500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_BudgetTake_Huge_15_00");	//2500 zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_valeran_businessaction,"500 zlatých.",dia_valeran_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_valeran_businessaction,"1500 zlatých.",dia_valeran_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_valeran_businessaction,"2500 zlatých.",dia_valeran_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_15_00");	//Chtěl bych uložit proviant do skladu v táboře.
	AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodGive_10_01");	//Jaké množství zásob máš na mysli?
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů opečeného masa.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů syrového masa.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů čerstvých ryb.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 bochníků chleba.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_hmf()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_MF_15_00");	//20 kusů opečeného masa.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů opečeného masa.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů syrového masa.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů čerstvých ryb.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 bochníků chleba.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_mf()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_MF_15_00");	//20 kusů syrového masa.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů opečeného masa.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů syrového masa.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů čerstvých ryb.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 bochníků chleba.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_fb()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_FB_15_00");	//20 kusů čerstvých ryb.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů opečeného masa.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů syrového masa.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů čerstvých ryb.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 bochníků chleba.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodgive_bsc()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodGive_BSC_15_00");	//10 bochníků chleba.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů opečeného masa.",dia_valeran_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů syrového masa.",dia_valeran_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_businessaction,"20 kusů čerstvých ryb.",dia_valeran_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 bochníků chleba.",dia_valeran_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell()
{
	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_15_00");	//Chtěl bych prodat proviant ze skladu v táboře.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodSell_10_01");	//Bohužel to teď není možné, mám ve skladu jen minimum potřebné k provozu tábora.
		Info_ClearChoices(dia_valeran_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_BusinessAction_FoodSell_10_02");	//To by šlo zrealizovat. Kolik jídla chceš prodat?
		Info_ClearChoices(dia_valeran_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_valeran_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_valeran_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_valeran_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_valeran_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_valeran_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_valeran_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
	};
};

func void dia_valeran_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Small_15_00");	//10 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Medium_15_00");	//25 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

func void dia_valeran_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Valeran_BusinessAction_FoodSell_Huge_15_00");	//50 jednotek proviantu.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_valeran_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_valeran_businessaction,"10 jednotek proviantu. (příjem do táborové pokladnice: 50 zlatých)",dia_valeran_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_valeran_businessaction,"25 jednotek proviantu. (příjem do táborové pokladnice: 125 zlatých)",dia_valeran_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_valeran_businessaction,"50 jednotek proviantu. (příjem do táborové pokladnice: 250 zlatých)",dia_valeran_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_valeran_businessaction,Dialog_Back,dia_valeran_businessaction_back);
};

instance DIA_VALERAN_MONEYCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_moneycrisis_condition;
	information = dia_valeran_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_00");	//Ještě něco! V táboře nejsou peníze, nemám lidem jak vyplácet mzdu!
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_01");	//Jen tak-tak se mi je podařilo přemluvit, aby neodešli.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_07_02");	//Nutně potřebujeme zlato!
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_15_03");	//Kolik?
	concatText1 = ConcatStrings("Potřeba ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1," zlatých");
	AI_Print(concatText1);
	Info_ClearChoices(dia_valeran_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_valeran_moneycrisis,"Tady jsou peníze.",dia_valeran_moneycrisis_yes);
	};

	Info_AddChoice(dia_valeran_moneycrisis,"Nemám teď tolik zlata.",dia_valeran_moneycrisis_no);
};

func void dia_valeran_moneycrisis_yes()
{
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_Yes_15_00");	//Tady jsou peníze.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_Yes_07_01");	//Výborně, hned dám příkaz na vyplacení dluhů.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_valeran_moneycrisis_no()
{
	AI_Output(other,self,"DIA_Valeran_MoneyCrisis_No_15_00");	//Nemám teď tolik zlata.
	AI_Output(self,other,"DIA_Valeran_MoneyCrisis_No_07_01");	//Musíš ho sehnat! Nemůžeš být tak nezodpovědný.
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_FOODCRISIS(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 1;
	condition = dia_valeran_foodcrisis_condition;
	information = dia_valeran_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_valeran_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_foodcrisis_info()
{
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_00");	//Ještě něco! V táboře došel proviant, nemáme nic k jídlu!
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_01");	//Zatím jsem se domluvil s Onarem na dodávkách, ale čeká ho důležitá zakázka a jakmile ji bude muset zrealizovat, tak nám už nebude moci pomoct.
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_07_02");	//Nutně potřebujeme jídlo! Především maso, ryby a chléb...
	Info_ClearChoices(dia_valeran_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů opečeného masa.",dia_valeran_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů syrového masa.",dia_valeran_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů čerstvých ryb.",dia_valeran_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 10 bochníků chleba.",dia_valeran_foodcrisis_b);
	};

	Info_AddChoice(dia_valeran_foodcrisis,"Nemám u sebe tolik jídla.",dia_valeran_foodcrisis_no);
};

func void dia_valeran_foodcrisis_m()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_M_15_00");	//Tady máš 20 kusů opečeného masa.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_M_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_M_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů opečeného masa.",dia_valeran_foodcrisis_m);
		};
	};
};

func void dia_valeran_foodcrisis_rm()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_RM_15_00");	//Tady máš 20 kusů syrového masa.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_RM_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_RM_M_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů syrového masa.",dia_valeran_foodcrisis_rm);
		};
	};
};

func void dia_valeran_foodcrisis_f()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_F_15_00");	//Tady máš 20 kusů čerstvých ryb.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_F_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_F_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 20 kusů čerstvých ryb.",dia_valeran_foodcrisis_f);
		};
	};
};

func void dia_valeran_foodcrisis_b()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_B_15_00");	//Tady máš 10 bochníků chleba.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_B_07_01");	//Výborně, to jsme potřebovali.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_valeran_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Valeran_FoodCrisis_B_07_02");	//Ještě, potřebujeme víc jídla.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_valeran_foodcrisis,"Tady máš 10 bochníků chleba.",dia_valeran_foodcrisis_b);
		};
	};
};

func void dia_valeran_foodcrisis_no()
{
	AI_Output(other,self,"DIA_Valeran_FoodCrisis_No_15_00");	//Nemám u sebe tolik jídla. Sám žiju z ruky do huby.
	AI_Output(self,other,"DIA_Valeran_FoodCrisis_No_07_01");	//Ó, Innosi! Nemůžeš být tak nezodpovědný! Potřebujeme jídlo!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_IGETTHEFOUTOFHERE(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 15;
	condition = dia_valeran_igetthefoutofhere_condition;
	information = dia_valeran_igetthefoutofhere_info;
	permanent = FALSE;
	description = "Chystám se odplout na pevninu.";
};

func int dia_valeran_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (VALERANRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_valeran_igetthefoutofhere_info()
{
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_00");	//Chystám se odplout na pevninu. Můžeš dohlédnout na tvrz?
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_01");	//To jsou nám noviny... chceš odplout navždy, nebo se máš v úmyslu vrátit?
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_02");	//Bojím se, že už se do Khorinisu nevrátím. Jestli máš zájem starat se i nadále o tvrz, tak ti jí přenechám.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_03");	//Á... dobře, když to říkáš. Díky tvému úsilí jsme se zde dobře zabydleli, tak myslím, že mohu i nadále vést úspěšně tento tábor.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_04");	//Teď když se toje tvrz a Onarova farma, staly hlavním pilířem obrany proti skřetům. Můžeme upevnit vztahy s ostatnímy tábory, ve společném úsilí boje proti těmto tvorům.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_05");	//Tak si myslím, že můžeš bez obav odplout.
	AI_Output(self,other,"DIA_Valeran_IGetTheFOutOfHere_10_06");	//Udělal jsi pro nás všechno co jsi mohl a teď je řada na nás abychom se snažili. Šťastnou cestu!
	AI_Output(other,self,"DIA_Valeran_IGetTheFOutOfHere_15_07");	//Děkuji!
	AI_StopProcessInfos(self);
};

instance DIA_VALERAN_INTOWER(C_Info)
{
	npc = vlk_6134_valeran;
	nr = 22;
	condition = dia_valeran_intower_condition;
	information = dia_valeran_intower_info;
	permanent = TRUE;
	description = "Jak to vypadá v tvrzi?";
};

func int dia_valeran_intower_condition()
{
	if((VALERANRECRUITEDDT == TRUE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 5000))
	{
		return TRUE;
	};
};

func void dia_valeran_intower_info()
{
	AI_Output(other,self,"DIA_Valeran_InTower_15_00");	//Jak to vypadá v tvrzi?
	AI_Output(self,other,"DIA_Valeran_InTower_07_01");	//Dobře! Jestli budem mít dost jídla a peněz, nemusíš se strachovat.
};