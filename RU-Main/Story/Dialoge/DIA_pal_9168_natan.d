
instance DIA_PAL_9168_NATAN_EXIT(C_Info)
{
	npc = pal_9168_natan;
	nr = 999;
	condition = dia_pal_9168_natan_exit_condition;
	information = dia_pal_9168_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9168_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_9168_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9168_NATAN_PICKPOCKET(C_Info)
{
	npc = pal_9168_natan;
	nr = 900;
	condition = dia_pal_9168_natan_pickpocket_condition;
	information = dia_pal_9168_natan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9168_natan_pickpocket_condition()
{
	return C_Beklauen(100,150);
};

func void dia_pal_9168_natan_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
	Info_AddChoice(dia_pal_9168_natan_pickpocket,Dialog_Back,dia_pal_9168_natan_pickpocket_back);
	Info_AddChoice(dia_pal_9168_natan_pickpocket,DIALOG_PICKPOCKET,dia_pal_9168_natan_pickpocket_doit);
};

func void dia_pal_9168_natan_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};

func void dia_pal_9168_natan_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9168_natan_pickpocket);
};


instance DIA_PAL_9168_NATAN_RESCUEGAROND(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_rescuegarond_condition;
	information = dia_pal_9168_natan_rescuegarond_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9168_natan_rescuegarond_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (ALLAWAYFROMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_rescuegarond_info()
{
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_01");	//СТОЙ! Ни шагу дальше!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_03");	//Впереди - позиции орков!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_04");	//И если самоубийство не входит в твои планы, то самый подходящий маневр для тебя - это разворот с последующей ретировкой.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_01_05");	//Да и потом, я тебя не знаю... Кто ты и что здесь делаешь?!
	MEETNATAN = TRUE;
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
	if((MIS_RESCUEGAROND == LOG_Running) || (MIS_RESCUEGAROND == LOG_SUCCESS))
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond,"Я здесь по поручению лорда Хагена.",dia_pal_9168_natan_rescuegarond_hagen);
	}
	else
	{
		Info_AddChoice(dia_pal_9168_natan_rescuegarond,"А ты догадайся!",dia_pal_9168_natan_rescuegarond_cantsee);
	};
};

func void dia_pal_9168_natan_rescuegarond_cantsee()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_01");	//А ты догадайся!
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_02");	//Бравурная самоуверенность и воинственность выдают в тебе нашего брата - паладина.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_03");	//Твоя дерзость превышает допустимую норму для ополченца, разговаривающего с паладином. Но сейчас не об этом.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_04");	//Гордый, благостный взгляд с оттенком укора. Маг огня!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_05");	//Для мага огня недостаточно холен, для паладина - хиловат, но в глазах знание и, как и у названных ранее, благородство. Маг воды!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_06");	//Паладин нутром чувствует прихвостня Белиара.
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_07");	//Неплохая экипировка, много битв позади, в глазах - отсутствие приверженности богам, алчность. Преданность в прямой зависимости от предложенной суммы. Наемник!
	}
	else if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_08");	//Шмотье вонью болотника пропитано, лицо блаженно и бессмысленно. Сектант.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_09");	//Небрежный вид, зловоние. Ты простой бродяга. Ну, не в этом суть.
	};
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_10");	//Это понятно. Меня интересует другой вопрос - что ты тут забыл? Или ты не слышал, что вся эта долина просто кишмя кишит орками?
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_12");	//Вообще, только безумец мог просто так прийти сюда!
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_13");	//Раньше мне это многие говорили. Но как видишь, я все еще жив.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_14");	//Эх, ладно... Не буду с тобой спорить! Это твое личное дело.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_15");	//В конце концов, еще один человек, кем бы он ни был, нам здесь не помешает.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_CantSee_01_16");	//Ведь тут практически и так никого не осталось из людей - всех остальных перебили орки.
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};

func void dia_pal_9168_natan_rescuegarond_hagen()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_01");	//Я здесь по поручению лорда Хагена.
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_02");	//Мне необходимо выяснить, какова на данный момент обстановка в Долине Рудников.
	AI_Output(other,self,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_03");	//Но самое главное, он хочет знать - что стало с его людьми!
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_04");	//Так тебя прислал сам лорд Хаген? Что же, тогда мы, похоже, в одной упряжке, приятель.
	AI_Output(self,other,"DIA_Pal_9168_Natan_RescueGarond_Hagen_01_05");	//Я тоже здесь по его приказу!
	Info_ClearChoices(dia_pal_9168_natan_rescuegarond);
};


instance DIA_PAL_9168_NATAN_WHOYOU(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_whoyou_condition;
	information = dia_pal_9168_natan_whoyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_pal_9168_natan_whoyou_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_whoyou_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_01");	//Кто ты?
	AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_02");	//Мое имя Натан. И как ты уже наверняка понял, я - паладин короля и верный слуга Инноса!
	if(Npc_KnowsInfo(other,dia_pal_2000_hagen_rescuegarondothers))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_03");	//Ах да! Кажется, лорд Хаген мне уже рассказывал про тебя.
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_04");	//Ты ведь один из тех парней, что добровольно согласились отправиться с ним в эту экспедицию.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_10");	//Это все из-за паладина Удара.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_13");	//Несколько лет назад в одном из походов в снежный Нордмар этот парень спас мне жизнь!
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_14");	//После чего я и дал священный обет Инносу, что обязательно верну ему этот долг чести. 
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_15");	//Значит, он спас тебе жизнь. И как это произошло?
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_16");	//Дело было так: наш передовой отряд, отправленный на разведку в одно из ущелий, попал в засаду к оркам...(вспоминает) Эти твари окружили нас со всех сторон!
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_21");	//Когда завязался бой, Удар своим арбалетом разил орков направо и налево до тех пор, пока его запас железных болтов не иссяк.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_22");	//После того, как это случилось, он сменил спусковой крючок на рукоять меча и бросился в самую гущу врагов, обрушив на них всю ярость своей атаки...(восхищенно)
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_25");	//В итоге наш отряд вышел из окружения, хотя и понес значительные потери.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_26");	//Потом мы стали отступать в сторону расположения наших основных сил...
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_27");	//...но вдруг один из болтов, выпущенный орками вдогонку, угодил мне прямо в ногу. Я упал как подкошенный!
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_28");	//Удар увидел это и кинулся мне на выручку, несмотря на то, что эти твари уже наступали нам на пятки.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_29");	//Он вынес меня, раненого, с поля боя, не оставил на растерзание этим кровожадным обезьянам!
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_30");	//Я безмерно благодарен ему за им совершенное.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_31");	//По этой причине я, собственно, и вызвался добровольцем для отправки в эту экспедицию, когда узнал, что Удар также принимает в ней участие.
		AI_Output(self,other,"DIA_Pal_9168_Natan_WhoYou_01_32");	//Возможно, здесь мне представится шанс отплатить ему.
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_33");	//М-да... ну и история. Я и не знал, что он на такое способен.
		if(!Npc_IsDead(PAL_268_Udar))
		{
			MIS_NATANDOLG = LOG_Running;
			Log_CreateTopic(TOPIC_NATANDOLG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_Running);
			B_LogEntry(TOPIC_NATANDOLG,"Паладин Натан рассказал мне историю о том, как однажды его боевой товарищ по имени Удар спас ему жизнь. Теперь он хочет вернуть долг чести Удару, для чего добровольно вызвался участвовать в экспедиции лорда Хагена.");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_WhoYou_01_36");	//Ну да, это я уже понял.
	};
};


instance DIA_PAL_9168_NATAN_ZAMOK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamok_condition;
	information = dia_pal_9168_natan_zamok_info;
	permanent = FALSE;
	description = "Почему вы не в крепости?";
};


func int dia_pal_9168_natan_zamok_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (CASTLEISDOWN == FALSE) && (KNOWABOUTGAROND == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamok_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_01");	//Почему вы не в крепости?
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_02");	//Потому что с орками там тесно.
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_03");	//Так значит, замок все-таки пал?
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_04");	//Да, к сожалению это так... Несколько дней назад орки вновь пошли на штурм, и в этот раз мы не смогли их сдержать.
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_05");	//А что с Гарондом и его людьми?
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_06");	//Я точно не знаю, но скорее всего все они погибли. Глупо полагаться на то, что зеленокожие кого-либо пощадили!
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_01_07");	//Думаю, что нам стоит это выяснить.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_08");	//Серьезно? А каким образом? Может быть, спросить у самих орков?!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_01_09");	//Они порубят меня на куски еще до того, как я подойду к крепости!
	CASTLEISDOWN = TRUE;
	NATATELLZAMOK = TRUE;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Замок в Долине Рудников пал! Оркам все-таки удалось взять его штурмом. Не думаю, что подобная весть сильно обрадует лорда Хагена. О судьбе самих защитников замка пока что ничего неизвестно.");
	};
	Info_ClearChoices(dia_pal_9168_natan_zamok);
	Info_AddChoice(dia_pal_9168_natan_zamok,"Тогда это сделаю я!",dia_pal_9168_natan_zamok_ulumulu);
	Info_AddChoice(dia_pal_9168_natan_zamok,"Тогда надо попытаться отбить у них крепость обратно!",dia_pal_9168_natan_zamok_noway);
};

func void dia_pal_9168_natan_zamok_ulumulu()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_01");	//Тогда это сделаю я!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_04");	//Хм. Ну ладно! Твоя жизнь мне все-таки менее дорога, чем своя собственная. Действуй!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_UluMulu_01_05");	//Правда, не думаю, что из этой затеи выйдет хоть какой-нибудь толк.
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry(TOPIC_NEWSSURVIVERS,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала!");
	Log_AddEntry(TOPIC_NEWSSURVIVERS,"Натан полагает, что все защитники замка погибли, но я решил наведаться в крепость, чтобы разузнать о судьбе Гаронда и его людей.");
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamok_noway()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_01");	//Нужно попытаться отбить у них крепость обратно!
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_02");	//Честно говоря, мы и сами уже подумывали об этом.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_03");	//Однако нас слишком мало, чтобы воевать против целой армии орков.
	AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_06");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_07");	//Хммм...(задумчиво) Я слышал, что в долине еще остался небольшой отряд охотников на драконов.
	AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_08");	//Вот если бы мы объединились с ними, то успех был бы в большей степени гарантирован.
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(DRGHUNTER01ISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_17");	//Навряд ли из этого получится что-то хорошее.
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_18");	//Их лидер мертв! А без него они лишь всего кучка ни на что не способных слабаков.
			AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_19");	//Откуда тебе это известно?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_09");	//Боюсь, что они уже все мертвы.
			AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_10");	//Откуда тебе это известно?
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_11");	//Поверь мне, это так. Так что придется сражаться без них.
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_12");	//Да, очень жаль. Остается надеяться лишь на самих себя.
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_13");	//Мы готовы к атаке. Дай знать, когда будешь готов ты.
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_14");	//Хорошо.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала! Натан полагает, что все защитники замка погибли, однако быть точно уверенным в этом пока нельзя.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Думаю, лучший способ все выяснить - постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он уж было хотел завербовать оставшихся в долине охотников на драконов, но, узнав, что они все мертвы, - согласился начать атаку своими силами.");
		Info_ClearChoices(dia_pal_9168_natan_zamok);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_Zamok_NoWay_01_15");	//Ладно, я постараюсь найти их. Если, конечно, орки не сделали этого раньше меня!
		AI_Output(self,other,"DIA_Pal_9168_Natan_Zamok_NoWay_01_16");	//Хорошо! Мы будем ждать на этом же месте.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала! Натан полагает, что все защитники замка погибли, однако быть точно уверенным в этом пока нельзя.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Думаю, лучший способ все выяснить - постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он хочет объединиться с охотниками на драконов. Я должен найти их отряд и убедить присоединиться к нам.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERS(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurvivers_condition;
	information = dia_pal_9168_natan_newssurvivers_info;
	permanent = FALSE;
	description = "Я был в крепости.";
};


func int dia_pal_9168_natan_newssurvivers_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurvivers_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_01");	//Я был в крепости.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_02");	//(напряженно) Правда? И что тебе удалось узнать?
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_03");	//Гаронд и часть паладинов живы! Орки взяли их в плен.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_07");	//Нужно как можно скорее освободить Гаронда и его людей. Нам нельзя терять ни минуты!
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_08");	//Мы не знаем, с чем связано орочье милосердие и как долго оно продлится.
	if((MIS_NATANDOLG == LOG_Running) && (UDARKNOWSNATAN == TRUE))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_10");	//Кстати, среди плененных орками паладинов был и твой друг Удар! Он тоже попал к ним в плен.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_11");	//Удар в крепости?! Черт! Он там на волосок от смерти, а я здесь!
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_12");	//Проклятые орки! Если он погибнет, я не найду покоя, пока не перебью их всех!
		AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_13");	//Думаю, это твой шанс отдать ему свой долг чести.
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_14");	//Верно думаешь. При первой же возможности я вытащу его оттуда. 
		AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_15");	//Спасибо, что сообщил мне о происходящем внутри. Теперь меня ничто не остановит на пути к замку!
		B_LogEntry(TOPIC_NATANDOLG,"Узнав, что паладин Удар также находится в плену у орков, Натан пришел в ярость. Кажется, сейчас его не смогла бы остановить и целая армия!");
	}
	else
	{
		B_GivePlayerXP(100);
	};
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATAN_ZAMOKKNOWN(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_zamokknown_condition;
	information = dia_pal_9168_natan_zamokknown_info;
	permanent = FALSE;
	description = "Как обстановка?";
};


func int dia_pal_9168_natan_zamokknown_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_zamokknown_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_01");	//Как обстановка?
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_02");	//Несколько дней назад орки вновь штурмовали замок, и на сей раз их штурм увенчался успехом.
	if(KNOWABOUTGAROND == TRUE)
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_04");	//(напряженно) Что? Ты был там?! И что тебе удалось узнать?
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_05");	//Гаронд и часть паладинов живы! Орки взяли их в плен.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_09");	//Нужно как можно скорее освободить Гаронда и его людей. Нам нельзя терять ни минуты!
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_10");	//Мы не знаем, как долго продлиться милосердие у этих кровожадных тварей.
		KNOWSITUATIONCASTLE = TRUE;
		if(Npc_KnowsInfo(other,dia_orc_8566_urhan_paladincost))
		{
			if(BOGNARREFUSETALK == TRUE)
			{
				Info_ClearChoices(dia_pal_9168_natan_zamokknown);
				Info_AddChoice(dia_pal_9168_natan_zamokknown,"Надо попытаться отбить у них крепость обратно!",dia_pal_9168_natan_zamokknown_noway);
			}
			else
			{
				AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_11");	//Согласен! Надо поторопиться.
			};
		}
		else
		{
			Info_ClearChoices(dia_pal_9168_natan_zamokknown);
			Info_AddChoice(dia_pal_9168_natan_zamokknown,"Согласен! Надо поторопиться.",dia_pal_9168_natan_zamokknown_ulumulu);
			Info_AddChoice(dia_pal_9168_natan_zamokknown,"Надо попытаться отбить у них крепость обратно!",dia_pal_9168_natan_zamokknown_noway);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_12");	//(напряженно) Что? Ты был там?! Кто-нибудь выжил?
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_01_13");	//Пока не знаю. Но думаю, что нам стоит это выяснить.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_14");	//Правда? Хммм. И как же, по-твоему, мне это сделать?
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_01_15");	//Они порубят меня на куски еще до того, как я подойду к крепости!
		NATATELLZAMOKTWO = TRUE;
		Info_ClearChoices(dia_pal_9168_natan_zamokknown);
		Info_AddChoice(dia_pal_9168_natan_zamokknown,"Тогда это сделаю я!.",dia_pal_9168_natan_zamokknown_ulumulu);
		Info_AddChoice(dia_pal_9168_natan_zamokknown,"Надо попытаться отбить у них крепость обратно!",dia_pal_9168_natan_zamokknown_noway);
	};
};

func void dia_pal_9168_natan_zamokknown_ulumulu()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_01");	//Тогда это сделаю я!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_04");	//Хммм...(удивленно) Ну ладно! Если ты так решил - тогда действуй.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_UluMulu_01_05");	//Правда, не думаю, что из этой затеи выйдет хоть какой-нибудь толк.
	MIS_NEWSSURVIVERS = LOG_Running;
	Log_CreateTopic(TOPIC_NEWSSURVIVERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_Running);
	B_LogEntry(TOPIC_NEWSSURVIVERS,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала!");
	Log_AddEntry(TOPIC_NEWSSURVIVERS,"Натан полагает, что все защитники замка погибли, но я решил наведаться в крепость, чтобы разузнать о судьбе Гаронда и его людей.");
	AI_StopProcessInfos(self);
};

func void dia_pal_9168_natan_zamokknown_noway()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_01");	//Нужно попытаться отбить у них крепость обратно!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_02");	//Честно говоря, мы и сами уже подумывали об этом.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_03");	//Однако нас слишком мало, чтобы воевать против целой армии орков.
	AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_06");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_07");	//Хммм...(задумчиво) Я слышал, что в долине еще остался небольшой отряд охотников на драконов.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_08");	//Думаю, что если бы они присоединились к нам, то у нас было бы куда больше шансов выбить орков из крепости!
	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_09");	//Боюсь, что они уже все мертвы.
			AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_10");	//Откуда тебе это известно?
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_11");	//Навряд ли из этого получится что-то хорошее.
			AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_12");	//Их лидер мертв. А без него они лишь всего кучка ни на что не способных слабаков. Так что орки наверняка уже добрались до них!
			AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_13");	//Откуда тебе это известно?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_14");	//Поверь мне, это так. Так что придется сражаться без них!
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_15");	//Да, очень жаль...(расстроенно) Остается надеяться лишь на самих себя.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_16");	//Думаю, что тогда можно начать нашу атаку. Дай знать, когда будешь готов!
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_17");	//Хорошо.
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала! Натан полагает, что все защитники замка погибли, однако быть точно уверенным в этом пока нельзя.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Думаю, лучший способ все выяснить - постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он уж было хотел завербовать оставшихся в долине охотников на драконов, но, узнав, что они все мертвы, - согласился начать атаку своими силами.");
		Info_ClearChoices(dia_pal_9168_natan_zamokknown);
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_18");	//Ладно, я постараюсь найти их. Если, конечно же, орки не сделали этого раньше меня.
		AI_Output(self,other,"DIA_Pal_9168_Natan_ZamokKnown_NoWay_01_19");	//Хорошо! Мы будем ждать на этом же месте.
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Недалеко от прохода, ведущего из Долины Рудников, я повстречал небольшую группу паладинов. Их возглавляет человек по имени Натан. Он рассказал мне о том, что недавно орки вновь штурмовали замок и на сей раз им этот удалось - крепость пала! Натан полагает, что все защитники замка погибли, однако быть точно уверенным в этом пока нельзя.");
		Log_AddEntry(TOPIC_STURMCASTLE,"Думаю, лучший способ все выяснить - постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он хочет объединиться с охотниками на драконов. Я должен найти их отряд и убедить присоединиться к нам.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERSTWO(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviverstwo_condition;
	information = dia_pal_9168_natan_newssurviverstwo_info;
	permanent = FALSE;
	description = "Я был в крепости.";
};


func int dia_pal_9168_natan_newssurviverstwo_condition()
{
	if((KNOWABOUTGAROND == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && (CASTLEISDOWN == TRUE) && (NATATELLZAMOKTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurviverstwo_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_01");	//Я был в крепости.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_02");	//(напряженно) Правда? И что тебе удалось узнать?
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurvivers_01_03");	//Гаронд и часть паладинов живы! Орки взяли их в плен.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_07");	//Нужно как можно скорее освободить Гаронда и его людей. Нам нельзя терять ни минуты!
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurvivers_01_08");	//Мы не знаем, с чем связано орочье милосердие и как долго оно продлится.
	KNOWSITUATIONCASTLE = TRUE;
};


instance DIA_PAL_9168_NATAN_NEWSSURVIVERSUDAR(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_newssurviversudar_condition;
	information = dia_pal_9168_natan_newssurviversudar_info;
	permanent = FALSE;
	description = "У меня есть для тебя новость.";
};


func int dia_pal_9168_natan_newssurviversudar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARKNOWSNATAN == TRUE) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE) && Npc_KnowsInfo(hero,dia_pal_9168_natan_zamokknown))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_newssurviversudar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_03");	//Среди плененных орками паладинов был и твой друг Удар! Он тоже попал к ним в плен.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_04");	//Удар в крепости?! Черт! Так значит они добрались и до него.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_05");	//(грозно) Проклятые орки! Я этого просто так не оставлю.
	AI_Output(other,self,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_06");	//Думаю, это твой шанс отдать ему свой долг чести.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_07");	//И при первой же возможности я это сделаю.
	AI_Output(self,other,"DIA_Pal_9168_Natan_NewsSurviversUdar_01_08");	//Спасибо, что сообщил мне об этом. Теперь меня ничто не остановит на пути к замку!
	B_LogEntry(TOPIC_NATANDOLG,"Узнав, что паладин Удар также находится в плену у орков, Натан пришел в ярость. Кажется, сейчас его не смогла бы остановить и целая армия!");
};


instance DIA_PAL_9168_NATAN_HOWAROUND(C_Info)
{
	npc = pal_9168_natan;
	nr = 2;
	condition = dia_pal_9168_natan_condition;
	information = dia_pal_9168_natan_info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int dia_pal_9168_natan_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (Npc_KnowsInfo(hero,dia_pal_9168_natan_zamok) || Npc_KnowsInfo(hero,dia_pal_9168_natan_zamokknown)))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_01_00");	//Как ситуация?
	if(MIS_STURMCASTLE == LOG_Running)
	{
		if(CASTLEISFREE == TRUE)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_01");	//Мы сделали это! Крепость теперь снова в наших руках!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_02");	//Но не стоит ликовать слишком бурно - этот триумф не окончателен. Выдыхать рано. Орки тоже принципиальны, и они тоже теряют на этой войне своих друзей. Захват замка - вновь их цель.
			AI_StopProcessInfos(self);
		}
		else
		{
			if(KNOWSITUATIONCASTLE == TRUE)
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_04");	//Нам надо как-то вытащить Гаронда и его людей из лап орков! Мы не можем бросить их здесь на произвол судьбы.
				AI_StopProcessInfos(self);
			};
			if(PALADINREADYATTACK == FALSE)
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_06");	//Пока все тихо...(серьезно) Но по мне, это затишье перед бурей!
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_07");	//Не ровен час, когда сюда пожалуют орки и тогда нам всем не поздоровится.
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_08");	//Так что тебе необходимо как можно скорее найти этот отряд. Нам нельзя терять времени!
				AI_Output(other,self,"DIA_Pal_9168_Natan_01_09");	//Хорошо! Уже иду.
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(self,other,"DIA_Pal_9168_Natan_01_10");	//Нам надо скорее атаковать крепость, пока орки не заподозрили неладное...(серьезно) Чего ты ждешь?!
				AI_StopProcessInfos(self);
			};
		};
	}
	else if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		if(KNOWSITUATIONCASTLE == FALSE)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_12");	//Пока все тихо...(серьезно) Но по мне это затишье перед бурей!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_13");	//Не ровен час, когда сюда пожалуют орки и тогда нам всем не поздоровится.
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_14");	//Так что тебе необходимо как можно скорее попасть в крепость и узнать, что там происходит.
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_15");	//Нам нельзя терять ни минуты!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_17");	//Нам надо как-то вытащить Гаронда и его людей из лап орков! Мы не можем бросить их здесь на произвол судьбы.
			AI_StopProcessInfos(self);
		};
	}
	else if(PALADINCASTELFREE == TRUE)
	{
		if(MIS_STURMCASTLE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_19");	//Могло быть и лучше. Одно радует - Гаронд и его люди теперь вместе с нами!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_20");	//А сейчас уходим, пока орки не пришли в себя.
		}
		else if(MIS_NEWSSURVIVERS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_22");	//Могло быть и лучше. Одно радует - Гаронд и его люди теперь вместе с нами!
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_23");	//А сейчас уходим, пока орки не пришли в себя!
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_9168_Natan_01_25");	//Могло быть и лучше...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9168_Natan_01_26");	//Могло быть и лучше...
	};
};


instance DIA_PAL_9168_NATAN_CANREADYATTACK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_canreadyattack_condition;
	information = dia_pal_9168_natan_canreadyattack_info;
	permanent = FALSE;
	description = "Насчет охотников на драконов...";
};


func int dia_pal_9168_natan_canreadyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == FALSE) && ((DGJREFUSEPALADIN == TRUE) || (DGJJOINPALADIN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_canreadyattack_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_01");	//Насчет охотников на драконов...
	AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_02");	//Да? У тебя есть новости, касаемо этого сбро... наших новых союзников?
	AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_03");	//Да! Я нашел их отряд и предложил им присоединиться к вам.
	AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_04");	//И что они ответили?
	if(DGJJOINPALADIN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_05");	//Они согласны! Они будут сражаться вместе с нами.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_06");	//Я правда рад этому. В сражении с орками нам понадобится любая помощь!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_07");	//Думаю, что теперь можно начать нашу атаку. Дай знать, когда будешь готов!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_08");	//Хорошо.
		B_LogEntry(TOPIC_STURMCASTLE,"Натан был рад услышать о том, что охотники на драконов согласились принять участие в штурме крепости. Теперь можно начинать нашу атаку.");
		PALADINREADYATTACK = TRUE;
		b_readydgjattack();
	}
	else if(DGJREFUSEPALADIN == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_09");	//Не думаю, что от них будет много пользы.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_10");	//Почему ты так считаешь?
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_11");	//Эти трусы наложили в штаны, как только узнали, что именно вы задумали.
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_12");	//Так что придется сражаться без них!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_13");	//Да, очень жаль...(расстроенно) Остается надеяться лишь на самих себя.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_14");	//Думаю, что теперь можно начать нашу атаку. Дай знать, когда будешь готов!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_15");	//Хорошо.
		B_LogEntry(TOPIC_STURMCASTLE,"Натан был немного расстроен новостью о том, что охотники на драконов отказались принять участие в штурме крепости. Теперь нам придется рассчитывать только на свои силы.");
		PALADINREADYATTACK = TRUE;
	}
	else if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_16");	//Боюсь, что они уже все мертвы.
			AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_17");	//Откуда тебе это известно?
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_18");	//Ничего! Их лидер мертв, а без него они лишь всего кучка ни на что не способных слабаков. Так что орки наверняка уже добрались до них!
			AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_19");	//Откуда тебе это известно?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);
			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_20");	//Поверь мне, это так. Так что придется сражаться без них!
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_21");	//Да, очень жаль...(расстроенно) Остается надеяться лишь на самих себя.
		AI_Output(self,other,"DIA_Pal_9168_Natan_CanReadyAttack_01_22");	//Думаю, что теперь можно начать нашу атаку. Дай знать, когда будешь готов!
		AI_Output(other,self,"DIA_Pal_9168_Natan_CanReadyAttack_01_23");	//Хорошо.
		B_LogEntry(TOPIC_STURMCASTLE,"Натан был немного расстроен новостью о том, что охотники на драконов не примут участия в штурме крепости. Теперь нам придется рассчитывать только на свои силы.");
		PALADINREADYATTACK = TRUE;
	};
};


instance DIA_PAL_9168_NATAN_SURVIVERSFAILED(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_surviversfailed_condition;
	information = dia_pal_9168_natan_surviversfailed_info;
	permanent = FALSE;
	description = "Нам остается только штурмовать замок!";
};


func int dia_pal_9168_natan_surviversfailed_condition()
{
	if((MIS_NEWSSURVIVERS == LOG_Running) && (MIS_STURMCASTLE == FALSE) && (BOGNARREFUSETALK == TRUE) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_surviversfailed_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_01");	//Нам остается только штурмовать замок!
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_02");	//Честно говоря, мы и сами уже подумывали об этом.
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_03");	//Однако нас слишком мало, чтобы воевать против целой армии орков.
	AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_06");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_07");	//Хммм. Я слышал, что в долине еще остался небольшой отряд охотников на драконов.
	AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_08");	//Думаю, что если бы они смогли присоединились к нам - то у нас было бы куда больше шансов выбить орков из крепости!

	if((ALLDRGHUNTERSISDEAD == TRUE) || (DRGHUNTER01ISDEAD == TRUE))
	{
		if(ALLDRGHUNTERSISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_09");	//Боюсь, что они уже все мертвы.
			AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_10");	//Откуда тебе это известно?
		}
		else
		{
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_17");	//Не думаю, что от них будет много пользы.
			AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_18");	//Их лидер мертв! А без него они лишь всего кучка ни на что не способных слабаков. Так что орки наверняка уже добрались до них!
			AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_19");	//Откуда тебе это известно?
			B_KillNpc(DJG_708_Kurgan);
			B_KillNpc(DJG_710_Kjorn);
			B_KillNpc(DJG_711_Godar);
			B_KillNpc(DJG_712_Hokurn);
			B_KillNpc(DJG_713_Biff);
			B_KillNpc(DJG_702_Rod);
			B_KillNpc(DJG_703_Cipher);

			if(MEETKURGANAFTER == TRUE)
			{
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_2");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_3");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_4");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_STAND_OW_DJG_VORPOSTEN_BIFFS");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_WARAN_CAVE1_1");
				Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_OW_BLACKGOBBO_NEARCAVE1_2");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_1");
				Wld_InsertNpc(orkelite_addon3,"FP_ROAM_OW_ORCOND_CAVE1_2");
				Wld_InsertNpc(orkelite_addon2,"FP_ROAM_OW_ORCOND_CAVE1_3");
			};
		};
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_11");	//Поверь мне, это так. Так что придется сражаться без них!
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_12");	//Да, жаль...(расстроенно) Ну ладно! Остается надеяться лишь на самих себя.
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_13");	//Думаю, что тогда можно начать нашу атаку. Дай знать, когда будешь готов!
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_14");	//Хорошо.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		PALADINREADYATTACK = TRUE;
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Все что нам остается - это постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он уж было хотел завербовать оставшихся в долине охотников на драконов, но, узнав, что они все мертвы, - согласился начать атаку своими силами.");
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_9168_Natan_SurviversFailed_01_15");	//Ладно, я постараюсь найти их. Если, конечно же, орки не сделали этого раньше меня.
		AI_Output(self,other,"DIA_Pal_9168_Natan_SurviversFailed_01_16");	//Хорошо! Мы будем ждать на этом же месте.
		MIS_NEWSSURVIVERS = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_OBSOLETE);
		MIS_STURMCASTLE = LOG_Running;
		Log_CreateTopic(TOPIC_STURMCASTLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_Running);
		B_LogEntry(TOPIC_STURMCASTLE,"Все что нам остается - это постараться отбить крепость обратно. Натан, конечно, согласился с моим предложением, но посетовал на то, что для этой затеи у нас слишком мало людей. Он хочет объединиться с охотниками на драконов. Я должен найти их отряд и убедить присоединиться к нам.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_PAL_9168_NATAN_READYATTACK(C_Info)
{
	npc = pal_9168_natan;
	nr = 1;
	condition = dia_pal_9168_natan_readyattack_condition;
	information = dia_pal_9168_natan_readyattack_info;
	permanent = TRUE;
	description = "Давай начнем атаку!";
};

func int dia_pal_9168_natan_readyattack_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (PALADINREADYATTACK == TRUE) && (PALADINATTACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9168_natan_readyattack_info()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_01_01");	//Давай начнем атаку!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_01_02");	//(серьезно) Хорошо. Ты готов?
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Нет! Подожди минутку.",dia_pal_9168_natan_readyattack_wait);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Я готов.",dia_pal_9168_natan_readyattack_attack);
};

func void dia_pal_9168_natan_readyattack_wait()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Wait_01_01");	//Нет! Подожди минутку.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Wait_01_02");	//Поторопись!
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
};

func void dia_pal_9168_natan_readyattack_attack()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_01");	//Я готов.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_02");	//Отлично! Тогда мы немедленно выступаем.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_03");	//Кстати, думаю, будет правильным, если именно ты возглавишь атаку. Поскольку я сам, признаться, не очень силен в таких делах.
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_04");	//Так что мы все целиком и полностью полагаемся на тебя. Не подведи!
	AI_Output(self,other,"DIA_Pal_9168_Natan_ReadyAttack_Attack_01_05");	//(воинственно) Вперед, за Инноса!
	PALADINATTACK = TRUE;
	B_LogEntry(TOPIC_STURMCASTLE,"Штурм крепости начался!...");
	Info_ClearChoices(dia_pal_9168_natan_readyattack);
	Info_AddChoice(dia_pal_9168_natan_readyattack,"Хорошо, вперед!",dia_pal_9168_natan_readyattack_go);
};

func void dia_pal_9168_natan_readyattack_go()
{
	AI_Output(other,self,"DIA_Pal_9168_Natan_ReadyAttack_Go_01_01");	//Хорошо, вперед!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	b_paladinattackcastle();
};