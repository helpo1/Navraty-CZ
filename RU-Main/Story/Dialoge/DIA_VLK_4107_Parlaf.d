
instance DIA_Parlaf_EXIT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 999;
	condition = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parlaf_HALLO(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_HALLO_Condition;
	information = DIA_Parlaf_HALLO_Info;
	description = "Привет, как дела?";
};


func int DIA_Parlaf_HALLO_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HALLO_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Привет, как дела?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//А как, по-твоему? Я провел целый день за точильным кругом, затачивая клинки.
	if(Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//А вчера Энгор опять урезал наш паек. Если он будет продолжать в том же духе, мы все помрем с голода.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//Или нас всех перебьют орки. Не самая радужная перспектива.
	};
};


instance DIA_Parlaf_ENGOR(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_ENGOR_Condition;
	information = DIA_Parlaf_ENGOR_Info;
	description = "Кто такой Энгор?";
};


func int DIA_Parlaf_ENGOR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Кто такой Энгор?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Энгор заведует провизией и выдает пайки. А они становятся все меньше с каждой неделей.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//Конечно, с ним можно договориться, но только за золото и весьма недешево.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//А ты не можешь позволить себе это?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//За те гроши, что нам платят, я могу купить только пару реп!
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC,"Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");
};


instance DIA_Parlaf_Wo(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_Wo_Condition;
	information = DIA_Parlaf_Wo_Info;
	permanent = FALSE;
	description = "Где мне найти этого Энгора?";
};


func int DIA_Parlaf_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parlaf_ENGOR) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Где мне найти этого Энгора?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//В доме рыцарей! Пройди через открытый вход рядом с кузницей.
};


instance DIA_Parlaf_HUNGRIG(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_HUNGRIG_Condition;
	information = DIA_Parlaf_HUNGRIG_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Parlaf_HUNGRIG_Condition()
{
	if((MIS_Engor_BringMeat != LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Что новенького?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Этот чертов Энгор должен увеличить пайки!
};


instance DIA_Parlaf_SATT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_SATT_Condition;
	information = DIA_Parlaf_SATT_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_Parlaf_SATT_Condition()
{
	if(((MIS_Engor_BringMeat == LOG_SUCCESS) || Npc_IsDead(Engor)) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};


var int DIA_Parlaf_SATT_OneTime;

func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Что новенького?

	if((DIA_Parlaf_SATT_OneTime == FALSE) && (Npc_IsDead(Engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Энгор раздал мясные пайки. Ох, как долго я этого ждал.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Твое прибытие - это единственная действительно свежая новость.
	};
};

instance DIA_Parlaf_DobarOut(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Condition;
	information = DIA_Parlaf_DobarOut_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Condition()
{
	if(MIS_DobarOut == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_00");	//(испуганно) Кто здесь? Ах, это ты...
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_01");	//Так вот куда ты забился. Но как тебя сюда занесло?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_02");	//(подавленно) Однажды ночью Добар разбудил меня и предложил сбежать из замка. И я, дурак, послушал его.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_03");	//Но из этой долины, похоже, не выбраться живым... (тихо) Ну, разве что только тебе это каким-то образом удается.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_04");	//Ближе к делу. Куда делся Добар, и как ты здесь очутился?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_05");	//А-ах... да, хорошо, хорошо. Следующей ночью нам удалось незамеченными спуститься по тарану – Удар, кажется, отошел отлить, а Сенграта вообще не было на посту.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_06");	//Мы почти уже покинули осадное кольцо, как вдруг нас заметила группа орков.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_07");	//Времени на раздумья не было – мы бросились со всех ног в разные стороны. 
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_08");	//Я бежал без оглядки вдоль скалы, пока не заметил уступ, после чего вскарабкался сюда.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_09");	//И орки не видели, как ты сюда залез?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_10");	//Я сам удивлен тому, что еще жив. Они не могли этого не увидеть...(почесывая затылок)
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_11");	//Думаю, они просто знали, что мне отсюда некуда деваться, и предпочли поиздеваться надо мной, оставив меня помирать здесь с голоду.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_12");	//Других предположений у меня нет.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_13");	//А куда побежал Добар?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_14");	//Я не знаю... говорю же, все произошло так внезапно. Но побежал он точно не в этом направлении.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_15");	//Понятно... И что мне теперь с тобой делать?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_16");	//Я... я был бы тебе очень признателен, если... если ты проводишь меня обратно в замок.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_17");	//Только... боюсь представить, как Гаронд отреагирует на мое дезертирство...
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_18");	//Не думаю, что тебя ждет слишком суровое наказание. Я разговаривал с ним, и его явно больше заботят другие проблемы.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_19");	//Так что говори мне сразу – вести тебя в замок или нет?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_20");	//А, будь что будет... я пойду с тобой.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_21");	//Тогда идем.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_22");	//Хорошо, веди.
	B_LogEntry(TOPIC_DobarOut,"Мне нужно отвести Парлафа обратно в замок.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	ParlafFind = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_Parlaf_DobarOut_Come(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Come_Condition;
	information = DIA_Parlaf_DobarOut_Come_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Come_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (ParlafFind == TRUE) && (Npc_GetDistToWP(self,"OC_RAMP_08") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Come_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Parlaf_DobarOut_Come_01_00");	//Вот мы и пришли.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_01");	//Спасибо, приятель. Ты спас мою задницу! Боюсь только, мне нечем тебя отблагодарить. Разве что...

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_02");	//Как-то раз, заглянув в часовню, я нашел там рунный камень. Наверно, от магов остался. Думаю, он тебе пригодится.
		B_GiveInvItems(self,other,ItMi_HighRuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_03");	//У меня осталось несколько стальных заготовок. Думаю, они тебе пригодятся.
		B_GiveInvItems(self,other,ItMiSwordraw,3);
	};

	AI_Output(other,self,"DIA_Parlaf_DobarOut_Come_01_04");	//Благодарю.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	ParlafOnPlace = TRUE;
	B_LogEntry(TOPIC_DobarOut,"Я привел Парлафа обратно в замок. Думаю, стоит сообщить об этом Гаронду.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"StartNew");
};

instance DIA_Parlaf_DobarDead(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_DobarDead_Condition;
	information = DIA_Parlaf_DobarDead_Info;
	permanent = FALSE;
	description = "Я нашел Добара неподалеку от замка. Он мертв.";
};

func int DIA_Parlaf_DobarDead_Condition()
{
	if((ParlafOnPlace == TRUE) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Parlaf_DobarDead_01_00");	//Я нашел Добара неподалеку от замка. Он мертв.
	AI_Output(self,other,"DIA_Parlaf_DobarDead_01_01");	//Эх... не стоило нам все-таки бежать. Земля ему пухом.
};

instance DIA_Parlaf_WorkAgain(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_WorkAgain_Condition;
	information = DIA_Parlaf_WorkAgain_Info;
	permanent = FALSE;
	description = "Гаронд решил не наказывать тебя.";
};

func int DIA_Parlaf_WorkAgain_Condition()
{
	if(MIS_DobarOut == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_WorkAgain_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Parlaf_WorkAgain_01_00");	//Гаронд решил не наказывать тебя.
	AI_Output(other,self,"DIA_Parlaf_WorkAgain_01_01");	//Ты должен будешь, как и прежде, заниматься заточкой клинков.
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_02");	//Ох, я уже боялся худшего...
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_03");	//Но теперь я ни за что не высунусь из замка, покуда хотя бы одна из тварей вокруг него будет жива.
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_04");	//Спасибо тебе огромное!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Parlaf_PICKPOCKET(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 900;
	condition = DIA_Parlaf_PICKPOCKET_Condition;
	information = DIA_Parlaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Parlaf_PICKPOCKET_Condition()
{
	return C_Beklauen(34,12);
};

func void DIA_Parlaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,Dialog_Back,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};