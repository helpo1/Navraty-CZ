
instance DIA_FISK_NW_EXIT(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 999;
	condition = dia_fisk_nw_exit_condition;
	information = dia_fisk_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_fisk_nw_exit_condition()
{
	return TRUE;
};

func void dia_fisk_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FISK_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 900;
	condition = dia_fisk_nw_pickpocket_condition;
	information = dia_fisk_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fisk_nw_pickpocket_condition()
{
	return C_Beklauen(120,500);
};

func void dia_fisk_nw_pickpocket_info()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
	Info_AddChoice(dia_fisk_nw_pickpocket,Dialog_Back,dia_fisk_nw_pickpocket_back);
	Info_AddChoice(dia_fisk_nw_pickpocket,DIALOG_PICKPOCKET,dia_fisk_nw_pickpocket_doit);
};

func void dia_fisk_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};

func void dia_fisk_nw_pickpocket_back()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};


instance DIA_FISK_NW_HI(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 1;
	condition = dia_fisk_nw_hi_condition;
	information = dia_fisk_nw_hi_info;
	permanent = FALSE;
	description = "Не могу поверить своим глазам!";
};


func int dia_fisk_nw_hi_condition()
{
	return TRUE;
};

func void dia_fisk_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_00");	//Не могу поверить своим глазам! Фиск, как ты здесь очутился?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_01");	//Хмм... Cтранный вопрос для человека, который сам как-то умудрился оказаться здесь.
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_03");	//А как тебе удалось миновать стражу?!
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_04");	//Сам понимаешь: деловые люди всегда смогут договориться. Я сделал им предложение, от которого они не смогли отказаться...(смеется)
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_05");	//А я сам-то гляжу, ты тоже малый не промах.

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_06");	//Если честно, впервые вижу бандита, который смог втереться в доверие к магам Огня. Да еще и стать им!
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_07");	//Видать, у паладинов совсем крыша поехала, если они начали брать к себе на службу беглых каторжников!
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_08");	//Уже успел стать наемником. Неплохо для бывшего заключенного!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0A");	//Если честно, впервые вижу бандита, который смог втереться в доверие к магам Воды. Да еще и стать им!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0B");	//Если честно, впервые вижу бандита, который смог стать некромантом! Поразительно...(удивленно)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0C");	//Уже успел записаться в сектанты! Поразительно...(удивленно)
	};

	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_09");	//Как бы тебе сказать. В общем, я не совсем тот, за кого себя выдавал. Просто... Там на болотах, мне... В общем, были дела.
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_10");	//Ну ладно, не оправдывайся. В конце концов, там, в лагере, ты мне очень здорово помог. Рука руку моет - помнишь?
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_11");	//Да уж. Вижу, ты тут тоже неплохо устроился!
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_12");	//Я за то время, что провел в лагере, успел скопить неплохой капитал. Его как раз хватило на то, чтобы открыть здесь свое небольшое дельце.
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_13");	//А остальные торговцы не были против?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_14");	//Я поговорил с ними. Вроде никто не стал возражать. Хотя это опять же мне стоило недешево. Но, думаю, это себя оправдывает.
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_15");	//А что им волноваться? Это местечко, как видишь, стоит на самом отшибе торговой площади. Поэтому и клиентов у меня поменьше, чем у них.
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_16");	//Приходится работать немного побольше, чем все остальные.
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_17");	//А мне ты сможешь что-нибудь продать?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_18");	//Конечно, выбирай.
};

instance DIA_FISK_NW_TRADE(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 775;
	condition = dia_fisk_nw_trade_condition;
	information = dia_fisk_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Давай займемся делом!";
};

func int dia_fisk_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_fisk_nw_hi) && Wld_IsTime(5,10,21,30))
	{
		return TRUE;
	};
};

func void dia_fisk_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


