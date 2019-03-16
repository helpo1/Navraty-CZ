
instance DIA_Gritta_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_EXIT_Condition;
	information = DIA_Gritta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PICKPOCKET(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 900;
	condition = DIA_Gritta_PICKPOCKET_Condition;
	information = DIA_Gritta_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gritta_PICKPOCKET_Condition()
{
	return C_Beklauen(20,20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,Dialog_Back,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};


instance DIA_Gritta_Hello(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 10;
	condition = DIA_Gritta_Hello_Condition;
	information = DIA_Gritta_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Что тебе нужно, чужеземец? Если ты пришел просить милостыню, я вынуждена разочаровать тебя. Я бедная вдова.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Меня зовут Гритта. С тех пор, как умер мой муж, я слежу за домом моего дяди, Торбена.
};


instance DIA_Gritta_WantsMoney(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WantsMoney_Condition;
	information = DIA_Gritta_WantsMoney_Info;
	permanent = FALSE;
	description = "Меня прислал Маттео. Он говорит, что ты задолжала ему.";
};

func int DIA_Gritta_WantsMoney_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};


var int Gritta_WantPay;
var int Gritta_Threatened;

func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Меня прислал Маттео. Он говорит, что ты задолжала ему.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//Он хочет получить деньги? За что? То, что он мне прислал, ни на что не годится. Ткань отвратительная, а швы расползаются прямо на глазах.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//А ты выдел, какого они цвета? Это не тот цвет, что я заказывала. Это надувательство!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Послушай, если бы мой муж был жив, он бы не посмел заявлять такое. Ох, мой бедный муж...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...он был таким хорошим человеком. Красивый, работящий, настоящий джентльмен. У нас было все. Богатство, счастье...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...иногда нас даже приглашали в высший свет. На торжества, где можно было похвастаться нарядом и прической...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...на званые обеды... Тогда все было совсем по-другому. Тогда никто бы не осмелился унижать бедную вдову такими...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить...",DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...нелепыми заявлениями. А что мне теперь делать? Моя пенсия еле позволяет сводить концы с концами, а жизнь становится все труднее и труднее. Да ты сам можешь это видеть...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...людям приходится экономить и потуже затягивать пояса. Уже много недель ни один корабль не заходил в город. Мой муж был капитаном торгового корабля - на самом деле, он даже владел этим кораблем...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...из своих долгих плаваний он всегда привозил мне подарки - изысканные ткани с материка, дорогие специи из южных стран...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить...",DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...большинство даже не слышали о таких вещах. Но однажды, я получила известие, что Гритта затонула - так назывался этот корабль, мой муж назвал его так из...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...любви ко мне. Я плакала и молилась, чтобы моему мужу удалось выжить в этой катастрофе. Я надеялась, я ждала новостей о нем, но все мои молитвы были тщетными...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...да смилостивится Иннос над его душой. Пусть он спит спокойно. С тех пор мне приходится жить вот в этих скромных условиях. А теперь этот бездушный, бессердечный Маттео...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...хочет отнять у меня последние сбережения. Пожалуйста, сжалься над бедной женщиной. Если бы мой муж был жив, Маттео не посмел бы сделать это. Ох, мой бедный муж...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Хватит. Где золото?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Продолжить...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Хватит. Где золото?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//Но у меня нет золота, я бедная вдова!
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Выкладывай деньги, или мне придется проучить тебя!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Похоже, мне придется продать твои вещи.",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Я собираюсь заплатить эту сумму за тебя.",DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Ну, тогда мы просто продадим некоторые из твоих тряпок. Я уверен, что в твоем сундуке их целая груда.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Как ты смеешь, деревенщина! Ладно, вот, возьми золото.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//Видишь, это было не так уж сложно.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//А теперь, пожалуйста, покинь мой дом!
	Gritta_GoldGiven = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Я собираюсь заплатить эту сумму за тебя.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Ты сделаешь это ради меня? Ох, я знала, что ты не такой жадный как этот Маттео!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Да, да, не стоит благодарностей.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Возвращайся, когда вернешь деньги Маттео - я хочу отблагодарить тебя.
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(угрожающе) Выкладывай деньги, или мне придется проучить тебя!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(вызывающе) Да ты просто обычный бандит. Давай, доставай свое оружие, и я позову стражу!
	Gritta_Threatened = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_WINE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WINE_Condition;
	information = DIA_Gritta_WINE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gritta_WINE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Gritta_WantPay == TRUE) && (MIS_Matteo_Gold == LOG_SUCCESS) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//Это было очень благородно с твоей стороны заплатить за меня. Я хочу отблагодарить тебя.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Вот бутылка вина, которую мой муж, да упокоит Иннос его душу, привез с южных островов.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Также я расскажу о тебе всем! Наконец-то в городе появился человек, чья добродетель...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Да-да, не стоит благодарностей.
	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self,other,ItFo_Wine_Gritta,1);
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_PERM(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 3;
	condition = DIA_Gritta_PERM_Condition;
	information = DIA_Gritta_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gritta_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) && (MIS_Matteo_Gold == LOG_Running) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if(Gritta_WantPay == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Пока в городе есть такие люди как ты, меня не оставляет надежда, что все еще будет хорошо.
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Возвращайся, когда уладишь вопрос с Маттео.
		AI_StopProcessInfos(self);
	}
	else if(Gritta_Threatened == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Что ты уставился на меня, как идиот? Ты все равно не осмелишься ударить меня!
		AI_StopProcessInfos(self);
	}
	else if(Gritta_GoldGiven == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Что еще тебе нужно? Ты получил мое золото, убирайся.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Gritta_Kap3_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_Kap3_EXIT_Condition;
	information = DIA_Gritta_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int GrittaXP_Once;

instance DIA_Gritta_Perm3U4U5(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 31;
	condition = DIA_Gritta_Perm3U4U5_Condition;
	information = DIA_Gritta_Perm3U4U5_Info;
	permanent = TRUE;
	description = "Как дела? ";
};


func int DIA_Gritta_Perm3U4U5_Condition()
{
	if((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Как дела?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Все здесь катится в тартарары. Куда не взглянешь, везде одни преступления и насилие. Только представь, недавно убили даже паладина!
			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,Dialog_Back,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Это война и в это время случаются такие вещи.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Это пройдет.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Что ты слышала?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Ох, я так взволнована. Лорд Хаген освободил этого наемника.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//А какое это имеет отношение к тебе?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Да ты сам подумай. Ты веришь, что наемники сидели бы, сложа руки, когда их товарища собирались повесить?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Они бы попытались освободить его, и пролилось бы много крови. Но, слава Инносу, все разрешилось удачно.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Паладины к чему-то готовятся. Похоже, они собираются уходить из города.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Все как всегда, но я не хочу жаловаться.
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//Эта война - ради вас. Такое случается.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Да, всему виной эта ужасная война. Все страдают от нее. Не знаю даже, как им удается сводить концы с концами.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Иногда я спрашиваю себя, что мы сделали, чтобы заслужить такое наказание от Инноса.
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//Все будет хорошо.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//Ты пытаешься подбодрить меня. Это мило.
	if(GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Что ты слышала?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Только то, что говорят на улице.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Якобы убийцу уже схватили, но определенно я не могу тебе сказать.
};


instance DIA_GRITTA_MIISSBANDITS(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_miissbandits_condition;
	information = dia_gritta_miissbandits_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_miissbandits_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOUND == TRUE) && (GRITTAISBACK == FALSE) && (GRITTACANFOLLOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_miissbandits_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_00");	//Ты?! Что тебе надо? Зачем ты убил всех этих торговцев?
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_02");	//Они собирались продать мне ткань по выгодной цене!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_03");	//Разве ты не поняла - это же были бандиты!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_04");	//Какие бандиты?! Что за чушь ты несешь?
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_05");	//Да осмотрись по сторонам!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_06");	//Что торговцы делают в лесу, да еще и до зубов вооруженные?
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_07");	//Но...(растерянно) Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_08");	//Да тебя же просто похитили!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_10");	//Ой...(совсем растерянно) Как это? О боже!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_12");	//О господи! Какая же я дура!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_13");	//А я-то не могла понять, почему они так долго не несут эту ткань?
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_15");	//И что же теперь делать?
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_17");	//Пойдем - я отведу тебя обратно в город к Торбену.
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_19");	//(испуганно) Хорошо.
	B_LogEntry(TOPIC_MISSGRITTA,"Я нашел Гритту. Похоже, она даже не поняла, что ее похитили. Теперь надо отвести эту ненормальную к Торбену.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	GRITTACANFOLLOW = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_GRITTA_ANGEKOMMEN(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 55;
	condition = dia_gritta_angekommen_condition;
	information = dia_gritta_angekommen_info;
	important = TRUE;
};


func int dia_gritta_angekommen_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOLLOW == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 6000))
	{
		return TRUE;
	};
};

func void dia_gritta_angekommen_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Gritta_ANGEKOMMEN_01_00");	//Спасибо тебе! Думаю, дальше я смогу сама.
	AI_Output(other,self,"DIA_Gritta_ANGEKOMMEN_01_04");	//Не теряй времени - иди к Торбену, он волнуется за тебя!
	B_LogEntry(TOPIC_MISSGRITTA,"Я отвел Гритту в Хоринис.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	GRITTAISBACK = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	GRITTASTIMER = Wld_GetDay();
};


instance DIA_GRITTA_FINDLOSTHUSB(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusb_condition;
	information = dia_gritta_findlosthusb_info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int dia_gritta_findlosthusb_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MISSGRITTA == LOG_SUCCESS) && (GRITTASTIMER < (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusb_info()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_01");	//Да. Все хорошо, только вот...
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_03");	//Понимаешь... Прошлой ночью мне приснился сон, что мой муж жив!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_06");	//И теперь я не нахожу себе места. А вдруг это так? Вдруг он действительно жив?
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_07");	//И что ты собираешься делать?
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_08");	//(печально) А что я могу сделать? Возможно, я бы и отправилась на его поиски.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_09");	//Но после того случая с бандитами, Торбен больше не отпустит меня за пределы города.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_11");	//Может, тогда я смогу помочь?
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_14");	//Ну...(смущенно) Ты бы мне очень помог, если поискал бы моего пропавшего мужа.
	Info_ClearChoices(dia_gritta_findlosthusb);
	Info_AddChoice(dia_gritta_findlosthusb,"Почему бы и нет.",dia_gritta_findlosthusb_help);
	Info_AddChoice(dia_gritta_findlosthusb,"Извини, но на это у меня нет времени.",dia_gritta_findlosthusb_no);
};

func void dia_gritta_findlosthusb_no()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_No_01_00");	//Извини, но на это у меня сейчас нет времени.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_No_01_01");	//Я понимаю...
	Info_ClearChoices(dia_gritta_findlosthusb);
};

func void dia_gritta_findlosthusb_help()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_00");	//Почему бы и нет.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_01");	//Вот только чтобы начать его поиски, мне для начала нужно узнать об его исчезновении.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_04");	//Моего мужа звали Брендик. Я, кажется, уже говорила тебе, что он пропал в море.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_07");	//Знаешь, у него была всегда только одна мечта - стать морским волком и искателем приключений.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_08");	//Сражения, битвы, океанские просторы и море славы - вот чего он по-настоящему хотел.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_09");	//Ого! Такая жизнь под стать только пирату!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_10");	//Пирату? Да-да...(ностальгически) Брендик частенько говорил о том, что хотел бы стать пиратом. Ведь это так романтично!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_16");	//Хммм...(задумчиво) Знаешь, в том сне, что я видела, Брендик был одет в какую-то странную одежду.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_17");	//Она чем-то немного напоминала ту, которую как раз обычно носят пираты.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_19");	//Однако мне в мало верится в то, что Брендик стал пиратом.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_22");	//Если он действительно стал пиратом, то, думаю, я знаю, где его искать.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_25");	//Хорошо, я буду ждать от тебя новостей!
	MIS_FINDLOSTHUSB = LOG_Running;
	Log_CreateTopic(TOPIC_FINDLOSTHUSB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_Running);
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Гритта рассказала мне, что недавно ей приснилось, что ее муж жив. Она попросила меня заняться его поиском. Судя по всему, Брендик - так звали ее мужа - стал пиратом, так как всегда мечтал об этом. Надо будет наведаться в лагерь Грэга и расспросить его об этом парне.");
	Info_ClearChoices(dia_gritta_findlosthusb);
};


instance DIA_GRITTA_FINDLOSTHUSBDONE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusbdone_condition;
	information = dia_gritta_findlosthusbdone_info;
	permanent = FALSE;
	description = "Твой муж жив.";
};


func int dia_gritta_findlosthusbdone_condition()
{
	if((MIS_FINDLOSTHUSB == LOG_Running) && (BRENDIKNOTBACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusbdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_00");	//Твой муж жив.
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_01");	//(ошеломленно) Ты нашел его? Неужели это правда?
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_03");	//О, Иннос! И где же он?
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_04");	//Брендик стал пиратом. И, кажется, это занятие ему очень по душе.
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_05");	//Невероятно! Кто бы мог подумать...
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_06");	//Значит, он все-таки осуществил свою мечту.
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_07");	//Да, но он сказал, что не вернется к тебе.
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_08");	//Ну, я на это сильно и не рассчитывала...(грустно)
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_09");	//По крайней мере, я буду спать спокойно, зная, что с ним все в порядке и он по-настоящему счастлив!
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_10");	//Так что спасибо тебе, что принес мне хорошую новость!
	MIS_FINDLOSTHUSB = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Гритта была рада узнать, что ее муж жив - даже несмотря на то, что больше никогда его не увидит.");
	if((MIS_LuciasLetter == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == FALSE))
	{
		ELVRIHMARRYGRITTATIMER = Wld_GetDay();
		ELVRIHMARRYGRITTAFLAG = TRUE;
	};
};


instance DIA_GRITTA_ELVRICHGRITTA(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrichgritta_condition;
	information = dia_gritta_elvrichgritta_info;
	permanent = FALSE;
	description = "Все еще переживаешь?";
};


func int dia_gritta_elvrichgritta_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrichgritta_info()
{
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_00");	//Все еще переживаешь?
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_03");	//Да, и одной мне немного трудновато. Ведь когда у меня был муж, все было по-другому.
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_04");	//Понимаю. Скажи, а ты никогда не задумывалась о том, чтобы снова выйти замуж?
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_05");	//Что? (замялась) Честно говоря, я об этом никогда не задумывалась.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_06");	//Да и кому я нужна такая...
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_07");	//Например, Элвриху.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_12");	//Элвриху? Он очень милый паренек и, к тому же, такой симпатичный...(смущенно)
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_13");	//Тогда тебе интересно будет узнать, что Элврих просто без ума от тебя!
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_16");	//Но... но как такое может быть? (совсем растерянно) Почему же он тогда никогда не говорил мне об этом?
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_17");	//Он просто очень боится, что ты ему откажешь.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_24");	//Я была бы рада тому, если он решится признаться в своих чувствах.
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_27");	//Думаю, что Элврих скоро это сделает.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_28");	//О боже! Если это так...(в панике) Ох! А я, наверно, сейчас так ужасно выгляжу... Кошмар!
	B_LogEntry(TOPIC_ELVRIHMARRYGRITTA,"Гритта будет просто счастлива, если Элврих обратит на нее внимание и признается в своих чувствах.");
	GRITTAAGREEMARRY = TRUE;
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		Npc_ExchangeRoutine(VLK_418_Gritta,"GoMarry");
		Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"GoMarry");
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_ELVRIHMARRYGRITTADONE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrihmarrygrittadone_condition;
	information = dia_gritta_elvrihmarrygrittadone_info;
	permanent = FALSE;
	description = "Есть новости?";
};


func int dia_gritta_elvrihmarrygrittadone_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrihmarrygrittadone_info()
{
	AI_Output(other,self,"DIA_Gritta_ElvrihMarryGrittaDone_01_00");	//Есть новости?
	AI_Output(self,other,"DIA_Gritta_ElvrihMarryGrittaDone_01_01");	//Если по поводу Элвриха, то ты оказался прав...(смущенно) Мне даже не верится!
	AI_Output(self,other,"DIA_Gritta_ElvrihMarryGrittaDone_01_02");	//Я так счастлива! Спасибо тебе.
};

