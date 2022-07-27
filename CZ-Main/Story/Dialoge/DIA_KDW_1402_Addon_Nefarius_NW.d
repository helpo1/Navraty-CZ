/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Addon_Nefarius_MissingOrnaments_Info - upraveny výpisy

*/




instance DIA_Addon_Nefarius_EXIT(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 999;
	condition = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_Hallo(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Hallo_Condition;
	information = DIA_Addon_Nefarius_Hallo_Info;
	description = "Jak se vede?";
};


func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//Co TY tady děláš? Tohle je vážně překvapení.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Myslel jsem, že jsi zahynul.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Skoro.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Byl kolem tebe velký poprask, víš to? Nemohl jsem Saturase vůbec poznat, byl vzteky bez sebe.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "Co je to za portál?";
};


func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Co je to za portál?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//Předpokládáme, že vede do ztraceného údolí, kde kdysi stálo město jedné prastaré kultury.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Jenže kámen za portálem je z masivní skály.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Navíc tu nejsou žádné znaky teleportační magie. To je vážně záhada.
};


instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "Víš, jak ho aktivovat?";
};


func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_keineahnung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Víš, jak ho aktivovat?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Jeden z těch chybějících ornamentů vypadá jako nějaký druh klíče.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Bez něj se dál nedostaneme.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Musí přesně pasovat do toho kulatého otvoru vedle portálu.
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "Přinesl jsem část toho ornamentu.";
};


func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Přinesl jsem část toho ornamentu.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(vzrušeně) Vážně? To je vynikající.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Máš ponětí, kde jsou ostatní části?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Podle těch starých nápisů byl rozdělen na čtyři části.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//A vypadá to, jako by byly pořád ještě někde tady na ostrově.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//S Merdarionovou pomocí jsem přeložil některé z těch nápisů.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Dá se z nich vyčíst, kde jsou ukryty zbývající části.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Tady. Na téhle mapě jsem označil nějaká místa.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_ornaments_addon_1,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Mágové Vody objevili portál, který by měl vést do neprozkoumané části Khorinisu.");
	B_LogEntry(TOPIC_Addon_Ornament,"Nefarius chce aktivovat mechanismus portálu pomocí nějakého ornamentálního prstenu. Pořád ještě postrádá tři úlomky prstenu. Mým úkolem je opatřit mu je. Dal mi mapu s označenými místy, kde bych se měl po jednotlivých částech poohlédnout.");
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Porozhlédni se tam.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//Zvláště se soustřeď na staré stavby. Mohou být už hodně rozpadlé, takže je hned tak nepoznáš.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//Může to být téměř cokoliv – velký kámen, kamenný kruh, mauzoleum nebo něco takového.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Ale proč ti to vlastně říkám? Ty už to najdeš. Hodně štěstí.
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "Proč byl ten ornament rozbitý?";
};


func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Proč byl ten ornament rozbitý?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Ať už to udělal kdokoliv, chtěl zabránit tomu, aby byl portál znovu otevřen.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//Čím více si prohlížím tyto nápisy, tím víc poznávám, že kněží té prastaré kultury nebyli žádní hlupáci.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//Museli mít dobrý důvod, aby tu oblast za portálem uchovali uzavřenou.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Nemáme tušení, co nás tam čeká. Ale určitě to nebude nic dobrého...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "Ohledně těch chybějících částí...";
};


func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};


var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100;

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	var int MissingOrnamentsCount;
	var int XP_Addon_BringMissingOrnaments;
	var int MissingOrnamentsGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Ohledně těch chybějících částí...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//Ano?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Tady. Mám další.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			// AI_Print(b_formgivestring(other,1));
			AI_Print("Předáno 1x Kamenný úlomek");
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Našel jsem je.
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			// concatText = b_formgivestring(other,MissingOrnamentsCount);
			concatText = ConcatStrings("Předáno ",IntToString(MissingOrnamentsCount));
			concatText = ConcatStrings(concatText,"x Kamenný úlomek");
			AI_Print(concatText);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//To je fantastické.
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Teď už chybějí jen dvě. Snad je taky najdeš.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Už jen jedna a budeme je mít všechny.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Tak teď už máme všechny. Zbývá jen složit je dohromady.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Abychom však ty části mohli opět spojit v prsten, musíme spojit i naše síly.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Tady. Nějaké zlaťáky za tvé úsilí.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Pojď za mnou!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Ještě jednou, kolik jich bylo?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Celkem čtyři...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Ostatní bys měl najít v místech, která jsem ti vyznačil na mapě.
	};
};


instance DIA_Addon_Nefarius_Ringritual(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Ringritual_Condition;
	information = DIA_Addon_Nefarius_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//Tady. A teď odstup.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament,"Přinesl jsem Nefariusovi všechny části ornamentálního prstenu. Mágové Vody ho nyní opět složí dohromady.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarius_RingRitualEnds(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Ornament byl znovu scelen.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Když už jsi nám přinesl všechny potřebné úlomky, měl bys je také zasadit do portálu.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//Zajdi za Saturasem, ať ti dá spojený prsten.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Doufejme, že pak se portál otevře.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"Ornamentální prsten je opět celý. Měl bych ho od Saturase vyzvednout.");
};

instance DIA_ADDON_NEFARIUS_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 1;
	condition = dia_addon_nefarius_prayforgomez_condition;
	information = dia_addon_nefarius_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};

func int dia_addon_nefarius_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Nefarius_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Nefarius_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_NEFARIUS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 1;
	condition = dia_addon_nefarius_runemagicnotwork_condition;
	information = dia_addon_nefarius_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš ještě pořád používat svou runovou magii?";
};


func int dia_addon_nefarius_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Nefarius_RuneMagicNotWork_01_00");	//Můžeš ještě pořád používat svou runovou magii?
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_01");	//Runová magie už neexistuje. Dnes bylo vidět, že není dostatečná. Naším úkolem je teď neztrácet srdce a nedávat najevo svou vlastní bezvýznamnost.
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_02");	//Na bojišti jsme teď, samozřejmě, bezcenní, ale pořád budeme léčit a povzbuzovat naše vojáky.
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_03");	//A když tahle válka skončí, okamžitě půjdeme hledat jiný druh magie a jsem přesvědčen, že uspějeme!
	AI_Output(other,self,"DIA_Addon_Nefarius_RuneMagicNotWork_01_04");	//Hmm... Rozumím.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Nefarius_NW_Runen(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 99;
	condition = DIA_Addon_Nefarius_NW_Runen_Condition;
	information = DIA_Addon_Nefarius_NW_Runen_Info;
	permanent = TRUE;
	description = "Nauč mě vytvářet runy.";
};

func int DIA_Addon_Nefarius_NW_Runen_Condition()
{
	if((Nefarius_Addon_TeachRunes == TRUE) && (STOPBIGBATTLE == FALSE) && (KDW_JOINHAGEN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_NW_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Nauč mě vytvářet runy.
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"6. kruh magie",DIA_Addon_Nefarius_NW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"5. kruh magie",DIA_Addon_Nefarius_NW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"4. kruh magie",DIA_Addon_Nefarius_NW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"3. kruh magie",DIA_Addon_Nefarius_NW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"2. kruh magie",DIA_Addon_Nefarius_NW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"1. kruh magie",DIA_Addon_Nefarius_NW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
};

func void DIA_Addon_Nefarius_NW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),dia_addon_nefarius_NW_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidIcebolt)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONICEGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONICEGOLEM)),dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_NW_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_NW_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm);
	};
};


func void DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarius_NW_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_NW_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

