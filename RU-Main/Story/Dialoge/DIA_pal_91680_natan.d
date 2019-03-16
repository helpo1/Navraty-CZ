
instance DIA_PAL_91680_NATAN_EXIT(C_Info)
{
	npc = pal_91680_natan;
	nr = 999;
	condition = dia_pal_91680_natan_exit_condition;
	information = dia_pal_91680_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_91680_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_91680_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_PERM(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_perm_condition;
	information = dia_pal_91680_natan_perm_info;
	permanent = FALSE;
	description = "Что думаешь делать?";
};


func int dia_pal_91680_natan_perm_condition()
{
	if(HAGENOTHERSAGREED == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_perm_info()
{
	AI_Output(other,self,"DIA_Pal_91680_Natan_Perm_01_00");	//Что думаешь делать?
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_01");	//Полагаю отправиться в форт. Оставаться здесь сейчас слишком опасно!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_02");	//Кроме этого, мне необходимо как можно скорее доложить лорду Хагену о сложившейся ситуации в Долине Рудников.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_03");	//Он должен знать, что сейчас там происходит!
	AI_Output(other,self,"DIA_Pal_91680_Natan_Perm_01_04");	//Хорошо! Тогда выполняй свой приказ, солдат.
};


instance DIA_PAL_91680_NATAN_UDAR(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_udar_condition;
	information = dia_pal_91680_natan_udar_info;
	permanent = FALSE;
	description = "Паладин Удар снова с нами!";
};


func int dia_pal_91680_natan_udar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && !Npc_IsDead(pal_2680_udar))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_udar_info()
{
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_00");	//Паладин Удар снова с нами!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_01");	//К счастью, да. Безусловно, я очень рад!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_02");	//Если бы он погиб, я бы, наверное, свихнулся.
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_03");	//Тогда, полагаю, что ты уже достаточно сделал для того, чтобы выполнить по отношению к нему свой обет чести.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_04");	//Боюсь, что это не совсем так. Ведь я еще толком ничего для него и не сделал!
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_05");	//Но ты ведь сражался с орками, помогая ему выбраться из Долины Рудников. Разве этого мало?
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_06");	//Конечно мало. Пойми, я всю свою жизнь только и делаю, что сражаюсь с этими мерзкими тварями.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_07");	//И, честно говоря, большой заслуги в этом не вижу! Это мой священный долг как паладина, мой и многих других ребят.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_08");	//А Удар спас мне жизнь! Это исключительный поступок! И я должен совершить нечто подобное в отношении него.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_09");	//И оставь свои попытки успокоить или переубедить меня!
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_10");	//М-да... В общем, все ясно.
};


instance DIA_PAL_91680_NATAN_ZASADA(C_Info)
{
	npc = pal_91680_natan;
	nr = 900;
	condition = dia_pal_91680_natan_zasada_condition;
	information = dia_pal_91680_natan_zasada_info;
	permanent = FALSE;
	description = "(отвлечь разговором...)";
};


func int dia_pal_91680_natan_zasada_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARORCSTRAP == TRUE) && (UDARORCSTRAPDONE == FALSE) && !Npc_IsDead(pal_2680_udar))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_zasada_info()
{
	PlayVideo("RET2_BlackScreen.bik");
	UDARORCSTRAPDONE = TRUE;
	AI_Teleport(pal_2680_udar,"NW_UDAR_ZASADA");
	Wld_InsertNpc(orkelite_udar,"FP_ROAM_ZASADAORCS_01");
	Wld_InsertNpc(orcwarrior_udar_01,"FP_ROAM_ZASADAORCS_02");
	Wld_InsertNpc(orcwarrior_udar_02,"FP_ROAM_ZASADAORCS_03");
	Wld_InsertNpc(orcwarrior_udar_03,"FP_ROAM_ZASADAORCS_04");
	Wld_InsertNpc(orcwarrior_udar_04,"FP_ROAM_ZASADAORCS_05");
	Wld_InsertNpc(orcwarrior_udar_05,"FP_ROAM_ZASADAORCS_06");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_WHEREUDAR(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudar_condition;
	information = dia_pal_91680_natan_whereudar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && !Npc_IsDead(pal_2680_udar) && (UDARORCSTRAPDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudar_info()
{
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_00");	//(взволновано) Постой, подожди! Пока мы тут с тобой болтали, я совершенно не заметил того, что паладин Удар куда-то исчез.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_01");	//Ты случайно не знаешь, где он?
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_02");	//Кажется, он собирался немного поохотиться на орков.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_03");	//На орков, один?! Но это же чертовски опасно!
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_04");	//Полагаю, что он посчитал это неплохой идеей - прикончить парочку этих мерзких тварей.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_05");	//Проклятье! И о чем он только думал?! Он же может запросто погибнуть. Ай, бестолочь, как я мог допустить это?
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_06");	//Нечего причитать, нужно найти его. Куда именно он отправился?!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_07");	//Полагаю, что куда-то в сторону таверны Орлана. Как он сказал - там недалеко есть отличное место для засады.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_08");	//Ты можешь отвести меня туда?
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_09");	//Ладно! Следуй за мной.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_10");	//Хорошо, веди.
	B_LogEntry(TOPIC_NATANDOLG,"Как и ожидалось, Натан был сильно встревожен, узнав, что Удар в одиночку отправился охотиться на орков, и попросил меня помочь найти своего товарища.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_WHEREUDARDONE(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudardone_condition;
	information = dia_pal_91680_natan_whereudardone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudardone_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARORCSTRAPISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudardone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_00");	//(взволновано) Хорошо, что мы успели. Легкая задержка - и он был бы труп!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_01");	//Но, как видишь, все обошлось! Кстати, думаю, что теперь паладин Удар у тебя в долгу - ведь ты фактически спас ему жизнь.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_02");	//Даже не знаю... Все случилось так быстро. Я даже не тащил его на собственном горбу с орками на хвосте.
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_03");	//Главное, что ты выполнил свой обет чести, а как это случилось, уже не важно.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_04");	//Ну да, ты прав...(улыбается) Что же, спасибо за помощь. Надеюсь, мы еще встретимся!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_05");	//Само собой.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_NATANDOLG = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

