
instance DIA_PEDRO_LI_EXIT(C_Info)
{
	npc = nov_600_pedro_li;
	nr = 999;
	condition = dia_pedro_li_exit_condition;
	information = dia_pedro_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pedro_li_exit_condition()
{
	return TRUE;
};

func void dia_pedro_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_LI_MISSMYGOLD(C_Info)
{
	npc = nov_600_pedro_li;
	nr = 2;
	condition = dia_pedro_li_missmygold_condition;
	information = dia_pedro_li_missmygold_info;
	permanent = FALSE;
	description = "Asi nemá cenu se ptát.";
};


func int dia_pedro_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pedro_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_01");	//Asi nemá cenu se ptát.
	AI_Output(self,other,"DIA_Pedro_LI_MissMyGold_01_02");	//Na co?
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_03");	//Na moje zlato.
	AI_Output(self,other,"DIA_Pedro_LI_MissMyGold_01_04");	//(strach) Je mí líto, o tom nic nevím.
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_05");	//Jak jinak.
	B_LogEntry(TOPIC_MISSMYGOLD,"Pedro mi o mém zlatě taky nic neřekl.");
};


instance DIA_PEDRO_LI_CHANGECOURSE(C_Info)
{
	npc = nov_600_pedro_li;
	nr = 2;
	condition = dia_pedro_li_changecourse_condition;
	information = dia_pedro_li_changecourse_info;
	permanent = FALSE;
	description = "Vracíme se na Khorinis.";
};


func int dia_pedro_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pedro_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_01_00");	//Vracíme se na Khorinis.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_01");	//(strach) Cože? Opravdu tam chceš?
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_01_02");	//Vypadáš vyděšeně.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_03");	//Návrat na Khorinis pro mě znamená smrt!
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_04");	//Mágové mi neodpustí mou zradu.
	Info_ClearChoices(dia_pedro_li_changecourse);
	Info_AddChoice(dia_pedro_li_changecourse,"Pomůžu ti.",dia_pedro_li_changecourse_ok);
	Info_AddChoice(dia_pedro_li_changecourse,"Není odpuštění pro tvou zradu!",dia_pedro_li_changecourse_death);
};

func void dia_pedro_li_changecourse_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_00");	//Pomůžu ti.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_01");	//Vážně? Ale jak?!
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_02");	//Promluvím s Pyrokarem.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_03");	//Snad pochopí, že jsi byl očarován.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_04");	//Jako posedlý sis nebyl vědom toho, co děláš.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_05");	//Nebyl...
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_07");	//Děkuji ti!
	B_LogEntry(TOPIC_CHANGECOURSE,"Ujistil jsem Pedra, že pokud se vrátíme na Khorinis, přimluvím se za něj u mágů Ohně.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem s celou posádkou, je čas informovat kapitána.");
	};
	MIS_HELPPEDRO = LOG_Running;
	Log_CreateTopic(TOPIC_HELPPEDRO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_Running);
	B_LogEntry(TOPIC_HELPPEDRO,"Ujistil jsem Pedra, že pokud se vrátíme na Khorinis, přimluvím se za něj u mágů Ohně.");
	Info_ClearChoices(dia_pedro_li_changecourse);
};

func void dia_pedro_li_changecourse_death()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_00");	//Není odpuštění pro tvou zradu!
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Death_01_01");	//Ale já to nechtěl udělat...
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_02");	//To řekneš Pyrokarovi až se vrátíme.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_03");	//Jsem si jistý, že tě rád uvidí.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Death_01_05");	//U Innose, proč já?
	B_LogEntry(TOPIC_CHANGECOURSE,"Řekl jsem Pedrovi, že až se vrátíme na Khorinis, předám ho Pyrokarovi.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Promluvil jsem s celou posádkou, je čas informovat kapitána.");
	};
	Info_ClearChoices(dia_pedro_li_changecourse);
};

