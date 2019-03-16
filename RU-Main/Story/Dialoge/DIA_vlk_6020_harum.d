
instance DIA_HARUM_EXIT(C_Info)
{
	npc = vlk_6020_harum;
	nr = 999;
	condition = dia_harum_exit_condition;
	information = dia_harum_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harum_exit_condition()
{
	return TRUE;
};

func void dia_harum_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARUM_HELLO(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_condition;
	information = dia_harum_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты Эльваис?";
};


func int dia_harum_hello_condition()
{
	if((MEETHARUM == FALSE) && (KNOWABELV == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_01_00");	//Ты Эльваис?
	AI_Output(self,other,"DIA_Harum_Hello_01_01");	//Да, мое имя Эльваис.
	AI_Output(self,other,"DIA_Harum_Hello_01_03");	//А ты, видимо, тот странник судьбы, который забрел в наши края. Дюго мне уже рассказал о тебе.
	AI_Output(self,other,"DIA_Harum_Hello_01_04");	//Все только и говорят о твоем появлении. Для многих оно стало лучиком света в кромешной тьме.
	AI_Output(self,other,"DIA_Harum_Hello_01_13");	//К тому же могу тебе сказать, что даже ждал твоего появления. И кто знает...
	AI_Output(self,other,"DIA_Harum_Hello_01_14");	//...возмжно, именно о тебе говорится в древних фолиантах Хумгата.
	AI_Output(other,self,"DIA_Harum_Hello_01_15");	//Фолианты Хумгата?
	AI_Output(self,other,"DIA_Harum_Hello_01_16");	//Позволь мне рассказть тебе об этом.
	AI_Output(self,other,"DIA_Harum_Hello_01_18");	//Когда-то давно это место не было похоже на то, что ты сейчас видишь вокруг.
	AI_Output(self,other,"DIA_Harum_Hello_01_20");	//Тогда это место было известно как Калимдор - священные Чертоги Хумгата.
	AI_Output(self,other,"DIA_Harum_Hello_01_21");	//Мы не очень много знаем о тех прекрасных временах и о людях, которые жили здесь.
	AI_Output(self,other,"DIA_Harum_Hello_01_22");	//Но кое-какая информация все-таки сохранилась и до нашего времени.
	AI_Output(self,other,"DIA_Harum_Hello_01_23");	//В основном, это небольшие отрывки хроники тех времен, когда в долину вторгнулось страшное зло, навсегда изменившее ее облик.
	AI_Output(self,other,"DIA_Harum_Hello_01_26");	//В одном из древних манускриптов Калимдора упоминалась легенда.
	AI_Output(other,self,"DIA_Harum_Hello_01_28");	//И что это за легенда?
	AI_Output(self,other,"DIA_Harum_Hello_01_29");	//Легенда об одном мощном древнем артефакте, чье появление в этом мире могло повергнуть его в вечный хаос.
	AI_Output(self,other,"DIA_Harum_Hello_01_30");	//Этот артефакт, судя по записям, носил имя Око Гнева.
	AI_Output(self,other,"DIA_Harum_Hello_01_31");	//В легенде говорилось, что если пробудить это Око, вместе с ним проснется и некое великое зло.
	AI_Output(self,other,"DIA_Harum_Hello_01_32");	//(цитирует) ...и накроет эту землю Великая Тень покровом тьмы, и навсегда воцарится царство зла в Чертогах Хумагата...
	AI_Output(self,other,"DIA_Harum_Hello_01_33");	//Возможно, именно пробудив каким-то непонятным образом это Око Гнева, люди Калимдора навлекли на себя все эти несчастья.
	AI_Output(other,self,"DIA_Harum_Hello_01_34");	//И что же случилось с Калимдором?
	AI_Output(self,other,"DIA_Harum_Hello_01_35");	//Судя по записям в книгах, как неостанавливаемый ураган, пронеслись по этой земле несметные орды нечисти и орков...
	AI_Output(self,other,"DIA_Harum_Hello_01_36");	//...превращая все на своем пути в золу и пепел, сея вокруг смерть и хаос. И не было им числа... Немногим тогда удалось спасти свои жизни.
	AI_Output(self,other,"DIA_Harum_Hello_01_38");	//Возращаясь к легенде, есть еще одна интересная вещь.
	AI_Output(self,other,"DIA_Harum_Hello_01_40");	//Так вот. Помимо всего прочего, в легенде также упоминается некий воин, способный положить конец правлению тьмы.
	AI_Output(self,other,"DIA_Harum_Hello_01_41");	//(цитирует) ...и на переломе времен, когда последняя надежда на спасение будет утрачена...
	AI_Output(self,other,"DIA_Harum_Hello_01_42");	//...обретет род человеческий воина-защитника, и выступит он против Тьмы...
	AI_Output(self,other,"DIA_Harum_Hello_01_43");	//...и поведет он оставшихся в живых на бой со злом и уничтожит Великую Тень...
	AI_Output(self,other,"DIA_Harum_Hello_01_44");	//...будет ему имя - Вершиитель Судьбы.
	AI_Output(self,other,"DIA_Harum_Hello_01_45");	//Это, конечно, не означает, что ты именно тот, о ком говорится в этой легенде.
	AI_Output(other,self,"DIA_Harum_Hello_01_47");	//Возможно, ты прав, Эльваис.
	AI_Output(self,other,"DIA_Harum_Hello_01_48");	//Почему ты так считаешь?
	AI_Output(other,self,"DIA_Harum_Hello_01_49");	//Та цель, которая привела меня сюда, заключается в том, чтобы уничтожить одно из порождений зла.
	AI_Output(other,self,"DIA_Harum_Hello_01_50");	//Я слышал, что в этой долине обитает один очень могущественный черный дракон. Тебе ничего не говорит имя Азгалор?
	AI_Output(self,other,"DIA_Harum_Hello_01_51");	//(в ужасе) Азгалор?! Предания об этом создании уходят далеко в прошлое, к временам зари человечества.
	AI_Output(self,other,"DIA_Harum_Hello_01_52");	//В книгах Калимдора говорилось, что это было чудовище, которое изрыгнула сама преисподняя.
	AI_Output(self,other,"DIA_Harum_Hello_01_53");	//Но никто и никогда не видел его здесь. Хотя, возможно, потому, что просто никто не пережил встречу с ним.
	AI_Output(self,other,"DIA_Harum_Hello_01_54");	//А может, это всего лишь миф... точно я не могу сказать тебе.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Эльваис рассказал мне легенду об одном могущественном артефакте, именуемом Око Гнева. Судя по всему, этот артефакт как-то связан с событиями, произошедшими в долине несколько тысячелетий назад.");
	};
	MEETHARUM = TRUE;
};


instance DIA_HARUM_HELLO_TWO(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_two_condition;
	information = dia_harum_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Думаю, черный дракон не миф.";
};


func int dia_harum_hello_two_condition()
{
	if((MEETHARUM == TRUE) && (MEETHARUMONE == FALSE) && (MIS_URNAZULRAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_harum_hello_two_info()
{
	var C_Item heroweapon;
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_01");	//Судя по всему, этот черный драгон Азгалор не совсем уж и миф.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_02");	//(удивленно) Откуда тебе это известно?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_03");	//Я встретился с тем, кто, судя по всему, был свидетелем тех зловещих событий.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_04");	//Но как такое возможно? Прошло не одно тысячелетие с тех пор, как миновали эти темные времена!
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_05");	//И кто же это?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_06");	//Орки!
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_07");	//(с ужасом) Орки? Но их уже давно не видели в этой долине!
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_08");	//И насколько я знаю, орки не слишком дружелюбные создания! Они не стали бы разговаривать с человеком.
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Harum_Hello_Two_01_10");	//Видишь этот странный предмет в моих руках?
			AI_Output(other,self,"DIA_Harum_Hello_Two_01_11");	//Для орков этот талисман означает знак силы и дружбы. Они уважают его владельца и не смеют на него нападать.
			AI_RemoveWeapon(other);
		};
	};
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_12");	//Тот телепорт, через который я попал сюда, ведет напрямик в подземный город орков.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_13");	//Да, Дюго мне сообщил эту печальную новость.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_14");	//Там я и встретил одного орка, который рассказал мне, что произошло тогда в Калимдоре.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_22");	//Именно Азгалор призвал в этот мир одного могущественного демона - Кузнеца Душ.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_23");	//Под демоническим влиянием этого существа орки обезумили!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_24");	//В их душах поселились гнев, безумная ярость и непреодолимое желание убивать!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_27");	//Кузнец Душ сделал им предложение, от которого они не смогли отказаться.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_28");	//Дав им огромную силу, он при этом подчинил их разум и волю.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_29");	//После этого, окончательно потеряв контроль над своими действиями, орки несли смерть всему живому, утопив эту долину в море крови!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_30");	//Демон же забирал себе души убитых и приносил их в качестве дара своему хозяину - Азгалору.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_31");	//Бездушные тела Кузнец Душ обращал в нежить, которая пополняла ряды армии Тьмы.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_32");	//Так Калимдор навсегда был предан забвению.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_33");	//Проклятые орки!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_34");	//Они лишь стали орудием зла. Просто не смогли противостоять безумию, завладевшим ими.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_35");	//Но несмотря на это, именно орки и уничтожили проклятье, павшее на эту долину и их народ...
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_36");	//(непонимающе) Каким образом?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_37");	//Устав от убийств и присытив преследовавшую их жажду крови, орки больше не захотели сражаться.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_39");	//Но огонь демона, сжигающий их души и бередящий кровь, принуждал их убивать снова и снова.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_40");	//Не имея сил выносить более такие чудовищные страдания, раздирающие их разум и душу, орки решили избавиться от власти демона.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_42");	//Тогда Азгалор поднял свою армию Тьмы.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_45");	//Орки отчаянно сражались...
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_46");	//И в конце концов, орды нежити были разбиты, а Кузнец Душ был повержен.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_48");	//Но черный дракон проклял всех, кто испил кровь демона. Со временем проклятие обратило их в безжизненных призраков, а их душами завладел сам Азгалор.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_49");	//Только Ур-Траллу удалось выбраться живым.
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_51");	//Это все, что он мне смог рассказать.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_52");	//А зачем он это вообще сделал?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_53");	//Единственное чего он хочет - это отомстить Азгалору.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_56");	//И он попросил тебя сделать это за него?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_57");	//Мы заключили соглашение!
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_58");	//Если я найду Азгалора и убью его, то вы сможете беспрепятственно смыться отсюда, воспользовавшись телепортационным камнем в пирамиде.
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_61");	//Неужели ты думаешь, что у тебя все это получится?
	AI_Output(self,other,"DIA_Harum_Hello_Two_01_64");	//Орки... Разве им можно доверять?
	AI_Output(other,self,"DIA_Harum_Hello_Two_01_65");	//Другого выхода у нас нет.
	B_LogEntry(TOPIC_HUMANINVALLEY,"Я рассказал Эльваису о том, что мне поведал Ур-Тралл. К тому же у меня появилась мысль, как можно помочь этим людям выбраться из долины. Если я найду и убью черного дракона, то, возможно, Ур-Тралл согласится пропустить их через свой подземный город в Долину Рудников, а потом в Хоринис.");
	MEETHARUMONE = TRUE;
};


instance DIA_HARUM_HELLO_THREE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_three_condition;
	information = dia_harum_hello_three_info;
	permanent = FALSE;
	important = FALSE;
	description = "Откуда у вас эти древние книги?";
};


func int dia_harum_hello_three_condition()
{
	if((MEETHARUMTWO == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_three_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Three_01_01");	//А откуда у вас эти древние книги?
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_02");	//Однажды во время охоты Руен наткнулся на заброшеный склеп, в котором обнаружил небольшую библиотеку.
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_03");	//Правда, он еле унес оттуда ноги, поскольку склеп, оказалось, просто кишел нежитью.
	AI_Output(self,other,"DIA_Harum_Hello_Three_01_04");	//К моему величайшему восторгу, ему хватило ума прихвать оттуда несколько старых книг.
	B_LogEntry(TOPIC_URNAZULRAGE,"Эльваис упомянул об одном склепе с заброшенной библиотекой. Возможно, там я смогу найти некоторые ответы на свои вопросы.");
	MEETHARUMTWO = TRUE;
};


instance DIA_HARUM_HELLO_FOUR(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_four_condition;
	information = dia_harum_hello_four_info;
	permanent = FALSE;
	important = FALSE;
	description = "Можешь рассказать еще что-нибудь про Око Гнева?";
};


func int dia_harum_hello_four_condition()
{
	if((MEETHARUMTHREE == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_four_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Four_01_01");	//Что ты еще знаешь про этот артефакт Око Гнева?
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_02");	//В тех записях, которые у нас есть, кроме того, что я тебе сказал, больше о нем ничего нет.
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_04");	//Возможно, тебе следует поискать ответы на интересующие тебя вопросы вне этой пещеры.
	AI_Output(self,other,"DIA_Harum_Hello_Four_01_05");	//Или поспрашивать других.
	MEETHARUMTHREE = TRUE;
};


instance DIA_HARUM_HELLO_FIVE(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_five_condition;
	information = dia_harum_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты говорил, что видел тут что-то наподобие орков.";
};


func int dia_harum_hello_five_condition()
{
	if((MEETHARUMFOUR == FALSE) && (MEETHARUMONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_five_info()
{
	AI_Output(other,self,"DIA_Harum_Hello_Five_01_01");	//Ты говорил, что видел тут кого-то наподобие орков.
	AI_Output(self,other,"DIA_Harum_Hello_Five_01_02");	//Тебе лучше спросить об этом у Эмнола. Кажется, он сталкивался с этими созданиями.
	AI_Output(self,other,"DIA_Harum_Hello_Five_01_03");	//А были ли это орки или что-то еще, я не знаю.
	MEETHARUMFOUR = TRUE;
};


instance DIA_HARUM_HELLO_SIX(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_six_condition;
	information = dia_harum_hello_six_info;
	permanent = TRUE;
	important = FALSE;
	description = "Черный дракон мертв.";
};


func int dia_harum_hello_six_condition()
{
	if((BLKDRAGNISDEAD == TRUE) && (CURSEISENDHUMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_six_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_01");	//Черный дракон мертв.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_02");	//Воистину, это лучшая новость, которую ты мог бы принести.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_03");	//Этот адский крик, пронесшийся над долиной... мы думали, это конец!
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_05");	//Я знал... я знал, что ты именно тот воин, о ком говорилось в легенде.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_07");	//Теперь мы все спасены!
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_08");	//Что ты теперь собираешься делать?
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_09");	//Я отправляюсь в обратный путь и могу помочь вам покинуть долину.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_10");	//Думаю, в этом больше нет необходимости. Теперь, когда зло ушло из этих мест, мы сможем и здесь неплохо устроиться.
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_11");	//Наверняка и все остальные парни также не будут против!
	AI_Output(other,self,"DIA_Harum_Hello_Six_01_12");	//А что насчет орков?
	AI_Output(self,other,"DIA_Harum_Hello_Six_01_13");	//Орки?!
	if(MEETURGROM > 0)
	{
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_14");	//Проклятие, висевшее на ними, исчезло, и теперь вся долина в их распоряжении.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_15");	//Опять эти орки! Неужели после всех лет мучений нам снова придется прятаться и сражаться за свои жизни?
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_16");	//Я бы мог договорится с их вождем, чтобы вас не трогали.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_19");	//(недоверчиво) Хорошо, ты меня немного успокоил...
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_23");	//Доброго пути тебе, странник!
		B_LogEntry(TOPIC_HUMANINVALLEY,"Эльваис и остальные люди не захотели покидать эту долину. На мой взгляд, это правильное решение. Однако, в свете новых обстоятельств, возникла угроза конфликта с орками. Думаю, мне стоит поговорить на эту тему с Ур-Громом, он ведь теперь вождь здешней орды.");
	}
	else
	{
		AI_Output(other,self,"DIA_Harum_Hello_Six_01_24");	//Узнав о том, что зло ушло из этих мест, они наверняка захотят вернуться сюда.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_25");	//Опять эти орки! Неужели после всех лет мучений нам снова придется прятаться и сражаться за свои жизни?
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_27");	//Мы постараемся как-нибудь решить эту проблему.
		AI_Output(self,other,"DIA_Harum_Hello_Six_01_29");	//Доброго пути тебе, странник!
		B_LogEntry_Failed(TOPIC_HUMANINVALLEY);
	};
	Npc_ExchangeRoutine(orc_8565_urgrom,"HomeUrGrom");
	CURSEISENDHUMAN = TRUE;
};


instance DIA_HARUM_HELLO_SEVEN(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_hello_seven_condition;
	information = dia_harum_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = "Орки не тронут вас.";
};


func int dia_harum_hello_seven_condition()
{
	if((SAVEHUMAN == TRUE) && (SAVEHUMANEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_harum_hello_seven_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Harum_Hello_Seven_01_01");	//Орки не тронут вас! Я договорился с их вождем. Можете жить спокойно.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_02");	//Ты столько для нас сделал, а нам нечем даже тебя отблагодарить, странник.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_03");	//Хотя пойстой... пару дней назад Багрус во время очередной охоты нашел эту каменную табличку.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_04");	//Похоже, это какая-то волшебная вещичка, но я так и не понял, как ею воспользоваться.
	AI_Output(self,other,"DIA_Harum_Hello_Seven_01_05");	//Возьми ее себе в качестве нашего признания твоих подвигов!
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	SAVEHUMANEND = TRUE;
	B_LogEntry(TOPIC_HUMANINVALLEY,"Я договорился с орками и людьми о соблюдении перемирия. Теперь я думаю, это вопрос можно считать закрытым... но надолго ли?");
	MIS_SAVEHUMANEND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_SUCCESS);
};


instance DIA_HARUM_SEEKAZGOLOR(C_Info)
{
	npc = vlk_6020_harum;
	nr = 1;
	condition = dia_harum_seekazgolor_condition;
	information = dia_harum_seekazgolor_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты можешь прочесть эту книгу?";
};


func int dia_harum_seekazgolor_condition()
{
	if((SEEKAZGOLOR == TRUE) && (READ_AZGOLOR == FALSE) && (Npc_HasItems(other,itwr_azgolor) >= 1))
	{
		return TRUE;
	};
};

func void dia_harum_seekazgolor_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harum_SeekAzgolor_01_01");	//Ты можешь прочесть эту книгу?
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_02");	//Дай мне взглянуть... очень интересно!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_03");	//Какая странная книга, и язык какой-то необычный. Чем-то напоминает орочий, но точно не их.
	AI_Output(self,other,"DIA_Harum_SeekAzgolor_01_04");	//Хмм... боюсь, я ничем не смогу тебе помочь.
	B_LogEntry(TOPIC_URNAZULRAGE,"Эльваис не смог расшифровать символы в той книге, что я обнаружил в подземном храме, но сказал, что этот язык чем-то напоминает орочий. Может, стоит поискать орка, способного прочесть эти записи?");
	SEEKAZGOLOR = FALSE;
};