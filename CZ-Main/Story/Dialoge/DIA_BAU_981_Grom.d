
instance DIA_Grom_EXIT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 999;
	condition = DIA_Grom_EXIT_Condition;
	information = DIA_Grom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grom_HALLO(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = DIA_Grom_HALLO_Condition;
	information = DIA_Grom_HALLO_Info;
	description = "Je všechno v pořádku?";
};


func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Je všechno v pořádku?
	if(HEROISHUNTER == TRUE)
	{
		AI_Output(self,other,"DIA_Grom_HALLO_08_02");	//V pohodě, příteli.
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Á, nějaký neznámý poutník. Mám moc práce, tak co chceš?
	};
};


instance DIA_Grom_HALLO_waszusehen(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hallo_waszusehen_condition;
	information = dia_grom_hallo_waszusehen_info;
	description = "Co je tu zajímavého k vidění?";
};


func int dia_grom_hallo_waszusehen_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void dia_grom_hallo_waszusehen_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_Waszusehen_15_00");	//Co je tu zajímavého k vidění?
	AI_Output(self,other,"DIA_Grom_HALLO_Waszusehen_08_01");	//Zajímavé je slabé slovo. Když se vydáš hlouběji do lesa, narazíš na pořádně odporný chlapíky.
	AI_Output(self,other,"DIA_Grom_HALLO_Waszusehen_08_02");	//Jsou okolo deseti stop vysoký, chlupatý a mají fakt špatnou náladu. Jestli na ně nejsi dost silný, tak tam raději ani nechoď.
};


instance DIA_Grom_HALLO_was(C_Info)
{
	npc = BAU_981_Grom;
	nr = 3;
	condition = dia_grom_hallo_was_condition;
	information = dia_grom_hallo_was_info;
	description = "Co tady děláš?";
};


func int dia_grom_hallo_was_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_grom_hallo_was_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_Was_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_01");	//To, co lovci obvykle dělávají, ne?
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_02");	//Lovím!... (smích) Falk si u mě objednal dvě kůže z horských trolů.
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_03");	//Proto jsem tady - čekám na příležitost udeřit na ty bestie! (rozzlobeně)
	AI_Output(self,other,"DIA_Grom_HALLO_Was_08_04");	//Nebýt té objednávky, už bych seděl v táboře - jedl chutné jídlo a pil vychlazené pivo!
	MIS_GROMTROLLS = LOG_Running;
	Log_CreateTopic(TOPIC_GROMTROLLS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_Running);
	B_LogEntry(TOPIC_GROMTROLLS,"Lovec Grom potřebuje dvě trolí kůže. Možná, že bych mu mohl pomoci je získat.");
};


instance DIA_GROM_TROLLFUR(C_Info)
{
	npc = BAU_981_Grom;
	nr = 2;
	condition = dia_grom_trollfur_condition;
	information = dia_grom_trollfur_info;
	permanent = FALSE;
	description = "Mám pro tebe nějaké trolí kůže.";
};


func int dia_grom_trollfur_condition()
{
	if((MIS_GROMTROLLS == LOG_Running) && (Npc_HasItems(other,ItAt_TrollFur) >= 2))
	{
		return TRUE;
	};
};

func void dia_grom_trollfur_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Grom_TrollFur_01_00");	//Mám pro tebe nějaké trolí kůže.
	AI_Output(self,other,"DIA_Grom_TrollFur_01_01");	//Člověče, kde jsi je vzal? Ulovil jsi je?! To muselo být zatraceně nebezpečné...
	AI_Output(self,other,"DIA_Grom_TrollFur_01_03");	//Díky, už jsem si myslel, že tady uvíznu navždy. Ukaž!
	AI_Output(other,self,"DIA_Grom_TrollFur_01_04");	//Tady.
	B_GiveInvItems(other,self,ItAt_TrollFur,2);
	AI_Output(self,other,"DIA_Grom_TrollFur_01_05");	//To je nádhera! Dám ti za ně pět set zlatých. To je mnohem víc, než by ti nabídli obchodníci ve městě.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Grom_TrollFur_01_06");	//Dobrá, je čas vrátit se zpět do tábora. Uvidíme se!
	MIS_GROMTROLLS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GROMTROLLS,LOG_SUCCESS);
	B_LogEntry(TOPIC_GROMTROLLS,"Přinesl jsem Gromovi dvě kůže horských trolů.");
	Npc_ExchangeRoutine(self,"GotoHunters");
	Info_ClearChoices(dia_grom_trollfur);
	AI_StopProcessInfos(self);
};


instance DIA_Grom_AskTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 10;
	condition = DIA_Grom_AskTeacher_Condition;
	information = DIA_Grom_AskTeacher_Info;
	description = "Můžeš mě naučit něco o lovu?";
};


func int DIA_Grom_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Můžeš mě naučit něco o lovu?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Jasně. Ale nejdřív mi dej něco pořádnýho na zub. Umírám tady hlady.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//Dal bych si láhev mléka, bochník chleba a pořádnou šunku. Pak tě naučím, čemu budeš chtít.
	MIS_GROMASKTEACHER = LOG_Running;
	Log_CreateTopic(TOPIC_GromAskTeacher,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_Running);
	B_LogEntry(TOPIC_GromAskTeacher,"Lovec Grom se se mnou podělí o své poznatky, pokud mu přinesu láhev mléka, krajíc chleba a šunku.");
};


instance DIA_Grom_PayTeacher(C_Info)
{
	npc = BAU_981_Grom;
	nr = 11;
	condition = DIA_Grom_PayTeacher_Condition;
	information = DIA_Grom_PayTeacher_Info;
	description = "Tady máš jídlo, které jsi chtěl.";
};


func int DIA_Grom_PayTeacher_Condition()
{
	if((MIS_GROMASKTEACHER == LOG_Running) && Npc_HasItems(other,ItFo_Milk) && Npc_HasItems(other,ItFo_Bread) && Npc_HasItems(other,ItFo_Bacon))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Tady máš jídlo, které jsi chtěl.
	if(B_GiveInvItems(other,self,ItFo_Milk,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_01");	//Mléko.
	};
	if(B_GiveInvItems(other,self,ItFo_Bread,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_02");	//Chléb.
	};
	if(B_GiveInvItems(other,self,ItFo_Bacon,1))
	{
		AI_Output(other,self,"DIA_Grom_PayTeacher_15_03");	//Šunka.
	};
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Výborně. A co teď?
	Grom_TeachAnimalTrophy = TRUE;
	MIS_GROMASKTEACHER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GromAskTeacher,LOG_SUCCESS);
	B_LogEntry(TOPIC_GromAskTeacher,"Přinesl jsem Gromovi něco malého k jídlu.");
};

var int GromTeachFinish;

instance DIA_Grom_TEACHHUNTING(C_Info)
{
	npc = BAU_981_Grom;
	nr = 12;
	condition = DIA_Grom_TEACHHUNTING_Condition;
	information = DIA_Grom_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Rád bych se naučil nějakým loveckým technikám.";
};

func int DIA_Grom_TEACHHUNTING_Condition()
{
	if((Grom_TeachAnimalTrophy == TRUE) && (GromTeachFinish == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Rád bych se naučil nějakým loveckým technikám.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//Co chceš vědět?
		Info_AddChoice(DIA_Grom_TEACHHUNTING,Dialog_Back,DIA_Grom_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Grom_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Grom_TEACHHUNTING_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání srdcí",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Grom_TEACHHUNTING_Heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání kusadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Grom_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání rohů stínových šelem",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání ohnivých jazyků",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),dia_grom_teachhunting_firetongue);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//Nemůžu tě naučit nic, co bys ještě neznal.
		GromTeachFinish = TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Veď řez kolem končetin tak, abys mohl stáhnout kůži. Dělej to od hlavy k ocasu, ne naopak.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//Když chceš oddělit zuby, musíš dávat dobrý pozor, aby se při odlamování od lebky nezlomily.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//Srdce získáš tak, že šikovně řízneš do hrudi zvířete. Ale obvykle to stojí za to jen v případě, že se jedná o zvíře magického původu.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//Kusadla důlních červů a polních škůdců lze získat jen za pomoci velmi silné kovové páky, protože jsou zaklíněny hluboko v pevných tkáních hlavy.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//Abys získal roh stínové šelmy, opři se vší silou o lebku a zároveň tahej za roh. Pak tu věc tvrdou čepelí uřízni.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

func void dia_grom_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_FireTongue_08_00");	//Ohnivému ještěrovi lze vyříznout jazyk jediným tahem nože, když ho přitom druhou rukou opatrně přidržuješ.
	};
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};


instance DIA_Grom_PICKPOCKET(C_Info)
{
	npc = BAU_981_Grom;
	nr = 900;
	condition = DIA_Grom_PICKPOCKET_Condition;
	information = DIA_Grom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grom_PICKPOCKET_Condition()
{
	return C_Beklauen(75,40);
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET,Dialog_Back,DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};


instance DIA_GROM_RESPECT(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respect_condition;
	information = dia_grom_respect_info;
	permanent = FALSE;
	description = "Potřebuji tvoji pomoc.";
};


func int dia_grom_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GROM_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void dia_grom_respect_info()
{
	AI_Output(other,self,"DIA_Grom_Respect_01_01");	//Potřebuji tvoji pomoc.
	AI_Output(self,other,"DIA_Grom_Respect_01_02");	//Čeho se to týká?
	AI_Output(other,self,"DIA_Grom_Respect_01_03");	//Chci vyzvat Falka na souboj a potřebuji podporu ostatních lovců.
	AI_Output(self,other,"DIA_Grom_Respect_01_04");	//Ty nemáš vážně co na práci, že?... (smích) Vyzvat Falka na souboj? To je dost hloupý nápad.
	AI_Output(self,other,"DIA_Grom_Respect_01_05");	//Je to nejlepší lovec v táboře a já osobně si nemyslím, že bys měl šanci ho porazit.
	AI_Output(other,self,"DIA_Grom_Respect_01_06");	//To mi říká každý, ale já se svého úmyslu nevzdám.
	AI_Output(self,other,"DIA_Grom_Respect_01_07");	//Hmm... (zamyšleně) No, pokud si vážně tak věříš, tak bych ti samozřejmě dokázal pomoci.
	AI_Output(self,other,"DIA_Grom_Respect_01_08");	//Ale nebude to jen tak jednoduché. Vlastně všechno na světě si musí každý zasloužit, to je i případ mé podpory.
	AI_Output(other,self,"DIA_Grom_Respect_01_09");	//A co bych pro to teda měl udělat?
	AI_Output(self,other,"DIA_Grom_Respect_01_10");	//Hmm... (zamyšleně) No, nic složitého - můžeš mi prostě přinést nějakou vzácnou loveckou trofej.
	AI_Output(self,other,"DIA_Grom_Respect_01_11");	//Pokud jsi dobrý lovec, jak si myslíš, tak ti to nedá moc práce.
	AI_Output(other,self,"DIA_Grom_Respect_01_12");	//A jakou trofej chceš?
	AI_Output(self,other,"DIA_Grom_Respect_01_13");	//Už jsem řekl - vzácnou. Například, co bych tak chtěl... (zamyšleně)... Velké vejce důlního červa.
	AI_Output(self,other,"DIA_Grom_Respect_01_14");	//Toto vejce jen tak někde nenajdeš a setkání s důlními červy - určitě není příjemné.
	AI_Output(other,self,"DIA_Grom_Respect_01_15");	//Dobrá, přijímám.
	B_LogEntry(TOPIC_HUNTERSWORK,"Podporu Groma získám tím, když mu donesu vejce důlního červa.");
};


instance DIA_GROM_RESPECTDONE(C_Info)
{
	npc = BAU_981_Grom;
	nr = 1;
	condition = dia_grom_respectdone_condition;
	information = dia_grom_respectdone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti to vejce důlního červa.";
};


func int dia_grom_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (GROM_RESPECT == FALSE) && (Npc_HasItems(other,itat_crawlerqueen) >= 1))
	{
		return TRUE;
	};
};

func void dia_grom_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Grom_RespectDone_01_00");	//Přinesl jsem ti to vejce důlního červa.
	AI_Output(self,other,"DIA_Grom_RespectDone_01_01");	//Kde je?
	AI_Output(other,self,"DIA_Grom_RespectDone_01_02");	//Tady.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other,"DIA_Grom_RespectDone_01_03");	//Hmm... (zkoumavě) Zdá se, že je to opravdu - velké vejce důlního červa.
	AI_Output(self,other,"DIA_Grom_RespectDone_01_04");	//Musím ti říct, že jsem si nemyslel, že se ti to vejce podaří získat. Vážně jsi mě překvapil!
	AI_Output(other,self,"DIA_Grom_RespectDone_01_05");	//Znamená to, že teď můžu počítat s tvou podporou?
	AI_Output(self,other,"DIA_Grom_RespectDone_01_06");	//Jak jsem slíbil, příteli... (usmívá se) Pokud se mě Falk na tebe zeptá - uslyší ode mě jen samé dobré věci!
	GROM_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Přinesl jsem Gromovi vejce důlního červa. Teď mě Grom podpoří ve sporu s Falkem.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

