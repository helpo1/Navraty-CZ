
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
	description = "Тебя, наверное, не имеет смысла спрашивать...";
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
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_01");	//Тебя, наверное, не имеет смысла спрашивать...
	AI_Output(self,other,"DIA_Pedro_LI_MissMyGold_01_02");	//(растерянно) О чем?
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_03");	//По поводу моего пропавшего золота.
	AI_Output(self,other,"DIA_Pedro_LI_MissMyGold_01_04");	//(боязно) Извини, я ничего об этом не знаю.
	AI_Output(other,self,"DIA_Pedro_LI_MissMyGold_01_05");	//Я так и думал.
	B_LogEntry(TOPIC_MISSMYGOLD,"Как я и думал, Педро ничего не знает о моем пропавшем золоте.");
};


instance DIA_PEDRO_LI_CHANGECOURSE(C_Info)
{
	npc = nov_600_pedro_li;
	nr = 2;
	condition = dia_pedro_li_changecourse_condition;
	information = dia_pedro_li_changecourse_info;
	permanent = FALSE;
	description = "Как насчет того, чтобы вернуться обратно в Хоринис?";
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
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_01_00");	//Мы должны снова вернуться в Хоринис.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_01");	//(испуганно) Что?! Но разве нам действительно необходимо это делать?
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_01_02");	//По твоим глазам могу сказать только одно: кажется, ты сильно испуган этой новостью.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_03");	//Ты прав. Ведь мое возвращение на Хоринис может означать для меня только смерть.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_01_04");	//(обреченно) Маги из монастыря никогда не простят мне мое предательство. И вряд ли кто-нибудь захочет вступиться за меня.
	Info_ClearChoices(dia_pedro_li_changecourse);
	Info_AddChoice(dia_pedro_li_changecourse,"Уверен, что смогу тебе в этом помочь.",dia_pedro_li_changecourse_ok);
	Info_AddChoice(dia_pedro_li_changecourse,"Твоему предательству нет оправдания!",dia_pedro_li_changecourse_death);
};

func void dia_pedro_li_changecourse_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_00");	//Уверен, что смогу тебе в этом помочь.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_01");	//Ты серьезно? Но каким образом?
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_02");	//Я постараюсь объяснить Пирокару и другим магам Огня, что в случившемся нет твоей вины.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_03");	//Наверняка они и сами понимают, что послушник не смог бы противостоять темной магии.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Ok_01_04");	//Ты был тогда просто одержим, и не мог осознавать того, что делаешь.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_05");	//Да...(с сожалением) Я не знал, что творил.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Ok_01_07");	//Хорошо, спасибо тебе. Надеюсь, ты поможешь мне.
	B_LogEntry(TOPIC_CHANGECOURSE,"Я успокоил Педро, сказав, что, если мы отправимся обратно в Хоринис, я заступлюсь за него перед магами Огня.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	MIS_HELPPEDRO = LOG_Running;
	Log_CreateTopic(TOPIC_HELPPEDRO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPPEDRO,LOG_Running);
	B_LogEntry(TOPIC_HELPPEDRO,"Я пообещал послушнику Педро заступиться за него, если мы вдруг решим вернуться в Хоринис. Кажется, его это немного успокоило.");
	Info_ClearChoices(dia_pedro_li_changecourse);
};

func void dia_pedro_li_changecourse_death()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_00");	//Твоему предательству нет оправдания!
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Death_01_01");	//Но я ведь ни в чем не виноват! Меня просто заставили это сделать.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_02");	//Это ты будешь рассказывать Пирокару и другим магам Огня, когда вернешься обратно в монастырь.
	AI_Output(other,self,"DIA_Pedro_LI_ChangeCourse_Death_01_03");	//Уверен, что они очень обрадуются твоему возвращению.
	AI_Output(self,other,"DIA_Pedro_LI_ChangeCourse_Death_01_05");	//О нет! Иннос, за что мне такие страдания?
	B_LogEntry(TOPIC_CHANGECOURSE,"Я сказал Педро, что он может не рассчитывать на мою помощь, если мы решим вернуться обратно в Хоринис. Так что я не думаю, что он остался в восторге от моей идеи.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_pedro_li_changecourse);
};

