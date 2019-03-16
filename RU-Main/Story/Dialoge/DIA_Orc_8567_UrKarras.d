instance DIA_Orc_8567_UrKarras_EXIT(C_Info)
{
	npc = Orc_8567_UrKarras;
	nr = 999;
	condition = DIA_Orc_8567_UrKarras_Exit_Condition;
	information = DIA_Orc_8567_UrKarras_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Orc_8567_UrKarras_Exit_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_Hello(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hello_Condition;
	information = DIA_Orc_8567_UrKarras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8567_UrKarras_Hello_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hello_Info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_01");	//Ур-Каррас не верить своим глазам, что человек прийти сюда...(удивленно) Что великий шаман делать в городе орков?!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hello_01_02");	//Скажем так, у меня тут есть некоторые дела.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_03");	//Ур-Каррас не помнить, чтобы нога человек когда-то ступать в наш город. Быть удивлен, что орки пустили тебя сюда!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hello_01_04");	//У меня есть Улу-мулу! Думаю, ты знаешь, что его обладатель пользуется вашим уважением.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_05");	//Быть так. Но Ур-Каррас хотеть предупредить великий шаман, чтобы он не делать в городе ничего плохого.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_06");	//Иначе орки становиться злыми и Улу-мулу не помочь человек!
};

instance DIA_Orc_8567_UrKarras_Town(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Town_Condition;
	information = DIA_Orc_8567_UrKarras_Town_Info;
	permanent = FALSE;
	description = "А чем ты занимаешься в городе?";
};

func int DIA_Orc_8567_UrKarras_Town_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Town_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_01");	//А чем ты занимаешься в городе?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_02");	//Мне казалось, что все орки сейчас должны осаждать крепость паладинов.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_03");	//Человек быть прав, но место Ур-Карраса всегда тут. Так приказывать ему Ур-Тралл!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_04");	//Почему?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_05");	//Ур-Каррас быть военачальник великого вождя и следить, чтобы тут быть порядок.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_06");	//Все воины орков, которых тут видеть человек, подчиняться мне. Ур-Каррас говорить им, что надо делать.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_07");	//Сам Ур-Каррас подчиняться только великому вождю и получать от него новый приказ.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_08");	//Выходит, что ты тут вроде капитана стражи?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_09");	//Ур-Каррас не понимать, что говорить человек.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_10");	//Но думать, что великий шаман теперь немного знать, почему Ур-Каррас быть здесь.
};

instance DIA_Orc_8567_UrKarras_Chief(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Chief_Condition;
	information = DIA_Orc_8567_UrKarras_Chief_Info;
	permanent = FALSE;
	description = "Ур-Тралл ваш вождь?";
};

func int DIA_Orc_8567_UrKarras_Chief_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8567_UrKarras_Town) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Chief_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_01");	//Ур-Тралл ваш вождь?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_02");	//Да, быть великий вождь орков! Быть очень сильный воин и быть очень мудрый.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_03");	//Самый сильный, говоришь?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_04");	//Человек не сомневаться в этом! Все браты уважать и бояться Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_05");	//Сыны духов говорить - сам Белиар даровать ему покровительство.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_06");	//Человек даже не думать идти убивать Ур-Тралл! Человек очень быстро умирать.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_07");	//И в мыслях такого не было!
};

instance DIA_Orc_8567_UrKarras_Clanname(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Clanname_Condition;
	information = DIA_Orc_8567_UrKarras_Clanname_Info;
	important = FALSE;
	permanent = FALSE;
	description = "А как называется ваш клан?";
};

func int DIA_Orc_8567_UrKarras_Clanname_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Clanname_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_01");	//А как называется ваш клан?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Clanname_01_02");	//(гордо) Зваться Черный Дракон. Быть самый сильный клан братов орков в этой земля!

	if(Npc_KnowsInfo(hero,DIA_ORC_8550_URNAZUL_HELLO) == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_03");	//Ясно. И я даже догадываюсь, откуда такое название.
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_04");	//Впечатляет!
	};
};


instance DIA_Orc_8567_UrKarras_WhatInteres(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_WhatInteres_Condition;
	information = DIA_Orc_8567_UrKarras_WhatInteres_Info;
	permanent = FALSE;
	description = "Что интересного можно увидеть в вашем городе?";
};

func int DIA_Orc_8567_UrKarras_WhatInteres_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_WhatInteres_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_WhatInteres_01_01");	//Что интересного можно увидеть в вашем городе?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_02");	//Ур-Каррас думать, что человек не найдет тут для себя ничего интересного.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_03");	//И ему не стоит находиться тут долгое время, иначе орки могут сильно рассердиться на человек!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_WhatInteres_01_04");	//Хочешь сказать, что не стоит тут ждать от вас гостеприимства?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_05");	//Человек правильно понимать.
};

instance DIA_Orc_8567_UrKarras_UrTrall(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_UrTrall_Condition;
	information = DIA_Orc_8567_UrKarras_UrTrall_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Где я могу найти великого вождя?";
};

func int DIA_Orc_8567_UrKarras_UrTrall_Condition()
{
	if(MeetFarrok == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_UrTrall_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_UrTrall_01_01");	//Где я могу найти великого вождя?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_02");	//Чертог великий вождь Ур-Тралл находиться в центре города. Туда вести небольшой подъем от главный вход в город.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_03");	//Но человека не пускать туда, если у него нет никаких важных вестей для Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_04");	//Если великий шаман пробовать войти туда просто так, орки будут гневаться и убивать человек.
};


//---------------------Квесты Ур-Карраса-----------------------------------------------------


instance DIA_Orc_8567_UrKarras_HelpRespect(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_HelpRespect_Condition;
	information = DIA_Orc_8567_UrKarras_HelpRespect_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть к Ур-Траллу?";
};

func int DIA_Orc_8567_UrKarras_HelpRespect_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart == FALSE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_HelpRespect_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_01");	//Ты можешь помочь мне попасть к Ур-Траллу?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_02");	//Хммм... Фаррок не пускать тебя к великий вождь, пока ты не заслужить уважение братов!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_03");	//А как мне это сделать?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_04");	//Человек должен помогать братам или идти сражаться на великий арена орков! Становиться Мор Дар, как Ур-Каррас.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_05");	//А как мне заслужить твое доверие?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_06");	//Ур-Каррас может давать человек несколько поручений. Если тот выполнять их, то браты будут больше уважать человек!
	B_LogEntry(TOPIC_HeroOrcJoin,"У Ур-Карраса есть для меня поручения, выполнив которые я смогу завоевать уважение орков. Или же стоит отправиться на арену орков и добыть уважение орков своим мечом.");
	HeroOrcJoinStart = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTask_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Говори, что я должен сделать.";
};

func int DIA_Orc_8567_UrKarras_FirstTask_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart == TRUE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTask_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_01");	//Говори, что я должен сделать.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_02");	//Хорошо. Человек слушать Ур-Каррас внимательно.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_03");	//Когда человек встретить Ур-Каррас, то спрашивать его, что Ур-Каррас делать в земля людей.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_04");	//Теперь Ур-Каррас отвечать. Его отряд отправиться туда, чтобы достать один очень редкий трофей, который быть нужен Ур-Тралл.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_05");	//Интересно. И какой же трофей?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_06");	//Ур-Каррас должен был достать вождю ядовитый клык Муритана.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_07");	//Муритана?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_08");	//Быть огромный и свирепый дикий зверь. Быть очень редкий и опасный!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_09");	//Так вы там охотились на это чудовище?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_10");	//Человек быть прав. Наши разведчики говорить, что видеть этот большой зверь в Хоринисе.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_11");	//Ур-Каррас брать с собой пять самый лучший охотник нашего клана и отправляться на его поиски.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_12");	//Ночью мы перейти горы и отправиться туда, где орки видеть Муритана в последний раз.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_13");	//И что произошло дальше?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_14");	//Мы хотеть устроить засада...(печально) Но сами становиться добыча!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_15");	//Чудовище напасть на нас внезапно и сразу убить два орка-охотник. 
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_16");	//Только Ур-Каррас остаться в живых из весь отряд, но быть сильно ранен.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_17");	//Если бы не человек, яд Муритан в конце концов убить его тоже!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_18");	//Ур-Каррас очень печалиться, что не смог выполнить приказ вождя... Но может быть, у человек получиться это сделать?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_19");	//Думаешь, я один смогу справиться с тем, с чем не справился целый ваш отряд?!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_20");	//Ур-Каррас хотеть, чтобы человек пробовать это сделать.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_23");	//Ладно, придется убить эту тварь. Где его искать?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_24");	//Ур-Каррас думать, что человек найти Муриатана в лес недалеко от города люди.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_25");	//Где-то там в скала быть большая и глубокая пещера. Там чудовище убить всех братьев Ур-Карраса!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_26");	//Я попробую найти это место.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_27");	//Если у человек получиться убить Муритан, он не забыть принести Ур-Каррас ядовитый клык.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_28");	//Но быть осторожным - его яд может легко убить человек!


	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_29");	//Не волнуйся! Я неплохо разбираюсь в охоте.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_30");	//Тогда Ур-Каррас желать человек доброй охоты и ждать его тут.
	}
	else
	{
		UrKarrasCanTeach = TRUE;
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_32");	//Похоже, сначала мне придется этому научиться.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_33");	//Если человек хотеть - Ур-Каррас показать ему, как правильно забрать клыки чудовища.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_34");	//Хорошо, я подумаю над этим.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_35");	//Тогда Ур-Каррас желать человек доброй охоты и ждать его тут.
	};

	MIS_HeroOrcJoin_T1 = LOG_Running;
	MuritanS1 = TRUE;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T1,"Первое поручение Ур-Карраса оказалось довольно непростым. Мне придется отыскать в Хоринисе опасную тварь - Муритана - и вырвать его ядовитые клыки. Этот трофей хочет заполучить сам верховный вождь Ур-Тралл, поэтому времени на размышления у меня совсем не было. Разведчики орков видели это чудовище неподалеку от города, внизу лощины с огромной пещерой.");
};

instance DIA_Orc_8567_UrKarras_Teeth(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Teeth_Condition;
	information = DIA_Orc_8567_UrKarras_Teeth_Info;
	permanent = FALSE;
	description = "Покажи мне, как выдирать клыки.";
};

func int DIA_Orc_8567_UrKarras_Teeth_Condition()
{
	if((UrKarrasCanTeach == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Teeth_Info()
{
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Теперь я умею:");
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	AI_Print("Изучен навык разделки добычи - 'Вырывать зубы и клыки'");
	B_LogEntry_Quiet(TOPIC_TalentAnimalTrophy,"...вырывать зубы и клыки.");
	Npc_SetTalentSkill(other,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Teeth_01_01");	//Покажи мне, как выдирать клыки.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Teeth_01_02");	//Это быть не очень трудно, человек.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Teeth_01_03");	//Надо поставить нож примерно на середину зуба или клыка, а потом аккуратно выковырнуть его. Тогда он не сломаться.
};

instance DIA_Orc_8567_UrKarras_Hunt(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hunt_Condition;
	information = DIA_Orc_8567_UrKarras_Hunt_Info;
	permanent = FALSE;
	description = "А почему на поиски Муритана послали именно тебя?";
};

func int DIA_Orc_8567_UrKarras_Hunt_Condition()
{
	if(MIS_HeroOrcJoin_T1 != FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hunt_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_01");	//А почему на поиски Муритана послали именно тебя?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_02");	//Таг-Нор тогда не быть в городе братов... Поэтому вождь посылать Ур-Каррас!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_04");	//Кто такой Таг-Нор?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_05");	//Быть тут самый лучший охотник среди орков! Уже много зим охотиться на диких животных, приносить братьям много добычи.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_06");	//А где мне его найти?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_07");	//Таг-Нор обычно быть недалеко от входа в железный шахта орков. Человек искать его там.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_08");	//Только Ур-Каррас хотеть дать совет человек, если тот пойти к нему.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_09");	//Что еще за совет?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_10");	//Таг-Нор просто так не станет говорить с человек. Тот должен получать его уважение.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_11");	//И как мне это сделать?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_12");	//Сначала человек убить Муритана!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_13");	//У Муритана должен быть два ядовитых клыка. Один человек отдавать Ур-Каррасу, а второй нести Таг-Нору!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_14");	//Тогда Таг-Нор станет уважать его и будет говорить с ним.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_15");	//А по-другому как-нибудь нельзя?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_16");	//Еще Таг-Нор очень ценить шкура большой черный тролль! Человек может приносить и ее.
	TagNorTell = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTaskDone_Info;
	permanent = TRUE;
	description = "Я по поводу Муритана...";
};

func int DIA_Orc_8567_UrKarras_FirstTaskDone_Condition()
{
	if(MIS_HeroOrcJoin_T1 == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTaskDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_01");	//Я по поводу Муритана...
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_02");	//Человек есть, что сказать Ур-Каррас?

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_03");	//Мне удалось добыть трофей, который был нужен вождю. 
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_04");	//Вот, можешь забрать его.
		B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
		Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

		if(Trophy_MuritanTooth  == TRUE)
		{
			if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
			{
				Ext_RemoveFromSlot(other,"BIP01 PELVIS");
				Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
				Trophy_MuritanTooth  = FALSE;
			};
		};

		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_05");	//Аргххх!!!...(с уважением) Человек смочь убить Муритана! Быть очень хорошо.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_06");	//Теперь Ур-Каррас видеть, что он не ошибаться, когда посылать человека убить Муритана.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_07");	//За это Ур-Каррас еще больше уважать его, и думать, что другие орки тоже.

		if(SBMODE == TRUE)
		{
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_08");	//А ты не знаешь, зачем вашему вождю понадобился этот клык?
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_09");	//Ур-Тралл не говорить это Ур-Каррасу. Человек может попробовать сам спросить его об этом.
			UrTrallTalkTooth = TRUE;
		};

		T1_OrcTask_Done = TRUE;
		ORCRESPECT = ORCRESPECT + 10;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 10");
		};

		MIS_HeroOrcJoin_T1 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T1,"Я принес Ур-Каррасу клык Муритана. Он был очень доволен и сказал, что это наверняка заставит орков еще больше уважать меня. Полагаю, я на правильном пути...");

	}
	else if(MuritanS3 == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_11");	//У меня для тебя плохие новости.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_12");	//Я выследил и убил Муритана, но не смог забрать его ядовитые клыки.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_13");	//Аргххх... Человек не принести клык Ур-Каррасу?! Это быть очень плохо!
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_14");	//Теперь другие орки не поверить человек, что тот убить чудовище, если у него нет этот клык. 
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_15");	//Браты не будут уважать человек!
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_16");	//И что мне теперь делать?
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_17");	//Ур-Каррас этого не знать. Но думать, что человек должен еще помогать оркам, чтобы те уважать его.
		MIS_HeroOrcJoin_T1 = LOG_FAILED;
		T1_OrcTask_Done = TRUE;
		B_LogEntry_Failed(TOPIC_HeroOrcJoin_T1);
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_19");	//Пока нет.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_20");	//Тогда человек лучше не терять время и идти убивать Муритан!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8567_UrKarras_SecondTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTask_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = "У тебя есть еще задания для меня?";
};

func int DIA_Orc_8567_UrKarras_SecondTask_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (T1_OrcTask_Done == TRUE) && (OrcsClan_CHK_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTask_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_01");	//У тебя есть еще задания для меня?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_02");	//Брат человек хотеть еще раз помочь оркам? Ур-Каррас может дать тому еще одно поручение.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_03");	//Тогда ближе к делу. Что от меня требуется?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_04");	//Человек должен идти в долина, где находиться большая крепость паладинов.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_05");	//Высоко в горах, на севере, быть большой клан орков Высокой Скалы.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_06");	//У Ур-Карраса есть очень важное послание для их вождь. Человек должен передавать его!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_07");	//Это все?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_08");	//Пока быть все. Разве этого мало для человек?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_09");	//Я надеялся на что-то более увлекательное.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_10");	//Ур-Каррас понимать, о чем думать брат человек. Но тот должен знать, что это быть очень важно для орков!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_11");	//Ну ладно, давай сюда это послание.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_12");	//Вот! Человек брать этот свиток и нести его вождю Высокой Скалы.
	B_GiveInvItems(self,other,ItWr_UrKarrasLetter,1);
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_13");	//Потом возвращаться к Ур-Каррасу и говорить, что он ответить.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_14");	//Теперь человек ступать. Ур-Каррас ждать его здесь.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_15");	//Я скоро вернусь.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_16");	//Аргххх...(одобряюще)
	MIS_HeroOrcJoin_T2 = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Ур-Каррас дал мне еще одно поручение. Необходимо отправиться в Долину Рудников и отыскать там вождя клана Высокой Скалы, чтобы передать ему послание Ур-Карраса.");
};

instance DIA_Orc_8567_UrKarras_SecondTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTaskDone_Info;
	permanent = FALSE;
	description = "По поводу твоего поручения...";
};

func int DIA_Orc_8567_UrKarras_SecondTaskDone_Condition()
{
	if((MIS_HeroOrcJoin_T2 == LOG_Running) && ((OrcTraitor == TRUE) || (OrcClanBossLetterDeliver == TRUE) || (OrcFailInvte == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTaskDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_01");	//По поводу твоего поручения...

	if(OrcClanBossLetterDeliver == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_02");	//Ур-Каррас внимательно слушать, что ему говорить человек.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_03");	//Я передал твое послание вождю орков Высокой Скалы.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_04");	//И что ответить вождь?
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_05");	//Он сказал, что его клан согласен на твое предложение. Правда, не уточнил, на какое...
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_06");	//Аргххх...(одобряюще) Ур-Каррас быть очень доволен этой новостью! Брат человек сделать все правильно.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_07");	//Орки еще больше станут уважать его за это!
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_08");	//Теперь Ур-Каррас надо много и долго думать. Брат человек может пока идти.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_09");	//Если он понадобится Ур-Каррасу вновь, тот посылать за ним.
		ORCRESPECT = ORCRESPECT + 15;
		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Уважение среди орков + 15");
		};
		T2_OrcTask_Done = TRUE;
		MIS_HeroOrcJoin_T2 = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я передал ответ вождя Ур-Каррасу. Похоже, он был очень доволен ответом.");
		AI_StopProcessInfos(self);
	};
	if(OrcFailInvte == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_11");	//Ур-Каррас внимательно слушать, что ему говорить человек.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_12");	//Я не смог передать послание вождю клана Высокой Скалы, поскольку он мертв.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_13");	//Аргххх... Это быть очень плохой новость! Ур-Каррас сильно печалиться, что человек не смог выполнить его поручение. 
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_14");	//И как нам теперь быть?
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_15");	//Теперь Ур-Каррас должен много думать, а брат человек может пока идти.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_16");	//Если он понадобится Ур-Каррасу вновь, тот посылать за ним.
		MIS_HeroOrcJoin_T2 = LOG_Success;
		T2_OrcTask_Done = TRUE;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2,"Я сообщил Ур-Каррасу, что не смог доставить его послание вождю клана Высокой Скалы. Похоже, эта новость его сильно огорчила.");
		AI_StopProcessInfos(self);
	};
	if(OrcTraitor == TRUE)
	{
		if(UrKarrasGonezIsDead == TRUE)
		{
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_18");	//Ур-Каррас внимательно слушать, что ему говорить человек.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_19");	//Я не смог передать послание вождю клана Высокой Скалы.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_20");	//Аргххх... Это быть очень плохо! Ур-Каррас сильно печалиться, что человек не смог выполнить его поручение. 
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_21");	//Но что помешало тому сделать это?
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_22");	//Эммм... Я его случайно потерял.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_23");	//Но ты можешь дать мне еще одно письмо, и на этот раз я обещаю его терять!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_24");	//Нет...(грозно) Ур-Каррас не может больше так рисковать.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_25");	//Теперь ему надо много и долго думать, а человек может пока идти.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_26");	//Если он понадобится Ур-Каррасу вновь, тот посылать за ним.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_27");	//Тогда я, пожалуй, пойду.
			MIS_HeroOrcJoin_T2 = LOG_Success;
			T2_OrcTask_Done = TRUE;
			Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
			B_LogEntry(TOPIC_HeroOrcJoin_T2,"Черт! Ур-Каррасу все-таки стало известно, что я был в крепости паладинов и говорил с ними. Он обвинил меня в измене, и теперь мне лучше не попадаться ему снова на глаза.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_28");	//Ты зря сюда прийти, человек...(грозно) Ур-Каррас уже все знать!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_29");	//Мои разведчики сказать, ты быть в крепости паладинов, вместо того чтобы говорить с вождь Высокой Скалы.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_30");	//Он думать, человек предать Ур-Карраса и его братов!
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_31");	//Хех... А ты и впрямь подумал, что я стану помогать вам, мерзким тварям?
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_32");	//Аргххх...(злобно) Человек еще пожалеть, что предать нас!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_33");	//Сейчас Ур-Каррас не приказывать своим братьям, чтобы те убивать человек.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_34");	//Он помнить, что тот сделать для него. Но теперь человек больше не быть ему брат!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_35");	//Если Ур-Каррас еще раз увидеть человек в город, тот умирать!
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_36");	//(саркастически) Ты так великодушен, орк.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_36");	//Аргххх...(злобно)
			MIS_HeroOrcJoin_T2 = LOG_Failed;
			B_LogEntry_Failed(TOPIC_HeroOrcJoin_T2);
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Orc_8567_UrKarras_PaladinGoods(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Info;
	permanent = FALSE;
	description = "Еще будут для меня поручения?";
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Condition()
{
	if((T2_OrcTask_Done == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_01_01");	//Еще будут для меня поручения?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_01_02");	//Ур-Каррас думать, что нет... Если только человек не хотеть помочь братам воевать против людей.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_01_03");	//И что же ты задумал?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_01_04");	//Человек должен отправляться в крепость паладинов. Там искать их склад с продовольствием и уничтожать его!
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinGoods);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods,"Нет, на такое я ни за что не пойду.",DIA_Orc_8567_UrKarras_PaladinGoods_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods,"Я сделаю это.",DIA_Orc_8567_UrKarras_PaladinGoods_Yes);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Yes()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_01");	//Хорошо, я сделаю это.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_02");	//(удивленно) Я немного удивляться, что человек согласиться на такое.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_03");	//Братам очень сильно помогать, если паладины остаться без еда.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_04");	//Раз мы не мочь одолеть их извне, то нужно пробовать изнутри!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_05");	//Может, тогда они убивать друг друга от голод.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_06");	//Но человек быть осторожный. Чтобы паладины не догадаться!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_07");	//Ур-Каррас думать, они доверять человек. Быть хорошо!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_08");	//Я все понял, Ур-Каррас. Отправляюсь немедленно.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_09");	//Ур-Каррас желать удача человек!
	MIS_PaladinGoods = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinGoods,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_Running);
	B_LogEntry(TOPIC_PaladinGoods,"Похоже, ситуация в Долине Рудников начинает накаляться. Ур-Каррас жаждет сломить сопротивление паладинов в крепости, но поскольку все предыдущие попытки штурмовать замок потерпели неудачу, он решил действовать иначе. Поэтому моим следующим заданием стало уничтожение продовольственных запасов паладинов. Ур-Каррас не сомневается, что голод должен подорвать силы защитников. Думаю, лучше всего с этим справится огонь...");
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_No()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_01");	//Нет, на такое я ни за что не пойду!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_02");	//Ур-Каррас понимать, почему человек отказаться! Тот не хотеть предавать свой люди.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_03");	//Ур-Каррас не быть злой на это. Все равно уважать человек.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinGoods_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info;
	permanent = FALSE;
	description = "В крепости паладинов скоро начнется голод.";
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition()
{
	if((MIS_PaladinGoods == LOG_Running) && (PaladinGoodsBurned == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_01");	//В крепости паладинов скоро начнется голод.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_02");	//(довольно) НИКАР ХТАГ. Очень хорошо!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_03");	//Скоро они становиться слабыми, и тогда мы захватить их замок!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_04");	//На твоем месте я не был бы столь самонадеянным, Ур-Каррас.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_05");	//Вера паладинов все еще слишком сильна, чтобы обычный голод смог ее надломить.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_06");	//К тому же магия, дарованная им Инносом, до сих пор с ними.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_07");	//Да, человек быть прав. Но это не менять планы орков захватить эту крепость любой ценой!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_08");	//Ур-Каррас благодарить человек за то, что тот выполнить его просьбу.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 20");
	};

	MIS_PaladinGoods = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinGoods,"Я доложил Ур-Каррасу, что склады продовольствия паладинов в крепости уничтожены. Он был доволен этим сообщением.");
};

instance DIA_Orc_8567_UrKarras_PaladinCamp(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Тебе еще требуется моя помощь?";
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Condition()
{
	if((MIS_PaladinGoods == LOG_Success) && (PaladinCampCostDestroyed == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_01");	//Тебе еще требуется моя помощь?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_02");	//Ур-Каррас думать, что так... Но это быть мое последнее поручение.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_03");	//Если человек выполнить его, то окончательно заслужить уважение орков.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_04");	//Тогда выкладывай, в чем оно заключается?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_05");	//Разведчики Ур-Каррас говорить, что те видеть небольшой отряд паладинов недалеко от побережье.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_06");	//Ур-Каррас не знать, как те оказаться там и их планы. Но им нельзя позволять пробиваться обратно в замок! 
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_07");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_08");	//(вкрадчиво) Человек еще не догадаться? Хотеть, чтобы человек находить тот отряд и всех убивать.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_09");	//Ур-Каррас все сказать. Остальное решать только тебе!
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp,"Нет, это уже слишком.",DIA_Orc_8567_UrKarras_PaladinCamp_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp,"Я разберусь с ними!",DIA_Orc_8567_UrKarras_PaladinCamp_Yes);
};


func void DIA_Orc_8567_UrKarras_PaladinCamp_No()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_No_01_01");	//Нет, это уже слишком.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_No_01_02");	//Хорошо! Тогда у Ур-Карраса больше нет поручений для человек.
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Yes()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_01");	//Я разберусь с ними!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_02");	//Добрый путь, человек!
	MIS_PaladinCamp = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_Running);
	B_LogEntry(TOPIC_PaladinCamp,"Ур-Каррас дал мне последнее задание. Необходимо найти и уничтожить отряд паладинов, расположившийся недалеко от побережья. Надеюсь, меня потом не будет мучать совесть...");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinCamp_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Отряд паладинов уничтожен!";
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition()
{
	if((MIS_PaladinCamp == LOG_Running) && (ALBERTISDEAD == TRUE) && (PAL_7518_ISDEAD == TRUE) && (PAL_7519_ISDEAD == TRUE) && (PAL_7520_ISDEAD == TRUE) && (PAL_7521_ISDEAD == TRUE) && (PAL_7522_ISDEAD == TRUE) && (PAL_7524_ISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_01");	//Отряд паладинов уничтожен, как ты и хотел.
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_02");	//И тем самым ты доказать, что достоин нашего уважения!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_03");	//Ур-Каррас преклоняться перед великий воин, каким являться человек.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_04");	//Я крайне польщен.
	ORCRESPECT = ORCRESPECT + 25;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 25");
	};

	MIS_PaladinCamp = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinCamp,"Я прибыл к Ур-Каррасу с новостью о том, что отряд паладинов уничтожен. Военачальник орков был очень мною доволен.");
	AI_StopProcessInfos(self);
};