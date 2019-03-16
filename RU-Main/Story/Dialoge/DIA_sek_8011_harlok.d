
instance DIA_HARLOK_EXIT(C_Info)
{
	npc = sek_8011_harlok;
	nr = 999;
	condition = dia_harlok_exit_condition;
	information = dia_harlok_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_harlok_exit_condition()
{
	return TRUE;
};

func void dia_harlok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARLOK_HALLO(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_hallo_condition;
	information = dia_harlok_hallo_info;
	permanent = FALSE;
	description = "Привет.";
};


func int dia_harlok_hallo_condition()
{
	return TRUE;
};

func void dia_harlok_hallo_info()
{
	AI_Output(other,self,"DIA_Harlok_Hallo_01_00");	//Привет.
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_01");	//Приветствую тебя, брат!
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_02");	//Мое почтение, доблестный Страж!
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_03");	//Мое почтение, господин!
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_Hallo_01_04");	//Да пребудет с тобой Спящий, незнакомец!
	};
};


instance DIA_HARLOK_ORT(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_ort_condition;
	information = dia_harlok_ort_info;
	permanent = FALSE;
	description = "Расскажи мне об этом месте.";
};


func int dia_harlok_ort_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_ort_info()
{
	AI_Output(other,self,"DIA_Harlok_Ort_01_00");	//Расскажи мне об этом месте.
	AI_Output(self,other,"DIA_Harlok_Ort_01_01");	//Ну, Гуру здесь самые главные. Они несут нашим братьям блага истинного пути и передают новичкам свою мудрость.
	AI_Output(other,self,"DIA_Harlok_Ort_01_02");	//И что это за путь?
	AI_Output(self,other,"DIA_Harlok_Ort_01_03");	//Он помогает нам освободить свое сознание и укрепить наш дух.
	AI_Output(self,other,"DIA_Harlok_Ort_01_04");	//Но язычникам вроде тебя этого не понять.
};


instance DIA_HARLOK_WELCOME(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_welcome_condition;
	information = dia_harlok_welcome_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_harlok_welcome_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo))
	{
		return TRUE;
	};
};

func void dia_harlok_welcome_info()
{
	AI_Output(other,self,"DIA_Harlok_Welcome_01_00");	//Как дела?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_01");	//Все хорошо, брат.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_02");	//Все хорошо, доблестный Страж.
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_03");	//Все хорошо, господин.
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_Welcome_01_04");	//Все в порядке, незнакомец.
	};
};


instance DIA_HARLOK_WORK(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_work_condition;
	information = dia_harlok_work_info;
	permanent = FALSE;
	description = "Какая у тебя тут работа?";
};


func int dia_harlok_work_condition()
{
	if(Npc_KnowsInfo(hero,dia_harlok_hallo) && (other.guild != GIL_TPL) && (other.guild != GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_harlok_work_info()
{
	AI_Output(other,self,"DIA_Harlok_Work_01_00");	//Какая у тебя тут работа?
	AI_Output(self,other,"DIA_Harlok_Work_01_01");	//В основном я присматриваю за новичками. Смотрю, чтобы они не попали в какие-нибудь неприятности.
	AI_Output(self,other,"DIA_Harlok_Work_01_02");	//В нашем Братстве свои законы и порядки, и многим бывает очень трудно привыкнуть к ним.
	AI_Output(self,other,"DIA_Harlok_Work_01_03");	//И иногда из-за этого возникают небольшие проблемы.
	AI_Output(self,other,"DIA_Harlok_Work_01_04");	//То же самое касается и незнакомцев вроде тебя.
	AI_Output(other,self,"DIA_Harlok_Work_01_05");	//И что надо делать в таком случае?
	AI_Output(self,other,"DIA_Harlok_Work_01_06");	//Если у тебя здесь возникнут проблемы с кем-то из Братства, обратись к Идолу Орану.
	AI_Output(self,other,"DIA_Harlok_Work_01_07");	//Он поможет тебе уладить их.
};


instance DIA_HARLOK_HARWR(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_harwr_condition;
	information = dia_harlok_harwr_info;
	permanent = FALSE;
	description = "Я хотел бы присоединиться к вашему лагерю. Ты мог бы мне помочь?";
};


func int dia_harlok_harwr_condition()
{
	if((PSI_TALK == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_harlok_harwr_info()
{
	AI_Output(other,self,"DIA_Harlok_HarWr_01_00");	//Я хотел бы присоединиться к вашему лагерю. Ты мог бы мне помочь?
	AI_Output(self,other,"DIA_Harlok_HarWr_01_01");	//Так ты хочешь присоединиться к нам? Похвальное решение!
	AI_Output(self,other,"DIA_Harlok_HarWr_01_02");	//Конечно, я бы мог тебе помочь в этом... (думает) Если бы ты, скажем, оказал мне одно небольшое одолжение.
	AI_Output(self,other,"DIA_Harlok_HarWr_01_04");	//Скажи, ты ведь уже говорил с Таласом?
	Info_ClearChoices(dia_harlok_harwr);
	Info_AddChoice(dia_harlok_harwr,"Нет.",dia_harlok_harwr_nein);
	Info_AddChoice(dia_harlok_harwr,"Да.",dia_harlok_harwr_ja);
};

func void dia_harlok_harwr_ja()
{
	AI_Output(self,other,"DIA_Harlok_HarWr_Ja_07_00");	//Тогда ты должен был получить свою дневную дозу. Если ты отдашь ее мне, я постараюсь тебе помочь.
	AI_Output(other,self,"DIA_Harlok_HarWr_Ja_15_01");	//Я подумаю об этом.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry(TOPIC_HARLOKJOINPSI,"Харлок хочет получить мою порцию болотника, которую я взял у Таласа.");
	Info_ClearChoices(dia_harlok_harwr);
};

func void dia_harlok_harwr_nein()
{
	AI_Output(self,other,"DIA_Harlok_HarWr_Nein_07_00");	//Так иди к нему и забери свою дневную дозу. Если ты отдашь мне свой болотник, я постараюсь помочь тебе.
	AI_Output(other,self,"DIA_Harlok_HarWr_Nein_15_01");	//Я подумаю об этом.
	HARLOK_BRINGJOINTS = LOG_Running;
	Log_CreateTopic(TOPIC_HARLOKJOINPSI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_Running);
	B_LogEntry(TOPIC_HARLOKJOINPSI,"Харлок хочет бы получить мою порцию болотника, которую я могу взять у Таласа.");
	Info_ClearChoices(dia_harlok_harwr);
};


instance DIA_HARLOK_JOINTSRUNNING(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_jointsrunning_condition;
	information = dia_harlok_jointsrunning_info;
	permanent = TRUE;
	description = "Болотник у меня. Можешь забирать.";
};


func int dia_harlok_jointsrunning_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_Running) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_harlok_jointsrunning_info()
{
	AI_Output(other,self,"DIA_Harlok_JointsRunning_15_00");	//Болотник у меня. Можешь забирать.
	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_01");	//Хорошо! Ты, должно быть, заметил, что никто из Гуру не хочет с тобой разговаривать
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_02");	//Чтобы добиться своего, нужно произвести на них впечатление. Я расскажу тебе, как это сделать.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_03");	//Как произвести впечатление на Гуру?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_04");	//Идол Намиб наставляет учеников в магии Спящего.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_05");	//Если хочешь, чтобы он обратил на тебя внимание, используй магию.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_06");	//Только не вздумай опробовать на нем Кулак Ветра! Погрузи кого-нибудь из учеников в сон или сделай еще что-нибудь вроде этого.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_07");	//А где мне достать свитки с заклинаниями магии Спящего?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_08");	//Идол Тион продает руны и магические свитки. Правда, пока ты не Гуру, он даже не станет и слушать тебя.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_09");	//И как мне быть?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_10");	//Кажется, у меня где-то был один свиток с заклинанием сна. Я бы мог продать его тебе.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_11");	//И сколько ты хочешь за этот магический свиток?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_12");	//Ну, скажем... Учитывая то, как он будет полезен в твоем деле...
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_13");	//...пятьсот золотых будет вполне достаточно.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_14");	//Что?! Ты хочешь за этот свиток целых пятьсот монет?
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_15");	//Ну, мое лишь дело предложить...
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_16");	//Но не думай, что я отдам тебе его дешевле.
		AI_Output(self,other,"DIA_Harlok_JointsRunning_07_17");	//Если все-таки надумаешь его купить - просто скажи мне об этом.
		AI_Output(other,self,"DIA_Harlok_JointsRunning_07_18");	//Я подумаю об этом.
		B_GiveInvItems(other,self,ItMi_Joint,3);
		HARLOK_BRINGJOINTS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HARLOKJOINPSI,LOG_SUCCESS);
		B_GivePlayerXP(50);
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_JointsRunning_NO_JOINTS_07_00");	//Кажется, мы сошлись на трех стеблях? Отдай мне болотник, и тогда я помогу тебе!
	};
};


instance DIA_HARLOK_TRADESCROLL(C_Info)
{
	npc = sek_8011_harlok;
	nr = 5;
	condition = dia_harlok_tradescroll_condition;
	information = dia_harlok_tradescroll_info;
	permanent = TRUE;
	description = "Продай мне свой свиток.";
};


func int dia_harlok_tradescroll_condition()
{
	if((HARLOK_BRINGJOINTS == LOG_SUCCESS) && (TRADE_HARLOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_harlok_tradescroll_info()
{
	AI_Output(other,self,"DIA_Harlok_TradeScroll_07_00");	//Продай мне свой свиток.
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_01");	//Хорошо! Вот, держи его.
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_02");	//Наверное, мне не стоит напоминать тебе о том, как его необходимо использовать.
		B_GiveInvItems(self,other,ItSc_Sleep,1);
		TRADE_HARLOK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_03");	//Но у тебя же не хватает денег!
		AI_Output(self,other,"DIA_Harlok_TradeScroll_07_04");	//Приходи, когда у тебя будет пятьсот монет - тогда и поговорим.
	};
};


instance DIA_HARLOK_SEKTEHEILEN(C_Info)
{
	npc = sek_8011_harlok;
	nr = 1;
	condition = dia_harlok_sekteheilen_condition;
	information = dia_harlok_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int dia_harlok_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_harlok_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Harlok_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Harlok_SekteHeilen_01_01");	//Головная боль ушла... Она ушла!
	AI_Output(self,other,"DIA_Harlok_SekteHeilen_01_02");	//Спасибо тебе!
};

