
instance DMT_121200_DAGOT_EXIT(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_exit_condition;
	information = dmt_121200_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
	nr = 999;
};


func int dmt_121200_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_121200_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_121200_DAGOT_TRUESTORY(C_Info)
{
	npc = dmt_121200_dagot;
	condition = dmt_121200_dagot_truestory_condition;
	information = dmt_121200_dagot_truestory_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_121200_dagot_truestory_condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

func void dmt_121200_dagot_truestory_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_01");	//Итак, избранник Белиара мертв. Что же, это действительно впечатляет!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_01_02");	//Хранитель Дагот?!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_03");	//(вкрадчиво) Наверняка тебя удивляет мое появление здесь. Однако, думаю, ты и сам прекрасно понимаешь, что подобного рода вещи не происходят незамеченными с нашей стороны.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_04");	//Тем более если они уже были предвидены нами заранее.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_06");	//Смысл твоего существования уже давно вкован в цепь бытия этого мира. И изменить этого не в силах никто!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_07");	//Но настал тот момент, когда нам все-таки необходимо вмешаться в ход происходящих событий.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_01_08");	//Что ты имеешь в виду?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_09");	//Ты уже сыграл отведенную тебе роль в судьбе этого мира, и он более не нуждается в таком герое, как ты.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_01_10");	//Ибо все, что от тебя требовалось, ты уже сделал, и твое дальнейшее присутствие в этом мире может нарушить ход великого замысла Творцов!
	MIS_GUARDIANS = LOG_Running;
	ORCCANNOFEAR = TRUE;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"В храме Ирдората я повстречался с Хранителем Даготом! Его появление в этом месте - довольно странный поворот событий...");
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,"Великий замысел Творцов?",dmt_121200_dagot_truestory_whatplan);
};

func void dmt_121200_dagot_truestory_whatplan()
{
	var C_Npc demdag1;
	var C_Npc demdag2;
	var C_Npc demdag3;
	var C_Npc demdag4;
	demdag1 = Hlp_GetNpc(demondagot_01);
	demdag2 = Hlp_GetNpc(demondagot_02);
	demdag3 = Hlp_GetNpc(demondagot_03);
	demdag4 = Hlp_GetNpc(demondagot_04);
	demdag1.flags = 0;
	demdag2.flags = 0;
	demdag3.flags = 0;
	demdag4.flags = 0;
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_01");	//Великий замысел Творцов?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_04");	//Да. Это то, что навсегда изменит облик этого мира и сделает его таким, каким он и должен быть!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_07");	//Думаю, тебе известно, что в этом мире существуют три божества - Иннос, Аданос и Белиар.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_08");	//Наделенные силой и мудростью Творцов, они на протяжении многих тысячелетий безраздельно властвуют над ним, определяя всецело его дальнейшую судьбу.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_09");	//К большому сожалению, эти жалкие ничтожества уже давно позабыли свое истинное предназначение, которое им было на самом деле отведено Создателями.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_10");	//Они обернулись в сторону раздора между собой, губя этот прекрасный мир каждым своим деянием.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_11");	//Поэтому мы, Хранители, решили положить всему этому конец, дабы оградить его от полного уничтожения.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_14");	//Так вы хотите уничтожить богов?!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_15");	//И все, что было ими создано, смертный. Никто и ничто не укроется от гнева Создателей!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_16");	//Но это безумие! Не думаю, что сами боги будут безучастно взирать на все это.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_17");	//(надменно) А что они могут сделать?! Сейчас эти ничтожества слишком слабы, чтобы противостоять нам.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_18");	//И кстати, не последнюю роль в этом сыграл именно ты. (смеясь) Даже не догадываясь об этом.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_20");	//В этом и было твое предназначение, избранный.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_21");	//Я не буду объяснять тебе весь сокрытый смысл твоих деяний, поскольку уверен, что ты его и сам вскоре поймешь...
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_22");	//...'И вошел человек в царство Белиара и убил зверя!'... Тебе знакомы эти слова?!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_23");	//Так ты хочешь сказать...?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_24");	//(вкрадчиво) Ты абсолютно прав.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_25");	//И это лишь часть того, что мы - Хранители - называем неизбежностью! То, что должно было случится - обязательно произойдет.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_26");	//Также, как и уничтожение этого мира, и его возрождение по образу и подобию Творцов!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_27");	//А что насчет Инноса?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_28");	//Его вера в людей - его слабость!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_29");	//Поэтому за него тоже можешь не волноваться. Об этом позаботятся орки!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_30");	//Уверен, что в скором времени не останется никого, кто бы мог поклоняться и ему.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_31");	//И тогда его участь будет тоже предопределена!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_32");	//Орки?! Так они подчиняются вашей воле?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_33");	//А ты считал их созданиями Белиара? (смеясь) Как глупо с твоей стороны так полагать!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_34");	//Орки - древние существа! Сама их бытность уходит далеко в прошлое, к временам зарождения этого мира.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_35");	//Поэтому только мы имеем силу и власть, чтобы повелевать ими!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_38");	//Их железными кулаками мы очистим этот мир от рода человеческого, а после возродим его в небывалом величии!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_WhatPlan_01_39");	//Но остается еще Аданос!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_40");	//(вкрадчиво) Да. Это единственное божество, которое достойно снисхождения.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_WhatPlan_01_41");	//Однако его власть не слишком крепка, чтобы править этим миром в одиночку.
	B_LogEntry(TOPIC_GUARDIANS,"Теперь мне все стало ясно. Хранители задумали абсолютное безумие - уничтожить богов и все живое в этом мире. Они полагают, что раздор между Белиаром и Инносом зашел слишком далеко, и это может окончательно ввергнуть мир во мрак хаоса и разрушения.");
	B_LogEntry(TOPIC_GUARDIANS,"Для этой цели они использовали и меня! Сам того не осознавая, я своими действиями тщательно и планомерно ослаблял силу богов в этом мире, и в итоге дал возможность Хранителям осуществить задуманное.");
	B_LogEntry(TOPIC_GUARDIANS,"Именно Хранители стояли за началом кровопролитной войной между людьми и орками, которая длится уже многие годы. Подчинившись воле своих создателей, эти твари должны теперь стереть с лица земли весь род человеческий, чтобы никто не мог больше поклоняться богам!");
	DAGOTTRUTH_01 = TRUE;
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,"И что теперь?",dmt_121200_dagot_truestory_askme);
	Info_AddChoice(dmt_121200_dagot_truestory,"А как насчет Ксардаса?",dmt_121200_dagot_truestory_xardas);
};

func void dmt_121200_dagot_truestory_askme()
{
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_01");	//И что теперь?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_02");	//Думаю, ты и сам прекрасно понимаешь.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_03");	//Твой путь оканчивается здесь.
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_04");	//Значит, Хранители хотят моей смерти. Что же, это будет не так просто сделать!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_05");	//В этом я не сомневаюсь. (с уважением) Тот, кому оказалось под силу одолеть самого Зверя, не может быть слабым.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_06");	//Но ты не представляешь, насколько мы сильны и могущественны! У тебя нет шансов в этой битве.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_AskMe_01_07");	//Лучше смирись со своей судьбой, избранный!
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_AskMe_01_08");	//Это мы еще посмотрим.
	B_LogEntry(TOPIC_GUARDIANS,"Теперь Хранители хотят и моей смерти, поскольку считают меня опасным для них. Это в мои планы никак не входило!");
	DAGOTTRUTH_02 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory,"Тогда подойди и попробуй убить меня!",dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_xardas()
{
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_Xardas_01_01");	//А как насчет Ксардаса?
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_02");	//Ах да... (небрежно) Этот жалкий маг, возомнивший себя богом во плоти!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_03");	//Он предал нас, узнав наши истинные замыслы.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_04");	//Но можешь не сомневаться, гнев Создателей покарает и его, где бы он не находился.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_Xardas_01_05");	//Никто не избежит кары Творцов!
	B_LogEntry(TOPIC_GUARDIANS,"Дагот обмолвился парой слов и о Ксардасе. Кажется, он понял, что замышляют Хранители и чем это грозит, поспешив отдалится от всего этого. Однако остается вопрос, что делал Ксардас в Чертогах Зверя и что там на самом деле произошло...");
	DAGOTTRUTH_03 = TRUE;
	if((DAGOTTRUTH_01 == TRUE) && (DAGOTTRUTH_02 == TRUE) && (DAGOTTRUTH_03 == TRUE))
	{
		Info_ClearChoices(dmt_121200_dagot_truestory);
		Info_AddChoice(dmt_121200_dagot_truestory,"Тогда подойди и попробуй убить меня!",dmt_121200_dagot_truestory_killme);
	};
};

func void dmt_121200_dagot_truestory_killme()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("DEM_WARN01");
	AI_Output(other,self,"DMT_121200_Dagot_TrueStory_KillMe_01_01");	//Тогда подойди и попробуй убить меня!
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_KillMe_01_02");	//Спешишь умереть?! Тогда на этом и закончим наш разговор.
	AI_Output(self,other,"DMT_121200_Dagot_TrueStory_KillMe_01_03");	//Мои слуги позаботятся о тебе...(вкрадчиво) Прощай, избранный!
	Info_ClearChoices(dmt_121200_dagot_truestory);
	Info_AddChoice(dmt_121200_dagot_truestory,Dialog_Ende,dmt_121200_dagot_truestory_killmeext);
};

func void dmt_121200_dagot_truestory_killmeext()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = TRUE;
	DAGOTTELLALL = TRUE;
};

