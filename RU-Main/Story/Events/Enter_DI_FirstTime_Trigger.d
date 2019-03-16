
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 95)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};

		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);

		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Йорген, мой капитан, будет ждать на корабле пока я не вернусь. ");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Торлоф, мой капитан, останется на корабле и будет его защищать, пока я буду на острове. Он поможет мне увеличить силу и ловкость. ");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Джек, мой капитан, будет ждать на корабле пока я не вернусь. Он немного напуган. Но он нужен мне. ");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ли будет командовать на корабле в мое отсутствие. У него я смогу улучшить свои навыки в борьбе с одноручным и двуручным оружием.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"У Милтена я смогу увеличить свою магическую энергию.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Милтен может научить меня создавать руны.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"У меня такое впечатление, что состояние Лестера еще больше ухудшилось на этом странном острове.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Марио немного странен. Он сидел весь путь в хвостовой части корабля и не сказал с тех пор еще ни слова. ");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Вольф сможет научить меня стрелять из лука и арбалета. ");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ватрас удалился в каюту магов. У него я смогу вылечиться, а также научиться приготовлению разных напитков. ");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Ватрас также сможет увеличить мой Круг магии. ");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Беннет обучит меня ковке, если я это захочу.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Диего научит меня, если я чего-то еще не знаю, также у него есть снаряжение. У него я смогу научиться взламывать замки и увеличить свои навыки обращения с луком и арбалетом. ");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Горн так и не спал за время нашего плавания. Он будет присматривать за кораблем. Я думаю, что теперь корабль в хороших руках.");
			Log_AddEntry(TOPIC_MyCrew,"У Горна я смогу научиться сражаться с двуручным оружием. ");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ларес пообещал, что научит меня подкрадываться и борьбе с одноручным оружием. Кроме того, он сможет увеличить мою ловкость. ");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Бифф так помешан на деньгах, что его уже ничто не остановит. Мне будет трудно удержать его в узде.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Ангар выглядит очень неспокойно. У меня такое ощущение, что он скоро пойдет сражаться в одиночку.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Гирион как всегда спокоен, его терпение достойно удивления. Все-таки он боевой преподаватель. Но это мне только на пользу.");
		};

		EnterDI_Kapitel6 = TRUE;
		IntroduceCH_06 = TRUE;
	};
};

