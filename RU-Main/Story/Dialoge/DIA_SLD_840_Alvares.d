
instance DIA_Alvares_EXIT(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 999;
	condition = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_HAUAB(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_HAUAB_Condition;
	information = DIA_Alvares_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_HAUAB_Info()
{
	Akils_SLDStillthere = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//Что бы ни привело тебя сюда - тебе лучше забыть об этом и убраться подальше.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Фермеру Акилу угрожают наемники.");
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_ATTACK(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 6;
	condition = DIA_Alvares_ATTACK_Condition;
	information = DIA_Alvares_ATTACK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_ATTACK_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alvares_HAUAB) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_ATTACK_Info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Эй, ты все еще здесь. Я дам тебе выбор, чужак - проваливай или умри!
	Info_ClearChoices(DIA_Alvares_ATTACK);
	Info_AddChoice(DIA_Alvares_ATTACK,"Кто вы такие, парни - пара клоунов?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice(DIA_Alvares_ATTACK,"Я хочу присоединиться к вам, наемникам.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice(DIA_Alvares_ATTACK,"Вы, парни, сейчас исчезнете отсюда!",DIA_Alvares_ATTACK_Witz);
	Info_AddChoice(DIA_Alvares_ATTACK,"Мне не нужны проблемы.",DIA_Alvares_ATTACK_Aerger);

	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		Info_AddChoice(DIA_Alvares_ATTACK,"Я просто пришел сюда за товаром.",DIA_Alvares_ATTACK_Lieferung);
	};
};

func void DIA_Alvares_ATTACK_Witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//Вы, парни, сейчас исчезнете отсюда. Все понятно?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//Смотри-ка, новый герой нарисовался - и очень глупый герой.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//Ты знаешь, о чем я думаю?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//Да кому какое дело, о чем ты думаешь?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//Я думаю, что хороший герой - это мертвый герой. Так что сделай мне одолжение - умри поскорее!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Кто вы такие, парни - пара клоунов?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//Ты правильно понял. И я буду продолжать смеяться, когда твой труп будет лежать в дорожной пыли.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(зовет) Энгардо, давай начинать! Ты берешь на себя фермера - а я разберусь с этим клоуном!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//Мне не нужны проблемы.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//А мы как раз ищем проблемы. Мы проделали долгий путь, чтобы найти их.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//Да, мы собираемся создать целую кучу проблем. И начну я с тебя, если ты сейчас же не свалишь отсюда.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//Я просто пришел сюда за товаром.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//И мы тоже. Но мы были здесь первыми. Так что проваливай, пока я не сделал тебе больно.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//Я хочу присоединиться к вам, наемникам.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Ох, правда? Тогда проваливай - или ты уже никогда не сможешь ни к кому присоединиться.
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_Schluss(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_Schluss_Condition;
	information = DIA_Alvares_Schluss_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_Schluss_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Alvares_Schluss_Info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//Я дал тебе шанс. Но, похоже, ты не прислушиваешься к здравому смыслу.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//Хорошо - значит, мне придется убить тебя. (зовет) Энгардо, давай, прикончим их!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_Alvares_PICKPOCKET(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 900;
	condition = DIA_Alvares_PICKPOCKET_Condition;
	information = DIA_Alvares_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alvares_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Alvares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,Dialog_Back,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

//--------------------------------Харим-------------------------------------------

instance DIA_Kharim_EXIT(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 999;
	condition = DIA_Kharim_EXIT_Condition;
	information = DIA_Kharim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Kharim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kharim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_PICKPOCKET(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 900;
	condition = DIA_Kharim_PICKPOCKET_Condition;
	information = DIA_Kharim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kharim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Kharim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
	Info_AddChoice(DIA_Kharim_PICKPOCKET,Dialog_Back,DIA_Kharim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kharim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kharim_PICKPOCKET_DoIt);
};

func void DIA_Kharim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

func void DIA_Kharim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

instance DIA_Kharim_Hello(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Hello_Condition;
	information = DIA_Kharim_Hello_Info;
	permanent = FALSE;
	description = "Рад тебя видеть, Харим!";
};

func int DIA_Kharim_Hello_Condition()
{
	return TRUE;
};

func void DIA_Kharim_Hello_Info()
{
	AI_Output(other,self,"DIA_Kharim_Hello_01_00");	//Рад тебя видеть, Харим!
	AI_Output(self,other,"DIA_Kharim_Hello_01_01");	//Что? Ты кто такой?
	AI_Output(other,self,"DIA_Kharim_Hello_01_02");	//Вспомни арену Скатти! Я провел там пару боев, в том числе и с тобой.
	AI_Output(self,other,"DIA_Kharim_Hello_01_03");	//(недоверчиво) На арене сражалось много народу. Разве всех упомнишь?
	AI_Output(self,other,"DIA_Kharim_Hello_01_04");	//Лучше напомни мне - как ты тогда смог вызвать меня на бой?
	Info_ClearChoices(DIA_Kharim_Hello);
	Info_AddChoice(DIA_Kharim_Hello,"Я сказал, что ты целовал задницу Гомезу.",DIA_Kharim_Hello_Ok);
	Info_AddChoice(DIA_Kharim_Hello,"Я назвал тебя трусом!",DIA_Kharim_Hello_NoTwo);
	Info_AddChoice(DIA_Kharim_Hello,"Я просто вызвал тебя на бой.",DIA_Kharim_Hello_NoOne);
	Info_AddChoice(DIA_Kharim_Hello,"Я сказал, что твоя рожа ужасна!",DIA_Kharim_Hello_NoThree);
	Info_AddChoice(DIA_Kharim_Hello,"Я что-то сказал о твоих ручонках.",DIA_Kharim_Hello_NoFour);
};

func void DIA_Kharim_Hello_NoTwo()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoTwo_01_00");	//Я назвал тебя трусом!
	AI_Output(self,other,"DIA_Kharim_Hello_NoTwo_01_01");	//Что-то я такого не помню...
	AI_Output(self,other,"DIA_Kharim_Hello_NoTwo_01_02");	//Наверное, ты ошибся, приятель.
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoOne()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoOne_01_00");	//Я просто вызвал тебя на бой.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_01");	//Хммм... Не думаю, что оно так и было.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_02");	//Скорее всего, ты был простым рудокопом, который видел мои бои.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_03");	//Так что мы вряд ли знакомы. Извини!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoThree()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoThree_01_00");	//Я сказал, что твоя рожа ужасна!
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_01");	//(задумчиво) Что-то припоминаю, но не совсем.
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_02");	//Похоже, что ты все-таки ошибся, приятель.
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_03");	//Мы вряд ли знакомы. Извини!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoFour()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoFour_01_00");	//Я что-то сказал о твоих ручонках.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_01");	//(задумчиво) Я что-то не припоминаю такого.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_02");	//Похоже, что ты все-таки ошибся, приятель.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_03");	//Мы вряд ли знакомы. Извини!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_00");	//Я сказал, что ты целовал задницу Гомезу.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_01");	//Что?! А ну-ка повтори!
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_02");	//Судя по твоей реакции, сомнений в нашем знакомстве у тебя больше не возникает.
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_03");	//О да...(ухмыляясь) Теперь и я тебя вспомнил!
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_04");	//И тот бой рассудил нас.
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_05");	//Конечно. И как это всегда бывает, не прав был тот, кто грызет землю.
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_06");	//Ладно! Кто старое помянет - тому глаз долой...
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_07");	//(улыбаясь) И кстати - я тоже рад тебя видеть, приятель!
	Info_ClearChoices(DIA_Kharim_Hello);
};

instance DIA_Kharim_HAUAB(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 4;
	condition = DIA_Kharim_HAUAB_Condition;
	information = DIA_Kharim_HAUAB_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Kharim_HAUAB_Condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (KharimPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kharim_HAUAB_Info()
{
	AI_Output(self,other,"DIA_Kharim_HAUAB_01_00");	//(недовольно) Эй, отвали...
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_Escape(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Escape_Condition;
	information = DIA_Kharim_Escape_Info;
	permanent = FALSE;
	description = "Как тебе удалось выбраться из Старого лагеря?";
};

func int DIA_Kharim_Escape_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kharim_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kharim_Escape_Info()
{
	AI_Output(other,self,"DIA_Kharim_Escape_01_00");	//Как тебе удалось выбраться из Старого лагеря?
	AI_Output(self,other,"DIA_Kharim_Escape_01_01");	//Скатти как-то узнал, что затевает Гомез и успел предупредить нас с Гор Ханисом об опасности.
	AI_Output(self,other,"DIA_Kharim_Escape_01_02");	//Я чудом успел сбежать за ворота замка! Один из стражников даже успел выстрелить мне в спину из арбалета.
	AI_Output(self,other,"DIA_Kharim_Escape_01_03");	//Но видимо, крепкое похмелье не дало ему возможности прицелиться точнее.
};

instance DIA_Kharim_Cup(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Condition;
	information = DIA_Kharim_Cup_Info;
	permanent = FALSE;
	description = "Ты вспоминаешь об этом с некоторой досадой.";
};

func int DIA_Kharim_Cup_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kharim_Escape) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Info()
{
	AI_Output(other,self,"DIA_Kharim_Cup_01_00");	//Ты вспоминаешь об этом с некоторой досадой.
	AI_Output(self,other,"DIA_Kharim_Cup_01_01");	//Эх... Да все дело в моем золотом кубке.
	AI_Output(self,other,"DIA_Kharim_Cup_01_02");	//Я так быстро уносил ноги из Старого лагеря, что совсем позабыл о нем.
	AI_Output(other,self,"DIA_Kharim_Cup_01_03");	//Что это за кубок?
	AI_Output(self,other,"DIA_Kharim_Cup_01_04");	//Это награда, как самому сильному бойцу арены!
	AI_Output(self,other,"DIA_Kharim_Cup_01_05");	//Хоть он и получен из рук самого Гомеза, я берег его, как самую дорогую для меня вещь.
	AI_Output(self,other,"DIA_Kharim_Cup_01_06");	//Он напоминал мне о моих былых победах.
	AI_Output(self,other,"DIA_Kharim_Cup_01_07");	//Вдобавок, этот кубок отлит из чистого золота, и стоил бы тут немало денег.
	AI_Output(other,self,"DIA_Kharim_Cup_01_08");	//А почему бы тебе самому не отправиться туда и не забрать его?
	AI_Output(self,other,"DIA_Kharim_Cup_01_09");	//Я не уверен, что он до сих пор там. Все-таки вещица дорогая, и на нее позарился бы любой.
	AI_Output(self,other,"DIA_Kharim_Cup_01_10");	//К тому же проход в Долину Рудников охраняется паладинами, и Ли приказал нам охранять эту ферму.
	AI_Output(self,other,"DIA_Kharim_Cup_01_11");	//Так что я не могу уйти отсюда.
	AI_Output(self,other,"DIA_Kharim_Cup_01_12");	//Вот если бы кто-нибудь помог мне в этом - уж я бы его отблагодарил от всей души!
	MIS_KharimCup = LOG_Running;
	Log_CreateTopic(TOPIC_KharimCup,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Running);
	B_LogEntry(TOPIC_KharimCup,"Харим забыл в Старом лагере свой золотой кубок. Это был символ чемпиона арены, врученный ему лично Гомезом. Харим был бы не прочь его вернуть.");
};

instance DIA_Kharim_Cup_Done(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Done_Condition;
	information = DIA_Kharim_Cup_Done_Info;
	permanent = FALSE;
	description = "Кажется, я нашел твой кубок.";
};

func int DIA_Kharim_Cup_Done_Condition()
{
	if((MIS_KharimCup == LOG_Running) && (Npc_HasItems(other,ItMi_HarimCup) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_00");	//Кажется, я нашел твой кубок.
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_01");	//Ну-ка, дай мне взглянуть на него...
	B_GiveInvItems(other,self,ItMi_HarimCup,1);
	Npc_RemoveInvItems(self,ItMi_HarimCup,1);
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_02");	//Да, черт возьми, это он! Я никогда не забуду тот бой, когда получил его.
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_03");	//Теперь ты доволен?
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_04");	//Не то слово, приятель. Это все, что мне было нужно для счастья!
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_05");	//А что насчет обещанной награды?
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_06");	//Конечно! Вот, возьми этот рудный слиток.
	B_GiveInvItems(self,other,ItMi_OreStuck,1);
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_07");	//Беннет изготовил мне его из остатков магической руды, которую я принес из колонии.
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_08");	//И кто знает, возможно, он окажется для тебя куда ценнее, чем золото.
	MIS_KharimCup = LOG_Success;
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Success);
	B_LogEntry(TOPIC_KharimCup,"Харим был рад заполучить свой кубок обратно.");
};

//--------------------------------Роско-------------------------------------------

instance DIA_Roscoe_EXIT(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_EXIT_Condition;
	information = DIA_Roscoe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Roscoe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Roscoe_PICKPOCKET(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 900;
	condition = DIA_Roscoe_PICKPOCKET_Condition;
	information = DIA_Roscoe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Roscoe_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Roscoe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,Dialog_Back,DIA_Roscoe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Roscoe_PICKPOCKET_DoIt);
};

func void DIA_Roscoe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

func void DIA_Roscoe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

instance DIA_Roscoe_HAUAB(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 4;
	condition = DIA_Roscoe_HAUAB_Condition;
	information = DIA_Roscoe_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Roscoe_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_HAUAB_Info()
{
	AI_Output(self,other,"DIA_Roscoe_HAUAB_01_00");	//(недовольно) Что?
};

instance DIA_Roscoe_Hello(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_Hello_Condition;
	information = DIA_Roscoe_Hello_Info;
	permanent = FALSE;
	description = "Эй! Как твои дела, Роско?";
};

func int DIA_Roscoe_Hello_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_Hello_Info()
{
	AI_Output(other,self,"DIA_Roscoe_Hello_01_00");	//Эй! Как твои дела, Роско?
	AI_Output(self,other,"DIA_Roscoe_Hello_01_01");	//(недоверчиво) А мы что, разве знакомы?
	AI_Output(other,self,"DIA_Roscoe_Hello_01_02");	//Короткая же у тебя память, как я погляжу. 
	AI_Output(self,other,"DIA_Roscoe_Hello_01_03");	//Ах, ну да...(вглядываясь) Теперь я тебя, кажется, припоминаю.
	AI_Output(self,other,"DIA_Roscoe_Hello_01_04");	//Ты тот парень, что так настойчиво добивался аудиенции Лареса в Новом лагере.
	AI_Output(other,self,"DIA_Roscoe_Hello_01_05");	//Все еще работаешь на него?
	AI_Output(self,other,"DIA_Roscoe_Hello_01_06");	//Конечно! Я же был его телохранителем в колонии, и мы всегда хорошо ладили.
	AI_Output(self,other,"DIA_Roscoe_Hello_01_07");	//Да и потом, с Ларесом очень выгодно иметь дело. Он всегда знает больше, чем говорит.
};

instance DIA_Roscoe_WhatDo(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_WhatDo_Condition;
	information = DIA_Roscoe_WhatDo_Info;
	permanent = FALSE;
	description = "А что ты здесь делаешь?";
};

func int DIA_Roscoe_WhatDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_WhatDo_Info()
{
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_00");	//А что ты здесь делаешь?
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_01");	//Да так...(замявшись) Наблюдаю за всем происходящим вокруг.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_02");	//Зачем?
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_03");	//(ухмыляясь) Приятель, тут же проходят все дороги, ведущие в Долину Рудников и в саму глубь острова.
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_04");	//Отсюда легко можно проследить за паладинами и городским ополчением, если они вдруг здесь появятся.
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_05");	//К тому же Ларес иногда передает мне полезные сведения для Ли через местного бармена.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_06");	//Понимаю.
};

instance DIA_Roscoe_News(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_News_Condition;
	information = DIA_Roscoe_News_Info;
	permanent = TRUE;
	description = "Как обстановка?";
};

func int DIA_Roscoe_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_News_Info()
{
	AI_Output(other,self,"DIA_Roscoe_News_01_00");	//Как обстановка?

 	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_01");	//Все под контролем, приятель.
	}
	else if(MIS_RoscoeMage == FALSE)
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_02");	//Не очень. Кругом постоянно снуют эти странные существа в черных робах.
		AI_Output(self,other,"DIA_Roscoe_News_01_03");	//Они явно кого-то ищут. Вот только понять не могу, кого!
		AI_Output(other,self,"DIA_Roscoe_News_01_04");	//И много их тут прошло?
		AI_Output(self,other,"DIA_Roscoe_News_01_05");	//Я видел только одного. (нервно) Кажется, он шел по направлению к старому кладбищу, что находится тут недалеко, в лесу.
		AI_Output(self,other,"DIA_Roscoe_News_01_06");	//Теперь я стараюсь держаться подальше от того места.
		AI_Output(self,other,"DIA_Roscoe_News_01_07");	//У меня мурашки по коже от этих людей! Если это, конечно, люди.
		MIS_RoscoeMage = LOG_Running;
		Log_CreateTopic(TOPIC_RoscoeMage,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Running);
		B_LogEntry(TOPIC_RoscoeMage,"Роско напуган появлением людей в черных робах. По его словам, один из них отправился в сторону старого кладбища, что в лесу.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(DMT_1812_Dementor,"NW_FARM2_TO_TAVERN_09_MONSTER4");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
	}
	else
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_09");	//Бывало и лучше, приятель.
	};
};

instance DIA_Roscoe_RoscoeMage(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_RoscoeMage_Condition;
	information = DIA_Roscoe_RoscoeMage_Info;
	permanent = FALSE;
	description = "Я убил того мага.";
};

func int DIA_Roscoe_RoscoeMage_Condition()
{
	if((MIS_RoscoeMage == LOG_Running) && (RoscoeDMTIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_RoscoeMage_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Roscoe_RoscoeMage_01_01");	//Я убил того мага.
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_02");	//Хорошо. Туда ему и дорога!
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_03");	//А мне будет гораздо спокойней от этой мысли.
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_04");	//Вот, возьми за свои труды.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_Output(other,self,"DIA_Roscoe_RoscoeMage_01_05");	//Спасибо.
	MIS_RoscoeMage = LOG_Success;
	Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Success);
	B_LogEntry(TOPIC_RoscoeMage,"Роско вздохнул с облегчением, узнав о том, что темный маг мертв.");
};