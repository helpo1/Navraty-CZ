
instance DIA_PAL_2500_GAROND_EXIT(C_Info)
{
	npc = pal_2500_garond;
	nr = 999;
	condition = dia_pal_2500_garond_exit_condition;
	information = dia_pal_2500_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2500_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_GAROND_EXITNW(C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_exitnw_condition;
	information = dia_pal_2500_garond_exitnw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2500_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exitnw_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_00");	//Что, проблемы?
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_01");	//(переводя дух) Не думал, что выход из долины так хорошо охраняется!
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_02");	//Да уж, орков тут действительно сейчас предостаточно! Почти вся долина кишит их патрулями.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_03");	//Правда? (тревожно) Выходит, что здесь сейчас ситуация не намного лучше, чем в Долине Рудников. А что с городом?
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_06");	//Хоринис пал! Там теперь всем заправляют орки.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_07");	//О, Иннос! Худшей новости я и не мог от тебя услышать. Хотя и предполагал, что после захвата замка они вряд ли остановятся.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_08");	//Насколько мне известно, орки взяли город штурмом всего за один день, и устроили там настоящую резню, перебив всех его жителей.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_09");	//Только лорду Хагену с остатками своего гарнизона, да и еще нескольким счастливчикам удалось выбраться из этой западни. Все же остальные погибли!
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_10");	//(гневно) Мерзкие твари! Интересно, сколько им еще нужно пролить нашей крови, чтобы наконец-то успокоиться?
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_13");	//А где сейчас Хаген со своими людьми?
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_14");	//Они отсупили на позиции в форт Азган и заняли там оборону. Думаю, что и вам следует поступить точно так же.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_15");	//(недовольно) Ну, честно говоря, отступать - это не совсем в моих правилах.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_16");	//Боюсь, иного выхода у тебя сейчас нет.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_17");	//Твои люди полностью измотаны. Им сейчас просто необходима небольшая передышка.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_19");	//Поэтому послушай мой совет и отправляйся в Азган к лорду Хагену. Там ты сейчас нужней.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_20");	//Ну ладно. Возможно, ты действительно прав, и нам не стоит торопиться.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_21");	//Хотя имей бы я сейчас под своим началом пускай даже всего сотню доблестных рыцарей - я бы показал этим тварям, что значит быть паладином!
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_24");	//(серьезно) Хорошо. Мы отправляемся в форт. Только немного передохнем после битвы.
	GARONDGOFORT = TRUE;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Я вывел паладина Гаронда и его людей из окружения в Долине Рудников. Теперь надо вернуться в форт и сообщить об этом лорду Хагену.");
	};
	AI_StopProcessInfos(self);
};

instance DIA_PAL_2500_GAROND_PERMEXITNW(C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_permexitnw_condition;
	information = dia_pal_2500_garond_permexitnw_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_pal_2500_garond_permexitnw_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2500_garond_exitnw) && Npc_IsInState(self,ZS_Talk) && (HAGENOTHERSAGREED == FALSE) && (MIS_LostPaladins == LOG_Success))
	{
		return TRUE;
	};
};

func void dia_pal_2500_garond_permexitnw_info()
{
	AI_Output(self,other,"DIA_PAL_2500_Garond_PermExitNW_01_01");	//Увидимся в форте, приятель!
	AI_Output(other,self,"DIA_PAL_2500_Garond_PermExitNW_01_02");	//Само собой.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_Garond_VenzelDone(C_Info)
{
	npc = PAL_2500_Garond;
	nr = 2;
	condition = DIA_PAL_2500_Garond_VenzelDone_condition;
	information = DIA_PAL_2500_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Я выяснил, что случилось с Венцелем.";
};

func int DIA_PAL_2500_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_2500_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_01");	//Я выяснил, что случилось с Венцелем.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_02");	//Рассказывай все, что знаешь. Он жив?
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_03");	//Жив, но попал в плен к оркам. Они отправили его в железную шахту добывать руду.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_04");	//Хвала Инносу...(облегченно) Значит, еще не все потеряно! Надо попробовать вытащить его оттуда.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_05");	//В этом уже нет необходимости. В шахте орков я нашел магический портал.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_06");	//Венцель вместе с остальными рабами воспользуется им, чтобы сбежать из плена.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_07");	//Однако есть подозрение, что портал ведет прямиком на материк.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_08");	//Поэтому Венцель попросил меня передать тебе, что скорее всего, не вернется обратно в Хоринис.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_09");	//Что же, пусть будет так. Главное, что с ним все будет в порядке.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_10");	//Он сказал, что вернется в Миртану и будет сражаться с орками там.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_11");	//По всей видимости, он был прав, когда говорил, что у короля там дела обстоят не лучше вашего.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_12");	//Эти проклятые орки...(гневно) Они заполонили всю страну, как саранча!
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_13");	//Но мы будем сражаться до последнего! Просто так им нас не сломить.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_14");	//Что касается ситуации на материке...(с неохотой) Я не стану тебя обманывать! Да, это так.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_15");	//Король из последних сил старается сдержать орды орков, прорвавшиеся из Нордмара.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_16");	//Но ему это плохо удается. Орков слишком много, а королю не хватает ни людей, ни оружия.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_17");	//Поэтому вся надежда лежит на нас! Возможно, с помощью магической руды еще есть шанс переломить ход войны.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_18");	//Но, как видишь, мы сами тут с трудом отбиваемся от орков.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_19");	//Я не привык сдаваться раньше времени...(обреченно) Но похоже, что в этой войне мы уже проиграли.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_20");	//Но только не вздумай об этом рассказывать кому-либо! 
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_21");	//Я не позволю, чтобы мои солдаты пали духом только из-за каких то глупых домыслов.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_22");	//Само собой.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Я рассказал Гаронду о судьбе Венцеля.");
};