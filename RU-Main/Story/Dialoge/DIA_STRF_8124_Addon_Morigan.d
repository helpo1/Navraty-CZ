
instance DIA_STRF_8124_Addon_Morigan_EXIT(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 999;
	condition = DIA_STRF_8124_Addon_Morigan_exit_condition;
	information = DIA_STRF_8124_Addon_Morigan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8124_Addon_Morigan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_HELLO(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_hello_condition;
	information = DIA_STRF_8124_Addon_Morigan_hello_info;
	permanent = FALSE;
	description = "Я могу чем-то помочь?";
};

func int DIA_STRF_8124_Addon_Morigan_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8124_Addon_Morigan_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Hello_15_00");	//Я могу чем-то помочь?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Hello_08_00");	//Да...(ворчливо) Например, оставить меня в покое.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Hello_08_01");	//Если орки заметят, что я тут с тобой болтаю, мне придется несладко, приятель.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8124_Addon_Morigan_Help(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Help_condition;
	information = DIA_STRF_8124_Addon_Morigan_Help_info;
	permanent = FALSE;
	description = "А если серьезно?";
};

func int DIA_STRF_8124_Addon_Morigan_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Help_01_00");	//А если серьезно?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_01");	//Послушай...(нервно) Мне не нужна твоя помощь!
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_02");	//Но если действительно хочешь сделать доброе дело, принеси мне чего-нибудь попить.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Help_01_03");	//А то у меня во рту все так пересохло, что даже сглотнуть больно.
};

instance DIA_STRF_8124_Addon_Morigan_Water(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Water_condition;
	information = DIA_STRF_8124_Addon_Morigan_Water_info;
	permanent = FALSE;
	description = "Вот, хлебни воды.";
};

func int DIA_STRF_8124_Addon_Morigan_Water_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_Help) == TRUE) && (Npc_HasItems(other,ItFo_Water) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Water_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Water_01_00");	//Вот, хлебни воды.
	B_GiveInvItems(other,self,ItFo_Water,1);
	B_UseItem(self,ItFo_Water);
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Water_01_01");	//Так гораздо лучше.
};

instance DIA_STRF_8124_Addon_Morigan_Father(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_Father_condition;
	information = DIA_STRF_8124_Addon_Morigan_Father_info;
	permanent = FALSE;
	description = "Может, что-нибудь еще?";
};

func int DIA_STRF_8124_Addon_Morigan_Father_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8124_Addon_Morigan_Water) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_Father_info()
{
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_00");	//Может, что-нибудь еще?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_01");	//Хммм...(задумчиво) Даже не знаю, стоит ли тебя просить об этом.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_02");	//А ты попробуй.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_03");	//Ладно. В конце концов, кроме тебя мне здесь вряд ли кто-нибудь еще поможет.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_04");	//Скажи, ты часто бываешь на поверхности?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_05");	//Конечно.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_06");	//И какова там ситуация?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_07");	//Не намного лучше, чем здесь! Орки почти полностью контролируют остров.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_08");	//Единственное, куда они еще не посмели сунуться, это сам Хоринис.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_09");	//Но вряд ли это случится в ближайшее время, поскольку там расположился большой отряд паладинов.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_10");	//Что же, это не может не радовать...
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_11");	//А почему ты, собственно, интересуешься?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_12");	//Дело в том, что как раз в Хоринисе живет мой отец.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_13");	//Если бы ты только смог передать ему весточку о том, что я жив.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_14");	//И кто твой отец?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_15");	//Его зовут Карл, он кузнец. Если ты бывал в городе, то наверняка должен его знать.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_16");	//Да, я знаю его. Но захочет ли он услышать такие новости?
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_17");	//Я понимаю, что мое теперешнее положение не из лучших. 
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_18");	//Но я все-таки до сих пор жив, и он должен знать об этом!
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_Father_01_19");	//Хорошо, я передам ему это.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_Father_01_20");	//Благодарю тебя, приятель! Большего мне и не надо.
	MIS_FatherNews = LOG_Running;
	Log_CreateTopic(TOPIC_FatherNews,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Running);
	B_LogEntry(TOPIC_FatherNews,"Я пообещал Моригану навестить его отца в Хоринисе и передать ему, что его сын все еще жив. Его отца зовут Карл.");
};

instance DIA_STRF_8124_Addon_Morigan_FatherDone(C_Info)
{
	npc = STRF_8124_Addon_Morigan;
	nr = 2;
	condition = DIA_STRF_8124_Addon_Morigan_FatherDone_condition;
	information = DIA_STRF_8124_Addon_Morigan_FatherDone_info;
	permanent = FALSE;
	description = "Я поговорил с твоим отцом.";
};

func int DIA_STRF_8124_Addon_Morigan_FatherDone_condition()
{
	if(MIS_FatherNews == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8124_Addon_Morigan_FatherDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_00");	//Я поговорил с твоим отцом.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_01");	//(взволнованно) Ты меня не обманываешь?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_02");	//Нет, конечно! Мне нет смысла этого делать.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_03");	//И что он сказал?
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_04");	//Твой отец был рад услышать о том, что ты до сих пор жив.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_05");	//И он будет молиться за тебя Инносу.
	AI_Output(other,self,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_06");	//В надежде, что когда-нибудь ты все-таки сможешь вернуться домой.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_07");	//Эх...(печально) Я был бы и сам рад в это поверить. Да только отсюда не сбежишь.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_08");	//Но в любом случае я благодарен тебе за твою помощь.
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_09");	//Вот, возьми этот кусок руды в знак моей признательности.
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	AI_Output(self,other,"DIA_STRF_8124_Addon_Morigan_FatherDone_01_10");	//К сожалению, больше мне дать тебе нечего.
	RT_Respect = RT_Respect + 1;
};