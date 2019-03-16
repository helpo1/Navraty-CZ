
instance DIA_DiegoNW_EXIT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 999;
	condition = DIA_DiegoNW_EXIT_Condition;
	information = DIA_DiegoNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DiegoNW_Perm(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_DiegoNW_Perm_Condition;
	information = DIA_DiegoNW_Perm_Info;
	permanent = TRUE;
	description = "Как идут дела?";
};


func int DIA_DiegoNW_Perm_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//Как дела?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Паршиво. Почему никто не сказал мне, что Хоринис за это время полностью разорился?
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//Понятия не имею. Я знаю этот город только таким.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//Ты бы видел его несколько лет назад. Он бы тебе совсем не понравился в нынешнем состоянии.
};


instance DIA_DiegoNW_NeedHelp(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = DIA_DiegoNW_NeedHelp_Condition;
	information = DIA_DiegoNW_NeedHelp_Info;
	important = TRUE;
};


func int DIA_DiegoNW_NeedHelp_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if(Diego_IsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Эй! Ты выглядишь так, будто увидел призрака!
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(смеется) А ты думал, что мне пришел конец, верно?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//Я тогда довольно долго провалялся без сознания. Но как видишь, я все еще жив.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//Ладно, самое важное - это то, что сейчас мы оба здесь.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//Ты должен мне помочь.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Хорошо, что ты здесь. Ты должен помочь мне.
	};
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	if(DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	};
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что это на тебе за одежда?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что ты делаешь здесь?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Какие планы?",DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//За мной следит стража. Они всегда начеку.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//Не думаю, что мне будет легко устроиться здесь.
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//Черт, это все, наверное, из-за одежды. В старой одежде, стражники не пустили бы меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//Вот почему я купил это одеяние у торговца за городом. Теперь-то, надеюсь, ты вспомнил меня? Я Диего.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//В старой колонии я учил тебя всему, что необходимо для выживания.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//Ты же не мог вот так просто все забыть.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Ээ... а что именно произошло там?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Черт побери! Ты действительно ничего не помнишь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Послушай, у меня действительно нет времени объяснять все тебе теперь. Послушай только одно: мы были чертовски хорошими друзьями, и я не раз спасал твою жизнь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//А теперь мне нужна твоя помощь.
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//Что это на тебе за одежда?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//Я купил ее у торговца за городом. Стража не хотела пропускать меня в город.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Также не стоит никому говорить, откуда я пришел.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//Это имеет смысл.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//Я тоже так думаю. Но даже хотя я снял свой старый наряд, я все равно остался прежним.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//И у меня большие планы касательно этого города.
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//Какие планы?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//Здесь многое переменилось с тех пор, как я покинул его. Мне как-то нужно опять встать на ноги.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//В чем проблема?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//Я должен попасть в верхний квартал.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//Но я не гражданин этого города, и у меня нет денег, чтобы подкупить стражу. Вот зачем нужен ты!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//То есть, ты хочешь, чтобы я одолжил тебе золота?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Чушь. У меня есть золото. Я бы сказал даже целая куча золота! Но, к сожалению, оно не при мне.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//Ты должен забрать мое золото там, где оно находится.
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"У меня нет времени на это.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"А что мне с этого будет?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Ладно, я помогу тебе.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Эй, я думал мы друзья! Это ведь я, не забывай, спасал твою задницу, когда тебя бросили в колонию.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//Ты преувеличиваешь.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Да?! А ты задумайся на минутку, что могло бы быть, если бы я не объяснил тебе тогда, как нужно вести себя в колонии.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//Рудные бароны сожрали бы тебя на завтрак, и ты бы подох жалкой смертью где-нибудь в шахте.
	MIS_HelpDiegoNW = LOG_FAILED;
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//Что мне с этого будет?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Я когда-нибудь спрашивал тебя, что ты мне дашь взамен? Мы же друзья, разве этого недостаточно?
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//Ладно, я помогу тебе.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_01");	//Прекрасно. Слушай внимательно. Когда Барьер еще был на месте, я спрятал в Долине Рудников небольшой клад.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_02");	//Это было довольно давно, и поэтому когда я оттуда уходил, я забыл его забрать.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_03");	//А сейчас мне очень нужны эти деньги.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_MoreGold_11_04");	//Если вкратце, ты должен пойти в Долину Рудников и забрать мое золото.
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Что ты собираешься делать с этим золотом?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Откуда у тебя это золото?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Где спрятано это золото?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//Что ты собираешься делать с этим золотом?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//Я хочу свести счеты с одним из торговцев в верхнем квартале. Я очень этого хочу.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//А затем, я буду готов начать новую карьеру!
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Откуда у тебя это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Я что, единственный что ли, кто откладывал золото для себя в Долине Рудников?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Украсть несколько кусков руды было легче легкого. Просто на случай, если нам когда-нибудь удастся выбраться оттуда.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Все были так сосредоточены на руде, что на золото никто не обращал внимания...
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Где спрятано это золото?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Прямо на площадке, рядом с заброшенной шахтой! Оно в кожаном кошельке.
	if(Diego_angekommen == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Обойдись без комментариев. Я и сам помню, что мы проходили мимо этого места.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Просто принеси мне золото.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//Но проверь, чтобы это был тот самый кошелек, чтобы не ходить туда вхолостую.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//Как я опознаю его?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//Он полон золота. Доверху полон!
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Я попытаюсь найти твое золото.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится где-то на старой торговой площади, там, где товары переправлялись в колонию по канатной дороге, над заброшенной шахтой.");
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//Я попытаюсь найти твое золото.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//Сделай это...(ухмыляется) Этого будет достаточно для меня!
	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp,"И еще...",dia_diegonw_needhelp_problem_willhelpyou_wheremoregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheremoregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_15_00");	//И еще... Выкладывай - где ты нашел эти самородки?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_01");	//Хммм...(задумчиво) Ну, в самом деле, почему бы и нет.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_02");	//Там же и нашел. Думаешь, какие дела у меня были у прохода? Я проведывал это самое место.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_03");	//Это одно из ответвлений заброшенной шахты, про которое все забыли, свихнувшись на руде. У него отдельный вход.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereMGold_11_04");	//Забираешься на плато прямо над шахтой, по которой идешь в Хоринис и вход будет слева от тебя.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Вход в богатое золотом ответвление заброшенной шахты находится на плато, что сверху скрытого прохода в Долину Рудников.");
};


instance DIA_DiegoNW_HelpYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_HelpYou_Condition;
	information = DIA_DiegoNW_HelpYou_Info;
	permanent = FALSE;
	description = "Ладно, я все же помогу тебе.";
};


func int DIA_DiegoNW_HelpYou_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_HelpDiegoNW == LOG_FAILED) && (Diego_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//Ладно, я все же помогу тебе.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//Я знал это.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//Давай перейдем сразу к делу.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//Хорошо! Я спрятал золото в Долине Рудников, и ты должен забрать его оттуда для меня.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//А я буду ждать здесь и все подготовлю для дальнейших действий.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();
	MIS_HelpDiegoNW = LOG_Running;
	Log_CreateTopic(TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW,LOG_Running);
	B_LogEntry(TOPIC_HelpDiegoNW,"Золото Диего находится в Долине Рудников. Оно нужно ему, чтобы попасть в верхнюю часть города, и он попросил меня найти это золото.");
};

instance DIA_DiegoNW_HaveYourGold(C_Info)
{
	npc = PC_Thief_NW;
	nr = 31;
	condition = DIA_DiegoNW_HaveYourGold_Condition;
	information = DIA_DiegoNW_HaveYourGold_Info;
	permanent = TRUE;
	description = "Я нашел твое золото.";
};


func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if(((OpenedDiegosBag == TRUE) || (Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)) && (MIS_HelpDiegoNW == LOG_Running) && (Diego_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Очень хорошо. Пусть Гербрандт теперь дрожит от страха.
};


var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//Я нашел твое золото.
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Отлично! Покажи.

	if(Npc_HasItems(other,ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other,self,ItSe_DiegosTreasure_Mis,1);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	}
	else if(Npc_HasItems(other,ItMi_Gold) < DiegosTreasure)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//Но здесь не все! Ты что, не доверяешь мне? Мне нужна вся сумма.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//Если мой план сработает, золота останется достаточно и для тебя.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//Так что, пожалуйста, принеси всю сумму. Это очень важно!
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_Gold,DiegosTreasure);
		b_diegonw_diegosrevenge();
		DiegosRevenge = TRUE;
	};
	if((Npc_IsDead(Gerbrandt) == FALSE) && (DiegosRevenge == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Послушай, я все еще не договорился со стражей.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//Я хочу, чтобы ты отнес это письмо Гербрандту. Это один из торговцев в верхнем квартале.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Передай ему привет от меня. А затем встретимся перед домом Гербрандта.
		CreateInvItems(self,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
		B_StartOtherRoutine(Gerbrandt,"WaitForDiego");
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_Running;
		B_GivePlayerXP(XP_HelpDiegoNW);
		Log_CreateTopic(TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence,LOG_Running);
		B_LogEntry(TOPIC_DiegosResidence,"Диего дал мне письмо для торговца Гербрандта.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DiegoNW_DeliveredLetter(C_Info)
{
	npc = PC_Thief_NW;
	nr = 30;
	condition = DIA_DiegoNW_DeliveredLetter_Condition;
	information = DIA_DiegoNW_DeliveredLetter_Info;
	permanent = FALSE;
	description = "Я доставил твое письмо.";
};


func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (MIS_DiegosResidence == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//Я доставил твое письмо.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Очень хорошо. Как Гербрандт воспринял это?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//Он был в шоке и моментально исчез куда-то.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(удовлетворенно) Я так и думал.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//Боюсь, правда, что в первую очередь мне придется заняться обстановкой моего нового дома. Если я правильно помню, вкус у Гербрандта просто ужасный.
	B_GivePlayerXP(XP_DiegoHasANewHome);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Как тебе удалось провернуть это?",DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Значит, это теперь твой дом?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//Что насчет Гербрандта?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//Он наслаждался беззаботной жизнью слишком долго.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//Он жил здесь, купаясь в роскоши, когда я питался похлебкой из мясных жуков.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//Понятия не имею, куда он сбежал отсюда, но он больше не осмелится появиться в Хоринисе вновь - я позабочусь об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//Если ты ищешь его, попробуй пошарить в портовом квартале.
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//Значит, это теперь твой дом?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Да, от погреба до чердака! Со всей мебелью!
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Я столько лет провел в невыносимых условиях и теперь мечтаю о том, как я буду спать в огромной кровати с балдахином.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//А потом, на завтрак, я буду есть превосходный окорок и запивать его дорогим вином.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//Да, ты своего не упустишь.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//Точно.
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//Как тебе удалось провернуть это?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Ты думаешь, Гербрандт заработал свое состояние на честном бизнесе?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Конечно, он никогда не марал руки, когда доходило до грязных дел. У него для этого был помощник.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//На моей совести тогда много чего было. Гербрандт, в конце концов, решил избавиться от меня. Вероятно, он опасался, что я знаю слишком много.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//Ты никогда не говорил мне об этом.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//А ты никогда и не спрашивал.
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,Dialog_Back,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Что насчет моей доли?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter,"Что насчет Гербрандта?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//Что насчет моей доли?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Похоже, ты ничего не забыл из того, чему я учил тебя.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//Но ты прав, у меня ничего бы не вышло без твоей помощи. Вот твоя доля.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};


var int Diego_Teach;

instance DIA_DiegoNW_CanYouTeach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_CanYouTeach_Condition;
	information = DIA_DiegoNW_CanYouTeach_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Ты можешь научить меня чему-нибудь?
	if(Npc_KnowsInfo(other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Да, конечно. Дай мне знать, когда будешь готов.
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//Сначала мне нужно решить свои проблемы.
	};
};


var int DiegoNW_Merke_DEX;

instance DIA_DiegoNW_Teach(C_Info)
{
	npc = PC_Thief_NW;
	nr = 995;
	condition = DIA_DiegoNW_Teach_Condition;
	information = DIA_DiegoNW_Teach_Info;
	permanent = TRUE;
	description = "Научи меня.";
};


func int DIA_DiegoNW_Teach_Condition()
{
	if((Diego_IsOnBoard == FALSE) && (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Обучи меня.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//Я могу научить тебя, как стать более ловким.
	DiegoNW_Merke_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if(DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//Ты уже стал более ловким. Так держать!
	};
	Info_ClearChoices(DIA_DiegoNW_Teach);
};

func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach,Dialog_Back,DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_DiegoNW_TeachDEX_5);
};


instance DIA_DiegoNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_KnowWhereEnemy_Condition;
	information = DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я собираюсь покинуть Хоринис.";
};


func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Diego_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//Я собираюсь покинуть Хоринис.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//Мудрое решение. Я был бы не прочь отправиться с тобой. Этот город изменился слишком быстро - времена, когда здесь можно было разбогатеть, уже в прошлом.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//Я мог бы научить тебя метко стрелять, пользоваться отмычками и мог бы повысить твою ловкость.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Также, я уверен, тебе не помешает хороший вор.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Конечно же, Диего готов пойти со мной. Ему кажется, что чем скорее он покинет Хоринис, тем лучше. Он мог бы научить меня, как стать более ловким и сделать из меня отличного лучника. Также он может научить меня пользоваться отмычками.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//Я подумаю над этим. Но пока моя команда полностью укомплектована.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Не торопись. Я все равно никуда не денусь.
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Возможно, я дам тебе знать, когда придет время.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy,"Ты не хочешь присоединиться?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Пойдем с нами. Мы собираемся в порту.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Хм. Ты прав, Хоринис это дыра. Я пойду с тобой.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Подожди, я буду готов через минуту.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Ну, я готов. Встретимся у корабля.
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Возможно, я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//Попробуй. И, возможно, Я даже присоединюсь к тебе. Кто знает?
	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};


instance DIA_DiegoNW_LeaveMyShip(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_LeaveMyShip_Condition;
	information = DIA_DiegoNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Ты должен заботиться о городе.";
};


func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if((Diego_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//Ты должен заботиться о городе.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Да? Я тебе больше не нужен? Ох, ладно. Не забудь заглянуть ко мне, когда вернешься в город.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//Ты думаешь, мы еще встретимся?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//Я никогда не забуду выражение твоего лица, когда ты лежал на земле после того, как Буллит вырубил тебя. Тогда мы встретились в первый раз.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//Им никогда не одолеть тебя. Мы ОБЯЗАТЕЛЬНО встретимся снова. Береги себя.
	Diego_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DiegoNW_StillNeedYou(C_Info)
{
	npc = PC_Thief_NW;
	nr = 55;
	condition = DIA_DiegoNW_StillNeedYou_Condition;
	information = DIA_DiegoNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся. Я хочу, чтобы ты сопровождал меня.";
};


func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if(((Diego_IsOnBoard == LOG_OBSOLETE) || (Diego_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Возвращайся. Я хочу, чтобы ты сопровождал меня.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//Где осталась твоя решительность, мой друг? Конечно же, я пойду с тобой, если ты знаешь, чего ты хочешь.
	Diego_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Подожди, я буду готов через минуту.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,ITAR_Diego,1);
		AI_EquipArmor(self,ITAR_Diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//Отлично, мы можем идти.
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

instance DIA_DIEGONW_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_kapitelorcattack_condition;
	information = dia_diegonw_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Похоже, что весь город занят орками.";
};


func int dia_diegonw_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (THIEFBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_00");	//Похоже, что весь город занят орками.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_01");	//(печально) Похоже, для людей настали тяжелые времена! Многие уже погибли, многие еще погибнут...
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_03");	//И что будем делать?
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_04");	//(удивленно) Как что? Пробовать каким-то образом выбраться из этой ловушки.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_05");	//Хотя, если смотреть на вещи реально, шансов у нас немного.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_06");	//Или можно дождаться, пока орки сами сюда нагрянут - тогда уж точно ничего делать не придется.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_07");	//Не думаю, что эта идея придется тебе по вкусу.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_08");	//И правильно думаешь. Так что лучше уж самому пожаловать к ним в гости.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_09");	//Хочешь сказать, что собираешься сам атаковать орков?
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_10");	//Ты правильно понял.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_11");	//Но это же чистой воды безумие!
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_12");	//Может и так...(задумчиво) Однако орки наверняка не ожидают от нас подобного шага - поэтому мой план может сработать.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_01_13");	//А если он не сработает?
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_01_14");	//Тогда... эээ...(вздыхает) Поверь, этим тварям придется хорошенько попотеть, чтобы достать меня!
	Info_ClearChoices(dia_diegonw_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_diegonw_nw_kapitelorcattack,"(предложить руну телепортации к таверне)",dia_diegonw_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_diegonw_nw_kapitelorcattack,"В этом я не сомневаюсь.",dia_diegonw_nw_kapitelorcattack_nogiverune);
};

func void dia_diegonw_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_01");	//У меня с собой руна телепортации к таверне Орлана.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_02");	//С ее помощью ты можешь убраться отсюда.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_05");	//Что ж, пожалуй, я воспользуюсь твоим предложением.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_07");	//Давай ее сюда.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_08");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_09");	//Ну что же, спасибо! Теперь я у тебя в неоплатном долгу.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_11");	//Увидимся позже.
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_Taverne_01_12");	//Хорошо.
	THIEFNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Диего руну телепортации к таверне 'Мертвая Гарпия'. Думаю, теперь ему ничего не угрожает.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_diegonw_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_01");	//В этом я не сомневаюсь. Как и в том, что несмотря на все, мы еще встретимся.
	AI_Output(self,other,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Как в старые добрые времена, да? (смеется) Конечно, приятель - обязательно встретимся!
	AI_Output(other,self,"DIA_DiegoNW_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Тогда до встречи! Береги себя.
	B_LogEntry(TOPIC_HELPCREW,"Диего решил сам атаковать орков и застать их врасплох. Он полагает, что это может сработать. Хотя насколько я знаю Диего - этот парень никогда не делает необдуманных поступков.");
	THIEFBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_ESCAPE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_escape_condition;
	information = dia_diegonw_nw_escape_info;
	permanent = FALSE;
	description = "Рад тебя видеть живым и здоровым!";
};


func int dia_diegonw_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Diego_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_01");	//Рад тебя видеть живым и здоровым!
	AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_02");	//Я тебя тоже!
	AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_03");	//Так значит, вам удалось прорваться через город?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_04");	//Мне, как видишь, удалось. Однако не всем так повезло.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_05");	//Многих орки взяли в плен! Что с ними теперь будет - одному только Инносу известно.
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я повстречался с Диего - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда, не обошлось и без плохих. Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Надеюсь, они еще живы.");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_06");	//Многих из нас орки взяли в плен! Есть и те, кто погиб, сражаясь с ними.
			B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я повстречался с Диего - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда, не обошлось и без плохих. Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Есть и те, кто погиб.");
		};
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_07");	//Да, это не очень хорошие новости.
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_08");	//Это было очевидно. И с этим ничего уже не поделаешь.
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_09");	//Понимаю.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_10");	//Как видишь. И, насколько мне известно, это удалось всем, кто был тогда на корабле.
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_11");	//Да это просто отличные новости!
		AI_Output(self,other,"DIA_DiegoNW_NW_Escape_01_12");	//Я с тобой согласен...(улыбаясь) Даже и не знаю, кого благодарить за столь чудесное спасение.
		AI_Output(other,self,"DIA_DiegoNW_NW_Escape_01_13");	//Это точно.
		B_LogEntry(TOPIC_HELPCREW,"На ферме Онара я повстречался с Диего - живым и здоровым. Остальным парням также удалось выбраться из города.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_DIEGONW_NW_GATHERARMY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmy_condition;
	information = dia_diegonw_nw_gatherarmy_info;
	permanent = FALSE;
	description = "Ты будешь сражаться с орками?";
};


func int dia_diegonw_nw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (ALLGUARDIANSKILLED == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_00");	//Ты будешь сражаться с орками?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_01");	//Почему бы и нет? Только для этого нам понадобится целая армия. Она у тебя есть?
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_02");	//Насчет армии не уверен, но точно знаю, что паладины уже готовы выступить против них.
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_03");	//И им наверняка бы пригодилась помощь такого человека, как ты.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_04");	//Это, конечно, хорошая новость. Однако, боюсь, что этого будет недостаточно.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_05");	//У них просто не хватит сил, чтобы остановить всех этих тварей, и печальный опыт Хориниса это уже показал.
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_06");	//Но если мы все объединимся, то ситуация будет уже несколько другой.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_08");	//Хммм...(задумчиво) Если это случится, то ты прав. Тогда у нас действительно будет призрачный шанс победить в этой войне.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_09");	//Но в любом случае, насчет меня ты можешь не сомневаться. Я всегда готов поддержать твои самые немыслимые идеи.
	OTH_JOINHAGEN = TRUE;
	if(MIS_OLDGUARDGOWAR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_10");	//Особенно теперь, когда со мной мои парни из Старого лагеря. На них можно положиться!
	}
	else if(REFUSEHELPCAVALORN == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_11");	//Хотя, конечно, мне было бы спокойнее, если бы со мной в одном ряду стояли более надежные люди. Те, на которых я мог бы положиться!
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_12");	//А этим заносчивым паладинам я не слишком хорошо доверяю.
		AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_13");	//Кого именно ты имеешь в виду?
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_14");	//Хммм...(задумчиво) Ну, хотя бы кого-то из тех парней, что раньше были со мной в Старом лагере.
		AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmy_01_15");	//Мы многое тогда пережили, и жизнь приучила нас всегда держаться вместе в трудные минуты.
		AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmy_01_17");	//Понятно.
		MIS_DIEGOOLDFRIENS = LOG_Running;
		Log_CreateTopic(TOPIC_DIEGOOLDFRIENS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_Running);
  		B_LogEntry(TOPIC_DIEGOOLDFRIENS,"Кажется, Диего согласен сражаться с орками на стороне паладинов. Однако он предпочел бы, чтобы его спину прикрывали более надежные люди - те, кому он доверяет.");
	}
	else
	{
		B_StartOtherRoutine(thorus_nw,"KillHim");
		B_StartOtherRoutine(scatty_nw,"KillHim");
		AI_Teleport(vlk_6022_thorus,"NW_FARM2_PATH_SCATTY");
		AI_Teleport(vlk_6024_scatty,"NW_FARM2_PATH_01");
		B_KillNpc(vlk_6022_thorus);
		B_KillNpc(vlk_6024_scatty);
		b_killnpccannodead(BAU_4300_Addon_Cavalorn);
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_01");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_02");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_03");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_04");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_05");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_06");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_07");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_08");
		Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCAKIL_09");
		Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCAKIL_10");
		ORCAKILINSERTED = TRUE;
	};
};


instance DIA_DIEGONW_NW_GATHERARMYDONE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 3;
	condition = dia_diegonw_nw_gatherarmydone_condition;
	information = dia_diegonw_nw_gatherarmydone_info;
	permanent = FALSE;
	description = "Как насчет Кавалорна?";
};


func int dia_diegonw_nw_gatherarmydone_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_SUCCESS) && (MIS_DIEGOOLDFRIENS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_gatherarmydone_info()
{
	var int ths;
	var int sct;
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_00");	//Как насчет Кавалорна?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_01");	//(задумчиво) Да, этому человеку я бы доверил свою жизнь.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_02");	//С ним мне довелось через многое пройти.
	if((THORUSINSERTED == TRUE) && (THORUSJOINME == TRUE) && !Npc_IsDead(vlk_6022_thorus))
	{
		ths = TRUE;
	};
	if((SCATTYINSERTED == TRUE) && (SCATTYJOINME == TRUE) && !Npc_IsDead(vlk_6024_scatty))
	{
		sct = TRUE;
	};
	if((sct == TRUE) || (ths == TRUE))
	{
		if((sct == TRUE) && (ths == TRUE))
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_03");	//Кроме этого, Скатти и Торус тоже тут.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_04");	//Отлично! На этих парней тоже можно положиться.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_05");	//И они не раз это доказывали.
		}
		else if((sct == TRUE) && (ths == FALSE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_06");	//И Скатти тоже тут.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_07");	//Хорошо! На этого парня тоже можно положиться.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_08");	//И он не раз это доказывал.
		}
		else if((sct == FALSE) && (ths == TRUE))
		{
			B_GivePlayerXP(100);
			AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_09");	//И Торус тоже тут.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_10");	//Хорошо! На этого парня тоже можно положиться.
			AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_11");	//И он не раз это доказывал.
		};
	}
	else
	{
		B_GivePlayerXP(300);
	};
	AI_Output(other,self,"DIA_DiegoNW_NW_GatherArmyDone_01_12");	//Теперь проблема с надежными людьми решена?
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_13");	//Да. Спасибо тебе за помощь.
	AI_Output(self,other,"DIA_DiegoNW_NW_GatherArmyDone_01_14");	//И не забудь...(ехидно) Когда соберешься выступить против орков, скажи нам об этом.
	MIS_DIEGOOLDFRIENS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DIEGOOLDFRIENS,LOG_SUCCESS);
	B_LogEntry(TOPIC_DIEGOOLDFRIENS,"Теперь рядом с Диего есть люди, которым он может доверять.");
};


instance DIA_DIEGONW_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_soonbattlenow_condition;
	information = dia_diegonw_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Ты нервничаешь?";
};


func int dia_diegonw_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_soonbattlenow_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_SoonBattleNow_01_00");	//Ты нервничаешь?
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_01");	//Нет, просто вся эта неопределенность чертовски достает!
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_02");	//Уж поскорей бы орки начали шевелить своими задницами. А то сидишь тут и не знаешь, чего от них ожидать!
	AI_Output(other,self,"DIA_DiegoNW_NW_SoonBattleNow_01_03");	//Полагаю, что скоро все прояснится.
	AI_Output(self,other,"DIA_DiegoNW_NW_SoonBattleNow_01_04");	//Надеюсь, приятель.
};


instance DIA_DIEGONW_NW_BATTLEWIN(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_battlewin_condition;
	information = dia_diegonw_nw_battlewin_info;
	permanent = FALSE;
	description = "Мы выиграли этот бой!";
};


func int dia_diegonw_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DiegoNW_NW_BattleWin_01_00");	//Мы выиграли этот бой!
	AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_01");	//(серьезно) Да, приятель. Полагаю, что орки надолго запомнят этот день.
	AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_02");	//Хотя и цена, которую нам пришлось заплатить за эту победу, довольно высока.
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_03");	//Однако с этим уже ничего не поделаешь. Теперь нам надо решить, что делать дальше.
		AI_Output(other,self,"DIA_DiegoNW_NW_BattleWin_01_04");	//У тебя есть мысли на этот счет?
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_05");	//Полагаю, главное, что сейчас для нас важно - это не переоценить значимость данного успеха.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_06");	//Все-таки большая часть острова до сих пор находится во власти этих кровожадных тварей.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_09");	//Нам не следует останавливаться на достигнутом.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_10");	//Нужно воспользоваться моментом и добить врага, пока он не пришел в себя.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_11");	//Я уверен, что ты знаешь, как поступить. Ведь тебе не раз приходилось бывать в подобной ситуации.
		AI_Output(self,other,"DIA_DiegoNW_NW_BattleWin_01_12");	//К тому же, думаю, многие согласятся помочь тебе в этом. В том числе и я.
	};
};


instance DIA_DIEGONW_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_goonorkshunt_condition;
	information = dia_diegonw_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Ты обещал мне помочь!";
};


func int dia_diegonw_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (DIEGOTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_diegonw_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_DiegoNW_NW_GoOnOrksHunt_01_00");	//Ты обещал мне помочь.
	AI_Output(self,other,"DIA_DiegoNW_NW_GoOnOrksHunt_01_01");	//Выкладывай, что ты задумал?
	AI_Output(other,self,"DIA_DiegoNW_NW_GoOnOrksHunt_01_02");	//Пора показать этим тварям, кто тут хозяин!
	AI_Output(self,other,"DIA_DiegoNW_NW_GoOnOrksHunt_01_03");	//Вот это другое дело, парень! Можешь на меня рассчитывать.
	DIEGOJOINMEHUNT = TRUE;
};


instance DIA_DIEGONW_NW_FOLLOWME(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_followme_condition;
	information = dia_diegonw_nw_followme_info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int dia_diegonw_nw_followme_condition()
{
	if((DIEGOJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_followme_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_FollowMe_01_00");	//Иди за мной!
	AI_Output(self,other,"DIA_DiegoNW_NW_FollowMe_01_01");	//Хорошо! Тогда вперед.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_NW_STOPHERE(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_diegonw_nw_stophere_condition;
	information = dia_diegonw_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_diegonw_nw_stophere_condition()
{
	if((DIEGOJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_nw_stophere_info()
{
	AI_Output(other,self,"DIA_DiegoNW_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other,"DIA_DiegoNW_NW_StopHere_01_01");	//Хорошо! Если я тебе еще понадоблюсь, ты знаешь где меня искать.
	Npc_ExchangeRoutine(self,"OrcAtcNW");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_THIEF_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_allgreatvictory_condition;
	information = dia_thief_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Проблемы с орками остались в прошлом.";
};


func int dia_thief_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Thief_NW_AllGreatVictory_01_00");	//Проблемы с орками остались в прошлом.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_01");	//Что же, отлично! (улыбаясь) По крайней мере, хотя бы здесь теперь будет спокойно.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_02");	//Однако, полагаю, ты и сам прекрасно понимаешь, что это далеко еще не конец.
	AI_Output(self,other,"DIA_Thief_NW_AllGreatVictory_01_03");	//Скорее всего, лишь небольшая передышка перед лицом вновь надвигающейся угрозы.
	AI_Output(other,self,"DIA_Thief_NW_AllGreatVictory_01_04");	//Скоро мы это узнаем.
};


instance DIA_THIEF_NW_WHATDONOW(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_whatdonow_condition;
	information = dia_thief_nw_whatdonow_info;
	permanent = FALSE;
	description = "И что теперь?";
};


func int dia_thief_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (DIEGOTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_thief_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_00");	//И что теперь?
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_01");	//Это должен решить ты.
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_02");	//Ведь именно тебе никогда не сидится на одном месте.
	AI_Output(self,other,"DIA_Thief_NW_WhatDoNow_01_03");	//Я же, как всегда, буду присматривать за тобой, чтобы ты опять не влип в какую-нибудь скверную историю.
	AI_Output(other,self,"DIA_Thief_NW_WhatDoNow_01_05");	//Хорошо.
};


instance DIA_THIEF_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Thief_NW;
	nr = 1;
	condition = dia_thief_nw_travelonbigland_condition;
	information = dia_thief_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Ты готов отправиться вместе со мной?";
};


func int dia_thief_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thief_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_00");	//Ты готов отправиться вместе со мной?
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_01");	//(лукаво) Куда только пожелаешь, приятель!
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_02");	//Тогда мы плывем на материк. Мне необходимо срочно передать сообщение королю.
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_03");	//Вот это уже другое дело! Теперь будет чем заняться. Когда выступаем?
	AI_Output(other,self,"DIA_Thief_NW_TravelOnBigLand_01_04");	//Корабль стоит в гавани, и уже готов к отплытию.
	AI_Output(self,other,"DIA_Thief_NW_TravelOnBigLand_01_05");	//Хорошо. Считай, что я уже там.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	DIEGOTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Диего долго упрашивать не пришлось! Он с радостью согласился отправиться вместе со мной.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_Thief_NW_PICKPOCKET(C_Info)
{
	npc = PC_Thief_NW;
	nr = 998;
	condition = DIA_Thief_NW_PICKPOCKET_Condition;
	information = DIA_Thief_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(120,600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,Dialog_Back,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};
