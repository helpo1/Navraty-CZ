
instance DIA_Gestath_EXIT(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 999;
	condition = DIA_Gestath_EXIT_Condition;
	information = DIA_Gestath_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_EXIT_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(heroArmor,ITAR_DJG_Crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(сухо) Хорошие доспехи!
	};
	AI_StopProcessInfos(self);
};

var int GestatCanBecameHunt;

instance DIA_Gestath_HALLO(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_HALLO_Condition;
	information = DIA_Gestath_HALLO_Info;
	description = "Как дела?";
};


func int DIA_Gestath_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gestath_HALLO_Info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(сухо) Это мужественный поступок - прийти сюда. А ты не заблудился, часом?
	Gestath_TeachAnimalTrophy = TRUE;
	Info_ClearChoices(DIA_Gestath_HALLO);
	Info_AddChoice(DIA_Gestath_HALLO,"Что здесь есть интересного?",DIA_Gestath_HALLO_waszusehen);
	Info_AddChoice(DIA_Gestath_HALLO,"А что ты делаешь здесь?",DIA_Gestath_HALLO_was);
};

func void DIA_Gestath_HALLO_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//У тебя хорошие доспехи.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//Да. Такие нелегко найти. Они из панцирей ползунов. Парень по имени Вольф сделал их для меня.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//Я был каторжником здесь, в колонии. Дал ему пару панцирей ползунов, и пару дней спустя доспехи были готовы. Этот парень - мастер.
	Wolf_ProduceCrawlerArmor = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,Dialog_Back,DIA_Gestath_HALLO_Back);
	Info_AddChoice(DIA_Gestath_HALLO,"А где сейчас Вольф?",DIA_Gestath_HALLO_plate_woWolf);
};

func void DIA_Gestath_HALLO_plate_woWolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//А где сейчас Вольф?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//Я давно уже не видел его. Раньше он был наемником здесь, в колонии.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//Я думаю, он все еще со своими парнями.
};

func void DIA_Gestath_HALLO_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//А что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//Зарабатываю деньги.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Здесь, где нет ничего?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//Я охотник! Специализируюсь на сложных случаях.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Огненные ящеры, ползуны, драконьи снепперы... Другие не охотятся на таких зверей. Это приносит неплохие деньги.
	GestatCanBecameHunt = TRUE;
	Info_AddChoice(DIA_Gestath_HALLO,"У тебя хорошие доспехи.",DIA_Gestath_HALLO_plate);
};

func void DIA_Gestath_HALLO_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//Что здесь есть интересного?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//Куча огненных ящеров, орков и еще не знаю чего. Наверх я не ходил.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//И тебе бы не советовал. Твари, что живут там, не особенно дружелюбны.
};

func void DIA_Gestath_HALLO_Back()
{
	Info_ClearChoices(DIA_Gestath_HALLO);
};

instance DIA_Gestath_Drachen(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 3;
	condition = DIA_Gestath_Drachen_Condition;
	information = DIA_Gestath_Drachen_Info;
	permanent = TRUE;
	description = "Ты умеешь потрошить драконов?";
};

var int Gestath_DragonTrophy;

func int DIA_Gestath_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Ты умеешь потрошить драконов?
	AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Конечно. Почему нет?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_TEACHHUNTING(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 12;
	condition = DIA_Gestath_TEACHHUNTING_Condition;
	information = DIA_Gestath_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня потрошить животных.";
};

func int DIA_Gestath_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Gestath_TEACHHUNTING_OneTime;

func void DIA_Gestath_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Научи меня потрошить животных.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Почему нет? У меня есть немного свободного времени.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Что ты хочешь узнать?
		};
		Info_AddChoice(DIA_Gestath_TEACHHUNTING,Dialog_Back,DIA_Gestath_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_TEACHHUNTING,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//Сейчас я даже не представляю, чему еще можно обучить тебя.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Язык огненного ящера нужно вырезать одним точным движением ножа, удерживая его при этом другой рукой.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Чтобы снять панцирь с ползуна, нужен хороший прочный нож.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Мандибулы сидят глубоко в черепе полевых хищников и ползунов. Чтобы вытащить их, нужно приложить некоторое усилие.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Лучше всего отделять рог драконьего снеппера от черепа при помощи толстого ножа.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Чешую дракона очень сложно оторвать. Но когда ты уже думаешь, что у тебя ничего не получится, раз - и она все же отделяется.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};

func void DIA_Gestath_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Лучше всего брать кровь из брюха. Найди слабое место и вонзи туда острый нож.
	};
	Info_ClearChoices(DIA_Gestath_TEACHHUNTING);
};


instance DIA_Gestath_PICKPOCKET(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 900;
	condition = DIA_Gestath_PICKPOCKET_Condition;
	information = DIA_Gestath_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gestath_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,Dialog_Back,DIA_Gestath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_PICKPOCKET_DoIt);
};

func void DIA_Gestath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

func void DIA_Gestath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_PICKPOCKET);
};

instance DIA_GESTATH_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_bonusminecrawlerplates_condition;
	information = dia_gestath_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "Есть один вопрос.";
};

func int dia_gestath_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Gestath_BonusMineCrawlerPlates_01_95");	//У меня есть один вопрос.
	AI_Output(other,self,"DIA_Gestath_BonusMineCrawlerPlates_01_02");	//Говорят, что если охотник сам добыл панцири ползунов, то сделанный из них доспех намного лучше и прочнее обычного?
	AI_Output(self,other,"DIA_Gestath_BonusMineCrawlerPlates_01_03");	//Да, это правда! Доспехи становятся прочнее и легче.
	AI_Output(self,other,"DIA_Gestath_BonusMineCrawlerPlates_01_04");	//Я точно не знаю, почему...(задумчиво) Но главное - в это надо верить!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_GESTATH_HUNTCAMP(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = dia_gestath_HUNTCAMP_condition;
	information = dia_gestath_HUNTCAMP_info;
	permanent = FALSE;
	description = "Здесь становится довольно опасно.";
};

func int dia_gestath_HUNTCAMP_condition()
{
	if((MIS_NewHunters == LOG_Running) && (GestatCanBecameHunt == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_HUNTCAMP_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_01");	//Здесь становится довольно опасно. Не находишь?
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_02");	//(сухо) И что с того?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_03");	//Ты не боишься, что тебя поймают орки?
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_04");	//Орки? Хммм...(задумчиво) Об этом я как-то не думал.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_05");	//Интересно! Вся Долина просто кишит ими, а тебя это совсем не пугает? 
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_06");	//Ну, как сказать. (спокойно) С одним я, конечно, справлюсь, но этих тварей редко можно встретить поодиночке.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_07");	//Знаешь, по правде говоря, я уже подумывал над тем, чтобы вернуться обратно в Хоринис.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_08");	//Вот только что там делать с пустыми карманами?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_09");	//Уверен, что это не будет проблемой для такого человека, как ты.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_10");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_11");	//В Хоринисе есть лагерь охотников. Ты бы мог присоединиться к ним.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_12");	//И тогда тебе больше не придется ломать голову над тем, как бы заработать.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_13");	//А что, им вдруг понадобились новые люди?
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_14");	//Уверен, для тебя там местечко точно найдется.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_15");	//Фальк с радостью примет к себе в лагерь такого опытного охотника, как ты.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_16");	//Ну что же, раз так... Тогда стоит попробовать.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_17");	//В конце концов, я ничего не теряю.
	AI_Output(other,self,"DIA_Gestath_HUNTCAMP_01_18");	//Тогда увидимся в лагере, по ту сторону перевала.
	AI_Output(self,other,"DIA_Gestath_HUNTCAMP_01_19");	//Конечно! Удачи...
	GestatBecameHunt = TRUE;
	B_LogEntry(TOPIC_NewHunters,"Охотник Гестат присоединится к лагерю охотников.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

instance DIA_GESTATH_HARPIE(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_gestath_harpie_condition;
	information = dia_gestath_harpie_info;
	permanent = FALSE;
	description = "А почему ты стоишь именно здесь?";
};

func int dia_gestath_harpie_condition()
{
	if((Kapitel >= 3) && (MIS_RUKVAIA == FALSE) && Npc_KnowsInfo(hero,DIA_Gestath_HALLO))
	{
		return TRUE;
	};
};

func void dia_gestath_harpie_info()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_01");	//А почему ты стоишь именно здесь? 
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_02");	//Если у орков хватит ума забраться на утес, они из тебя отбивную сделают.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_03");	//Да знаю, знаю. Вчера уже видел, как в сторону крепости прошло не меньше полусотни этих тварей.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_04");	//Я еле успел костер затушить! Думал, что заметят.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_05");	//Тогда почему ты еще здесь?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_06");	//У меня тут осталось одно незаконченное дельце - я охочусь за Руквайей!
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_07");	//Это что еще такое?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_08");	//Руквайя - это здешняя королева гарпий! Она намного больше и сильнее обычной.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_09");	//Поговаривают, что эта тварь может с легкостью разорвать своими когтями даже мракориса!
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_10");	//Рядом с тобой бегают орки, а ты говоришь о гарпии?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_11");	//Да, это, конечно, опасно. Но один торговец предложил мне такую сумму за сердце этой твари, что я просто не смог отказаться.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_12");	//Сколько?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_13");	//Извини, но этого я тебе сказать не могу.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_14");	//Ну что же, тогда желаю удачи!
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_15");	//Постой. (замявшись) Я недавно видел, как Руквайя разорвала на куски двух элитных черных орков.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_16");	//Жуткое зрелище, знаешь ли! Так что от чей-либо помощи я, пожалуй, не откажусь.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_17");	//А что я получу, если помогу тебе?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_18");	//Для начала принеси мне сердце этой твари! Тогда и поговорим о награде.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_19");	//Небось какую-нибудь жалкую сотню золотых монет. Я прав?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_20");	//Парень, я не пытаюсь тебя обмануть...(серьезно) Принеси мне сердце этой бестии и поверь, ты не пожалеешь!
	CreateInvItem(other,ItMi_Joint);
	B_UseItem(other,ItMi_Joint);
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_21");	//Ладно! Считай, что я в деле. Пойду посмотрю на твою красотку.
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Harpie_01_22");	//Кстати, а где находится ее логово?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_23");	//Насколько мне известно, оно находится в старой крепости, что к западу отсюда.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Harpie_01_24");	//Только будь осторожен! Кроме нее там обитают и другие монстры.
	Wld_InsertNpc(harpie_uniq,"FP_ROAM_DRACONIAN_184");
	MIS_RUKVAIA = LOG_Running;
	Log_CreateTopic(TOPIC_RUKVAIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_Running);
	B_LogEntry(TOPIC_RUKVAIA,"Гестат, охотник на опасных тварей, рассказал мне что охотится на Руквайю! Это редкий вид гарпии. Я взялся ему помочь, и мне нужно вырвать сердце у этой твари и принести Гестату. Она должна быть где-то в районе старого форта.");
};

instance DIA_VLK_4148_GESTATH_RUKVAIA(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 1;
	condition = dia_vlk_4148_gestath_rukvaia_condition;
	information = dia_vlk_4148_gestath_rukvaia_info;
	permanent = FALSE;
	description = "Я прикончил твою гарпию!";
};

func int dia_vlk_4148_gestath_rukvaia_condition()
{
	if((MIS_RUKVAIA == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other,ITAT_GARPIISERDCE) >= 1))
	{
		return TRUE;
	};
};

func void dia_vlk_4148_gestath_rukvaia_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_01_01");	//Я прикончил твою гарпию!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_02");	//(нетерпеливо) А ее сердце, оно у тебя?
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_01_03");	//Да. Но не так быстро, приятель. Для начала давай поговорим о моей награде.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_04");	//Да, ты парень не промах... Хорошо, какую награду ты предпочитаешь?
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_01_05");	//Я могу предложить тебе полторы тысячи монет, магическое зелье или довольно неплохое оружие.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Мне нужны деньги!",dia_vlk_4148_gestath_rukvaia_money);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Я возьму магическое зелье.",dia_vlk_4148_gestath_rukvaia_zelia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Дай мне твое оружие.",dia_vlk_4148_gestath_rukvaia_weapons);
};

func void dia_vlk_4148_gestath_rukvaia_money()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_00");	//Мне нужны деньги.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_01");	//Хорошо. (деловито) Вот - забирай!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_02");	//Полторы тысячи золотых - довольно большая сумма, но ведь и риск был велик, не так ли?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_03");	//А теперь отдай мне сердце.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Конечно! Вот, забирай.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Пожалуй, что я оставлю его себе.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_zelia()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_zelia_01_00");	//Я возьму магическое зелье.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_zelia_01_01");	//Хорошо. (деловито) Вот - забирай!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Money_01_03");	//А теперь отдай мне сердце.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Конечно! Вот, забирай.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Пожалуй, что я оставлю его себе.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_weapons()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_00");	//Дай мне твое оружие.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_01");	//Хорошо. (деловито) Вот - забирай! Мой старый двуручный топор.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_02");	//Он выкован с расчетом максимального облегчения веса оружия, но при этом наносит огромный урон!
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_03");	//Ты не представляешь, сколько орочьих черепов я им проломил! (посмеивается)
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_weapons_01_04");	//Ну, а теперь отдай мне сердце.
	Info_ClearChoices(dia_vlk_4148_gestath_rukvaia);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Конечно! Вот, забирай.",dia_vlk_4148_gestath_rukvaia_serdceyes);
	Info_AddChoice(dia_vlk_4148_gestath_rukvaia,"Пожалуй, что я оставлю его себе.",dia_vlk_4148_gestath_rukvaia_serdceno);
};

func void dia_vlk_4148_gestath_rukvaia_serdceyes()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_00");	//Конечно! Вот, забирай.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Serdceyes_01_01");	//Отлично...(довольно) С тобой приятно иметь дело, приятель!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUKVAIA,"Я отдал сердце Гестату.");
};

func void dia_vlk_4148_gestath_rukvaia_serdceno()
{
	AI_Output(other,self,"DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_00");	//Пожалуй, что я оставлю его себе.
	AI_Output(self,other,"DIA_VLK_4148_Gestath_Rukvaia_Serdceno_01_01");	//(гневно) Ты решил меня надуть?! Ну держись, я такое не прощаю.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};

instance DIA_GESTATH_LostPaladins(C_Info)
{
	npc = VLK_4148_Gestath;
	nr = 2;
	condition = DIA_GESTATH_LostPaladins_Condition;
	information = DIA_GESTATH_LostPaladins_Info;
	permanent = FALSE;
	description = "Ты случайно не видел здесь отряд паладинов?";
};

func int DIA_GESTATH_LostPaladins_Condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITEL < 4) && (	AlbertGroup == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GESTATH_LostPaladins_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_00");	//Ты случайно не видел здесь отряд паладинов?
	AI_Output(self,other,"DIA_GESTATH_LostPaladins_01_01");	//Да, пару дней назад тут действительно проходил небольшой отряд.
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_02");	//И куда они направились?
	AI_Output(self,other,"DIA_GESTATH_LostPaladins_01_03");	//Через мост, в сторону большого частокола орков.
	AI_Output(other,self,"DIA_GESTATH_LostPaladins_01_04");	//Благодарю.
	B_LogEntry(TOPIC_LostPaladins,"Охотник Гестат видел, как небольшой отряд паладинов перешел мост и направился в сторону большого частокола орков.");
};

//--------------------------------------------Гестат в Хоринисе------------------------------------------------------------------------

instance DIA_Gestath_NW_EXIT(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 999;
	condition = DIA_Gestath_NW_EXIT_Condition;
	information = DIA_Gestath_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Gestath_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gestath_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Gestath_NW_PICKPOCKET(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 900;
	condition = DIA_Gestath_NW_PICKPOCKET_Condition;
	information = DIA_Gestath_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Gestath_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(81,350);
};

func void DIA_Gestath_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,Dialog_Back,DIA_Gestath_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gestath_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gestath_NW_PICKPOCKET_DoIt);
};

func void DIA_Gestath_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

func void DIA_Gestath_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_PICKPOCKET);
};

instance DIA_Gestath_NW_BONUSMINECRAWLERPLATES(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 2;
	condition = dia_Gestath_NW_bonusminecrawlerplates_condition;
	information = dia_Gestath_NW_bonusminecrawlerplates_info;
	permanent = FALSE;
	description = "Есть один вопрос.";
};

func int dia_Gestath_NW_bonusminecrawlerplates_condition()
{
	if(Npc_KnowsInfo(hero,dia_hun_744_barem_crawlerarmor) && (BONUSMINECRAWLERARMOR == FALSE) && (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void dia_Gestath_NW_bonusminecrawlerplates_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_95");	//У меня есть один вопрос.
	AI_Output(other,self,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_02");	//Говорят, что если охотник сам добыл панцири ползунов, то сделанный из них доспех намного лучше и прочнее обычного?
	AI_Output(self,other,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_03");	//Да, это правда! Доспехи становятся прочнее и легче.
	AI_Output(self,other,"DIA_Gestath_NW_BonusMineCrawlerPlates_01_04");	//Я точно не знаю, почему...(задумчиво) Но, главное, в это надо верить!
	BONUSMINECRAWLERARMOR = TRUE;
};

instance DIA_Gestath_NW_Drachen(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 3;
	condition = DIA_Gestath_NW_Drachen_Condition;
	information = DIA_Gestath_NW_Drachen_Info;
	permanent = TRUE;
	description = "Ты умеешь потрошить драконов?";
};

func int DIA_Gestath_NW_Drachen_Condition()
{
	if((Gestath_DragonTrophy == FALSE) && (Gestath_TeachAnimalTrophy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_Drachen_Info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Ты умеешь потрошить драконов?
	AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Конечно. Почему нет?
	Gestath_DragonTrophy = TRUE;
};

instance DIA_Gestath_NW_TEACHHUNTING(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 12;
	condition = DIA_Gestath_NW_TEACHHUNTING_Condition;
	information = DIA_Gestath_NW_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Научи меня потрошить животных.";
};

func int DIA_Gestath_NW_TEACHHUNTING_Condition()
{
	if((Gestath_TeachAnimalTrophy == TRUE) && (GestatFinishTeach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Научи меня потрошить животных.

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		if(DIA_Gestath_TEACHHUNTING_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Почему нет? У меня есть немного свободного времени.
			DIA_Gestath_TEACHHUNTING_OneTime = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//Что ты хочешь узнать?
		};

		Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,Dialog_Back,DIA_Gestath_NW_TEACHHUNTING_BACK);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Gestath_NW_TEACHHUNTING_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление панцирей ползунов",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CrawlerPlate)),DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Удаление мандибул",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Mandibles)),DIA_Gestath_NW_TEACHHUNTING_Mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn);
		};
		if(Gestath_DragonTrophy == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Gestath_NW_TEACHHUNTING_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Gestath_NW_TEACHHUNTING,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Gestath_NW_TEACHHUNTING_DragonBlood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//Сейчас я даже не представляю, чему еще можно обучить тебя.
		GestatFinishTeach = TRUE;
	};
};

func void DIA_Gestath_NW_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//Язык огненного ящера нужно вырезать одним точным движением ножа, удерживая его при этом другой рукой.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_CrawlerPlate()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_CrawlerPlate))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//Чтобы снять панцирь с ползуна, нужен хороший прочный нож.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_Mandibles()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Mandibles))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Мандибулы сидят глубоко в черепе полевых хищников и ползунов. Чтобы вытащить их, нужно приложить некоторое усилие.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//Лучше всего отделять рог драконьего снеппера от черепа при помощи толстого ножа.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Чешую дракона очень сложно оторвать. Но когда ты уже думаешь, что у тебя ничего не получится, раз - и она все же отделяется.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

func void DIA_Gestath_NW_TEACHHUNTING_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//Лучше всего брать кровь из брюха. Найди слабое место и вонзи туда острый нож.
	};
	Info_ClearChoices(DIA_Gestath_NW_TEACHHUNTING);
};

instance DIA_VLK_4149_GESTATH_RUKVAIA(C_Info)
{
	npc = VLK_4149_Gestath;
	nr = 1;
	condition = DIA_VLK_4149_GESTATH_RUKVAIA_condition;
	information = DIA_VLK_4149_GESTATH_RUKVAIA_info;
	permanent = FALSE;
	description = "Я прикончил твою гарпию!";
};

func int DIA_VLK_4149_GESTATH_RUKVAIA_condition()
{
	if((MIS_RUKVAIA == LOG_Running) && Npc_IsDead(harpie_uniq) && (Npc_HasItems(other,ITAT_GARPIISERDCE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_01_01");	//Я прикончил твою гарпию!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_02");	//(нетерпеливо) А ее сердце, оно у тебя?
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_01_03");	//Да! Но не так быстро, приятель. Для начала давай поговорим о моей награде!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_04");	//Да, ты парень не промах... Хорошо, какую награду ты предпочитаешь?
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_01_05");	//Я могу предложить тебе полторы тысячи монет, магическое зелье или довольно неплохое оружие.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Мне нужны деньги!",DIA_VLK_4149_GESTATH_RUKVAIA_money);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Я возьму магическое зелье.",DIA_VLK_4149_GESTATH_RUKVAIA_zelia);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Дай мне твое оружие.",DIA_VLK_4149_GESTATH_RUKVAIA_weapons);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_money()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_00");	//Мне нужны деньги!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_01");	//Хорошо. (деловито) Вот - забирай!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_02");	//Полторы тысячи золотых - довольно большая сумма, но ведь и риск был велик, не так ли?
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Money_01_03");	//А теперь отдай мне сердце.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Конечно! Вот, забирай.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Пожалуй, что я оставлю его себе.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_zelia()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_00");	//Я возьму магическое зелье.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_01");	//Хорошо. (деловито) Вот - забирай!
	B_GiveInvItems(self,other,itpo_perm_def,1);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_zelia_01_02");	//А теперь отдай мне сердце.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Конечно! Вот, забирай.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Пожалуй, что я оставлю его себе.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_weapons()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_00");	//Дай мне твое оружие.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_01");	//Хорошо. (деловито) Вот - забирай! Мой старый двуручный топор.
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_02");	//Он выкован с расчетом максимального облегчения веса оружия, но при этом наносит огромный урон!
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_03");	//Ты не представляешь, сколько орочьих черепов я им проломил! (посмеивается)
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_weapons_01_04");	//Ну, а теперь отдай мне сердце.
	Info_ClearChoices(DIA_VLK_4149_GESTATH_RUKVAIA);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Конечно! Вот, забирай.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes);
	Info_AddChoice(DIA_VLK_4149_GESTATH_RUKVAIA,"Пожалуй, что я оставлю его себе.",DIA_VLK_4149_GESTATH_RUKVAIA_serdceno);
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceyes()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_00");	//Конечно! Вот, забирай.
	B_GiveInvItems(other,self,ITAT_GARPIISERDCE,1);
	Npc_RemoveInvItems(self,ITAT_GARPIISERDCE,1);

	if(Trophy_SERDCEGARPII == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_SERDCEGARPII,Npc_HasItems(other,ItUt_SERDCEGARPII));
		Trophy_SERDCEGARPII = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceyes_01_01");	//Отлично...(довольно) С тобой приятно иметь дело, приятель!
	AI_StopProcessInfos(self);
	MIS_RUKVAIA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RUKVAIA,LOG_SUCCESS);
	B_LogEntry(TOPIC_RUKVAIA,"Я отдал сердце Гестату.");
};

func void DIA_VLK_4149_GESTATH_RUKVAIA_serdceno()
{
	AI_Output(other,self,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_00");	//Пожалуй, что я оставлю его себе.
	AI_Output(self,other,"DIA_VLK_4149_GESTATH_RUKVAIA_Serdceno_01_01");	//(гневно) Ты решил меня надуть?! Ну держись, я такое не прощаю.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_ATTACKREASON] = AR_KILL;
	MIS_RUKVAIA = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RUKVAIA);
};