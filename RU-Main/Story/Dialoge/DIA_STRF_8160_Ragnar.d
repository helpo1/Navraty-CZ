
var int RagnarPissOff;

instance DIA_STRF_8160_Ragnar_EXIT(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 999;
	condition = DIA_STRF_8160_Ragnar_exit_condition;
	information = DIA_STRF_8160_Ragnar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8160_Ragnar_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8160_Ragnar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_PreHello(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PreHello_condition;
	information = DIA_STRF_8160_Ragnar_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PreHello_01_00");	//Что, тоже пришел посмеяться надо мной? Давай, мне уже все равно.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_PreHello_01_01");	//О чем это ты говоришь?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PreHello_01_02");	//Я говорю - оставь меня! Дай мне уже умереть спокойно.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Hello(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Hello_condition;
	information = DIA_STRF_8160_Ragnar_Hello_info;
	permanent = FALSE;
	description = "Похоже, что у тебя проблемы, приятель.";
};

func int DIA_STRF_8160_Ragnar_Hello_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_PreHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Hello_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_01_00");	//Похоже, что у тебя проблемы, приятель.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_01");	//Проблемы? (ворчливо) Да что ты! У меня их вообще нет.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_02");	//Только если не считать того, что я беглый каторжник и уже почти неделю ничего не ел.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_01_03");	//Ну, вот видишь? Тебе определенно нужна моя помощь!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_01_04");	//Хммм...(с подозрением) А ты вообще сам кто такой будешь?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Я тоже сидел за барьером, как и ты.",DIA_STRF_8160_Ragnar_Hello_W1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Простой искатель приключений.",DIA_STRF_8160_Ragnar_Hello_W2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Это я разрушил барьер над колонией!",DIA_STRF_8160_Ragnar_Hello_W3);
};

func void DIA_STRF_8160_Ragnar_Hello_W1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W1_01_00");	//Я тоже сидел за барьером, как и ты.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W1_01_01");	//Правда?!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W1_01_02");	//Я слышал, что все беглые каторжане пошли либо в наемники, либо подались к бандитам.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Как видишь, я и есть наемник с фермы Онара.",DIA_STRF_8160_Ragnar_Hello_Q2);
	}
	else
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Это все не для меня!",DIA_STRF_8160_Ragnar_Hello_Q1);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"А я как раз и есть бандит.",DIA_STRF_8160_Ragnar_Hello_Q3);
};

func void DIA_STRF_8160_Ragnar_Hello_W2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W2_01_00");	//Я простой искатель приключений.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W2_01_01");	//Что же, тогда ты пришел не в то место, парень.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W2_01_02");	//Как видишь, тут нет никаких приключений.
};

func void DIA_STRF_8160_Ragnar_Hello_W3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_W3_01_00");	//Это я разрушил барьер над колонией!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_W3_01_01");	//Ну да, по тебе и видно.
};

func void DIA_STRF_8160_Ragnar_Hello_Q1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_00");	//Это все не для меня! Я предпочитаю не связываться ни с теми, ни с другими.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_01");	//А на твоем месте я бы лучше подался либо в город, либо в монастырь к магам Огня.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_02");	//Ну, или в крайнем случае, можно всегда отправиться в лагерь Братства.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q1_01_03");	//Им там всегда нужны новые послушники!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_04");	//О, нет. Только не к ним! Я этих придурков еще со времен Барьера на дух не переношу!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_05");	//Только и знают, что курить целыми днями свой болотник и трещать о каком-то Спящем.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_06");	//Насчет города я и сам уже подумывал. Да только их стража меня вряд ли пустит дальше городских ворот.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q1_01_07");	//А уж в монастыре мне и подавно ничего не светит. Куда мне в маги с таким прошлым?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Вот тебе сотня золотых.",DIA_STRF_8160_Ragnar_Hello_T1);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Держи тысячу монет и перестань ворчать!",DIA_STRF_8160_Ragnar_Hello_T2);
	};

	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Тогда твои дела действительно плохи.",DIA_STRF_8160_Ragnar_Hello_T3);
};

func void DIA_STRF_8160_Ragnar_Hello_Q2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q2_01_00");	//Как видишь, я и есть наемник с фермы Онара.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_01");	//Вижу, не слепой. Я тоже уже пытался прибиться к ним.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_02");	//Но эта скотина Сентенза попытался содрать с меня за вход полсотни золотых.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_03");	//Естественно, у меня не было с собой ни гроша, поэтому он просто послал меня к Белиару!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q2_01_04");	//Со мной он тоже пытался провернуть подобный фокус.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q2_01_05");	//И что ты сделал?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Заплатил, конечно! По-другому никак.",DIA_STRF_8160_Ragnar_Hello_Y1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Неважно, что я сделал.",DIA_STRF_8160_Ragnar_Hello_Y2);
};

func void DIA_STRF_8160_Ragnar_Hello_Y1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y1_01_06");	//Заплатил, конечно! По-другому никак.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_07");	//Хммм... Да, я бы поступил точно так же, если бы они у меня были.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_08");	//Может быть, одолжишь мне полсотни монет?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y1_01_09");	//А уж я в долгу не остался бы! Что скажешь?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_Hello);
	Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Нет, ты что! Это же целая куча золота.",DIA_STRF_8160_Ragnar_Hello_R1);

	if(Npc_HasItems(other,ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_STRF_8160_Ragnar_Hello,"Конечно, приятель! Так уж и быть, выручу тебя.",DIA_STRF_8160_Ragnar_Hello_R2);
	};
};

func void DIA_STRF_8160_Ragnar_Hello_Y2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_10");	//Неважно что я сделал. Главное, что этот ублюдок не получил от меня ни гроша.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_11");	//А ты смельчак, я погляжу...(уважительно) Может, и мне стоило надрать ему задницу?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_12");	//Конечно! Только так ты сможешь его заставить тебя уважать.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_13");	//Ну ладно...(почесывая затылок) Тогда отдохну немного, а потом пойду разберусь с этим парнем.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Y2_01_14");	//Спасибо за совет, приятель.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Y2_01_15");	//Не за что.
	AI_StopProcessInfos(self);
	RagnarKill = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_Q3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_Q3_01_00");	//А я как раз и есть бандит! Так что давай сюда свое золото.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q3_01_01");	//У меня нет ни гроша...(обреченно) Так что, если хочешь, то можешь просто убить меня!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_Q3_01_02");	//Давай, мне уже все равно...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_R1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R1_01_00");	//Нет, ты что! Это же целая куча золота.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R1_01_01");	//Ну вот...(угрюмо) Доверился человеку! А ему каких-то полсотни золотых жалко.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R1_01_02");	//Проваливай! Мне с таким как ты больше нечего обсуждать.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_R2()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R2_01_00");	//Конечно, приятель! Так уж и быть, выручу тебя.
	B_GiveInvItems(other,self,ItMi_Gold,50);
	Npc_RemoveInvItems(self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_01");	//Вот, это другое дело. Сразу видно, что передо мной человек, а не кусок дерьма.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_02");	//Значит, теперь можно и к наемникам податься. Только сначала отдохну немного, а потом уже двину на ферму.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_R2_01_03");	//Там и увидимся!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_R2_01_04");	//Само собой.
	AI_StopProcessInfos(self);
	RagnarIsSLD = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T1()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_00");	//Вот тебе сотня золотых. Только перестань ныть.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_01");	//И зачем ты мне даешь это золото?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_02");	//Отдашь его страже, что стоит у южных ворот города.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_03");	//За такую сумму они без лишних вопросов спокойно пропустят тебя.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_04");	//Ну, раз так... Тогда, пожалуй, отправлюсь в город и попытаю там свое счастье.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T1_01_05");	//Хорошо, тогда еще увидимся.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T1_01_06");	//Само собой.
	AI_StopProcessInfos(self);
	RagnarIsMIL = TRUE;
};


func void DIA_STRF_8160_Ragnar_Hello_T2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_00");	//Держи тысячу монет и перестань ворчать!
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_01");	//Парень, ты что с ума сошел? (удивленно) Ты и вправду хочешь отдать мне столько золота?!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_02");	//Маги Огня в монастыре требуют от каждого вновь прибывшего небольшую подать.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_03");	//А этой суммы вполне хватит, чтобы замолить все твои старые грехи.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_04");	//Не думал, что на свете бывают такие люди, как ты...(с уважением) Но все порой ошибаются.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_05");	//Ладно, тогда, пожалуй, отправлюсь в монастырь. К тому же я слышал, что они делают превосходное вино!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T2_01_07");	//Там и увидимся.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T2_01_08");	//Само собой.
	AI_StopProcessInfos(self);
	RagnarIsNOV = TRUE;
};

func void DIA_STRF_8160_Ragnar_Hello_T3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Hello_T3_01_00");	//Тогда твои дела действительно плохи.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T3_01_01");	//Вот уж удивил! Все это я и без тебя знаю.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Hello_T3_01_02");	//Эх...(угрюмо) Лучше ступай куда шел и оставь меня в покое.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_PissOff(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_PissOff_condition;
	information = DIA_STRF_8160_Ragnar_PissOff_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8160_Ragnar_PissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RagnarPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_PissOff_info()
{
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_PissOff_01_00");	//Отстань! Не до тебя...
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_Wait(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_Wait_condition;
	information = DIA_STRF_8160_Ragnar_Wait_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8160_Ragnar_Wait_condition()
{
	if((RagnarIsNOV == TRUE) || (RagnarIsSLD == TRUE) || (RagnarIsMIL == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_Wait_info()
{
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	};

	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_00");	//Постой! Вот черт... даже встать не могу.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Wait_01_01");	//Что еще такое?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_02");	//Я столько дней уже не ел, что, похоже, окончательно выбился из сил.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_03");	//Может быть, ты принесешь мне что-нибудь перекусить?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_04");	//Скажем, обычный кусок жареного мяса и бутылку воды.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_Wait_01_05");	//Большего я не прошу...(печально) Но без этого я долго не протяну.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_Wait_01_06");	//Ладно, жди здесь. Принесу тебе еды.
	MIS_RagnarFood = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Running);
	B_LogEntry(TOPIC_RagnarFood,"Рагнар так долго не ел, что совсем обессилел. Придется помочь бедняге и принести ему немного еды, а именно кусок жареного мяса и бутылку воды.");
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8160_Ragnar_WaitDone(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_WaitDone_condition;
	information = DIA_STRF_8160_Ragnar_WaitDone_info;
	permanent = FALSE;
	description = "Вот твоя еда.";
};

func int DIA_STRF_8160_Ragnar_WaitDone_condition()
{
	if((MIS_RagnarFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Water) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_WaitDone_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_WaitDone_01_00");	//Вот твоя еда.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Water,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_WaitDone_01_01");	//Ох, спасибо тебе, приятель. Не дал мне все-таки умереть с голоду.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_WaitDone_01_02");	//Наслаждайся.
	MIS_RagnarFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarFood,LOG_Success);
	B_LogEntry(TOPIC_RagnarFood,"Я не дал Рагнару умереть с голоду.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pear");
};

//--------------------------------ветка монастыря------------------------------------------------


instance DIA_STRF_8160_Ragnar_NOV(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_condition;
	information = DIA_STRF_8160_Ragnar_NOV_info;
	permanent = FALSE;
	description = "Как все прошло?";
};

func int DIA_STRF_8160_Ragnar_NOV_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_00");	//Как все прошло?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_01");	//Благодаря твоей помощи, маги приняли меня в послушники монастыря. Но все-таки я немного разочарован.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_02");	//Что еще такое?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_03");	//Да все бы ничего, но я целыми днями только и делаю, что мету полы да гну спину на грядке.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_04");	//Все вокруг мне твердят, что мол прежде всего необходимо научиться терпению, и на это могут уйти целые годы! 
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_01_05");	//Но это все же лучше, чем умирать с голоду в лесу. Не так ли?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_01_06");	//Да уж, с тобой не поспоришь...(посмеиваясь)
};


instance DIA_STRF_8160_Ragnar_NOV_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1_info;
	permanent = FALSE;
	description = "Тебе просто надо произвести впечатление на магов.";
};

func int DIA_STRF_8160_Ragnar_NOV_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_NOV) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_01");	//Тебе просто надо произвести впечатление на магов.
 	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_02");	//Я уже думал над этим. И у меня даже созрела одна идейка!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_03");	//Что ты задумал?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_04");	//Я слышал, что мастеру Неорасу срочно понадобился помощник. Но он пока еще не выбрал никого из числа послушников.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_05");	//А еще мне стало известно, что он крайне заинтересован в редких травах для своих экспериментов.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_06");	//И что конкретно его интересует?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_07");	//Некое растение, которое он называет вишней троллей. Белиар его знает, как оно выглядит и где его искать!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_08");	//Так вот, если я принесу ему эту траву, то он наверняка сделает выбор в мою пользу.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_01_09");	//Тогда чего же ты ждешь? Ступай и найди ее!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_10");	//Не все так просто, друг мой...(печально) Парлан никогда не выпустит меня за пределы монастыря.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_11");	//Этот старый хрыч постоянно следит за тем, что я делаю. И, кажется, не особо мне доверяет.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_01_12");	//Вот я и подумал: может быть, ты сможешь достать для меня это растение?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_NOV_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1,"Ладно. Постараюсь достать его для тебя.",DIA_STRF_8160_Ragnar_NOV_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_NOV_Q1,"Нет уж, делай все сам!",DIA_STRF_8160_Ragnar_NOV_Q1_No);
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_01");	//Ладно. Постараюсь достать его для тебя.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_02");	//Спасибо тебе, приятель. Ты просто не представляешь, как мне надоело мести эти кельи и возделывать землю под виноградник!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_Yes_01_03");	//В конце концов, я не для того выбрался из Долины Рудников, чтобы вновь вкалывать как проклятый!
	MIS_RagnarNeoras = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Running);
	B_LogEntry(TOPIC_RagnarNeoras,"Рагнар недоволен тем, что ему приходится целыми днями гнуть спину в монастыре. Но он слышал, что мастеру Неорасу понадобился помощник. Чтобы произвести на него впечатление, Рагнару нужно принести ему редкое растение - вишню троллей, и он попросил меня достать это растение, поскольку ему самому запрещено покидать монастырь.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEM_RAGNARFLOWER");
};

func void DIA_STRF_8160_Ragnar_NOV_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_01");	//Нет уж, делай все сам!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_02");	//Я тебе и так уже помог поступить в монастырь. На остальное у меня просто нет времени.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_03");	//Эх, ладно... Похоже, мне до конца своих дней придется подметать эти кельи.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1_No_01_04");	//А я очень рассчитывал на тебя, приятель...
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_NOV_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Q1Done_info;
	permanent = FALSE;
	description = "Я принес нужное тебе растение.";
};

func int DIA_STRF_8160_Ragnar_NOV_Q1Done_condition()
{
	if((MIS_RagnarNeoras == LOG_Running) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Q1Done_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_00");	//Я принес нужное тебе растение.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_01");	//Ого! Никогда бы не подумал, что оно так выглядит.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_02");	//Вместо того, чтобы чесать языком, лучше поскорей отнеси его мастеру Неорасу.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Q1Done_01_03");	//Да, приятель, ты прав! А то вдруг мое местечко займет кто-то другой.
	MIS_RagnarNeoras = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarNeoras,LOG_Success);
	B_LogEntry(TOPIC_RagnarNeoras,"Я принес Рагнару нужное ему растение.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Neoras");
};

var int RangarFireContestDay;

instance DIA_STRF_8160_Ragnar_NOV_Neoras(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_NOV_Neoras_condition;
	information = DIA_STRF_8160_Ragnar_NOV_Neoras_info;
	permanent = FALSE;
	description = "Все получилось?";
};

func int DIA_STRF_8160_Ragnar_NOV_Neoras_condition()
{
	if(MIS_RagnarNeoras == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_NOV_Neoras_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_00");	//Все получилось?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_01");	//(довольно) Как видишь. Теперь я помощник мастера Неораса! И все это благодаря тебе.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_02");	//Вот, возьми это зелье. Мне его дал сам Неорас за то, что я принес ему ту траву.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_NOV_Neoras_01_03");	//Мне кажется, оно по праву твое.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	RangarFireContestDay = Wld_GetDay();
};

instance DIA_STRF_8160_Ragnar_BecameKDF(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_info;
	permanent = FALSE;
	description = "Что нового?";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_NOV_Neoras) == TRUE) && (Kapitel >= 4) && (RangarFireContestDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_01_00");	//Что нового?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_01");	//Недавно началось испытание Огня...(нервозно) Для меня и еще нескольких послушников.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_01_02");	//По-моему, тебе это пришлось не слишком по душе.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_03");	//У меня не было выбора. Мастер Неорас лично предложил мою кандидатуру Пирокару!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_04");	//И теперь я ума не приложу, как мне со всем этим справиться.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_05");	//Если я провалю это испытание, то наверняка сильно подведу мастера Неораса.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_06");	//И тогда мне вновь придется вкалывать с мотыгой в руках на виноградниках.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_01_07");	//А как ты понимаешь, это занятие не из приятных!
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1_info;
	permanent = FALSE;
	description = "Какое задание дали тебе Маги?";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_BecameKDF) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_00");	//Какое задание дали тебе маги?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_01");	//Сделать руну огненной стрелы. Но я даже не знаю, с чего мне стоит начать.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_02");	//Мне кажется, что для начала тебе понадобится рунный камень.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_03");	//Даже ты это знаешь...(обреченно) Вот и скажи - какой из бывшего рудокопа-каторжника маг Огня?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_04");	//Тут уж ничего не поделаешь, приятель. Придется тебе хотя бы попробовать.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_05");	//Знаешь, а у меня тут появилась одна идея.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_06");	//Раз ты лучше меня разбираешься во всем этом - может, достанешь для меня эту руну?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_07");	//Что?! С чего ты это вдруг взял?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_08");	//Ну, ты же меня знаешь, я в долгу не останусь.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_09");	//Тут, в подвале монастыря, есть много всяких ценных штуковин!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_10");	//И я бы мог поделиться с тобой всем этим добром. Так скажем, услуга за услугу.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_01_11");	//Как тебе такое предложение?
	Info_ClearChoices(DIA_STRF_8160_Ragnar_BecameKDF_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1,"Хорошо, по рукам!",DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_BecameKDF_Q1,"Нет, я больше не хочу с этим связываться.",DIA_STRF_8160_Ragnar_BecameKDF_Q1_No);
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_01");	//Хорошо, по рукам!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_02");	//Только это должна быть действительно очень ценная штуковина.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_Yes_01_03");	//Я тебя понял, приятель...(посмеиваясь) Не волнуйся за это.
	MIS_RagnarRune = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Running);
	B_LogEntry(TOPIC_RagnarRune,"Рагнара заставили участвовать в испытании Огня! Маги ему дали задание - изготовить руну огненной стрелы. Однако бедолага даже не знает, как подойти к этой задаче. Если он провалит испытание, то наверняка ему снова придется вкалывать по-черному. За мою помощь он обещал дать мне очень ценную вещь из сокровищницы монастыря.");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItRu_FireBolt,"FP_ITEM_RAGNARRUNE");
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_01");	//Нет, я больше не хочу с этим связываться.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1_No_01_02");	//Ладно, как знаешь. Придется как-то самому выкручиваться.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_BecameKDF_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info;
	permanent = FALSE;
	description = "Вот твоя руна.";
};

func int DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_condition()
{
	if((MIS_RagnarRune == LOG_Running) && (Npc_HasItems(other,ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_00");	//Вот твоя руна.
	B_GiveInvItems(other,self,ItRu_FireBolt,1);
	Npc_RemoveInvItems(self,ItRu_FireBolt,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_01");	//(в восторге) Я так и знал, что у тебя все получится! Теперь мне больше нечего опасаться за свою судьбу!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_02");	//А где моя награда?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_03");	//Конечно, я не забыл о нашем договоре. Вот, возьми эту старую книгу.
	B_GiveInvItems(self,other,ItWr_MonasterySecret,1);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_04");	//Книга?! А поинтереснее ничего не было?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_05");	//Не спеши! Я думаю, что она представляет огромную ценность для магов.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_06");	//Ведь я ее забрал из закрытой секции библиотеки монастыря. 
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_07");	//Правда, пришлось немало потрудится, чтобы отвлечь внимание Таламона. Но мне это все-таки удалось!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_08");	//И пока он был занят чем-то другим, я стащил эту книгу с одной из книжных полок.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_09");	//Ладно, потом посмотрю, что за книга. А сейчас мне пора.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_10");	//Удачи, приятель! А я тогда пойду к Пирокару и покажу ему свою поделку.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_BecameKDF_Q1Done_01_11");	//Порадую старика...(посмеиваясь)
	MIS_RagnarRune = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarRune,LOG_Success);
	B_LogEntry(TOPIC_RagnarRune,"Я принес Рагнару магическую руну. За это он дал мне какую-то старую труху в виде книги.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Pyrokar");
};

instance DIA_STRF_8160_Ragnar_KDF(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_KDF_condition;
	information = DIA_STRF_8160_Ragnar_KDF_info;
	permanent = FALSE;
	description = "Значит, ты теперь маг Огня!";
};

func int DIA_STRF_8160_Ragnar_KDF_condition()
{
	if((MIS_RagnarRune == LOG_Success) && (RagnarIsKDF == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_KDF_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_00");	//Значит, ты теперь маг Огня!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_01");	//(озадаченно) Я и сам не могу в это поверить...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_02");	//Всего каких-то пару недель назад я умирал с голоду в лесу.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_03");	//А теперь я один из самых уважаемых людей монастыря. Бывает же такое!
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_04");	//Надеюсь, что теперь моя помощь тебе больше не нужна?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_KDF_01_05");	//Пока нет...(ехидно) А там, кто знает.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_KDF_01_06");	//Даже не думай.
};

//--------------------------------------------Рагнар милишник-------------------------------------------------

instance DIA_STRF_8160_Ragnar_MIL(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_condition;
	information = DIA_STRF_8160_Ragnar_MIL_info;
	permanent = FALSE;
	description = "Ты вступил в ополчение?";
};

func int DIA_STRF_8160_Ragnar_MIL_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_00");	//Ты вступил в ополчение?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_01");	//Не по своей прихоти. Я сделал все так, как ты и сказал.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_02");	//Отдал сотню монет стражникам, что стояли у входа, и вежливо попросил их пустить меня в город.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_03");	//Но не тут-то было! Они схватили меня и приволокли в свои казармы к какому-то лорду Андрэ!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_04");	//Тот долго меня допрашивал, и в итоге передо мной встал выбор.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_05");	//Либо пойти служить в ополчении, либо отправиться в тюрьму!
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_06");	//Так что теперь я стою здесь на посту и охраняю вход в башню.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_01_07");	//Но по мне это лучше, чем болтаться на виселице с веревкой на шее.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_08");	//Да уж, приятель. Похоже, ты просто пошел не к тем воротам.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_01_09");	//Хотя это уже не так и важно.
};

instance DIA_STRF_8160_Ragnar_MIL_Q1(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1_info;
	permanent = FALSE;
	description = "Помощь больше не нужна?";
};

func int DIA_STRF_8160_Ragnar_MIL_Q1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8160_Ragnar_MIL) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_00");	//Помощь больше не нужна?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_01");	//Да чем ты мне можешь помочь, приятель?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_02");	//Вот если бы я сам как-нибудь отличился перед лордом Андрэ...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_03");	//Тогда, глядишь, и не пришлось бы торчать тут весь день как проклятому.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_04");	//А у тебя есть мысли на этот счет?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_05");	//Я тут слышал, что недалеко от южных городских стен видели нескольких бандитов.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_06");	//Было бы неплохо разобраться с ними! И награда за их головы наверняка немаленькая.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_01_07");	//И что тебя останавливает?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_08");	//Как что?! Я просто не могу покинуть свой пост! 
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_01_09");	//Если кто-то из ополчения об этом узнает, то мне придется ой как несладко.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1,"Давай я разберусь с ними.",DIA_STRF_8160_Ragnar_MIL_Q1_Yes);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1,"Да, плохи у тебя дела.",DIA_STRF_8160_Ragnar_MIL_Q1_No);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_Yes()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_00");	//Давай я разберусь с ними.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_01");	//(удивленно) Ты серьезно?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_02");	//Не волнуйся! Я справлюсь с ними.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_03");	//Если поможешь мне, я в долгу не останусь.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_04");	//У меня тут на складе лежит много всякого барахла! Наверняка тебе что-нибудь пригодится.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_Yes_01_05");	//Хорошо, договорились.
	MIS_RagnarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_RagnarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Running);
	B_LogEntry(TOPIC_RagnarBandits,"Я согласился помочь Рагнару разобраться с шайкой бандитов, которую видели недалеко от южных городских ворот.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(BDT_10046_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10047_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
	Wld_InsertNpc(BDT_10048_Bandit_L,"NW_FARM1_CITYWALL_RIGHT_04");
};

func void DIA_STRF_8160_Ragnar_MIL_Q1_No()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_00");	//Да, плохи у тебя дела.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_01");	//(печально) Ладно, хватит уже болтать...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_02");	//А то еще кто-нибудь удивит ненароком, что я с тобой тут на посту треплюсь.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1_No_01_03");	//Выгонят взашей! И опять придется с голоду помирать.
	AI_StopProcessInfos(self);
	RagnarPissOff = TRUE;
};

instance DIA_STRF_8160_Ragnar_MIL_Q1Done(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Q1Done_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Q1Done_info;
	permanent = FALSE;
	description = "С твоими бандитами покончено.";
};

func int DIA_STRF_8160_Ragnar_MIL_Q1Done_condition()
{
	if((MIS_RagnarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_RagnarBand) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_00");	//С твоими бандитами покончено.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_01");	//Я тебе конечно верю, приятель...
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_02");	//Но лорду Андрэ наверняка потребуются более веские доказательства.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_03");	//Тогда просто отдай ему вот это письмо. Оно было у одного из этих бродяг.
	B_GiveInvItems(other,self,ItWr_RagnarBand,1);
	Npc_RemoveInvItems(self,ItWr_RagnarBand,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_04");	//О чем оно?
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_05");	//Взгляни сам.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_06");	//Хммм...(задумчиво) Да, думаю что лорду Андрэ будет крайне интересно взглянуть на его содержимое.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_07");	//Ну, вот и славно. А что ты приготовил для меня?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_01_08");	//Вот, выбирай.
	MIS_RagnarBandits = LOG_Success;
	Log_SetTopicStatus(TOPIC_RagnarBandits,LOG_Success);
	B_LogEntry(TOPIC_RagnarBandits,"В доказательство тому, что с бандитами покончено, я принес Рагнару письмо одного из них.");
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"Железный шлем",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"Полсотни болтов",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2);
	Info_AddChoice(DIA_STRF_8160_Ragnar_MIL_Q1Done,"Клинок рыцаря",DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_01");	//Я возьму шлем.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_02");	//(деловито) Хорошо. Вот, теперь он твой.
	B_GiveInvItems(self,other,ItAr_Helm_01,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_03");	//Как говорится, рука руку моет.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item1_01_04");	//Благодарю.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_01");	//Дай мне болты.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_02");	//(деловито) Хорошо. Вот, держи их.
	B_GiveInvItems(self,other,ItRw_Bolt,50);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_03");	//Как говорится, рука руку моет.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item2_01_04");	//Благодарю.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

func void DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_01");	//Мне приглянулся меч.
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_02");	//(деловито) Хорошо. Вот он.
	B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_03");	//Как говорится, рука руку моет.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Q1Done_Item3_01_04");	//Благодарю.
	Info_ClearChoices(DIA_STRF_8160_Ragnar_MIL_Q1Done);
};

instance DIA_STRF_8160_Ragnar_MIL_Up(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_MIL_Up_condition;
	information = DIA_STRF_8160_Ragnar_MIL_Up_info;
	permanent = TRUE;
	description = "Как жизнь?";
};

func int DIA_STRF_8160_Ragnar_MIL_Up_condition()
{
	if((Kapitel >= 3) && (MIS_RagnarBandits == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_MIL_Up_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Up_01_00");	//Как жизнь?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_MIL_Up_01_01");	//Как видишь, теперь я охраняю верхний квартал города.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_MIL_Up_01_02");	//Ну, что же, рад за тебя.
};

//--------------------------------------------Рагнар наемник-------------------------------------------------

instance DIA_STRF_8160_Ragnar_SLD(C_Info)
{
	npc = STRF_8160_Ragnar;
	nr = 2;
	condition = DIA_STRF_8160_Ragnar_SLD_condition;
	information = DIA_STRF_8160_Ragnar_SLD_info;
	permanent = FALSE;
	description = "Вижу, все прошло гладко?";
};

func int DIA_STRF_8160_Ragnar_SLD_condition()
{
	if((Kapitel >= 2) && (self.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_STRF_8160_Ragnar_SLD_info()
{
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_SLD_01_00");	//Вижу, все прошло гладко?
	AI_Output(self,other,"DIA_STRF_8160_Ragnar_SLD_01_01");	//(довольно) Да. Ли принял меня в наемники! Теперь я его человек.
	AI_Output(other,self,"DIA_STRF_8160_Ragnar_SLD_01_02");	//Ну что же, рад за тебя.
};