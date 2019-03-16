
instance DIA_SALENTIN_EXIT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 999;
	condition = dia_salentin_exit_condition;
	information = dia_salentin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_salentin_exit_condition()
{
	return TRUE;
};

func void dia_salentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_HALLO(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_hallo_condition;
	information = dia_salentin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_hallo_condition()
{
	return TRUE;
};

func void dia_salentin_hallo_info()
{
	AI_Output(self,other,"DIA_Salentin_Hallo_01_00");	//(удивленно) Эй! Что ты тут делаешь?! Да как ты вообще попал сюда?
	AI_Output(self,other,"DIA_Salentin_Hallo_01_01");	//Если паладины заметят - они убьют тебя!
	AI_Output(other,self,"DIA_Salentin_Hallo_01_02");	//Не беспокойся, я с ними как-нибудь договорюсь.
	AI_Output(self,other,"DIA_Salentin_Hallo_01_03");	//ЧТО?! Да они и слушать тебя не станут! Ты хотя бы представляешь, что это за место?
	AI_Output(self,other,"DIA_Salentin_Hallo_01_04");	//(сочувственно) Ох, парень, мой тебе совет: лучше уходи отсюда, пока не поздно.
	BEONETLU = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_BAUERNAUFSTAND(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_bauernaufstand_condition;
	information = dia_salentin_bauernaufstand_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_salentin_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_salentin_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_01");	//Что?! Ты еще здесь?
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_03");	//Да не переживай ты так. Я здесь по делу.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_04");	//Интересно, какое дело могло привести сюда человека вроде тебя?
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_05");	//Я ищу одну вещь. Точнее, один амулет - Трирамар. Знаешь о нем что-нибудь?
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_06");	//Какой еще Трирамар? Это что такое?
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_08");	//Я же сказал - амулет, и он мне очень нужен, без него я отсюда не уйду.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_09");	//(смеется) Ты отсюда и так уже никуда не уйдешь!
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_10");	//Единственный путь с этого острова - это магический портал за часовней на севере, но его охраняют паладины.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_11");	//И не думаю, что они выпустят тебя отсюда живым.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_12");	//Да, парень, ты знатно вляпался!
};


instance DIA_SALENTIN_TRIRAMAR(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_triramar_condition;
	information = dia_salentin_triramar_info;
	permanent = FALSE;
	description = "А где паладины хранят этот амулет?";
};


func int dia_salentin_triramar_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_triramar_info()
{
	AI_Output(other,self,"DIA_Salentin_Triramar_01_00");	//Часовня, говоришь? А там не может храниться амулет?
	AI_Output(self,other,"DIA_Salentin_Triramar_01_01");	//Я понятия не имею, что там хранится. Я и на полет стрелы не приближаюсь к ней, мне дорога моя жизнь.
	AI_Output(other,self,"DIA_Salentin_Triramar_01_03");	//Хватит меня пугать! Просто скажи - где эта часовня?
	AI_Output(self,other,"DIA_Salentin_Triramar_01_04");	//Сумасшедший, точно сумасшедший.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_06");	//Часовня находится на севере от моей хижины. И, раз уж ты туда собрался, я попрошу тебя об одном одолжении...
	AI_Output(self,other,"DIA_Salentin_Triramar_01_07");	//...постарайся, чтоб тебя убили не слишком близко к ней - мне бы пригодилось твое снаряжение. (с сарказмом)
	AI_Output(other,self,"DIA_Salentin_Triramar_01_08");	//(кисло) Да ты прям шутник, как я посмотрю. Скажи лучше, много ли паладинов в часовне?
	AI_Output(self,other,"DIA_Salentin_Triramar_01_11");	//Нет, основная часть вместе с командованием квартирует в лагере на востоке острова.
	AI_Output(other,self,"DIA_Salentin_Triramar_01_12");	//Тогда наведуюсь к ним в лагерь.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_13");	//ЧТО?! (подавился) А, ну да, да, давай, наведайся... на тот свет.
};


instance DIA_SALENTIN_GETOUT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_getout_condition;
	information = dia_salentin_getout_info;
	permanent = FALSE;
	description = "А как еще можно выбраться с этого острова?";
};


func int dia_salentin_getout_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_getout_info()
{
	AI_Output(other,self,"DIA_Salentin_GetOut_01_00");	//А как еще можно выбраться с этого острова?
	AI_Output(self,other,"DIA_Salentin_GetOut_02_01");	//Никак. Стал бы я иначе торчать здесь столько времени!
	AI_Output(self,other,"DIA_Salentin_GetOut_04_03");	//У меня этот остров уже в печенках сидит.
	AI_Output(self,other,"DIA_Salentin_GetOut_05_04");	//Паладины, слава Инносу, не трогают меня, но и к порталу не подпускают.
};


instance DIA_SALENTIN_HOWIN(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_howin_condition;
	information = dia_salentin_howin_info;
	permanent = FALSE;
	description = "А как ты сам здесь очутился?";
};


func int dia_salentin_howin_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_howin_info()
{
	AI_Output(other,self,"DIA_Salentin_HowIn_01_00");	//А как ты сам здесь очутился?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_04");	//Когда-то я был моряком и служил на одном из торговых кораблей. Мы занимались перевозкой магической руды из одной богом забытой колонии...
	AI_Output(self,other,"DIA_Salentin_HowIn_01_05");	//Однажды, возвращаясь на материк, наш корабль угодил в жуткий шторм. Корабль его не пережил - разломился надвое. А меня волной снесло в открытое море.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_09");	//Очнулся я уже на острове, а вокруг меня толпилась куча паладинов.
	AI_Output(other,self,"DIA_Salentin_HowIn_01_10");	//Почему же они оставили тебя в живых?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_11");	//Ну, паладины не звери какие-нибудь. Тем более я оказался на их острове не по своей воле.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_13");	//Они разрешили мне остаться и жить на этом острове. Дали мне еды, новую одежду и даже инструменты!
	AI_Output(other,self,"DIA_Salentin_HowIn_01_14");	//А почему ты не остался жить вместе с ними?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_15");	//Парень, это военный лагерь, а не постоялый двор.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_23");	//Я стараюсь пореже попадаться к ним на глаза. И тебе советую делать то же самое!
};


instance DIA_SALENTIN_CANPASS(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpass_condition;
	information = dia_salentin_canpass_info;
	permanent = FALSE;
	description = "Ты сам бываешь в лагере паладинов?";
};


func int dia_salentin_canpass_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_howin) && (MIS_BELIARHELPME == LOG_SUCCESS) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpass_info()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_01_00");	//Ты сам бываешь в лагере паладинов?
	AI_Output(self,other,"DIA_Salentin_CanPass_01_01");	//Да, пару раз в месяц я приношу им рыбу, которую мне удается поймать.
	AI_Output(self,other,"DIA_Salentin_CanPass_01_02");	//А взамен они мне дают мясо и воду. Так что голодать мне здесь особо не приходится.
	AI_Output(other,self,"DIA_Salentin_CanPass_01_03");	//Значит, они тебе доверяют, если пускают в лагерь?
	AI_Output(self,other,"DIA_Salentin_CanPass_01_04");	//Не то чтобы доверяют, но я не представляю для них ни малейшей опасности, поэтому меня терпят.
	AI_Output(self,other,"DIA_Salentin_CanPass_01_05");	//Ну и я, соответственно, стараюсь их не злить. А почему ты спрашиваешь?
	TELLSALENTINLAGER = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"Думаю, ты мне пригодишься.",dia_salentin_canpass_yes);
	};
	Info_AddChoice(dia_salentin_canpass,"Просто интересуюсь.",dia_salentin_canpass_no);
};

func void dia_salentin_canpass_no()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_No_01_00");	//Просто интересуюсь.
	AI_Output(self,other,"DIA_Salentin_CanPass_No_01_01");	//Хммм...
	Info_ClearChoices(dia_salentin_canpass);
};

func void dia_salentin_canpass_yes()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_00");	//Думаю, ты мне пригодишься.
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_01");	//Раз паладины тебе доверяют, я использую тебя, чтобы проникнуть к ним в лагерь.
	AI_Output(self,other,"DIA_Salentin_CanPass_Yes_01_02");	//(настороженно) То есть? Что ты задумал?
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"...ГВАР САХ ЭСК ШАТАР...!",dia_salentin_canpass_use);
	};
};

func void dia_salentin_canpass_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_00");	//...ГВАР САХ ЭСК ШАТАР...!
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_01");	//Белиар, повелитель Тьмы! Даруй мне свое могущество, чтобы принять облик этого человека.
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_02");	//И завершить то, ради чего я здесь!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_03");	//О Иннос! Кто ты? Ты служишь Белиару?!
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_04");	//И что это за магия?! О боже, что со мной происходит! Нееет...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"(использовать амулет)",dia_salentin_canpass_usedead);
	};
};

func void dia_salentin_canpass_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_CANPASSAGAIN(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpassagain_condition;
	information = dia_salentin_canpassagain_info;
	permanent = TRUE;
	description = "У меня есть к тебе дело.";
};


func int dia_salentin_canpassagain_condition()
{
	if((TELLSALENTINLAGER == TRUE) && (USESALENTINAMULET == FALSE) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpassagain_info()
{
	AI_Output(other,self,"DIA_Salentin_CanPassAgain_01_00");	//У меня есть к тебе дело.
	AI_Output(self,other,"DIA_Salentin_CanPassAgain_01_01");	//Какое именно?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"Думаю, ты мне пригодишься.",dia_salentin_canpassagain_yes);
	};
	Info_AddChoice(dia_salentin_canpassagain,"Просто интересуюсь.",dia_salentin_canpassagain_no);
};

func void dia_salentin_canpassagain_no()
{
	AI_Output(other,self,"DIA_Salentin_CanPassAgain_No_01_00");	//Пока забудь об этом.
	AI_Output(self,other,"DIA_Salentin_CanPassAgain_No_01_01");	//Хммм... Ну ладно, как скажешь.
	Info_ClearChoices(dia_salentin_canpassagain);
};

func void dia_salentin_canpassagain_yes()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_00");	//Думаю, ты мне пригодишься.
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_01");	//Раз паладины тебе доверяют - я использую тебя, чтобы проникнуть к ним в лагерь.
	AI_Output(self,other,"DIA_Salentin_CanPass_Yes_01_02");	//(настороженно) То есть?  Что ты задумал?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"...ГВАР САХ ЭСК ШАТАР...!",dia_salentin_canpassagain_use);
	};
};

func void dia_salentin_canpassagain_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_00");	//...ГВАР САХ ЭСК ШАТАР...!
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_01");	//Белиар, повелитель Тьмы! Даруй мне свое могущество, чтобы принять облик этого человека.
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_02");	//И завершить то, ради чего я здесь!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_03");	//О Иннос! Кто ты? Ты служишь Белиару?!
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_04");	//И что это за магия?! О боже, что со мной происходит! Нееет...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"(использовать амулет)",dia_salentin_canpassagain_usedead);
	};
};

func void dia_salentin_canpassagain_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_ADVICE(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_advice_condition;
	information = dia_salentin_advice_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_advice_condition()
{
	if(Npc_KnowsInfo(hero,dia_salentin_triramar) && (USESALENTINAMULET == FALSE) && Npc_KnowsInfo(hero,dia_salentin_howin))
	{
		return TRUE;
	};
};

func void dia_salentin_advice_info()
{
	AI_Output(self,other,"DIA_Salentin_Advice_01_00");	//Эй, постой!
	AI_Output(other,self,"DIA_Salentin_Advice_01_01");	//Что еще?
	AI_Output(self,other,"DIA_Salentin_Advice_01_02");	//Если ты серьезно решил наведаться в лагерь паладинов...
	AI_Output(self,other,"DIA_Salentin_Advice_01_04");	//...не ходи туда днем - у тебя не будет ни единого шанса сделать то, что ты задумал.
	AI_Output(self,other,"DIA_Salentin_Advice_01_05");	//Самое лучшее время - это ночь. Лагерь будет спать, - ну, может, кроме пары человек.
	AI_Output(other,self,"DIA_Salentin_Advice_01_07");	//Откуда ты все это знаешь?
	AI_Output(self,other,"DIA_Salentin_Advice_01_08");	//Какая разница, откуда? Просто запомни то, что я тебе сказал.
};