
instance DIA_Onar_EXIT(C_Info)
{
	npc = Bau_900_Onar;
	nr = 999;
	condition = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Onar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Onar_Hallo(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Onar_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_Hallo_Info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Кто пустил тебя сюда?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//Что ты делаешь на моей ферме?!
	OnarFM = TRUE;
};


instance DIA_Onar_PERM(C_Info)
{
	npc = Bau_900_Onar;
	nr = 1;
	condition = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent = TRUE;
	description = "Здесь все в порядке, на твоей ферме?";
};


func int DIA_Onar_PERM_Condition()
{
	return TRUE;
};

func void DIA_Onar_PERM_Info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Здесь все в порядке, на твоей ферме?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//Я не понимаю, какое тебе до этого может быть дело. Ты не работаешь здесь!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//Очень надеюсь, что да! В конце концов, именно за это я тебе и плачу!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//Тебе лучше пойти, поговорить с Торлофом, может быть, у него есть работа для тебя.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Да, конечно. Ты можешь идти, охотиться на своих драконов.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//Здесь не рады вашим притворным прихвостням из монастыря!
		if(other.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Onar_PERM_14_07");	//Мне кажется, что твой язык нездоров. Он СЛИШКОМ длинный.
			AI_Output(other,self,"DIA_Onar_PERM_14_08");	//Как избранный Инноса, я хорошо это различаю.
		};
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Наше гостеприимство не распространяется на войска короля.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_07");	//Мне кажется, что твой язык нездоров. Он СЛИШКОМ длинный.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_08");	//Как избранный Инноса, я хорошо это различаю.
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_09");	//(дрожащим голосом) Все хорошо.
	};
};


instance DIA_Onar_Work(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent = FALSE;
	description = "Я хочу работать на тебя!";
};


func int DIA_Onar_Work_Condition()
{
	if((Lee_SendToOnar == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};

	return FALSE;
};

func void DIA_Onar_Work_Info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//Я хочу работать на тебя!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//Мне сейчас не нужны рабочие.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//Мои люди прекрасно со всем справляются.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//Тебе нечего делать в моем доме, убирайся!
};


instance DIA_Onar_WorkAsSld(C_Info)
{
	npc = Bau_900_Onar;
	nr = 2;
	condition = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent = FALSE;
	description = "Я хочу поработать здесь в качестве наемника!";
};


func int DIA_Onar_WorkAsSld_Condition()
{
	if((Lee_SendToOnar == FALSE) && (hero.guild == GIL_NONE) && (Onar_WegenSldWerden == FALSE) && Npc_KnowsInfo(other,DIA_Onar_Work))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WorkAsSld_Info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//Я хочу поработать здесь в качестве наемника!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//Ты? Наемника? Не смеши меня! Если бы из тебя мог получиться хороший наемник, Ли наверняка рассказал бы мне о тебе.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//А теперь убирайся отсюда, и поживее!
	Onar_WegenSldWerden = TRUE;
};


instance DIA_Onar_Aufstand(C_Info)
{
	npc = Bau_900_Onar;
	nr = 3;
	condition = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent = FALSE;
	description = "Ты противостоишь городу, как я слышал?";
};

func int DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};

func void DIA_Onar_Aufstand_Info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//Ты противостоишь городу, как я слышал?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//А теперь послушай ты. Я унаследовал эту ферму и эту землю от своего отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//Он унаследовал ее от своего отца.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//Я не позволю этому жадному идиоту, называющему себя королем, разорить меня только для того, чтобы накормить свои бесполезные армии.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//Война с орками длится уже целую вечность. И к чему мы пришли? Мы стоим на грани поражения.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//Нет - я предпочитаю оборонять свою ферму самостоятельно! Деньги, что я сберегу таким образом, пойдут на оплату моей собственной армии.
};


instance DIA_Onar_WegenPepe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 4;
	condition = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent = FALSE;
	description = "Можешь благодарить Булко, у тебя стало на несколько овец меньше.";
};


func int DIA_Onar_WegenPepe_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WegenPepe_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Можешь благодарить Булко, у тебя стало на несколько овец меньше.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//О чем это ты говоришь? Кто такой Булко?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//Один из наемников.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//Какое мне до этого дело? Если он притронулся к моим овцам, он будет отвечать перед Ли.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//Зачем ты отвлекаешь меня по таким пустякам?
	Onar_WegenPepe = TRUE;
};


instance DIA_Onar_WegenSekob(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent = FALSE;
	description = "Я пришел по поводу ренты Секоба...";
};


func int DIA_Onar_WegenSekob_Condition()
{
	if(MIS_Sekob_RedeMitOnar == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WegenSekob_Info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//Я пришел по поводу ренты Секоба...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//Что, черт возьми, тебе нужно здесь? Отнеси деньги Торлофу.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//Какого дьявола ты лезешь в это дело?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//Я хочу стать наемником. Собрать ренту - это мое испытание.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//Но у Секоба нет денег. Я даже пытался выбить их из него.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//Он сказал, что это из-за плохого урожая...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(вопит) Ты безмозглый кретин! Ты что думаешь, он носит деньги с собой? Он их где-то прячет!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Да ты знаешь, сколько дождей было в этот год? Плохой урожай! Надо же!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Иди, и найди способ выбить из него эти деньги.
	Onar_WegenSekob = TRUE;
};


var int onartomm;
var int onartomm1;

instance DIA_Onar_LeeSentMe(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent = FALSE;
	description = "Меня послал Ли. Я хочу работать в качестве наемника!";
};


func int DIA_Onar_LeeSentMe_Condition()
{
	if((Lee_SendToOnar == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_LeeSentMe_Info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Меня послал Ли. Я хочу работать в качестве наемника!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//Он уже говорил со мной.
	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//При нашей первой встрече у меня сложилось о тебе не самое лучшее мнение.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Но раз Ли полагает, что ты справишься, я, пожалуй, дам тебе шанс.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_08");	//Приходи завтра в полдень, ты мне будешь нужен.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_09");	//А пока ты должен расчистить от монстров окрестности склепа.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_10");	//А там посмотрим, годишься ли ты на что-то.
	ONARTOMM = Wld_GetDay();
	ONARTOMM1 = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"Онар ждет меня завтра в полдень. У него есть какое-то задание. А сегодня я должен расчистить окрестности склепа от монстров.");
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_LEESENTMEPASS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepass_condition;
	information = dia_onar_leesentmepass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_leesentmepass_condition()
{
	if(((ONARTOMM + 1) == Wld_GetDay()) && (other.guild == GIL_NONE) && Wld_IsTime(11,45,12,15))
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_onar_leesentmepass_info()
{
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_01");	//А вот и ты! Почти вовремя.
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_02");	//Посмотрим, на что ты годишься.
	AI_Output(self,other,"DIA_Onar_LeeSentMePass_14_03");	//Проводи моих дам, и не дай бог с ними что-нибудь случится!
	ONARTOMM1 = 5;
	B_LogEntry(TOPIC_BecomeSLD,"Онар велел сопровождать и охранять его дам.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"StartPass");
	B_StartOtherRoutine(BAU_911_Elena,"StartPass");
};

instance DIA_ONAR_LEESENTMEPASSGO(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassgo_condition;
	information = dia_onar_leesentmepassgo_info;
	permanent = FALSE;
	description = "Я тут чего-то недопонял...";
};


func int dia_onar_leesentmepassgo_condition()
{
	if(((ONARTOMM1 == 6) || (ONARTOMM1 == 5)) && !Npc_IsDead(BAU_910_Maria) && !Npc_IsDead(BAU_911_Elena))
	{
		return TRUE;
	};
};

func void dia_onar_leesentmepassgo_info()
{
	if(GLOBAL_FARM_ATTACK >= 10)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_01");	//Прочь с моих глаз, жалкий мародер!
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
	}
	else if(ONARTOMM1 == 5)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_08");	//Где мои дамы, ублюдок?!
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_09");	//Ты даже простого распоряжения выполнить не можешь!
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Но раз Ли полагает, что ты справишься, я, пожалуй, дам тебе шанс.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//В конце концов, он отвечает за тебя. Так что приступай к своим обязанностям.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Но не выводи меня из себя! Оставь фермеров и служанок в покое, и даже не думай стащить что-нибудь, понятно?
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//А нам с тобой нужно обсудить только твое жалование.
		ONARTOMM1 = 15;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD,"Онар был очень недоволен, но дал мне свое одобрение. Теперь ничто не препятствует моему вступлению в ряды наемников.");
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMePassGo_14_02");	//Отлично! Значит, проблем не было? Ты выполнил мои условия.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//А нам с тобой нужно обсудить только твое жалование.
		ONARTOMM1 = 20;
		Onar_Approved = TRUE;
		B_LogEntry(TOPIC_BecomeSLD,"Онар был очень доволен и дал мне свое одобрение. Теперь ничто не препятствует моему вступлению в ряды наемников.");
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};


instance DIA_ONAR_LEESENTMEPASSNO(C_Info)
{
	npc = Bau_900_Onar;
	nr = 6;
	condition = dia_onar_leesentmepassno_condition;
	information = dia_onar_leesentmepassno_info;
	permanent = FALSE;
	description = "Я пришел.";
};


func int dia_onar_leesentmepassno_condition()
{
	if(((ONARTOMM + 1) <= Wld_GetDay()) && (other.guild == GIL_NONE) && (ONARTOMM1 == 1) && !Wld_IsTime(11,45,12,15) && (ONARTOMM1 != 5))
	{
		if(((ONARTOMM + 1) == Wld_GetDay()) && Wld_IsTime(0,0,12,15))
		{
			return FALSE;
		}
		else
		{
			return TRUE;
		};
	};
};

func void dia_onar_leesentmepassno_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMePassNO_15_00");	//Я пришел.
	AI_Output(self,other,"DIA_Onar_LeeSentMePassNO_14_01");	//И что? Ты опоздал!
	AI_Output(self,other,"DIA_Onar_LeeSentMePassNO_14_02");	//Ты даже простое задание не можешь выполнить!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//Но раз Ли полагает, что ты справишься, я, пожалуй, дам тебе шанс.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//В конце концов, он отвечает за тебя. Так что приступай к своим обязанностям.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//Но не выводи меня из себя! Оставь фермеров и служанок в покое, и даже не думай стащить что-нибудь, понятно?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//А что касается всего остального, поговори с Ли.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//А нам с тобой нужно обсудить только твое жалование.
	ONARTOMM1 = 15;
	Onar_Approved = TRUE;
	B_LogEntry(TOPIC_BecomeSLD,"Онар был очень недоволен, но дал мне свое одобрение. Теперь ничто не препятствует моему вступлению в ряды наемников.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	B_StartOtherRoutine(BAU_911_Elena,"Start");
};

var int Onar_SOLD_Day;
var int Onar_SOLD_XP;

instance DIA_Onar_HowMuch(C_Info)
{
	npc = Bau_900_Onar;
	nr = 7;
	condition = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent = FALSE;
	description = "Так что насчет моего жалования?";
};


func int DIA_Onar_HowMuch_Condition()
{
	if(Onar_Approved == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_HowMuch_Info()
{
	var int temp1;
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//Так как насчет моего жалования?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Так, посмотрим...
	SOLD = 50;

	if(Onar_WegenSldWerden == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//Я не самого лучшего мнения о тебе.
		SOLD = SOLD - 10;
	};
	if(Onar_WegenSekob == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//Ты не отличаешься особой сообразительностью. Это очевидно после твоих похождений к Секобу.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_Farm > 1) || ((B_GetGreatestPetzCrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//Ты уже неоднократно создавал проблемы здесь, на ферме.
		SOLD = SOLD - 10;
	};
	if((Onar_WegenPepe == TRUE) && ((Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//И ты постоянно допекаешь меня всяким вздором.
		SOLD = SOLD - 10;
	};
	if(ONARTOMM1 == 20)
	{
		SOLD = SOLD + 15;
	};
	if(ONARTOMM1 == 15)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_08");	//Ты отличаешься особой ленью и забывчивостью.
		AI_Output(self,other,"DIA_Onar_HowMuch_14_09");	//Поработай пока даром.
		SOLD = 0;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Дай мне подумать...
	temp1 = other.level * SOLD;

	if(temp1 == 0)
	{
		SOLD = 10;
	};
	if(temp1 <= 250)
	{
		SOLD = 50;
	};
	if((temp1 > 250) && (temp1 <= 500))
	{
		SOLD = 100;
	};
	if((temp1 > 500) && (temp1 <= 750))
	{
		SOLD = 150;
	};
	if((temp1 > 750) && (temp1 <= 1000))
	{
		SOLD = 200;
	};
	if(temp1 > 1000)
	{
		SOLD = 250;
	};

	B_Say_Gold(self,other,SOLD);
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//Что скажешь?
	Info_ClearChoices(DIA_Onar_HowMuch);
	Info_AddChoice(DIA_Onar_HowMuch,"Хорошо!",DIA_Onar_HowMuch_Ok);
	Info_AddChoice(DIA_Onar_HowMuch,"Здесь не все...",DIA_Onar_HowMuch_More);
	Info_AddChoice(DIA_Onar_HowMuch,"В день?",DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//В день?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//Кем ты себя возомнил? В неделю! Да и этого для тебя много.

	if(RhetorikSkillValue[1] >= 30)
	{
		AI_Output(other,self,"DIA_Onar_HowMuch_New_00_02");	//Просто я мог бы принести больше пользы твоей ферме, но у меня иногда бывают проблемы со снаряжением.
		AI_Output(self,other,"DIA_Onar_HowMuch_New_00_03");	//Белиар бы тебя побрал! Ладно. Жалованье можешь получать каждый день.
		AI_Output(self,other,"DIA_Onar_HowMuch_New_00_04");	//Но только больше не болтай всякой чепухи.
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
		Info_ClearChoices(DIA_Onar_HowMuch);
		SOLD = SOLD + 20;
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//Давай, подойди сюда и забери свои деньги.
		AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//Я не собираюсь подносить их тебе.
	};
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//Здесь не все...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Конечно, но ты можешь поработать на меня совсем бесплатно, если хочешь.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Это все, что ты получишь!
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

func void DIA_Onar_HowMuch_Ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Хорошо!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//Я тоже так думаю. А теперь иди, поговори с Ли.
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Я могу получить у Онара причитающееся мне вознаграждение, когда мне это заблагорассудится.");
	Info_ClearChoices(DIA_Onar_HowMuch);
};

var int OnarPissOffGold;

instance DIA_Onar_CollectGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 8;
	condition = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent = TRUE;
	description = "Заплати мне мое жалование!";
};

func int DIA_Onar_CollectGold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Onar_HowMuch) && (OnarPissOffGold == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Onar_CollectGold_Info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Заплати мне мое жалование!

	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//Я плачу наемникам, а не охотникам на драконов.
		OnarPissOffGold = TRUE;
	}
	else if(Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//Ты плохо справляешься со своими поручениями!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//Я спросил Торлофа, как у тебя идут дела. И он сказал мне, что на выполнение работы у тебя уходит целая вечность.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//Я не собираюсь платить лодырям.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//Теперь ты должен отработать несколько недель без оплаты! Может быть, тогда ты усвоишь этот урок.
	}
	else if(B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//Я слышал, что ты устроил заварушку. Сначала пойди к Ли и урегулируй этот вопрос.
	}
	else if(Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Ты сошел с ума?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//Ты должен поработать у меня хотя бы день. Ты получишь свое жалование завтра.
	}
	else if(Wld_GetDay() > Onar_SOLD_Day)
	{
		if(other.exp > Onar_SOLD_XP)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//Ох, ладно...(сокрушенно) Вот твое жалование.
			B_GiveInvItems(self,other,ItMi_Gold,SOLD);
			B_Say_Gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//Что? Да ты же ничего не делал, только спал и слонялся из угла в угол!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//Я не собираюсь платить за это!
		};
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};

instance DIA_Onar_MariaGold(C_Info)
{
	npc = Bau_900_Onar;
	nr = 9;
	condition = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent = FALSE;
	description = "Мария думает, что я получаю недостаточно.";
};

func int DIA_Onar_MariaGold_Condition()
{
	if(Maria_MehrGold == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_MariaGold_Info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Мария думает, что я получаю недостаточно.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//Что?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//Она сказала, что ты должен платить мне больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//Эта баба сует свой нос во все щели!
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Она сказала сколько?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//Нет.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//Хорошо, в следующий раз ты получишь на полсотни золотых больше.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//Но ни золотым больше, ясно?
	SOLD = SOLD + 50;
};


var int Onar_SellSheep;

instance DIA_Onar_WannaSheep(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_WannaSheep_Condition;
	information = DIA_Onar_WannaSheep_Info;
	permanent = TRUE;
	description = "Я хочу купить овцу!";
};


func int DIA_Onar_WannaSheep_Condition()
{
	if(Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Onar_WannaSheep_Info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//Я хочу купить овцу!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//А что ты тогда здесь делаешь? Ты где-то видишь здесь овцу?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//Я...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//Если ты хочешь купить овцу, иди на пастбище. Оно находится справа от моего дома.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Пепе продаст тебе одну.
	if(Npc_IsDead(Pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Боюсь, что Пепе мертв.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Ох! В таком случае...(безразлично) Оставь двести золотых монет мне и сам выбери себе овцу на пастбище.
		Onar_SellSheep = TRUE;
	};
};


instance DIA_Onar_BuyLiesel(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = DIA_Onar_BuyLiesel_Condition;
	information = DIA_Onar_BuyLiesel_Info;
	permanent = TRUE;
	description = "Вот, держи двести золотых монет! Дай мне овцу.";
};


func int DIA_Onar_BuyLiesel_Condition()
{
	if(Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Onar_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Вот, держи двести золотых монет! Дай мне овцу.
	if(B_GiveInvItems(other,self,ItMi_Gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//Ты можешь сам выбрать себе овцу на пастбище.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//Одна из них обязательно пойдет за тобой. Большинство моих овец отзываются на имя Бетси.
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//У тебя не так уж и много денег. Потому не трать понапрасну мое драгоценное время!
	};
};


instance DIA_ONAR_ONARBUSINESS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 10;
	condition = dia_onar_onarbusiness_condition;
	information = dia_onar_onarbusiness_info;
	permanent = FALSE;
	description = "Один торговец предлагает тебе сделку.";
};


func int dia_onar_onarbusiness_condition()
{
	if(MIS_ONARBUSINESS == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_onar_onarbusiness_info()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_00");	//Один торговец предлагает тебе сделку.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_01");	//Что? И как зовут того торговца?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_02");	//Его имя Лютеро. Ты его знаешь?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_03");	//Да, я его знаю - крупная птица. Что ему от меня нужно?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_04");	//Он хочет заключить с тобой договор на поставку большой партии продовольствия.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_05");	//ЧТО?! Он должен знать, что я ничего не продаю городу!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_06");	//С чего он решил, что я сделаю для него исключение?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_01_07");	//Потому, что он готов предложить тебе весьма неплохие условия!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_08");	//(с презрением) У меня и без него весьма хорошие условия.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_01_09");	//И я не вижу особой необходимости что-то менять.
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Ладно, забудь об этом.",dia_onar_onarbusiness_forget);
	Info_AddChoice(dia_onar_onarbusiness,"Твои условия?",dia_onar_onarbusiness_case);
	Info_AddChoice(dia_onar_onarbusiness,"Лютеро очень нужна это сделка.",dia_onar_onarbusiness_need);
	Info_AddChoice(dia_onar_onarbusiness,"Тебя не интересует лишнее золото?",dia_onar_onarbusiness_gold);
};

func void dia_onar_onarbusiness_gold()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Gold_01_01");	//Тебя не интересует лишнее золото?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_02");	//Ты что же, наглец, считаешь меня грязным оборванцем, готовым броситься на любую подачку, как собака на кость?!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_03");	//У меня столько золота, сколько ни тебе, ни твоему Лютеро даже и не снилось!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_04");	//Его даже хватит на то, чтобы купить весь ваш город и этих зажравшихся паладинов с потрохами. Так и знай!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Gold_01_05");	//А теперь убирайся вон с моего двора! И чтобы духу тут твоего больше не было!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_need()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_01");	//Лютеро очень нужна это сделка.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_02");	//Это его личные проблемы, и меня это мало интересует.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_03");	//Но у тебя же все амбары ломятся от излишка еды!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Need_01_04");	//Что тебе стоит продать ему немного продовольствия?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_05");	//Я же сказал, что не намерен что-либо продавать ни ему, ни городу. Что тут непонятного?!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_06");	//Может быть, тогда все вы там побыстрее передохните с голоду!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_07");	//Особенно это касается ваших паладинов, будь они не ладны!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_08");	//Так что лучше убирайся вон с моего двора, и не смей больше обращаться ко мне с подобными вопросами.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Need_01_09");	//Да поживее, пока мои ребята не пересчитали тебе ребра!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_case()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Case_01_01");	//Твои условия?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_02");	//Что?! Какие условия? Я что, с тобой о чем-то договаривался?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Case_01_03");	//Я просто спросил, на каких условиях ты готов продать Лютеро это продовольствие.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_04");	//Да, парень, наглости тебе не занимать.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_05");	//Так вот теперь послушай меня - не будет никаких условий!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_06");	//Я не продам Лютеро ничего из того, что ему нужно!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_07");	//Так можешь ему и передать.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_08");	//А теперь убирайся прочь с моего двора, пока я окончательно не вышел из себя!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Case_01_09");	//Вон, я сказал!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_forget()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Forget_01_01");	//Ладно, забудь об этом.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Forget_01_02");	//Постой! Мы еще не закончили этот разговор.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Forget_01_03");	//Ответь мне: зачем Лютеро понадобилось столько продовольствия?
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Этого я не знаю.",dia_onar_onarbusiness_dontknow);
	Info_AddChoice(dia_onar_onarbusiness,"Просто он хочет побольше заработать на нужде города.",dia_onar_onarbusiness_deal);
	Info_AddChoice(dia_onar_onarbusiness,"Потому что его склады пусты.",dia_onar_onarbusiness_empty);
	Info_AddChoice(dia_onar_onarbusiness,"Это продовольствие для паладинов.",dia_onar_onarbusiness_paladin);
};

func void dia_onar_onarbusiness_paladin()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Paladin_01_01");	//Это продовольствие для паладинов.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_02");	//(гневно) ЧТО?! Да он с ума сошел!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_03");	//И он думает, что после этого я ему что-то продам?!
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Paladin_01_04");	//А что в этом такого?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_05");	//Знаешь, я пока еще не выжил из ума, чтобы начать продавать еду своим врагам.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_06");	//Так и передай ему. А теперь убирайся прочь с моего двора!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Paladin_01_07");	//Вон, я сказал!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_empty()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Empty_01_01");	//Потому что его склады пусты.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_02");	//Да?! Хммм. Что-то мне в это слабо верится.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_03");	//Особенно учитывая то, что многие другие фермы почти все продовольствие продают именно ему.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_04");	//Знаешь, я думаю, что ты просто морочишь мне голову и пытаешься обмануть.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_05");	//А больше всего на свете я не люблю врунов.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_06");	//Так что убирайся прочь с моего двора, жалкий обманщик.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_07");	//Иначе мои ребята пересчитают тебе ребра!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Empty_01_08");	//Вон, я сказал! 
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_dontknow()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_DontKnow_01_01");	//Этого я не знаю.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_02");	//Да?! Хммм. Очень странно!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_03");	//Послать ко мне человека и не сказать ему, почему.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_04");	//Знаешь, я думаю, что ты просто держишь меня за идиота!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_05");	//И мне это очень не по душе!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_06");	//Так что лучше убирайся прочь с моих глаз, пока я не приказал своим ребятам вышвырнуть тебя отсюда.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DontKnow_01_07");	//Я все сказал!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_deal()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Deal_01_01");	//Просто он хочет побольше заработать на нужде города.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_02");	//Хммм. А я погляжу, этот Лютеро еще тот делец.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Deal_01_03");	//А тебя это удивляет?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_04");	//Нисколько! Я сам точно так же поступил бы.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Deal_01_05");	//Ладно, и последний вопрос: скажи, почему он не пришел сюда сам, а прислал тебя ко мне?
	Info_ClearChoices(dia_onar_onarbusiness);
	Info_AddChoice(dia_onar_onarbusiness,"Откуда мне знать?",dia_onar_onarbusiness_dntknw);
	Info_AddChoice(dia_onar_onarbusiness,"Он слишком заметная фигура для таких дел.",dia_onar_onarbusiness_secret);
	Info_AddChoice(dia_onar_onarbusiness,"Не твоего ума дело.",dia_onar_onarbusiness_noneyou);
};

func void dia_onar_onarbusiness_dntknw()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_DntKnw_01_01");	//Откуда мне знать?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_02");	//Да?! Хммм. Очень странно!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_03");	//Послать ко мне человека и не сказать ему, почему.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_04");	//Знаешь, я думаю, что ты просто держишь меня за идиота!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_05");	//И мне это очень не по душе!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_06");	//Так что лучше убирайся прочь с моих глаз, пока я не приказал своим ребятам вышвырнуть тебя отсюда.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_DntKnw_01_07");	//Я все сказал!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_secret()
{
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_01");	//Он слишком заметная фигура для таких дел.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_02");	//То есть? Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_03");	//Если городское ополчение или паладины узнают, что он ведет с тобой дела, его тут же посадят в тюрьму.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_04");	//Поэтому, чтобы лишний раз не давать повода для всяких сплетен, он прислал меня.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_05");	//А тебя что-то не устраивает?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_06");	//Хммм. Да, меня кое-что не устраивает.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_Secret_01_07");	//И что же именно?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_08");	//Ну, для начала, обычно я привык договариваться с самим хозяином, а не с его цепным псом!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_09");	//Далее выходит так, что он действует на свой страх и риск, а это слишком все ненадежно!
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_10");	//Я не склонен давать паладинам повод лишний раз наносить сюда свой визит.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_11");	//Поэтому передай Лютеро, что я отказываюсь от его предложения.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_12");	//И нам с тобой, как ты понимаешь, больше обсуждать нечего.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_Secret_01_13");	//Проваливай!
	ONARNOTAGREED = TRUE;
	B_LogEntry(TOPIC_ONARBUSINESS,"Я не смог договориться с Онаром о поставках продовольствия для гильдии.");
	AI_StopProcessInfos(self);
};

func void dia_onar_onarbusiness_noneyou()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_01");	//Не твоего ума дело.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_02");	//И хватит задавать мне всякие наводящие вопросы - я уже от них устал.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_03");	//Просто скажи: ты согласен на эту сделку или нет?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_04");	//Ладно, ладно, не горячись.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_05");	//Сам понимаешь, пока не поговоришь с человеком, - не поймешь, из какого теста он слеплен.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_06");	//И вижу, что ты - парень вроде ничего. Если у Лютеро такие люди, с ним, я думаю, можно вести дела.
	AI_Output(other,self,"DIA_Onar_OnarBusiness_NoneYou_01_07");	//Так что передать Лютеро?
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_08");	//Ладно. Передай ему, что я дал добро.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_09");	//Думаю, это будет выгодное для нас с ним дельце.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_10");	//Да и лишнее золото мне сейчас совсем не помешает.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_11");	//Однако предупреди его сразу, что ему это продовольствие обойдется недешево.
	AI_Output(self,other,"DIA_Onar_OnarBusiness_NoneYou_01_12");	//Раза в три дороже, чем я обычно продаю.
	ONARAGREED = TRUE;
	
	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_ONARBUSINESS,"Я договорился с Онаром о поставках продовольствия для гильдии.");
	Info_ClearChoices(dia_onar_onarbusiness);
};


instance DIA_ONAR_ORCS(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = dia_onar_orcs_condition;
	information = dia_onar_orcs_info;
	permanent = FALSE;
	description = "И как тебе вся эта ситуация?";
};


func int dia_onar_orcs_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_orcs_info()
{
	AI_Output(other,self,"DIA_Onar_Orcs_01_00");	//И как тебе вся эта ситуация?
	AI_Output(self,other,"DIA_Onar_Orcs_01_01");	//О чем это ты?
	AI_Output(other,self,"DIA_Onar_Orcs_01_02");	//Я об орках! Ты не боишься, что они в скором времени могут пожаловать и на твою ферму?
	AI_Output(self,other,"DIA_Onar_Orcs_01_03");	//(нервно) Может и так. Но, надеюсь, что Ли этого не допустит.
	AI_Output(self,other,"DIA_Onar_Orcs_01_04");	//Или, быть может, по-твоему, я зря плачу его людям за свою собственную безопасность?
	AI_Output(other,self,"DIA_Onar_Orcs_01_05");	//Но орков куда больше, чем наемников. Не думаю, что они в силах остановить целую армию этих тварей.
	AI_Output(self,other,"DIA_Onar_Orcs_01_06");	//В таком случае нам всем пришел конец. Однако я не собираюсь сидеть и ныть по этому поводу!
	AI_Output(self,other,"DIA_Onar_Orcs_01_07");	//Если уж мне и суждено умереть, то, по крайней мере, это произойдет здесь, на земле моих предков.
	AI_Output(self,other,"DIA_Onar_Orcs_01_08");	//И уж поверь, я не дамся оркам голыми руками!
};


instance DIA_ONAR_PALADINHERE(C_Info)
{
	npc = Bau_900_Onar;
	nr = 5;
	condition = dia_onar_paladinhere_condition;
	information = dia_onar_paladinhere_info;
	permanent = FALSE;
	description = "Паладины лорда Хагена прибыли на ферму.";
};


func int dia_onar_paladinhere_condition()
{
	if(MOVEFORCESCOMPLETE_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_paladinhere_info()
{
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_00");	//Паладины лорда Хагена прибыли на ферму.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_01");	//Да, мне это уже известно. И, по правде говоря, я первый раз в своей жизни рад этому факту!
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_02");	//Возможно, с их помощью нам действительно удастся дать отпор оркам.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_03");	//Однако было бы лучше, случись это куда быстрей!
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_04");	//А к чему такая спешка?
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_05");	//К тому, что иначе мои запасы еды в скором времени могут превратиться в пыль.
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_06");	//Едят они, скажу тебе, не меньше моих наемников!
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_07");	//Полагаю, что твоим амбарам вполне по силам прокормить и большее количество людей.
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_08");	//Так что не жалуйся. А лучше скажи спасибо, что кто-то еще готов отдать за тебя свою жизнь.
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_09");	//Тебе ясно?
	AI_Output(self,other,"DIA_Onar_PaladinHere_01_10");	//Хммм...(прикусив язык)
	AI_Output(other,self,"DIA_Onar_PaladinHere_01_11");	//Хорошо! Вижу, что ты меня понял.
};

instance DIA_ONAR_TOWER_APP_GOOD(C_Info)
{
	npc = Bau_900_Onar;
	nr = 11;
	condition = dia_onar_tower_app_good_condition;
	information = dia_onar_tower_app_good_info;
	permanent = FALSE;
	description = "К югу от вашей фермы находится старая башня.";
};

func int dia_onar_tower_app_good_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE)) 
	{
		return TRUE;
	};
};

func void dia_onar_tower_app_good_info()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_00");	//К югу от вашей фермы находится старая башня. Темные личности оттуда вам не докучали в последнее время?
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_01");	//А тебе какое дело? Ну, жаловались на них крестьяне, и что?
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_02");	//Благодаря мне они больше вас не побеспокоят.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_03");	//Ааа, это ты. Мне уже докладывали, что кто-то умудрился вырезать всех этих бандюг.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_04");	//Вот, держи за труды. А теперь проваливай, у меня дел невпроворот.
	B_GiveInvItems(self,other,ItMi_Gold,25);
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_05");	//Погоди, это не все.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_06");	//Что еще тебе от меня надо?
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_15_07");	//Я хотел бы поселиться в этой башне.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_08");	//Ааа, так это ты. Ты что, всех моих людей на уши поднял? Сначала Ли про тебя докладывал, потом Мария мне мозги парила.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_09");	//Признаюсь, то, о чем они мне говорили, меня заинтересовало.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_10");	//Но не настолько, чтобы просто отдать тебе башню.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_14_11");	//Ты можешь жить в ней, если готов платить аренду. Сто золотых в день. Согласен?
	Info_ClearChoices(dia_onar_tower_app_good);
	Info_AddChoice(dia_onar_tower_app_good,"Сто монет – слишком большая цена.",dia_onar_tower_app_good_maybe);
	Info_AddChoice(dia_onar_tower_app_good,"Хорошо! По рукам.",dia_onar_tower_app_good_yes);
	Info_AddChoice(dia_onar_tower_app_good,"Слишком дорого.",dia_onar_tower_app_good_no);
};

func void dia_onar_tower_app_good_maybe()
{
	if((RhetorikSkillValue[1] >= 50) || ((MARIA_APPROVES_TOWER == TRUE) && (LEE_APPROVES_TOWER == TRUE)))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_00");	//Сто монет – слишком большая цена.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_01");	//Твоя башня годами стоит, не принося тебе ни монеты. Еще пару лет - и она рухнет от старости.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_02");	//В ней готово селиться лишь отребье вроде бандитов, от которых у твоей фермы одни проблемы.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_03");	//Я же предлагаю избавить тебя от них. Приведение башни в порядок потребует огромных затрат, которые я предлагаю взять на себя.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_04");	//Тебе не нужно пошевелить и пальцем, чтобы ситуация в том районе наладилась, ты же еще хочешь за это содрать с меня деньги.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_05");	//Так что нет, я не заплачу тебе ни монеты.
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_06");	//Хочешь и дальше проблем с бандитами, хочешь и дальше терять деньги - оставляй башню себе! Можешь ею подавиться.
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_07");	//Что?! Чтооо?! Да как ты смеешь?! Да я тебя...
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_08");	//Эммм... хммм... Ааа, ладно! Забирай чертову башню! Все равно одни проблемы из-за нее.
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_09");	//Ну, и раз Ли и моя жена за тебя ручаются, то доверюсь и я. Но чтобы я больше никогда не слышал ни о каких бандитах в том районе!
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_10");	//Даю слово, что ты не пожалеешь о своем решении.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_00");	//Хорошо. Итак, вопрос с деньгами мы уладили.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_01");	//Тебе что-нибудь еще от меня надо? Если надо, говори сейчас и больше меня не беспокой.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_02");	//Надо. Чтобы нормально жить в той башне, мне придется найти для нее охрану.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_03");	//Скорее всего, я найму несколько людей для этого. Возможно, мне также понадобится кто-нибудь еще.
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_04");	//Одним словом, я не хочу, чтобы твои наемники как-то мешали людям, приходящим ко мне.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_05");	//Хорошо. Ты можешь приглашать туда кого угодно, если только они не будут растаскивать башню по кирпичикам или хоть как-то мешать работе на моей ферме.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_06");	//Еще просьбы будут?
		AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Пока нет.
		AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_08");	//Тогда до свидания. Надеюсь, ты не доставишь мне проблем, и я не пожалею о своем решении.
		B_LogEntry(TOPIC_MYNEWMANSION,"Проблема с Онаром улажена, осталось рассказать Хагену.");
		DECISION_TOWER_MADE = TRUE;
		DT_TOTAL_DAILY_PAYMENTS_ONAR = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Onar_Tower_App_Good_maybe_15_12");	//Сто монет – слишком большая цена. Может, договоримся о скидке?
		AI_Output(self,other,"DIA_Onar_Tower_App_Good_maybe_14_13");	//ЧТО? Ты еще торговаться будешь? Проваливай отсюда, и чтобы я твоего духу здесь больше не видел.
	};
};

func void dia_onar_tower_app_good_yes()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_yes_15_00");	//Хорошо! По рукам.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_00");	//Вот и славно. Итак, вопрос с деньгами мы уладили.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_01");	//Тебе что-нибудь еще от меня надо? Если надо, говори сейчас и больше меня не беспокой.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_02");	//Надо. Чтобы нормально жить в той башне, мне придется найти для нее охрану.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_03");	//Скорее всего, я найму несколько людей для этого. Возможно, мне также понадобится кто-нибудь еще.
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_04");	//Одним словом, я не хочу, чтобы твои наемники как-то мешали людям, приходящим ко мне.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_05");	//Хорошо. Ты можешь приглашать туда кого угодно, если только они не будут растаскивать башню по кирпичикам или хоть как-то мешать работе на моей ферме.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_06");	//Еще просьбы будут?
	AI_Output(other,self,"DIA_Onar_We_Made_Deal_15_07");	//Пока нет.
	AI_Output(self,other,"DIA_Onar_We_Made_Deal_14_08");	//Тогда до свидания. Надеюсь, ты не доставишь мне проблем, и я не пожалею о своем решении.
	B_LogEntry(TOPIC_MYNEWMANSION,"Похоже, мне все же удалось уговорить Онара, пусть и не бесплатно. Надо доложить об этом Хагену.");
	DECISION_TOWER_MADE = TRUE;
	DT_TOTAL_DAILY_PAYMENTS_ONAR = 100;
	AI_StopProcessInfos(self);
};

func void dia_onar_tower_app_good_no()
{
	AI_Output(other,self,"DIA_Onar_Tower_App_Good_no_15_00");	//Нет, твоя цена чрезмерно высока. Я отказываюсь.
	AI_Output(self,other,"DIA_Onar_Tower_App_Good_no_14_01");	//Раз не можешь позволить себе такие копеечные расходы, нечего и мое время занимать. Проваливай.
	B_LogEntry(TOPIC_MYNEWMANSION,"Мне не удалось уговорить Онара. Без его согласия попытки устроиться в башне обернуться большими проблемами.");
	MIS_MYNEWMANSION = LOG_FAILED;
	MIS_DTOLDNEWMINE = LOG_FAILED;
	AI_StopProcessInfos(self);
};