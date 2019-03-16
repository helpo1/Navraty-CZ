
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = FALSE;
	description = "Zůstaneš ve městě?";
};

func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	if(MIS_JarCurse != LOG_Running)
	{
		return TRUE;
	};
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Zůstaneš ve městě?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//Někdo tu musí být.
	VatrasAbloeseIstDa = TRUE;

	if((RavenAway == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//Ještě jedna věc.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//Bylo opravdu hrdinské to co jsi dokázal Jharkendaru
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//Bohužel to ale musím dokázat i na Khorinisu.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//To ano...
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//Uvidíme se.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};

instance DIA_Addon_Myxir_CITY_AncientBookDone(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 10;
	condition = DIA_Addon_Myxir_CITY_AncientBookDone_Condition;
	information = DIA_Addon_Myxir_CITY_AncientBookDone_Info;
	permanent = FALSE;
	description = "Podívejte se na to.";
};

func int DIA_Addon_Myxir_CITY_AncientBookDone_Condition()
{
	if((MIS_MyxirAncientBook == LOG_Running) && (Npc_HasItems(hero,ItWr_AncientBook_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_AncientBookDone_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_00");	//Podívejte se na to. 
	B_GiveInvItems(other,self,ItWr_AncientBook_01,1);
	Npc_RemoveInvItems(self,ItWr_AncientBook_01,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_01");	//U Adana... (udiveně) Kde jsi našel tento starověký rukopis?
	AI_Output(other,self,"DIA_Addon_Myxir_AncientBookDone_01_02");	//Tam kam jsi mě poslal hledat, v knihovně Stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_03");	//Neuvěřitelné! Takže jsem měl pravdu a skutečně uchraňovali některé ze svých vědomostí zde v těchto knihách.
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_04");	//Je potřeba tyto záznamy co nejdříve důkladně prozkoumat!
	AI_Output(self,other,"DIA_Addon_Myxir_AncientBookDone_01_05");	//Možná se zde skrývají odpovědi na naše otázky.
	MIS_MyxirAncientBook = LOG_Success;
	Log_SetTopicStatus(TOPIC_MyxirAncientBook,LOG_Success);
	B_LogEntry(TOPIC_MyxirAncientBook,"Dal jsem Myxirovi knihu Stavitelů, kterou jsem našel v rozvalinách knihovny.");
};

var int DIA_Addon_Myxir_CITY_Teach_NoPerm;
var int DIA_Addon_Myxir_CITY_Teach_OneTime;

instance DIA_Addon_Myxir_CITY_Teach(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 90;
	condition = DIA_Addon_Myxir_CITY_Teach_Condition;
	information = DIA_Addon_Myxir_CITY_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě jazyk Stavitelů.";
};

func int DIA_Addon_Myxir_CITY_Teach_Condition()
{
	if((DIA_Addon_Myxir_CITY_Teach_NoPerm == FALSE) && ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauč mě jazyk Stavitelů.

	if(DIA_Addon_Myxir_CITY_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_CITY_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,Dialog_Back,DIA_Addon_Myxir_CITY_Teach_BACK);

		if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2);
		};
		if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
		{
			Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk Stavitelů.
		DIA_Addon_Myxir_CITY_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Dobře, začneme s něčím jednoduchým. Nejdřív se budeme zabývat jazykem rolníků.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty psané v jazyce rolníků většinou pojednávají o světských zájmech jako práce, láska a opatřování potravin.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to nejrozšířenější jazyk ve společnosti. Pokud si ho osvojíš, budeš rozumět většině textů, které se zde nacházejí.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//S jazykem rolníků ses už seznámil. Jazyk válečníků je trochu komplikovanější.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Jak asi tušíš, texty psané v jazyce válečníků většinou obsahují informace příbuzné válkám a zbraním. Myslím si, že pro tebe to bude velmi užitečné.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vznešenému jazyku kněží je velice těžké porozumět, ale já ti ho s radostí vysvětlím.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//V jazyku kněží jsou mimo jiné všechny posvátné texty, které vysvětlují příběh a magii Stavitelů.
		AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z těchto textů je pro člověka, který jim rozumí, opravdový poklad.
	};

	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};


instance DIA_ADDON_MYXIR_CITY_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_prayforgomez_condition;
	information = dia_addon_myxir_city_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji požehnání.";
};

func int dia_addon_myxir_city_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_PrayForGomez_01_01");	//Potřebuji požehnání.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_PrayForGomez_01_02");	//Promluv se Saturasem.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_PrayForGomez_01_03");	//Myslím, že ti pomůže.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_PrayForGomez_01_04");	//Díky za radu.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_MYXIR_CITY_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 1;
	condition = dia_addon_myxir_city_runemagicnotwork_condition;
	information = dia_addon_myxir_city_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš používat svou magii?";
};

func int dia_addon_myxir_city_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_00");	//Můžeš používat svou magii?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_01");	//Bojím se, že mé runy ztratily svou sílu.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_02");	//A nejen moje, ale i ostatních mágů Vody.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_03");	//Asi se v tomto světě stalo něco strašlivého, co nám sebralo náš dar.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_RuneMagicNotWork_01_04");	//Hmmm... Vypadá to tak.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Myxir_CITY_JarCurse(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_JarCurse_Condition;
	information = DIA_Addon_Myxir_CITY_JarCurse_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Myxir_CITY_JarCurse_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_JarCurse_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_00");	//Adanos buď pochválen! Přišel jsi právě včas!
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_01");	//Ještě chvíli, a bylo by po nás.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_02");	//A co to bylo za bytosti?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_03");	//Nevím. Takové nemrtvé jsem ještě neviděl.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_04");	//Naše magie jim skoro neublíží. Je to moc divné!
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_05");	//Napadá vás čím to může být?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_06");	//Mohu jen předpokládat, že to nějak souvisí s portálem.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_07");	//Když jsme sem přišli, chrámový sál kde se nyní nacházíme, se hemžil nemrtvými vojáky!
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_08");	//Skrýváme se zde v naději, že nás nenajdou.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_09");	//Jen díky tobě jsme ještě naživu!
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_10");	//Jestli máte pravdu tak mágové Vody, kteří zůstali v údolí, jsou teď ve smrtelném nebezpečí.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_11");	//Jistě situace na druhé straně portálu může být ještě horší.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_12");	//Pak to musíme prověřit. Já tě žádám, postarej se o to.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_13");	//Já se zatím vydám do města informovat Vatrase.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_14");	//A Mitras zůstane u portálu a bude na něj dávat pozor.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_15");	//Samo sebou! A jako vždy, mám nejjednodušší práci.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_16");	//Pochop, nyní jsi jediný kdo to může dokázat.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_17");	//Všichni bratři kruhu Vody nyní bojují s nemrtvími kteří napadli Khorinis.
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_JarCurse_01_18");	//Bez obav, nějak to vyřeším.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_19");	//Adanos ti žehnej...(povzdech) Ano, a než odejdeš promluv ještě s Mitrasem.
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_JarCurse_01_20");	//Myslím, že ho něco napadlo při tom střetu s nemrtvými.
	MyxirSendSaturas = TRUE;
	B_LogEntry(TOPIC_JarCurse,"Přijel jsem pravě včas. Myxir a Mitras se snažili odrazit skupinu nemrtvých vojáků, kteří je napadli. Jejich magie z nějakého důvodu nepůsobila těmto tvorům žádnou škodu. Podle Myxira je pravděpodobné, že nemrtvý pochází z portálu, který vede do Jharkendaru. Požádal mě, abych tam šel zkontrolovat situaci.");	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

//-------------------------------------------------Mitras--------------------------------------------------

instance DIA_KDW_1406_Mitras_EXIT(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 999;
	condition = DIA_KDW_1406_Mitras_EXIT_Condition;
	information = DIA_KDW_1406_Mitras_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1406_Mitras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1406_Mitras_Hello(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_Hello_condition;
	information = DIA_KDW_1406_Mitras_Hello_info;
	permanent = FALSE;
	description = "Příteli! Jsi taky mág Vody?";
};

func int DIA_KDW_1406_Mitras_Hello_condition()
{
	return TRUE;
};

func void DIA_KDW_1406_Mitras_Hello_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_00");	//Příteli! Jsi taky mág Vody?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_01");	//Ano jak vidíš. A proč se ptáš?
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_02");	//Prostě si nepamatuji, že bych tě v kolonii potkal.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_03");	//Je to tak...(klidně) Stal jsem se mágem nedávno! Vatras mě přijal mezi mágy Vody.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_Hello_01_04");	//Předtím jsem pomáhal jako jeden z bratrů kruhu Vody.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_Hello_01_05");	//Pochopitelně.
};

instance DIA_KDW_1406_Mitras_What(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_What_condition;
	information = DIA_KDW_1406_Mitras_What_info;
	permanent = FALSE;
	description = "Co tady děláte s Myxirem?";
};

func int DIA_KDW_1406_Mitras_What_condition()
{
	if(Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_What_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_What_01_00");	//Co tady děláte s Myxirem?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_01");	//Vatras nás sem poslal, abychom dohlédli na portál.

	if(MIS_JarCurse == LOG_Running)
	{
		AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_02");	//Ale jak vidíš, situace je zde mnohem složitější, než jsme si mysleli.
		AI_Output(self,other,"DIA_KDW_1406_Mitras_What_01_03");	//Jen díky Adanovi jsme stále naživu!
		AI_Output(other,self,"DIA_KDW_1406_Mitras_What_01_04");	//No ano... (pro sebe)... A mému meči.
	};		
};

instance DIA_KDW_1406_Mitras_JarCurse(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurse_condition;
	information = DIA_KDW_1406_Mitras_JarCurse_info;
	permanent = FALSE;
	description = "Co si myslíš o těch nemrtvých?";
};

func int DIA_KDW_1406_Mitras_JarCurse_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1406_Mitras_Hello) == TRUE) && (MIS_JarCurse == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurse_info()
{
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_00");	//Co si myslíš o těch nemrtvých?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_01");	//Možná se pletu, ale myslím si že je řídí nějaká zlá vůle, někoho jiného.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_02");	//Jak jsi na to přišel?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_03");	//Pamatuješ, když jsme sem poprvé s Myxirem přišli a vše bylo v pořádku.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_04");	//Ale pak jsme začali slyšet jakési divné zvuky.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_05");	//Každou noc se rozléhali v tomto podzemním chrámu! Stále z toho mám husí kůži.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_06");	//Nakonec jsem to už nemohl vydržet a musel jsem se vydat ven, abych ty zvuky už neslyšel.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_07");	//Ale nic se nezměnilo akorát to bylo silnější a hlasitější!
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_08");	//Zdroj toho zvuku přicházel odněkud z vrchu! S největší pravděpodobností z malého chrámu na vrcholu velké pyramidy.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_09");	//Bylo to jako modlitba, jako kdyby někdo četl magické kouzlo.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_10");	//Ale nějakým podivným jazykem, který jsem nikdy před tím neslyšel.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_11");	//A tak ses rozhodl tam podívat?
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_12");	//Ne...(ustrašeně) Po pravdě měl jsem strach, tak jsem se vrátil k Myxirovi.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_13");	//A pak o několik dní později byl chrá plný nemrtvých!
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_14");	//Tak si myslím, že to spolu nějak souvisí - ten podivný zvuk a nemrtví.
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurse_01_15");	//Dobře prověřím tu pyramidu.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurse_01_16");	//Dobře...(povzdechne si) Bude lepší se tam vypravit v noci, protože ve dne tam nikdo není. To už jsme zkoušeli.
	MIS_StrangeUpSound = LOG_Running;
	Log_CreateTopic(TOPIC_StrangeUpSound,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Running);
	B_LogEntry(TOPIC_StrangeUpSound,"Mitras mě vyprávěl o podivném zvuku, který předcházel, příchodu nemrtvých. Podle něj zdroj toho zvuku pocházel někde z chrámu, na vrcholu pyramidy. Myslím, že bych se tam měl podívat a to nejlépe v noci.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(DMT_1296_JARCURSEMAGE,"NW_TROLLAREA_RUINS_JARCURSE");
};

instance DIA_KDW_1406_Mitras_JarCurseDone(C_Info)
{
	npc = KDW_1406_Mitras;
	nr = 1;
	condition = DIA_KDW_1406_Mitras_JarCurseDone_condition;
	information = DIA_KDW_1406_Mitras_JarCurseDone_info;
	permanent = FALSE;
	description = "Přišel jsem na kloub tvojí noční můře.";
};

func int DIA_KDW_1406_Mitras_JarCurseDone_condition()
{
	if((MIS_StrangeUpSound == LOG_Running) && (Npc_IsDead(DMT_1296_JARCURSEMAGE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDW_1406_Mitras_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurseDone_01_00");	//Přišel jsem na kloub tvojí noční můře.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurseDone_01_01");	//Opravdu? (nedůvěřivě) A co to bylo?
	AI_Output(other,self,"DIA_KDW_1406_Mitras_JarCurseDone_01_02");	//Takový podivně vypadající nemrtví. Ale nic strašného.
	AI_Output(self,other,"DIA_KDW_1406_Mitras_JarCurseDone_01_03");	//Dobře, to mě uklidnilo.
	MIS_StrangeUpSound = LOG_Success;
	Log_SetTopicStatus(TOPIC_StrangeUpSound,LOG_Success);
	B_LogEntry(TOPIC_StrangeUpSound,"Uklidnil jsem Mitrase, že jsem se vypořádal s tím, co ho tak znepokojovalo.");	
};

//-------------------------------------------------Norolas--------------------------------------------------

instance DIA_KDW_1407_Norolas_EXIT(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 999;
	condition = DIA_KDW_1407_Norolas_EXIT_Condition;
	information = DIA_KDW_1407_Norolas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_KDW_1407_Norolas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_KDW_1407_Norolas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_Hello(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Hello_condition;
	information = DIA_KDW_1407_Norolas_Hello_info;
	permanent = FALSE;
	description = "Ty jsi mág Vody?";
};

func int DIA_KDW_1407_Norolas_Hello_condition()
{
	if(MIS_SendNorolas == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_01");	//Ty jsi mág Vody?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_02");	//No při pohledu na mé roucho, to není těžké uhodnout.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_03");	//Znamená to že jsi ten koho Saturas poslal s úkolem do močálu?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_04");	//Ano máš pravdu, i když opravdu nevím, odkud to víš ty.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Hello_01_05");	//Saturas mě poslal, abych na tebe dohlédnul, přecejen je to tam celkem nebezpečné.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Hello_01_06");	//Pak je to jasné, ale já opravdu pomoc nepotřebuju.
	B_LogEntry(TOPIC_SendNorolas,"Za skřetí palisádou jsem potkal Norolase, mága Vody. Podle všeho, to jeho poslal Saturas, do tábora v bažinách aby prozkoumal chrám.");
};

instance DIA_KDW_1407_Norolas_Progress(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Progress_condition;
	information = DIA_KDW_1407_Norolas_Progress_info;
	permanent = FALSE;
	description = "Jak se vyvíjí situace?";
};

func int DIA_KDW_1407_Norolas_Progress_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) == TRUE) && (MIS_SendNorolas == LOG_Running) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Progress_info()
{
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Progress_01_01");	//Jak se vyvíjí situace?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_02");	//Špatně, v bažině se to hemží všemy druhy nemrtvých.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_03");	//Chtěl jsem se tam vydat, ale jen stěží jsem byl schopen pohnout nohama.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_04");	//Takže tu celí den sedím a přemýšlím jak se dostat do chrámu Bratrstva.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Progress_01_05");	//Takže se potřebuješ dostat do chrámu?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_06");	//No s největší pravděpodobností, to co Saturas potřebuje, je právě tam.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_07");	//Ale v každém případě, teď na to mohu zapomenout.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Progress_01_08");	//Podle pověstí tam přebývá, něco mnohem horšího než obyčejný nemrtvý.
	B_LogEntry(TOPIC_SendNorolas,"Norolas mě řekl, že bažiny se hemží nemrtvými a je sebevražda se tam vypravit. Kromě toho, chrám obývá něco ještě mnohem horšího.");
};

instance DIA_KDW_1407_Norolas_Idea(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Idea_condition;
	information = DIA_KDW_1407_Norolas_Idea_info;
	permanent = FALSE;
	description = "Tak co, nějaké nápady?";
};

func int DIA_KDW_1407_Norolas_Idea_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Progress) == TRUE) && (MIS_SendNorolas == LOG_Running) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Idea_info()
{
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_01");	//Tak co, nějaké nápady?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_02");	//(zamyšleně) Něco by tu bylo. Ale k tomu potřebuji tvoji pomoc. Sám to nezvládnu.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_03");	//No tak, ven s tím. Co máš za lubem?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_04");	//Chci vytvořit speciální lektvar, který mě umožní, volně se procházet mezi nemrtvými.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_05");	//Hmmm... A jak?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_06");	//Když ho vypiju budou mě považovat za jednoho z nich.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_07");	//Zajímavý nápad. A víš, jak uvařit takoví elixír?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_08");	//Bohužel, ne. Bohužel ne. Ale vím, že existuje recept s podrobným popisem přípravy tohoto elixíru.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_09");	//Alespoň to bylo napsáno v jedné z knih, které jsem kdysi četl v knihovně mágů Ohně.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_10");	//Zajímavé! A jaktože ti umožnily nahlížet do svých záznamů?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_11");	//To bude tím, že jsem nebyl vždy mág Vody. 
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_12");	//Žil jsem v klášteře a byl jsem jedním z jejich noviců.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_13");	//Ale pak jsem ho opustil a rozhodl se zasvětit svůj život službě Adanovi.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_14");	//Takže ten recept existuje, zbývá ho jenom najít a připravit recept.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_15");	//Dobře zkusím ho získat, ale neslibuju, že to bude rychle.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_16");	//Koneckonců, jak jsem pochopil máš tušení kde ho hledat.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_17");	//Já nezpěchám, a stejně je to jediná možnost jak se dostat do chrámu.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Idea_01_18");	//Pokud samozřejmě nechceš bojovat s hordou nemrtvých.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Idea_01_19");	//No, kdo ví...
	B_LogEntry(TOPIC_SendNorolas,"Norolas má představu jak se dotatdo chrámu. Vyprávěl mi o lektvaru který může změnit vnímání nemrtvých. Sice neví jak ten lektvar připravit, ale je přesvědčený že recept se nachází někde v Hornickém údolí.");
};

instance DIA_KDW_1407_Norolas_Rezept(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_condition;
	information = DIA_KDW_1407_Norolas_Rezept_info;
	permanent = FALSE;
	description = "Koukej co mám.";
};

func int DIA_KDW_1407_Norolas_Rezept_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Idea) == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_RezeptMist) >= 1) && (UberionBook == FALSE) && (Npc_HasItems(hero,ItWr_UberionBook) == 0))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_01");	//Koukej co mám.
	B_GiveInvItems(other,self,ItWr_RezeptMist,1);
	Npc_RemoveInvItems(self,ItWr_RezeptMist,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_02");	//Ano, zdá se, že je to on.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_03");	//Avšak tento recept je mnohem složitější, než jsem očekával.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_04");	//Co tím myslíš?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_05");	//Pro jeho přípravu potřebujeme určité specifické ingredience.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_06");	//Navíc některé ani nevím kde hledat.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_07");	//Například?
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_08");	//Například rostlina, která je zde uvedná, jako 'Černý jetel'.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_09");	//Ale to je jen malá část toho, co je třeba nalézt!
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_10");	//Mám pocit, že jejich sehnání bude můj další úkol.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_11");	//No...(váhavě) Postaral bych se o to sám, ale pak by mě nezbýval čas na přípravu elixíru.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_12");	//A jak víš nemáme moc času.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_01_13");	//Dobře, už to nemusíš rozebírat, pochopil jsem.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_14");	//Teď si vem ten seznam, zde jsou všechny ingredience co budu potřebovat.
	B_GiveInvItems(self,other,ItWr_RezeptIngridients,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_01_15");	//A já pomalu začnu s přípravou.
	B_LogEntry(TOPIC_SendNorolas,"Teď potřebuju pro Norolase získa ingredience které jsou uvedeny v receptu.");
};

instance DIA_KDW_1407_Norolas_Rezept_Ingr(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_Rezept_Ingr_condition;
	information = DIA_KDW_1407_Norolas_Rezept_Ingr_info;
	permanent = FALSE;
	description = "Posbíral jsem vše co potřebuješ.";
};

func int DIA_KDW_1407_Norolas_Rezept_Ingr_condition()
{
	if((KnowRezIng == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItPl_DarkClover) >= 1) && (Npc_HasItems(hero,ItAt_SkeletonBone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITMI_ZOMBIECORPSE) >= 1) && (Npc_HasItems(hero,ITAT_CRAWLERQUEEN) >= 1) && (Npc_HasItems(hero,ItAt_DemonHeart) >= 1) && (Npc_HasItems(hero,ItMi_NecrUrn) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_Rezept_Ingr_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_01");	//Posbíral jsem vše co potřebuješ.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItAt_SkeletonBone,1);
	Npc_RemoveInvItems(other,ItMi_DarkPearl,1);
	Npc_RemoveInvItems(other,ITMI_ZOMBIECORPSE,1);
	Npc_RemoveInvItems(other,ITAT_CRAWLERQUEEN,1);
	Npc_RemoveInvItems(other,ItAt_DemonHeart,1);
	Npc_RemoveInvItems(other,ItMi_NecrUrn,1);
	Npc_RemoveInvItems(other,ItPl_DarkClover,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_02");	//Výborně, teď konečně můžu dokončit elixír.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_03");	//Počkej chvilku...(napjatě) Už mám vše připravené, takže to bude hned hotové.
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_04");	//To je vše, a je to.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_05");	//Jestli to dobře chápu, tak je potřeba ho vyzkoušet.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_06");	//Myslím, že ano. No, víš já...(nervózně) Nejsem na to zrovna připraven.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_07");	//Ne že bych pochybovat o správnosti jeho přípravy, ale... 
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_08");	//Chápu tvoje obavy. Tak to sem dej, já to vyzkouším.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_09");	//(Nevěřícně) Jsi si úplně jistý? Nemohu zaručit, že to nebude mít vedlejší účinky na tvoji mysl.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_10");	//Dej mi to. A uvidíme.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_11");	//No, pokud sis tak jistý... Tady, vezmi si ho.
	B_GiveInvItems(self,other,ItPo_UndeadShield,1);
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_12");	//(rozrušeně) Doufám, že... že tě nezabije!
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_13");	//A ještě... bude lepší, když ho vypiješ těsně před tím než půjdeš do bažiny.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_Rezept_Ingr_01_14");	//Jeho působení není neomezené. Ale mělo by ti to stačit aby ses dostal kam potřebuješ beze strachu z nemrtvých.
	B_LogEntry(TOPIC_SendNorolas,"Přinesl jsem Norolasovi všechno co potřeboval k vytvoření lektvaru, lektvar by mě měl ochránit před nemrtvými aspoň na nějakou dobu, proto bych si měl vzít lektvar těsně než půjdu do bažiny.");
	AI_StopProcessInfos(self);
};

instance DIA_KDW_1407_Norolas_UberianBook(C_Info)
{
	npc = KDW_1407_Norolas;
	nr = 1;
	condition = DIA_KDW_1407_Norolas_UberianBook_condition;
	information = DIA_KDW_1407_Norolas_UberianBook_info;
	permanent = FALSE;
	description = "Koukej co jsem našel v bažině.";
};

func int DIA_KDW_1407_Norolas_UberianBook_condition()
{
	if((Npc_KnowsInfo(hero,DIA_KDW_1407_Norolas_Hello) == TRUE) && (MIS_SendNorolas == LOG_Running) && (Npc_HasItems(hero,ItWr_UberionBook) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_1407_Norolas_UberianBook_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_01");	//Koukej co jsem našel v bažině.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_02");	//Hmm, ano... (zamyšleně) Vypadá to, že to je to, co hledáme!
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_03");	//Myslím, že bude lepší když to doneseš mistru Saturasovi.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_04");	//Myslím, že bude mít velkou radost z tohodle objevu, protože v této knize je velké množství skrytých tajemství Spáčovy magie.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_05");	//Dobře, a co ty?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_06");	//Já zatím zůstanu tady. 
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_07");	//Co tě k tomu přimělo?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_08");	//Slyšel jsem, že nedaleko od tud se nachází tábor bývalých noviců Bratrstva. 
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_09");	//Chtěl bych si s nimi promluvit.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_10");	//A to zejména s jejich vůdcem, který je údajně skutečný druid!
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_11");	//Druid?
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_12");	//Nebo jak si říkají - mág přírody.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_13");	//To je jediná věc co o nich vím.
	AI_Output(self,other,"DIA_KDW_1407_Norolas_UberianBook_01_14");	//A proto si nechci nechat ujít, tuto jedinečnou příležitost něco se o nich dozvědět.
	AI_Output(other,self,"DIA_KDW_1407_Norolas_UberianBook_01_15");	//No dobře, jak chceš.
	MIS_SendNorolas = LOG_Success;
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Success);
	B_LogEntry(TOPIC_SendNorolas,"Ukázal jsem Norolasovi knihu co jsem našel v táboře v bažinách. Poprosil mě jestli bych ji nepředal Saturasovi. Sám se vypravil do tábora bývalých noviců Bratrstva, který se nacházel poblíž.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NetbekLager");
};