instance DIA_SEK_169_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_169_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_169_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_169_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_169_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_169_SLAVEOBSSEK_hallo_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_169_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KnowWhoRebels == FALSE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_hallo_info()
{
	var int randy;

	randy = Hlp_Random(3);

	if(randy == 0)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_00");	//Оставь меня в покое!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_01");	//Что тебе нужно от меня? Оставь меня в покое!
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_SEK_169_STANDARD_13_02");	//Мы все умрем здесь!
	};

	AI_StopProcessInfos(self);
};


instance DIA_SEK_169_SLAVEOBSSEK_REBELS(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_REBELS_condition;
	information = dia_SEK_169_SLAVEOBSSEK_REBELS_info;
	permanent = FALSE;
	description = "Я слышал, что ты готовишь побег.";
};

func int dia_SEK_169_SLAVEOBSSEK_REBELS_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (KnowWhoRebels == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_REBELS_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_01");	//Я слышал, что ты готовишь побег.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_02");	//Ты что-то путаешь. Я ничего подобного не делал.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_03");	//Отпираться бессмысленно! Один из рабов сдал тебя.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_04");	//Черт! Я так и знал, что это когда-нибудь случится. (злобно) Ну, и что ты от меня хочешь?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_05");	//Я просто хочу помочь.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_06");	//Ты? (удивленно) И с чего вдруг послушнику Теней помогать рабам?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_07");	//(приспуская маску) Идол Намиб и другие Гуру очень обеспокоены недавней пропажей послушников.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_08");	//Идол Намиб?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_09");	//(удивленно) Так ты из...
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_10");	//Не надо лишних слов. Думаю, ты все прекрасно понял.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_REBELS_01_11");	//Ну, раз такое дело...(озадаченно) Тогда, наверно, тебе можно доверять.
	B_LogEntry(TOPIC_RebelSlave,"Я отыскал Мариуса. Судя по всему, он действительно замышляет бунт против своих хозяев, и я, будучи на его стороне, решил ему с этим помочь. Но возникает вопрос: что мне тогда сказать Осаиру?");
	RebelsTrust = TRUE;
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info;
	permanent = FALSE;
	description = "Расскажи мне, что ты задумал.";
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_01");	//Расскажи мне, что ты задумал.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_02");	//Для начала нам нужно оружие...(тихо) Это главное.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_03");	//Без него мы мало что сможем противопоставить хорошо обученным бойцам Масиафа.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_04");	//На мой взгляд, оно вам не поможет. Любой из бойцов Масиаф с легкостью перебьет вас всех.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_05");	//Эх...(вздыхая) По правде говоря, я это и сам знаю.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_06");	//Но без оружия вряд ли кто-нибудь из рабов захочет выступить против Теней.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_07");	//А без этого сама мысль о побеге просто невозможна.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_08");	//Если у нас и есть шанс одолеть их, то только вместе и сообща!
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_09");	//Понимаю. А ты уже пытался достать оружие?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_10");	//Пытался, но сделать это не так-то просто. За мной постоянно следят.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_11");	//Может, тогда мне попробовать достать его для вас?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_12");	//(задумчиво) А сможешь?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_13");	//Я постараюсь. Уж мне-то сделать это будет попроще, чем вам.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_14");	//Хорошо! Тогда нам нужно как минимум три связки оружия. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_01_15");	//Полагаю, этого хватит, чтобы вооружить всех нас.
	MIS_RebelsWeapon = LOG_Running;
	Log_CreateTopic(TOPIC_RebelsWeapon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_Running);
	B_LogEntry(TOPIC_RebelsWeapon,"Мариус попросил меня достать три связки оружия, чтобы вооружить рабов.");
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_info;
	permanent = FALSE;
	description = "Осаир требует голову зачинщика.";
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_condition()
{
	if((MIS_RebelSlave == LOG_Running) && (RebelsTrust == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_01");	//Осаир требует голову зачинщика.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_02");	//Неудивительно. В последнее время все рабы ведут себя очень нервозно и взволнованно.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_03");	//И все из-за того, что я постоянно пытаюсь вселить в них надежду на спасение.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_04");	//И как же нам тогда быть?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_05");	//А, может, ты просто скажешь ему, что не нашел такого?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_06");	//Не уверен, что это сработает. Осаир не настолько глуп, чтобы в это поверить. 
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_07");	//И вряд ли он успокоится, пока не найдет тебя.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_08");	//Тогда что ты предлагаешь?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_09");	//А что если тот, кто тебя предал, и станет этим человеком?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_11");	//Я даже не знаю, что тебе сказать на это...
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_12");	//А тебе не кажется, что это будет слишком жестокое наказание за его поступок?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_13");	//Ну, если ты так печешься о нем, я могу рассказать Осаиру про тебя. И тогда...
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_14");	//Ладно, ладно...(взволнованно) Можешь дальше не продолжать. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_15");	//Хорошо. Пусть это останется на моей совести, но наше дело куда важней.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_01_16");	//Нам всем будет куда проще, если Осаир сочтет, что покончил с заговорщиком.
	BetrayFound = TRUE;
	B_LogEntry(TOPIC_RebelSlave,"Мы с Мариусом решили выдать Осаиру раба, предавшего его. Тем самым с него будут сняты все подозрения, а Осаир, расправившись с зачинщиком, успокоится и потеряет бдительность.");
};

instance DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition;
	information = dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info;
	permanent = FALSE;
	description = "Здесь три связки оружия.";
};

func int dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_condition()
{
	if((MIS_RebelsWeapon == LOG_Running) && (Npc_HasItems(other,ItSe_Weapon_Sack) >= 3))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_01");	//Здесь три связки оружия.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_02");	//Тише, тише...(шепотом) Давай их быстрее.
	B_GiveInvItems(other,self,ItSe_Weapon_Sack,3);
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_03");	//Я спрячу их в надежном месте, пока мы не будем готовы.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_RebelsTrust_Done_01_04");	//Благодарю за помощь.
	MIS_RebelsWeapon = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RebelsWeapon,LOG_SUCCESS);
	B_LogEntry(TOPIC_RebelsWeapon,"Я принес Мариусу три связки оружия.");
};

instance DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Death(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 2;
	condition = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition;
	information = dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info;
	permanent = FALSE;
	description = "Предатель получил по заслугам.";
};

func int dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_condition()
{
	if((MIS_RebelSlave == LOG_SUCCESS) && (Npc_IsDead(SEK_156_SLAVEOBSSEK) == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_OsairNeed_Death_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_01");	//Предатель получил по заслугам.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_02");	//(сочувственно) Надеюсь, он не долго мучался?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_03");	//Нет. Осаир прикончил его одним ударом.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_04");	//Знаешь, мне от этого как-то не по себе.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_05");	//Успокойся. Зато теперь ты можешь спокойно готовить свой побег, и никто тебя не заподозрит.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_OsairNeed_Done_01_06");	//Надеюсь, что ты прав, и это жертва была не напрасной.
	AI_StopProcessInfos(self);
};

instance DIA_SEK_169_SLAVEOBSSEK_WhenRun(C_Info)
{
	npc = SEK_169_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_169_SLAVEOBSSEK_WhenRun_condition;
	information = dia_SEK_169_SLAVEOBSSEK_WhenRun_info;
	permanent = FALSE;
	description = "Когда ты задумал побег?";
};

func int dia_SEK_169_SLAVEOBSSEK_WhenRun_condition()
{
	if(MIS_RebelsWeapon == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_SEK_169_SLAVEOBSSEK_WhenRun_info()
{
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_01");	//Когда ты задумал побег?
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_02");	//Еще не знаю. Но, думаю, что слишком затягивать с этим не стоит.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_03");	//Иначе мы все передохнем тут от голода... или от побоев.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_04");	//Просто у меня для тебя не очень приятная новость. 
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_05");	//Что еще такое?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_06");	//Единственный проход из долины был завален камнепадом. Так что на твоем месте я бы не спешил с побегом.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_08");	//Ты серьезно? Проклятье. Это совершенно не входило в мои планы.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_09");	//Но постой, тогда каким же образом Тени постоянно уходят из долины и возвращаются обратно с новыми рабами?
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_10");	//Это мне еще предстоит выяснить. Но, пока мы это не узнаем, вам не стоит затевать ничего серьезного.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_12");	//Да, ты прав. Ладно. Мне пора работать.
	AI_Output(self,other,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_13");	//Если Тени увидят, что я болтаю, вместо того чтобы мести пол, - они изобьют меня до полусмерти.
	AI_Output(other,self,"DIA_SEK_169_SLAVEOBSSEK_WhenRun_01_14");	//Хорошо, еще увидимся.
	AI_StopProcessInfos(self);
};