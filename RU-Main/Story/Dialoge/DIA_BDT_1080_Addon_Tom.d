
instance DIA_Addon_Tom_EXIT(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 999;
	condition = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Tom_PICKPOCKET(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 900;
	condition = DIA_Addon_Tom_PICKPOCKET_Condition;
	information = DIA_Addon_Tom_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Tom_PICKPOCKET_Condition()
{
	return C_Beklauen(40,52);
};

func void DIA_Addon_Tom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,Dialog_Back,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Tom_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};

func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Tom_PICKPOCKET);
};


instance DIA_Addon_Tom_HI(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 1;
	condition = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent = FALSE;
	description = "Почему ты торчишь здесь?";
};


func int DIA_Addon_Tom_HI_Condition()
{
	if(TOM_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_HI_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Почему ты торчишь здесь?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//У меня проблемы. В данный момент мне лучше не показываться в лагере.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//Что не так?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//У меня были хорошие отношения с пиратами, понимаешь?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//Я всегда встречал ребят возле лагеря и торговал с ними.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Я отоварил половину лагеря! 'Том, принеси мне то, Том, принеси мне это'.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//А потом вмешался этот ублюдок Эстебан.
};


instance DIA_Addon_Tom_Juan(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 2;
	condition = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int DIA_Addon_Tom_Juan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_HI) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Juan_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//Что случилось?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Эстебан послал одного из своих ребят - Хуана. Этот мерзавец устроил нам засаду.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//Я как раз собирался заключить сделку с пиратами, когда он выскочил из темноты и сбил меня с ног двумя ударами!
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Этот парень очень быстр! Но недостаточно быстр. Мне удалось убежать от него.
	SC_Knows_JuanMurderedAngus = TRUE;
	B_LogEntry(TOPIC_Addon_KillJuan,"Хэнка и Ангуса подстерег и убил Хуан.");
};


instance DIA_Addon_Tom_Esteban(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 3;
	condition = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent = FALSE;
	description = "И с тех пор ты сидишь здесь?";
};


func int DIA_Addon_Tom_Esteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Juan) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Esteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//И с тех пор ты сидишь здесь?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//Сначала я зашел в лагерь и сказал Фиску, Хуно и другим, что они могут забыть про свои заказы.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//И что виноват Эстебан.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//И если Эстебан узнает, что это я сказал всем, что ОН виноват, я могу прощаться с жизнью.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//Поэтому я и не могу вернуться в лагерь.
	Tom_Tells = TRUE;
};


instance DIA_Addon_Tom_Dead(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 4;
	condition = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent = FALSE;
	description = "Эстебан мертв.";
};


func int DIA_Addon_Tom_Dead_Condition()
{
	if(Npc_IsDead(Esteban) && Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Tom_Dead_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Эстебан мертв.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Правда? Приятель, вот это УДАЧА!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Кто сделал это?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(игриво) Ну, скажем, некто, кого ты знаешь...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Спасибо, что пришел ко мне. Теперь я могу вернуться в лагерь...
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_Addon_Tom_PERM(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent = TRUE;
	description = "Что еще?";
};


func int DIA_Addon_Tom_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Tom_Esteban) && (TOM_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Tom_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//Что еще?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Теперь я могу спокойно пить варево Люсии.
	}
	else if(Npc_KnowsInfo(other,DIA_Addon_Tom_Dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Теперь я, наконец, могу показаться в лагере!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//А иначе бы я сидел тут и считал камни...
	};
};


instance DIA_ADDON_TOM_ORCINVASION(C_Info)
{
	npc = BDT_1080_Addon_Tom;
	nr = 5;
	condition = dia_addon_tom_orcinvasion_condition;
	information = dia_addon_tom_orcinvasion_info;
	permanent = TRUE;
	description = "Я слышал, ты помог парням...";
};


func int dia_addon_tom_orcinvasion_condition()
{
	if((TOM_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_tom_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_tom_orcinvasion_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_01");	//Я слышал, это ты помог парням смыться из лагеря?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_02");	//Ну, в общем, да. Хотя ничего героического я в этом не вижу.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_03");	//А откуда ты прознал про этот ход?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_04");	//Давно очень. Причем наткнулся на него совершенно случайно.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_05");	//Понятно. Торус сказал, что орки застали вас врасплох?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_06");	//Да, все произошло так неожиданно... Эти орки свалились на нас как снег на голову.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_07");	//Может, они пришли как-раз из того скрытого прохода?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_08");	//Нет, не думаю. Они атаковали со стороны болот.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_09");	//И что было дальше?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_10");	//В лагере поднялась такая неразбериха! Единственным, кто сохранил трезвую голову в этой ситуации, был Торус.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_11");	//Он и его ребята заняли оборону при входе на верхнее плато лагеря. Но орков было слишком много, и вскоре их оттеснили к храму.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_12");	//Собственно, тогда уже стало понятно, что лагерь нам не удержать.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_13");	//Поэтому, кто смог - последовал за мной к спасительному проходу, пока Торус с остатками своей гвардии прикрывал наше отступление.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_14");	//Как потом оказалось, только ему самому и удалось спастись. Все остальные погибли.
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_15");	//Да, все это просто ужасно.
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_16");	//Хорошо, конечно, что мы выбрались живыми из этой заварухи. Хотя непонятно, что теперь нам делать?
	AI_Output(self,other,"DIA_Addon_Tom_OrcInvasion_01_17");	//Наш лагерь - единственное, что у нас было. Мы же бандиты, люди вне закона - куда нам теперь идти? И что с нами будет?
	AI_Output(other,self,"DIA_Addon_Tom_OrcInvasion_01_18");	//Не переживай. Думаю, Торус что-нибудь придумает.
};


