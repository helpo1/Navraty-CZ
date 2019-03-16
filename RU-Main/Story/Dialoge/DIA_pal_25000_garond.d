
instance DIA_PAL_25000_GAROND_EXIT(C_Info)
{
	npc = pal_25000_garond;
	nr = 999;
	condition = dia_pal_25000_garond_exit_condition;
	information = dia_pal_25000_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_25000_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_25000_GAROND_EXITNW(C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_exitnw_condition;
	information = dia_pal_25000_garond_exitnw_info;
	permanent = FALSE;
	description = "Теперь твои люди и ты сам в безопасности.";
};


func int dia_pal_25000_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exitnw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_25000_Garond_ExitNW_01_00");	//Теперь твои люди и ты сам в безопасности.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_01");	//Да, однако орки все еще осаждают Хоринис, и это не может радовать.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_02");	//Мы должны что-то предпринять, чтобы выбить их с острова! Иначе все наши труды будут напрасны.
	AI_Output(other,self,"DIA_PAL_25000_Garond_ExitNW_01_03");	//Не волнуйся. Что-нибудь придумаем.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_04");	//Надеюсь.
};


instance DIA_PAL_25000_GAROND_PERMEXITNW(C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_permexitnw_condition;
	information = dia_pal_25000_garond_permexitnw_info;
	permanent = TRUE;
	description = "Как обстоят дела?";
};


func int dia_pal_25000_garond_permexitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_permexitnw_info()
{
	AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_01");	//Как обстоят дела?
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_06");	//Уже лучше...(воинственно) Наконец-то лорд Хаген отдал всеобщий приказ о выступлении.
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_07");	//Скоро нам предстоит большое сражение с орками, и клянусь Инносом, что теперь этим тварям точно не поздоровится!
		AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_08");	//Будем надеяться, что так оно и будет.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_02");	//Лорд Хаген до сих пор не решился атаковать орков, и я не понимаю, почему.
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_03");	//Возможно, он ждет более удобного момента, но по моему мнению - он давно настал!
		AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_04");	//Думаю, это долго не затянется. Уверен, паладины еще скажут свое веское слово в этой войне.
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_05");	//Будь уверен - так и будет. Клянусь Инносом!
	};
};

instance DIA_PAL_25000_Garond_VenzelDone(C_Info)
{
	npc = PAL_25000_Garond;
	nr = 2;
	condition = DIA_PAL_25000_Garond_VenzelDone_condition;
	information = DIA_PAL_25000_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Я выяснил, что случилось с Венцелем.";
};

func int DIA_PAL_25000_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_25000_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_01");	//Я выяснил, что случилось с Венцелем.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_02");	//Рассказывай все, что знаешь. Он жив?
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_03");	//Жив, но попал в плен к оркам. Они отправили его в железную шахту добывать руду.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_04");	//Хвала Инносу...(облегченно) Значит, еще не все потеряно! Надо попробовать вытащить его оттуда.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_05");	//В этом уже нет необходимости. В шахте орков я нашел магический портал.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_06");	//Венцель вместе с остальными рабами воспользуется им, чтобы сбежать из плена.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_07");	//Однако есть подозрение, что портал ведет прямиком на материк.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_08");	//Поэтому Венцель попросил меня передать тебе, что скорее всего, не вернется обратно в Хоринис.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_09");	//Что же, пусть будет так. Главное, что с ним все будет в порядке.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_10");	//Он сказал, что вернется в Миртану и будет сражаться с орками там.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_11");	//По всей видимости, он был прав, когда говорил, что у короля там дела обстоят не лучше вашего.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_12");	//Эти проклятые орки...(гневно) Они заполонили всю страну, как саранча!
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_13");	//Но мы будем сражаться до последнего! Просто так им нас не сломить.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_14");	//Что касается ситуации на материке...(с неохотой) Я не стану тебя обманывать! Да, это так.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_15");	//Король из последних сил старается сдержать орды орков, прорвавшиеся из Нордмара.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_16");	//Но ему это плохо удается. Орков слишком много, а королю не хватает ни людей, ни оружия.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_17");	//Поэтому вся надежда лежит на нас! С помощью магической руды возможно еще можно будет переломить ход войны.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_18");	//Но как видишь, мы сами тут с трудом отбиваемся от орков.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_19");	//Я не привык сдаваться раньше времени...(обреченно) Но похоже, что в этой войне мы уже проиграли.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_20");	//Но только не вздумай об этом рассказывать кому-либо! 
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_21");	//Я не позволю, чтобы мои солдаты пали духом только из-за каких то глупых домыслов.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_22");	//Само собой.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Я рассказал Гаронду о судьбе Венцеля.");
};