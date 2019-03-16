
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Ох, будь я проклят! Ты тоже решил подзаработать, ха? Я знал это! У тебя душа наемника.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Послушай, если ты думаешь, что загребешь здесь кучу золота, ты жестоко ошибаешься. Я был здесь первым.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Эй, ты! Меня тошнит от магов! Иди куда-нибудь еще! Здесь для тебя ничего нет.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02A");	//Эй ты, болотник! От этих ребят никогда не знаешь, что ожидать. Погуляй где-нибудь в другом месте. Здесь ничего нет.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Эй ты, паладин! Возвращайся в свою шахту. Здесь для тебя ничего нет.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Понял. Никто не хочет расставаться с награбленным.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//Ты сам сказал это. Исчезни.
};


instance DIA_Sylvio_VERSAGER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = "А что если не исчезну?";
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_HelloAgain) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//А что если не исчезну?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Не строй из себя крутого, выскочка, иначе тебя ждет такой же конец, как вот тех неудачников, лежащих в снегу.
};


instance DIA_Sylvio_DEINELEUTE(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = "Это твои люди?";
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (MIS_DJG_Sylvio_KillIceGolem == 0))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//Это твои люди?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Больше нет. Не такая уж большая потеря. Эти идиоты все равно мало что стоили.
};


instance DIA_Sylvio_WASISTPASSIERT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = "Что случилось с ними?";
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_VERSAGER) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//Что случилось с ними?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//Они не смогли пройти мимо этих ледяных гигантов. Те затоптали их.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//Если ты такой крутой, может, ты попробуешь?
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Хорошо. Почему бы и нет?",DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Чем это тебе поможет, если я сделаю это?",DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"А что мне с этого будет?",DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Почему ты не расправишься с ними сам?",DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem,"Сильвио испугался двух ледяных големов у входа в заснеженный район Долины Рудников.");
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WASISTPASSIERT_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Почему ты не расправишься с ними сам?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Давай, давай. Не мели чепухи.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//По-моему, у тебя дрожат коленки.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Я не играю в твои игры.",DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//Что я за это получу?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Не знаю. Скажем... сто золотых монет. Нормально?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//Чем это тебе поможет, если я сделаю это?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//Тебе это все равно. Но, отвечая на твой вопрос, скажу: я хочу попасть в этот ледяной район.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//К сожалению, на моем пути стоят эти чертовы твари.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT,"Что тебе делать в этом ледяном районе?",DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//Я не играю в твои игры.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Ах-х. Тогда убирайся отсюда, трус.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//Что тебе делать в этом ледяном районе?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//Ты когда-нибудь перестанешь задавать вопросы, а? Хорошо, я скажу тебе.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Там, за этими утесами, находится ледяная долина. Ты такой никогда раньше не видел.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//Там скрывается ледяной дракон вместе со своей ордой.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//Мне нужно это. Так как? Да или нет?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//Хорошо. Почему бы и нет?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Тогда поторопись. Я не могу долго ждать.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = "Твой путь чист!";
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if(Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MIS_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Твой путь чист! Ледяных гигантов больше нет.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Отличная работа. Посмотрим, что там у нас есть.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Минуточку. А как мои деньги?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//Всему свое время.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = "Что еще?";
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if((MIS_DJG_Sylvio_KillIceGolem == LOG_SUCCESS) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//Что еще?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Ну....Мне что-то обстановка там не очень нравится!
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//Будет лучше всего, если ты пойдешь вперед, а я пойду за тобой.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Хорошо, пошли.",DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Ты боишься?",DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Я не собираюсь делать всю грязную работу за тебя.",DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT,"Сначала я хочу увидеть свои деньги.",DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASJETZT_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Ты боишься?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Чушь! Хватит болтать. Иди вперед!
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//Хорошо, пошли.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Давай, быстрее!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//Я не собираюсь делать всю грязную работу за тебя.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Трус!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//Сначала, я хочу увидеть свои деньги.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Когда мы завалим дракона, у тебя будет столько денег, что не сможешь унести.
	Info_AddChoice(DIA_Sylvio_WASJETZT,"Я хочу получить свои деньги сейчас.",DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_jetztGeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//Я хочу получить свои деньги сейчас.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Либо ты пойдешь впереди меня, либо мне придется разобраться с тобой.
};


instance DIA_Sylvio_KOMMSTDU(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = "Я думал, ты направляешься в ледяной район.";
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (TOPIC_END_SylvioKillIceGolem == FALSE) && (Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//Я думал, ты направляешься в ледяной район.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Иди вперед! А я пойду сзади.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = "Мне не помешала бы твоя помощь.";
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if((Npc_IsDead(IceDragon) == FALSE) && (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE) && (TOPIC_END_SylvioKillIceGolem == FALSE) && (Npc_IsDead(IceDragon) == FALSE) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//Мне не помешала бы твоя помощь.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Чушь! Ты и так великолепно справляешься.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if(Npc_IsDead(IceDragon) && (SylvioCampUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//Ледяной дракон мертв! А теперь ты отдашь мне все, что у тебя есть!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ни за что!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//Это я получу всю славу за убийство ледяного дракона.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//А твоя маленькая роль в этом деле окончена!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter,"Эта грязная свинья Сильвио собирался присвоить себе мою победу над ледяным драконом! Мы немного повздорили...");
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};

instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT) && (SylvioCampUp == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return C_Beklauen(78,560);
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};



//--------------------------------Отряд Сильвио----------------------------------------------


instance DIA_SylvioDJG_Camp_Hello(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Hello_Condition;
	information = DIA_SylvioDJG_Camp_Hello_Info;
	important = TRUE;
};

func int DIA_SylvioDJG_Camp_Hello_Condition()
{
	if(SylvioCampUp == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Hello_Info()
{
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_00");	//Опять ты! Вечно ты путаешься у меня под ногами!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_01");	//А ты зря времени не терял. Решил присвоить сокровища ледяного дракона себе?!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_02");	//Теперь они только мои. (угрожающе) Так что держись от них подальше! Если, конечно, тебе дорога твоя жизнь.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_03");	//Я думал, что ты поделишься с остальными парнями.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_04");	//Само собой. Но пока мы даже не решили, что делать с этой горой золота.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Hello_01_05");	//Вы не знаете, что делать с золотом?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_06");	//Представь себе! Тут от него толку будет мало.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Hello_01_07");	//Да и в Хоринисе сейчас ситуация тоже не из приятных.
};

instance DIA_SylvioDJG_Camp_Plan(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Plan_Condition;
	information = DIA_SylvioDJG_Camp_Plan_Info;
	permanent = FALSE;
	description = "У тебя есть план?";
};

func int DIA_SylvioDJG_Camp_Plan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Plan_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_00");	//У тебя есть план?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_01");	//Да, у меня есть план. Именно поэтому я здесь главный!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_02");	//И в чем он состоит?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_03");	//Я хочу убраться с этого проклятого острова и прихватить с собой все это золото.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Plan_01_04");	//Но для этого тебе понадобится корабль.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_05");	//Какой ты умный! Я это и без тебя знаю.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_06");	//Но единственный корабль на острове сейчас стоит в гавани Хориниса.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Plan_01_07");	//И я сомневаюсь, что паладины дадут нам отплыть на нем!
};

instance DIA_SylvioDJG_Camp_Bullco(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Bullco_Condition;
	information = DIA_SylvioDJG_Camp_Bullco_Info;
	permanent = FALSE;
	description = "А где твой друг Булко?";
};

func int DIA_SylvioDJG_Camp_Bullco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Bullco_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Bullco_01_00");	//А где твой друг Булко?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Bullco_01_01");	//Этот мерзавец сбежал. Сказал, что с него довольно всех этих трудностей.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Bullco_01_02");	//Надеюсь, что его уже сожрали местные твари!
};

instance DIA_SylvioDJG_Camp_Drakar(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Info;
	permanent = FALSE;
	description = "Есть еще один корабль!";
};

func int DIA_SylvioDJG_Camp_Drakar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Plan) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_00");	//Есть еще один корабль!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_02");	//Правда?! И где он?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_03");	//На другой стороне долины стоит огромный дракар орков.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_04");	//Хммм... Это уже интересно! Но он наверняка хорошо охраняется.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_05");	//Скорее всего.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_06");	//Значит, нам придется как-то выбить оттуда орков.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_07");	//Тогда вперед, покажем им!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_08");	//Ты не понимаешь. Мы не можем бросить наше золото!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_09");	//Как только мы отсюда уйдем, сюда наверняка нагрянут орочьи морды.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_10");	//И тогда нам его уже точно не видать!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_11");	//Что ты предлагаешь?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_12");	//(ухмыляясь) Ну, это же ты у нас герой! Вот и реши проблему.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_13");	//А мне-то с чего это делать?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_14");	//(улыбаясь) Ну, до этого времени у нас были, скажем так, небольшие разногласия.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_15");	//Но если ты нам сейчас поможешь, то я готов поделится с тобой.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_16");	//Ты предлагаешь мне золото, которое и так по праву мое?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_17");	//Оно уже не твое, приятель. Так что, если хочешь им поживиться, придется нам помочь.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_01_18");	//Ну как, договорились?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_01_19");	//Ладно. Попробую что-нибудь придумать.
	MIS_SylvioDrakar = LOG_Running;
	Log_CreateTopic(Topic_SylvioDrakar,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Running);
	B_LogEntry(Topic_SylvioDrakar,"Сильвио хочет, чтобы я помог им захватить дракар орков. За это он поделится со мной золотом ледяного дракона.");
	AI_StopProcessInfos(self);

	if(FLAG_ORCS_DRAKAR == TRUE)
	{
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_01");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_03");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_04");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_05");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_06");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_07");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_08");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_09");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_10");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_11");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_12");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_13");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_14");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_15");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_16");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_17");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_18");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_19");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_20");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_21");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_22");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_23");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_24");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_25");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_26");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_27");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_28");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_29");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_30");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_31");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_32");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_33");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_34");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_35");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_01");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_02");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_03");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_04");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_05");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_01");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_02");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_03");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_04");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_05");
		Wld_InsertNpc(ORKELITE_CHKFLG_SYLVIODRAKAR_CAPITAN,"FP_CAMPFIRE_DRAKARSHIP_CAPITAN");
	};
};

instance DIA_SylvioDJG_Camp_Orcs(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Info;
	permanent = FALSE;
	description = "Орки уже пытались напасть на ваш лагерь?";
};

func int DIA_SylvioDJG_Camp_Orcs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_01_00");	//Орки уже пытались напасть на ваш лагерь?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_01");	//Да. Но, как видишь, им это не удалось.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_02");	//Это место идеально подходит для того чтобы держать оборону.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_01_03");	//Поэтому нам сейчас нет никакого смысла покидать этот лагерь.
};

instance DIA_SylvioDJG_Camp_OthTre(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_OthTre_Condition;
	information = DIA_SylvioDJG_Camp_OthTre_Info;
	permanent = FALSE;
	description = "А что насчет сокровищ других драконов?";
};

func int DIA_SylvioDJG_Camp_OthTre_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_OthTre_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_OthTre_01_00");	//А что насчет сокровищ других драконов?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_01");	//Хммм... Мы бы и их забрали, но это слишком опасно!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_02");	//Долина просто кишит орками, и это единственное место, где можно чувствовать себя в безопасности.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_OthTre_01_03");	//Так что у нас нет ни единого шанса даже добраться до них!
};

instance DIA_SylvioDJG_Camp_Drakar_Done(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Done_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Done_Info;
	permanent = FALSE;
	description = "Дракар орков чист!";
};

func int DIA_SylvioDJG_Camp_Drakar_Done_Condition()
{
	if((MIS_SylvioDrakar == LOG_Running) && (FLAG_ORCS_DRAKAR_02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_00");	//Дракар орков чист!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_01");	//Отлично. Теперь надо подумать, как переправить наше золото на корабль.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_02");	//А как насчет моей доли?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_03");	//Не спеши! Тут есть еще одна небольшая проблемка.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_04");	//Какая?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_05");	//Я тут поговорил с парнями, и оказалось, что никто из них не умеет обращаться со штурвалом.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_06");	//А в таком случае мы даже не сможем отплыть отсюда.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_07");	//Хочешь, чтобы я нашел тебе капитана?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_08");	//(ухмыляясь) А ты все-таки не дурак, как я погляжу.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_09");	//Естественно, нам нужен тот, кто смог бы управляться с этой посудиной.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_10");	//В конце концов, это ведь была твоя идея - отнять корабль у орков.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_11");	//Вот теперь и выкручивайся	как хочешь!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_12");	//Да, и еще...(небрежно) Там на корабле нам бы также пригодился хороший повар.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_13");	//Я не хочу подохнуть в море с голоду, прежде чем успею потратить свое золото.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_14");	//Надеюсь, я понятно выражаюсь?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_15");	//Вполне.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Done_01_16");	//Тогда за дело. Давай, не теряй времени!
	MIS_SylvioDrakar = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Success);
	B_LogEntry(Topic_SylvioDrakar,"Сильвио был рад тому, что дракар орков больше никем не охраняется.");
	MIS_SylvioCrew = LOG_Running;
	Log_CreateTopic(Topic_SylvioCrew,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioCrew,LOG_Running);
	B_LogEntry_Quiet(Topic_SylvioCrew,"Сильвио хочет, чтобы я нашел того, кто смог бы управляться с кораблем. Кроме того, им нужен повар. Да, запросы у этого парня еще те! Но чего не сделаешь ради золота?");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Info;
	permanent = FALSE;
	description = "А что насчет орков над этой пещерой?";
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Orcs) == TRUE) && (FLAG_ORCS_CHK_27 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_00");	//А что насчет орков над этой пещерой?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_01");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_02");	//У них был там небольшой лагерь. Ты что, не знал об этом?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_03");	//Нет, черт тебя побери! И почему же ты раньше молчал?!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_04");	//Да ты и не спрашивал.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_05");	//(лихорадочно) Теперь мы все в большой опасности! Ты должен убить их! Убить их всех! 
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_01_06");	//Что, опять я?!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_07");	//Но это ведь ты рассказал мне про этот лагерь. К тому же мы не можем сейчас уйти отсюда!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_08");	//Так что давай, ноги в руки и вперед.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_01_09");	//Все орки должны быть мертвы!
	MIS_SylvioOrcs = LOG_Running;
	Log_CreateTopic(Topic_SylvioOrcs,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Running);
	B_LogEntry(Topic_SylvioOrcs,"Узнав о том, что над пещерой ледяного дракона располагается лагерь орков, Сильвио чуть не потерял сознание. Теперь мне надо позаботиться о том, чтобы орки больше не доставляли ему головную боль.");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up_Done(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Done_Info;
	permanent = FALSE;
	description = "Про орков над пещерой можно забыть.";
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition()
{
	if((MIS_SylvioOrcs == LOG_Running) && (FLAG_ORCS_CHK_27 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_00");	//Про орков над пещерой можно забыть.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_01");	//В каком смысле?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_02");	//Их там больше нет.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_03");	//Хорошо! Это меня немного успокаивает.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Orcs_Up_Done_01_04");	//Теперь займись другими делами. Наверняка они у тебя есть.
	MIS_SylvioOrcs = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Success);
	B_LogEntry(Topic_SylvioOrcs,"Я успокоил Сильвио, сказав, что орков над пещерой дракона больше нет.");
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Drakar_Crew(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Crew_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Crew_Info;
	permanent = TRUE;
	description = "Насчет вашего капитана...";
};

func int DIA_SylvioDJG_Camp_Drakar_Crew_Condition()
{
	if(MIS_SylvioCrew == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Crew_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_00");	//Насчет вашего капитана...
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_01");	//Да? Что скажешь?


	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_02");	//Боюсь, что капитана мне тут уже не найти.
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_03");	//А в Хоринисе вряд ли кто-то согласится отправиться сюда.
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_04");	//Проклятье! Ладно, придумаем что-нибудь сами.
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_05");	//(серьезно) Теперь нам пора уже выдвигаться...
		AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_06");	//А ты не забыл про мою долю?
		AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_07");	//Позже! Вот доберемся до корабля, там и поговорим насчет твоей награды.
		MIS_SylvioCrew = LOG_Success;
		Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
		B_LogEntry(Topic_SylvioCrew,"Я сообщил Сильвио о том, что не смог найти капитана в долине.");
		AI_StopProcessInfos(self);
	}
	else
	{
		if(RatfordAgree == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_08");	//Парень по имени Рэтфорд готов взяться за эту работенку.
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_09");	//Но сначала ты должен будешь заплатить ему не меньше пятиста монет.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_10");	//(жадно) Пятьсот монет?! А, ладно! У нас все равно нет выбора.
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_11");	//Он сказал, что будет ждать вас на корабле.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_12");	//Хорошо! Мы тоже вскоре отправимся туда.
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_13");	//А ты не забыл про мою долю?
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_14");	//Позже! Обсудим это, когда доберемся туда.
			MIS_SylvioCrew = LOG_Success;
			Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
			B_LogEntry(Topic_SylvioCrew,"Я сообщил Сильвио о том, что Рэтфорд согласился быть капитаном дракара.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Crew_01_15");	//Пока ничего.
			AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Crew_01_16");	//Тогда зачем ты меня дергаешь по пустякам? Лучше займись делом!
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_SylvioDJG_Camp_Drakar_Cook(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Cook_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_Cook_Info;
	permanent = FALSE;
	description = "Я нашел вам повара.";
};

func int DIA_SylvioDJG_Camp_Drakar_Cook_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_Done) == TRUE) && (Npc_IsDead(STRF_1107_Straefling) == FALSE) && (ClifAgree == TRUE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Cook_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Cook_01_00");	//Я нашел вам повара.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Cook_01_01");	//Хорошо...(вздыхая) Надеюсь, что он умеет готовить.
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Cook_01_02");	//Паладины в замке на него вроде не жаловались.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_Cook_01_03");	//Ну, раз так, тогда все в полном порядке.
};

instance DIA_DJG_700_Sylvio_FuckOff(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOff_Condition;
	information = DIA_DJG_700_Sylvio_FuckOff_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOff_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MoveDracarBoard == TRUE) && (MIS_SylvioDebts == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOff_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_SylvioDJG_Camp_Drakar_LastChance(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChance_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_LastChance_Info;
	permanent = FALSE;
	description = "Ты не заплатил Рэтфорду.";
};

func int DIA_SylvioDJG_Camp_Drakar_LastChance_Condition()
{
	if((MoveDracarBoard == TRUE) && (MIS_SylvioDebts == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChance_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_00");	//Ты не заплатил Рэтфорду.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_01");	//И что?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_02");	//Но ты обещал, что заплатишь ему!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_03");	//(небрежно) А за что мне ему платить?
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_04");	//Я думал, что мы сразу выйдем в море! Но вместо этого мы торчим тут, потому что у корабля сломан руль.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_05");	//Так что он не получит от меня ни гроша до тех пор, пока не починит его.
};

instance DIA_SylvioDJG_Camp_Drakar_LastChanceKill(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition;
	information = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info;
	permanent = FALSE;
	description = "Пришло время поговорить о моей доле.";
};

func int DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_LastChance) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info()
{
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_00");	//Пришло время поговорить о моей доле.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_01");	//(ухмыляясь) Ну хорошо, вот, держи.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_02");	//Что?! Какая-то жалкая сотня монет? 
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_03");	//Ты и этого не заслужил.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_04");	//А что ты хотел - корабль сломан, мы до сих пор тут, а кругом полно орков!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_05");	//Скажи спасибо, что и это получил. А теперь проваливай!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_06");	//Нет, подожди. Так дела не делаются!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_07");	//А ты что, вздумал меня поучить, как делать дела?!
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_08");	//Да! И либо ты сейчас же отдашь мне ровно половину вашей добычи...
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_09");	//...либо мне придется хорошенько поколотить тебя, жадная ты свинья!
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_10");	//(смеется) Ну что же, ты можешь попробовать, ублюдок!
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	self.guild = GIL_NONE;
	CreateInvItems(self,ItMi_Gold,10000);
	CreateInvItems(self,ItPo_Perm_STR,1);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_DJG_700_Sylvio_FuckOffAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOffAgain_Condition;
	information = DIA_DJG_700_Sylvio_FuckOffAgain_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOffAgain_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_SylvioDJG_Camp_Drakar_LastChanceKill) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOffAgain_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

//--------------------Охранник----------------------------

instance DIA_DJG_7312_ToterDrachenjaeger_EXIT(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 999;
	condition = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_HelloAgain(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition()
{
	if((MoveDracarBoard == FALSE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info()
{
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_00");	//(угрожающе) Эй, приятель! Куда это ты собрался?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_01");	//Туда. А что?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_02");	//А то, что тебе туда нельзя! Понял?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_03");	//Это еще почему?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_04");	//Теперь это наше место и наш лагерь! И кого попало мы внутрь не пустим.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_05");	//Так что лучше проваливай отсюда!
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_06");	//Интересно! Так, значит, у вас тут лагерь? И кто же ваш босс?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_07");	//Ты не знаешь его. Его зовут Сильвио.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_08");	//Сильвио? Его-то я как раз знаю. Он был одним из наемников на ферме Онара.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_09");	//И, судя по всему, он все-таки добрался до сокровищ ледяного дракона!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_10");	//(испуганно) Что?! Так, значит, ты тоже знаешь об этом?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_11");	//Знаю о чем?
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_12");	//Ну, о том, что здесь неподалеку лежит целая гора золота!
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_13");	//Конечно. Ведь это я убил ледяного дракона.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_14");	//Ты?! (смеется) Ну ты горазд заливать, парень.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_15");	//Да с этим драконом не справилась бы целая армия! Куда уж тебе одному.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_16");	//А, ладно. Раз ты уже в курсе всего происходящего, то можешь пройти.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_17");	//Если тебе нужен сам Сильвио, то он в большой пещере, рядом с сокровищами.
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_BUTNOW(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 13;
	condition = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SylvioIsDead == FALSE) && ((Npc_KnowsInfo(other,DIA_DJG_7312_ToterDrachenjaeger_HelloAgain) == TRUE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_DJG_7312_ToterDrachenjaeger_KillHim(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition()
{
	if(SylvioIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info()
{
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_00");	//Правильно сделал, что прикончил этого мерзавца Сильвио!
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_01");	//Он нам всем не особо-то и нравился.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_02");	//Так что никто скучать по нему не будет.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_03");	//Теперь главное быстрее унести отсюда ноги, пока орки не вспомнили про свой корабль.
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_04");	//Тогда лучше помогите Рэтфорду разобраться с поломкой руля.
	AI_Output(self,other,"DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_05");	//Обязательно поможем, приятель! Обязательно.
	AI_StopProcessInfos(self);
};