
instance DIA_PAL_9159_RAYNE_EXIT(C_Info)
{
	npc = pal_9159_rayne;
	nr = 999;
	condition = dia_pal_9159_rayne_exit_condition;
	information = dia_pal_9159_rayne_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9159_rayne_exit_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9159_RAYNE_MATTER(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_matter_condition;
	information = dia_pal_9159_rayne_matter_info;
	permanent = FALSE;
	description = "Zdravím, kdo jsi?";
};


func int dia_pal_9159_rayne_matter_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_matter_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Matter_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_01");	//Jmenuji se Rayne a mimo jiné jsem služebník našeho krále.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_03");	//Lord Varus mě jmenoval velitelem skladu tady v pevnosti.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_04");	//(podrážděně) Jakoby tu kromě mě nebyl nikdo jiný. 
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Matter_01_06");	//Ty asi nemáš rád tuhle práci, že?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_07");	//A kdo by měl? Každý den musím hlídat zásoby!
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_13");	//Jestli nemáš další otázky, tak mě nech na pokoji a zmiz. 
};


instance DIA_PAL_9159_RAYNE_SKLADWATCH(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladwatch_condition;
	information = dia_pal_9159_rayne_skladwatch_info;
	permanent = TRUE;
	description = "Nic se neztratilo?";
};


func int dia_pal_9159_rayne_skladwatch_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladwatch_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_SkladWatch_01_00");	//Nic se neztratilo?
	if(MIS_RAYNEHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_01");	//Teď, když mám asistenta, nemusím se ničeho obávat. (směje se)
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_02");	//Všechno je v úplném pořádku!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_04");	//Velmi vtipné!
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_05");	//Měl by sis to zkusit- abys věděl co je práce.
	};
};


instance DIA_PAL_9159_RAYNE_SKLADGOODS(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladgoods_condition;
	information = dia_pal_9159_rayne_skladgoods_info;
	permanent = FALSE;
	description = "A co tady v tom skladě hlídáš.";
};


func int dia_pal_9159_rayne_skladgoods_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter) == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladgoods_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_SkladGoods_01_00");	//A co tady v tom skladě hlídáš.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_03");	//Hmmm... Zbraně, oblečení, zbroje, jídlo, víno...
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_05");	//Aha!... (podezřívavě) Ty se o to nějak zajímáš...
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_06");	//I kdyby ses rozkrájel - stejně z toho nic nedostaneš. 
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_08");	//Klíč má jen lord Varus.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_10");	//Takže na to můžeš zapomenout.
	KNOWSVARUSKEY = TRUE;
};


instance DIA_PAL_9159_RAYNE_HELP(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_help_condition;
	information = dia_pal_9159_rayne_help_info;
	permanent = FALSE;
	description = "Máš nějaký stříbrný pohár?";
};


func int dia_pal_9159_rayne_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pal_9159_Rayne_SkladGoods) && (MIS_FERDSILVERCUP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_help_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_00");	//Máš nějaký stříbrný pohár?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_01");	//(zamyslel se) Hmmm... Ve skladu je pár kusů.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_02");	//Proč se o to zajímáš?
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_03");	//Paladin Ferdinand se mě zeptal, jestli bych mu jeden nedonesl.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_10");	//Jako všechno ostatní ve skladišti jsou ty poháry majetkem paladinů.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_11");	//Takže na to zapomeň.
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_12");	//Nemůžeš udělat výjimku?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_14");	//Poslyš - Jestli by se to Varus dozvěděl, zabil by mě.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_15");	//Ale to ty nechápeš...
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_16");	//Kdybys mi raději pomáhal ve skladu.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_17");	//Prostě si tu už nedokážu poradit sám!
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_18");	//Potřeboval bys pomocníka.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_19");	//Ale kde ho mám hledat?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_21");	//Ten mi řekl, že pro tuhle práci nemá víc lidí...
	Info_ClearChoices(dia_pal_9159_rayne_help);
	Info_AddChoice(dia_pal_9159_rayne_help,"Můžu ti s něčím pomoci?",dia_pal_9159_rayne_help_ok);
	Info_AddChoice(dia_pal_9159_rayne_help,"Budeš sebou muset pohnout.",dia_pal_9159_rayne_help_no);
};

func void dia_pal_9159_rayne_help_ok()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_Ok_01_00");	//Já něco vymyslím.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_Ok_01_09");	//Dobře. Možná v tobě něco bude.
	MIS_RAYNEHELP = LOG_Running;
	Log_CreateTopic(TOPIC_RAYNEHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_Running);
	B_LogEntry(TOPIC_RAYNEHELP,"Slíbil jsem paladinu Rayneovi, že mu seženu pomoc do skladiště.");
	Info_ClearChoices(dia_pal_9159_rayne_help);
};

func void dia_pal_9159_rayne_help_no()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_No_01_00");	//Budeš sebou muset pohnout.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_No_01_01");	//Hmmm...
	Info_ClearChoices(dia_pal_9159_rayne_help);
};


instance DIA_PAL_9159_RAYNE_HELPDONE(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_helpdone_condition;
	information = dia_pal_9159_rayne_helpdone_info;
	permanent = FALSE;
	description = "Lord Varus ti někoho pošle.";
};


func int dia_pal_9159_rayne_helpdone_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (FINDHELPERRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_helpdone_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_HelpDone_01_00");	//Lord Varus ti někoho pošle.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_04");	//(radostně) Díky, chlape!
	AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_05");	//Mámli být upřímný- nijak zvláť jsem nespoléhal na tvoji pomoc.
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_08");	//Tady - vezmi si ten stříbrný pohár!
		B_GiveInvItems(self,other,ItMi_SilverCup,1);
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_09");	//Myslím, že se ti bude hodit!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_12");	//Tady - vem si tuto rostlinu! Je velmi cenná!
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_13");	//Určitě tadle věc se ti bude hodit.
	};
	MIS_RAYNEHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAYNEHELP,"Rayne byl rád, že mu lord Varus poslal pomoc.");
	Wld_InsertNpc(pal_9162_ritter,"LGR_ZUMBANVIERTEL_02");
};


instance DIA_PAL_9159_RAYNE_PICKPOCKET(C_Info)
{
	npc = pal_9159_rayne;
	nr = 900;
	condition = dia_pal_9159_rayne_pickpocket_condition;
	information = dia_pal_9159_rayne_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9159_rayne_pickpocket_condition()
{
	return C_Beklauen(80,150);
};

func void dia_pal_9159_rayne_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,Dialog_Back,dia_pal_9159_rayne_pickpocket_back);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,DIALOG_PICKPOCKET,dia_pal_9159_rayne_pickpocket_doit);
};

func void dia_pal_9159_rayne_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

func void dia_pal_9159_rayne_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

