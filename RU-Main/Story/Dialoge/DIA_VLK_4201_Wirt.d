
instance DIA_Wirt_EXIT(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 999;
	condition = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wirt_PICKPOCKET(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 900;
	condition = DIA_Wirt_PICKPOCKET_Condition;
	information = DIA_Wirt_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wirt_PICKPOCKET_Condition()
{
	return C_Beklauen(60,65);
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,Dialog_Back,DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};


instance DIA_Wirt_Hallo(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wirt_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CoragonGuestBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//Хей, подойди поближе! Выпей глоток холодного пива.
	AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//Лорд Андрэ выставил пару бочонков.
};

instance DIA_WIRT_GIVEBEER(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = dia_wirt_givebeer_condition;
	information = dia_wirt_givebeer_info;
	permanent = TRUE;
	description = "Дай мне немного пива.";
};

func int dia_wirt_givebeer_condition()
{
 	if(CoragonGuestBack == FALSE)
	{
		return TRUE;
	};
};

func void dia_wirt_givebeer_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Wirt_GiveBeer_01_00");	//Дай мне немного пива.
	if(WIRT_DAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_01");	//Конечно! Вот, держи.
		B_GiveInvItems(self,other,ItFo_Beer,1);
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//После сделанной работы нет ничего лучше, чем холодное пиво.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//Паладины уже все привели в порядок. Так, выпей еще глоток и спокойно насладись им!
		}
		else if(randy == 2)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//Можно много говорить о Хоринисе, но наш 'Темный паладин' - лучшее пиво во всей Миртане!
		};
		WIRT_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_02");	//Эй, но ведь ты уже получил сегодня свою порцию.
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_03");	//Если ты так быстро будешь уничтожать мои запасы, то так его точно на всех не хватит.
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_04");	//Лучше приходи завтра, и получишь еще одну кружку!
	};
};

instance DIA_Wirt_FixBeer_Done(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Done_Condition;
	information = DIA_Wirt_FixBeer_Done_Info;
	permanent = FALSE;
	description = "Теперь ты служишь в ополчении?";
};

func int DIA_Wirt_FixBeer_Done_Condition()
{
	if(CoragonGuestBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_00");	//Теперь ты служишь в ополчении?
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_01");	//Я и сам до сих пор не могу в это поверить. Они просто пришли и забрали меня!
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_02");	//Сказали, что для защиты города им нужны крепкие мужчины вроде меня. 
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_03");	//А я даже меч в руках держать не умею!
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_04");	//Ну, ты же понимаешь, времена сейчас непростые.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_05");	//Ополчению необходима любая помощь! А вид у тебя, кстати, довольно бравый.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_06");	//Думаю, всякий разбойник, завидев тебя издалека, сразу сбежит куда подальше!
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_07");	//(растерянно) Эммм... Ты так считаешь?
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_08");	//Да я просто в этом уверен - ты сам-то взгляни на себя!
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_09");	//Настоящий лихой рубака! Даже я тебя немного побаиваюсь.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_10");	//Кммм... эээ... Ну да, наверное, ты прав. Иначе бы зачем они меня сюда притащили.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_11");	//(задумчиво) Тогда... Тогда хватит болтать! Я вроде как на посту.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_12");	//Конечно, конечно! Неси вахту... солдат.
	AI_StopProcessInfos(self);
};

instance DIA_Wirt_FixBeer_Perm(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Perm_Condition;
	information = DIA_Wirt_FixBeer_Perm_Info;
	permanent = TRUE;
	description = "Как служба?";
};

func int DIA_Wirt_FixBeer_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wirt_FixBeer_Done))
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Perm_Info()
{
	AI_Output(other,self,"DIA_Wirt_FixBeer_Perm_01_00");	//Как служба?
	AI_Output(self,other,"DIA_Wirt_FixBeer_Perm_01_01");	//Не мешай!
	AI_StopProcessInfos(self);
};