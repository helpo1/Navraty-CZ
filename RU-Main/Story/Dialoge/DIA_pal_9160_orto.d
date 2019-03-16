
instance DIA_PAL_9160_ORTO_EXIT(C_Info)
{
	npc = pal_9160_orto;
	nr = 999;
	condition = dia_pal_9160_orto_exit_condition;
	information = dia_pal_9160_orto_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9160_orto_exit_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9160_ORTO_MATTER(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_matter_condition;
	information = dia_pal_9160_orto_matter_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9160_orto_matter_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_matter_info()
{
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_00");	//Эй, парень! Ты откуда такой взялся?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_01");	//Я прошел через горный проход. А что, тебя это удивляет?

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_02");	//Конечно! Тут не так часто можно встретить новое лицо - особенно, наемника...(с презрением)
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_03");	//Конечно! Тут не так часто можно встретить новое лицо - особенно, некроманта.
	};

	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_04");	//Интересно, что за дело привело в форт паладинов такого человека, как ты?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_05");	//А мне обязательно отвечать на твои вопросы, или можно просто зайти в форт?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_06");	//Хммм...(с усмешкой) да нет, можешь и не отвечать, если тебе так хочется.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_08");	//Ладно, проходи - только постарайся особо не доставать наших парней!
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_09");	//Они и так последнее время все на нервах.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Matter_01_10");	//Так что сам понимаешь - лишние проблемы нам здесь не нужны.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Matter_01_11");	//Я постараюсь.
};


instance DIA_PAL_9160_ORTO_WHO(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_who_condition;
	information = dia_pal_9160_orto_who_info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int dia_pal_9160_orto_who_condition()
{
	return TRUE;
};

func void dia_pal_9160_orto_who_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_01");	//Мое имя Орто. Я паладин короля и покорный слуга Инноса.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_02");	//А чем ты тут занимаешься?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_03");	//Ха. Странный вопрос - а чем, по-твоему, может заниматься паладин короля?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_04");	//Понятия не имею. Может, скажешь?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_05");	//Единственный удел паладина - это битвы во славу Инноса и короля. Этим мы живем и дышим!
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_06");	//Но мне кажется, что здесь сейчас не с кем сражаться.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_07");	//К сожалению, ты прав. И это сильно меня огорчает. Да и не только меня.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_08");	//Вся эта безмятежность и присущая ей скука - наихудшее, что вообще может быть.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_10");	//Ну раз так - почему же вы тогда торчите в этом форте, а не отправитесь, например, в Долину Рудников?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Who_01_11");	//Насколько мне известно, там скучать вам точно не придется.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_12");	//С радостью! Но пока лорд Варус не отдаст нам такой приказ - мы не сможем покинуть этот форт.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Who_01_13");	//Так что приходится пока сидеть здесь без дела.
};

instance DIA_Pal_9160_Orto_Map(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = DIA_Pal_9160_Orto_Map_condition;
	information = DIA_Pal_9160_Orto_Map_info;
	permanent = FALSE;
	description = "И еще ты штурман 'Эсмеральды'?";
};

func int DIA_Pal_9160_Orto_Map_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9160_orto_who) == TRUE) && (GotoFortMap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9160_Orto_Map_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_00");	//И еще ты штурман 'Эсмеральды'?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_01");	//Да, это так. (удивленно) Хотя я не понимаю, откуда тебе это стало известно?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_02");	//Мне сказал об этом сам лорд Хаген.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_03");	//Ну, тогда понятно! А с чего ты вдруг заговорил об этом?
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_04");	//Мне нужна карта, на которой указан путь от этого острова до материка.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_05");	//Ведь она у тебя есть?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_06");	//Естественно. Любой штурман без точной карты в море как без рук.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Map_01_07");	//Однако с собой ее у меня нет. Она осталась на корабле.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Map_01_08");	//Ну вот, знал бы я об этом раньше!
	SeaMapIns = TRUE;
	B_LogEntry(Topic_SylvioCrew,"Я только зря промотался в форт паладинов. Орто оставил свою карту на корабле! Придется теперь его хорошенько обыскать...");
};

instance DIA_PAL_9160_ORTO_FORT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_FORT_condition;
	information = dia_pal_9160_orto_FORT_info;
	permanent = FALSE;
	description = "Расскажи мне о форте.";
};

func int dia_pal_9160_orto_FORT_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_FORT_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_FORT_01_00");		//Расскажи мне о форте.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_01");		//Он был основан еще при короле Робаре I для прикрытия южных рубежей Хориниса.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_02");		//До войны с орками здесь в основном жили рыцари и паладины.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_03");		//Но после того, как над Долиной Рудников был возведен магический купол, почти весь гарнизон был отправлен обратно в Миртану.
	AI_Output(self,other,"DIA_Pal_9160_Orto_FORT_01_04");		//А тут остался лишь небольшой отряд королевских гвардейцев и местное ополчение.
};

instance DIA_PAL_9160_ORTO_HOWWAY(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_HOWWAY_condition;
	information = dia_pal_9160_orto_HOWWAY_info;
	permanent = FALSE;
	description = "Как вы попали сюда?!";
};

func int dia_pal_9160_orto_HOWWAY_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_HOWWAY_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_00");	//Как вы попали сюда?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_01");	//Большую часть из нас перевезли сюда морем, на корабле! Остальные же остались в Хоринисе.
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_02");	//А почему вы просто не прошли по суше?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_03");	//Путь морем намного короче! К тому же вход в форт располагается рядом с фермой Онара и поддерживающими его наемниками.
	AI_Output(other,self,"DIA_Pal_9160_Orto_HOWWAY_01_04");	//Вы что, испугались этих людей?
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_05");	//Нет, конечно. Паладинов короля вряд ли можно испугать обычными наемниками!
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_06");	//Но сейчас мне кажется довольно нецелесообразно вступать с ними в открытый конфликт.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HOWWAY_01_07");	//К тому же пока не прояснилась ситуация в Долине Рудников, лорд Варус вряд ли отдаст приказ о начале атаки.
};

instance DIA_PAL_9160_ORTO_VARUS(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_varus_condition;
	information = dia_pal_9160_orto_varus_info;
	permanent = FALSE;
	description = "Лорд Варус?";
};


func int dia_pal_9160_orto_varus_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_varus_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_00");	//Лорд Варус?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_01");	//Ну да. Он командир нашего гарнизона - суровый человек, я тебе скажу.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_03");	//А где я могу встретиться с ним?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_04");	//Дом, что в центре форта. Там, на втором этаже ты найдешь его.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_05");	//Вот только не думаю, что Гланц пропустит тебя.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Varus_01_06");	//А кто такой Гланц?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_07");	//Охранник, что стоит на входе.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Varus_01_08");	//Поэтому если у тебя нет серьезных причин для встречи с лордом Варусом - можешь даже и не пробовать.
};


instance DIA_PAL_9160_ORTO_HOW(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_how_condition;
	information = dia_pal_9160_orto_how_info;
	permanent = TRUE;
	description = "Как жизнь?";
};


func int dia_pal_9160_orto_how_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_how_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_How_01_00");	//Как жизнь?
	if(VARUSAGREEDHUNTDONE == FALSE)
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_01");	//(печально) Спросил бы что-нибудь повеселее этого.
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_02");	//Все так же, без изменений.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_03");	//Все просто отлично, приятель!
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_04");	//Никогда не думал, что охота - такое интересное занятие.
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_05");	//И это куда веселее, чем просто сидеть и изнывать от скуки.
		AI_Output(self,other,"DIA_Pal_9160_Orto_How_01_06");	//Так что спасибо тебе, что помог уговорить Варуса! Теперь мы все твои должники...(смеется)
	};
};


instance DIA_PAL_9160_ORTO_HUNT(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_hunt_condition;
	information = dia_pal_9160_orto_hunt_info;
	permanent = FALSE;
	description = "Ну, попробуй найти себе какое-нибудь занятие.";
};


func int dia_pal_9160_orto_hunt_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9160_orto_who))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_hunt_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_00");	//Ну, попробуй найти себе какое-нибудь занятие.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_02");	//Парень, о чем ты? В этом форте вообще нечем заняться!
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_03");	//Хотя правда, есть у меня тут одна идейка...
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_04");	//Какая?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_05");	//(оживленно) Ну, мы с несколькими парнями подумываем отправиться поохотиться вглубь острова.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_06");	//Говорят, там водятся опасные твари - как раз то, что нам и надо.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_07");	//А в чем тогда проблема?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_08");	//Эх...(печально) Дело в том, что лорд Варус навряд ли нам это разрешит сделать.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_09");	//Откуда ты знаешь? Ты уже говорил с ним на эту тему?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_10");	//Ты что, смеешься? (нервно) Нет, парень - этого я делать точно не буду.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_12");	//Ты просто не знаешь Варуса! Знал бы - не задавал подобных вопросов.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_01_14");	//Тогда, может быть, я смогу помочь?
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_15");	//Ты? Хммм...(задумчиво) а что, это хорошая идея!
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_16");	//Тебе действительно ничего не стоит обратиться к нему с такой просьбой. Ты ничем не рискуешь.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_01_17");	//Скажи, а ты вправду решил это сделать?
	Info_ClearChoices(dia_pal_9160_orto_hunt);
	Info_AddChoice(dia_pal_9160_orto_hunt,"Да нет, я просто пошутил.",dia_pal_9160_orto_hunt_no);
	Info_AddChoice(dia_pal_9160_orto_hunt,"Да, я поговорю с Варусом.",dia_pal_9160_orto_hunt_ok);
};

func void dia_pal_9160_orto_hunt_ok()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_Ok_01_00");	//Да, я поговорю с Варусом.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_Ok_01_01");	//Спасибо тебе, дружище! Ты просто спасешь всех нас.
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_Ok_01_05");	//Я сделаю все, что смогу.
	MIS_ORTOHUNT = LOG_Running;
	Log_CreateTopic(TOPIC_ORTOHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_Running);
	B_LogEntry(TOPIC_ORTOHUNT,"Паладин Орто попросил меня поговорить с лордом Варусом, чтобы тот разрешил нескольким паладинам отправиться на охоту вглубь острова. Посмотрим, что на это скажет сам Варус.");
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};

func void dia_pal_9160_orto_hunt_no()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_Hunt_No_01_00");	//Да нет, я просто пошутил.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_01");	//Ну и шуточки у тебя. (раздраженно) Хотя ладно.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_02");	//В конце концов - ты действительно не обязан ничего для нас делать.
	AI_Output(self,other,"DIA_Pal_9160_Orto_Hunt_No_01_03");	//Так что давай просто забудем об этом разговоре.
	Info_ClearChoices(dia_pal_9160_orto_hunt);
};


instance DIA_PAL_9160_ORTO_HUNTDONE(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_huntdone_condition;
	information = dia_pal_9160_orto_huntdone_info;
	permanent = FALSE;
	description = "Лорд Варус не возражает против вашей затеи.";
};


func int dia_pal_9160_orto_huntdone_condition()
{
	if((MIS_ORTOHUNT == LOG_Running) && (VARUSAGREEDHUNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_huntdone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_01_01");	//Лорд Варус не возражает против вашей затеи.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_02");	//Ты это серьезно?
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_01_03");	//Абсолютно! Так что можешь брать с собой людей и отправляться на охоту.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_04");	//Ох, спасибо, парень! Я даже и не знаю, как тебя отблагодарить.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_05");	//Хотя, нет - думаю, знаю...(смеется)
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_06");	//Я расскажу тебе, как правильнее использовать свою силу в бою.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_01_07");	//Думаю, тебе это наверняка пригодится!
	MIS_ORTOHUNT = LOG_SUCCESS;
	VARUSAGREEDHUNTDONE = TRUE;
	Log_SetTopicStatus(TOPIC_ORTOHUNT,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORTOHUNT,"Орто был благодарен мне за то, что я смог уговорить Варуса. За эту услугу он показал мне один из своих боевых приемов, который увеличит силу моего удара.");
	Info_ClearChoices(dia_pal_9160_orto_huntdone);
	Info_AddChoice(dia_pal_9160_orto_huntdone,"С удовольствием тебя выслушаю!",dia_pal_9160_orto_huntdone_teach);
};

func void dia_pal_9160_orto_huntdone_teach()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_Teach_01_00");	//У меня как раз есть свободная минутка!
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_01");	//Тогда запоминай, это довольно просто - когда на тебя кто-нибудь нападает, постарайся использовать инерцию своего врага.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_02");	//Особенно это касается парирования ударов. Заставь своего противника действовать так, как тебе это нужно.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_03");	//Сделай это - и ты всегда будешь иметь приимущество в бою! Запомнил?
	AI_Output(other,self,"DIA_Pal_9160_Orto_HuntDone_Teach_01_04");	//Да - спасибо за совет.
	AI_Output(self,other,"DIA_Pal_9160_Orto_HuntDone_Teach_01_05");	//Тебе спасибо! (смеется) Ну а теперь - охотиться!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pal_9160_orto,"Hunt");
	Npc_ExchangeRoutine(pal_9139_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9140_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9141_ritter,"Hunt");
	Npc_ExchangeRoutine(pal_9142_ritter,"Hunt");
};


instance DIA_PAL_9160_ORTO_RAYNEHELP(C_Info)
{
	npc = pal_9160_orto;
	nr = 1;
	condition = dia_pal_9160_orto_raynehelp_condition;
	information = dia_pal_9160_orto_raynehelp_info;
	permanent = FALSE;
	description = "Ты мог бы помочь Рэйну на складе?";
};


func int dia_pal_9160_orto_raynehelp_condition()
{
	if(MIS_RAYNEHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9160_orto_raynehelp_info()
{
	AI_Output(other,self,"DIA_Pal_9160_Orto_RayneHelp_01_00");	//Ты мог бы помочь Рэйну на складе?
	AI_Output(self,other,"DIA_Pal_9160_Orto_RayneHelp_01_01");	//Что? (смеется) Не уж - у меня есть занятие поинтереснее, чем целый день торчать на складе!
	AI_Output(self,other,"DIA_Pal_9160_Orto_RayneHelp_01_02");	//Так что извини - ничем помочь не могу.
	AI_Output(other,self,"DIA_Pal_9160_Orto_RayneHelp_01_03");	//Я так и думал.
	HELPCOUNTRAYNE = HELPCOUNTRAYNE + 1;
	if((HELPCOUNTRAYNE > 10) && (MAYTALKVARUSRAYNE == FALSE) && (MIS_RAYNEHELP == LOG_Running))
	{
		MAYTALKVARUSRAYNE = TRUE;
		B_LogEntry(TOPIC_RAYNEHELP,"Кажется, я попусту трачу время - никто из паладинов не хочет помогать Рэйну. Может, мне стоит предпринять более кардинальные действия?");
	};
};


instance DIA_PAL_9160_ORTO_PICKPOCKET(C_Info)
{
	npc = pal_9160_orto;
	nr = 900;
	condition = dia_pal_9160_orto_pickpocket_condition;
	information = dia_pal_9160_orto_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9160_orto_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9160_orto_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,Dialog_Back,dia_pal_9160_orto_pickpocket_back);
	Info_AddChoice(dia_pal_9160_orto_pickpocket,DIALOG_PICKPOCKET,dia_pal_9160_orto_pickpocket_doit);
};

func void dia_pal_9160_orto_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

func void dia_pal_9160_orto_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9160_orto_pickpocket);
};

