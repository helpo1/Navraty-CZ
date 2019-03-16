
instance DIA_Harad_EXIT(C_Info)
{
	npc = VLK_412_Harad;
	nr = 999;
	condition = DIA_Harad_EXIT_Condition;
	information = DIA_Harad_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

var int FirstTalkHarad;

instance DIA_Harad_NoTalkAtAll(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_NoTalkAtAll_Condition;
	information = DIA_Harad_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_NoTalkAtAll_Info()
{
	if(FirstTalkHarad == FALSE)
	{
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_00");	//(грозно) Эй, тебе чего здесь надо?
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_01");	//Тебе здесь нечего делать! Вон отсюда!
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_02");	//И чтобы духу твоего здесь больше не было.
		FirstTalkHarad = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_NoTalkAtAll_12_03");	//Я сказал вон!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Harad_Hallo(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Hallo_Condition;
	information = DIA_Harad_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Harad_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == TRUE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(раздраженно) Что ты хочешь?
};

instance DIA_Harad_Arbeit(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Arbeit_Condition;
	information = DIA_Harad_Arbeit_Info;
	permanent = FALSE;
	description = "Я ищу работу!";
};

func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Хм - мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Брайан скоро закончит свое обучение, а затем покинет город.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//А ты на что-нибудь годишься?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//Если ты имеешь в виду, знаю ли я работу кузнеца.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//Нет. Я о другом.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Рано или поздно, придут орки и возьмут город в кольцо. И тогда в расчет будут приниматься только мужчины, способные защищать город.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//А я не хочу, чтобы мой ученик опозорил мое имя, сбежав из города вместе с женщинами и никчемными бездельниками, вместо того, чтобы держать оборону вместе с другими мужчинами.
	};
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);
	B_LogEntry(TOPIC_Lehrling,"Если я смогу убедить Харада, что я хоть на что-нибудь гожусь, он примет меня в ученики.");
};


instance DIA_Harad_Taugenichts(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Taugenichts_Condition;
	information = DIA_Harad_Taugenichts_Info;
	permanent = FALSE;
	description = "Я не никчемный!";
};

func int DIA_Harad_Taugenichts_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//Я не никчемный!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//Это громкие слова! А ты можешь подтвердить их такими же громкими делами?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Принеси мне оружие орков.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Орков недавно видели около города. Я думаю, тебе не придется искать их слишком долго.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//Если тебе удастся завалить одного из них, я возьму тебя в ученики.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Если, конечно, другие мастера будут согласны.
	MIS_Harad_Orc = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrk,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk,LOG_Running);
	B_LogEntry(TOPIC_HaradOrk,"Неподалеку от города видели орка. Кузнец Харад хочет, чтобы я убил его. Оружие орка послужит достаточным доказательством.");
};


instance DIA_Harad_OrcRunning(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcRunning_Condition;
	information = DIA_Harad_OrcRunning_Info;
	permanent = FALSE;
	description = "Давай еще поговорим об этих орках.";
};


func int DIA_Harad_OrcRunning_Condition()
{
	if((MIS_Harad_Orc == LOG_Running) && (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Давай еще поговорим об этих орках.
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//Что?
	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning,"Можешь считать своего орка мертвым!",DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning,"Орк это очень серьезный противник.",DIA_Harad_OrcRunning_TooHard);
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//Но орк это очень серьезный противник.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Хм - судя по тому, как ты выглядишь, возможно ты прав. У тебя слишком мало мяса на костях. Но это можно поправить.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Том не менее, ты должен доказать мне, что у тебя хватит мужества сражаться, если это будет необходимо.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//А нет ли для меня противника немного поменьше?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Хм - (задумчиво) Хакон, торговец оружием на рыночной площади, сказал мне, что на него напали бандиты несколько дней назад.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//Эти ублюдки, по слухам, устроили себе логово где-то за восточными воротами.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Эти трусливые шакалы не должны быть так уж сильны. Убей этих ублюдков! Всех!
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Тогда я пойму, что ты не опозоришь наш город.
	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling,LOG_Running);

	if(MIS_HakonBandits != LOG_Running)
	{
		B_LogEntry(TOPIC_Lehrling,"Харад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь. Я должен поговорить с Хаконом. Возможно, он знает, где скрываются эти бандиты.");
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling,"Харад сказал мне, что бандиты ограбили торговца Хакона недалеко от города. Если я смогу убить их, это убедит его, что я хоть на что-то гожусь.");
	};
	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Можешь считать своего орка мертвым!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Хорошо! Тогда не трать слова попусту. Пусть твои дела сами говорят за себя.
	Info_ClearChoices(DIA_Harad_OrcRunning);
};


instance DIA_Harad_OrcSuccess(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcSuccess_Condition;
	information = DIA_Harad_OrcSuccess_Info;
	permanent = FALSE;
	description = "Я принес тебе оружие орков, как ты хотел.";
};


func int DIA_Harad_OrcSuccess_Condition()
{
	if(MIS_Harad_Orc == LOG_Running)
	{
		if((Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0) || (Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0) || (Npc_HasItems(other,itmw_addon_keule_1h_03) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//Я принес тебе оружие орков, как ты хотел.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Покажи!

	if(Npc_HasItems(other,ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcAxe_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_04,1);
	}
	else if(Npc_HasItems(other,itmw_addon_keule_1h_03) > 0)
	{
		B_GiveInvItems(other,self,itmw_addon_keule_1h_03,1);
		Npc_RemoveInvItems(self,itmw_addon_keule_1h_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_01) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_01,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_01,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_02) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_02,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_02,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_03) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_03,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_03,1);
	}
	else if(Npc_HasItems(other,ItMw_2H_OrcSword_04) > 0)
	{
		B_GiveInvItems(other,self,ItMw_2H_OrcSword_04,1);
		Npc_RemoveInvItems(self,ItMw_2H_OrcSword_04,1);
	};

	if(Harad_HakonMission == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//Ты ВСЕ ЖЕ сделал это?! Ты настоящий мужчина!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//Давно уже не держал я подобного оружия в своих руках - с тех пор как был солдатом во время Войны с Орками.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//Да уж, суровые то были времена, скажу я тебе.

	if(Player_IsApprentice == APP_Harad)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//Я знал, что из тебя получится хороший ученик. Отличная работа!
	}
	else if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//Я не думал, что тебе удастся это. Я поражен!
		B_LogEntry(TOPIC_Lehrling,"Харад согласен взять меня в ученики, если я получу согласие других мастеров.");
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Жаль, только, что ты выбрал другое ремесло.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//Ты бы очень пригодился мне.
	};

	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
};

instance DIA_Harad_OrcWar(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Condition;
	information = DIA_Harad_OrcWar_Info;
	permanent = FALSE;
	description = "Ты сказал, что воевал с орками.";
};

func int DIA_Harad_OrcWar_Condition()
{
	if(MIS_Harad_Orc == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Info()
{
	AI_Output(other,self,"DIA_Harad_OrcWar_01_00");	//Ты сказал, что воевал с орками.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_01");	//Это было очень давно...(задумчиво) Я тогда еще был совсем мальчишкой, как и ты.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_02");	//Может, расскажешь немного о своих подвигах?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_03");	//(серьезно) Хочешь послушать? Ну что же, хорошо.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_04");	//...(покашливая) Я служил в королевском гарнизоне Фаринга и охранял горный перевал, ведущий из Нордмара в Миртану.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_05");	//Нападения орков для нас были довольно привычным делом. 
	AI_Output(self,other,"DIA_Harad_OrcWar_01_06");	//Это и понятно. Ведь сам перевал являлся для них крайне важной стратегической точкой.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_07");	//Так как он открывал проход не только в саму Миртану, но и к столице королевства - Венгарду!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_08");	//Поэтому орки и предпринимали постоянные попытки выбить нас из той крепости. 
	AI_Output(other,self,"DIA_Harad_OrcWar_01_09");	//Но судя по всему, это им не особо удавалось.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_10");	//Да, ты прав...(посмеиваясь) Все в основном сводилось к небольшим стычкам на подступах к перевалу.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_11");	//Так продолжалось на протяжении очень долгого времени...(задумчиво) Пока не наступил решающий момент!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_12");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_13");	//Я говорю про сражение, которое известно всему миру как Битва у Снежной Горы.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_14");	//Мне довелось принять участие в ней, и именно там я стал настоящим мужчиной!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_15");	//Расскажи, как это было.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_16");	//Это был кромешный ад, парень...(серьезно) Орки хорошо подготовились к атаке!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_17");	//Против нас выступило по меньшей мере около двух тысяч орков. 
	AI_Output(self,other,"DIA_Harad_OrcWar_01_18");	//Причем основной костяк их армии составляли элитные черные орки, что бывает крайне редко.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_19");	//Так вот, сначала они два дня мордовали нас огромными валунами из своих катапульт. А на рассвете третьего пошли на штурм!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_20");	//Я не буду описывать тебе все ужасы того сражения, но мы выстояли тогда только благодаря нашему мужеству и храбрости.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_21");	//Кммм...(покашливая) Ну и небольшому отряду паладинов, который прибыл к нам на подмогу из Готы.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_22");	//С их помощью уже к вечеру мы смогли отбросить орков обратно за перевал, в Нордмар.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_23");	//Вот так и закончилась эта великая битва!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_24");	//С тех пор у меня остался только мой меч, коим я сражался в тот день.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_25");	//Я сохранил его как напоминание о том, чего стоит мужество и храбрость людей!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_26");	//А что это за меч?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_27");	//Я дал ему имя - 'Убийца орков'! И, клянусь Инносом, он оправдывает свое название.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_28");	//Мне лично удалось тогда прикончить не одну дюжину орков этим мечом.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_29");	//На нем до сих пор остались пятна засохшей орочей крови.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_30");	//Да, впечатляет! А ты случайно не продаешь этот меч?
	AI_Output(other,self,"DIA_Harad_OrcWar_01_31");	//Мне бы совсем не помешало иметь под рукой такое легендарное оружие.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_32");	//Нет! Я тебе его не продам. Даже и не мечтай!
	AI_Output(self,other,"DIA_Harad_OrcWar_01_33");	//А если ты действительно хочешь его заполучить, то для начала принеси мне орочий амулет воина.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_34");	//Тогда я точно буду знать, что мое оружие досталось мужественному и храброму человеку!
	AI_Output(other,self,"DIA_Harad_OrcWar_01_35");	//А что это за амулет?
	AI_Output(self,other,"DIA_Harad_OrcWar_01_36");	//Его обычно носят с собой элитные воины орков. Это их некий знак отличия от остальных бойцов.
	AI_Output(self,other,"DIA_Harad_OrcWar_01_37");	//Достань мне его! И тогда получишь свою награду.
	AI_Output(other,self,"DIA_Harad_OrcWar_01_38");	//Ладно, попробую.
	MIS_HaradOrcWar = LOG_Running;
	Log_CreateTopic(TOPIC_HaradOrcWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_Running);
	B_LogEntry(TOPIC_HaradOrcWar,"Харад рассказал мне о легендарной битве с орками, произошедшей на заснеженном перевале между Нордмаром и Миртаной. Он принимал в ней участие и убил тогда множество орков. В память о той битве он до сих пор хранит у себя меч, которым сражался в тот день. Он назвал его 'Убийцей Орков'! Он отдаст мне этот меч, если я принесу ему орочий амулет воина, который обычно носят при себе элитные орки.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcElite_Roam_Harad,"NW_FOREST_PATH_12");
};

instance DIA_Harad_OrcWar_Done(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_OrcWar_Done_Condition;
	information = DIA_Harad_OrcWar_Done_Info;
	permanent = FALSE;
	description = "Я принес тебе амулет элитного орка.";
};

func int DIA_Harad_OrcWar_Done_Condition()
{
	if((MIS_HaradOrcWar == LOG_Running) && (Npc_HasItems(other,ItMi_BlackOrcTalisman) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcWar_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_00");	//Я принес тебе амулет элитного орка.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_01");	//Правда?! Не поверю, пока не увижу его собственными глазами.
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_02");	//Вот, взгляни на него.
	B_GiveInvItems(other,self,ItMi_BlackOrcTalisman,1);
	Npc_RemoveInvItems(self,ItMi_BlackOrcTalisman,1);
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_03");	//(рассматривая) Да, парень, похоже, ты был прав.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_04");	//Хотя и прошло столько лет, но я узнаю эту вещицу!
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_05");	//Ну, вот видишь? Я бы тебе не стал врать.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_06");	//Ладно, ладно...(с уважением) Прости старика! Погорячился немного.
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_07");	//Просто мало кто в наше время способен справиться с элитным орком. Но ты это сделал!
	AI_Output(self,other,"DIA_Harad_OrcWar_Done_01_08");	//А посему, вот - держи мой меч! Теперь он твой.
	AI_Output(other,self,"DIA_Harad_OrcWar_Done_01_09");	//Благодарю.
	B_GiveInvItems(self,other,ITMW_1H_SWORD_ORCSLAYER_01,1);
	MIS_HaradOrcWar = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HaradOrcWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_HaradOrcWar,"Я принес Хараду орочий амулет воина, и он, как и обещал, отдал мне свой меч.");
};

var int Harad_StartGuild;

instance DIA_Harad_LEHRLING(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_LEHRLING_Condition;
	information = DIA_Harad_LEHRLING_Info;
	permanent = TRUE;
	description = "Когда я могу стать твоим учеником?";
};


func int DIA_Harad_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//Когда я могу стать твоим учеником?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		if(MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//Нам здесь совсем не помешал бы человек, способный прикончить орка.
			if(MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Кроме того, Хакон рассказал мне, как ты решил проблему с бандитами. Ты настоящий мужчина!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//Ты не убил орка, но Хакон рассказал мне, как ты решил проблему с бандитами. Это хорошо!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//Что касается моего мнения, то ты можешь приступать к работе хоть сейчас.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//А другие мастера...
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Торбен дал тебе свое благословение.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Старый добрый Торбен хочет, чтобы ты получил благословение богов. Я думаю, это хорошая идея.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Торбен говорит, что никогда не видел тебя.
		};
		if(Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Боспер пытался оговорить меня от идеи взять тебя в ученики. Он хочет, чтобы ты стал ЕГО учеником.
			if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//Я имел краткий, но напряженный разговор с ним по этому вопросу.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//В конце концов, он согласился.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//Он попросил меня, чтобы я дал тебе возможность хотя бы попробовать себя в его ремесле.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Попробуй - ты можешь принять решение чуть позже. Если, конечно, тебе нужен его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//Боспер пока не знает, кто ты такой
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//Как всегда, Константино ничего не волнует. Он сказал, что с его точки зрения, ты можешь стать моим учеником в любой момент.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Константино говорит, что ты обвиняешься в преступлении в городе - это правда?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//Если это так, то тебе нужно уладить эту проблему как можно быстрее!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Константино никогда не слышал о тебе.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//Маттео говорит, что ты вернул ему его золото. Мне кажется, ты благородный молодой человек.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//Маттео говорит, что ты ему что-то должен. Я не знаю, что у вас там за дела, но ты должен урегулировать эту проблему.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//Маттео говорит, что никогда не говорил об этом с тобой.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//Это означает, что ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Ты готов стать моим учеником?
			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING,"Хорошо - я подумаю над этим.",DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING,"Я готов!",DIA_Harad_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//Тебе нужно получить одобрение, по крайней мере, четырех мастеров. Иначе ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//Поэтому ты должен поговорить со всеми мастерами, которые еще не уверены в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Не раньше, чем докажешь мне, что хоть на что-то годен.
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	var int temp1;
	temp1 = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Отлично! Я научу тебя ковать хорошие мечи.

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//Я уже умею это!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//Что ж. Тем лучше!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Кроме того, пришло время стать немного сильнее. Ты чахнешь прямо у меня на глазах.
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04A");	//Ну, а поскольку - ты теперь мой ученик, то первый урок для тебя бесплатно.
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00A");	//Да, это бы мне не помешало.
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,10);
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04B");	//Само собой! Вот так-то лучше...(смеется) Силенок-то небось прибавилось.
	};
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04C");	//Да, и еще - вот, возьми эту одежду. Я не хочу, чтобы мой ученик разгуливал по городу в лохмотьях!
	B_GiveInvItems(self,other,itar_smith_nov,1);
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04D");	//И твое орудие труда - кузнечный молот. Не тяпкой же ты ковать собираешься?
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_04,1);
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04E");	//Ну и несколько стальных заготовок. На первое время тебе этого хватит.
	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar,"START");
	CreateInvItems(VLK_407_Hakon,itmiswordblade_1,2);
	CreateInvItems(hero,ItMiSwordraw,5);
	Harad_StartGuild = other.guild;
	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Кузнец Харад взял меня в ученики. Теперь я смогу попасть верхний район города.");
	B_LogEntry(Topic_Bonus,"Харад покупает у меня выкованное оружие по хорошей цене.");
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(TOPIC_CityTeacher,"Харад может обучить меня кузнечному делу. Также он может помочь мне стать сильнее.");
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Хорошо - я подумаю над этим.
	if(!Npc_IsDead(Brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Как знаешь. Брайан все равно еще поработает здесь некоторое время.
	};
	Info_ClearChoices(DIA_Harad_LEHRLING);
};


instance DIA_Harad_Zustimmung(C_Info)
{
	npc = VLK_412_Harad;
	nr = 2;
	condition = DIA_Harad_Zustimmung_Condition;
	information = DIA_Harad_Zustimmung_Info;
	permanent = TRUE;
	description = "Могу я стать учеником другого мастера?";
};

func int DIA_Harad_Zustimmung_Condition()
{
	if((Player_IsApprentice == APP_NONE) && Npc_KnowsInfo(other,DIA_Harad_Arbeit) && (DIA_Harad_Zustimmung_Permanent == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Harad_Zustimmung_Permanent;

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Могу я стать учеником другого мастера?

	if((MIS_Harad_Orc == LOG_SUCCESS) || ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//Ты хороший человек.

		if(MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Хакон рассказал мне, как ты разделался с бандитами.
		};

		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//Я дам тебе свое одобрение.

		if(DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
			B_LogEntry(TOPIC_Lehrling,"Харад даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		};

		if(!Npc_IsDead(Brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Брайан еще поработает здесь некоторое время. И я уверен, что рано или поздно найдется крепкий парень, способный заменить его.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//Другие мастера могут дать свое согласие на это. Но я дам сое одобрение только после того, как ты докажешь, что хоть на что-то годен!
	};
};


var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;
var int Harad_KDWKommentar;
var int Harad_SEKKommentar;
var int Harad_KDMKommentar;

instance DIA_Harad_AlsLehrling(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_AlsLehrling_Condition;
	information = DIA_Harad_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Harad_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Harad) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Harad_StartGuild != GIL_MIL) && (Harad_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//Ты теперь служишь в ополчении? Я горжусь тобой!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//Пока ты служишь в армии, естественно я не могу рассчитывать, что ты будешь выполнять еще и свои обязанности ученика.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//Но если тебе что-нибудь понадобится, можешь заходить ко мне, когда захочешь.
		Harad_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Harad_StartGuild != GIL_PAL) && (Harad_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//Тебе удалось стать паладином!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//Я рад, что когда-то взял тебя в ученики. Даже хотя ты и не проводил много времени за наковальней.
		Harad_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Harad_StartGuild != GIL_NOV) && (Harad_StartGuild != GIL_KDF) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//Так ты постригся в монастырь. Я бы предпочел, чтобы ты оставался в городе. Нам нужны сильные люди.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//Но если ты решил следовать пути Инноса, то так тому и быть.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//Если тебе будет что-нибудь нужно от меня, я всегда буду рад помочь.
		Harad_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Harad_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_10");	//О, да на тебе ряса как на Ватрасе! Только не бери молот в руки и не подходи в таком виде к наковальне, иначе я умру со смеху.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_11");	//Ну ладно. Это твой выбор. Выбор моего ученика! 
		Harad_KDWKommentar = TRUE;
	}
	else if((Harad_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_12");	//Так ты все-таки поддался этому болотному дурману? Да уж, сильные телом не всегда сильны духом.

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Harad_AlsLehrling_12_13");	//Но ты в доспехах и с мечом. Это меня радует. Это хоть как-то продолжает связывать тебя с кузнечным ремеслом.
		};

		Harad_SEKKommentar = TRUE;
	}
	else if((Harad_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_14");	//Мне, ветерану войны с орками, больно осознавать, что ты встал на сторону их повелителя и что меч, который ты выкуешь следующим, будет направлен против служителей Инноса.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_15");	//Однако жизнь одна и прожить ее нужно так, как хочешь ты сам. Я не буду зря причитать. 
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_16");	//И жалеть, что обучил тебя кузнечному делу тоже не буду. Что было, то было. Что будет, то и будет.
		Harad_KDMKommentar = TRUE;
	}
	else if((Harad_Lehrling_Day <= (Wld_GetDay() - 4)) && (Harad_MILKommentar == FALSE) && (Harad_PALKommentar == FALSE) && (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//Давненько тебя не было видно здесь. Где ты был все это время, хм?
		Harad_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//Опять ты!
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

instance DIA_Harad_Romantic(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Romantic_Condition;
	information = DIA_Harad_Romantic_Info;
	permanent = FALSE;
	description = "Я вот что еще хотел спросить...";
};

func int DIA_Harad_Romantic_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Romantic_Info()
{
	AI_Output(other,self,"DIA_Harad_Romantic_01_00");	//Я вот что еще хотел спросить...
	AI_Output(self,other,"DIA_Harad_Romantic_01_01");	//Да-да?
	AI_Output(other,self,"DIA_Harad_Romantic_01_02");	//Ты целыми днями работаешь, трудишься в поте лица.
	AI_Output(self,other,"DIA_Harad_Romantic_01_03");	//Ну-ну...
	AI_Output(other,self,"DIA_Harad_Romantic_01_04");	//А есть ли в кузнечной профессии хоть какая-то романтика?
	AI_Output(self,other,"DIA_Harad_Romantic_01_05");	//Романтика?! (задумчиво) Хех, ну, ты меня прямо-таки врасплох застал. Романтика...
	AI_Output(other,self,"DIA_Harad_Romantic_01_06");	//Значит, нет?
	AI_Output(self,other,"DIA_Harad_Romantic_01_07");	//Ну, лазурных берегов и пышногрудых русалок нет, конечно. Вечно красная рожа от горна, мозоли от молота и звон в ушах - вот и вся романтика.
	AI_Output(self,other,"DIA_Harad_Romantic_01_08");	//Но кузнецы - парни сильные, а девки сильных любят.
	AI_Output(other,self,"DIA_Harad_Romantic_01_09");	//Я не спрашиваю о плотских утехах, я говорю о...
	AI_Output(self,other,"DIA_Harad_Romantic_01_10");	//Другого нет. Все конкретно, как и само наше ремесло. Никаких соплей!
	AI_Output(other,self,"DIA_Harad_Romantic_01_11");	//Ясно.
	AI_Output(self,other,"DIA_Harad_Romantic_01_12");	//Ах, да! У кузнецов еще есть девиз! Я тебе не рассказывал?
	AI_Output(other,self,"DIA_Harad_Romantic_01_13");	//Нет.
	AI_Output(self,other,"DIA_Harad_Romantic_01_14");	//Не куя, ты не получишь много денег и почет!
	AI_Output(other,self,"DIA_Harad_Romantic_01_15");	//Забавно.
	AI_Output(self,other,"DIA_Harad_Romantic_01_16");	//Вроде бы, безысходность отражает, а вроде бы - надежду подает.
	AI_Output(self,other,"DIA_Harad_Romantic_01_17");	//Ладно! Работать мне надо.
	AI_Output(other,self,"DIA_Harad_Romantic_01_18");	//И мне пора идти.
	AI_StopProcessInfos(self);
};

instance DIA_Harad_Waffen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Waffen_Condition;
	information = DIA_Harad_Waffen_Info;
	permanent = FALSE;
	description = "Ты продаешь оружие?";
};


func int DIA_Harad_Waffen_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Ты продаешь оружие?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Забудь об этом. Все, что я делаю, уходит паладинам или ополчению.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//У меня заказ на сотню мечей от лорда Хагена! Он хочет вооружить городскую стражу.
};


instance DIA_Harad_Aufgaben(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_Aufgaben_Condition;
	information = DIA_Harad_Aufgaben_Info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};


func int DIA_Harad_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Три вещи! Попробуй угадать...
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Ковать, ковать и ковать?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//Ты не так уж и бестолков, как кажешься. Я плачу за каждый меч! Если ты не работаешь, то и денег не получаешь. Это просто.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Кроме того, я научу тебя всему, что нужно знать для изготовления обычных мечей.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Изготовление магических мечей - работа для опытного кузнеца. Тебе до этого еще далеко.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//Если тебе нужно место для сна, ты можешь прилечь где-нибудь в моем доме. Все понятно?
};

var int HaradBuyMiscWeap;

instance DIA_Harad_MiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_MiscWeap_Condition;
	information = DIA_Harad_MiscWeap_Info;
	permanent = FALSE;
	description = "Что еще кроме самокованного оружия тебя интересует?";
};

func int DIA_Harad_MiscWeap_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_Aufgaben))
	{
		return TRUE;
	};
};

func void DIA_Harad_MiscWeap_Info()
{
	AI_Output(other,self,"DIA_Harad_MiscWeap_01_00");	//Что еще кроме самокованного оружия тебя интересует?
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_01");	//Если у тебя есть старые ржавые клинки, то приноси их мне.
	AI_Output(other,self,"DIA_Harad_MiscWeap_01_02");	//А зачем они тебе?
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_03");	//Покупать это оружие вряд ли кто станет. Однако его можно будет пустить на переплавку.
	AI_Output(self,other,"DIA_Harad_MiscWeap_01_04");	//Ведь сталь всегда в цене. Особенно учитывая нынешнее положение дел.
	B_LogEntry(TOPIC_CityTrader,"Харад скупает ржавое оружие.");
	HaradBuyMiscWeap = TRUE;
};


instance DIA_Harad_HaradBuyMiscWeap(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_HaradBuyMiscWeap_Condition;
	information = DIA_Harad_HaradBuyMiscWeap_Info;
	permanent = TRUE;
	description = "Я принес тебе ржавое оружие.";
};

func int DIA_Harad_HaradBuyMiscWeap_Condition()
{
	if((HaradBuyMiscWeap == TRUE) && ((Npc_HasItems(other,ItMw_1h_MISC_Sword) >= 1) || (Npc_HasItems(other,ITMW_1H_MISC_GSWORD) >= 1) || (Npc_HasItems(other,ItMw_1h_Misc_Axe) >= 1) || (Npc_HasItems(other,ItMw_2H_Sword_M_01) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Harad_HaradBuyMiscWeap_Info()
{
	var C_Item EquipWeap;
	var int misc_01;
	var int misc_02;
	var int misc_03;
	var int misc_04;
	var int misc_all;
	var int price_all;

	price_all = 2;
	
	AI_Output(other,self,"DIA_Harad_HaradBuyMiscWeap_01_00");	//Я принес тебе ржавое оружие.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_01");	//Хорошо!
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_02");	//Учитывая, что оно почти ничего не стоит, я дам тебе ровно два золотых за каждый клинок.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_03");	//Давай посмотрим, что тут у тебя...

	misc_01 = Npc_HasItems(other,ItMw_1h_MISC_Sword);
	misc_02 = Npc_HasItems(other,ITMW_1H_MISC_GSWORD);
	misc_03 = Npc_HasItems(other,ItMw_1h_Misc_Axe);
	misc_04 = Npc_HasItems(other,ItMw_2H_Sword_M_01);
	misc_all = misc_01 + misc_02 + misc_03 + misc_04;

	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMw_1h_MISC_Sword,Npc_HasItems(hero,ItMw_1h_MISC_Sword));
	Npc_RemoveInvItems(hero,ITMW_1H_MISC_GSWORD,Npc_HasItems(hero,ITMW_1H_MISC_GSWORD));
	Npc_RemoveInvItems(hero,ItMw_1h_Misc_Axe,Npc_HasItems(hero,ItMw_1h_Misc_Axe));
	Npc_RemoveInvItems(hero,ItMw_2H_Sword_M_01,Npc_HasItems(hero,ItMw_2H_Sword_M_01));

	AI_PlayAni(self,"T_YES");
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_04");	//Ну что же, неплохо.
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_05");	//Тогда я возьму все это себе! А ты - держи свое золото.
	B_GiveInvItems(self,other,ItMi_Gold,misc_all * price_all);
	AI_Output(self,other,"DIA_Harad_HaradBuyMiscWeap_01_06");	//Если будет что-нибудь еще - приноси мне.
};

instance DIA_Harad_SellBlades(C_Info)
{
	npc = VLK_412_Harad;
	nr = 200;
	condition = DIA_Harad_SellBlades_Condition;
	information = DIA_Harad_SellBlades_Info;
	permanent = TRUE;
	description = "Я хочу продать оружие, выкованное мной!";
};

func int DIA_Harad_SellBlades_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_schwert1;
	var int anzahl_schwert4;
	var int anzahl_rubinklinge;
	var int anzahl_elbastardo;
	var int gesamt;
	var string concatText;
	var int lohn;
	var int del_common;
	var int del_schwert1;
	var int del_schwert4;
	var int del_rubinklinge;
	var int del_elbastardo;

	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//Я хочу продать оружие, выкованное мной!
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_common = Npc_HasItems(other,ItMw_1H_Common_01);

	if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE)
	{
		if(anzahl_common > 1)
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		anzahl_common -= 1;
	};

	anzahl_schwert1 = Npc_HasItems(other,ItMw_Schwert1);

	if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE)
	{
		if(anzahl_schwert1 > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		};
		anzahl_schwert1 = anzahl_schwert1 - 1;
	};

	anzahl_schwert4 = Npc_HasItems(other,ItMw_Schwert4);

	if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE)
	{
		if(anzahl_schwert4 > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		};
		anzahl_schwert4 = anzahl_schwert4 - 1;
	};

	anzahl_rubinklinge = Npc_HasItems(other,ItMw_Rubinklinge);

	if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE)
	{
		if(anzahl_rubinklinge > 1)
		{
			Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		};
		anzahl_rubinklinge = anzahl_rubinklinge - 1;
	};

	anzahl_elbastardo = Npc_HasItems(other,ItMw_ElBastardo);

	if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE)
	{
		if(anzahl_elbastardo > 1)
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		};
		anzahl_elbastardo = anzahl_elbastardo - 1;
	};

	gesamt = anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo;

	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert1) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Schwert4) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) == TRUE) || (Hlp_IsItem(EquipWeap,ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//Тебе принадлежит только то, что висит у тебя на поясе. Присматривай за ним получше.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Так сделай его! Я принимаю только простые мечи.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Хорошо - давай сюда.
		if(Hlp_IsItem(EquipWeap,ItMw_1H_Common_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_1H_Common_01,anzahl_common);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Schwert1) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert1,anzahl_schwert1);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Schwert4) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Schwert4,anzahl_schwert4);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_Rubinklinge) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_Rubinklinge,anzahl_rubinklinge);
		};
		if(Hlp_IsItem(EquipWeap,ItMw_ElBastardo) != TRUE)
		{
			Npc_RemoveInvItems(other,ItMw_ElBastardo,anzahl_elbastardo);
		};
		concatText = b_formgivestring(other,gesamt);
		AI_Print(concatText);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Отлично! Держи, что заработал.
		lohn = (anzahl_common * 45) + (anzahl_schwert1 * 60) + (anzahl_schwert4 * 75) + (anzahl_rubinklinge * 90) + (anzahl_elbastardo * 135);
		B_GiveInvItems(self,other,ItMi_Gold,lohn);
	};
};

func void B_Harad_TeachSmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//Это довольно просто, парень! Берешь кусок сырой стали и держшь его над огнем, пока он не раскалится.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Потом придаешь клинку форму на наковальне.
};

func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith,Dialog_Back,DIA_Harad_TeachSmith_BACK);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_04,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_04)),DIA_Harad_TeachSmith_Harad04);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_03,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_03)),DIA_Harad_TeachSmith_Harad03);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_02)),DIA_Harad_TeachSmith_Harad02);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt(NAME_Addon_Harad_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Harad_01)),DIA_Harad_TeachSmith_Harad01);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),DIA_Harad_TeachSmith_Common);
	};
};


instance DIA_Harad_TeachSmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 50;
	condition = DIA_Harad_TeachSmith_Condition;
	information = DIA_Harad_TeachSmith_Info;
	permanent = TRUE;
	description = "Научи меня ковать хорошие мечи.";
};

func int DIA_Harad_TeachSmith_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE) || (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Научи меня ковать хорошие мечи.
		B_HaradSmithChoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузне...
		AI_Output(self,other,"DIA_Bennet_ArmorTeach_01_03");	//Приходи завтра утром, тогда и поговорим об этом.
	};
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Твои первые мечи не будут произведением искусства, но остальное можно и потом выучить.
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};
	B_HaradSmithChoices();
};


var int Harad_Merke_STR;

instance DIA_Harad_TeachSTR(C_Info)
{
	npc = VLK_412_Harad;
	nr = 100;
	condition = DIA_Harad_TeachSTR_Condition;
	information = DIA_Harad_TeachSTR_Info;
	permanent = 1;
	description = "Я хочу стать сильнее!";
};


func int DIA_Harad_TeachSTR_Condition()
{
	if(Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//Я хочу стать сильнее!
	Harad_Merke_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if(Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//Ты уже нарастил немного мускулов.
	};
	if(other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Возвращайся, если хочешь поучиться еще.
	};
	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR,Dialog_Back,DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Harad_TeachSTR_5);
};


instance DIA_Harad_ImmerNoch(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_ImmerNoch_Condition;
	information = DIA_Harad_ImmerNoch_Info;
	permanent = FALSE;
	description = "Ты все еще работаешь на паладинов?";
};


func int DIA_Harad_ImmerNoch_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Ты все еще работаешь на паладинов?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//Я закончил заказ лорда Хагена.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Теперь я делаю доля него мечи из магической руды - но на этот раз за плату.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//Но теперь у меня также есть время, чтобы делать оружие для торговцев на рыночной площади.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//Так что если ты ищешь хороший меч, обратись к ним.
};


instance DIA_Harad_AboutErzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_AboutErzklingen_Condition;
	information = DIA_Harad_AboutErzklingen_Info;
	permanent = FALSE;
	description = "Расскажи мне о мечах из магической руды!";
};


func int DIA_Harad_AboutErzklingen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Расскажи мне о мечах из магической руды!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Создание магического меча - очень сложный и дорогой процесс, но в результате получается очень удобный и практически не тупящийся меч.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//Это очень хороший меч, но все его достоинства раскрываются только в руках паладина.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//Меч паладина освящается самим Инносом. В результате, он становится зачарованным оружием, наносящим огромный урон врагу!
};

var int OreBladeBoughtOut;

instance DIA_Harad_Erzklingen(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_Erzklingen_Condition;
	information = DIA_Harad_Erzklingen_Info;
	permanent = TRUE;
	description = "Я хочу купить меч из магической руды.";
};

func int DIA_Harad_Erzklingen_Condition()
{
	if((OreBladeBought == FALSE) && (OreBladeBoughtOut == FALSE) && Npc_KnowsInfo(other,DIA_Harad_AboutErzklingen))
	{
		return TRUE;
	};
};

var int OreBladeBought;

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//Я хочу купить меч из магической руды.

	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//Я подаю магические мечи только паладинам! И только по одному в одни руки.

		if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_NONE))
		{
			OreBladeBoughtOut = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//Вы, паладины, можете считать себя счастливчиками, что вам дозволено владеть такими превосходными мечами.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//Согласно декрету лорда Хагена, я могу продать тебе только одно магическое оружие.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//Так, что я могу предложить тебе?
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//У тебя недостаточно золота.
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Береги свое новое оружие! Оно стоит целое состояние.
	OreBladeBought = TRUE;
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//Я возьму двуручный меч!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_2H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//Я возьму одноручный меч!

	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		CreateInvItems(self,ItMw_1H_Blessed_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen,Dialog_Back,DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen,"Двуручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen,"Одноручный рудный меч (Цена: 2000 монет)",DIA_Harad_Erzklingen_1h);
	};
};


instance DIA_Harad_RepairNecklace(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_RepairNecklace_Condition;
	information = DIA_Harad_RepairNecklace_Info;
	permanent = FALSE;
	description = "Ты можешь ремонтировать ювелирные изделия?";
};


func int DIA_Harad_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Ты можешь чинить драгоценности?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//Я оружейник, а не ювелир. Пожалуй, здесь в городе ты не найдешь никого, кто мог бы помочь тебе.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//Сейчас мало у кого водятся деньги, и давно уже никому не удавалось разбогатеть здесь.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Большинство радо хотя бы тому, что им хватает на хлеб.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Harad_Goldsmith(C_Info)
{
	npc = VLK_412_Harad;
	nr = 8;
	condition = DIA_Harad_Goldsmith_Condition;
	information = DIA_Harad_Goldsmith_Info;
	permanent = FALSE;
	description = "Где мне найти ювелира?";
};


func int DIA_Harad_Goldsmith_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Где мне найти ювелира?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//Я слышал, что у наемников на ферме Онара есть хороший кузнец.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Может, тебе стоит поспрашивать там.
};


instance DIA_Harad_PICKPOCKET(C_Info)
{
	npc = VLK_412_Harad;
	nr = 900;
	condition = DIA_Harad_PICKPOCKET_Condition;
	information = DIA_Harad_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Harad_PICKPOCKET_Condition()
{
	return C_Beklauen(14,35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET,Dialog_Back,DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};


instance DIA_HARAD_ARMORCANTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorcanteach_condition;
	information = dia_harad_armorcanteach_info;
	permanent = TRUE;
	description = "А ты разбираешься в ковке доспехов?";
};


func int dia_harad_armorcanteach_condition()
{
	if((HARAD_TEACHARMOR == FALSE) && (other.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_harad_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_00");	//А ты разбираешься в ковке доспехов?
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_01");	//Я не то что разбираюсь в этом, малыш, - я этим занимаюсь! Правда, только для паладинов и только по распоряжению лорда Хагена.
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_03A");	//Но никаких распоряжений насчет тебя я от него не получал. Ты вообще меня слушаешь?!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_04");	//Но поскольку ты все-таки принадлежишь к их ордену - я бы мог тебе показать, как можно улучшить твои доспехи паладина, используя магическую руду.
	AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_05");	//Магическую руду?
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_06");	//Да, парень. С ее помощью доспехи паладина обретают воистину колоссальную прочность и надежность, не сравнимую ни с каким другим доспехом!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_07");	//Рудные доспехи паладина - это лучшее, что мне вообще приходилось видеть в этой жизни!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_08");	//Но для того, чтобы сделать такие доспехи, прежде всего ты должен уметь ковать. И не просто ковать, а хорошо ковать!
	AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_09");	//Поскольку технология изготовления таких доспехов достаточно сложна и не по плечу простому дилетанту.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Harad_ArmorCanTeach_01_10");	//Я хорошо умею ковать!
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_11");	//Я в этом и не сомневался. И думаю, скорее всего, ты справишься с этм делом.
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_12");	//Однако должен тебя сразу предупредить, что создание таких доспехов стоит очень, очень дорого и не всем по карману.
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_14");	//Когда будешь готов - просто скажи мне и мы начем твое обучение.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_15");	//А судя по всему, ты и есть дилетант!
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_16");	//Поэтому сначала научись хорошо ковать. Научись, и я открою тебе тайну создания доспехов, которых достойны только избранные.
		AI_Output(self,other,"DIA_Harad_ArmorCanTeach_01_17");	//Однако должен тебя сразу предупредить, что создание таких доспехов стоит очень, очень дорого и не всем оно по карману!
	};

	HARAD_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Харад может научить меня улучшать доспехи паладинов.");
};

func void b_harad_teacharmor_1()
{
	AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_01");	//Хорошо, смотри и слушай очень внимательно. Упустишь что-либо, какую-нибудь мелочь, и все - придется опять начинать все заново...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_02");	//...Итак. Для начала проверь, что все материалы у тебя под рукой...
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_03");	//...берешь кусок магической руды, раскаленную стальную заготовку и на наковальне обрабатываешь эти два металла до получения однородной субстанции...
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_04");	//...далее добавляешь необходимые ингредиенты в получившийся сплав - поочередно в нужных пропорциях и последовательности. Главное не перепутать последнюю...
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_05");	//...После этого сплаву необходимо придать форму пластины и проковать полученный элемент с основанием доспеха с помощью стальных заклепок.
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_06");	//...Вот так... видишь, что у меня получается? (показывает) Пластина прочно сидит на несущей доспеха, практически сливаясь с ней.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Harad_TeachArmor_1_01_07");	//...Вот и все. Теперь ты сам сможешь попробовать это сделать.
		HARADTELLSMARDUK_P1 = TRUE;
	};
};

func void b_harad_teacharmor_2()
{
	AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_01");	//Воистину овладев этим знанием, ты сможешь сделать самый лучший доспех из тех, что могут сотворить человеческие руки. Слушай внимательно и запоминай...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_02");	//...берешь раскаленную стальную заготовку и разбиваешь ее на несколько составных частей. При этом надо стараться, чтобы части были практически одинаковыми.
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_03");	//...далее берешь кусок магической руды и обрабатываешь каждую часть стали до получения однородного сплава, при этом подмешивая в него в определенной последовательности требуемые компоненты...
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_04");	//...потом аккуратно вковываешь одну часть в каркас имеющейся брони, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_05");	//...а вторую, изначально придав ей форму пластины, проковываешь с первой частью с помощью стальных заклепок...
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_06");	//...Вот так... видишь что у меня выходит? (показывает) Это усилит прочность корпуса в несколько раз!
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_07");	//...еще немного усилий и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_08");	//...готово! Вот и весь секрет. Теперь ты знаешь достаточно, чтобы выковать этот тяжелый рудный доспех паладина.
		AI_Output(self,other,"DIA_Harad_TeachArmor_2_01_09");	//Больше мне нечему тебя научить. Надеюсь, полученные тобой знания помогут тебе в твоих свершениях.
		HARADTELLSMARDUK_P2 = TRUE;
	};
};

func void b_haradarmorchoices()
{
	Info_ClearChoices(dia_harad_armorteach);
	Info_AddChoice(dia_harad_armorteach,Dialog_Back,dia_harad_armorteach_back);

	if(PLAYER_TALENT_SMITH[15] == FALSE)
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx("Доспехи паладина (Цена: 3500 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_PAL_M_V1)),dia_harad_armorteach_itar_pal_m_v1);
	};
	if((PLAYER_TALENT_SMITH[16] == FALSE) && (SHOW_ITAR_PAL_H == TRUE))
	{
		Info_AddChoice(dia_harad_armorteach,B_BuildLearnStringEx("Тяжелые доспехи паладина (Цена: 5000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_PAL_H_V1)),dia_harad_armorteach_itar_pal_h_v1);
	};
};


instance DIA_HARAD_ARMORTEACH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_armorteach_condition;
	information = dia_harad_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};


func int dia_harad_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (HARAD_TEACHARMOR == TRUE) && (other.guild == GIL_PAL))
	{
		if((PLAYER_TALENT_SMITH[16] == FALSE) || (PLAYER_TALENT_SMITH[15] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_armorteach_info()
{
	AI_Output(other,self,"DIA_Harad_ArmorTeach_01_00");	//Научи меня улучшать доспехи.

	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_01");	//Ну что ж, тогда, пожалуй, начнем...
		b_haradarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_02");	//Но сейчас же уже ночь на дворе! Или ты думаешь ковать на ощупь? (смеется)
		AI_Output(self,other,"DIA_Harad_ArmorTeach_01_03");	//Приходи утром, тогда и начнем твое обучение.
	};
};

func void dia_harad_armorteach_back()
{
	Info_ClearChoices(dia_harad_armorteach);
};

func void dia_harad_armorteach_itar_pal_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3500);
			b_harad_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_TeachArmor_01_00");	//Но у тебя же нет достаточного количества золота! И как же ты собирался платить?!
	};
	b_haradarmorchoices();
};

func void dia_harad_armorteach_itar_pal_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_PAL_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_harad_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_TeachArmor_01_00");	//Но у тебя же нет достаточного количества золота! И как же ты собирался платить?!
	};
	b_haradarmorchoices();
};


instance DIA_HARAD_TELLSMARDUK(C_Info)
{
	npc = VLK_412_Harad;
	nr = 5;
	condition = dia_harad_tellsmarduk_condition;
	information = dia_harad_tellsmarduk_info;
	permanent = FALSE;
	description = "А возможно ли еще улучшить рудные доспехи паладина?";
};


func int dia_harad_tellsmarduk_condition()
{
	if((HARADTELLSMARDUK_P1 == TRUE) || (HARADTELLSMARDUK_P2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_tellsmarduk_info()
{
	AI_Output(other,self,"DIA_Harad_TellsMarduk_01_00");	//А возможно ли еще улучшить рудные доспехи паладина?
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_01");	//Я этого точно не смогу сделать! И насколько я знаю, никто не может...
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_02");	//Но я слышал, что в монастыре маги Огня обладают знаниями, способными придать этим доспехам почти божественную сущность.
	AI_Output(self,other,"DIA_Harad_TellsMarduk_01_03");	//Правда, это всего лишь слухи - но кто знает, кто знает...
	Log_CreateTopic(TOPIC_MAGICINNOSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MAGICINNOSARMOR,LOG_Running);
	B_LogEntry(TOPIC_MAGICINNOSARMOR,"Харад рассказал мне, что маги Огня облададают знаниями, способными придать рудным доспехам паладинов божественную сущность. Хотя и отметил, что это всего лишь слухи.");
};


instance DIA_HARAD_SARAHELPSTHREE(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = dia_harad_sarahelpsthree_condition;
	information = dia_harad_sarahelpsthree_info;
	permanent = TRUE;
	description = "Я хочу заплатить долг Сары.";
};


func int dia_harad_sarahelpsthree_condition()
{
	if((MIS_SARAHELPSTHREE == LOG_Running) && (SARADOBTPAYED == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_sarahelpsthree_info()
{
	AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_00");	//Я хочу заплатить долг Сары.
	if(HAKONTOSARADOBT == FALSE)
	{
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_01");	//ЧТО?! Ты? (удивленно) Долг Сары?
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_02");	//Ведь она тебе должна денег за последнюю партию оружия. Или ты уже забыл об этом?
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_03");	//(сердито) Ничего я не забыл! Просто для меня это как-то неожиданно, что именно ты решил заплатить за нее этот долг.
		HAKONTOSARADOBT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_06");	//Хорошо!
	};
	AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_07");	//Насколько я помню, она должна мне две тысячи золотых монет.
	AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_08");	//Они у тебя есть?
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		B_GivePlayerXP(300);
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_09");	//Вот, держи.
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_10");	//Невероятно! Спасибо, парень, что помог веруть мой долг.
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_16");	//Вот, прими от меня этот меч в качестве благодарности - это один из лучших, что у меня есть.
		B_GiveInvItems(self,other,ItMw_Schwert4,1);
		SARADOBTPAYED = TRUE;
		B_LogEntry(TOPIC_SARAHELPSTHREE,"Я заплатил Хараду долг Сары.");
	}
	else
	{
		AI_Output(other,self,"DIA_Harad_SaraHelpsThree_01_22");	//Нет.
		AI_Output(self,other,"DIA_Harad_SaraHelpsThree_01_23");	//Хорошо. Тогда приходи позже, когда они у тебя будут...(смеется) Шутник.
	};
};


instance DIA_HARAD_ABOUTSWBL(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = dia_harad_aboutswbl_condition;
	information = dia_harad_aboutswbl_info;
	permanent = FALSE;
	description = "Где ты берешь стальные заготовки?";
};

func int dia_harad_aboutswbl_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ABOUTSWBL == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_aboutswbl_info()
{
	AI_Output(other,self,"DIA_Harad_aboutswbl_01_00");	//Где ты берешь стальные заготовки?
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_01");	//Сейчас стало трудно их найти. В Долине Рудников становится все тяжелее добывать руду и плавить заготовки.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_02");	//Ты можешь поискать их у торговцев, а можешь выплавить их сам из руды.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_03");	//Правда, тебе придется сначала добыть руду, а потом найти того, кто разбирается в плавке.
	AI_Output(self,other,"DIA_Harad_aboutswbl_01_04");	//Можешь попробовать поискать учителей среди бывших заключенных из долины - их сейчас много в Хоринисе, после падения Барьера.
	ABOUTSWBL = TRUE;
	Log_CreateTopic(TOPIC_STEELDRAW,LOG_NOTE);
	Log_SetTopicStatus(TOPIC_STEELDRAW,LOG_Running);
	B_LogEntry(TOPIC_STEELDRAW,"Харад рассказал мне, что стальные слитки можно найти у торговцев или попробовать выплавить самому. Правда, мне придется вначале добыть руду и найти среди бывших заключенных того, кто научит меня ее плавить. Да и как добывать руду я уже забыл.");
};

instance DIA_Harad_PrioratBlade(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_PrioratBlade_condition;
	information = DIA_Harad_PrioratBlade_info;
	permanent = FALSE;
	description = "Ты ведь опытный кузнец?";
};

func int DIA_Harad_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Harad_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_01");	//Ты ведь опытный кузнец?
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_02");	//(серьезно) Ну, это смотря с какой стороны посмотреть.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_03");	//Тогда взгляни на этот клинок. Полагаю, что тебе может показаться знакомым это оружие.
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_04");	//Хорошо, давай посмотрим.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_05");	//Вот оно.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_06");	//(серьезно) Ну что же, тут я могу сказать тебе одно - это оружие сделано точно не в Хоринисе!
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_07");	//И выковал его не простой кузнец, а настоящий мастер-оружейник.
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_08");	//А таких мастеров, насколько мне известно, на острове отродясь не было!
	AI_Output(self,other,"DIA_Harad_PrioratBlade_01_09");	//Больше я ничего сказать не могу.
	AI_Output(other,self,"DIA_Harad_PrioratBlade_01_10");	//Ладно. Достаточно и того, что ты сказал.
	B_LogEntry(TOPIC_PrioratStart,"Харад смог сказать лишь то, что этот клинок был выкован очень опытным оружейником. Но таких на острове он не знает.");
};

instance DIA_Harad_DoCrossBow(C_Info)
{
	npc = VLK_412_Harad;
	nr = 1;
	condition = DIA_Harad_DoCrossBow_condition;
	information = DIA_Harad_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Harad_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Harad_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_02");	//(удивленно) Арбалеты? Ты обратился не по адресу, приятель.
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_03");	//Тебе нужен хороший плотник или столяр!
	AI_Output(self,other,"DIA_Harad_DoCrossBow_01_04");	//Только он, возможно, сможет помочь тебе в этом деле.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Делать арбалеты меня сможет научить только плотник или столяр. И где же мне найти такого?");
};

instance DIA_Harad_HauntedLH(C_Info)
{
	npc = VLK_412_Harad;
	nr = 3;
	condition = DIA_Harad_HauntedLH_condition;
	information = DIA_Harad_HauntedLH_info;
	permanent = FALSE;
	description = "Имя Стефан тебе ни о чем не говорит?";
};

func int DIA_Harad_HauntedLH_condition()
{
	if((MIS_HauntedLighthouse  == LOG_Running) && (Npc_HasItems(other,ItMi_StafanRing) >= 1) && (FindOldRing == TRUE) && (KnowStefan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_HauntedLH_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Harad_HauntedLH_01_01");	//Имя Стефан тебе ни о чем не говорит?
	AI_Output(self,other,"DIA_Harad_HauntedLH_01_02");	//Человека с таким именем я не знаю.
	B_LogEntry(TOPIC_HauntedLighthouse,"Кузнец Харад понятия не имеет, кто такой Стефан.");
};