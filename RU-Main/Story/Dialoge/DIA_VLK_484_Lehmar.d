var int LehmarLostBookDay;

instance DIA_Lehmar_EXIT(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 999;
	condition = DIA_Lehmar_EXIT_Condition;
	information = DIA_Lehmar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lehmar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_ENTSCHULDIGUNG(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 2;
	condition = DIA_Lehmar_ENTSCHULDIGUNG_Condition;
	information = DIA_Lehmar_ENTSCHULDIGUNG_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Lehmar_ENTSCHULDIGUNG_Condition()
{
	return TRUE;
};

func void DIA_Lehmar_ENTSCHULDIGUNG_Info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//Сколько ты хочешь?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//Что значит 'сколько'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//Я ростовщик и ты пришел ко мне! Что тебе еще может быть нужно от меня? Деньги, конечно.
};

instance DIA_Lehmar_LemarTheft(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Condition;
	information = DIA_Lehmar_LemarTheft_Info;
	permanent = FALSE;
	description = "Все-таки я сомневаюсь, что ты даешь деньги просто так.";
};

func int DIA_Lehmar_LemarTheft_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Info()
{
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_00");	//Все-таки я сомневаюсь, что ты всегда даешь деньги просто так.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_01");	//Нет, не всегда...(ухмыляется) В большинстве случаев я беру еще в залог что-нибудь ценное!
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_02");	//На тот случай, если кто-то все-таки не сможет вернуть свой долг.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_03");	//Не делая этого, я бы уже разорился. Но некоторые вещи вполне окупают мои расходы.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_04");	//А что ты с ними потом делаешь? Продаешь?
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_05");	//Некоторые продаю, некоторые оставляю себе.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_06");	//Может быть, тогда дашь мне взглянуть на то, что у тебя выставлено на продажу?
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_07");	//Уж не знаю. Ты не производишь впечатление богатого человека.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_08");	//А все эти вещи довольно дорогие!
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_09");	//У меня есть деньги.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_10");	//Докажи! Например, сколько у тебя сейчас с собой?
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_01_11");	//Вот, смотри.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(300);
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_12");	//Я впечатлен! У тебя тут больше тысячи золотых.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_13");	//Похоже, ты и вправду богат! Хотя по тебе этого не скажешь.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_14");	//Хорошо, я покажу тебе часть моих товаров.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_15");	//Уверен, что они тебя заинтересуют.
		B_LogEntry(Topic_LemarTheft,"Я добился от Лемара того, что он согласился мне продать заложенные ему вещи.");
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_16");	//Хммм. (улыбаясь) Да, неплохо! На первый взгляд, у тебя тут больше пятиста монет.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_17");	//Да, деньги у тебя водятся! Но я не думаю, что их хватило бы для покупки моих вещей.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_18");	//Так что извини.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_19");	//(посмеиваясь) Ну и что? У тебя тут чуть больше ста монет.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_20");	//Мои вещи стоят в разы дороже. Так что нам пока больше нечего обсуждать.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_21");	//Хммм. (пренебрежительно) Я и отсюда вижу, что ты беден.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_01_22");	//Лучше найди себе работу! А про мои вещи забудь. (зевая) Они не для таких, как ты.
		LehmarNoTrade = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Trade(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_Trade_Condition;
	information = DIA_Lehmar_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Lehmar_Trade_Condition()
{
	if(LehmarTrade == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};

instance DIA_Lehmar_LemarTheft_Again(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_LemarTheft_Again_Condition;
	information = DIA_Lehmar_LemarTheft_Again_Info;
	permanent = TRUE;
	description = "Теперь мне хватит денег, чтобы купить твои вещи.";
};

func int DIA_Lehmar_LemarTheft_Again_Condition()
{
	if((LehmarNoTrade == TRUE) && (LehmarTrade == FALSE) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_LemarTheft_Again_Info()
{
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_Again_01_00");	//Теперь мне хватит денег, чтобы купить твои вещи.
	AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_01");	//Да? (с интересом) Ну, давай, похвастайся.
	AI_Output(other,self,"DIA_Lehmar_LemarTheft_Again_01_02");	//Вот, смотри.

	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_03");	//(удивленно) Я впечатлен! У тебя тут больше тысячи золотых.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_04");	//Похоже, ты и вправду богат! Хотя по тебе этого не скажешь.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_05");	//(деловито) Хорошо, я покажу тебе часть моих товаров. 
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_06");	//Уверен, что они тебя очень заинтересуют!
		B_LogEntry(Topic_LemarTheft,"Я добился от Лемара того, что он согласился мне продать заложенные ему вещи.");
		LehmarTrade = TRUE;
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_07");	//Хммм. (улыбаясь) Да, неплохо! На первый взгляд, у тебя тут больше пятиста монет.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_08");	//Да, деньги у тебя водятся. Но не думаю, что их хватило бы для покупки моих вещей.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_09");	//Так что извини.
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_10");	//(посмеиваясь) Ну, и что? У тебя тут чуть больше ста монет.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_11");	//Извини, но мои вещи стоят в разы дороже! Так что нам пока больше нечего обсуждать.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_12");	//Хммм. (пренебрежительно) Я и отсюда вижу, что ты все так же беден.
		AI_Output(self,other,"DIA_Lehmar_LemarTheft_Again_01_13");	//Так что забудь про мои вещи. (зевая) Они не для тебя.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Lehmar_Relic(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Relic_Condition;
	information = DIA_Lehmar_Relic_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lehmar_Relic_Condition()
{
	if((Npc_HasItems(hero,ItMi_ParlanRelic_MIS) >= 1) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Relic_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Relic_01_00");	//Я так и знал, что тебя заинтересует эта вещица!
	AI_Output(self,other,"DIA_Lehmar_Relic_01_01");	//Мне ее заложил один из магов Огня.
	AI_Output(self,other,"DIA_Lehmar_Relic_01_02");	//К сожалению, для меня она оказалась абсолютно бесполезной.
	AI_Output(self,other,"DIA_Lehmar_Relic_01_03");	//Поэтому я рад, что наконец-то избавился от нее...(довольно) Выгодная сделка!
	AI_StopProcessInfos(self);
};

instance DIA_Lehmar_GELDLEIHEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_GELDLEIHEN_Condition;
	information = DIA_Lehmar_GELDLEIHEN_Info;
	permanent = TRUE;
	description = "Одолжи мне денег!";
};

var int DIA_Lehmar_GELDLEIHEN_noPerm;

func int DIA_Lehmar_GELDLEIHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) && (DIA_Lehmar_GELDLEIHEN_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDLEIHEN_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Одолжи мне денег!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Конечно! Сколько ты хочешь? Я беру двадцать процентов!
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Я подумаю над этим.",DIA_Lehmar_GELDLEIHEN_back);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Тысячу золотых.",DIA_Lehmar_GELDLEIHEN_1000);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Двести золотых.",DIA_Lehmar_GELDLEIHEN_200);
	Info_AddChoice(DIA_Lehmar_GELDLEIHEN,"Пятьдесят золотых.",DIA_Lehmar_GELDLEIHEN_50);
};

func void DIA_Lehmar_GELDLEIHEN_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Думай же быстрее! Не трать мое время попусту!
	AI_StopProcessInfos(self);
};

func void DIA_Lehmar_GELDLEIHEN_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//Пятьдесят золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Мелочь, да? Я хочу, чтобы ты вернул их завтра, понятно?
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 50;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//Двести золотых.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//Это большая сумма денег. Я хочу видеть тебя завтра, и деньги тоже, понятно?
	CreateInvItems(self,ItMi_Gold,200);
	B_GiveInvItems(self,other,ItMi_Gold,200);
	DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
	Lehmar_GeldGeliehen_Day = Wld_GetDay();
	Lehmar_GeldGeliehen = 200;
	Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
};

func void DIA_Lehmar_GELDLEIHEN_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//Тысячу золотых.

	if(RhetorikSkillValue[1] >= 10)
	{
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_03");	//(удивленно) Тысячу золотых?! Знаешь, это очень большая сумма.
		AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_09_04");	//У тебя, видимо, просто нет таких денег.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_05");	//Деньги-то есть, но я очень рискую, ссужая тебе столько золота.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_06");	//Ну ладно. (задумчиво) Я дам тебе тысячу монет.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_07");	//Но завтра же ты мне их вернешь! И с процентами. Все ясно?
		AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_09_08");	//Договорились.
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_09");	//Смотри! Не обмани меня.

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		CreateInvItems(self,ItMi_Gold,1000);
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
		Lehmar_GeldGeliehen_Day = Wld_GetDay();
		Lehmar_GeldGeliehen = 1000;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//У тебя с головой все в порядке?
		AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//Я дам тебе сотню. И не забудь мне вернуть их завтра!
		CreateInvItems(self,ItMi_Gold,100);
		B_GiveInvItems(self,other,ItMi_Gold,100);
		DIA_Lehmar_GELDLEIHEN_noPerm = TRUE;
		Lehmar_GeldGeliehen_Day = Wld_GetDay();
		Lehmar_GeldGeliehen = 100;
		Info_ClearChoices(DIA_Lehmar_GELDLEIHEN);
	};
};


instance DIA_Lehmar_WARUMGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = DIA_Lehmar_WARUMGELD_Condition;
	information = DIA_Lehmar_WARUMGELD_Info;
	permanent = FALSE;
	description = "Ты всегда так легко раздаешь деньги?";
};

func int DIA_Lehmar_WARUMGELD_Condition()
{
	if(Lehmar_GeldGeliehen != 0)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_WARUMGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Ты всегда так легко раздаешь деньги?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//Не волнуйся. Ты вернешься. Или я найду тебя и убью. Все просто.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//У тебя такая запоминающаяся внешность, что мне не составит труда найти тебя.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//Так что даже не думай обмануть меня.
};

var int Lehmar_vorbei;

instance DIA_Lehmar_GELDEINTREIBEN(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 5;
	condition = DIA_Lehmar_GELDEINTREIBEN_Condition;
	information = DIA_Lehmar_GELDEINTREIBEN_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_GELDEINTREIBEN_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//Ты не вернул долг, ублюдок! Верни мне мои деньги! А так как мне пришлось напоминать тебе об этом, процент возрастает.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//Теперь это обойдется тебе в тридцать процентов вместо обычных двадцати.
	Info_ClearChoices(DIA_Lehmar_GELDEINTREIBEN);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Я верну свой долг.",DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen);
	Info_AddChoice(DIA_Lehmar_GELDEINTREIBEN,"Я ничего тебе не дам!",DIA_Lehmar_GELDEINTREIBEN_kannstmich);
};

func void DIA_Lehmar_GELDEINTREIBEN_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//Я ничего тебе не дам!
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Ох, нет, дашь!
	Lehmar_vorbei = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//Я верну свой долг.

	if(Lehmar_GeldGeliehen == 50)
	{
		Lehmar_GeldGeliehen_MitZinsen = 65;
	};
	if(Lehmar_GeldGeliehen == 200)
	{
		Lehmar_GeldGeliehen_MitZinsen = 260;
	};
	if(Lehmar_GeldGeliehen == 100)
	{
		Lehmar_GeldGeliehen_MitZinsen = 130;
	};
	if(Lehmar_GeldGeliehen == 1000)
	{
		Lehmar_GeldGeliehen_MitZinsen = 1300;
	};
	IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

	if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
	{
		B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Тебе повезло! А теперь проваливай!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//У тебя с собой нет столько денег! Ладно. Похоже, мне придется преподать тебе урок.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Ничего личного - мне просто нужно поддерживать свою репутацию.
		Lehmar_vorbei = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Lehmar_GELDZURUECK(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 6;
	condition = DIA_Lehmar_GELDZURUECK_Condition;
	information = DIA_Lehmar_GELDZURUECK_Info;
	permanent = TRUE;
	description = "Вот твои деньги!";
};


func int DIA_Lehmar_GELDZURUECK_Condition()
{
	if(!Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) && (Lehmar_GeldGeliehen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_GELDZURUECK_Info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Вот твои деньги!

	if((RangerHelp_LehmarKohle == TRUE) && (Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Оставь их! Ларес уже обо всем позаботился.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//Похоже, вы с этим мошенником приятели, а? Ладно, это не мое дело. Удачи!
		Lehmar_GeldGeliehen = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Lehmar_GeldGeliehen == 50)
		{
			Lehmar_GeldGeliehen_MitZinsen = 60;
		};
		if(Lehmar_GeldGeliehen == 200)
		{
			Lehmar_GeldGeliehen_MitZinsen = 240;
		};
		if(Lehmar_GeldGeliehen == 100)
		{
			Lehmar_GeldGeliehen_MitZinsen = 120;
		};
		if(Lehmar_GeldGeliehen == 1000)
		{
			Lehmar_GeldGeliehen_MitZinsen = 1200;
		};
		IntToFloat(Lehmar_GeldGeliehen_MitZinsen);

		if(Npc_HasItems(other,ItMi_Gold) >= Lehmar_GeldGeliehen_MitZinsen)
		{
			B_GiveInvItems(other,self,ItMi_Gold,Lehmar_GeldGeliehen_MitZinsen);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Превосходно! Приятно иметь с тобой дело.
			Lehmar_GeldGeliehen = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//Здесь недостаточно! Возвращайся, когда у тебя будет вся сумма. У тебя еще есть время. Помни, 20 процентов!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Lehmar_NOCHMALGELD(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 8;
	condition = DIA_Lehmar_NOCHMALGELD_Condition;
	information = DIA_Lehmar_NOCHMALGELD_Info;
	permanent = TRUE;
	description = "Могу я занять у тебя денег?";
};

func int DIA_Lehmar_NOCHMALGELD_Condition()
{
	if((Lehmar_GeldGeliehen == 0) && (Lehmar_GeldGeliehen_MitZinsen != 0))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_NOCHMALGELD_Info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Могу я занять у тебя денег?

	if(Npc_KnowsInfo(other,DIA_Lehmar_GELDEINTREIBEN) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Ты думаешь, я идиот? Проваливай!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//Больше не можешь! Я понес большие издержки и теперь у меня на счету каждая монета.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Заходи через несколько дней!
	};
};

instance DIA_Lehmar_PICKPOCKET(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 900;
	condition = DIA_Lehmar_PICKPOCKET_Condition;
	information = DIA_Lehmar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его долговую книгу)";
};

func int DIA_Lehmar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,Dialog_Back,DIA_Lehmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lehmar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lehmar_PICKPOCKET_DoIt);
};

func void DIA_Lehmar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if(other.attribute[ATR_DEXTERITY] >= 15)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};

		B_GiveInvItems(self,other,ItWr_Schuldenbuch,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		LehmarLostBookDay = Wld_GetDay();
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Lehmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lehmar_PICKPOCKET);
};


instance DIA_Lehmar_BuchWeg(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_BuchWeg_Condition;
	information = DIA_Lehmar_BuchWeg_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lehmar_BuchWeg_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (LehmarLostBookDay > 0) && (LehmarLostBookDay < Wld_GetDay()) && (self.aivar[AIV_PlayerHasPickedMyPocket] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_BuchWeg_Info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//Какой-то гнусный вор украл мой гроссбух!
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//Ты случайно не имеешь к этому отношения, нет?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//Я? Нет.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Да-да, хорошо. Уходи отсюда!
	AI_StopProcessInfos(self);
};


instance DIA_Lehmar_verhauen(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_verhauen_Condition;
	information = DIA_Lehmar_verhauen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lehmar_verhauen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_KnowsInfo(other,DIA_Lehmar_BuchWeg) || (Lehmar_vorbei == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Lehmar_verhauen_Info()
{
	B_Say(self,other,"$NOTNOW");
};

var int ShramCanFight;

instance DIA_LEHMAR_KILLNOW(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 3;
	condition = dia_lehmar_killnow_condition;
	information = dia_lehmar_killnow_info;
	description = "Тебе привет от Асмала!";
};

func int dia_lehmar_killnow_condition()
{
	if(MIS_KILLTARGET2 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lehmar_killnow_info()
{
	var C_Npc guardian;

	guardian = Hlp_GetNpc(vlk_6120_lemarguard);
	AI_Output(other,self,"DIA_Lehmar_KillNow_01_00");	//Тебе привет от Асмала!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_03");	//Что? (растерянно) Так ты что, значит, работаешь на этого ублюдка?
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_05");	//Ха! Вот бы не подумал!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_06");	//Выходит, он подослал ко мне тебя!
	AI_Output(self,other,"DIA_Lehmar_KillNow_01_07");	//Но, боюсь, ему это мало чем поможет. Таких сопляков, как ты, мне бояться нечего.

	if((ShramIsDead == FALSE) && (Npc_GetDistToNpc(self,guardian) <= 600))
	{
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_15");	//Мой телохранитель порубает тебя в мелкий фарш!
		AI_Standup(self);
		AI_GotoNpc(self,guardian);
		AI_TurnToNPC(self,guardian);
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_16");	//Эй, ты! Не стой как истукан!
		AI_Output(self,other,"DIA_Lehmar_KillNow_01_17");	//Ты знаешь, что надо делать! Разберись с ним, да поживей!
		AI_TurnToNPC(self,other);
		ShramCanFight = TRUE;
	};

	AI_Output(self,other,"DIA_Lehmar_KillNow_01_18");	//Зря ты согласился на это дело, парень! Оно тебе явно не по зубам...(ухмыляется)
	Info_ClearChoices(dia_lehmar_killnow);
	Info_AddChoice(dia_lehmar_killnow,"...(это мы еще посмотрим!)",dia_lehmar_killnow_figth);
};

func void dia_lehmar_killnow_figth()
{	
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);

	if(ShramCanFight == TRUE)
	{
		B_Attack(vlk_6120_lemarguard,other,AR_ReactToWeapon,0);
	};
};

instance DIA_Lehmar_Job(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Condition;
	information = DIA_Lehmar_Job_Info;
	permanent = FALSE;
	description = "А у тебя не найдется для меня какой-нибудь работенки?";
};

func int DIA_Lehmar_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Info()
{
	AI_Output(other,self,"DIA_Lehmar_Job_01_00");	//А у тебя не найдется для меня какой-нибудь работенки?
	AI_Output(self,other,"DIA_Lehmar_Job_01_01");	//Хочешь поработать на меня? (задумчиво) Хммм... Ну что же, хорошо.
	AI_Output(self,other,"DIA_Lehmar_Job_01_02");	//У меня как раз возникла проблема с одним человеком.
	AI_Output(other,self,"DIA_Lehmar_Job_01_03");	//Что он сделал?
	AI_Output(self,other,"DIA_Lehmar_Job_01_04");	//Он занял у меня крупную сумму золота!
	AI_Output(self,other,"DIA_Lehmar_Job_01_05");	//Как он мне сам сказал - у него появилась возможность быстро разбогатеть на продаже болотника в портовом квартале.
	AI_Output(self,other,"DIA_Lehmar_Job_01_06");	//И пообещал вернуть вдвое больше золота, чем я ему одолжил. Но так и не заявился!
	AI_Output(self,other,"DIA_Lehmar_Job_01_07");	//Так вот. (серьезно) Найди его и верни мне мои деньги! 
	AI_Output(self,other,"DIA_Lehmar_Job_01_08");	//Если же денег при нем не окажется, тогда просто убей его.
	AI_Output(self,other,"DIA_Lehmar_Job_01_09");	//Но только сделай это тихо! Я не хочу иметь ничего общего с тем, кто торгует болотной травой.
	AI_Output(self,other,"DIA_Lehmar_Job_01_10");	//Ведь по законам города, за это могут посадить в тюрьму.
	AI_Output(other,self,"DIA_Lehmar_Job_01_11");	//Ладно. Где я его смогу найти?
	AI_Output(self,other,"DIA_Lehmar_Job_01_12");	//(ухмыляясь) Если бы я это знал, то проблема была бы уже давно решена.
	AI_Output(self,other,"DIA_Lehmar_Job_01_13");	//Надеюсь, намек ясен?
	AI_Output(other,self,"DIA_Lehmar_Job_01_14");	//Вполне.
	MIS_LehmarDebt = LOG_Running;
	Log_CreateTopic(TOPIC_LehmarDebt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Running);
	B_LogEntry(TOPIC_LehmarDebt,"Один человек занял у Лемара приличную сумму денег, сославшись на то, что знает способ быстро разбогатеть на торговле болотника. Но так и не вернул долг. Лемар хочет, чтобы я нашел его и выбил из него деньги, либо просто убил в назидание другим.");
};

instance DIA_Lehmar_Job_Done(C_Info)
{
	npc = VLK_484_Lehmar;
	nr = 1;
	condition = DIA_Lehmar_Job_Done_Condition;
	information = DIA_Lehmar_Job_Done_Info;
	permanent = TRUE;
	description = "Кажется, я нашел твоего должника.";
};

func int DIA_Lehmar_Job_Done_Condition()
{
	if((MIS_LehmarDebt == LOG_Running) && (Npc_IsDead(Mil_328_Miliz) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lehmar_Job_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_00");	//Кажется, я нашел твоего должника.
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_01");	//Хорошо. (спокойно) И где мои деньги?
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_02");	//Их у него с собой не оказалось. Зато при нем был огромный пакет болотника!
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_03");	//И что ты сделал?
	AI_Output(other,self,"DIA_Lehmar_Job_Done_01_04");	//Я его убил. Как ты и просил!
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_05");	//Хорошо. (довольно) Считай, ты справился с моим поручением.
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_06");	//Траву можешь оставить себе - в качестве награды!
	AI_Output(self,other,"DIA_Lehmar_Job_Done_01_07");	//А теперь проваливай! У меня есть дела и поважней.
	MIS_LehmarDebt = LOG_Success;
	Log_SetTopicStatus(TOPIC_LehmarDebt,LOG_Success);
	B_LogEntry(TOPIC_LehmarDebt,"Лемар был доволен тем, что я разделался с его должником.");
	AI_StopProcessInfos(self);
};