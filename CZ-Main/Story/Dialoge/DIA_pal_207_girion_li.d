
instance DIA_GIRION_LI_XIT(C_Info)
{
	npc = pal_207_girion_li;
	nr = 999;
	condition = dia_girion_li_exit_condition;
	information = dia_girion_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_girion_li_exit_condition()
{
	return TRUE;
};

func void dia_girion_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_LI_TEACH(C_Info)
{
	npc = pal_207_girion_li;
	nr = 5;
	condition = dia_girion_li_teach_condition;
	information = dia_girion_li_teach_info;
	permanent = TRUE;
	description = "Můžeme se procvičit s mečem?";
};


func int dia_girion_li_teach_condition()
{
	return TRUE;
};

func void dia_girion_li_teach_info()
{
	AI_Output(other,self,"DIA_Girion_LI_Teach_15_00");	//Můžeme se procvičit s mečem
	AI_Output(self,other,"DIA_Girion_LI_Teach_08_01");	//S radostí! Aspoň zabiju čas čas.
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_back()
{
	Info_ClearChoices(dia_girion_li_teach);
};

func void dia_girion_li_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Tvoje ostří musí svištět vzduchem, jako rákosí na pobřeží.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Svoji sílu používej s rozmyslem. Když se bezhlavě vrhneš proti nepříteli, nebudeš moc úspěšný.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Nesvírej křečovitě ruku, abys zasáhnul přesně cíl.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};

func void dia_girion_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Nezapomeň na obranu. Nejlepší je, vyhýbat se protivníkovým ranám.
	};
	Info_ClearChoices(dia_girion_li_teach);
	Info_AddChoice(dia_girion_li_teach,Dialog_Back,dia_girion_li_teach_back);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_girion_li_teach_2h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_girion_li_teach_2h_5);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_girion_li_teach_1h_1);
	Info_AddChoice(dia_girion_li_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_girion_li_teach_1h_5);
};


instance DIA_GIRION_LI_PICKPOCKET(C_Info)
{
	npc = pal_207_girion_li;
	nr = 900;
	condition = dia_girion_li_pickpocket_condition;
	information = dia_girion_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_girion_li_pickpocket_condition()
{
	return C_Beklauen(71,260);
};

func void dia_girion_li_pickpocket_info()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
	Info_AddChoice(dia_girion_li_pickpocket,Dialog_Back,dia_girion_li_pickpocket_back);
	Info_AddChoice(dia_girion_li_pickpocket,DIALOG_PICKPOCKET,dia_girion_li_pickpocket_doit);
};

func void dia_girion_li_pickpocket_doit()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(dia_girion_li_pickpocket);
};

func void dia_girion_li_pickpocket_back()
{
	Info_ClearChoices(dia_girion_li_pickpocket);
};


instance DIA_GIRION_LI_MISSMYGOLD(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_missmygold_condition;
	information = dia_girion_li_missmygold_info;
	permanent = FALSE;
	description = "Mé zlato se ztratilo.";
};


func int dia_girion_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_girion_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Girion_LI_MissMyGold_01_01");	//Mé zlato se ztratilo.
	AI_Output(self,other,"DIA_Girion_LI_MissMyGold_01_02");	//Cože?! Myslíš si, že královský paladin je zloděj?!
	AI_Output(self,other,"DIA_Girion_LI_MissMyGold_01_04");	//Nic o tom nevím!
	B_LogEntry(TOPIC_MISSMYGOLD,"Girion nic o mém zlatě neví.");
};


instance DIA_GIRION_LI_CHANGECOURSE(C_Info)
{
	npc = pal_207_girion_li;
	nr = 2;
	condition = dia_girion_li_changecourse_condition;
	information = dia_girion_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_girion_li_changecourse_info()
{
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_00");	//Slyšel jsem, že ti podařilo najít na ostrově velké naleziště magické rudy.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_02");	//Myslím, že bychom měli jet na Khorinis a říci to lordu Hagenovi.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_01_03");	//Paladinové by se měli dozvědět o této rudě!
	Info_ClearChoices(dia_girion_li_changecourse);
	Info_AddChoice(dia_girion_li_changecourse,"Úplně s tebou souhlasím.",dia_girion_li_changecourse_ore);
	Info_AddChoice(dia_girion_li_changecourse,"Paladinové by za tu informaci dobře zaplatili!",dia_girion_li_changecourse_gold);
};

func void dia_girion_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Girion_LI_ChangeCourse_Ore_01_00");	//Úplně s tebou souhlasím! Prvně musíme opravit loď.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_01");	//(S úctou) Nic jinýho, jsem od teb nečekala.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_02");	//Ruda co jsi naše, zvíší naše šance na úspěch ve válce proti skřetům.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Ore_01_03");	//Pravděpodobně je to naše poslední naděje...(odevzdaně)
	B_LogEntry(TOPIC_CHANGECOURSE,"Paladin Girion souhlasil s návratem na Khorinis, abychom informovali lorda Hagena o rudě.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi, takže bych měl zajít za kapitánem.");
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

func void dia_girion_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Girion_LI_ChangeCourse_Gold_01_00");	//Paladinové by za tu informaci dobře zaplatili.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_02");	//Co?! (naštvaně) Vždyť jsi paladin! Jak se můžeš tak zachovat?
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_03");	//Není v tobě ani kapka šlechetnosti a cti paladina?!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_04");	//Co?!... (velmi udiveně) Je velmi divné slyšet to od mága Ohně!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_05");	//To je ti zlato drahžší než tvá svatá povinnost Innosovi?!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_06");	//Co?!... (velmi udiveně) Je velmi divné slyšet to od mága Vody!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_07");	//To je ti zlato drahžší než tvá svatá povinnost Adanovi?!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_08");	//Hmmm... (povýšeně) Nic jiného jsem od tebe nemohl čekat.
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_09");	//Temní mágové se zajímají vždy jen o svůj prospěch a nezáleží jim na ostatních!
	}
	else if((other.guild == GIL_DJG) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_10");	//No samozřejmě, nic jinýho jsem ani nečekal (zlomyslně)!
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_11");	//Ty a ten tvůj žoldácký chtíč po zlatě...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_12");	//Co?!... (rozhořčeně) Opravdu v tobě není ani kapka cti nebo šlechetnosti?!
	};
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_15");	//Ale já doufám, že změníš rozhodnutí.
	AI_Output(self,other,"DIA_Girion_LI_ChangeCourse_Gold_01_16");	//Ve skutečnosti na tobě záleží životy mnoha lidí!
	B_LogEntry(TOPIC_CHANGECOURSE,"Paladin Girion byl extrémně překvapen a pohoršen mým nápadem.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		B_LogEntry(TOPIC_CHANGECOURSE,"Promluvil jsem se všemi chlapi. Měl bych si promluvit s kapitánem.");
	};
	Info_ClearChoices(dia_girion_li_changecourse);
};

