
instance DIA_Gaertner_EXIT(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 999;
	condition = DIA_Gaertner_EXIT_Condition;
	information = DIA_Gaertner_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gaertner_PICKPOCKET(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 900;
	condition = DIA_Gaertner_PICKPOCKET_Condition;
	information = DIA_Gaertner_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gaertner_PICKPOCKET_Condition()
{
	return C_Beklauen(40,50);
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,Dialog_Back,DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};


instance DIA_Gaertner_Job(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Job_Condition;
	information = DIA_Gaertner_Job_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//А ты как думаешь? Я садовник и ухаживаю за этим садом.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//Ты, похоже, вполне доволен жизнью?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//Да! И хотелось бы, чтобы все так оставалось подольше.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//Когда-то меня даже хотели отправить в колонию за то, что я прикончил одного парня.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//Но Лариусу, главе города, нужен был садовник, и меня оставили здесь.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//Со временем этот сад стал моим домом! И я вполне доволен этим.
};

instance DIA_Gaertner_Escape(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Escape_Condition;
	information = DIA_Gaertner_Escape_Info;
	permanent = FALSE;
	description = "Ты не пытался сбежать отсюда?";
};

func int DIA_Gaertner_Escape_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Escape_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Escape_01_00");	//А ты не пытался сбежать отсюда?
	AI_Output(self,other,"DIA_Gaertner_Escape_01_01");	//Поначалу я тоже думал об этом! Но потом решил отказаться от этой затеи.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_02");	//Во-первых, вся стража знает меня в лицо, и я не смогу даже выйти за пределы верхнего квартала.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_03");	//Во-вторых, учитывая все эти слухи об орках, я предпочитаю держаться рядом с паладинами.
	AI_Output(self,other,"DIA_Gaertner_Escape_01_04");	//А в-третьих, мне и бежать-то особо некуда!
	AI_Output(self,other,"DIA_Gaertner_Escape_01_05");	//Поэтому, как ни крути, тут мне будет лучше, нежели с кайлом в руках на рудниках паладинов. 
	AI_Output(other,self,"DIA_Gaertner_Escape_01_06");	//Я тебя прекрасно понимаю.
};

instance DIA_Gaertner_Plants(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Plants_Condition;
	information = DIA_Gaertner_Plants_Info;
	permanent = FALSE;
	description = "Ты выращиваешь какие-нибудь травы?";
};

func int DIA_Gaertner_Plants_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//Ты выращиваешь какие-нибудь травы?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//Да, немного. Я выращиваю огненную траву и огненную крапиву. Также я пытался сажать болотную траву, но она не прижилась здесь.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//Я только что собрал выращенное! Так что, если ты хочешь что-то купить...
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Садовник может продать мне кое-какие растения.");
};

instance DIA_Gaertner_Trade(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Trade_Condition;
	information = DIA_Gaertner_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Gaertner_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};


instance DIA_Gaertner_Krautabak(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 5;
	condition = DIA_Gaertner_Krautabak_Condition;
	information = DIA_Gaertner_Krautabak_Info;
	permanent = FALSE;
	description = "У меня есть травяной табак.";
};


func int DIA_Gaertner_Krautabak_Condition()
{
	if((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//У меня есть травяной табак. Хочешь затянуться?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//Даже не знаю... А, ладно, давай. Покурю немного.
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Npc_RemoveInvItems(self,ItMi_SumpfTabak,1);
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//Хха... кха-кха....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//Ядреная штука! Что-то мне расхотелось курить это.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Gaertner_Sign(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_Sign_Condition;
	information = DIA_Gaertner_Sign_Info;
	permanent = FALSE;
	description = "(Показать сигнал воров)";
};

func int DIA_Gaertner_Sign_Condition()
{
	if(Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//Теперь ты один из нас и я могу подкинуть тебе кое-какую информацию.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//В некоторых домах здесь есть секретные панели, которые открываются скрытыми выключателями. 
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//Люди хранят там самые ценные свои вещи.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Gaertner_HelpThings(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_condition;
	information = DIA_Gaertner_HelpThings_info;
	permanent = FALSE;
	description = "Я могу чем-то помочь тебе?";
};

func int DIA_Gaertner_HelpThings_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gaertner_Sign) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_info()
{
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_00");	//Я могу чем-то помочь тебе?
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_01");	//Конечно, брат. Как ты мог заметить, я целыми днями только и делаю, что торчу тут.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_02");	//Стражники меня даже за ограду ратуши не выпускают.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_03");	//Поэтому моя жизнь лишена даже самых простых удовольствий.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_04");	//Однако если бы ты только смог принести мне несколько бутылок джина и немного болотника...
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_05");	//Понимаю. Сколько тебе надо?
	AI_Output(self,other,"DIA_Gaertner_HelpThings_01_06");	//(задумчиво) Думаю, трех бутылок и пяти стеблей будет достаточно. Больше мне все равно негде прятать.
	AI_Output(other,self,"DIA_Gaertner_HelpThings_01_07");	//Хорошо, я достану их для тебя.
	MIS_GaertnerHive = LOG_Running;
	Log_CreateTopic(TOPIC_GaertnerHive,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Running);
	B_LogEntry(TOPIC_GaertnerHive,"Садовник попросил достать ему три бутылки джина и пять косяков болотника.");
};

instance DIA_Gaertner_HelpThings_Done(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = DIA_Gaertner_HelpThings_Done_condition;
	information = DIA_Gaertner_HelpThings_Done_info;
	permanent = FALSE;
	description = "Я принес то, что ты просил.";
};

func int DIA_Gaertner_HelpThings_Done_condition()
{
	if((MIS_GaertnerHive == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 3) && (Npc_HasItems(other,ItMi_Joint) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_HelpThings_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Gaertner_HelpThings_Done_01_00");	//Я принес то, что ты просил.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItFo_Booze,3);
	Npc_RemoveInvItems(hero,ItMi_Joint,5);
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_01");	//(довольно) Наконец-то. Что ж, теперь я у тебя в долгу, приятель.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_02");	//Чем же мне тебя отблагодарить...
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_03");	//Слушай... как-то раз, подстригая траву возле входа в ратушу, я обнаружил этот ключ.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_04");	//Похоже, его выронил один из паладинов.
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_05");	//По правде говоря, я не знаю, какой именно сундук он открывает. 
	AI_Output(self,other,"DIA_Gaertner_HelpThings_Done_01_06");	//Но наверняка там будет чем поживиться.
	B_GiveInvItems(self,other,ItKe_PaladinTruhe,1);
	MIS_GaertnerHive = LOG_Success;
	Log_SetTopicStatus(TOPIC_GaertnerHive,LOG_Success);
	B_LogEntry(TOPIC_GaertnerHive,"Я принес садовнику джин и болотник. За это он мне дал какой-то странный ключ. По всей видимости, от сундука...");
};

instance DIA_GAERTNER_ENTERHALL(C_Info)
{
	npc = VLK_411_Gaertner;
	nr = 6;
	condition = dia_gaertner_enterhall_condition;
	information = dia_gaertner_enterhall_info;
	permanent = FALSE;
	description = "Ты знаешь, как попасть в ратушу?";
};

func int dia_gaertner_enterhall_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && Npc_KnowsInfo(hero,DIA_Gaertner_Sign) && (MeetLarius == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaertner_enterhall_info()
{
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_00");	//Ты, случайно, не знаешь, как можно попасть в ратушу?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_01");	//А зачем тебе туда нужно попадать?
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_02");	//Мне надо срочно встретиться с Лариусом - городской главой Хориниса. У меня к нему есть небольшое дельце.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_03");	//Ха! Забудь об этом, парень. Паладины не пустят тебя внутрь в любом случае.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_04");	//Если, конечно, ты не состоишь на службе у короля.
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_05");	//Ну, может, есть какой-нибудь другой способ встретиться с ним?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_06");	//Ну, один способ, конечно, есть. Точнее, это даже не способ, я бы сказал.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_07");	//С недавнего времени я стал замечать, что Лариус иногда стал покидать свою резиденцию.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_08");	//Выходит, так сказать, прогуляться и подышать свежим воздухом. Смекаешь?
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_09");	//А когда приблизительно он это делает?
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_10");	//Точно сказать не могу, но, кажется, около полудня.
	AI_Output(other,self,"DIA_Gaertner_EnterHall_01_11");	//Спасибо, я все понял.
	AI_Output(self,other,"DIA_Gaertner_EnterHall_01_12");	//Да не за что. (смеется)
	B_LogEntry(TOPIC_ORUNPACKET,"Садовник сказал мне, что Лариус иногда выходит подышать свежим воздухом. Обычно где-то около полудня.");
};