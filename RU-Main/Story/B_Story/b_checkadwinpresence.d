func void b_checkadwinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKADW = FALSE;
	}
	else
	{
		CHECKADW = TRUE;
	};
};

func void b_checkoldworldinpresence(var int level)
{
	if(level != CurrentLevel)
	{
		CHECKOLDW = FALSE;
	}
	else
	{
		CHECKOLDW = TRUE;
	};
};

instance ITWR_MAP_NEWWORLD_1(C_Item)
{
	name = "Карта Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};

instance ItWr_Map_AdanosValley_1(C_Item)
{
	name = "Древняя плитка астронома";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_Map_AdanosValley;
	description = name;
	text[4] = "Начертания на плитке практически стерты...";
	inv_animate = 1;
};

func void Use_Map_AdanosValley()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AdanosValley.tga",TRUE);
	Doc_SetLevel(Document,"AddonWorld\AdanosValley.zen");
	Doc_Show(Document);
};

instance ITWR_MAP_ORCCITY_1(C_Item)
{
	name = "Схема пещер";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_orccity;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Схема пещер подземного города орков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_orccity()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_orccity_2.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\ORCCITY.zen");
	Doc_SetLevelCoords(Document,-13000,18300,16800,-19200);
	Doc_Show(Document);
};


instance ITWR_MAP_NEWWORLD_CITY_1(C_Item)
{
	name = "Карта города Хоринис";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_City;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_City()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_City.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-6900,11800,21600,-9400);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_1(C_Item)
{
	name = "Карта Долины Рудников";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_OLDWORLD_FOREST_1(C_Item)
{
	name = "Полная карта Долины Рудников";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 450;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_map_oldworld_forest;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_map_oldworld_forest()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorldF.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ITWR_MAP_PSICAMP(C_Item)
{
	name = "Старая карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_PsiCamp;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Карта старого лагеря Братства Спящего...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_PsiCamp()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_PsiCamp.tga",TRUE);
	Doc_Show(Document);
};

instance ITWR_MAP_ORCTEMPEL(C_Item)
{
	name = "Очень старая карта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_ORCTEMPEL;
	description = name;
	text[0] = "";
	text[1] = "";
	text[4] = "Орочья карта подземного Храма Спящего...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_ORCTEMPEL()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetLevel(Document,"ORCTEMPEL.ZEN");
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_Temple.tga",1);
	Doc_Show(Document);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;

instance ItWr_EinhandBuch(C_Item)
{
	name = "Оборона южных земель";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Оборона южных земель";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseEinhandBuch;
	inv_animate = 1;
};

func void UseEinhandBuch()
{
	var int nDocID;
	var int rnd;

	if(Lerne_Einhand == FALSE)
	{
		DoLearn1H = TRUE;
		Lerne_Einhand = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_34 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_34 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Оборона южных земель ");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Воины северной части страны, сталкиваясь с южными противниками, ведут борьбу с проворством южан, а не с их силой. В горячем климате бойцы предпочитают легкое вооружение, которое обеспечивает большую подвижность. Из-за этого разработан особый стиль сражения, который значительно отличается от используемого на севере.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Хорошо известный маневр южных воинов - блок одной рукой с отступом назад. Благодаря отступу удается снизить силу нападения противника и, таким образом, завладеть преимущественной позицией, которую удобно использовать для контратаки.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ItWr_ZweihandBuch(C_Item)
{
	name = "Двойной блок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Двойной блок";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseZweihandBuch;
	inv_animate = 1;
};

func void UseZweihandBuch()
{
	var int nDocID;
	var int rnd;

	if(Lerne_Zweihand == FALSE)
	{
		DoLearn2H = TRUE;
		Lerne_Zweihand = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_35 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_35 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Двойной блок");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Блокировка клинка противника с помощью двуручного оружия используется только при достаточной силе, чтобы остановить атаку и вынудить противника прервать начатую комбинацию.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Затем, в большинстве случаев, последующая остановка противника используется, чтобы перенять инициативу нападения и полностью повергнуть замешкавшегося противника.");
	Doc_Show(nDocID);
};


instance ITWR_OREBARONARMORLETTER(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_orebaronarmorletter;
	scemeName = "MAP";
	description = "Записка";
	inv_animate = 1;
};


func void use_orebaronarmorletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Удостоверяю, что эти доспехи отданы в починку. Разрешаю выносить их за пределы замка.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				Гомез");
	Doc_Show(nDocID);
};


instance TAGEBUCHOT(C_Item)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дневник";
	text[0] = "Старая потрепанная книга.";
	text[1] = "В ней не хватает страниц.";
	on_state[0] = usetagebuchot;
	inv_animate = 1;
};


func void usetagebuchot()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"День 23.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Я потерял счет времени.");
	Doc_PrintLines(nDocID,0,"Думаю, прошло уже двадцать три дня, с тех пор как нас захватили орки и заставили работать.");
	Doc_PrintLines(nDocID,0,"Работа очень тяжелая, а эти твари не знают пощады. Кто оказался слаб, уже давно лежит в могиле!");
	Doc_PrintLines(nDocID,0,"Я сбегу отсюда, им меня не остановить!");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"День 28.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"Мы должны продолжить копать пещеру вглубь горы.");
	Doc_PrintLines(nDocID,0,"Мы уже выкопали огромную пещеру, но я до сих пор не знаю, зачем все это нужно.");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"День 67.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Кто-то рассказал мне, что у этих орков-шаманов больше нет сердец, но как же они тогда живут?");
	Doc_PrintLines(nDocID,1,"Еще я видел меч, которого так боятся шаманы. Как бы мне хотелось проткнуть их всех этим мечом.");
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"День 78.");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,1,"Меч лежит в одном из залов в передней части храма. Его охраняет один из шаманов.");
	Doc_PrintLines(nDocID,1,"Я сбегу отсюда. Этот дневник собираюсь оставить здесь. Может быть, он кому-нибудь пригодится.");
	Doc_Show(nDocID);
};


instance ITWR_BLOODFLY_01(C_Item)
{
	name = "Шершни";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Шершни";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useitwr_bloodfly_01;
	inv_animate = 1;
};


func void useitwr_bloodfly_01()
{
	var int nDocID;
	var int kosten;
	var int rnd;

	if(READ_BLOODFLY == FALSE)
	{
		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		READ_BLOODFLY = TRUE;
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать жало'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать жало у кровяных шершней.");
		Npc_SetTalentSkill(self,NPC_TALENT_TAKEANIMALTROPHY,1);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_36 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_36 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Шершни");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"О шершнях.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Но там, где земля затоплена водой, а воздух тяжел, обитают огромные шершни, привлекаемые запахом живого тела. Они убивают свою жертву ядом и выпивают ее кровь.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вынуть жало из тела шершня довольно сложно, но у хорошего охотника это должно получиться. Нужно сделать глубокий надрез, чтобы ножом отделить его от окружающих тканей, и осторожно вынуть. Применять его можно после того, как стечет кровь.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ASTRONOMIE(C_Item)
{
	name = "Древняя астрономия";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Древняя астрономия";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useastronomie_s1;
	inv_animate = 1;
};

func void useastronomie_s1()
{
	var int nDocID;
	var int rnd;

	if(ASTRAL_ONCE == FALSE)
	{
		B_RaiseAttribute(hero,ATR_MANA_MAX,2);
		AI_Print(PRINT_READASTRAL);
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		ASTRAL_ONCE = TRUE;

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
	if((BookBonus_37 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_37 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В центре всего находится Морград и его четыре элемента: Тьма, Камень, Вода и Огонь. Небесная сфера укрывает весь мир.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В иерархии творений человек занимает место преемника. Душа связывает его с высшим бытием, божественным духом, а преходящее тело состоит из материи Морграда. В нем отражена картина целого мира.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"После битвы богов Тьма отделена от Морграда. Обитель смерти и ее покровитель Белиар скрывают в недрах невыразимой тьмы то, что противно живому.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"По воле Белиара Тьма исторгает в Морград своих проводников. За сохранением жизни и баланса в мире смотрит Аданос. Воля Инноса дарует миру свет и тепло.");
	Doc_Show(nDocID);
};


instance ITWR_DEMONLANG(C_Item)
{
	name = "Язык Демонов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Язык Демонов";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_demonlang_s1;
	inv_animate = 1;
};


func void use_demonlang_s1()
{
	var int nDocID;
	var int rnd;

	if((KNOWDEMENTORLANGUAGE == FALSE) && (hero.lp >= 10))
	{
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		PLAYER_TALENT_FOREIGNLANGUAGE[3] = TRUE;
		AI_Print("Изучен древний язык демонов...");
		B_LogEntry(TOPIC_Language,LOGTEXT_ADDON_LANGUAGE_4);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		KNOWDEMENTORLANGUAGE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		hero.lp = hero.lp - 10;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
	}
	else if((KNOWDEMENTORLANGUAGE == FALSE) && (hero.lp < 10))
	{
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(hero,hero,"$DONTREADYFORTHIS");
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
	if(KNOWDEMENTORLANGUAGE == TRUE)
	{
		if((BookBonus_38 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_38 = TRUE;
		};

		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"То, что зовется Языком Демонов - не является таковым на самом деле. Знающий его способен понимать и разговаривать с высшими представителями этого вида.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Но истинная его ценность в том, что самые сокровенные тайны, уходящие корнями во времена создания мира, написаны исключительно на этом языке. Каждый из подобных текстов - настоящее сокровище, если понять его смысл.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Кроме того, это язык Темного Бога. Все существа, сотворенные Белиаром и подвластные ему, способны понимать древнюю речь.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Так как он обращается к сильнейшим подданным и несет свою божественную волю в их сознание, его и называют Языком Демонов.");
		Doc_Show(nDocID);
	};
};

var int god1_once;
var int god2_once;
var int god3_once;

instance LEHREN_DER_GOETTER1(C_Item)
{
	name = "Учение богов - Том 1";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Учение богов";
	text[0] = "Том 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter1_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter1_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD1_ONCE == FALSE)
	{
		GOD1_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(100);

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_39 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_39 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Услышь слова богов, ибо на то их воля, чтобы слова были услышаны. Следуй учению богов, ибо на то их воля, чтобы учению следовали. Слушай жрецов, ибо они были избраны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Слова Инноса: Не сомневайся в словах жрецов, даже если не можешь понять их смысла, это станет свидетельством истины и мудрости. Я восходящее солнце, свет и жизнь. Идти против солнца, значит идти против меня. Делающие так навлекают на себя проклятие.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Слова Аданоса: Работай и живи, ибо день создан для того, чтобы человек работал. Учись и ищи знаний, чтобы передать их другим, ибо такова природа человека. Ленивые и праздные навлекают на себя проклятие.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Слова Белиара: Тот, кто действует против законов справедливости и воли богов, будет наказан мной. Его тело познает боль, страдание и смерть, а дух навечно останется в царстве теней.");
	Doc_Show(nDocID);
};


instance LEHREN_DER_GOETTER2(C_Item)
{
	name = "Учение богов - Том 2";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Учение богов";
	text[0] = "Том 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter2_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter2_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD2_ONCE == FALSE)
	{
		GOD2_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_40 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_40 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Не было ни дня, ни ночи, и ничто живое не обременяло собой мир. Но вот миру явился Иннос, и его свет осветил все. Иннос даровал миру жизнь. Но ничто живое не могло жить в свете Инноса, и тогда он создал солнце. Но его свет был все еще слишком силен. Тогда Иннос отделил часть себя и создал Белиара. Белиар принес миру ночь. И тогда в мир пришли люди. Иннос отделил от себя другую часть и создал Аданоса. Аданос даровал людям множество желаний, знания, любознательность и смелость. И был Иннос доволен своими созданиями.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"И он решил передать людей под покровительство Аданоса и почил от дел своих. Белиар же рассердился на людей, ибо они не захотели видеть его своим покровителем и отдыхали ночью, когда приходило его время. И тогда он сотворил себе человека, чтобы он поклонялся только ему одному. Но человек этот ничем не отличался от других людей. Гневом наполнилось сердце Белиара, и он убил созданного им человека и так сказал: 'Они не поклоняются мне, так пусть же мысли обо мне внушают им ужас'. И он создал смерть и взял у людей их жизни.");
	Doc_Show(nDocID);
};


instance LEHREN_DER_GOETTER3(C_Item)
{
	name = "Учение богов - Том 3";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Учение богов";
	text[0] = "Том 3";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = uselehren_der_goetter3_s1;
	inv_animate = 1;
};


func void uselehren_der_goetter3_s1()
{
	var int nDocID;
	var int rnd;

	if(GOD3_ONCE == FALSE)
	{
		GOD3_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");

		if((GOD1_ONCE == TRUE) && (GOD2_ONCE == TRUE) && (GOD3_ONCE == TRUE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,50);
			AI_Print(PRINT_READGODS);
			Snd_Play("Levelup");
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
	if((BookBonus_41 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_41 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Иннос дал людям способность слышать его и разговаривать с ним. Некоторым из них он даровал способность творить великие чудеса. Он назвал ее магией. С ее помощью люди могли изменять мир по своему желанию, и изначально это желание было ничем не ограничено. Так люди получили доступ к божественным силам созидания. Но все они были равны между собой, и им это было не по нраву. И тогда взял он силу тех, кто был недоволен. Те немногие, кто был благодарен за магический дар, ставили Инноса выше остальных богов.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Этих людей уважали и боялись, и называли жрецами. Но даже многие из них были недовольны способностями самых сильных. И тогда они воззвали к Аданосу, и он позволил им забыть о своих способностях. Группа жрецов распалась, и начались бесчисленные войны. Воспоминания о могуществе богов стали не более чем мифом. Так разделились жрецы. Тех, кто последовал за Аданосом, назвали магами Воды, а избранники Инноса назывались магами Огня.");
	Doc_Show(nDocID);
};


var int magicore_once;

instance DAS_MAGISCHE_ERZ(C_Item)
{
	name = "Магическая руда";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Магия руды";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usedas_magische_erz_s1;
	inv_animate = 1;
};


func void usedas_magische_erz_s1()
{
	var int nDocID;
	var int rnd;

	if(READ_MAGISCHE_ERZ == FALSE)
	{
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 5;
		READ_MAGISCHE_ERZ = TRUE;
	};
	if((MAGICORE_ONCE == FALSE) && (KNOWHOWPICKORE == FALSE))
	{
		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_ERZWORK,1);
		};

		AI_Print(PRINT_LEARNPICKORE);
		Npc_SetTalentValue(self,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		MAGICORE_ONCE = TRUE;
		KNOWHOWPICKORE = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry(TOPIC_MAGICORE,"Теперь я умею добывать магическую руду из породы.");
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry(TOPIC_MAGICORE,"Теперь я умею добывать магическую руду из породы.");
			ORE_TOPIC_EXIST = TRUE;
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Магия руды");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лучшую руду для мечей, без сомнения, можно найти в шахтах Хориниса. Это самая чистая руда в мире. Она содержит магическую энергию, обладает непревзойденной прочностью и в то же время легка в обработке. Из этой руды, добываемой в темных глубинах шахт Хориниса, куется лучшее оружие, с которым не сравнится ни один клинок, выкованный из обычной стали.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Нет такого щита или доспеха, который смог бы устоять перед ним. Короли и герои древних времен носили оружие из лучшей стали Хориниса, и во всей Миртане оно ценилось очень высоко. Но магическая руда стоит очень дорого. Очень много сил уходит на ее добычу. Кажется, будто руда сама не желает покидать недра земли.");
	Doc_Show(nDocID);
};

instance ItWr_GoldMake(C_Item)
{
	name = "Плавка золота";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Плавка золота";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_GoldMake;
	inv_animate = 1;
};

func void Use_ItWr_GoldMake()
{
	var int nDocID;
	var int rnd;

	if(KNOWHOWTOOREFUSGOLD == FALSE)
	{
		KNOWHOWTOOREFUSGOLD = TRUE;
		AI_Print("Изучено: плавка золота");
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		B_LogEntry(TOPIC_STEELDRAW,"Теперь я умею переплавлять золото в слитки. Для его получения необходимо двадцать пять золотых самородков.");
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Плавка золота");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для получения одного слитка необходимо примерно четверть сотни золотых самородков. Золото кладется в горн, доводится до нужной температуры и сливается в форму через сито.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

var int varant1_once;
var int varant2_once;

instance SCHLACHT_UM_VARANT1(C_Item)
{
	name = "Битва при Варанте";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Битва при Варанте";
	text[0] = "Том 1";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useschlacht_um_varant1_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant1_s1()
{
	var int nDocID;
	var int rnd;

	if(VARANT1_ONCE == FALSE)
	{
		VARANT1_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
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
	if((BookBonus_43 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_43 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"... но король Робар решил напасть первым. Он собрал свои войска и все силы направил на ослабленный левый фланг вражеской армии. Он решил не тратить время и стрелы, и мечи его войска с легкостью расправились с врагами. Он направил своих солдат дальше, к границам Варанта. Он знал, что для победы в этой битве нужно разделить вражеское войско и сделать так, чтобы силы Геллона и Люккора не смогли...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"... объединились и нанесли ему сокрушительный удар. Ему немедленно нужно было вызывать подкрепление, иначе победа досталась бы врагу...");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...Геллон был убит, его армия разбита, его солдаты бежали с поля боя. Но Робар не хотел дать побежденным ни единого шанса собраться вместе и приказал уничтожить всех, кто остался в живых.");
	Doc_Show(nDocID);
};


instance SCHLACHT_UM_VARANT2(C_Item)
{
	name = "Битва при Варанте";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Битва при Варанте";
	text[0] = "Том 2";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useschlacht_um_varant2_s1;
	inv_animate = 1;
};


func void useschlacht_um_varant2_s1()
{
	var int nDocID;
	var int rnd;

	if(VARANT2_ONCE == FALSE)
	{
		VARANT2_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
		B_GivePlayerXP(500);

		if((VARANT1_ONCE == TRUE) && (VARANT2_ONCE == TRUE))
		{
			DoLearn1H = TRUE;
			DoLearn2H = TRUE;
			Snd_Play("Levelup");
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
	if((BookBonus_44 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_44 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Исход войны был известен. Варант, захваченный иноземцами, был полностью разграблен. Король Робар решил не оставаться на полях Варанта, а приказал своим генералам самим расправиться с оставшимися врагами. В разгромленном государстве остались еще войска, которыми руководил Люккор, самый способный военачальник Варанта. Он провел множество блестящих сражений.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Но теперь его войско попало в засаду. Вражеские солдаты готовились к наступлению. Ли, один из лучших генералов Миртаны, загнал его в ловушку. Тяжелая конница Варанта не могла сражаться на заболоченной местности. Вся долина была окружена солдатами генерала Ли, которые нападали на врагов и убивали их одного за другим. Отчаянные попытки выбраться из ловушки не имели успеха. Он был побежден.");
	Doc_Show(nDocID);
};


instance ITWR_SOULRIVER(C_Item)
{
	name = "Жертвенные души";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_soulriver_open;
	inv_animate = 1;
};


func void use_soulriver_open()
{
	var int nDocID;
	var int rnd;

	if(READ_SOULRIVER == FALSE)
	{
		B_LogEntry(TOPIC_MORIUSTEST,"Я прочитал книгу, о которой говорил Мориус. В ней говорится как сделать вытяжку из души. После приготовления этой вытяжки, ей надо окропить один из алтарей божества, которому я хочу принести жертву.");
		B_LogEntry_Quiet(TOPIC_MORIUSTEST,"Чтобы приготовить вытяжку душ мне нужна сфера, хранящая душу существа, сера, аквамарин, черная жемчужина, эссенция маны и побег болотной травы. Далее необходимо смешать все ингредиенты на алхимическом столе, после чего нагреть в лабораторной колбе и перегнать в отдельный сосуд вытяжку полученного мной раствора.");
		READ_SOULRIVER = TRUE;
		SOULRIVER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_45 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_45 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Издревна, душа любого создания этого мира считалась одним из самых ценных подношений богам. Тем, кто приподносил его, боги обычно являли свою божественную милость и покровительсво.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Иногда даже самые серьезные пригрешения прощались, если вероотсупник приносил в жертву такой дар. Кроме этого, необходимо было обладать знаниями, позволяющими извлечь душу существа, не повредив ее божественную сущность и структуру.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Чтобы совершить данное приношение - необходимо приготовить вытяжку из души того создания, которое послужит в качестве жертвы. Потом, необходимо было произнести молитву божеству и окропить его священный алтарь.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Для приготовления вытяжки необходимы следующие ингредиенты: сфера, хранящая душу существа, аквамарин, сера, черная жемчужина, эссенция маны и побег болотной травы, в качестве реагента.");
	Doc_Show(nDocID);
};

instance ItWr_Azgolor(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[4] = "На книге начертаны странные символы, похожие на заклинания.";
	on_state[0] = Use_Azgolorbook_Open;
	inv_animate = 1;
};

func void Use_Azgolorbook_Open()
{
	var C_Npc her;
	var int nDocID;
	her = Hlp_GetNpc(PC_Hero);

	if(READ_AZGOLORBOOK == FALSE)
	{
		READ_AZGOLORBOOK = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		SEEKAZGOLOR = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		if(KNOWDEMENTORLANGUAGE == TRUE)
		{
			if(READ_AZGOLOR == FALSE)
			{
				B_LogEntry(TOPIC_URNAZULRAGE,"В подземном храме я нашел странную книгу. Судя по всему текст книги написан на языке демонов  - ...(уроки хранителей не прошли для меня даром). В ней говориться, как использовать древний артефакт под названием Око Гнева для вызова в этот мир могущественного черного дракона, Азгалора - повелителя демонов. Судя по всему, прежде всего необходимо пробудить само Око от сна. Сделать это просто - на алхимическом столе необходимо выбрать эссенцию из крови орка и демона, добавив пять кусков серы, а после полученным раствором окропить сам артефакт. После пробуждения, следует провести священный ритуал и с помощью Слов Силы и власти артефакта, создание тьмы явится на зов заклинателя.");
				READ_AZGOLOR = TRUE;
			};
			if((BookBonus_46 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{	
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_46 = TRUE;
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Wood_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Wood_R.tga",0);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Око Гнева - мощный артефакт древности, с помощью которого можно призвать в этот мир зловещее создание тьмы - могущественного черного дракона, Азгалора, повелителя демонов.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Если кто-то вознамерится осуществить это, ему необходимо прежде всего пробудить само Око, наполнив его демонической силой, зову которой не способно противостоять ни одно создание тьмы. ");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Для того, чтобы вернуть магическую силу артефакту, необходимо выбрать эссенцию из крови орка и демона, добавив в него пять кусков серы, а после окропить получившимся раствором само Око Гнева.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"После пробуждения Ока Гнева, надлежит произвести священный ритуал и призвать Великую Тень в этот мир, с помощью Слов Силы и власти артефакта.");
			Doc_Show(nDocID);
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
			B_LogEntry(TOPIC_URNAZULRAGE,"В подземном храме я нашел странную книгу, написаную на непонятном мне языке. Придется мне поискать того, кто сможет ее прочесть.");
		};
	};
};


instance ITWR_INNOSPRAY(C_Item)
{
	name = "Молитвеник Избранного";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_innospray_open;
	inv_animate = 1;
};


func void use_innospray_open()
{
	var int nDocID;

	if(MARDUK_BOOKREAD == FALSE)
	{
		B_LogEntry(TOPIC_MAGICINNOSARMOR,"Теперь я знаю молитву Избранного для ритуала освещения рудных доспехов паладина или рыцаря.");
		MARDUK_BOOKREAD = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_47 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_47 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Молитва Избанного");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"О могущественный господин мой, Иннос,");
	Doc_PrintLines(nDocID,1,"дай свое благославление избранному твоему,");
	Doc_PrintLines(nDocID,1,"надели его силой твоей и мудростью,");
	Doc_PrintLines(nDocID,1,"дабы смог он противостоять темному злу!");
	Doc_Show(nDocID);
};


instance ITWR_HAGENORDERFORT(C_Item)
{
	name = "Приказ Лорда Хагена";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_hagenorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void use_itwr_hagenorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Распоряжение");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Этот документ дает его владельцу безпрепятственный и неограниченный по времени проход в форт Азган.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Хаген");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance itwr_pyrorderfort(C_Item)
{
	name = "Пропуск Пирокара";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_pyrorderfort;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void use_itwr_pyrorderfort()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Распоряжение");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Этот документ дает его владельцу безпрепятственный и неограниченный по времени проход в форт Азган.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Верховный маг Огня, Пирокар");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_WATERMAGELETTER(C_Item)
{
	name = "Послание Магов Воды";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_watermageletter;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Письмо Сатураса к Лорду Хагену.";
	inv_animate = 1;
};


func void use_itwr_watermageletter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Уважаемый Лорд Хаген!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Прошу Вас распорядится обеспечить защиту магического портала, каковой мы обнаружили при исследовании древних развалин пирамид на сереве Хориниса. Дабы избежать различного рода неприятностей. Думаю, вы понимаете, что я имею в виду.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Сатурас, глава Магов Воды");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_TYONRECEPT(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Рецепт эликсира трансформации сознания";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_tyonrecept;
	inv_animate = 1;
};


func void use_itwr_tyonrecept()
{
	var int nDocID;

	if(NEORASCANTEACHRECEPTFORKDF == FALSE)
	{
		NEORASCANTEACHRECEPTFORKDF = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Состав ингредиентов для изготовления эликсира:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Кость скелета");
	Doc_PrintLine(nDocID,0,"Аквамарин");
	Doc_PrintLine(nDocID,0,"Черный жемчуг");
	Doc_PrintLine(nDocID,0,"Огненный язык");
	Doc_PrintLine(nDocID,0,"Болотник");
	Doc_PrintLine(nDocID,0,"Огненный корень");
	Doc_PrintLine(nDocID,0,"Мандибула ползуна");
	Doc_PrintLine(nDocID,0,"Сердце каменного голема");
	Doc_PrintLine(nDocID,0,"Яйцо ползуна");
	Doc_PrintLine(nDocID,0,"Царский щавель");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_TYONLIST(C_Item)
{
	name = "Список Идола Тиона";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_tyonlist;
	scemeName = "MAP";
	description = "Список Идола Тиона";
	inv_animate = 1;
};


func void use_itwr_tyonlist()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Список ингредиентов:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Яйцо ползуна");
	Doc_PrintLine(nDocID,0,"Сердце каменного голема");
	Doc_PrintLine(nDocID,0,"Царский щавель");
	Doc_PrintLine(nDocID,0,"Огненный язык");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_FIRELIGHT(C_Item)
{
	name = "Магическая формула заклинания 'Покров огня'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит структуру заклинания";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance itwr_FireMeteor(C_Item)
{
	name = "Магическая формула заклинания 'Метеорит'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит структуру заклинания";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_TELEKINESIS(C_Item)
{
	name = "Магическая формула заклинания 'Поглощение духа'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит структуру заклинания";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_CONTROL(C_Item)
{
	name = "Магическая формула заклинания 'Гипноз'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит структуру заклинания";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_GuruWrath(C_Item)
{
	name = "Магическая формула заклинания 'Гнев стихий'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3500;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит структуру заклинания";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_KALOMSRECIPE(C_Item)
{
	name = "Рецепт Кор Галома";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[0] = "Рецепт обработки болотника";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_kalomsrecipe;
	inv_animate = 1;
};


func void use_itwr_kalomsrecipe()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Рецепт обработки болотника.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для изготовления лучших сортов болотник необходимо перетолочь с луговым горцом и тщательно просушить. А также потребуется большее количество самого болотника! Это создаст правильную концетрацию магической эссенции.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                - Галом");
	Doc_Show(nDocID);

	if((KNOW_JOINTRECIPE == FALSE) && Npc_IsPlayer(self))
	{
		B_GivePlayerXP(50);
		KNOW_JOINTRECIPE = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_TalentHerb,LOG_NOTE);
		B_LogEntry(TOPIC_TalentHerb,"Для изготовления 'Северного Темного' необходимо четыре стебля болотника и луговой горец.");
		B_LogEntry_Quiet(TOPIC_TalentHerb,"Для изготовления 'Зова мечты' необходимо восемь стеблей болотника и луговой горец.");
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
	if((BookBonus_48 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_48 = TRUE;
	};
};


instance ITWR_FERNANDOLETTER(C_Item)
{
	name = "Рекомендательное письмо Фернандо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для Лариуса.";
	text[3] = "В нем упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_LUTEROLETTER(C_Item)
{
	name = "Рекомендательное письмо Лютеро";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для Лариуса.";
	text[3] = "В нем упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_GERBRANTLETTER(C_Item)
{
	name = "Рекомендательное письмо Гербрандта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для Лариуса.";
	text[3] = "В нем упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_SALANDRILLETTER(C_Item)
{
	name = "Рекомендательное письмо Саландрила";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для Лариуса.";
	text[3] = "В нем упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_VALENTINOLETTER(C_Item)
{
	name = "Рекомендательное письмо Валентино";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для Лариуса.";
	text[3] = "В нем упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_TALIASANRECOMENDEDLETTERS(C_Item)
{
	name = "Связка бумаг";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Связка рекомендательных писем для Лариуса.";
	text[3] = "В них упоминаются положительные качества Галлахада.";
	inv_animate = 1;
};

instance ITWR_ZURISDOCS(C_Item)
{
	name = "Пачка документов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Документы, подтверждающие права собственности";
	text[3] = "на торговое место Джоры. Имя собственика не вписано.";
	text[4] = "На документах стоит подпись Зуриса.";
	inv_animate = 1;
};

instance ITWR_MANIAC(C_Item)
{
	name = "Симптомы мании";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_maniac;
	description = "Симптомы мании";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itwr_maniac()
{
	var int nDocID;
	var int rnd;

	if(MANIAC_ONCE == FALSE)
	{
		B_GivePlayerXP(250);
		MANIAC_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_49 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_49 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Остовы мании");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLines(nDocID,0,"За время путешествия я чаще всего встречал это заболевание среди сектантов. В таких сообществах болезнь трудно распознать, и она распространяется значительно быстрее. Странное поведение сектантов рассматривается как дар свыше.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Об этом не стоит даже упоминать. Я должен был смириться с тем, что людей, которые ведут себя ненормально, принимают за избранников богов. Самый интересный случай заболевания я наблюдал у одного сумасшедшего, который все время повторял одно и то же: 'Спящий проснется'.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

instance ITWR_RHETORIKBOOK(C_Item)
{
	name = "Основы риторики";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_rhetorikbook;
	description = "Учебник риторики";
	inv_animate = 1;
};

func void use_itwr_rhetorikbook()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_01 == FALSE)
	{
		READBOOKSDONE_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 2;
			AI_Print("Риторика + 2");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
		Snd_Play("LevelUP");
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
	if((BookBonus_50 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_50 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_Red_R.tga",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Риторика");
	Doc_PrintLine(nDocID,0,"---------------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"1. Говори понятно. Упрощай сложные предложения!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"2. Следи за языком своего тела. Мимика и жесты должны отвечать");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"тому, что ты говоришь.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"3. Следи за реакцией собеседника. Исходя из этого, можно предугадывать его мысли и ожидания.");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"4. Ты должен тщательно обдумывать свои аргументы и говорить только по существу.");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"5. Добрый конец всему делу венец. Впечатление от твоей речи зависит от того, как ты ее закончишь.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};


instance ITWR_GERBRANDSECLET(C_Item)
{
	name = "Запечатанное письмо Гербрандта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gerbrandseclet;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Письмо Гербрандта для человека в таверне.";
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet()
{
	var int nDocID;
	CreateInvItems(self,itwr_gerbrandseclet_open,1);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Помогите мне уладить мои проблемы с человеком по имени Вамбо. Вы знаете, что делать.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. К письму прилагается кошелек, в котором находится оплата за ваши услуги.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_GERBRANDSECLET_OPEN(C_Item)
{
	name = "Письмо Гербрандта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gerbrandseclet_open;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Гербрандта для человека в таверне.";
	inv_animate = 1;
};


func void use_itwr_gerbrandseclet_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Помогите мне уладить мои проблемы с человеком по имени Вамбо. Вы знаете, что делать.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. К письму прилагается кошелек, в котором находится оплата за ваши услуги.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_HROMANIN_1(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть I";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_1;
	inv_animate = 1;
};

func void use_itwr_hromanin_1()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Тот, кто готов отказаться от всех земных страстей и следовать тропами правды, должен узнать, где сокрыт источник моей силы. Найдя его, он будет способен разрушить все, что соединяет его с этим миром, и покажет, что он готов принять знания Хроманина.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Под сенью старых темных скал дробили камни ради злата. На склеп наткнулись и расплата...пришла. То страшный час настал!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_01 == FALSE)
	{
		READ_HROMANIN_01 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER1 == FALSE)
	{
		MIS_HROMANINQUEST = LOG_Running;
		Snd_Play("FoundRiddler");
		Log_CreateTopic(TOPIC_HROMANINQUEST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_HROMANINQUEST,LOG_Running);
		B_LogEntry(TOPIC_HROMANINQUEST,"Я нашел очень странную книгу - Хроманин! Похоже, что ее автор пишет сплошными загадками...'Под сенью старых темных скал дробили камни ради злата. На склеп наткнулись и расплата...пришла. То страшный час настал!' Хм! Пока я ничего не понимаю, но, возможно, просто еще время не пришло.");
		CHAPTER1 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == ABANDONEDMINE_ZEN)
		{
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton,"AM_HROMANIN_GUARD_02");
			Wld_InsertNpc(skeleton,"AM_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_2,"FP_ITEM_HROMANIN_02");
			CHAPTER2_Insert = TRUE;
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
	if((BookBonus_51 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_51 = TRUE;
	};
};


instance ITWR_HROMANIN_2(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть II";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_2;
	inv_animate = 1;
};


func void use_itwr_hromanin_2()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В приносимых ветрами видениях Хроманина открывалось передо мной будущее. За веру в него я готов был отдать все, но и этого было бы мало. Они потрясли меня до глубины души.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Кто мертвых потревожил в покое темных скал. Сам жизнь давно оставил и мертвой плотью стал. Наполнена пещера та болью, злом и страхом. И озеро подземное покрыто древним мраком.");
	Doc_Show(nDocID);

	if(READ_HROMANIN_02 == FALSE)
	{
		READ_HROMANIN_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER2 == FALSE)
	{
		B_GivePlayerXP(100);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Я нашел вторую книгу под названием Хроманин. И снова одни загадки...'Кто мертвых потревожил в покое темных скал. Сам жизнь давно оставил и мертвой плотью стал.  Наполнена пещера та болью, злом и страхом. И озеро подземное покрыто древним мраком.'");
		CHAPTER2 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONCAVE_ZEN)
		{
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_01");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Warrior,"DC_HROMANIN_GUARD_03");
			Wld_InsertItem(ITWR_HROMANIN_3,"FP_ITEM_HROMANIN_03");
			CHAPTER3_Insert = TRUE;
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
	if((BookBonus_52 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_52 = TRUE;
	};
};


instance ITWR_HROMANIN_3(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть III";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_3;
	inv_animate = 1;
};


func void use_itwr_hromanin_3()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"О, боги древних времен! Возможно ли, чтобы такой человек, как я, недостойный, получил эту силу. Как велик страх потерять все, выказав малейшее слово сомнения.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Руда и кровь, тоска и пот...настигнет там грехов расплата. Застит глазницы власть и злато - проклятье душ на всех падет!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_03 == FALSE)
	{
		READ_HROMANIN_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER3 == FALSE)
	{
		B_GivePlayerXP(250);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Нашел я третью книгу. Похоже, я начинаю понимать, в чем тут дело! ...'Руда и кровь, тоска и пот...настигнет там грехов расплата. Застит глазницы власть и злато - проклятье душ на всех падет!'");
		CHAPTER3 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDMINE_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_02");
			Wld_InsertNpc(SkeletonMage,"OM_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"OM_HROMANIN_GUARD_05");
			Wld_InsertItem(ITWR_HROMANIN_4,"FP_ITEM_HROMANIN_04");
			CHAPTER4_Insert = TRUE;
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
	if((BookBonus_53 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_53 = TRUE;
	};
};


instance ITWR_HROMANIN_4(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть IV";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_4;
	inv_animate = 1;
};


func void use_itwr_hromanin_4()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я даже не смею надеяться когда-нибудь самому пережить Хроманин. Прошли дни растрат и пустых слов. Теперь будет так просто достичь исполнения, и очень скоро я это сделаю.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вода и камень, жизнь и смерть! Погаснет свет в глубинах тех. Приди туда, где ты бывал, покрыв себя рудой из скал!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_04 == FALSE)
	{
		READ_HROMANIN_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER4 == FALSE)
	{
		B_GivePlayerXP(500);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Книга номер четыре. Уж не пытается ли этот парень просто заморочить мне голову?! ...'Вода и камень, жизнь и смерть! Погаснет свет в глубинах тех. Приди туда, где ты бывал, покрыв себя рудой из скал!'");
		CHAPTER4 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == DEMONSTOWER_ZEN)
		{
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"DT_HROMANIN_GUARD_03");
			Wld_InsertNpc(skeleton_warrior_dark,"DT_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_dark,"DT_HROMANIN_GUARD_07");
			Wld_InsertItem(ITWR_HROMANIN_5,"FP_ITEM_HROMANIN_05");
			CHAPTER5_Insert = TRUE;
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
	if((BookBonus_54 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_54 = TRUE;
	};
};


instance ITWR_HROMANIN_5(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть V";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_5;
	inv_animate = 1;
};


func void use_itwr_hromanin_5()
{
	var int nDocID;
	var C_Npc riddler;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Но я не буду вставать на этот путь один. Я должен буду разделить силу, сокрытую во мне, с достойным, который найдет меня. Надеюсь, мое ожидание не затянется надолго...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Века стоял оплот молчанья, грозя врагам камнями стен. Остались там лишь пыль и тлен, да гарпий злобные стенанья.");
	Doc_Show(nDocID);

	if(READ_HROMANIN_05 == FALSE)
	{
		READ_HROMANIN_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER5 == FALSE)
	{
		B_GivePlayerXP(750);
		B_LogEntry(TOPIC_HROMANINQUEST,"Может, это последняя?! Мне уже не терпится узнать, что это все значит. 'Века стоял оплот молчанья, грозя врагам камнями стен. Остались там лишь пыль и тлен, да гарпий злобные стенанья.'");
		Snd_Play("FoundRiddler");
		CHAPTER5 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_01");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_HROMANIN_GUARD_03");
			Wld_InsertNpc(Skeleton_Shadow_Priest_Hrom,"OW_HROMANIN_GUARD_04");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_05");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_06");
			Wld_InsertNpc(skeleton_warrior_dark,"OW_HROMANIN_GUARD_07");
			CHAPTER6_Insert = TRUE;
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
	if((BookBonus_55 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_55 = TRUE;
	};
};

instance ITWR_HROMANIN_6(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроманин, часть VI";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_hromanin_6;
	inv_animate = 1;
};


func void use_itwr_hromanin_6()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Смерть - это только начало...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Искусный предсказатель наметил путь игрушке! Он ждет глупца в ловушке. Вернись в нее, скорей...");
	Doc_Show(nDocID);

	if(READ_HROMANIN_06 == FALSE)
	{
		READ_HROMANIN_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if(CHAPTER6 == FALSE)
	{
		B_GivePlayerXP(1000);
		Snd_Play("FoundRiddler");
		B_LogEntry(TOPIC_HROMANINQUEST,"Чувствую, разгадка уже близка...'Исскустный предсказатель наметил путь игрушке! Он ждет глупца в ловушке. Вернись в нее, скорей...'");
		CHAPTER6 = TRUE;
		B_Say(self,self,"$HOWINTEREST");

		if(CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc(skeleton_lord_kadar,"OW_UNDEAD_DUNGEON_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"STONEHENGE");
			Wld_InsertNpc(skeleton_warrior_dark,"STONES");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"OW_PATH_3_13");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_STONES_02");
			Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_STONES_02");
			Wld_InsertNpc(skeleton_warrior_dark,"FP_ROAM_OW_PATH_3_13_02");
			HromGuard_Insert = TRUE;
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
	if((BookBonus_56 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_56 = TRUE;
	};
};

instance ITWR_HROMANIN(C_Item)
{
	name = "Старая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_HROMANIN;
	inv_animate = 1;
};

func void use_ITWR_HROMANIN()
{
	var int nDocID;
	var int rnd;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Смерть - это только начало...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Так сущность или же душа? Ведь чья-то жизнь, то чья-то пища. Поглотишь душ ты больше тыщи и вечность станет хороша!");
	Doc_Show(nDocID);

	if(READ_HROMANIN_ALL == FALSE)
	{
		B_GivePlayerXP(2000);
		READ_HROMANIN_ALL = TRUE;

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
	if((BookBonus_57 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_57 = TRUE;
	};
};

instance ITWR_NIGELLETTER(C_Item)
{
	name = "Рекомендательное письмо Найджела";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для торговца Лютеро.";
	text[3] = "В нем упоминаются мои положительные качества и";
	text[4] = "Найджел просит Лютеро принять меня в Гильдию Торговцев.";
	inv_animate = 1;
};

instance ITWR_EROLLETTER(C_Item)
{
	name = "Рекомендательное письмо Эрола";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Рекомендательное письмо для торговца Лютеро.";
	text[3] = "В нем упоминаются мои положительные качества и";
	text[4] = "Эрол просит Лютеро принять меня в Гильдию Торговцев.";
	inv_animate = 1;
};

instance ITWR_BENGARORDERLETTER(C_Item)
{
	name = "Список товаров от Лютеро";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо адресовано Бенгару от торговца Лютеро.";
	text[3] = "В нем указан список необходимых товаров";
	text[4] = "для следующей партии.";
	inv_animate = 1;
};

instance ITWR_GOMEZMAGICWORDS(C_Item)
{
	name = "Записка Гомеза";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_gomezmagicwords;
	scemeName = "MAP";
	description = name;
	text[3] = "В ней записаны магические слова для вызова";
	text[4] = "душ магов Огня, умерших от руки Гомеза.";
	inv_animate = 1;
};


func void use_itwr_gomezmagicwords()
{
	var int nDocID;
	if((Npc_GetDistToWP(hero,"OC_MAGE_CENTER") <= 200) && (RESCUEGOMEZSTEPTHREE == TRUE) && (RESCUEGOMEZSTEPTHREEDONE == FALSE) && (FIREMAGECOMES == FALSE))
	{
		Snd_Play("MFX_SPAWN_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_InsertNpc(none_105_corristo,"OC_CORRISTO");
		Wld_InsertNpc(none_106_rodriguez,"OC_RODRIGUEZ");
		Wld_InsertNpc(none_107_damarok,"OC_DAMAROK");
		Wld_InsertNpc(none_108_drago,"OC_DRAGO");
		Wld_InsertNpc(none_109_torrez,"OC_TORREZ");
		FIREMAGECOMES = TRUE;
		B_LogEntry(TOPIC_RESCUEGOMEZ,"Я вызвал души Корристо и магов Огня, которых убил Гомез. Теперь мне нужно поговорить с ними.");
	}
	else
	{
		AI_Print("Ничего не произошло...");
		Snd_Play("MFX_MASSDEATH_CAST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"ФАР АКТУС БЕК НОР КАР...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_KAMPFKUNST(C_Item)
{
	name = "Мастер меча";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Мастер меча";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_kampfkunst;
	inv_animate = 1;
};


func void use_itwr_kampfkunst()
{
	var int nDocID;
	var int rnd;

	if(LEARN_MASTER == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearn1H = TRUE;
		DoLearn2H = TRUE;
		LEARN_MASTER = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_58 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_58 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"На протяжении двух тысяч лет учение этого мастера определяло направление развития искусство боя.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ловкость, хладнокровие, скорость, наблюдательность и быстрота реакции являются теми качествами, которые надо тренировать. Если боец желает достичь вершин мастерства, движения его должны стать хорошо скоординированными и четко выверенными.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Суть учения мастера о единении духа и тела прошла через века.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Достигнутое им совершенство оставило неизгладимый след. Сменялись эпохи и менялся мир, но учение о гармонии внутренних сил и движений тела по-прежнему живо.");
	Doc_Show(nDocID);
};


instance ITWR_ELEMENTAREARCANEI(C_Item)
{
	name = "Магические знания";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Магические знания";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_elementarearcanei;
	inv_animate = 1;
};


func void use_itwr_elementarearcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTARE_ONCE == FALSE)
	{
		B_GivePlayerXP(10);
		B_RaiseAttribute(self,ATR_MANA_MAX,5);
		AI_Print(PRINT_READASTRAL);
		ELEMENTARE_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_59 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_59 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Магические знания");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Классификация магии в соответствии с земными представлениями.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Долгие годы исследований магии и ее места в мире дали свои плоды. Уже можно сказать, что магия является абсолютным элементом мира. Она может воздействовать на другие элементы, изменяя их природу.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Соединение элемента и магии дает элемент в самой чистой его форме, но в природе такое соединение встречается очень редко. Способность мага создавать из ничего вещи материального мира является доказательством того, что магическая сила вызывает к жизни чистые и высшие элементы, которые только могут существовать в природе.");
	Doc_Show(nDocID);
};

instance ITWR_JAGD_UND_BEUTE(C_Item)
{
	name = "Охотник и жертва";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Охотник и жертва";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_jagd_und_beute;
	inv_animate = 1;
};

func void use_itwr_jagd_und_beute()
{
	var int nDocID;
	var int rnd;

	if(JAGD_UND_BEUTE_ONCE == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearnBow = TRUE;
		JAGD_UND_BEUTE_ONCE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_60 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_60 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Его книги пережили многие эпохи, а его советы используют учителя, чтобы обучать людей искусству охоты. Великие битвы севера не прошли даром. Сейчас любой живущий в лесах человек может хорошо обращаться с луком. Но это еще не говорит о том, что они умеют охотиться. Существует несколько правил, которые предполагают больше, чем простое обращение с оружием! Дикая природа таинственна и непредсказуема.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Искусство охоты с луком является не только частью древней традиции, но и самым быстрым способом охоты. За долгие годы техника стрельбы не претерпела особых изменений, и, возможно, она не изменится и в будущем. Какие обстоятельства определяют ход охоты с луком? Умение распознать эти закономерности и является решающим на пути постижения охотничьего искусства.");
	Doc_Show(nDocID);
};

instance MYRTANAS_LYRIK(C_Item)
{
	name = "Лирика Миртаны";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Лирика Миртаны";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemyrtanas_lyrik;
	inv_animate = 1;
};

func void usemyrtanas_lyrik()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_02 == FALSE)
	{
		READBOOKSDONE_02 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(10);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_61 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_61 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Песнь");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"покаяния");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Погибло все, но солнце неустанно");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"По-прежнему вершит годов круговорот.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"И память о былом тревожит разум,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"О прежней жизни чистой вопиет.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"И братства дух, забытый нами, ждет");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Бесплодно исполнения обетов данных,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Отвергнутых во имя низких целей,");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Что никогда не ведали законов чести.");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


instance WAHRE_MACHT(C_Item)
{
	name = "Истинная сила";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Истинная сила";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usewahre_macht;
	inv_animate = 1;
};

func void usewahre_macht()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_03 == FALSE)
	{
		READBOOKSDONE_03 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(300);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_62 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_62 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Истинная сила");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Святой долг посвященного");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Только одно отличает мага от обычного человека. Обладая возможностью влиять на божественную силу, он является существом, для которого не действуют границы и законы мира смертных.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Если маг смог достичь уровня, на котором у него получилось выйти за границы своего существования, он поднимается над законами мира смертных. Он может пересекать границы времени и пространства, даже конец всему существующему в мире - смерть не сможет встать у него на пути.");
	Doc_Show(nDocID);
};


instance MACHTVOLLE_KUNST(C_Item)
{
	name = "Могущественное искусство";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Могущественное искусство";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usemachtvolle_kunst;
	inv_animate = 1;
};


func void usemachtvolle_kunst()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_04 == FALSE)
	{
		READBOOKSDONE_04 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_63 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_63 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Могущественное искусство");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Труд для посвященных в искусство Аркан.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"В процессе постижения тайн магии увеличивается способность мага собирать энергию. Сначала она течет к нему как лесной ручеек. В это время о ней нужно заботиться, иначе она может иссякнуть. Но потом этот ручеек наполняется и превращается в полноводную реку.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Он растет и растет, становится сильнее с каждым днем. В его дальнейшем могуществе не будет и намека на прежнюю слабость. Достижение максимальной силы - священный долг каждого мага, ибо она была дарована богами и являет собой самый ценный дар, который когда-либо получали смертные.");
	Doc_Show(nDocID);
};


instance GOETTERGABE(C_Item)
{
	name = "Дар богов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дар богов";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegoettergabe;
	inv_animate = 1;
};


func void usegoettergabe()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_05 == FALSE)
	{
		READBOOKSDONE_05 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(40);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_64 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_64 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Магия");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Дар Богов");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Человек на протяжении многих веков пытается понять природу и истоки магии. Но где же начинать поиски? Как вообще описать, что такое магия? Это самая противоречивая сущность во вселенной. Она может убивать и исцелять, создавать и уничтожать.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Как она выглядит? Где человек может отыскать ее, невидимую, но удивительно могущественную? Магия - это магия. Это самый удивительный дар богов тем, кто может его использовать. Целительная сила, которую могут контролировать лишь единицы.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Бартос Ларанский");
	Doc_Show(nDocID);
};


instance GEHEIMNISSE_DER_ZAUBEREI(C_Item)
{
	name = "Тайны колдовства";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Poor_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Тайны колдовства";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usegeheimnisse_der_zauberei;
	inv_animate = 1;
};


func void usegeheimnisse_der_zauberei()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_06 == FALSE)
	{
		READBOOKSDONE_06 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_65 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_65 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Тайны колдовства");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сам маг является служителем магической силы, а не ее повелителем. Он обладает способностью влиять на мир магической энергии и проводить ее через себя. Адепт, посвященный в высокое искусство магии, должен уметь укрощать свой дух, чтобы добиться этого.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Сила его духа помогает собирать магические арканы, формировать, связывать и вносить в наш вещественный мир. В момент наивысшей концентрации магу удается перенести свой дух из нашего мира в иные миры, откуда к нему приходит сила. Он является лишь ее проводником.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Бартос фон Ларан");
	Doc_Show(nDocID);
};


instance ITWR_UMSONST_01(C_Item)
{
	name = "Напрасный путь";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Напрасный путь";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useumsonst_01;
	inv_animate = 1;
};


func void useumsonst_01()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_07 == FALSE)
	{
		READBOOKSDONE_07 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(150);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_66 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_66 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Напрасный путь");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это награда всем, кто думает, что в любом месте можно найти что-то стоящее. Теперь возрадуйтесь, ибо это так и есть...");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1," нет одной страницы ");
	Doc_Show(nDocID);
};

instance REZEPTUREN(C_Item)
{
	name = "Рецепты";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Рецепты вин - том I";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen;
	inv_animate = 1;
};

func void userezepturen()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_08 == FALSE)
	{
		READBOOKSDONE_08 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print("Изучен алхимический рецепт - 'Бальзам провидения'");
		B_LogEntry(TOPIC_SPECIALWINES,"Для того, чтобы сделать 'Бальзам провидения' нужны следующие ингредиенты: 2 грозди винограда, 2 стебля болотника, огненный язык и бутылка рома.");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_67 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_67 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Бальзам провидения:");
	Doc_PrintLine(nDocID,0,"----------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Поэтому в его глаза попала желчь. Это вещество горькое на вкус. Если она попадает в глаза, человек начинает видеть горечь мира, так растет его мудрость. Он становится провидцем! Горечь и мудрость зависимы друг от друга.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Слезы, страдания и разочарования тоже несут горечь, а мудрость утешает человека, хранящего душевную боль. Горечь и мудрость противоположны. Где есть горечь, там нет мудрости, где есть мудрость - нет горечи.");
	Doc_Show(nDocID);
};


instance REZEPTUREN2(C_Item)
{
	name = "Рецепты вин";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Рецепты вин - том II";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = userezepturen2;
	inv_animate = 1;
};


func void userezepturen2()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_09 == FALSE)
	{
		READBOOKSDONE_09 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(25);
		Log_CreateTopic(TOPIC_SPECIALWINES,LOG_NOTE);
		AI_Print("Изучен алхимический рецепт - 'Вино забвения'");
		B_LogEntry(TOPIC_SPECIALWINES,"Для того, чтобы сделать 'Вино забвения' нужны следующие ингредиенты: 4 грозди винограда, 2 сердца демона и 3 стебля лугового горца.");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_68 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_68 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Вино забвения");
	Doc_PrintLine(nDocID,0,"--------------------");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Высоко в горах Архолоса растет лучший виноград, идущий на изготовление этого вина. Довести это вино до совершенства, дать ему созреть - это целое искусство. Основная тайна вина: оно всегда должно оставаться неподвижным. При приготовлении вина виноградные кисти перекладываются особой травой - зиосом.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Они видели, как Магистр превращает чистейшую родниковую воду в вино, и были поражены. Они преклонялись перед ним и хвалили его дар. В наказание за лень Магистр заточил своих учеников в бутылки, а сам исчез в огненном столбе.");
	Doc_Show(nDocID);
};


instance ITWR_VARUSCONTENT(C_Item)
{
	name = "Список Варуса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_varuscontent;
	description = name;
	text[2] = "Список провианта, необходимого для";
	text[3] = "паладинов Лорда Варуса.";
	inv_animate = 1;
};


func void use_itwr_varuscontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Список");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"50 бочек солонины");
	Doc_PrintLine(nDocID,0,"15 - 20 бочек питьевой воды");
	Doc_PrintLine(nDocID,0,"5 бочек пива");
	Doc_PrintLine(nDocID,0,"20 мешков хлебной муки");
	Doc_PrintLine(nDocID,0,"3 ящика сыра");
	Doc_PrintLine(nDocID,0,"1 бочку вина");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Остальное, на ваше усмотрение Хаген.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Лорд Варус");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HAGENCONTENT(C_Item)
{
	name = "Список Лорда Хагена";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	visual = "ItWr_Scroll_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itwr_hagencontent;
	description = name;
	text[2] = "Список провианта, необходимого для паладинов.";
	inv_animate = 1;
};


func void use_itwr_hagencontent()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Список");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"75 бочек солонины");
	Doc_PrintLine(nDocID,0,"25 - 30 бочек питьевой воды");
	Doc_PrintLine(nDocID,0,"10 бочек пива");
	Doc_PrintLine(nDocID,0,"35 мешков хлебной муки");
	Doc_PrintLine(nDocID,0,"8 ящиков сыра");
	Doc_PrintLine(nDocID,0,"4 бочки вина");
	Doc_PrintLine(nDocID,0,"250 яблок");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		С уважением, Лорд Хаген.");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasTransferMagic(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_VatrasTransferMagic;
	scemeName = "MAPSEALED";
	description = "Магический свиток Ватраса";
	text[4] = "Возвращает человеческое сознание...";
	inv_animate = 1;
};

func void Use_ItWr_VatrasTransferMagic()
{
	var C_Npc WereWl;

	WereWl = Hlp_GetNpc(Werewolf);

	if(Npc_GetDistToNpc(WereWl,hero) <= 500)
	{	
		B_GivePlayerXP(150);
		Wld_PlayEffect("SPELLFX_HEALSHRINE",WereWl,WereWl,0,0,0,FALSE);
		WereWolfIsHuman = TRUE;
		WereWl.start_aistate = zs_mm_rtn_huntgone;
		AI_Standup(WereWl);
		AI_ContinueRoutine(WereWl);
	}
	else
	{
		B_Say(hero,hero,"$DONTWORK");
		CreateInvItems(hero,ItWr_VatrasTransferMagic,1);
	};
};

instance ITWR_XARDASGOBLINSCROLL(C_Item)
{
	name = "Свиток изгнания";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardasgoblinscroll;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Изгоняет призванных существ";
	text[4] = "Использовать можно только один раз...";
	inv_animate = 1;
};


func void use_itwr_xardasgoblinscroll()
{
	var int nDocID;
	var C_Npc xargob;
	xargob = Hlp_GetNpc(xardas_goblin);
	Snd_Play("MFX_MASSDEATH_CAST");
	if((XARDASGOBLINREADYAWAY == TRUE) && (MIS_GOBLINAWAY == LOG_Running))
	{
		xargob.start_aistate = zs_mm_rtn_demonrest;
		AI_Teleport(xargob,"TOT");
		Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		CreateInvItems(hero,itke_xardasgoblinkey,1);
		MIS_GOBLINAWAY = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GOBLINAWAY,LOG_SUCCESS);
		B_LogEntry(TOPIC_GOBLINAWAY,"С помощью свитка я изгнал это странное существо из мира живых.");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSDEM.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_XARDASDOCS_1(C_Item)
{
	name = "Рукописи Ксардаса, часть I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Толстая пачка исписанной бумаги...";
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_2(C_Item)
{
	name = "Рукописи Ксардаса, часть II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Толстая пачка исписанной бумаги...";
	inv_animate = 1;
};

instance ITWR_XARDASDOCS_3(C_Item)
{
	name = "Рукописи Ксардаса, часть II - подлинник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Толстая пачка исписанной бумаги...";
	inv_animate = 1;
};

instance ITWR_LOSTISLANDMAP(C_Item)
{
	name = "Каменная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_LostIslandMap.3ds";
	material = MAT_STONE;
	on_state[0] = use_itwr_lostislandmap;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	description = name;
	text[2] = "На лицевой стороне плитки изображен странный рисунок,";
	text[3] = "а обратной выбито несколько загадочных символов.";
	inv_animate = 1;
};


func void use_itwr_lostislandmap()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LOSTISLAND_MAP.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book);
	Doc_SetMargins(nDocID,-1,70,50,90,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK(C_Item)
{
	name = "Письмо Фалька";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Письмо Фалька к торговцу Босперу.";
	inv_animate = 1;
};


func void use_itwr_letterfalk()
{
	var int nDocID;
	if((FALKLETTEROPENED == FALSE) && (MIS_LETTERFALK == LOG_Running))
	{
		CreateInvItems(hero,itwr_letterfalk_open,1);
		FALKLETTEROPENED = TRUE;
		B_LogEntry(TOPIC_LETTERFALK,"Я вскрыл запечатанное письмо Фалька. В нем он просит Боспера обеспечить его людей стрелами в количестве не менее сотни штук. Может быть, предложить Фальку достать эти стрелы самому или все таки доставить это письмо по адресату?");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мой дорогой друг.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"У меня заканчиваются мои клейменные стрелы, а прислать к тебе кого-нибудь из своих людей - у меня сейчас нет никакой возможности. А посему, очень тебя прошу передать с подателем сего письма для меня не менее сотни стрел!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Фальк");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LETTERFALK_OPEN(C_Item)
{
	name = "Письмо Фалька";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letterfalk_open;
	scemeName = "MAP";
	description = name;
	text[2] = "Вскрытое письмо Фалька к торговцу Босперу.";
	inv_animate = 1;
};


func void use_itwr_letterfalk_open()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мой дорогой друг.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"У меня заканчиваются мои клейменные стрелы, а прислать к тебе кого-нибудь из своих людей - у меня сейчас нет никакой возможности. А посему, очень тебя прошу передать с подателем сего письма для меня не менее сотни стрел!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Фальк");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_FALKGRANDFATHER_01(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_01;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_01()
{
	var int nDocID;
	if(FINDFALKGRANDFATHERSEEK_01 == FALSE)
	{
		FINDFALKGRANDFATHERSEEK_01 = TRUE;
		if(Npc_KnowsInfo(hero,dia_hun_741_falk_grand))
		{
			B_GivePlayerXP(50);
			MIS_FALKGRANDFATHERSEEK = LOG_Running;
			Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
			B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"В старых развалинах, что расположены на севере острова, я нашел одного странного рода клочок бумаги с записями. На вид, они очень напоминают страницы из дневника одного из охотников по имени Бен. Кажется, это имя я слышал от Фалька в лагере охотников. Может быть стоит показать ему эту вещицу?...");
			B_Say(self,self,"$HOWINTEREST");
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сегодня, во время охоты я подстрелил одного очень странного на вид зверя. Даже и не припоминаю, чтобы я когда-нибудь встречал нечто подобное в этих краях. Интересно, откуда он тут взялся?! Может быть...(неразборчивый текст)... Что же, попробую это выяснить.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_GALKGRANDFATHER_02(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_02;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_02()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_02 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_02 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"В пещере, недалеко от лагеря пиратов, я обнаружил еще одну записку, оставленную Беном. Судя по его записям, он собирался основательно обследовать эту часть острова.");
		Wld_InsertItem(itmi_falkgrandfatheritem_03,"FP_AW_ITEM_FALKGFWROTE_02");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Даже не отходя далеко от пещеры, в которой мне пришлось на время обосноваться, я повстречал просто огромное множество редких животных. Недалеко отсюда...(неразборчивый текст)...Все это просто удивительно! Завтра же, я отправляюсь в глубь этих территорий.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_HALKGRANDFATHER_03(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_03;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_03()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_03 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(50);
		FINDFALKGRANDFATHERSEEK_03 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Кажется Бену все больше и больше нравится эта долина. Судя по записям, теперь он кажется собрался обследовать каньон.");
		Wld_InsertItem(itmi_falkgrandfatheritem_04,"FP_AW_ITEM_FALKGFWROTE_03");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Тут прекрасные охотничьи угодья! Все местность вокруг кишит разнообразными загадочными созданиями, хотя и чрезвычайно опасными. Но мне здесь все равно нравится. Через несколько дней я планирую отправиться в каньон, что расположен к западу от этого места. Возможно, там мне встретиться еще что-нибудь интересное.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_JALKGRANDFATHER_04(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_04;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_04()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_04 == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(100);
		FINDFALKGRANDFATHERSEEK_04 = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Похоже Бену не слишком приглянулся каньон. Он написал, что тут слишком много опасных тварей, а посему старик решил побыстрее убраться из этого места. Судя по всему, направил свои стопы по направлению к огромной пещере, расположенной в этом каньоне.");
		Wld_InsertItem(itwr_Kalkgrandfather_final,"FP_AW_ITEM_FALKGFWROTE_04");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Каньон оказался довольно опасным местом! Вся округа просто кишит различными хищными тварями. Так что, думаю не стоит тут слишком сильно задерживаться. Сегодня я отыскал в горах вход в большую пещеру. Надо будет ее тщательно обследовать - возможно мне удасться найти там что-нибудь интересное...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_KALKGRANDFATHER_FINAL(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_final;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_final()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINAL == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(150);
		FINDFALKGRANDFATHERSEEK_FINAL = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Теперь, судя по записям, этот искатель приключений столкнулся на болотах с одним странным существом, с виду напоминающего ползуна. Естественно, опытный охотник решил не упускать свой шанс поохотиться на этого зверя и отправился за ним вглубь болота.");
		Wld_InsertItem(itwr_Lalkgrandfather_finalext,"FP_AW_ITEM_FALKGFWROTE_05");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Вчера недалеко от места моей стоянки, я наткнулся на очень странное существо. По своему виду оно немного напоминало ползуна, только ...(неразборчивый текст)...Завтра я вновь отправлюсь в глубь этого болота. Возможно, мне все-таки удасться выследить эту тварь и прикончить ее.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_LALKGRANDFATHER_FINALEXT(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_falkgrandfather_finalext;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_falkgrandfather_finalext()
{
	var int nDocID;
	b_checkadwinpresence(ADDONWORLD_ZEN);
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_FINALEXT == FALSE) && (CHECKADW == TRUE))
	{
		B_GivePlayerXP(200);
		FINDFALKGRANDFATHERSEEK_FINALEXT = TRUE;
		B_LogEntry(TOPIC_FALKGRANDFATHERSEEK,"Кажется охота на этого странного зверя не слишком пока удается Бену. Он пишет, что никак не может подстрелить эту тварь, поскольку она постоянно ускользает от него...");
		Wld_InsertNpc(blattcrawlerex,"ADW_SWAMP_TO_BIGSEA_01");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я никак не могу выбрать удобного момента, чтобы подстрелить эту тварь...(неразборчивый текст)...Она слишком хитра и постоянно ускользает от меня. Но завтра у меня это обязательно получится!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"                  Бен ...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_ORCSORDER(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OrcN.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_orcsorder;
	scemeName = "MAP";
	description = name;
	text[2] = "Клочок бумаги с непонятными символами...";
	inv_animate = 1;
};


func void use_itwr_orcsorder()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_New);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);

	if(MIS_ORCORDER == LOG_Running)
	{
	 	if((PlayerKnowsOrcLanguage == TRUE) && (KNOWSTARANBUILD == FALSE))
		{
			B_LogEntry(TOPIC_ORCORDER,"У капитана дракара я нашел письмо. В нем говорится, что орки прислали отряд рабов, чтобы сделать новый таран для штурма замка. Судя по всему, этот отряд должен скоро прибыть в их лагерь у крепости. Надо как можно скорее сообщить об этом Альберту.");
			KNOWSTARANBUILD = TRUE;
		};
	};
};


instance ITWR_ANCIENT(C_Item)
{
	name = "Тайны древних";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ancient;
	scemeName = "MAP";
	description = name;
	text[2] = "Книга излучает магическое сияние...";
	text[3] = "На переплете книги засохшие капли крови.";
	inv_animate = 1;
};


func void use_itwr_ancient()
{
	var int nDocID;

	if(MEANDMILTENTELEPORTDCDONE == FALSE)
	{
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_MASSDEATH_CAST");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - (hero.attribute[ATR_HITPOINTS] / 2);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(ANCIENTBOOKBONUS == FALSE)
		{
			B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			ANCIENTBOOKBONUS = TRUE;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			B_Say(self,self,"$HOWINTEREST");
		};
		if((BookBonus_69 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_69 = TRUE;
		};
	};
};


instance ITWR_NECRONOMICON(C_Item)
{
	name = "Некрономикон";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_necronomicon;
	scemeName = "MAP";
	description = name;
	text[2] = "Книга излучает темную ауру...";
	inv_animate = 1;
};


func void use_itwr_necronomicon()
{
	var int nDocID;
	if(hero.guild == GIL_KDM)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);

		if(NECRONOMICONBONUS == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
			B_RaiseAttribute(hero,ATR_MANA_MAX,10);
			Snd_Play("Levelup");
			NECRONOMICONBONUS = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	}
	else
	{
		AI_Print("Магия книги не дает вам возможности ее открыть...");
		Snd_Play("MFX_MASSDEATH_CAST");
		if(NECRONOMICONBONUSTRY == FALSE)
		{
			NECRONOMICONBONUSTRY = TRUE;
		};
	};
};

instance ITWR_XARDASPAINT(C_Item)
{
	name = "Портрет мага Огня";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_xardaspaint;
	scemeName = "MAP";
	description = "Портрет мага Огня";
	text[2] = "Маг изображенный на этом рисунке";
	text[3] = "кого-то очень сильно напоминает...";
	inv_animate = 1;
};


func void use_itwr_xardaspaint()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"XardasPaint.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_ORTEGOLETTER(C_Item)
{
	name = "Записка Ортего";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_ortegoletter;
	scemeName = "MAP";
	description = name;
	text[2] = "Немного помятый клочок бумаги с записями...";
	inv_animate = 1;
};


func void use_itwr_ortegoletter()
{
	var int nDocID;

	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE))
	{
		B_GivePlayerXP(50);
		READORTEGO = TRUE;
		B_LogEntry(TOPIC_KILLIGNAZ,"В одной из пещер Хориниса я встретил одного парня по имени Ортего. Судя по всему, он явно кого-то ждал в этом месте и мое внезапное появление сыграло с ним довольно злую шутку - он попросту принял меня за другого. В дальнейшем, из нашего с ним разговора я понял, что Ортего - убийца и ждет здесь своего вознаграждения за какое-то только что провернутое им грязное дельце. Естественно в конце концов он все-таки понял, что я не тот кто ему нужен и конечно же попытался просто убить меня. Ему это не удалось... Уже обыскивая его труп, я нашел при нем письмо, в котором некто просит убить того самого Игнаца, алхимика из города. Думаю, это и было то дельце, за которое Ортега ждал своего золота. Теперь все стало ясно - алхимимк Константино действительно невиновен в смерти Игнаца! Однако остается все-таки понять, кто именно нанял Ортегу. Возможно мне стоит подождать здесь, чтобы это выяснить.");
		B_StartOtherRoutine(KDF_503_Karras,"MeetKiller");
		AI_Teleport(KDF_503_Karras,"NW_CITY_SMFOREST_04");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Имя нужного тебе человека - Игнац, он алхимик. Его лачугу ты найдешь в портовом районе Хориниса. Постарайся все сделать без особой шумихи. Потом отправляйся в пещеру, та что рядом с восточными воротами города. Там ты получишь причитающееся тебе за эту работу золото.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ITWR_DJG_ARMOR(C_Item)
{
	name = "Чертежи выкроек";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OldP.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_djg_armor;
	scemeName = "MAP";
	description = name;
	text[2] = "Чертежи выкроек доспехов из панцирей ползунов";
	inv_animate = 1;
};

func void use_itwr_djg_armor()
{
	var int nDocID;
	if(KNOWMAKECRAWLERARMOR == FALSE)
	{
		B_GivePlayerXP(100);
		KNOWMAKECRAWLERARMOR = TRUE;
		Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать доспехи из панцирей ползунов мне необходим один железный слиток, кусок смолы и десять панцирей ползунов.");
		Log_AddEntry(TOPIC_HUNTERSARMOR,"Я отыскал сундук Волка! Как он и говорил, в нем я нашел чертежи выкроек доспехов из панцирей ползунов. Теперь пора приниматься за работу!");
		B_Say(self,self,"$HOWINTEREST");
	};
	if((BookBonus_70 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_70 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"DJGArmorCrawlerLetter.TGA",0);
	Doc_Show(nDocID);
};


instance ITWR_LETTERORESWORD(C_Item)
{
	name = "Записка Хагена";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_letteroresword;
	scemeName = "MAP";
	description = name;
	text[2] = "Здесь записаны инструкции по ковке рудных клинков...";
	inv_animate = 1;
};


func void use_itwr_letteroresword()
{
	var int nDocID;

	if(KNOWNORESWORD == FALSE)
	{
		KNOWNORESWORD = TRUE;
		Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
		B_LogEntry(TOPIC_TalentSmith,"Для того, чтобы выковать рудный клинок необходим один слиток магической руды.");
		B_Say(self,self,"$SMITHBOOK");
	};
	if((BookBonus_71 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_71 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Процесс создания рудного клинка весьма достаточно прост. Для этого необходимо взять один слиток магической руды и нагреть его в точности до определенной температуры. После придать ему форму клинка, а затем очень резко охладить! Прочность этого оружия не будет знать себе равных.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_TRANSFERENERGY(C_Item)
{
	name = "Перенос энергии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_transferenergy;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Этот свиток содержит в себе заклинание переноса энергии.";
	inv_animate = 1;
};

func void use_itwr_transferenergy()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		if((Npc_HasItems(hero,ItMi_Avatar_Dark) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Fire) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Water) >= 1) && (Npc_HasItems(hero,ItMi_Avatar_Stone) >= 1) && ((SIMPLEBLACK_1H_ONME == TRUE) || (SIMPLEBLACK_2H_ONME == TRUE)))
		{
			B_GivePlayerXP(1500);
			AI_UnequipWeapons(hero);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Dark,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Fire,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Water,1);
			Npc_RemoveInvItems(hero,ItMi_Avatar_Stone,1);

			if(SIMPLEBLACK_1H_ONME == TRUE)
			{
				if(Npc_HasItems(hero,itmw_1h_simpleblack) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				}
				else if(Npc_HasItems(hero,itmw_1h_simpleblack_dex) >= 1)
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic_dex,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack_dex,1);
				}
				else
				{
					CreateInvItems(hero,itmw_1h_blessedblack_magic,1);
					Npc_RemoveInvItems(hero,itmw_1h_simpleblack,1);
				};
			}
			else
			{
				CreateInvItems(hero,itmw_2h_blessedblack_magic,1);
				Npc_RemoveInvItems(hero,itmw_2h_simpleblack,1);
			};

			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			NETBEKLEADME_STEP2DONE = TRUE;
			AI_Print(PRINT_MAKESUPERSWORD);
			B_LogEntry(TOPIC_GUARDIANS,"Я создал меч, сила которого способна уничтожить Хранителей. Теперь, думаю пришло время нанести визит и им!");
		}
		else
		{
			AI_Print("Ничего не произошло...");
			Snd_Play("MFX_MASSDEATH_CAST");
			CreateInvItems(self,itwr_transferenergy,1);
		};
	}
	else
	{
		AI_Print("Ничего не произошло...");
		Snd_Play("MFX_MASSDEATH_CAST");
		CreateInvItems(self,itwr_transferenergy,1);
	};
};

instance ITWR_DRAGONTALE(C_Item)
{
	name = "Пасть дракона - Том I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Пасть дракона";
	text[0] = "Том I";
	text[4] = "Древний фолиант окутан ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale;
	inv_animate = 1;
};


func void use_itwr_dragontale()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_1 == FALSE)
	{
		DRAGONTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print("Очки обучения + 2");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_72 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_72 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Иcпокон веков драконы считались самыми опасными созданиями богов на земле. Достаточно одного единственного взгляда, чтобы понять насколько сильны и могущественны эти существа!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Обычно они обитают высоко в горах, куда вряд ли когда-либо ступала нога человека, или в глубоких темных подземельях, поскольку драконы прекрасно видят и ориентируются в темноте.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Только безумец осмелится встать на пути дракона - его пламя способно за мгновения превратить в золу и пепел самый твердый камень ... От человека же, оно не оставит даже воспоминаний!");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Однако если ты все-таки вознамерился сразить это могущественное создание - то знай, что и у драконов есть свои слабые места.");
	Doc_Show(nDocID);
};


instance ITWR_DRAGONTALE_2(C_Item)
{
	name = "Пасть дракона - Том II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Пасть дракона";
	text[0] = "Том II";
	text[4] = "Древний фолиант окутан ярким пламенем...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_dragontale_2;
	inv_animate = 1;
};


func void use_itwr_dragontale_2()
{
	var int nDocID;
	var int rnd;

	if(DRAGONTALE_2 == FALSE)
	{
		DRAGONTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(500);
		hero.lp = hero.lp + 2;
		AI_Print("Очки обучения + 2");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_73 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_73 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Драконы практически неуязвимы! Крепкую чешую, покрывающую их тело с головы до хвоста, не способен пробить даже самый острый меч. А пущеная стрела и вовсе не способна причинить вред этому древнейшему из созданий.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Однако это не означает, что дракона нельзя убить. Их слабое место - это брюшная полость, которая не прикрыта крепкой наружной чешуей. Именно туда и следует наносить смертельные удары. Правда для это придется подойти к дракону вплотную, что не очень то просто сделать.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Кроме того, многое зависит и от места обитания дракона! Некоторые из них, в силу своих врожденных качеств, крайне восприимчивы к повреждениям от различных состояний стихий и магии.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Например, ледяные драконы Нордмара крайне чувствительны к огню, а огненные драконы Варанта - наоборот, к холоду и морозу.");
	Doc_Show(nDocID);
};


instance ITWR_DEMONTALE(C_Item)
{
	name = "Тени в ночи";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "На книге выцарапано изображение демона...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_demontale;
	inv_animate = 1;
};


func void use_itwr_demontale()
{
	var int nDocID;
	var int rnd;

	if(DEMONTALE == FALSE)
	{
		DEMONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(200);
		hero.lp = hero.lp + 2;
		AI_Print("Очки обучения + 2");
		Snd_Play("LevelUp");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_74 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_74 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Самые кровожданые и ужасные твари, когда либо созданные Белиаром, богом Тьмы - это демоны! Они слепо следуют воле своего господина, сея вокруг себя смерть и ужас.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Демоны обладают огромной силой и могуществом, а их лютая ненависть ко всему живому делает их еще куда более сильными, чем обычно.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"К тому же они не восприимчивы ни к огню, ни к почти любому виду оружия. И только лишь очень сильная магия способна заставить отступить эти создания тьмы.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"И горе тому, кто по глупости угодит в лапы демона! Ужасные мучения и страшная смерть ждут его...");
	Doc_Show(nDocID);
};

instance ITWR_DRAGSTONE(C_Item)
{
	name = "Драгоценные камни";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_ITWR_DRAGSTONE;
	inv_animate = 1;
};

func void use_ITWR_DRAGSTONE()
{
	var int nDocID;
	var int rnd;

	if(DRAGSTONE == FALSE)
	{
		B_GivePlayerXP(50);
		DRAGSTONE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_75 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_75 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Многие драгоценные камни таят в себе определенные магические свойства. Правда, известны лишь только некоторые из них.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Например, рубин наделяет своего владельца силой, а изумруд ловкостью.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Прежде чем использовать камень, его должным образом следует обработать на ювелирном столе. И только после этого его можно уже будет использовать.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"О способе обработки драгоценных камней известно лишь избранным мастерам-ювелирам.");
	Doc_Show(nDocID);
};

instance ITWR_SKELETONTALE(C_Item)
{
	name = "Зов мрака";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_skeletontale;
	inv_animate = 1;
};


func void use_itwr_skeletontale()
{
	var int nDocID;
	var int rnd;

	if(SKELETONTALE == FALSE)
	{
		B_GivePlayerXP(150);
		SKELETONTALE = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_76 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_76 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Неупокоеные останки умерших и их души, восставшие по воле и зову Темного Бога, дабы служить ему и идти в бой за него.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Бессчисленные легионы воинов тьмы ждут того часа, когда повелитель поведет их на последнюю битву против Инноса. И никто не в силах остановить их!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Они не знают ни покоя, ни усталости, ни жалости, ни сострадания! И все те, кто отвергнет повелителя и не наречет его своим богом - будут уничтожены.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"И только лишь священный огонь Инноса сможет противостоять им...");
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK1(C_Item)
{
	name = "Арканум Голум - Том I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usegolembook1;
	description = "Арканум Голум";
	text[0] = "Том I";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook1()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_1 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_1 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_77 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_77 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"Арканум Голум - Том I");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Каменный голем");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Эти каменные колоссы практически неуязвимы. Мечи, топоры и луки не причиняют им ровным счетом никакого вреда.");
	Doc_PrintLines(nDocID,0,"Единственным зарегистрированным случаем победы человека над големом является доклад наемника. Он рассказал, что от удара молота в големе появилась трещина. От последовавших затем ударов она стала расширяться, пока голем попросту не развалился на части.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Болотный голем");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Только тот, кто сам хоть раз сталкивался с этими созданиями, берущими свое начало от первородных элементов земли, поистине понимает глубину уважения, которым проникается столкнувшийся с ними путешественник.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Насколько известно - болотный голем крайне невосприимчив к магии и огню. Однако с легкостью разрубается на части острым, как бритва, мечом.");
	Doc_Show(nDocID);
};


instance ITWR_GOLEMBOOK2(C_Item)
{
	name = "Арканум Голум - Том II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = usegolembook2;
	description = "Арканум Голум";
	text[0] = "Том II";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void usegolembook2()
{
	var int nDocID;
	var int rnd;

	if(GOLEMTALE_2 == FALSE)
	{
		B_GivePlayerXP(100);
		GOLEMTALE_2 = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_78 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_78 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"АРКАНУМ ГОЛУМ - Том II");
	Doc_PrintLine(nDocID,0,"======================");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ледяной голем");
	Doc_PrintLine(nDocID,0,"---------");
	Doc_PrintLines(nDocID,0,"Ледяные големы чем-то сродни каменным, только тела их, похоже, состоят из воды. Все известное человеку оружие просто скользит по шкуре этих созданий.");
	Doc_PrintLines(nDocID,0,"Путешественники должны также знать и постоянно помнить о ледяном дыхании големов, потому как забывчивые рискуют превратиться в сосульку.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLines(nDocID,1,"Один из магов Огня как-то рассказывал о встрече с ледяным големом. Используя свою магические руны, он без особых проблем одолел это существо.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Огненный голем");
	Doc_PrintLine(nDocID,1,"------------");
	Doc_PrintLines(nDocID,1,"Согласно рассказам, эти создания способны превратить человека в пылающий факел одним лишь своим прикосновением.");
	Doc_PrintLines(nDocID,1,"Один из случаев столкновения с таким големом показал, что заклинания молний и льда способны причинить вред огненному голему.");
	Doc_Show(nDocID);
};


instance ELEMENTARE_ARCANEI(C_Item)
{
	name = "Основы Магии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Основы Магии";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_elementare_arcanei;
	inv_animate = 1;
};


func void use_elementare_arcanei()
{
	var int nDocID;
	var int rnd;

	if(ELEMENTAREARCANEI == FALSE)
	{
		B_GivePlayerXP(100);
		ELEMENTAREARCANEI = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_79 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_79 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Основы Магии");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Место магии в миропорядке");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Чтобы выяснить место магии и ее связь с основными элементами, было проведено много исследований. Все они сходятся в одном: магия стоит выше всех элементов. Она может трансформировать их, изменять форму, то есть повелевать ими.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Каждый элемент, если рассматривать его в первородной форме, имеет связь с магией. Подобные связи можно проследить лишь в некоторых местах, и эти места разыскивают многие. Способность мага создавать или призывать элементы, казалось бы, из пустоты, еще раз доказывает, что магия является самой могущественной силой во вселенной.");
	Doc_Show(nDocID);
};

instance ITWR_1TESTFONT(C_Item)
{
	name = "Письмо тест шрифта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_1TESTFONT;
	scemeName = "MAP";
	description = name;
	text[2] = "Письмо Гербрандта для человека в таверне.";
	inv_animate = 1;
};

func void use_1TESTFONT()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Помогите мне уладить мои проблемы с человеком по имени Вамбо. Вы знаете, что делать.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. К письму прилагается кошелек, в котором находится оплата за ваши услуги.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ITWR_2TESTFONT(C_Item)
{
	name = "Книга тест шрифта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Хроманин, часть I";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_2TESTFONT;
	inv_animate = 1;
};

func void use_2TESTFONT()
{
	var int nDocID;
	var int rnd;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Хроманин");
	Doc_PrintLine(nDocID,0,"-----------");
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Тот, кто готов отказаться от всех земных страстей и следовать тропами правды, должен узнать, где сокрыт источник моей силы. Найдя его, он будет способен разрушить все, что соединяет его с этим миром, и покажет, что он готов принять знания Хроманина.");
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
	Doc_PrintLines(nDocID,1,"Мудрый пересматривает свои прошлые дела, прежде чем начать что-то новое.");
	Doc_Show(nDocID);
};

instance ItWr_MonasterySecret(C_Item)
{
	name = "Призрачное пламя";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Book_STONOS_XRONIKS.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_MonasterySecret;
	inv_animate = 1;
};

func void Use_ItWr_MonasterySecret()
{
	var int nDocID;
	var int rnd;

	if(MonasterySecret == FALSE)
	{
		B_GivePlayerXP(150);
		MonasterySecret = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		MIS_MonasterySecret = LOG_Running;
		Log_CreateTopic(TOPIC_MonasterySecret,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_Running);
		B_LogEntry(TOPIC_MonasterySecret,"Существует много легенд и одна из них об одном артефакте, способном вызывать в помощь магу никого иного, а самого настоящего дракона! Никто не знает, правда это или нет, но история упоминает об одном маге-алхимике, которому все таки удалось создать подобный предмет. Если прочитавший эту книгу задумал найти этот артефакт, то по слухам свои поиски стоит начать в месте называемом Амон Шен...Что бы это значило?");
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_80 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_80 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Mage_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Mage_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Существует много легенд и одна из них об одном артефакте, способном вызывать в помощь магу никого иного, а самого настоящего дракона!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Никто не знает, правда это или нет, но история упоминает об одном маге-алхимике, которому все таки удалось создать подобный предмет.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вызванное существо не столь могущественно, как создания Белиара, однако его мощь способна сокрушить целые армии.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Если прочитавший эту книгу задумал найти этот артефакт, то по слухам свои поиски стоит начать в месте называемом Амон Шен...");
	Doc_Show(nDocID);
};

instance ITWr_MonasterySecretLeadOW(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ITWr_MonasterySecretLeadOW;
	scemeName = "MAP";
	description = name;
	text[2] = "Старый клочок бумаги с непонятными записями...";
	inv_animate = 1;
};

func void use_ITWr_MonasterySecretLeadOW()
{
	var int nDocID;

	if((MonasterySecretLeadOW == FALSE) && (MIS_MonasterySecret == LOG_Running))
	{
		B_GivePlayerXP(100);
		MonasterySecretLeadOW = TRUE;
		B_LogEntry(TOPIC_MonasterySecret,"Все, что я смог разобрать в найденом мною письме, это имя - Креол.");
		B_Say(self,self,"$HOWINTEREST");
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...(неразборчивый текст)...Креол...(неразборчивый текст)...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Osair_Read(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Osair_Read;
	scemeName = "MAPSEALED";
	description = name;
	text[2] = "Вскрытое письмо Осаира к Нрозасу...";
	inv_animate = 1;
};

func void Use_ItWr_Osair_Read()
{
	var int nDocID;

	if(MIS_OsairDemand == FALSE)
	{
		MIS_OsairDemand = LOG_Running;
		Log_CreateTopic(TOPIC_OsairDemand,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_OsairDemand,LOG_Running);
		B_LogEntry(TOPIC_OsairDemand,"Как интересно! За просьбу Нрозаса, Осаир хочет получить от него шкуру черного пещерного тролля. Если я достану для него этот трофей, это может сыграть мне на руку.");
		B_Say(self,self,"$HOWINTEREST");
		Wld_InsertNpc(TROLL_BLACK_AGE_PW,"PW_CAVEBLACKTROLL");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Мой дорогой Нрозас!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я согласен присылать тебе более крепкий человеческий материал, если только мы вернемся с тобой к вопросу о той редкой шкуре черного пещерного тролля, что я давно у тебя прошу. Подумай над этим!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Осаир");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_ConstRecept(C_Item)
{
	name = "Алхимический рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_ConstRecept;
	inv_animate = 1;
};

func void Use_ItWr_ConstRecept()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Состав ингредиентов для изготовления эликсира:");
	Doc_PrintLine(nDocID,0,"Аквамарин");
	Doc_PrintLine(nDocID,0,"Серебряное кольцо");
	Doc_PrintLine(nDocID,0,"Вода");
	Doc_PrintLine(nDocID,0,"Кость скелета");
	Doc_PrintLine(nDocID,0,"Болотная трава");
	Doc_PrintLine(nDocID,0,"Сыр");
	Doc_PrintLine(nDocID,0,"Темный гриб");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fingersliste(C_Item)
{
	name = "Чертеж";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Fingersliste;
	scemeName = "MAP";
	description = "Список";
	text[4] = "Инструкция по изготовлению шпаги 'Золотая игла'...";
	inv_animate = 1;
};

func void Use_ItWr_Fingersliste()
{
	var int nDocID;
	var int rnd;

	if(Lovkach_W8 == FALSE)
	{
		B_GivePlayerXP(300);
		AI_Print("Изучен рецепт ковки - 'Золотая игла'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь, я смогу сделать шпагу 'Золотая игла'. Для этого мне необходимо иметь пять слитков магической руды, кусок черной руды, золотой слиток, восемь кусков серы, три куска ледяного кварца, четыре раствора смолы и черный жемчуг.");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
		Lovkach_W8 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		MIS_TellAboutFingers = LOG_Success;
		Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Success);
		B_LogEntry(TOPIC_TellAboutFingers,"Рецепт изготовления шпаги 'Золотая игла' у меня.");
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
	if((BookBonus_81 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_81 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Золотая игла'...компоненты:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"...- пять слитков магической руды");
	Doc_PrintLine(nDocID,0,"- кусок черной руды");
	Doc_PrintLine(nDocID,0,"- золотой слиток");
	Doc_PrintLine(nDocID,0,"- восемь кусков серы");
	Doc_PrintLine(nDocID,0,"- три куска ледяного кварца ");
	Doc_PrintLine(nDocID,0,"- четыре раствора смолы");
	Doc_PrintLine(nDocID,0,"- черный жемчуг...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_VatrasDiary(C_Item)
{
	name = "Дневник Ватраса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_VatrasDiary;
	inv_animate = 1;
};

func void Use_ItWr_VatrasDiary()
{
	var int nDocID;
	var int rnd;

	if(VatrasDiaryBonus == FALSE)
	{
		B_GivePlayerXP(500);
		B_Say(self,self,"$HOWINTEREST");
		VatrasDiaryBonus = TRUE;
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
	if((BookBonus_82 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_82 = TRUE;
	};
	if((PLAYER_TALENT_RUNES[SPL_Zap] == FALSE) && ((hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR)))
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,1);
		PLAYER_TALENT_RUNES[SPL_Zap] = TRUE;
		PLAYER_TALENT_RUNES_24 = TRUE;
		Snd_Play("Levelup");
		Log_CreateTopic(TOPIC_TalentRunes,LOG_NOTE);
		AI_Print("Обучен изготовлению руны - 'Молния'");
		B_LogEntry(TOPIC_TalentRunes,"Составляющие для руны 'Молния': горный хрусталь.");
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Red_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Red_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Формула изготовления руны 'Молния'");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Эта руна является собой начало магии первого круга магии Воды. Для ее изготовления необходимы прежде всего рунный камень, горный хрусталь и свиток заклинания с надлежащей формулой. Особое внимание следует обратить на качество используемых состовялющих, иначе руна не даст нужного эффекта.");
	Doc_PrintLine(nDocID,1,"");
	Doc_Show(nDocID);
};

//-------------------------рыбалка-----------------------

instance PC_ANGEL_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ANGEL_end_condition;
	information = PC_ANGEL_end_info;
	permanent = TRUE;
	description = "(...закрыть)";
};

func int PC_ANGEL_end_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_end_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	Ext_RemoveFromSlot(hero,"BIP01 R HAND");
	Npc_RemoveInvItems(hero,ItSe_FAngel,Npc_HasItems(hero,ItSe_FAngel));
	AngelIsOn = FALSE;
};

instance PC_ANGEL_CATCH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_ANGEL_CATCH_condition;
	information = PC_ANGEL_CATCH_info;
	permanent = TRUE;
	description = "Ловить рыбу.";
};

func int PC_ANGEL_CATCH_condition()
{
	if(AngelIsOn == TRUE)
	{
		return TRUE;
	};
};

func void PC_ANGEL_CATCH_info()
{
	if(FishDay != Wld_GetDay())
	{
		CountFish += 1;

	 	if(Wld_IsTime(4,0,8,0) || Wld_IsTime(19,0,21,0) || (Wld_IsRaining() == TRUE))
		{
			if(Hlp_Random(100) >= 40)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr("Вы поймали рыбу!",83,152,48);
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr("Вы ничего не поймали...",177,58,17);
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		}
		else
		{
			if(Hlp_Random(100) >= 80)
			{
				CreateInvItems(hero,ItFo_Fish,1);
				AI_PrintClr("Вы поймали рыбу!",83,152,48);
				B_Say(hero,hero,"$ITEMREADY");
			}
			else
			{
				AI_PrintClr("Вы ничего не поймали...",177,58,17);
				B_Say(hero,hero,"$NOTHINGTOGET02");
			};
		};
		if(CountFish >= 10)
		{
			FishDay = Wld_GetDay();
			CountFish = FALSE;
		};
	}
	else
	{
		CountFish = FALSE;
		AI_Print("Хватит на сегодня...");
		B_Say(hero,hero,"$IDLE_SPECIAL");
	};
};

instance ItWr_HagenLoanDocs(C_Item)
{
	name = "Королевское свидетельство";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HagenLoanDocs;
	scemeName = "MAP";
	description = name;
	text[4] = "Свидетельство о правах на земельный участок...";
	inv_animate = 1;
};


func void Use_ItWr_HagenLoanDocs()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"         Свидетельство");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Этот документ предоставляет право на владение земельным участком рядом со старой башней Атрос и прилегающей к ней рудной шахтой.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Хаген");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int CheckWantedPosterRocks;
var int CheckWantedPosterDexter;
var int CheckWantedPosterNestor;
var int CheckWantedPosterKriks;
var int CheckWantedPosterBart;
var int CheckWantedPosterSkiron;

instance ItWr_DexterWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DexterWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Декстер";
	inv_animate = 1;
};

func void Use_ItWr_DexterWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterDexter == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник по имени Декстер. Награда за живого или за мертвого - 2500 золотых монет.");
			CheckWantedPosterDexter = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник по имени Декстер. Награда за живого или за мертвого - 2500 золотых монет.");
			CheckWantedPosterDexter = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник по имени Декстер. Награда за живого или за мертвого - 2500 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_NestorWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_NestorWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Нестор 'Ганибал'";
	inv_animate = 1;
};

func void Use_ItWr_NestorWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterNestor == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Нестор, по прозвищу 'Ганибал'. Награда за живого или за мертвого - 2000 золотых монет.");
			CheckWantedPosterNestor = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Нестор, по прозвищу 'Ганибал'. Награда за живого или за мертвого - 2000 золотых монет.");
			CheckWantedPosterNestor = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник Нестор, по прозвищу 'Ганибал'. Награда за живого или за мертвого - 2000 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_KriksWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_KriksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Крикс 'Бритва'";
	inv_animate = 1;
};

func void Use_ItWr_KriksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterKriks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Крикс, по прозвищу 'Бритва'. Награда за живого или за мертвого - 1500 золотых монет.");
			CheckWantedPosterKriks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Крикс, по прозвищу 'Бритва'. Награда за живого или за мертвого - 1500 золотых монет.");
			CheckWantedPosterKriks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник Крикс, по прозвищу 'Бритва'. Награда за живого или за мертвого - 1500 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_BartWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_BartWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Барт 'Коротышка'";
	inv_animate = 1;
};

func void Use_ItWr_BartWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterBart == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Барт, по прозвищу 'Коротышка'. Награда за живого или за мертвого - 1250 золотых монет.");
			CheckWantedPosterBart = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Барт, по прозвищу 'Коротышка'. Награда за живого или за мертвого - 1250 золотых монет.");
			CheckWantedPosterBart = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник Барт, по прозвищу 'Коротышка'. Награда за живого или за мертвого - 1250 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_SkironWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_SkironWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Скирон 'Мясник'";
	inv_animate = 1;
};

func void Use_ItWr_SkironWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterSkiron == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Скирон, по прозвищу 'Мясник'. Награда за живого или за мертвого - 1000 золотых монет.");
			CheckWantedPosterSkiron = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Скирон, по прозвищу 'Мясник'. Награда за живого или за мертвого - 1000 золотых монет.");
			CheckWantedPosterSkiron = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник Скирон, по прозвищу 'Мясник'. Награда за живого или за мертвого - 1000 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_RocksWantedPoster(C_Item)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_RocksWantedPoster;
	scemeName = "MAP";
	description = name;
	text[4] = "Объявление о розыске разбойника - Рокс 'Шустрый'";
	inv_animate = 1;
};

func void Use_ItWr_RocksWantedPoster()
{
	var int nDocID;

	if(CheckWantedPosterRocks == FALSE)
	{
		if(MIS_DeadOrAlive == FALSE)
		{
			MIS_DeadOrAlive = LOG_Running;
			Log_CreateTopic(TOPIC_DeadOrAlive,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Running);
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Рокс, по прозвищу 'Шустрый'. Награда за живого или за мертвого - 750 золотых монет.");
			CheckWantedPosterRocks = TRUE;
		}
		else if(MIS_DeadOrAlive == LOG_Running)
		{
			B_LogEntry(TOPIC_DeadOrAlive,"Властями Хориниса разыскивается разбойник Рокс, по прозвищу 'Шустрый'. Награда за живого или за мертвого - 750 золотых монет.");
			CheckWantedPosterRocks = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"    Объявление о розыске");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"Властями Хориниса разыскивается разбойник Рокс, по прозвищу 'Шустрый'. Награда за живого или за мертвого - 750 золотых монет.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"           Лорд Андре");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_StonePower(C_Item)
{
	name = "Белая скала";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Белая скала";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_StonePower;
	inv_animate = 1;
};

func void Use_ItWr_StonePower()
{
	var int nDocID;
	var int rnd;

	if((MIS_SwampSecret == LOG_Running) && (StonePower == FALSE))
	{
		B_LogEntry(TOPIC_SwampSecret,"Судя по всему, магическая сущность болотной травы действительно порождена магией земли и скалы. Думаю Сатурасу будет интересно взглянуть на эту древнюю скрижаль.");
		StonePower = TRUE;
	};
	if(StonePowerRead == FALSE)
	{
		B_Say(self,self,"$HOWINTEREST");
		StonePowerRead = TRUE;

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
	if((BookBonus_158 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_158 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(StPl_nDocID,0,"Book_MayaRead_L.tga",0);
	Doc_SetPage(StPl_nDocID,1,"Book_MayaRead_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"И породила белая скала семя жизни и впитало это семя мощь скалы. Семя это дало росток, но был этот росток мягким, сила скалы же наделила его магией.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Росток, наделенный магией скалы, разделил ее поровну между своими семенами и ветер разнес их в далекие уголки мира.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Те, в свою очередь, отдали магию своим семенам и так стало на земле расти бессчетное множество ростков.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"В каждом из них сила белой скалы была меньше в бессчетное количество раз.");
	Doc_Show(nDocID);
};

instance ItWr_HighRunes(C_Item)
{
	name = "Высшие руны";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Высшие руны";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_HighRunes;
	inv_animate = 1;
};

func void Use_ItWr_HighRunes()
{
	var int nDocID;
	var int rnd;

	if(HighRunes == FALSE)
	{
		HighRunes = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_GivePlayerXP(50);
		B_Say(self,self,"$HOWINTEREST");
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
	if((BookBonus_159 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_159 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"Высшие руны");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0," ");
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для создания магических рун порой используются разные виды рунических камней. Все зависит от того, насколько могущественную руну необходимо изготовить.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Для заклинаний первого и второго круга магии используют обычные рунические камни, для третьего и четвертого круга - старшие руны, а для создания самых сложных рун пятого и шестого кругов - высшие!");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"Ксардас");
	Doc_Show(nDocID);
};

instance ItWr_DragonHigh(C_Item)
{
	name = "Сила руды";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DragonHigh;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

func void Use_ItWr_DragonHigh()
{
	var int nDocID;

	if((DragonHigh == FALSE) && (hero.guild == GIL_DJG))
	{
		DragonHigh = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_PrintLines(nDocID,0,"...я полагаю, что магическая руда - это ключ к победе! Возможно, если удасться покрыть ей свои доспехи, то они станут намного прочней. Однако не многие способны сделать такое...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Грах, драконоборец");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};