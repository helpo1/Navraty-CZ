
instance DIA_NONE_105_CORRISTO_EXIT(C_Info)
{
	npc = none_105_corristo;
	nr = 999;
	condition = dia_none_105_corristo_exit_condition;
	information = dia_none_105_corristo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_none_105_corristo_exit_condition()
{
	return TRUE;
};

func void dia_none_105_corristo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_HALLO(C_Info)
{
	npc = none_105_corristo;
	nr = 1;
	condition = dia_none_105_corristo_hallo_condition;
	information = dia_none_105_corristo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_105_corristo_hallo_condition()
{
	if((TALKTOCORRISTO == FALSE) && (FIREMAGECOMES == TRUE) && (RESCUEGOMEZSTEPTHREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	TALKTOCORRISTO = TRUE;
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_00");	//(мертвым голосом) Кто звал нас?.. Кто потревожил наш священный покой?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_02");	//Кто ты?
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_01_03");	//Разве ты меня не помнишь?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_04");	//(задумчиво) Да, твое лицо мне кажется знакомым. Но прошло столько времени...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_01_05");	//Не напомнишь ли мне, кем ты был раньше?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Я состоял в страже Старого лагеря.",dia_none_105_corristo_hallo_gomezwatch);
	Info_AddChoice(dia_none_105_corristo_hallo,"Я был наемником в Новом лагере.",dia_none_105_corristo_hallo_naemniklee);
	Info_AddChoice(dia_none_105_corristo_hallo,"Я был стражем в Братстве.",dia_none_105_corristo_hallo_sleeper);
	Info_AddChoice(dia_none_105_corristo_hallo,"Я был магом Воды.",dia_none_105_corristo_hallo_watermage);
	Info_AddChoice(dia_none_105_corristo_hallo,"Я был магом Огня, мастер.",dia_none_105_corristo_hallo_firemage);
};

func void dia_none_105_corristo_hallo_gomezwatch()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_00");	//Я состоял в страже Старого Лагеря.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_01");	//Точно! Ты был человеком Торуса и состоял в гвардии Гомеза.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_02");	//Теперь я тебя вспомнил...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_GomezWatch_01_03");	//Теперь скажи нам, что за дело заставило тебя обратиться к нам? Зачем ты искал с нами встречи?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Мне нужна ваша помощь.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_naemniklee()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_00");	//Я был наемником в Новом лагере.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_01");	//Ах да. Ты был одним из людей генерала Ли...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_02");	//Теперь я тебя вспомнил, наемник...(мертвым голосом)

	if(other.guild == GIL_SLD)
	{
		Snd_Play("LevelUp");
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
		MEMORYBONUS = TRUE;
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_03");	//И, как я вижу, ты до сих пор под его началом.
		AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_04");	//Ты прав.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_05");	//(задумчиво) Что же, подобная преданность своим идеалам достойна уважения!
	};

	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_NaemnikLee_01_06");	//Теперь скажи нам, что за дело заставило тебя обратиться к нам? Зачем ты искал с нами встречи?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Мне нужна ваша помощь.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_sleeper()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_00");	//Я был стражем в Братстве.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_01");	//Ах да - ты был одним из тех, кто поклонялся этому Спящему...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_02");	//Теперь я тебя вспомнил, болотник.
	if((other.guild == GIL_TPL) && (other.guild == GIL_SEK) && (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_03");	//И я также вижу, что ты сохранил верность этому пути.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_04");	//(задумчиво) Что же, подобная преданность своим идеалам достойна уважения!
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_05");	//Даже несмотря на то, что ваш бог оказался всего лишь злым демоном...
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Sleeper_01_08");	//Теперь скажи нам, что за дело заставило тебя обратиться к нам? Зачем ты искал с нами встречи?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Мне нужна ваша помощь.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_watermage()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_00");	//Я был магом Воды.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_01");	//Ах да. Теперь я тебя вспомнил...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_02");	//Кажется, Сатурас посвятил и наставил тебя на путь служения Аданосу...
	if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_04");	//И, как я вижу, ты до сих пор не нарушил этот обет.
		B_GivePlayerXP(250);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_WaterMage_01_07");	//Теперь скажи нам, что за дело заставило тебя обратиться к нам? Зачем ты искал с нами встречи?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Мне нужна ваша помощь.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_firemage()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_FireMage_01_00");	//Я был магом Огня, мастер. А вы были моим наставником.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_01");	//Ах да! Ты же был моим учеником - и как я мог забыть это...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_02");	//Теперь я тебя вспомнил, сын мой.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_03");	//И, как я вижу, ты до сих пор не нарушил обет, данный Огню и Инносу!
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_04");	//Подобная преданность Инносу достойна уважения!
		B_GivePlayerXP(500);
		AI_NoticePrint(3000,4098,NAME_ADDON_MEMORYBONUS);
	}
	else
	{
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_08");	//Но, как я вижу, ты нарушил обет, данный Инносу и Огню.
		AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_09");	//И это меня сильно огорчает...
	};
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_FireMage_01_10");	//Теперь скажи нам, что за дело заставило тебя обратиться к нам? Зачем ты искал с нами встречи?
	Info_ClearChoices(dia_none_105_corristo_hallo);
Info_AddChoice(dia_none_105_corristo_hallo,"Мне нужна ваша помощь.",dia_none_105_corristo_hallo_rescue);
};

func void dia_none_105_corristo_hallo_rescue()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_00");	//Мне нужна помощь.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_01");	//И что же ты хочешь от нас?
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_02");	//Я хочу, чтобы вы даровали свое прощение душе одного человека.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_03");	//Дальше можешь не продолжать...
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_04");	//Почему?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_05");	//Потому что я догадываюсь, о чем ты хочешь всех нас попросить.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_07");	//(мертвый вздох) Только один человек может попросить нас о прощении за свои деяния.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_08");	//Тот, по чьей вине мы сейчас пребываем здесь в качестве призраков, а не живых людей...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_09");	//...тот, кто ради золота и власти осмелился поднять меч на священных служителей Инноса...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_10");	//...и тот, кому нет прощения, и чья душа за свои злодеяния была проклята богами...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_14");	//ТЫ ХОЧЕШЬ, ЧТОБЫ МЫ ДАЛИ ПРОЩЕНИЕ ТОМУ, КТО ЯВИЛСЯ НАШИМ ПАЛАЧОМ?!
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_15");	//Я понимаю, что моя просьба звучит достаточно странно.
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_16");	//Но мне кажется, что любой, кем бы он ни был и что бы он не совершил, заслуживает хотя бы одного шанса искупить свою вину.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_18");	//Ты слишком глуп, чтобы судить об этом, человек! Только Иннос вправе решать, кто и чего достоин.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_19");	//Однако в твоих словах есть доля истины - действительно, каждому дарована возможность искупить свою вину.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_21");	//(задумчиво) Честно говоря, я теряюсь в догадках, чем Гомез может заслужить наше прощение.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_22");	//К тому же его проклятая душа мало на что способна сейчас...
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_23");	//Ну, тогда, возможно, я смогу сделать для вас что-то, после чего вы даруете ему свободу.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_26");	//(мертвым голосом) Ну хорошо. Тогда слушай меня внимательно...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_27");	//На западе долины недалеко от старой башни Ксардаса расположен старый заброшенный склеп.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_28");	//Вход в него надежно сокрыт каменной плитой, и попасть туда просто так не представляется возможным...
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_29");	//А что находится в этом склепе?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_33");	//То, что находится в этом склепе, может носить только одно имя - Зло...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_34");	//Мы точно не знаем, что в этом склепе. Но то, что оно действительно там существует, - в этом нет никаких сомнений!
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_35");	//Поэтому, обдумав твою просьбу, я пришел к выводу, что, если одно зло должно быть нами прощено...
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_36");	//...то другое существующее зло должно быть нами уничтожено!
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_37");	//Как ты понимаешь, сами мы не сможем этого сделать. Поэтому нам понадобится некоторая помощь.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_38");	//Надеюсь, мне не нужно объяснять, что это и есть те мои условия, при которых я дам прощение Гомезу?
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Rescue_01_39");	//Ты хочешь сказать, что я должен буду отправиться в этот склеп и уничтожить зло, что там обитает?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_40");	//Ты догадлив...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Rescue_01_41");	//Сможешь выполнить это поручение - и Гомез будет прощен. Ты согласен?
	Info_ClearChoices(dia_none_105_corristo_hallo);
	Info_AddChoice(dia_none_105_corristo_hallo,"Подожди. Мне надо подумать.",dia_none_105_corristo_hallo_no);
	Info_AddChoice(dia_none_105_corristo_hallo,"Хорошо, я согласен.",dia_none_105_corristo_hallo_yes);
};

func void dia_none_105_corristo_hallo_no()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_No_01_00");	//Мне нужно подумать.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_01");	//Нет...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_05");	//Ты уже сделал свой выбор, обратившись к нам за помощью.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_No_01_06");	//Теперь же пришла пора платить за него...(мертвым голосом)
};

func void dia_none_105_corristo_hallo_yes()
{
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Yes_01_00");	//Хорошо, я согласен.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_01");	//Тогда немедленно отправляйся туда и уничтожь все то зло, которое повстречается на твоем пути.
	AI_Output(other,self,"DIA_NONE_105_Corristo_HALLO_Yes_01_02");	//Но подожди. Ты же сказал, что вход в этот склеп закрыт. Как я попаду туда?
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_03");	//Об этом можешь не беспокоиться. Каменная плита, что преграждает туда путь, больше не будет для тебя преградой.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_04");	//Как только ты достигнешь нужного тебе места, ты сам поймешь это.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_06");	//Ступай! Мы будем ждать тебя здесь.
	AI_Output(self,other,"DIA_NONE_105_Corristo_HALLO_Yes_01_07");	//Да защитит тебя Иннос!
	CORRISTOSENDKILLDEMON = TRUE;
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Мастер Корристо и другие маги Огня согласились даровать прощение Гомезу при условии, что я выполню их поручение. Мне необходимо будет отправиться на запад по направлению к старой башне Ксардаса и там, неподалеку от нее, найти заброшенный склеп. По словам Корристо, в этом склепе обитает некое зло, которое я должен буду уничтожить.");
	AI_StopProcessInfos(self);
};


instance DIA_NONE_105_CORRISTO_DEMONDONE(C_Info)
{
	npc = none_105_corristo;
	nr = 1;
	condition = dia_none_105_corristo_demondone_condition;
	information = dia_none_105_corristo_demondone_info;
	permanent = FALSE;
	description = "Склеп чист!";
};


func int dia_none_105_corristo_demondone_condition()
{
	if((TALKTOCORRISTO == TRUE) && (CORRISTOSENDKILLDEMONDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_none_105_corristo_demondone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_105_Corristo_DemonDone_01_00");	//Склеп чист!
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_01");	//Я уже знаю об этом...(мертвым голосом)
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_06");	//Гомез получит наше прощение.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_01_07");	//И его душа теперь сможет, наконец, обрести долгожданный покой...
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Теперь, когда я побывал в склепе и уничтожил находившееся там зло, маги Огня согласились дать прощение душе Гомеза.");
	Info_ClearChoices(dia_none_105_corristo_demondone);
	Info_AddChoice(dia_none_105_corristo_demondone,"...?",dia_none_105_corristo_demondone_free);
};

func void dia_none_105_corristo_demondone_free()
{
	RESCUEGOMEZSTEPTHREEDONE = TRUE;
	if((RESCUEGOMEZSTEPONEDONE == TRUE) && (RESCUEGOMEZSTEPTWODONE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		GOMEZISFREE = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Теперь мне надо вернуться к Гомезу и сообщить ему о том, что его душа свободна.");
	};
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Npc_ExchangeRoutine(none_105_corristo,"TOT");
	Npc_ExchangeRoutine(none_106_rodriguez,"TOT");
	Npc_ExchangeRoutine(none_107_damarok,"TOT");
	Npc_ExchangeRoutine(none_108_drago,"TOT");
	Npc_ExchangeRoutine(none_109_torrez,"TOT");
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_00");	//Гомез получил наше прощение... Теперь он свободен.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_01");	//Ступай к нему и скажи об этом.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_02");	//А нам пора... Мир живых тяжек для нас.
	AI_Output(self,other,"DIA_NONE_105_Corristo_DemonDone_Free_01_03");	//Прощай, смертный. Да защитит тебя Иннос!
	AI_StopProcessInfos(self);
};

