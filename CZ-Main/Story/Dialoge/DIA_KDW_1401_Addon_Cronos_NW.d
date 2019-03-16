
instance DIA_Addon_Cronos_EXIT(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 999;
	condition = DIA_Addon_Cronos_EXIT_Condition;
	information = DIA_Addon_Cronos_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Cronos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Cronos_PICKPOCKET(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 900;
	condition = DIA_Addon_Cronos_PICKPOCKET_Condition;
	information = DIA_Addon_Cronos_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Cronos_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Addon_Cronos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,Dialog_Back,DIA_Addon_Cronos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Cronos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

func void DIA_Addon_Cronos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_PICKPOCKET);
};

instance DIA_Addon_Cronos_Hallo(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Hallo_Condition;
	information = DIA_Addon_Cronos_Hallo_Info;
	description = "Můžu tě na chvilku vyrušit?";
};


func int DIA_Addon_Cronos_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//Můžu tě na chvilku vyrušit?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//(překvapeně) To jsi TY? Nikdy jsem nemyslel, že ten tvůj ksicht ještě někdy uvidím.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//Máš vážně kuráž, že se tu ukazuješ. Svého času bychom tě zaživa stáhli z kůže.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//Můžeš být rád, že už je to pár týdnů a všichni jsme se uklidnili.
};


instance DIA_Addon_Cronos_WasMachstdu(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_WasMachstdu_Condition;
	information = DIA_Addon_Cronos_WasMachstdu_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Cronos_WasMachstdu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cronos_WasMachstdu_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(zmateně) Mým úkolem je zjistit více o strážcích chrámu.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//Jsou pěkně tuhý oříšek, to ti povím. Nic podobného, jako jsou tihle kamenní strážci, jsem ještě neviděl.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//Jednu chvíli úplně bezduše stojí, a najednou tě napadnou, jako kdyby je něco posedlo.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//Ještě jsem nezjistil, co je vlastně uvádí do pohybu, ale jedna věc je jistá: je to magického původu.
};


instance DIA_Addon_Cronos_Waechter(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_Waechter_Condition;
	information = DIA_Addon_Cronos_Waechter_Info;
	description = "Pověz mi něco o těch kamenných strážcích.";
};


func int DIA_Addon_Cronos_Waechter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Cronos_Waechter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Pověz mi něco o těch kamenných strážcích.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//(nejistě) Zatím ti toho moc říct nemůžu. Museli jsme je všechny zničit. Teď už nejsou nebezpeční.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//Když jsme sem přišli, napadli nás.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//Porazili jsme je jen spojenými silami a obávám se, že za portálem jich čeká ještě víc.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//Musí existovat způsob, jak zničit sílu, která je pohání, a udělat z nich zase obyčejné sochy.
};


instance DIA_Addon_Cronos_NW_Trade(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 5;
	condition = DIA_Addon_Cronos_NW_Trade_Condition;
	information = DIA_Addon_Cronos_NW_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Můžeš mi prodat nějaké vybavení?";
};


func int DIA_Addon_Cronos_NW_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Cronos_WasMachstdu))
	{
		return TRUE;
	};
};


var int DIA_Addon_Cronos_NW_Trade_OneTime;

func void DIA_Addon_Cronos_NW_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Můžeš mi prodat nějaké vybavení?

	if(DIA_Addon_Cronos_NW_Trade_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Proč ne? Pokud si dobře vzpomínám, už jsme spolu obchodovali.
		DIA_Addon_Cronos_NW_Trade_OneTime = TRUE;
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_CronosTrade);
	};

	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Pověz mi, co potřebuješ.
	B_GiveTradeInv(self);
};


instance DIA_ADDON_CRONOS_NW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_nw_prayforgomez_condition;
	information = dia_addon_cronos_nw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_cronos_nw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_nw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Cronos_NW_PrayForGomez_01_02");	//Promluv si se Saturasem.
	AI_Output(self,other,"DIA_Addon_Cronos_NW_PrayForGomez_01_03");	//Ten ti dokáže pomoci.
	AI_Output(other,self,"DIA_Addon_Cronos_NW_PrayForGomez_01_04");	//Díky za radu.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_CRONOS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1401_Addon_Cronos_NW;
	nr = 1;
	condition = dia_addon_cronos_runemagicnotwork_condition;
	information = dia_addon_cronos_runemagicnotwork_info;
	permanent = FALSE;
	description = "Můžeš ještě pořád používat svou runovou magii?";
};


func int dia_addon_cronos_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Cronos_RuneMagicNotWork_01_00");	//Můžeš ještě pořád používat svou runovou magii?
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_01");	//Je mi líto, že tě zklamu... (zmateně) Ale všechny mé magické runy nějak ztratili svou sílu.
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_02");	//A nejen mé, ale i všech ostatních mágů Vody! Nemám zdání, co to mohlo způsobit.
	AI_Output(self,other,"DIA_Addon_Cronos_RuneMagicNotWork_01_03");	//Ve světě se muselo udát něco strašného, nenapravitelného, pokud jsme všichni najednou ztratili tento dar.
	AI_Output(other,self,"DIA_Addon_Cronos_RuneMagicNotWork_01_04");	//Hmm... Rozumím.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Vypadá to tak, že i mágové Vody ztratili schopnost užívat runové kameny.");
	WATERMAGERUNESNOT = TRUE;
};

