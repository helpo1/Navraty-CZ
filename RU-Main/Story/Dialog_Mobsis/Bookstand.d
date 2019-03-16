func void Use_Bookstand_Pyrokar_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(BookBonus_155 == FALSE)
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			BookBonus_155 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Святой долг");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Маг не похож на обычных людей. Он обладает способностью влиять на божественную силу, а посему и неподвластен законам природы, которым подчиняется каждый смертный.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Когда маг достигает того уровня, позволяющего ему подняться над рамками обычного существования, он может войти в другой мир, неведомый простым смертным. Маг может прорваться через границы времени и пространства, и даже смерть, основа всего сущего, не сумеет остановить его.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_01_S1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if((hero.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FireContest,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FireContest,LOG_Running);
			B_LogEntry(TOPIC_FireContest,"Как послушник, я имею право на испытание огня. При этом, каждый из трех магов высшего совета даст мне одно испытание. Если я выдержу три испытания, я буду принят в Круг огня.");
			RankPoints = RankPoints + 1;
		};
		if(BookBonus_83 == FALSE)
		{
			if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
			};
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			BookBonus_83 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Испытание огня");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Перед тем, как стать магом послушник обязан пройти испытание, которое называется ИСПЫТАНИЕ ОГНЯ. Это очень сложное и опасное испытание, которое не каждый может осилить. Если он основательно обдумал решение пройти испытание и настаивает на нем, то он может требовать испытание, и ни один маг не имеет права отказать ему. Если он настаивает перед верховным советом, то ему гарантируется ИСПЫТАНИЕ ОГНЯ.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"В этом испытании послушнику требуются весь его ум, сила и мастерство. Он должен пройти три испытания, каждое из которых устанавливается магом верховного совета, прежде чем он произнесет клятву огню и войдет в Круг огня. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Такова воля Инноса и так тому и быть. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Верховный совет");
		Doc_Show(nDocID);
	};
};

func void Use_Bookstand_Andre_S1()
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
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"- Журнал -");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"...исполняй свой долг, не думая об исходе! Исполняй свой долг, принесет ли тебе это счастье или несчастье...");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");

		if(Rengaru_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"...заключенный Ренгару обвиняется в воровстве.");
		};
		if(Halvor_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"...заключенный Халвор обвиняется в воровстве.");
		};
		if(Nagur_Ausgeliefert == TRUE)
		{
			Doc_PrintLines(nDocID,1,"...заключенный Нагур обвиняется в убийстве.");
		};
		if((CANTHAR_AUSGELIEFERT2 == TRUE) || ((KnowCantarFree == FALSE) && (Canthar_Ausgeliefert == TRUE))) 
		{
			Doc_PrintLines(nDocID,1,"...заключенный Кантар обвиняется в подлоге.");
		};
		if((Sarah_Ausgeliefert == TRUE) && (SARAISFREE == FALSE))
		{
			Doc_PrintLines(nDocID,1,"...заключенная Сара обвиняется в предательстве.");
		};
		if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
		{
			Doc_PrintLines(nDocID,1,"...заключенный Беннет обвиняется в убийстве.");
		};
		if((HANNAISKNAST == TRUE) && (HANNAISFREE == FALSE))
		{
			Doc_PrintLines(nDocID,1,"...заключенная Ханна обвиняется в воровстве.");
		};
		if((GASPARPISSOFF == TRUE) && (HANNAISFREE == TRUE))
		{
			Doc_PrintLines(nDocID,1,"...заключенный Гаспар обвиняется в воровстве.");
		};

		Doc_Show(nDocID);
	};
};

var int FinalDragonEquipment_Once;
var int GiveInnosTearPal;

func void Use_FINALDRAGONEQUIPMENT_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) && (ItWr_HallsofIrdorathIsOpen == TRUE))
	{
		if(FinalDragonEquipment_Once == FALSE)
		{
			B_GivePlayerXP(XP_FinalDragonEquipment);
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
			{
				Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_PALFINALARMOR");
				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			}
			else
			{
				if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
				{
					Wld_InsertItem(ItPo_Perm_STR,"FP_ITEM_PALFINALARMOR");
				}
				else
				{
					Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_PALFINALARMOR");
				};

				Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_PALFINALSTUFF");
			};

			FinalDragonEquipment_Once = TRUE;
			Wld_SendTrigger("EVT_DOOR_PALSECRETCHAMBER");
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
		if((BookBonus_84 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_84 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"...я надеюсь, что магический барьер надежно защитит руду от захвата орками! Король почти готов поверить в то, что мы сооружаем его только для защиты от побегов заключенных. Нет, с помощью этого мы достигаем более важной цели. Я надеюсь, что у нас останется достаточно времени, чтобы подготовиться к главному сражению.");
		Doc_PrintLines(nDocID,0,"");

		if((hero.guild == GIL_KDF) && (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == FALSE))
		{
			PlayerGetsAmulettOfDeath = TRUE;
			PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] = TRUE;
			PLAYER_TALENT_RUNES_MOF = TRUE;
			B_LogEntry(TOPIC_TalentRunes,"Ингредиенты для руны 'Взор Инноса': 'Слезы Инноса', святая вода и рунический камень");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...я обрызнул, согласно указаниям, рунический камень 'Слезами Инноса' и святой водой, но рунический камень разрушился. Я думаю, что создание этого заклинания доступно только избранному!");
			Doc_PrintLines(nDocID,1,"'Слезы Инноса' могут сыграть важную роль в предстоящей битве. Но достаточно опасно держать их у всех на виду. Я оставлю их здесь, в библиотеке.");
			Doc_PrintLines(nDocID,1,"Кроме этого, не стоит забывать и про Ауру Инноса!");
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");
		}
		else if((hero.guild == GIL_PAL) && (GiveInnosTearPal == FALSE))
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"...я думаю, что 'Слезы Инноса' могут использовать не только Маги Огня, но и паладины!");
			Doc_PrintLines(nDocID,1,"Возможно, покрыв ими свое освященное оружие, то они многократно увеличат его мощь.");
			Doc_Show(nDocID);
			Wld_InsertItem(ItPo_PotionOfDeath_01_Mis,"FP_ITEM_PALFINALWEAPON");	
			GiveInnosTearPal = TRUE;
			PAL_KnowsAbout_FINAL_BLESSING = TRUE;
		}
		else if((hero.guild == GIL_DJG) && (PlayergetsFinalDJGArmor == FALSE))
		{
			PlayergetsFinalDJGArmor = TRUE;
		}
		else
		{
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);
		};
	};
};

func void use_bookazgolor_01_s1()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWS_AZGOGLOR_SUMMON == FALSE)
		{
			KNOWS_AZGOGLOR_SUMMON = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"В заброшенном склепе, о котором мне рассказывал Руэн, я наткнулся на одну очень странную книгу. В ней описывался один древний ритуал с использованием каких-то магических заклинаний. Судя по всему, этот ритуал использовался для вызова какого-то могущественного создания - Великой Тени. В самой дальней части Долины Теней есть круг рун, где видимо возможно совершить этот ритуал.");
				B_LogEntry(TOPIC_URNAZULRAGE,"Также в книге были написаны странные слова, похожие на заклинание - ...БЕКАН ИН ШОКАН ЭТАР МАРДОК - ФАХАТ УР КРАТАР ТЕКАН МОР... Что бы они означали?");
			}
			else
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"В заброшенном склепе, о котором мне рассказывал Руэн, я наткнулся на одну очень странную книгу. В ней описывался один древний ритуал с использованием каких-то магических заклинаний. Судя по всему, этот ритуал использовался для вызова какого-то могущественного создания - Великой Тени. Теперь я точно знаю, как заставить Азгалора выползти из своего лежбища и сразиться со мной. В самой дальней части Долины Теней есть круг рун, где я должен буду совершить этот ритуал.");
				B_LogEntry(TOPIC_URNAZULRAGE,"Также в книге были написаны странные слова, похожие на заклинание - ...БЕКАН ИН ШОКАН ЭТАР МАРДОК - ФАХАТ УР КРАТАР ТЕКАН МОР... Судя повсему это и есть Слова СИлы, о которых говорилось в книге демонов.");
			};
		};
		if((BookBonus_85 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_85 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Ритуал Тени");
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Данный ритуал позволяет призвать в этот мир одно из самых зловещих созданий тьмы - Великую Тень, могущественного черного дракона Азгалора. Тот, кто воистину вознамерился привести истинное зло в этот мир, прежде всего должен обладать древним артефактом - Оком Гнева, зову которого повинуются все создания тьмы. Возложив его к основанию ритуального камня и произнеся магические заклинания, известные как Слова Силы - совершающий ритуал, призовет Великую Тень волей Ока в этот мир.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...БЕКАН ИН ШОКАН ЭТАР МАРДОК - ФАХАТ УР КРАТАР ТЕКАН МОР...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
	};
};

instance ItWr_HolyArrows(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_bookstandholyarrows;
	scemeName = "MAP";
	description = "Святая стрела";
	text[4] = "Описывает способ изготовления освященных стрел и болтов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_bookstandholyarrows()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Освящение");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Считается, что святая вода обладает уникальными целительными свойствами для всех живых существ. Однако, ее применение может привести и к обратному эффекту, если использовать действие святой воды на всякого рода нежити - это лучший способ уничтожения подобных существ! Для подобных целей лучше использовать освещенные стрелы.");
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
	Doc_PrintLines(nDocID,1,"Для создания освященных стрел необходим один пузырек святой воды на пять стрел. При создании последних, окропить наконечник простой стрелы святой водой, а после произнести молитву - ...(далее следует текст молитвы)");
	Doc_Show(nDocID);

	if(MAKEHOLYARROWS == FALSE)
	{
		Log_CreateTopic(TOPIC_HOLYARROWS,LOG_NOTE);
		AI_Print("Изучен рецепт изготовления - 'Освященные стрелы и болты'");
		B_LogEntry(TOPIC_HOLYARROWS,"Теперь я умею делать освященные стрелы. Они очень полезны против всякого рода нечисти.");
		MAKEHOLYARROWS = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

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
	if((BookBonus_86 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_86 = TRUE;
	};
};

func void use_bookstandxranfreg_s1()
{
	var int nDocID;
	var int rnd;
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Дневник");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"-----------");
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Во время одной исследовательской экспедиции в горы Хориниса, нами был обнаружен древний храм. Еще не переступив его порог, мы сразу же ощутили странной поток очень сильной магической энергии! ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Мы попытались войти внутрь, но раздался громкий треск и впереди возник каменный гигант невероятных размеров! Одним ударом он убил трех паладинов. Мы все обратились в бегство, так как наша магия оказалась бессильна против него...");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Пирокар");
		Doc_Show(nDocID);

		if(MIS_XRANFREG == FALSE)
		{
			MIS_XRANFREG = LOG_Running;
			Log_CreateTopic(TOPIC_XRANFREG,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_XRANFREG,LOG_Running);
			B_LogEntry(TOPIC_XRANFREG,"Из книги в подвале монастыря, я узнал о какой-то давней экспедиции Магов Огня. В ней упоминается имя - Пирокар! Надо бы разузнать об этом поподробнее...");
			B_Say(self,self,"$HOWINTEREST");
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
		if((BookBonus_144 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_144 = TRUE;
		};
	};
};

func void Use_Bookstand_Druid_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(Druid_01 == FALSE)
		{
			B_GivePlayerXP(250);
			Druid_01 = TRUE;
			Snd_Play("Levelup");
			B_Say(self,self,"$HOWINTEREST");
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
		if((BookBonus_154 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_154 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,"font_10_book.tga");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Когда растения и животные изменили прежней сути, живущие их стали опасаться. Но Аданос воззвал к мудрым и вразумил, что зло можно превратить в добро, а яд в лекарство. Он предостерег их и устрашил гневом трех богов, чтобы мудрость не обратили во зло и лекарство не делали ядом. Но не все удержались от соблазна.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Друиды проникли в тайны растений. Их знания помогают алхимикам превращать яд в зелья. По воле друидов за несколько дней вырастает лес там, где были кусты, а кусты тем, где была пустыня. Но подобное творение доступно друидам раз или два в жизни. Помогают друидам в их лесах древни - наполовину ожившие деревья, способные двигаться, как големы.");
		Doc_Show(nDocID);
	};
};