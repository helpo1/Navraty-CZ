
instance DIA_STRF_8122_Addon_Ferd_EXIT(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 999;
	condition = DIA_STRF_8122_Addon_Ferd_exit_condition;
	information = DIA_STRF_8122_Addon_Ferd_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8122_Addon_Ferd_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Addon_Ferd_PreHello(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_PreHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8122_Addon_Ferd_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_PreHello_01_00");	//Ну что еще такое?
};

instance DIA_STRF_8122_Addon_Ferd_AfterHello(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_AfterHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_AfterHello_info;
	permanent = FALSE;
	description = "Привет. Как дела?";
};

func int DIA_STRF_8122_Addon_Ferd_AfterHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_AfterHello_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_00");	//Привет. Как дела?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_01");	//Вот ты нашел что спросить.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_02");	//Хреновые дела! Да и какие еще они тут могут быть?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_03");	//День и ночь только и делаешь, что долбишь эту проклятую жилу.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_04");	//Пройдет еще с десяток лет, а все останется точно также.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_05");	//Ну, если только не брать в расчет то, что можно просто не дожить до этого времени.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_06");	//А я смотрю, ты оптимист!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_07");	//Вот побудешь тут с мое - таким же станешь.
};

instance DIA_STRF_8122_Addon_Ferd_HELLO(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_hello_condition;
	information = DIA_STRF_8122_Addon_Ferd_hello_info;
	permanent = FALSE;
	description = "Наверное, ты уже тут давно?";
};

func int DIA_STRF_8122_Addon_Ferd_hello_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_AfterHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Hello_01_00");	//Наверное, ты уже тут давно?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_01");	//Больше, чем ты можешь себе представить.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Hello_01_02");	//А это примерно сколько?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_03");	//Слушай, приятель...(ворчливо) Если тебе нечем заняться, то лучше поприставай с вопросами к другим парням.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_04");	//А мне надо работать! Иначе орки с меня шкуру спустят.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Addon_Ferd_Escape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Escape_condition;
	information = DIA_STRF_8122_Addon_Ferd_Escape_info;
	permanent = FALSE;
	description = "Что ты знаешь о побеге рабов?";
};

func int DIA_STRF_8122_Addon_Ferd_Escape_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_AfterHello) == TRUE) && (MIS_EscapeMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Escape_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_00");	//Что ты знаешь о побеге рабов?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_01");	//Тише ты! Или хочешь, чтобы нас услышали орки?!
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_02");	//А ты что, боишься?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_03");	//Парень, тут такими вещами не шутят! А то в миг можно попрощаться со своей жизнью.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_04");	//Ну, так ты расскажешь или нет?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_05");	//Белиар тебя бы побрал...(недовольно) Вот же навязался на мою голову!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_06");	//Хорошо, я расскажу тебе все, что знаю. Но за это ты окажешь мне одну небольшую услугу.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_07");	//И о чем идет речь?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_08");	//Для начала достань мне несколько целебных эликсиров. Думаю, что пяти хватит.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_09");	//А то в последний раз долбя жилу, я очень сильно потянул руку.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_10");	//Эта зараза так ноет, а я не могу нормально работать! Еле справляюсь с дневной нормой.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_11");	//Слава богу, что орки пока этого не заметили. А то с такими у них разговор короткий.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_12");	//Для начала?! А будет что-то еще?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_13");	//Сначала принеси эликсиры, а потом мы поговорим обо всем остальном. 
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_14");	//Или тебе уже не интересно узнать про побег?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_15");	//Ладно, успокойся! Попробую раздобыть для тебя парочку-другую.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_16");	//Так-то лучше.
	MIS_FerdPotions = LOG_Running;
	Log_CreateTopic(TOPIC_FerdPotions,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Running);
	B_LogEntry(TOPIC_FerdPotions,"Ферд попросил достать для него несколько целебных эликсиров. Он сильно повредил руку и не хочет, чтобы орки о чем-то догадались.");
};

instance DIA_STRF_8122_Addon_Ferd_Potions(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Potions_condition;
	information = DIA_STRF_8122_Addon_Ferd_Potions_info;
	permanent = FALSE;
	description = "Вот твои эликсиры.";
};

func int DIA_STRF_8122_Addon_Ferd_Potions_condition()
{
	if((MIS_FerdPotions == LOG_Running) && (Npc_HasItems(other,ItPo_Health_03) >= 5))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Potions_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_00");	//Вот твои эликсиры.
	B_GiveInvItems(other,self,ItPo_Health_03,5);
	Npc_RemoveInvItems(self,ItPo_Health_03,4);
	AI_PlayAni(self,"T_SEARCH");
	B_UseItem(self,ItPo_Health_03);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_01");	//Мммм... Боль как рукой сняло! Остальные пригодятся на будущее.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_02");	//Но, как я говорил, это еще не все.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_03");	//Я тебя слушаю.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_04");	//Мне нужно, чтобы ты вернул мне мое кольцо.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_05");	//Что еще за кольцо?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_06");	//Обыкновенное серебрянное кольцо. Ничего особенного.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_07");	//Но есть одно обстоятельство - дело в том, что его мне подарил мой отец.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_08");	//Ага! Фамильная вещица?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_09");	//Что-то вроде того. Все эти годы, проведенные в шахте, оно хранилось у меня.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_10");	//И когда я смотрел на него, то вспоминал свою семью и те времена, когда все было по-другому.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_11");	//Но однажды этот грязный ублюдок Вакур Шак заметил у меня это кольцо и забрал его себе!
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_12");	//Кто такой Вакур Шак?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_13");	//Один из старших надзирателей орков. Жадный до всего, на что положит свой глаз!
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_14");	//Хочешь, чтобы я попробовал договориться с ним насчет твоего кольца?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_15");	//Я не знаю, как ты это сделаешь. Но вижу, что тебе тут позволено спокойно разгуливать даже с оружием.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_16");	//А значит, что он тебя хотя бы выслушает. 
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_17");	//Я посмотрю, что можно сделать.
	RT_Respect = RT_Respect + 1;
	MIS_FerdPotions = LOG_Success;
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Success);
	B_LogEntry(TOPIC_FerdPotions,"Я принес Ферду целебные эликсиры.");
	MIS_FerdRing = LOG_Running;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Running);
	B_LogEntry(TOPIC_FerdRing,"Ферд хочет, чтобы я вернул ему фамильное кольцо, которое отобрал у него Вакур Шак - старший надзиратель рабов.");
};

instance DIA_STRF_8122_Addon_Ferd_Ring(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Ring_condition;
	information = DIA_STRF_8122_Addon_Ferd_Ring_info;
	permanent = FALSE;
	description = "Это твое кольцо?";
};

func int DIA_STRF_8122_Addon_Ferd_Ring_condition()
{
	if((MIS_FerdRing == LOG_Running) && (Npc_HasItems(other,ItRi_Ferd) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Ring_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_00");	//Это твое кольцо?
	B_GiveInvItems(other,self,ItRi_Ferd,1);
	Npc_RemoveInvItems(self,ItRi_Ferd,1);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_01");	//(радостно) Да, это оно! Как тебе удалось его вырвать из рук Вакур Шака?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_02");	//Тебе лучше не знать. Этот орк оказался еще тем торгашом!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_03");	//Ну да ладно. Главное, что оно теперь снова у меня.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_04");	//Благодарю тебя, старина.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_05");	//Только смотри, чтобы его снова у тебя не отобрали.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_06");	//А то в следующий раз сам его будешь возвращать.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_07");	//Само собой.
	RT_Respect = RT_Respect + 1;
	MIS_FerdRing = LOG_Success;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Success);
	B_LogEntry(TOPIC_FerdRing,"Я вернул Ферду его фамильное кольцо.");
};

instance DIA_STRF_8122_Addon_Ferd_EscapeTell(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_EscapeTell_condition;
	information = DIA_STRF_8122_Addon_Ferd_EscapeTell_info;
	permanent = FALSE;
	description = "Как насчет нашего уговора?";
};

func int DIA_STRF_8122_Addon_Ferd_EscapeTell_condition()
{
	if(MIS_FerdRing == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_EscapeTell_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_00");	//Как насчет нашего уговора?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_01");	//Конечно, я сдержу свое слово и расскажу тебе все, что я знаю о побеге рабов.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_02");	//Это случилось пару лет назад...(задумчиво) Один раб по имени Барго задумал бежать отсюда.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_03");	//Он подбил большую часть рудокопов поднять бунт в шахте.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_04");	//А сам тем временем, воспользовавшись всеобщей суматохой, хотел проскользнуть незамеченным мимо охраны.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_05");	//В условленный день рабы подняли мятеж. Они убили пару охранников и всей толпой двинулись к выходу.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_06");	//Но орки оказались хитрее! Они перекрыли все выходы из шахты кроме одного.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_07");	//Поэтому восставшим ничего не оставалось делать, как только идти именно туда.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_08");	//Но в конце этого пути их ждал тупик. А сверху уже поджидал карательный отряд орков-арбалетчиков.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_09");	//Что было дальше, я рассказывать не стану...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_10");	//Могу сказать только одно - в той бойне никто не уцелел!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_11");	//Многие тогда поплатились своей жизнью, доверившись сказкам Барго.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_12");	//А что стало с самим Барго?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_13");	//Ха! Поняв, что его план провалился, эта крыса забилась в самый дальний и темный угол, что только смогла найти.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_14");	//Но орки отыскали его. А потом отрубили ему голову в назидание остальным!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_15");	//Вот так все и закончилось. С тех пор здесь больше никто не помышляет о побеге.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_16");	//Одно только это слово наводит на них ужас...
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_17");	//Да, довольно печальная история.
	B_LogEntry(TOPIC_EscapeMine,"Ферд рассказал мне, что случилось в день побега. С того момента никто больше и не помышляет о побеге.");
};

instance DIA_STRF_8122_Addon_Ferd_NoEscape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_NoEscape_condition;
	information = DIA_STRF_8122_Addon_Ferd_NoEscape_info;
	permanent = FALSE;
	description = "Вам никогда не удастся выбраться из этой шахты.";
};

func int DIA_STRF_8122_Addon_Ferd_NoEscape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_NoEscape_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_00");	//Вам никогда не удастся выбраться из этой шахты.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_01");	//(ехидно) Ты в это и сам не веришь, да?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_02");	//Нет. Просто главный проход из шахты прямиком ведет в город орков.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_03");	//И там вас уже будут поджидать не простые охранники, а элитные воины!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_05");	//Проклятье! Я такое даже и представить не мог.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_06");	//Теперь ты знаешь об этом.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_07");	//Ну, тогда, полагаю, нам всем стоит смирится с нашей участью.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_08");	//По всей видимости, мы навсегда останемся гнить в этой дыре!
};

instance DIA_STRF_8122_Addon_Ferd_Bunt(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Bunt_condition;
	information = DIA_STRF_8122_Addon_Ferd_Bunt_info;
	permanent = FALSE;
	description = "Что заставит вас снова поднять мятеж?";
};

func int DIA_STRF_8122_Addon_Ferd_Bunt_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Bunt_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_00");	//Что заставит вас снова поднять мятеж?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_01");	//Навряд ли такое вообще возможно...(обреченно) Люди слишком сильно напуганы!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_02");	//У них нет ни веры, ни сил, чтобы сражаться, ни доверия к кому-либо.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_03");	//Вам просто нужен сильный лидер.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_04");	//Хммм...(задумчиво) Да, возможно, ты прав! Вот только оглянись вокруг. Кого ты видишь?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_05");	//Тут только простые рудокопы. А долгие годы, проведенные в этой шахте, очень быстро ломают людей.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_06");	//Я слышал, что среди вас есть паладин.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_07");	//(удивленно) Паладин?! Здесь? Ты что, шутишь?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_08");	//Даже и в мыслях не было! Именно поэтому я сейчас тут.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_09");	//Вот те новость...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_10");	//Но знаешь, даже если это и правда, вряд ли он себя как-то здесь проявит.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_11");	//Орки сдерут с него шкуру живьем, если узнают, кто он на самом деле!
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_12");	//А у тебя нет мыслей насчет того, кто бы это мог быть?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_13");	//Откуда, приятель? Я ведь только что сам узнал об этом.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_14");	//А кто может знать?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_15");	//Второй вопрос сложнее первого.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_16");	//Но если бы я начинал свои поиски, то первым делом поговорил бы с Кроу.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_17");	//Он что, какой-то особенный?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_18");	//Нет. Просто он самый умный из нас. Раньше он был то ли магом, то ли алхимиком.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_19");	//Я уже забыл, если честно. Так что, для начала, поговори с ним.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_20");	//Может быть, он что-нибудь тебе и подскажет.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_21");	//Так и сделаю.
	AskKrow = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Ферд удивился, узнав что среди рабов есть паладин. На вопрос кто бы это мог быть, Ферд посоветовал поговорить с неким Кроу.");
};