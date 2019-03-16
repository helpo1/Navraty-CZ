
instance DIA_XARDAS_GOBLIN_EXIT(C_Info)
{
	npc = xardas_goblin;
	nr = 999;
	condition = dia_xardas_goblin_exit_condition;
	information = dia_xardas_goblin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xardas_goblin_exit_condition()
{
	return TRUE;
};

func void dia_xardas_goblin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_HELLO(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_hello_condition;
	information = dia_xardas_goblin_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_goblin_hello_condition()
{
	if(XARDASGOBLINATTACKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_hello_info()
{
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_00");	//(жалобно) Постой, человече, и внемли глаголу несчастного гоблина...
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_01");	//Ого! Говорящий гоблин!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_02");	//Падальщик будто объедки узревший глядишь на меня!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_03");	//Неужто доселе не видел ты гоблинов, речи людской разумеющих?
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_04");	//Нет, не видел. Как у тебя вообще получается говорить? Да еще так странно?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_05");	//Магус один, обладающий силой, знанием меня наградил.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_06");	//(грустно) Но где много знания, много и горя...
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_07");	//Послушай! Помощи просит твоей, человек, бедный гоблин.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_08");	//Я же взамен тебе дам колдовские вещи из сундука, что стоит с нами рядом.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_01_09");	//Так это ТВОЙ сундук? А что мне мешает просто забрать у тебя ключ и его содержимое?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_01_10");	//(воинственно) Хоть ростом я мал, но силой великою в лапках своих обладаю!
	Info_ClearChoices(dia_xardas_goblin_hello);
	Info_AddChoice(dia_xardas_goblin_hello,"Ладно, чем я могу тебе помочь?",dia_xardas_goblin_hello_ok);
	Info_AddChoice(dia_xardas_goblin_hello,"Ах так?! Ну держись.",dia_xardas_goblin_hello_no);
};

func void dia_xardas_goblin_hello_ok()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_01");	//Ха, ну, допустим, и чем же я могу помочь ГОБЛИНУ?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_02");	//Суть моя в том, что не гоблин в своем естестве я. А призрак телесный, бессмертный и вечный в печали своей.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_03");	//Магус давно меня призвал к себе в услужение, долго мы жили с ним в башне, что за спиною твоею.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_05");	//Так ты дух, призванный некромантом Ксардасом?
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_06");	//Тогда тем более чем я могу ТЕБЕ помочь?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_07");	//Больше всего я на свете желаю сгинуть с этого света!
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_08");	//Изгони меня, будто я призрак, грозящий ныне живущим.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_09");	//Что?! И как я это сделаю?
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_10");	//Ксардас хранил кипу свитков специальных, слуг изгонять коли время настанет. Видимо, есть у него эти свитки.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_11");	//Также, наверное, есть в старой башне свиток хотя бы один, это точно.
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_Ok_01_12");	//Ладно, что-нибудь придумаю.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_13");	//Перед уходом хочу тебе дать наставление:
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_14");	//Если пойдешь прямиком к некроманту, не говори то, что встретил меня, ибо к слугам...
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_15");	//...милостив вряд ли окажется магус. 	
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_16");	//Также скажу, коль собрался наведаться в башню - будь осторожен.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_Ok_01_17");	//Там нежить и демоны зла обитают, поднявшись из самого ада.
	MIS_GOBLINAWAY = LOG_Running;
	Log_CreateTopic(TOPIC_GOBLINAWAY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_Running);
	B_LogEntry(TOPIC_GOBLINAWAY,"Недалеко от старой башни Ксардаса я повстречал странное существо - говорящего гоблина! Он оказался призраком, хотя с виду и не скажешь. Гоблин попросил меня о помощи, а взамен обещал дать мне пару ценных вещей из своего сундука. Мне необходимо достать свиток изгнания и с его помощью упокоить душу этого гоблина. Такой свиток можно поискать в старой башне или попросить у самого Ксардаса, который и призвал душу гоблина в этот мир.");
	AI_StopProcessInfos(self);
};

func void dia_xardas_goblin_hello_no()
{
	AI_Output(other,self,"DIA_Xardas_Goblin_Hello_No_01_01");	//Силой?! Да я таких как ты, как шашлык — по три штуки за раз на меч нанизываю.
	AI_Output(self,other,"DIA_Xardas_Goblin_Hello_No_01_02");	//Глупость порою фатальной бывает для жизни!
	XARDASGOBLINHUNT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_BRINGSCROLL(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_bringscroll_condition;
	information = dia_xardas_goblin_bringscroll_info;
	permanent = FALSE;
	description = "Я нашел свиток изгнания.";
};


func int dia_xardas_goblin_bringscroll_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (Npc_HasItems(hero,itwr_xardasgoblinscroll) >= 1))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_bringscroll_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Xardas_Goblin_BringScroll_01_01");	//Я нашел свиток изгнания. Как насчет награды?
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_02");	//Нету предела счастья у бедного гоблина! Ну же, даруй мне свободу.
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_03");	//Слово даю, что как только цепи, что держат мой дух в этом мире...
	AI_Output(self,other,"DIA_Xardas_Goblin_BringScroll_01_04");	//...твой экзорцизм разрушит, ключ к сундуку тебе передам я.
	XARDASGOBLINREADYAWAY = TRUE;
	B_LogEntry(TOPIC_GOBLINAWAY,"Чтобы изгнать душу гоблина-призрака, мне просто нужно использовать свиток.");
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_GOBLIN_WAIT(C_Info)
{
	npc = xardas_goblin;
	nr = 1;
	condition = dia_xardas_goblin_wait_condition;
	information = dia_xardas_goblin_wait_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_xardas_goblin_wait_condition()
{
	if((MIS_GOBLINAWAY == LOG_Running) && (XARDASGOBLINREADYAWAY == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xardas_goblin_wait_info()
{
	AI_Output(self,other,"DIA_Xardas_Goblin_Wait_01_01");	//Что же ты медлишь? Томиться мочи уж нет в этом мире!
	AI_StopProcessInfos(self);
};

//------------------Шакзи-------------------------------------

instance DIA_Gobbo_Desert_EXIT(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 999;
	condition = DIA_Gobbo_Desert_EXIT_condition;
	information = DIA_Gobbo_Desert_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gobbo_Desert_EXIT_condition()
{
	return TRUE;
};

func void DIA_Gobbo_Desert_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_HELLO(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_HELLO_condition;
	information = DIA_Gobbo_Desert_HELLO_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gobbo_Desert_HELLO_condition()
{
	if(GoblinKing == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_HELLO_info()
{
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_00");	//Человек... человек, человек! Шакзи видеть, что он носить Хир Шар.
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_01");	//Ты что, говоришь со мной?!
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_02");	//Глупый человек! Он видеть тут еще люди?...Шакзи говорить с ним! Тот не понимать...смешной человек!
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_03");	//И с каких же пор гоблины стали говорить на человеческом языке?
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_04");	//Тут раньше жить люди... много люди. Теперь никого! Все умирать... давно умирать.
	AI_Output(self,other,"DIA_Gobbo_Desert_HELLO_01_05");	//Шакзи знать немного язык люди. Жить рядом, видеть люди, слушать люди.
	AI_Output(other,self,"DIA_Gobbo_Desert_HELLO_01_06");	//Или мне просто везет на говорящих гоблинов.
};

instance DIA_Gobbo_Desert_WhatNeed(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_WhatNeed_condition;
	information = DIA_Gobbo_Desert_WhatNeed_info;
	permanent = FALSE;
	description = "А с чего ты вдруг решил заговорить со мной?";
};

func int DIA_Gobbo_Desert_WhatNeed_condition()
{
	if((GoblinKing == TRUE) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_HELLO) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_WhatNeed_info()
{
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_00");	//А с чего ты вдруг решил заговорить со мной?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_01");	//Шакзи видеть, что человек быть не простой. Он носить с собой Хир Шар!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_02");	//Что еще за Хир Шар?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_03");	//Глупый человек! Не знать что такое Хир Шар! Сам его одевать и ничего не знать. Смешной человек!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_04");	//Так ты имеешь ввиду эту дубину, висящую у меня за спиной?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_05");	//Человек быть сам дубина! Хир Шар не дубина... Он быть знаком власти для гоблинов. Все братья Шакзи уважать этот тотем!
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_06");	//Но Шакзи совсем не знать, откуда он быть у человек?
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_07");	//Может быть тот его украсть? Или убивать братьев Шакзи и забирать Хир Шар себе?
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_08");	//Нет! Это просто подарок от одного из гоблинов. 
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_09");	//Подарок?!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_10");	//Да, подарок. А что тут удивительного? Я ему помог в одном очень важном деле, а он мне в знак благодарности оставил вот этот ваш...Хир Шар.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_11");	//Большой быть подарок! Очень большой и очень ценный...
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_12");	//Шакзи думать, человек очень сильно помогать тому, кто подарить ему Хир Шар.
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_13");	//Выходит, что этот кусок древесины кое-что для вас значит.
	AI_Output(self,other,"DIA_Gobbo_Desert_WhatNeed_01_14");	//Тот, кто его носить может не бояться гоблинов. Гоблины его не тронуть!
	AI_Output(other,self,"DIA_Gobbo_Desert_WhatNeed_01_15");	//Хммм... Тогда это многое объясняет.
};

instance DIA_Gobbo_Desert_Quest(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_condition;
	information = DIA_Gobbo_Desert_Quest_info;
	permanent = FALSE;
	description = "Что-нибудь еще?";
};

func int DIA_Gobbo_Desert_Quest_condition()
{
	if((GoblinKing == TRUE) && (Npc_KnowsInfo(hero,DIA_Gobbo_Desert_WhatNeed) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_info()
{
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_00");	//Что-нибудь еще?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_01");	//Человек быть прав... Шакзи не просто так заговорить с ним. Он хотеть, чтобы тот ему тоже немного помочь. 
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_02");	//За это, Шакзи давать человек большой и ценный награда! Человеку должна она очень понравится.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_03");	//Ну хорошо, ты меня заинтриговал. И в чем будет заключаться моя помощь?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_04");	//Человек должен помочь отыскать для Шакзи одну вещь - их священный тотем!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_05");	//Священный тотем? Это что еще такое?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_06");	//Быть такой красивый, быть такой блестящий, стоять вон там, на большой камень посреди лагеря.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_07");	//Все братья поклоняться ему каждый день, слушать, что тот говорить им, и приносить ему дары.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_08");	//Но недавно тот изчезать! Никто не знать, как это случиться. Он стоять там, и потом его не стать.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_09");	//Его что, украли?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_10");	//Шакзи не знать... Но он быть уверен, что никто из его братьев не смог бы это сделать.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_11");	//Все они очень уважать и бояться священный тотем, а теперь все братья Шакзи сильно печалиться.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_12");	//Ну, хорошо. А можешь точнее описать, как он выглядел, этот ваш...тотем?
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_13");	//Мммм... Он быть такой красивый, такой как... как золото у людей! Да, именно так! И он блестеть на солнце, очень сильно блестеть. 
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_14");	//И это все?! Да, не так уж и много.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_15");	//Что же получается... Обычно сами гоблины тащут все, что плохо лежит. В особенности, золото. А тут, по всей видимости, вещь стащили у вас самих.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_16");	//Человек зря смеяться... Шакзи сейчас не хотеть шутить. Шакзи должен вернуть тотем на место! Иначе, быть беда для них. Большая беда!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_17");	//Ладно, не переживай! Поищу я его для вас. Только про награду не забудь, которую обещал.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_01_18");	//Шакзи все помнить. Человек может не волноваться. Но Шакзи очень ждать человек, когда тот вернет ему тотем.
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_01_19");	//Не сомневаюсь...
	MIS_GoblinTotem = LOG_Running;
	Log_CreateTopic(TOPIC_GoblinTotem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_Running);
	B_LogEntry(TOPIC_GoblinTotem,"Гоблин Шакзи попросил отыскать меня священный тотем гоблинов, который пропал из их лагеря.");
	AI_StopProcessInfos(self);
};

instance DIA_Gobbo_Desert_Quest_Done(C_Info)
{
	npc = Gobbo_Desert_Leader;
	nr = 1;
	condition = DIA_Gobbo_Desert_Quest_Done_condition;
	information = DIA_Gobbo_Desert_Quest_Done_info;
	permanent = FALSE;
	description = "Это случаем не твой тотем?";
};

func int DIA_Gobbo_Desert_Quest_Done_condition()
{
	if((GoblinKing == TRUE) && (MIS_GoblinTotem == LOG_Running) && (Npc_HasItems(hero,ItMi_TGoblin) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Gobbo_Desert_Quest_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_00");	//Это случаем не твой тотем?
	B_GiveInvItems(other,self,ItMi_TGoblin,1);
	Npc_RemoveInvItems(self,ItMi_TGoblin,1);
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_01");	//Это быть он! Человек найти священный тотем братьев!
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_02");	//Шакзи быть очень рад. Но он не понимать, где человек смог найти его?
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_03");	//Похоже, ваш тотем приглянулся какому-то другому гоблину. Только... не совсем обычному.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_04");	//Не важно! Главное, что тотем снова у Шакзи и братья снова смогут поклоняться ему.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_05");	//Шакзи также видеть, что человек не врать, когда говорил, что помогать гоблинам.
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_06");	//За это он брать этот ключ, который открывать сундук, рядом с Шакзи.
	B_GiveInvItems(self,other,ItKey_GoblinChest,1);
	AI_Output(self,other,"DIA_Gobbo_Desert_Quest_Done_01_07");	//Там он находить свою награда!
	AI_Output(other,self,"DIA_Gobbo_Desert_Quest_Done_01_08");	//Благодарю.
	MIS_GoblinTotem = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GoblinTotem,LOG_SUCCESS);
	B_LogEntry(TOPIC_GoblinTotem,"Я вернул Шакзи его священный тотем. Пхоже, что у всех гоблинов в лагере сегодня будет праздник!");
	AI_StopProcessInfos(self);
};