
instance DIA_ANGAR_LI_EXIT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 999;
	condition = dia_angar_li_exit_condition;
	information = dia_angar_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_angar_li_exit_condition()
{
	return TRUE;
};

func void dia_angar_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_PICKPOCKET(C_Info)
{
	npc = djg_705_angar_li;
	nr = 900;
	condition = dia_angar_li_pickpocket_condition;
	information = dia_angar_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_angar_li_pickpocket_condition()
{
	return C_Beklauen(47,45);
};

func void dia_angar_li_pickpocket_info()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
	Info_AddChoice(dia_angar_li_pickpocket,Dialog_Back,dia_angar_li_pickpocket_back);
	Info_AddChoice(dia_angar_li_pickpocket,DIALOG_PICKPOCKET,dia_angar_li_pickpocket_doit);
};

func void dia_angar_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_angar_li_pickpocket);
};

func void dia_angar_li_pickpocket_back()
{
	Info_ClearChoices(dia_angar_li_pickpocket);
};


instance DIA_ANGAR_LI_FOUNDAMULETT(C_Info)
{
	npc = djg_705_angar_li;
	nr = 7;
	condition = dia_angar_li_foundamulett_condition;
	information = dia_angar_li_foundamulett_info;
	description = "Našel jsem tvůj amulet.";
};


func int dia_angar_li_foundamulett_condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_foundamulett_info()
{
	B_AngarsAmulettAbgeben();
};


instance DIA_ANGAR_LI_MISSMYGOLD(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_missmygold_condition;
	information = dia_angar_li_missmygold_info;
	permanent = FALSE;
	description = "Mám otázku.";
};


func int dia_angar_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_angar_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Angar_LI_MissMyGold_01_03");	//Nevíš kam se podělo moje zlato?
	AI_Output(self,other,"DIA_Angar_LI_MissMyGold_01_04");	//(překvapen) Chlape, já o tom nic nevím!
	AI_Output(self,other,"DIA_Angar_LI_MissMyGold_01_05");	//Víš, o zlato se já moc nezajímám, takže jsem nesledoval co se s ním děje.
	B_LogEntry(TOPIC_MISSMYGOLD,"Angar neví, kde mé zlato je.");
};


instance DIA_ANGAR_LI_HELLO(C_Info)
{
	npc = djg_705_angar_li;
	nr = 1;
	condition = dia_angar_li_hello_condition;
	information = dia_angar_li_hello_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_angar_li_hello_condition()
{
	return TRUE;
};

func void dia_angar_li_hello_info()
{
	AI_Output(other,self,"DIA_Angar_LI_Hello_01_01");	//Jaká je situace?
	AI_Output(self,other,"DIA_Angar_LI_Hello_01_02");	//Všechno je v klidu, ale myslím, že jen díky tomu, že nechodíme do hloubějších částí ostrova.
	AI_Output(self,other,"DIA_Angar_LI_Hello_01_03");	//Ještě nikdo neví, co se tam může skrývat.
};


instance DIA_ANGAR_LI_HEADPAIN(C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_headpain_condition;
	information = dia_angar_li_headpain_info;
	permanent = FALSE;
	description = "Už netrpíš bolestí hlavy?";
};


func int dia_angar_li_headpain_condition()
{
	return TRUE;
};

func void dia_angar_li_headpain_info()
{
	AI_Output(other,self,"DIA_Angar_LI_HeadPain_01_01");	//Už netrpíš bolestí hlavy?
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_02");	//Ne, vše je v pořádku. Co jsi dokončil práci na Irdorathu, je vše v pořádku.
	AI_Output(other,self,"DIA_Angar_LI_HeadPain_01_03");	//A co teď tady?
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_04");	//No, cítím se tu lépe než v bažinách.
	AI_Output(self,other,"DIA_Angar_LI_HeadPain_01_05");	//Alespoň si tu odpočinu, jen by tu nemusel být ten strach z neznámých hlubin tohohle ostrova.
};


instance DIA_ANGAR_LI_AWAY(C_Info)
{
	npc = djg_705_angar_li;
	nr = 3;
	condition = dia_angar_li_away_condition;
	information = dia_angar_li_away_info;
	permanent = FALSE;
	description = "Zpátky na palubu!";
};


func int dia_angar_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (ANGARLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_away_info()
{
	var int countpeople;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_LI_Away_01_01");	//Zpátky na palubu!
	AI_Output(self,other,"DIA_Angar_LI_Away_01_02");	//A co se stalo?
	AI_Output(other,self,"DIA_Angar_LI_Away_01_03");	//Loď je konečně opravena, už jsme dokončili poslední přípravy a zvedáme kotvy.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_04");	//A já myslel, že tu zůstaneme déle.
	AI_Output(other,self,"DIA_Angar_LI_Away_01_05");	//Něco není v pořádku?!
	AI_Output(self,other,"DIA_Angar_LI_Away_01_08");	//Je to první místo, kde jsem našel klid a mír - ale jsem na něj naštvaný proto, že zde nemohu zůstat.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_09");	//Takže by mi nevadilo tady zůstat pár dní.
	AI_Output(self,other,"DIA_Angar_LI_Away_01_11");	//No doufám, že se sem ještě vrátím...
	B_LogEntry(TOPIC_GATHERCREW,"Informoval jsem Angara o odplutí. Myslím, že sem ho trochu rozrušil.");
	ANGARLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeople = countpeople + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeople) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_LI_FINDMAGICORECAVE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_findmagicorecave_condition;
	information = dia_angar_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem tu ložisko rudy.";
};


func int dia_angar_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Angar_LI_FindMagicOreCave_01_01");	//Našel jsem tu ložisko rudy.
	AI_Output(self,other,"DIA_Angar_LI_FindMagicOreCave_01_02");	//Opravdu?! To by měl vědět kapitán.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ANGAR_LI_CHANGECOURSE(C_Info)
{
	npc = djg_705_angar_li;
	nr = 2;
	condition = dia_angar_li_changecourse_condition;
	information = dia_angar_li_changecourse_info;
	permanent = FALSE;
	description = "Vracíme se na Khorinis.";
};


func int dia_angar_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_angar_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_01_00");	//Vracíme se na Khorinis.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_01_01");	//Do Khorinisu? Ale proč?
	Info_ClearChoices(dia_angar_li_changecourse);
	Info_AddChoice(dia_angar_li_changecourse,"Musím nezbytně mluvit s lordem Hagenem!",dia_angar_li_changecourse_ore);
	Info_AddChoice(dia_angar_li_changecourse,"Jedná se o zlato.",dia_angar_li_changecourse_gold);
};

func void dia_angar_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_01");	//Musím nezbytně mluvit s lordem Hagenem!
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_02");	//Musíme paladiny informovat o rudě tady na ostrově.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_03");	//Může jim pomoci ve válce!
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_04");	//To je opravdu velmi závažný důvod.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_05");	//A věřím, že bychom to udělat měli.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_06");	//Také by mě zajímalo, jestli se nic nestalo mým bratrům na ostrově.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_07");	//Jestli ti zelenokožci přijdou, Bratrstvo je hned u průsmyku. Něco mi říká, že bych neměl být lhostejný k jejich osudu.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Ore_01_08");	//Takže jdeš se mnou?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Ore_01_09");	//Ano, vrátím se s tebou na Khorinis.
	B_LogEntry(TOPIC_CHANGECOURSE,"Angar souhlasil s návratem na Khorinis, abychom řekli paladinům o rudě.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem mluvil se všemi chlapi - měl bych jít za kapitánem a dát mu vědět.");
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

func void dia_angar_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_01");	//Jedná se o zlato.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_02");	//Chci paladinům prodat tenhle ostrov i s rudou.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_03");	//To by mohl být výnosný obchod, co říkáš?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_04");	//Nemyslím, že je to dobrý nápad.
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_05");	//Takový risk kvůli zlatu je šílenství.
	AI_Output(other,self,"DIA_Angar_LI_ChangeCourse_Gold_01_07");	//Takže jsi proti?
	AI_Output(self,other,"DIA_Angar_LI_ChangeCourse_Gold_01_08");	//Ano, slyšel jsi mé mínění a nic ho nezmění.
	B_LogEntry(TOPIC_CHANGECOURSE,"Angar si nemyslí, že bychom se měli vracet kvůli zlatu.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem mluvil se všemi chlapi - měl bych zajít za kapitánem a říci mu to.");
	};
	Info_ClearChoices(dia_angar_li_changecourse);
};

