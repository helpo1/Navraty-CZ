
instance DIA_Nadja_EXIT(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 999;
	condition = DIA_Nadja_EXIT_Condition;
	information = DIA_Nadja_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Nadja_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nadja_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Nadja_PICKPOCKET(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 900;
	condition = DIA_Nadja_PICKPOCKET_Condition;
	information = DIA_Nadja_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Nadja_PICKPOCKET_Condition()
{
	return C_Beklauen(40,40);
};

func void DIA_Nadja_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,Dialog_Back,DIA_Nadja_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nadja_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Nadja_PICKPOCKET_DoIt);
};

func void DIA_Nadja_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};

func void DIA_Nadja_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nadja_PICKPOCKET);
};


instance DIA_Nadja_STANDARD(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_STANDARD_Condition;
	information = DIA_Nadja_STANDARD_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Nadja_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE))
	{
		return TRUE;
	};
};

var int Nadja_LuciaInfo;

func void DIA_Nadja_STANDARD_Info()
{
	if(Nadja_LuciaInfo == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//Musíš si nejprve promluvit s Bromorem.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Hele, teď zrovna se ti nemůžu věnovat, fešáku. Jestli se chceš pobavit, promluv si s Bromorem.
	};
	if((SC_HearedAboutMissingPeople == TRUE) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (Nadja_LuciaInfo == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//Rád bych se tě zeptal na pár otázek ohledně těch chybějících lidí.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//Dobře, je tady něco, co bych ti mohla říct, ale ne tady, drahoušku.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//Dobře, tak pojďme nahoru.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Dobře, ale to si musíš první zařídit s Bromorem. Nechci se dostat do problémů.
		Nadja_LuciaInfo = TRUE;
	};

	AI_StopProcessInfos(self);
};


instance DIA_Nadja_Danach(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_Danach_Condition;
	information = DIA_Nadja_Danach_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Nadja_Danach_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Bromor_Pay == FALSE) && (Nadja_Nacht == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Danach_Info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//Příště přijď zase.
	Nadja_Nacht = FALSE;
	AI_StopProcessInfos(self);
};

instance DIA_Nadja_hochgehen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_hochgehen_Condition;
	information = DIA_Nadja_hochgehen_Info;
	important = FALSE;
	permanent = TRUE;
	description = "Pojďme nahoru.";
};

func int DIA_Nadja_hochgehen_Condition()
{
	if((Bromor_Pay == TRUE) && (NadjaIsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_hochgehen_Info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Pojďme nahoru.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Dneska máš šťastný den, fešáku. Pojďme.
	NadjaIsUp = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_Addon_Nadja_LuciaInfo(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 5;
	condition = DIA_Addon_Nadja_LuciaInfo_Condition;
	information = DIA_Addon_Nadja_LuciaInfo_Info;
	description = "UŽ můžeme mluvit?";
};

func int DIA_Addon_Nadja_LuciaInfo_Condition()
{
	if((Bromor_Pay == TRUE) && (NadjaIsUp == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300) && (Nadja_LuciaInfo == TRUE))
	{
		return TRUE;
	};
};


var int Nadja_GaveLuciaInfo;

func void DIA_Addon_Nadja_LuciaInfo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//UŽ můžeme mluvit?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//Nikdo nás tu nebude rušit.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor rozhodně neoceňuje, když si povídáme s hosty během práce - nevyděláváme mu.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//Takže, ty bys rád věděl něco o těch zmizelých lidech z přístavní čtvrti, že?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//Nevím jestli ti to pomůže, ale můžu ti říct, kam odešla Lucie.
	Nadja_GaveLuciaInfo = TRUE;
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Kam odešla?",DIA_Addon_Nadja_LuciaInfo_wo);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Pověz mi o ní něco.",DIA_Addon_Nadja_LuciaInfo_lucia);
};

func void DIA_Addon_Nadja_LuciaInfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//Pověz mi o ní něco.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nikomu moc nevadí, že už tu není.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Proč?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//Měla sklon zužitkovat všechny a všechno.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//Fakt děvka!
};

func void DIA_Addon_Nadja_LuciaInfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//Kam odešla?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//Často se scházela s Elvrichem, s tím učedníkem Thorbena, z dolní čtvrti.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//Vsadila bych se, že s ním utekla.
	Log_CreateTopic(TOPIC_Addon_Lucia,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia,LOG_Running);
	B_LogEntry(TOPIC_Addon_Lucia,"Ta bezstarostná slečna, Lucie, zmizela z Bromorova nevěstince přes noc. Šíří se zvěsti, že utekla s Thorbenovým tesařským učedníkem Elvrichem.");
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Kam mohli jít?",DIA_Addon_Nadja_LuciaInfo_Elvrich);
};

func void DIA_Addon_Nadja_LuciaInfo_Elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Kam mohli jít?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//Mohli by být na nějaké farmě, pokud je ovšem nesežrali vlci.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Kam jinam by mohli uprchnout?
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Co ještě víš?",DIA_Addon_Nadja_LuciaInfo_sonst);
};

func void DIA_Addon_Nadja_LuciaInfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//Co ještě víš?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//Zaslechla jsem pár věcí o těch chybějících lidech z přístavní čtvrti.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//Ale nejsem si jistá nakolik jsou tyto zvěsti pravdivé.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//Měl by sis promluvit s některým z obchodníků.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//Promiň, ale to je všechno, co vím.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//A co my dva, zlatíčko? Nakonec, za něco jsi přece zaplatil.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Opravdu se mnou nechceš strávit pár chvilek než zase odejdeš?
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);

	if((MIS_Andre_REDLIGHT == LOG_Running) && (Knows_Borka_Dealer == FALSE))
	{
		Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,PRINT_Addon_NadjaWait,DIA_Addon_Nadja_WAIT);
	};
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Díky, ale už opravdu musím jít.",DIA_Addon_Nadja_LuciaInfo_weiter);
	Info_AddChoice(DIA_Addon_Nadja_LuciaInfo,"Proč ne?",DIA_Nadja_Poppen_Start);
};

func void DIA_Addon_Nadja_LuciaInfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//Díky, ale už opravdu musím jít.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//Škoda. Možná příště.
	Bromor_Pay = FALSE;
	Nadja_Nacht = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_WAIT()
{
	Info_ClearChoices(DIA_Addon_Nadja_LuciaInfo);
};

var int LoveScene;

instance DIA_Nadja_Poppen(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 3;
	condition = DIA_Nadja_Poppen_Condition;
	information = DIA_Nadja_Poppen_Info;
	permanent = TRUE;
	description = "Užijme si!";
};

func int DIA_Nadja_Poppen_Condition()
{
	if((Bromor_Pay == TRUE) && (NadjaIsUp == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void DIA_Nadja_Poppen_Info()
{
	if((LoveScene >= 2) && (LoveBonus == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 200;
		AI_NoticePrint(3000,4098,NAME_Addon_LoveBonus);
		LoveBonus = TRUE;
	};

	AI_Output(other,self,"DIA_Nadja_Poppen_16_99");	//Užijme si!
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//Dalších pár hodin patří jen a jen nám.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//Jen se hezky uvolni. Lehni si a užij si to!
	Info_ClearChoices(DIA_Nadja_Poppen);
	Info_AddChoice(DIA_Nadja_Poppen,"Fajn...",DIA_Nadja_Poppen_Start);
};

func void DIA_Nadja_Poppen_Start()
{
	if(MIS_LoaRomance == LOG_Running)
	{
		LoaAntiBonus = TRUE;
	};

	Bromor_Pay = FALSE;
	Nadja_Nacht = TRUE;
	LoveScene += 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Addon_Nadja_LuciaInfo_Pop()
{
	DIA_Nadja_Poppen_Start();
};

instance DIA_Nadja_BUYHERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_BUYHERB_Condition;
	information = DIA_Nadja_BUYHERB_Info;
	permanent = TRUE;
	description = "Kde bych tu koupil nějaké drogy?";
};

func int DIA_Nadja_BUYHERB_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (Npc_KnowsInfo(other,DIA_Nadja_WANT_HERB) == FALSE) && (Nadja_Money == FALSE) && (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nadja_BUYHERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Kde bych tu koupil nějaké drogy?

	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//Jak to mám vědět? A i kdybych to věděla, určitě bych to neřekla někomu od městské stráže.
			Undercover_Failed = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//Jestli ti vážně mám něco sdělit, budeš se muset vytasit s ňějakou tou škvárou.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//Kolik chceš?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//Spravilo by to 50 zlatých.
			Nadja_Money = TRUE;
		};
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);

		if((Nadja_GaveLuciaInfo == FALSE) && (Bromor_Pay == TRUE) && (NadjaIsUp == TRUE))
		{
			Npc_ExchangeRoutine(self,"DANCE");
		};
	};
};


instance DIA_Nadja_WANT_HERB(C_Info)
{
	npc = VLK_435_Nadja;
	nr = 2;
	condition = DIA_Nadja_WANT_HERB_Condition;
	information = DIA_Nadja_WANT_HERB_Info;
	permanent = FALSE;
	description = "Tak teď mi řekni, kde bych mohl koupit nějakou trávu? (zaplatit 50 zlatých)";
};


func int DIA_Nadja_WANT_HERB_Condition()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50) && (Nadja_Money == TRUE) && (MIS_Andre_REDLIGHT == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Nadja_WANT_HERB_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//Tak teď mi řekni, kde bych mohl koupit nějakou trávu?

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Je mi líto, ale prostě si to nepamatuju.
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Promluv si s Borkou, fešáku. Ten by pro tebe mohl trochu drogy mít.
		Knows_Borka_Dealer = TRUE;
	};
};