/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Addon_Saturas_EXIT(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 999;
	condition = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_EXIT_Info()
{
	if((MIS_Addon_Saturas_BringRiordian2Me == FALSE) && (KAPITELORCATC == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Když už tě nic neodradí, abys ostatní mágy rušil od práce, můžeš jednomu z nich ode mě něco vzkázat.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Vyřiď Riordianovi, že bych ho tu rád viděl.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//Zdržuje se v zadní části krypty. Tam ho najdeš.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_Running;
		Log_CreateTopic(TOPIC_Addon_HolRiordian,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian,LOG_Running);
		B_LogEntry(TOPIC_Addon_HolRiordian,"Saturas chce, abych za ním poslal mága Vody Riordiana. Měl by být na místě vykopávek, někde vzadu v hrobce.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Nefarius(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Nefarius_Condition;
	information = DIA_Addon_Saturas_Nefarius_Info;
	description = "Mám najít ztracené části ornamentu pro Nefariuse.";
};


func int DIA_Addon_Saturas_Nefarius_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Nefarius_Info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//Mám najít ztracené části ornamentu pro Nefariuse.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//Cože? To je neuvěřitelné! Zase jsi do toho zapleten i TY?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Žádný strach, přinesu sem ty věci.

	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(povzdech) Víš alespoň, co máš hledat?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius mi dal tuhle mapu...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Ukaž mi ji!
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmm. V tom velkém hvozdu je to velice nebezpečné. Neměl bys tam chodit sám.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Poohlédni se v Khorinisu po někom, kdo by tě doprovodil.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//Nechci, aby tě sežraly nějaké nestvůry - a s tebou i ten ornament.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Tady máš tu mapu.
		Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
		B_LogEntry(TOPIC_Addon_Ornament,"Saturas mě nabádal, abych úlomek ornamentu ve velkém lese nehledal sám. Měl bych zajít do Khorinisu a poohlédnout se po někom, kdo by mě doprovodil.");
	};
};


instance DIA_Addon_Saturas_Hallo(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_Hallo_Condition;
	information = DIA_Addon_Saturas_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition()
{
	Npc_PerceiveAll(self);

	if(Wld_DetectNpc(self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		if(KAPITELORCATC == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Saturas_Hallo_WEISSTDU()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_00");	//Máš vůbec ponětí o tom, co jsi udělal?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_01");	//Dostal jsi strukturu magie do takového chaosu, že to bylo cítit až v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_02");	//Můžeš děkovat nebesům, že bariéra padla.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_WEISSTDU_15_03");	//Proč si stěžuješ? Všechno dobře dopadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_04");	//(křik) Buď zticha!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_WEISSTDU_14_05");	//(rozzlobeně) Co tady stejně k čertu chceš?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
};

func void DIA_Addon_Saturas_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Zbláznil ses? Zmiz odsud.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//V těchto hrobkách je příliš nebezpečné hrát si na dobrodruha.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(rozčileně) Poslyš, neznáme my se? Samozřejmě! Ty hajzle!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//(rozčileně) Nemysli si, že jsem zapomněl, jak jsi nás tenkrát v Novém táboře podrazil.
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"(rozpačitě) Já...",DIA_Addon_Saturas_Hallo_Video);
};

func void DIA_Addon_Saturas_Hallo_Video()
{
	PlayVideo("RET2_Oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//(rozčileně) Vyčerpal jsi magickou moc z celé rudné haldy a pak ses prostě vypařil!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(rozčileně) Co sis vůbec myslel, že děláš?
	Info_ClearChoices(DIA_Addon_Saturas_Hallo);

	// if(RhetorikSkillValue[1] >= 15)
	// {	
		Info_AddChoice(DIA_Addon_Saturas_Hallo,	
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 15, TRUE), "Váš plán by stejně nefungoval."),
			// "Váš plán by stejně nefungoval.",	
			DIA_Addon_Saturas_Hallo_Spott);
	// }; 

	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Je mi to líto. Nevěděl jsem, co dělám.",DIA_Addon_Saturas_Hallo_sorry);
	Info_AddChoice(DIA_Addon_Saturas_Hallo,"Bylo to nevyhnutelné.",DIA_Addon_Saturas_Hallo_notwendig);
};

func void DIA_Addon_Saturas_Hallo_notwendig()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//Bylo to nevyhnutelné. Bez síly rudy bych nikdy Spáče neporazil.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//(rozzuřeně) Co to blábolíš? Spáč a poražený?
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_Spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Váš plán by stejně nefungoval. Odpálení bariéry pomocí haldy rudy je největší pitomost, jakou jsem kdy slyšel.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Nakonec byste do vzduchu vyhodili sami sebe.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//(rozzuřeně) To už je vrchol! Kdo ti dal právo soudit nás a naše úmysly?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//Kdybych nebyl tak mírumilovný, seslal bych na tebe Adanův hněv, chlapče.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	DIA_Addon_Saturas_Hallo_WEISSTDU();
};

func void DIA_Addon_Saturas_Hallo_sorry()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//Je mi to líto. Nevěděl jsem, co dělám.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//Vážně? A to si myslíš, že tě omlouvá?
	DIA_Addon_Saturas_Hallo_WEISSTDU();
};


instance DIA_Addon_Saturas_keineAhnung(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_keineAhnung_Condition;
	information = DIA_Addon_Saturas_keineAhnung_Info;
	description = "Nemám tušení.";
};


func int DIA_Addon_Saturas_keineAhnung_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_keineAhnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//Nemám tušení. Říkal jsem si, že se jen tak zastavím.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//Jen mě připravuješ o čas. Zmiz odsud.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(k sobě) Vyřídím si to s tebou později.
	Log_CreateTopic(TOPIC_Addon_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_KDW,"Našel jsem mágy Vody na místě jejich vykopávek. Nejdřív bych měl zjistit, co tady ve skutečnosti dělají. Saturas nebyl ochoten mi to říct. Pořád nemůže zapomenout na události z trestanecké kolonie.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Saturas_raus(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_raus_Condition;
	information = DIA_Addon_Saturas_raus_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Saturas_raus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_keineAhnung) && (MIS_Addon_Lares_Ornament2Saturas == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_raus_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Ztrať se, než se ti něco stane.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_Lares(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Lares_Condition;
	information = DIA_Addon_Saturas_Lares_Info;
	description = "Přišel jsem sem s Laresem.";
};


func int DIA_Addon_Saturas_Lares_Condition()
{
	if(Lares_Angekommen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_Lares_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//Přišel jsem sem s Laresem.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//(znepokojeně) S Laresem? Vážně? A kde je?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//Jsem tu sám, Lares se vrátil do města.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//Cože? A to tě k nám poslal samotného? Co si vůbec myslí?
};


instance DIA_Addon_Saturas_Ornament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_Ornament_Condition;
	information = DIA_Addon_Saturas_Ornament_Info;
	description = "Přinesl jsem ti ornament.";
};

func int DIA_Addon_Saturas_Ornament_Condition()
{
	if((Npc_HasItems(other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE)) || ((Lares_Angekommen == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_Lares) && Npc_HasItems(other,ItMi_Ornament_Addon_Vatras)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Ornament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//Přinesl jsem ti ornament.
	B_GiveInvItems(other,self,ItMi_Ornament_Addon_Vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//Co to má pro všechno na světě znamenat?
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Kdo ti to dal? Neříkej mi, že ti ho Lares jen tak nechal.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Uklidni se. Přinesl jsem ti ho. Chceš ho nebo ne?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Samozřejmě. Ale znervózňuje mě, že ses do hry vložil zrovna TY.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Proč s tou starou historií s rudnou haldou tolik naděláš?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//Koneckonců, už dříve jsem pro vás pracoval. A nemůžeš říct, že jsem byl nespolehlivý.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(povzdech) A co mi to nakonec přineslo? Pche, nemysli si, že bych ti snad věřil.
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;
	Wld_InsertNpc(Bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(Giant_Bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(Lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(Gobbo_Black,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(Giant_Rat,"NW_TROLLAREA_RATS_01");
};

instance DIA_Addon_Saturas_HowYouHere(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_HowYouHere_Condition;
	information = DIA_Addon_Saturas_HowYouHere_Info;
	description = "Jak jste se sem dostali?";
};

func int DIA_Addon_Saturas_HowYouHere_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_HowYouHere_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_00");	//Jak jste se sem dostali?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_01");	//Po pádu bariéry jsme ještě chvíli zůstali v Novém táboře.
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_02");	//Proč?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_03");	//Museli jsme sesbírat mnoho cenností! Za ta léta, které jsme strávili za bariérou, jsme shromáždili velikou část naší práce a vědění.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_04");	//Popravdě jsme většinu stejně museli nechat na místě, dokud nepřijdou lepší časy.
	AI_Output(other,self,"DIA_Addon_Saturas_HowYouHere_01_05");	//A co se s nimi stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_06");	//Když jsme přijeli do Khorinisu, většinu téhle části ostrova už zachvátila panika! Mnozí lidé si mysleli, že trestanci zaútočí na město.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_07");	//Ale jejich strach se nenaplnil. (spokojeně) S příchodem paladinů na Khorinis se situace stabilizovala a město už nebylo ohroženo.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_08");	//Vatras, jediný mág Vody v téhle části ostrova nás srdečně přijal a zásobil vším potřebným.
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_09");	//A pak jsme se rozhodli jít sem, abychom prozkoumali zbytky prastaré civilizace, která podle Vatrasova názoru uctívala samotného Adana!
	AI_Output(self,other,"DIA_Addon_Saturas_HowYouHere_01_10");	//Teď musíme vyřešit tajemství ukryta v těchto prastarých síních.
};

instance DIA_Addon_Saturas_geheimbund(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_geheimbund_Condition;
	information = DIA_Addon_Saturas_geheimbund_Info;
	description = "Chci se přidat do 'Kruhu Vody'.";
};


func int DIA_Addon_Saturas_geheimbund_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsRanger == TRUE) && (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_geheimbund_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//Chci se přidat do 'Kruhu Vody'.
	if(Lares_Angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(vztekle) COŽE? Jak o něm můžeš vědět? Kdo...? LARES! Já ho zabiju!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//Porušil naše nejdůležitější pravidlo. S nikým o 'Kruhu Vody' nemluvit.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(úplně bezradně) Nemám slov. Věřím ti, jen dokud tě můžu mít na očích.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//To Vatras mi řekl o 'Kruhu'.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(odevzdaně) Cože? Vatras? (sarkasticky) No to je úžasné! Ze všech mágů Vody na ostrově natrefíš na toho jediného, který tě NEZNÁ.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//Varuji tě, tentokrát nedělej žádné hlouposti.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(suše) Pokusím se.
	Log_CreateTopic(TOPIC_Addon_RingOfWater,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater,LOG_Running);
	B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas není ochoten přijmout mě do 'Kruhu Vody'. Nechává rozhodnutí na Vatrasovi.");
};


instance DIA_Addon_Saturas_wasmachstdu(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_wasmachstdu_Condition;
	information = DIA_Addon_Saturas_wasmachstdu_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Saturas_wasmachstdu_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_wasmachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(uctivě) V těchto síních jsou skryta pradávná tajemství. Záhadná tajemství.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//Nápisy a fresky na stěnách poukazují na velmi starou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Všechno, co tu vidíš, je psáno v jazyce, který vůbec neznáme.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//Teprve mu začínáme rozumět a chápat, co znamená.
};


instance DIA_Addon_Saturas_Erdbeben(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 6;
	condition = DIA_Addon_Saturas_Erdbeben_Condition;
	information = DIA_Addon_Saturas_Erdbeben_Info;
	description = "Co je to za podivná zemětřesení?";
};


func int DIA_Addon_Saturas_Erdbeben_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Saturas_wasmachstdu) && Npc_KnowsInfo(other,DIA_Addon_Merdarion_Bedrohung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Erdbeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//Co je to za podivná zemětřesení?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//To je jedna z hádanek, kterou se snažím vyřešit.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//Kdesi za těmito horami je nějak narušena struktura magie.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Někdo se evidentně ze všech sil snaží prolomit velice mocné kouzlo.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//Obávám se, že zanedlouho tahle zemětřesení postihnou celý ostrov.
};


instance DIA_Addon_Saturas_WhatsOrnament(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_WhatsOrnament_Condition;
	information = DIA_Addon_Saturas_WhatsOrnament_Info;
	description = "Proč je pro tebe ten ornament tak důležitý?";
};


func int DIA_Addon_Saturas_WhatsOrnament_Condition()
{
	if((MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS) && (SC_KnowsOrnament == FALSE) && (RitualRingRuns == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_WhatsOrnament_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Proč je pro tebe ten ornament tak důležitý?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(rozčileně) Je to klíč k portálu.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//Víc ti neřeknu.
};


instance DIA_Addon_Saturas_ScRanger(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_ScRanger_Condition;
	information = DIA_Addon_Saturas_ScRanger_Info;
	permanent = TRUE;
	description = "Teď už patřím do 'Kruhu Vody'.";
};


func int DIA_Addon_Saturas_ScRanger_Condition()
{
	if((SaturasKnows_SC_IsRanger == FALSE) && (SC_IsRanger == TRUE) && (other.guild != GIL_NDW) && (other.guild != GIL_KDW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ScRanger_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//Teď už patřím do 'Kruhu Vody'.
	itm = Npc_GetEquippedArmor(other);
	if(((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE)) || (Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v1) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v2) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v4) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
	{
		if((Hlp_IsItem(itm,ITAR_RANGER_Addon) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v1) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v2) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v3) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v4) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon_v5) == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//Jak vidím, nosíš zbroj našich dětí.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//Jak vidím, nosíš naše tajné poznávací znamení - akvamarínový prsten.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//A tvé oči mi napovídají, že mluvíš pravdu.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(mumlá si) No dobře, budu akceptovat tvůj vstup mezi nás.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//Ale nezapomeň, že to znamená i obrovskou zodpovědnost.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//A ve tvém vlastním zájmu doufám, že to budeš brát vážně.
		SaturasKnows_SC_IsRanger = TRUE;
		B_LogEntry(TOPIC_Addon_RingOfWater,"Saturas akceptoval můj vstup do 'Kruhu Vody'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//A jak se můžu ujistit, že jsi teď jedním z nás?
		if(RangerRingIsLaresRing == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//Ten akvamarínový prsten, co nosíš, patří Laresovi - poznávám ho.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//Snažíš se mě obelstít, co? Nic jiného jsem ani nečekal.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Saturas_OpenPortal(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = DIA_Addon_Saturas_OpenPortal_Condition;
	information = DIA_Addon_Saturas_OpenPortal_Info;
	permanent = TRUE;
	description = "Dej mi ten prsten. Otevřu portál.";
};

func int DIA_Addon_Saturas_OpenPortal_Condition()
{
	if((RitualRingRuns == LOG_SUCCESS) && (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_OpenPortal_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Dej mi ten prsten. Otevřu portál.
	if((SaturasKnows_SC_IsRanger == TRUE) || (other.guild == GIL_NDW) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//(lstivě) Dobře! Jako novému členu našich dětí ti patří tahle pocta.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//Pořád ale čekám na zprávu od Vatrase. Dokud ji nedostanu, nemůžeme odejít.
		if(Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven) || Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//Já pro tebe zprávu od Vatrase MÁM.
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven));
			B_GiveInvItems(other,self,ItWr_Vatras2Saturas_FindRaven_opened,Npc_HasItems(other,ItWr_Vatras2Saturas_FindRaven_opened));
			B_UseFakeScroll();
			if(Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(rozčileně) Chápu. A samozřejmě jsi to nevydržel a musel jsi ji otevřít, co?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//No, ehm...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(hrozivě) Ve tvém vlastním zájmu doufám, že už víc nezklameš tu velice chabou důvěru, kterou k tobě chovám.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(ohromeně) Velmi zajímavé. Dobře.
				B_GivePlayerXP(XP_Ambient);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Tady, vezmi si ten prsten. Sejdeme se u portálu a počkáme na tebe.
			CreateInvItems(self,ItMi_PortalRing_Addon,1);
			B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//Pokud má Nefarius pravdu, portál se otevře, jakmile vložíš prsten do mechanismu.
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi dal prsten k portálu. Teď bych ho měl vložit do mechanismu portálu a projít ním.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			if(SATURASWAITSVATRASMESSAGE != TRUE)
			{
				SATURASWAITSVATRASMESSAGE = TRUE;
				B_LogEntry(TOPIC_Addon_KDW,"Saturas čeká na zprávy od Vatrase. Musím jít do Khorinisu a promluvit si s ním.");
			};
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//Vzhledem k tomu, že mi Vatras zatím nijak nenaznačil, že by se ti dalo věřit, nechám si ten prsten sám.
		if(Saturas_WillVertrauensBeweis == FALSE)
		{
			Saturas_WillVertrauensBeweis = TRUE;
			SATURASWAITSVATRASMESSAGE = TRUE;
			B_LogEntry(TOPIC_Addon_Ornament,"Saturas mi prsten nedá, dokud od Vatrase nedostane znamení, že se mi dá věřit.");
		};
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_PERM(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 99;
	condition = DIA_Addon_Saturas_PERM_Condition;
	information = DIA_Addon_Saturas_PERM_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco o magii?";
};

func int DIA_Addon_Saturas_PERM_Condition()
{
	if((MIS_Addon_Saturas_BringRiordian2Me != 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Můžeš mě naučit něco o magii?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//Aby sis mohl zahrávat se samotnou její podstatou?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//Ne. Na takové hrátky nemám čas.
};


instance DIA_ADDON_SATURAS_HOWCANBEKDW(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_howcanbekdw_condition;
	information = dia_addon_saturas_howcanbekdw_info;
	permanent = FALSE;
	description = "Mohu se stát mágem Vody?";
};

func int dia_addon_saturas_howcanbekdw_condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_howcanbekdw_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_00");	//Mohu se stát mágem Vody?
	AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_01");	//Proč myslíš, že je to možné?

	if(VATRASSAYABOUTKDW == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_02");	//Vatras mi o tom řekl.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_HowCanBeKDW_15_03");	//Jenom mě to zajímá.
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_05");	//Hmm... Výjimky děláme velmi zřídka.
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_06");	//(nedůvěřivě) Tvé skutky by musely být HODNĚ přesvědčivé.
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_07");	//Promluvíme si o tom později, pokud se ti podaří udělat na mě dojem.
		if(VATRASSAYABOUTKDW == FALSE)
		{
			MIS_BECOMEKDW = LOG_Running;
			Log_CreateTopic(TOPIC_BECOMEKDW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_Running);
			B_LogEntry(TOPIC_BECOMEKDW,"Pokud se chci přidat mezi mágy Vody, musím přesvědčit Saturase, že jsem toho hoden.");
		}
		else
		{
			B_LogEntry(TOPIC_BECOMEKDW,"Saturas se chce přesvědčit, že jsem hoden být mágem Vody. Měl bych mu to dokázat svými skutky.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_HowCanBeKDW_15_04");	//Každopádně ses už rozhodl. Následuj tedy směr, který sis vybral - cesta mága Vody není nic pro tebe.
		if(MIS_BECOMEKDW == LOG_Running)
		{
			MIS_BECOMEKDW = LOG_FAILED;
		};
	};
};

instance DIA_ADDON_SATURAS_CANBEKDW(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 5;
	condition = dia_addon_saturas_canbekdw_condition;
	information = dia_addon_saturas_canbekdw_info;
	permanent = TRUE;
	description = "Ohledně přijetí...";
};

func int dia_addon_saturas_canbekdw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_howcanbekdw) && (other.guild == GIL_NONE) && (MIS_BECOMEKDW == LOG_Running) && (SATURASTELLWISHJOIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbekdw_info()
{
	var int countsaturas;
	countsaturas = 0;
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_00");	//Ohledně přijetí...
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_01");	//Ano? Poslouchám tě...
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_02");	//Můžu už vstoupit do Kruhu mágů Vody?
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_03");	//Hmm... Řekni mi alespoň nějaké důvody, proč bych tě měl přijmout.
	if((MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		if(MIS_Vatras_FindTheBanditTrader == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_06");	//Pomohl jsem Martinovi najít obchodníka, který prodával zbraně banditům.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_07");	//To není špatné! Myslím, že jsi na dobré cestě.
			countsaturas = countsaturas + 1;
		};
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_08");	//Přinesl jsem Nefariusovi všechny ztracené části ornamentu.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_09");	//Opravdu? Prokázal jsi nám velikou službu. Mágové Vody jsou ti velice vděční!
			countsaturas = countsaturas + 1;
		};
		if(countsaturas == 2)
		{
			B_GivePlayerXP(150);
			B_LogEntry(TOPIC_BECOMEKDW,"Saturas si myslí, že jsem hoden nosit roucho novice Vody. Teď je rozhodnutí na mně.");
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_15_10");	//Stačí to?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_11");	//Určitě, dokázal jsi, že jsi hoden toho, aby ses k nám přidal! Tvé skutky mluví samy za sebe.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_12");	//Nicméně...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_14");	//Být mágem Vody je veliký dar i veliká odpovědnost. Jenom vyvoleným Adana je dopřáno této pocty.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_15");	//Jenom ti, kteří jsou připraveni a oddaní vždy následovat posvátnou cestu Adana, mohou doufat v zasvěcení mezi mágy Vody.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_16");	//Být mágem Vody neznamená jenom získat moc a vědomosti, které nám Adanos dává. Je to mnohem víc...
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_17");	//... mnohem víc pro ty, kteří slouží Adanovi, je to znamením i osudem!
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_18");	//Proto mě tedy nežádej, abych tě jmenoval mágem Vody hned teď. Nejsi ještě připraven!
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_20");	//Můžu tě jenom přijmout mezi novice našeho řádu. Odtud můžeš vykročit na cestu Adanova služebníka.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_23");	//A pamatuj - když se zavážeš zasvětit svůj život službě Adanovi, nemůžeš to jednoduše vzít zpátky.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_24");	//Promysli si to tedy, než mi dáš konečnou odpověď.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_15_25");	//Tak, můj synu. Jsi připraven složit přísahu novice Vody?
			SATURASTELLWISHJOIN = TRUE;
			Info_ClearChoices(dia_addon_saturas_canbekdw);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Ještě si to promyslím...",dia_addon_saturas_canbekdw_no);
			Info_AddChoice(dia_addon_saturas_canbekdw,"Ano, chci zasvětit svůj život službě Adanovi!",dia_addon_saturas_canbekdw_yes);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_26");	//Stačí to?
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_27");	//Něco jsi už svými činy prokázal, ale není to dost.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_29");	//Musím si být úplně jistý, že nedělám chybu, když tě přijímám.
			AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_30");	//Stav se později, až budou tvé skutky přesvědčivější.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_CanBeKDW_15_32");	//Obávám se, že žádné nemám.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_33");	//Neplýtvej tedy mým časem!
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeKDW_15_34");	//Jdi a dělej něco užitečného.
	};
};

func void dia_addon_saturas_canbekdw_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_Yes_01_00");	//Ano, chci zasvětit svůj život službě Adanovi!
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_01");	//Tak tedy vítej mezi námi. S Adanovým požehnáním tě přijímám do řad jeho služebníků.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_02");	//Teď jsi novic. Nos tenhle oděv na znamení toho, že patříš do naší komunity.
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_03");	//Adane, požehnej tohoto muže, který obětuje svůj život tobě, a očisti ho od jeho hříchů!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_Yes_01_04");	//Následuj věrně cestu, kterou sis zvolil, a nechť tě Adanova moudrost nikdy neopustí!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Teď jsem novicem mágů Vody.");
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};

func void dia_addon_saturas_canbekdw_no()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeKdw_No_01_00");	//Ještě si to promyslím...
	AI_Output(self,other,"DIA_Addon_Saturas_CanBeKdw_No_01_01");	//Vrať se, až budeš připraven. Adanos s tebou, můj synu.
	Info_ClearChoices(dia_addon_saturas_canbekdw);
};


instance DIA_ADDON_SATURAS_JOINWATERMAGE(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_joinwatermage_condition;
	information = dia_addon_saturas_joinwatermage_info;
	permanent = TRUE;
	description = "Chci se stát novicem mágů Vody.";
};


func int dia_addon_saturas_joinwatermage_condition()
{
	if((hero.guild == GIL_NONE) && (SATURASTELLWISHJOIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_joinwatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_01_01");	//Chci se stát novicem mágů Vody.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_01_02");	//Vážně si to přeješ? Pamatuj, že není cesty zpět.
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Ještě si to promyslím...",dia_addon_saturas_joinwatermage_no);
	Info_AddChoice(dia_addon_saturas_joinwatermage,"Ano, chci zasvětit svůj život službě Adanovi!",dia_addon_saturas_joinwatermage_yes);
};

func void dia_addon_saturas_joinwatermage_yes()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_00");	//Ano, chci zasvětit svůj život službě Adanovi!
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_01");	//Tak tedy vítej mezi námi. S Adanovým požehnáním tě přijímám do řad jeho služebníků.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_02");	//Teď jsi novic. Nos tenhle oděv na znamení toho, že patříš do naší komunity.
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_03");	//Adane, požehnej tohoto muže, který obětuje svůj život tobě, a očisti ho od jeho hříchů!

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_NDW;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("LEVELUP");
	B_GiveInvItems(self,other,itar_ndw_l,1);
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_Yes_01_04");	//Následuj věrně cestu, kterou sis zvolil, a nechť tě Adanova moudrost nikdy neopustí!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_SUCCESS;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_SUCCESS);
	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_BECOMEKDW,"Teď jsem novicem mágů Vody.");
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

func void dia_addon_saturas_joinwatermage_no()
{
	AI_Output(other,self,"DIA_Addon_Saturas_JoinWaterMage_No_01_00");	//Ještě si to promyslím...
	AI_Output(self,other,"DIA_Addon_Saturas_JoinWaterMage_No_01_01");	//Vrať se, až budeš připraven. Adanos s tebou, můj synu.
	Info_ClearChoices(dia_addon_saturas_joinwatermage);
};

instance DIA_Addon_Saturas_PowerMagic(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 2;
	condition = DIA_Addon_Saturas_PowerMagic_Condition;
	information = DIA_Addon_Saturas_PowerMagic_Info;
	description = "Pověz mi o magii Vody.";
};

func int DIA_Addon_Saturas_PowerMagic_Condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_PowerMagic_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PowerMagic_01_00");	//Pověz mi o magii Vody.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_01");	//Na rozdíl od ostatních magických umění, to naše je založeno na odlišných vlastnostech Vody a jejich projevech.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_02");	//Kromě toho částečně využíváme magickou energii přítomnou v přírodě.
	AI_Output(self,other,"DIA_Addon_Saturas_PowerMagic_01_03");	//Naše magie má proto několik výhod oproti jiným magickým uměním, protože s ní někdy přemůžeš i ty nejmocnější nepřátele!
};

instance DIA_ADDON_SATURAS_FirstRune(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_FirstRune_condition;
	information = DIA_ADDON_SATURAS_FirstRune_info;
	permanent = FALSE;
	description = "Mohu se i já naučit vaší magii?";
};

func int DIA_ADDON_SATURAS_FirstRune_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_FirstRune_info()
{
	AI_Output(other,self,"DIA_ADDON_SATURAS_FirstRune_01_01");	//Mohu se i já naučit vaší magii?
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_02");	//Magie našeho řádu je dostupná pouze mágům! Proč se ptáš?
	AI_Output(other,self,"DIA_ADDON_SATURAS_FirstRune_01_03");	//V těchto dobách se tady pohybuje mnoho nebezpečných bestií a banditů! Pokud mě napadnou, nevím, zda se jim dokážu ubránit.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_04");	//(zamyšleně) Ve tvých slovech je něco pravdy...
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_05");	//Mágové Vody obvykle nesdílí svoje znalosti s nezasvěcenými.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_06");	//Nicméně, jelikož jsi nám pomohl v Hornickém údolí a i tady jsi vzbudil naši důvěru, udělám výjimku.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_07");	//Tady, vezmi si tuhle runu! Pomůže ti ochránit se v případě nebezpečí.
	B_GiveInvItems(self,other,ItRu_Zap,1);
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_08");	//Nicméně, jak jistě rozumíš, abys ji mohl použít, musíš ovládat první kruh magie.
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_09");	//Já tě ho naneštěstí naučit nemohu, protože by to bylo porušení pravidel našeho řádu!
	AI_Output(self,other,"DIA_ADDON_SATURAS_FirstRune_01_10");	//Proto tenhle problém budeš muset vyřešit sám.
};

instance DIA_ADDON_SATURAS_MEETHAGEN(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagen_condition;
	information = dia_addon_saturas_meethagen_info;
	permanent = FALSE;
	description = "Mám malý problém.";
};

func int dia_addon_saturas_meethagen_condition()
{
	if(other.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagen_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_01");	//Mám malý problém.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_02");	//Co potřebuješ, novici?
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_03");	//Musím se nutně sejít s velitelem paladinů, lordem Hagenem.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_05");	//Mám pro něj velice důležitou zprávu!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_09");	//Paladinové tě k němu jen tak jednoduše nepustí.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_12");	//Ale mám jeden nápad.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_14");	//Jak už jistě víš, mágové Vody našli portál, který vede do neznámé části ostrova.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_15");	//A přirozeně, dříve nebo později najdeme způsob, jak ho otevřít.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_16");	//A jak to souvisí s mým problémem?
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_18");	//Jakmile odhalíme tajemství tohoto záhadného portálu, zamýšlíme do něj vstoupit.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_19");	//Nemáme zdání, co nás tam může čekat.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_22");	//Když odejdeme, necháme toto místo jen tak bez dozoru. A to podle mého názoru nemůžeme dovolit!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_23");	//A tady by paladinové lorda Hagena určitě přišli vhod.
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagen_01_24");	//Co zamýšlíš?
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_25");	//Chtěl bych lordu Hagenovi napsat zprávu, ve které mágové Vody žádají, aby se v naší nepřítomnosti postaral o bezpečnost portálu.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_26");	//Myslím, že lord Hagen tuhle žádost nezamítne. Ale to není to důležité...
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_27");	//Nejdůležitější je, že právě ty mu tu zprávu doručíš!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_33");	//Počkej chvilku...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_34");	//Hmm... To by mělo stačit. Tady, vezmi si ten dopis.
	B_GiveInvItems(self,other,itwr_watermageletter,1);
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_35");	//(hrozivě) Ale ani nepomysli na to, že bys ho otevřel, novici!
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_36");	//A teď jdi za lordem Hagenem.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagen_01_38");	//Ať tě Adanos provází, můj synu!
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_4");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_NW_CITY_TO_FOREST_04_05_7");
	Wld_InsertNpc(Gobbo_Green,"FP_ROAM_NW_CITY_TO_FOREST_04_05_8");
	MIS_WATERMAGELETTER = LOG_Running;
	Log_CreateTopic(TOPIC_WATERMAGELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_Running);
	B_LogEntry(TOPIC_WATERMAGELETTER,"Saturas mi dal dopis, který bych měl doručit paladinům v Khorinisu. Teď se už určitě dostanu k lordu Hagenovi.");
};

instance DIA_ADDON_SATURAS_MEETHAGENOK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_meethagenok_condition;
	information = dia_addon_saturas_meethagenok_info;
	permanent = FALSE;
	description = "Odevzdal jsem lordu Hagenovi dopis.";
};

func int dia_addon_saturas_meethagenok_condition()
{
	if(HAGENTAKELETTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_meethagenok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagenOk_01_01");	//Odevzdal jsem lordu Hagenovi dopis.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagenOk_01_02");	//A co ti lord Hagen řekl?
	AI_Output(other,self,"DIA_Addon_Saturas_MeetHagenOk_01_03");	//Pošle několik paladinů střežit portál.
	AI_Output(self,other,"DIA_Addon_Saturas_MeetHagenOk_01_04");	//Dobře. Teď se už nemusíme obávat o bezpečí portálu.
	Wld_InsertNpc(pal_188_ritter,"NW_GUARDPORTAL_01");
	Wld_InsertNpc(pal_189_ritter,"NW_GUARDPORTAL_02");
	MIS_WATERMAGELETTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WATERMAGELETTER,LOG_SUCCESS);
};


instance DIA_ADDON_SATURAS_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_prayforgomez_condition;
	information = dia_addon_saturas_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_saturas_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_02");	//(překvapeně) Potřebuješ požehnání Vody? Proč?
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_04");	//Není pro mne, ale pro jistou neklidnou duši.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_07");	//Zřejmě za svého života vykonala hodně zla.
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_08");	//Ano, to opravdu hodně! Nicméně, Adanovo požehnání téhle hříšné duši pomůže osvobodit se.
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_09");	//Koho je to duše?
	AI_Output(other,self,"DIA_Addon_Saturas_PrayForGomez_01_10");	//Bývalého rudobarona - Gomeze!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_11");	//GOMEZE?! (nahněvaně) Toho vraha?!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_12");	//(bez sebe) Jak se opovažuješ žádat mě o TOTO?!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_14");	//Ten si zaslouží svůj osud!
	AI_Output(self,other,"DIA_Addon_Saturas_PrayForGomez_01_18");	//Jenom ztrácíš čas.
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Saturas a ostatní mágové Vody mi odmítli pomoct.");
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_UNITOR(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_unitor_condition;
	information = dia_addon_saturas_unitor_info;
	permanent = FALSE;
	description = "Potřebuji ještě jedno ohnisko!";
};


func int dia_addon_saturas_unitor_condition()
{
	if((HOWCANMAKERUNE == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_unitor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_01");	//Potřebuji ještě jedno ohnisko!
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_02");	//Nezlob se... (lítostivě) Všechny ohniskové kameny, které jsme měli, jsme již použili.
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_03");	//A nevíš tedy, kde bych mohl nějaký najít?
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_04");	//Obávám se, že nenajdeš. Ty kameny byly vytvořeny speciálně proto, abychom soustředili svou energii a vytvořili bariéru, kterou jsi pak zničil.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_05");	//Žádné další jednoduše neexistují. Hmm, i když... (zadumaně) V kolonii jsi podle mých instrukcí nalezl jen pět ohnisek.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_07");	//Já jsem pracoval s ohniskem na vrcholku útesu nad budoucím Bažinným táborem. Nefarius stál za mnou a dohlížel, aby síla veškeré shromážděné energie nepodlomila mé zdraví.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_08");	//Pokud by se mi něco stalo, on by mou práci s ohniskem dokončil.
	AI_Output(other,self,"DIA_Addon_Saturas_Unitor_01_09");	//O tom mi nikdo neříkal. A kde je teď to šesté ohnisko?
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_10");	//Hmm. Nedovedu ti říct, kde byla šestá pozice. Pokud si vzpomínám, na mapě, kterou jsem ti dal, bylo pět míst. Spolu tvořili pentagram.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_11");	//Ale šestý kámen nabíjel Corristo. Už si vzpomínám. Po rituálu přišel na hrad bez společníka - ten někam záhadně zmizel.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_12");	//Později Corristo přijal do učení Miltena a mnozí, kteří do kolonie přijeli později, ho mylně považovali za jednoho ze stavitelů bariéry.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_13");	//Celé tajemství těchto událostí a skutečnost, že šestá pozice, šesté ohnisko a veškeré záznamy o Corristově společníkovi byly zanechány v dokumentech, které se zničily, mě vedou k závěru, že s tím měl co dělat Xardas.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_14");	//Ano. Šesté ohnisko měl on!
 	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_15"); //Můžeš se zkusit vrátit do jeho staré věže v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_Unitor_01_16");	//Je zde možnost, že Xardas ohnisko zanechal tam!
	B_LogEntry(TOPIC_GUARDIANS,"Rozhodl jsem se zeptat Saturase, kde bych mohl najít ohnisko. Podle něj existovalo jenom šest ohniskových kamenů, přičemž poslední zůstal zřejmě u Xardase, jelikož i on se účastnil tvorby magické bariéry. Saturas mi doporučil začít své pátrání ve staré nekromantově věži v Hornickém údolí.");
};


instance DIA_ADDON_SATURAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = dia_addon_saturas_runemagicnotwork_condition;
	information = dia_addon_saturas_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš ještě pořád používat svou runovou magii?";
};


func int dia_addon_saturas_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_RuneMagicNotWork_01_00");	//Můžeš ještě pořád používat svou runovou magii?
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_01");	//Všechny mé magické runy nějak ztratily svou sílu.
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_02");	//A nejen mé, ale i všech ostatních mágů Vody! Nemám zdání, co to mohlo způsobit.
	AI_Output(self,other,"DIA_Addon_Saturas_RuneMagicNotWork_01_03");	//Ve světě se muselo udát něco strašného, nenapravitelného, pokud jsme všichni najednou ztratili tento dar.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_ADDON_SATURAS_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_1400_Addon_Saturas_NW;
	nr = 1;
	condition = DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition;
	information = DIA_ADDON_SATURAS_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Myslím, že toto patří tobě.";
};

func int DIA_ADDON_SATURAS_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_ADDON_SATURAS_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_01");	//Myslím, že toto patří tobě.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_02");	//(překvapeně) Nečekal jsem, že to Lee pošle přímo po tobě.
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_03");	//Opravdu záleží na tom, kdo ty záznamy přinese?
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_04");	//Ne, jen jsem doufal, že pošle do Hornického údolí větší oddíl žoldáků.
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_05");	//A tys to vyřešil úplně sám.
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_06");	//To tě překvapuje?
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_07");	//Trochu... Ale v každém případě jsme ti velice vděčný.
	AI_Output(self,other,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_08");	//Myslím, že se ti tyto svitky budou hodit.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self,"DIA_ADDON_SATURAS_WaterMageDocumentsDone_01_09");	//Díky.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments,"Přinesl jsem Saturasovi záznamy mágů Vody, které zanechali v Hornickém údolí.");	
};
