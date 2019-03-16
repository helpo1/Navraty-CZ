
instance DIA_PAL_9158_VARUS_EXIT(C_Info)
{
	npc = pal_9158_varus;
	nr = 999;
	condition = dia_pal_9158_varus_exit_condition;
	information = dia_pal_9158_varus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9158_varus_exit_condition()
{
	return TRUE;
};

func void dia_pal_9158_varus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9158_VARUS_HALLO(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_hallo_condition;
	information = dia_pal_9158_varus_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9158_varus_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hallo_info()
{
	B_GivePlayerXP(100);
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_00");	//Эй, парень! Мне кажется, ты не из моего отряда!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_02");	//Приветствую тебя, маг Огня!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_03");	//Позволь узнать, что нужно от меня слуге Инноса?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_04");	//Приветствую тебя, маг Воды!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_05");	//Позволь узнать, что нужно от меня слуге Аданоса?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_06");	//Глазам своим не верю - некромант в форте паладинов!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_07");	//Кто пустил тебя сюда? Что тебе тут нужно?
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_08");	//Быть того не может! (удивленно) Подумать только - наемник в форте паладинов!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_09");	//Кто пустил тебя сюда? Что тебе тут нужно?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_10");	//Эй, ты кто такой?
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_11");	//Кто пустил тебя сюда? (грозно) Что тебе тут нужно?
	};

	VarusMeet = TRUE;
};


instance DIA_PAL_9158_VARUS_FORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_fort_condition;
	information = dia_pal_9158_varus_fort_info;
	permanent = FALSE;
	description = "Это и есть форт паладинов?";
};


func int dia_pal_9158_varus_fort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_hallo))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_fort_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Fort_01_01");	//Это и есть форт паладинов?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_02");	//Он самый...(ворчливо) Или, по-твоему, это место похоже на что-то другое?!
	AI_Output(other,self,"DIA_Pal_9158_Varus_Fort_01_03");	//Я просто спросил.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_04");	//(раздраженно) Хватит доставать меня глупыми вопросами!
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_07");	//Так что либо говори по делу, либо проваливай.
};


instance DIA_PAL_9158_VARUS_MATTER(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matter_condition;
	information = dia_pal_9158_varus_matter_info;
	permanent = FALSE;
	description = "Я здесь по поручению лорда Хагена.";
};


func int dia_pal_9158_varus_matter_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matter_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_00");	//Я здесь по поручению лорда Хагена.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_01");	//Тебя прислал сам лорд Хаген? Хммм...(задумчиво) Очень интересно!
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_02");	//И в чем оно заключается?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_03");	//В данный момент Хаген занят вопросом о налаживании поставок продовольствия для паладинов.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_04");	//Поэтому он хочет, чтобы ты подготовил для него список необходимой тебе провизии.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_06");	//Ну наконец-то! Как это вовремя. (ехидно) А я уж думал, что про нас тут просто забыли!
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_07");	//Даже сам хотел послать к нему человека, но теперь вижу - что в этом нет особой необходимости.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_08");	//А что со списком?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_09");	//Не беспокойся, я немедленно приступлю к его составлению.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_10");	//Правда, это займет немного времени...(задумчиво)
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_14");	//Думаю, через пару дней - но не раньше!
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_15");	//Так что пока осмотрись тут, познакомься с моими парнями - в общем, займись чем-нибудь полезным.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_16");	//Хорошо, так и сделаю.
	VARUSTIMER = Wld_GetDay();
	B_LogEntry(TOPIC_PALADINFOOD,"Лорд Варус составит для Хагена список с перечнем необходимого для его людей провианта, однако это займет не менее двух дней.");
};


instance DIA_PAL_9158_VARUS_MATTERDONE(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matterdone_condition;
	information = dia_pal_9158_varus_matterdone_info;
	permanent = TRUE;
	description = "Насчет списка...";
};


func int dia_pal_9158_varus_matterdone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_pal_9158_varus_matter) && (VARUSSENTTOHAGEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matterdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_00");	//Насчет списка...
	if(VARUSTIMER <= (daynow - 2))
	{
		B_GivePlayerXP(250);
		VARUSSENTTOHAGEN = TRUE;
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_01");	//Да, ты как раз вовремя - он уже готов.
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_02");	//Вот - возьми его и отнеси лорду Хагену.
		B_GiveInvItems(self,other,itwr_varuscontent,1);
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_03");	//Отлично!
		B_LogEntry(TOPIC_PALADINFOOD,"Лорд Варус подготовил нужный мне список. Теперь я должен отнести его лорду Хагену.");
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_04");	//Я же сказал тебе, что он будет готов не раньше, чем через пару дней.
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_05");	//Так что заходи позже.
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_06");	//Хорошо.
	};
};


instance DIA_PAL_9158_VARUS_PALCOUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palcount_condition;
	information = dia_pal_9158_varus_palcount_info;
	permanent = FALSE;
	description = "Сколько паладинов в форте?";
};


func int dia_pal_9158_varus_palcount_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palcount_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_01");	//Сколько паладинов в форте?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_02");	//Мой отряд насчитывает около пятидесяти бойцов. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_03");	//Мне кажется, что пятьдесят бойцов не смогут сдержать орков, если те начнут прорываться в Хоринис.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_04");	//Ха! Ты недооцениваешь моих парней, сынок...(смеется) Это лучшие солдаты королевства!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_05");	//Каждый из них способен запросто уложить двоих, а то троих орков.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_06");	//И это не просто пустые слова - это действительно так!
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_07");	//А что насчет элитных орков?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_08");	//Хммм...(задумчиво) Ты прав! Элитные орки действительно серьезные противники.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_09");	//Однако единственное их преимущество перед нами - это их количество и ничего более!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_10");	//А само численное превосходство еще не гарантирует им победу.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_11");	//Что же касается тактики и стратегии - то в этом оркам никогда не превзойти нас.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_12");	//Поверь, я побывал на многих войнах и могу утверждать это без всякой тени сомнения.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_13");	//Так что мы и с ними как-нибудь разберемся!
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_14");	//Хочется в это верить.
};


instance DIA_PAL_9158_VARUS_PALMORALE(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palmorale_condition;
	information = dia_pal_9158_varus_palmorale_info;
	permanent = FALSE;
	description = "Какой настрой у твоих людей?";
};


func int dia_pal_9158_varus_palmorale_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palmorale_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_01");	//Какой настрой у твоих людей?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_02");	//Не беспокойся, с этим все в порядке!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_03");	//Каждый из них готов броситься в бой по первому зову, если в этом будет необходимость.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_04");	//Поверь, этим людям не привыкать смотреть смерти в лицо!
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_05");	//Я не сомневаюсь в их смелости - я лишь сомневаюсь в их боевом духе.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_06");	//Вздор! (гневно) Паладин никогда не потеряет боевого духа, даже если окажется в самой отчаянной ситуации!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_07");	//Ведь с нами благословление Инноса, а это не пустой звук!
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_08");	//Ты ведь паладин! (удивленно) Ты тоже должен знать об этом!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_09");	//(ехидно) Не так ли, достопочтенный маг Огня?
		AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_10");	//Именно так.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_11");	//Но ты не паладин...(разочарованно) Тебе этого не понять!
	};
};


instance DIA_PAL_9158_VARUS_PALTIMEFORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 2;
	condition = dia_pal_9158_varus_paltimefort_condition;
	information = dia_pal_9158_varus_paltimefort_info;
	permanent = FALSE;
	description = "Как долго вы еще будете находиться в форте?";
};


func int dia_pal_9158_varus_paltimefort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_paltimefort_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalTimeFort_01_01");	//Как долго вы еще будете находиться в форте?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_02");	//Мы будем оставаться здесь столько времени, сколько потребуется.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_03");	//К тому же это решать не мне, а лорду Хагену.
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalTimeFort_01_04");	//А что ты сам думаешь по этому поводу?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_05");	//Хммм...(задумчиво) Мне кажется, этот форт - отличная стратегическая точка на случай вторжения орков.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_06");	//Только сумасшедший пойдет на штурм этой крепости, а для нас это отличный плацдарм для наступления.
};


instance DIA_PAL_9158_VARUS_PALNEWS(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_palnews_condition;
	information = dia_pal_9158_varus_palnews_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_pal_9158_varus_palnews_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_paltimefort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palnews_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalNews_01_01");	//Есть новости?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalNews_01_02");	//Ничего такого, чтобы тебе следовало знать.
};


instance DIA_PAL_9158_VARUS_HUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_hunt_condition;
	information = dia_pal_9158_varus_hunt_info;
	permanent = FALSE;
	description = "Тут одно дело...";
};


func int dia_pal_9158_varus_hunt_condition()
{
	if((MIS_ORTOHUNT == LOG_Running) && (VARUSAGREEDHUNT == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hunt_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_01");	//Тут одно дело...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_02");	//(ворчливо) Что еще?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_03");	//Несколько паладинов просят твоего разрешения, чтобы отправиться на охоту вглубь острова.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_04");	//Но зачем это им?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_05");	//Просто они сидят без дела и не знают чем заняться.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_06");	//Хммм...(задумчиво) Не думал, что это действительно так.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_07");	//Они просто умирают от скуки!
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_08");	//Ты должен знать, что спокойная жизнь не для паладинов.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_09");	//Хммм...(задумчиво) Ну да, здесь ты абсолютно прав.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_10");	//Так ты дашь им это разрешение?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_11");	//Вообще-то это не положено, но...(задумчиво)
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_12");	//Хорошо! Думаю, в данном случае парни действительно засиделись на месте, и им не помешает немного развеяться.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_13");	//Я одобряю их идею.
	B_LogEntry(TOPIC_ORTOHUNT,"Лорд Варус разрешил паладинам Орто отправиться на охоту.");
	VARUSAGREEDHUNT = TRUE;
};


instance DIA_PAL_9158_VARUS_HELPRAYNE(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_helprayne_condition;
	information = dia_pal_9158_varus_helprayne_info;
	permanent = FALSE;
	description = "Паладину Рэйну нужна помощь.";
};

func int dia_pal_9158_varus_helprayne_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (MAYTALKVARUSRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_helprayne_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_00");	//Паладину Рэйну нужна помощь.
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_01");	//(ворчливо) Что еще такое?  Какая помощь?
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_02");	//Он один просто не справляется с работой на складе.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_03");	//Ты можешь послать к нему кого-нибудь?
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_04");	//У меня нет для этого лишних людей!
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_05");	//Тем более именно ему поручено заниматься нашими запасами - так что никто другой не обязан помогать ему выполнять его же обязанности.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_06");	//Ладно, как скажешь.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_07");	//К тому же, если вдруг со склада что-нибудь пропадет, - ты сам потом найдешь ему замену!
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_12");	//Хммм...(задумчиво) Ну... ну, хорошо!
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_13");	//Я приставлю к нему кого-нибудь в помощники. Но передай ему - что если вдруг...
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_15");	//Для него же лучше...(ворчливо)
	B_LogEntry(TOPIC_RAYNEHELP,"Лорд Варус согласился предоставить Рэйну человека, который бы помогал ему на складе. Теперь думаю, надо сообщить об этом самому Рэйну.");
	FINDHELPERRAYNE = TRUE;
};

instance DIA_Pal_9158_Varus_MissKey(C_Info)
{
	npc = pal_9158_varus;
	nr = 4;
	condition = DIA_Pal_9158_Varus_MissKey_condition;
	information = DIA_Pal_9158_Varus_MissKey_info;
	permanent = FALSE;
	description = "Ключ от склада, он у тебя?";
};

func int DIA_Pal_9158_Varus_MissKey_condition()
{
	if((KNOWSVARUSKEY == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_00");	//Ключ от склада - он у тебя?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_01");	//(недовольно) Был - до последнего времени!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_02");	//Но теперь у меня его нет, и это большая проблема.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_03");	//Ты его потерял?!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_04");	//Потерял или украли - какая разница? Главное, что его нет.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_05");	//И мы не можем попасть внутрь склада.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_06");	//Так сделайте новый ключ!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_07");	//Это не так просто. (ворчливо) Замок у двери слишком сложный!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_08");	//А просто сломать дверь мы не можем.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_09");	//И, естественно, у вас нет того, кто разбирался бы во взломе замков?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_10");	//Какой ты догадливый...(грозно) Мы же паладины! А не воры...
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_11");	//А тут без мастера-взломщика явно не обойтись.
	MIS_FingersOpenDoor = LOG_Running;
	Log_CreateTopic(Topic_FingersOpenDoor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Running);
	B_LogEntry(TOPIC_FingersOpenDoor,"Лорд Варус потерял ключ от склада в форте паладинов. Теперь, чтобы открыть дверь, нужен настоящий мастер-взломщик!");
};

instance DIA_Pal_9158_Varus_MissKey_Ok(C_Info)
{
	npc = pal_9158_varus;
	nr = 5;
	condition = DIA_Pal_9158_Varus_MissKey_Ok_condition;
	information = DIA_Pal_9158_Varus_MissKey_Ok_info;
	permanent = FALSE;
	description = "Я нашел вам того, кто справиться с замком.";
};

func int DIA_Pal_9158_Varus_MissKey_Ok_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Ok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_00");	//Я нашел вам того, кто справится с замком.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_01");	//Правда?! (удивленно) И кто же он?
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_02");	//Бывший каторжник из Долины Рудников. Он тут недалеко, отдыхает на пляже.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_03");	//И он поможет вам, но только при условии, что ты дашь слово не трогать его.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_04");	//Хммм...(грозно) Я так и думал, что это будет кто-то из числа этих негодяев.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_05");	//Но... Но мне нужен этот чертов склад!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_06");	//Поэтому можешь передать ему, что я согласен на его условия.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_07");	//Он может прийти сюда. Мои люди его не тронут! Клянусь Инносом...
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_08");	//Но если он только попробует здесь что-то украсть, я немедленно прикажу вздернуть его на виселице!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_09");	//(грозно) Это понятно?!
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_10");	//Само собой.
	VarusFingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor,"Лорд Варус согласился на условие Фингерса и дал слово не трогать его.");
};


instance DIA_Pal_9158_Varus_MissKey_Finish(C_Info)
{
	npc = pal_9158_varus;
	nr = 6;
	condition = DIA_Pal_9158_Varus_MissKey_Finish_condition;
	information = DIA_Pal_9158_Varus_MissKey_Finish_info;
	permanent = FALSE;
	description = "Ну как дела с замком?";
};

func int DIA_Pal_9158_Varus_MissKey_Finish_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersInFort == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Finish_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Finish_01_00");	//Как дела с замком?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_01");	//(одобрительно) Твой друг оказался весьма полезным человеком. 
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_02");	//Первый раз вижу такого искусного взломщика!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_03");	//Полагаю, что и в дальнейшем он нам может пригодиться.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_04");	//Что касается тебя, то ты заслужил небольшую награду в качестве поощрения за свою помощь.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_05");	//Вот, возьми это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_07");	//(надменно) Но большего не проси. 
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Finish_01_08");	//И на том спасибо.
	MIS_FingersOpenDoor = LOG_Success;
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Success);
	B_LogEntry(TOPIC_FingersOpenDoor,"Лорд Варус был доволен тем, что паладины вновь имеют доступ к складу.");
};

instance DIA_PAL_9158_VARUS_PICKPOCKET(C_Info)
{
	npc = pal_9158_varus;
	nr = 800;
	condition = dia_pal_9158_varus_pickpocket_condition;
	information = dia_pal_9158_varus_pickpocket_info;
	permanent = TRUE;
	description = "(Попробовать украсть его ключ)";
};

func int dia_pal_9158_varus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (KNOWSVARUSKEY == TRUE) && (FingersTellKey == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,Dialog_Back,dia_pal_9158_varus_pickpocket_back);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,DIALOG_PICKPOCKET,dia_pal_9158_varus_pickpocket_doit);
};

func void dia_pal_9158_varus_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 175)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,itke_varuskey,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		HavePalSkladMeKey = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	}
	else
	{
		Print("Необходимая ловкость: 175");

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

func void dia_pal_9158_varus_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
};