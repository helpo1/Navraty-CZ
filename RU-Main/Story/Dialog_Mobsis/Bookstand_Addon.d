var int AshtarBookBonus_01;
var int AshtarBookBonus_02;
var int AshtarBookBonus_03;

var int AshtarBook_01;
var int AshtarBook_02;
var int AshtarBook_03;

func void Use_Bookstand_Addon_BL_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Шахта");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Кримсон: 79 слитков золота получил и расплавил");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Скатти: получил товаров на 250 золота");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Гарац: получил 6 слитков");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Все охранники: получили 9 слитков");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"Лагерь:");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Гвардия Ворона: 25 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Финн: 60 золотых");
		Doc_PrintLines(nDocID,1,"Леннар: 40 золотых");
		Doc_PrintLines(nDocID,1,"Эмилио: 50 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Другие: 20 золотых");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Хуно, Фиск, Снаф: по цене товаров");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Охотники: Должен предводитель позаботиться! Франко получил 7 слитков.");
		Doc_Show(nDocID);
	};
};

func void use_bookstandfirecavetest_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Ты, кто осмелился бросить вызов Огню - знай, что тебя ждет впереди трудное испытание.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"И только тот, кто сможет одолеть Истинного Духа Огня - пройдет его!");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(READFIRECAVE == FALSE)
		{
			B_GivePlayerXP(100);
			READFIRECAVE = TRUE;
			B_LogEntry(TOPIC_KELIOSTEST,"Судя по всему, чтобы пройти свое испытание - я должен буду отыскать истинного Духа Огня и одолеть его!");
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_108 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_108 = TRUE;
		};
	};
};

func void USE_BOOKIMARAH_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Тот, кто ищет знания, всегда их находит. Другой вопрос, какова цена этих знаний...");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Теперь, я только задаюсь одним вопросом - какова же будет моя цена?");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);

		if(READIMARAH == FALSE)
		{
			B_GivePlayerXP(200);
			READIMARAH = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_157 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_157 = TRUE;
		};
	};
};

var int BookstandMayaHierchary_1_permanent;
var int BookstandMayaHierchary_2_permanent;
var int BookstandMayaHierchary_3_permanent;
var int BookstandMayaHierchary_4_permanent;
var int BookstandMayaHierchary_5_permanent;
var int BookstandMayaArt;

func int C_CanReadBookStand()
{
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		return TRUE;
	};

	return FALSE;
};

func void Use_BookstandMaya()
{
	if(BookstandMayaArt == 1)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"... Потому что только ХРАНИТЕЛИ ДУХОВ могли вызывать мертвых");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"... Боль от их отсутствия сидит глубоко. Без совета предков мы предоставлены произволу нашего народа.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"ЦЕЛИТЕЛИ были посланы, чтобы закрыть портал и уничтожить ключ. Только Аданос знает, что с ними случилось и достигли ли они своей цели.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"ВОИНЫ уничтожены гневом Аданоса. Сердце старого воителя разбито.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Только оставшиеся ЖРЕЦЫ не теряют надежды и молятся непрестанно о восстановлении нашего когда-то столь великолепного города.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Но мы, УЧЕНЫЕ, знаем горькую правду. ЯРКЕНДАР пал и его засыплет песок времени.");
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_109 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_109 = TRUE;
		};
	}
	else if(BookstandMayaArt == 2)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"РАДЕМЕС был навсегда заключен в храм, но мощь меча не была сломлена.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Его влияние стало уже слишком большим. Убийство на улицах не могло прекратиться.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Гнев АДАНОСА покончил со всем. Море поднялось над ЯРКЕНДАРОМ и поглотило его.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Только высоко расположенные храмы и строения остались почти неповрежденными.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Те немногие, которые пережили катастрофу, не имели больше сил, чтобы снова отстроить город.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Так свершилась судьба ЯРКЕНДАРА.");
		if(SC_Knows_WeaponInAdanosTempel == FALSE)
		{
			SC_Knows_WeaponInAdanosTempel = TRUE;
		};
		if((BookBonus_110 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_110 = TRUE;
		};
	}
	else if(BookstandMayaArt == 3)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Возраст Куарходрона сделал для него невозможным вести войска. И тогда ЖРЕЦЫ настояли на своем праве отдавать ему приказы.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Они указали ему, оставить свой пост и передать меч своему преемнику.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Совет Пяти должен был определить его преемника. Но каста ВОИНОВ отказала Совету в его выборе.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Воины не хотели больше подчиняться Совету и выбрали его сына РАДЕМЕСА предводителем.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Гордость и вера Куарходрона в свою плоть и кровь убедили его подчиниться.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Он передал меч своему сыну в надежде, что тот будет его вести такой же сильной рукой, как и он когда-то.");

		if((BookBonus_111 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_111 = TRUE;
		};
	}
	else if(BookstandMayaArt == 4)
	{
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"РАДЕМЕС был слаб. Воля меча покорила его и сделала его своим инструментом.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Горе и страдания, которые он в своем ослеплении нанес народу, не смогли бы вылечить даже целители.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Меч быстро разобрался, что народ слишком слаб, чтобы пресечь его планы.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Только власть наших предков могла быть для него опасной.");
		Doc_PrintLine(StPl_nDocID,0,"");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"И он приказал РАДЕМЕСУ изгнать или уничтожить всех Хранителей Духов, и так погибла надежда на наше избавление от этой напасти.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"И так не осталось ни единого Хранителя Духов к тому моменту, как четыре лишенных власти предводителя нашего народа пришли к горькому решению сдать ЯРКЕНДАР.");
		Doc_PrintLine(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Война гремела на улицах, и целители собрались в путь, чтобы навсегда закрыть доступ в нашу долину.");

		if((BookBonus_112 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_112 = TRUE;
		};
	}
	else if(BookstandMayaArt == 5)
	{
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"КУАРХОДРОН, верховный жрец ХАРДИМОН и Я собрались в этих стенах на совет, как победить РАДЕМЕСА и меч.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"КУАРХОДРОН и ХАРДИМОН хотели победить РАДЕМЕСА объединенными силами в открытом бою. Но я слишком хорошо знал силу меча, чтобы в это поверить.");
		Doc_PrintLines(StPl_nDocID,0,"");
		Doc_PrintLines(StPl_nDocID,0,"Поэтому я воспользовался моим правом, наложить вето на их решение. Вместо этого я решил побороть РАДЕМЕСа коварством.");
		Doc_SetMargins(StPl_nDocID,-1,30,20,275,20,1);
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"КУАРХОДРОН последовал решению совета. Он отправился в храм Аданоса и послал за своим сыном.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Ненависть его сына приняла такие размеры, что РАДЕМЕС диким штурмом взял храм, чтобы разобраться с отцом.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"Он понял наши планы только тогда, когда было слишком поздно.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"КУАРХОДРОН закрыл святые камеры храма за собой и РАДЕМЕС был заключен навсегда.");
		Doc_PrintLines(StPl_nDocID,1,"");
		Doc_PrintLines(StPl_nDocID,1,"");

		if((BookBonus_113 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_113 = TRUE;
		};
	};
};

func void InitUse_BookstandMaya()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Doc_Show(StPl_nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else if(C_CanReadBookStand())
		{
			StPl_nDocID = Doc_Create();
			Doc_SetPages(StPl_nDocID,2);
			Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(StPl_nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(StPl_nDocID,0,275,20,30,20,1);
			Use_BookstandMaya();
			Doc_Show(StPl_nDocID);
		};
	};
	BookstandMayaArt = 0;
};

func void Use_BookstandMayaHierchary_01_S1()
{
	var int rnd;
	BookstandMayaArt = 1;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_1_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_1_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);

		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
};

func void Use_BookstandMayaHierchary_02_S1()
{
	var int rnd;
	BookstandMayaArt = 2;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_2_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_2_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
};

func void Use_BookstandMayaHierchary_03_S1()
{
	var int rnd;
	BookstandMayaArt = 3;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_3_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_3_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
};

func void Use_BookstandMayaHierchary_04_S1()
{
	var int rnd;
	BookstandMayaArt = 4;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_4_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_4_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
};

func void Use_BookstandMayaHierchary_05_S1()
{
	var int rnd;
	BookstandMayaArt = 5;
	InitUse_BookstandMaya();

	if((BookstandMayaHierchary_5_permanent == FALSE) && C_CanReadBookStand())
	{
		B_GivePlayerXP(XP_Ambient);
		BookstandMayaHierchary_5_permanent = TRUE;
		B_Say(self,self,"$SVM_15_ABOUTANCIENT");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	}
	else
	{
		rnd = Hlp_Random(100);
		if(rnd <= 30)
		{
			B_Say(self,self,"$NOTHINGNEW");
		}
		else if(rnd <= 60)
		{
			B_Say(self,self,"$NOTHINGNEW02");
		}
		else if(rnd <= 99)
		{
			B_Say(self,self,"$NOTHINGNEW03");
		};
	};
};

func void Use_BookstandAshtar_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_01 == FALSE)
			{
				AshtarBook_01 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};
			}
			else
			{
				rnd = Hlp_Random(100);

				if(rnd <= 30)
				{
					B_Say(self,self,"$NOTHINGNEW");
				}
				else if(rnd <= 60)
				{
					B_Say(self,self,"$NOTHINGNEW02");
				}
				else if(rnd <= 99)
				{
					B_Say(self,self,"$NOTHINGNEW03");
				};
			};
			if((AshtarBookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				AshtarBookBonus_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"...и сказал, Аданос - живите и плодитесь, дети мои! Все блага этого мира дарую я вам, а с ними божественную силу моей стихии.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...и открылась тайна магии Аданоса человеку, дабы он мог управлять ей и стоять на страже равновесия в этом мире.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_02 == FALSE)
			{
				AshtarBook_02 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};
			}
			else
			{
				rnd = Hlp_Random(100);

				if(rnd <= 30)
				{
					B_Say(self,self,"$NOTHINGNEW");
				}
				else if(rnd <= 60)
				{
					B_Say(self,self,"$NOTHINGNEW02");
				}
				else if(rnd <= 99)
				{
					B_Say(self,self,"$NOTHINGNEW03");
				};
			};
			if((AshtarBookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				AshtarBookBonus_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"...и был тот, кто выделялся силой своей и отвагой, среди прочих. И сделал его Аданос своим изранником, дабы тот мог разить врагов его.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...и стал он великим воином и прославляли его многие века по деяниям его во славу Аданоса.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandAshtar_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if(AshtarBook_03 == FALSE)
			{
				AshtarBook_03 = TRUE;
				B_GivePlayerXP(100);
				B_Say(self,self,"$HOWINTEREST");

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};
			}
			else
			{
				rnd = Hlp_Random(100);

				if(rnd <= 30)
				{
					B_Say(self,self,"$NOTHINGNEW");
				}
				else if(rnd <= 60)
				{
					B_Say(self,self,"$NOTHINGNEW02");
				}
				else if(rnd <= 99)
				{
					B_Say(self,self,"$NOTHINGNEW03");
				};
			};
			if((AshtarBookBonus_03 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				AshtarBookBonus_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"...и был он тени схож и никто не мог найти его, если тот сам бы этого не захотел. И появлялся только тогда, когда сам Аданос воззывал к нему.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...и подносил он дары на алтарь Аданоса, добытые на охоте, дабы не оскудела паства. Аданос принимал дары и одаривал дарующего своей благодатью.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func int CHELDRAKBOOK_COND()
{
	if((StartLvStory == TRUE) && (OpenHramDone == FALSE))
	{
		return TRUE;
	};
	
	return FALSE;
};

func void Use_BookstandChelDrak_01_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_01 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				LV_Story_01 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Зайти в сей храм достойный сможет, ему подсказкой стих здесЬ сложен, бежать не нужно, не спеши, ищи намеки для души.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Лишь так поймешь лишь так постигнешь, единый спрятанный проход, когда мою решишь загадку, сокровище найдешь - вперед.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_02_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_02 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Первая надпись гласит - ...'Между светом и теплом, между местью и добром, третий брат водою правит, всяк его за это славит.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Вторая надпись гласит - ...'Белой стужи здесь граница, свет поставил ей черту, путь пройдут, не морща лица, те, в ком жизни на версту.'...");
				LV_Story_02 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Между светом и теплом, между местью и добром, третий брат водою правит, всяк его за это славит.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Белой стужи здесь граница, свет поставил ей черту, путь пройдут, не морща лица, те, в ком жизни на версту.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_03_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_03 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Третья надпись гласит - ...'Между жаром и полночью, третий путь запрятан прочно, чтоб через него пройти, разыщи ключи в ночи.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Четвертая надпись гласит - ...'Где солнце в небо рвется, нет места страшной тени, иди смелей, не бойся, там преклонить колени.'...");
				LV_Story_03 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Между жаром и полночью, третий путь запрятан прочно, чтоб через него пройти, разыщи ключи в ночи.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Где солнце в небо рвется, нет места страшной тени, иди смелей, не бойся, там преклонить колени.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_04_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_04 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Пятая надпись гласит - ...'Где снег укрыл поля и горы, где все белым-бело у моря, где хлад сковал сердца людей, веками бьет скалу злодей.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Шестая надпись гласит - ...'Сей день уходит на покой, но он, не ты - вперед, герой, где солнце прячется в ночи, ищи, ищи, ищи ключи.'...");
				LV_Story_04 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Где снег укрыл поля и горы, где все белым-бело у моря, где хлад сковал сердца людей, веками бьет скалу злодей.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Сей день уходит на покой, но он, не ты - вперед, герой, где солнце прячется в ночи, ищи, ищи, ищи ключи.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_05_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_05 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				B_LogEntry(TOPIC_Miss_Brother,"Седьмая надпись гласит - ...'Тьма стремится в холода, черный снег летит над миром, восстают нежизни силы, но тебе идти туда.'...");
				B_LogEntry_Quiet(TOPIC_Miss_Brother,"Возьмая надпись гласит - ...'Где жар пылает, будь готов, сразиться с огненным врагом, воды запас неси с собой, и стойким к жару стань, герой.'...");
				LV_Story_05 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Тьма стремится в холода, черный снег летит над миром, восстают нежизни силы, но тебе идти туда.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Где жар пылает, будь готов, сразиться с огненным врагом, воды запас неси с собой, и стойким к жару стань, герой.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void Use_BookstandChelDrak_06_S1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(C_CanReadBookStand() == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			if((MIS_Miss_Brother == LOG_Running) && (StartLvStory == TRUE) && (LV_Story_06 == FALSE))
			{
				if(StartLvStoryFR == FALSE)
				{
					B_LogEntry_Quiet(TOPIC_Miss_Brother,"В древних аналоях, окружавшие вход в храм, я обнаружил странные записи. Возможно они как-то помогут мне понять правильную последовательность.");
					StartLvStoryFR = TRUE;
				};

				LV_Story_06 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"И пусть не найден был ответ, тот путь тут тебе укажет свет. Свет смерти, ныне – мертвый свет, а с ним и жреческий завет.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Взгляни сюда, узнай ответ. Таков тебе мой друг совет. И дверь откроет в этот раз, язык, что был когда-то наш.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};