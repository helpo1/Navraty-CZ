
const int BookLp2 = 2;
const int BookLp3 = 3;
const int BookLp5 = 5;
const int BookLp8 = 8;
const int BookXP250 = 250;
const int BookXP500 = 500;
const int BookXP1000 = 1000;
const int LPMultiplier = 1000;
const int XPMultiplier = 5;

instance ITWR_ADDON_RUNEMAKING_PRM(C_Item)
{
	name = "Книга рун истинной магии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_runemaking_prm_s1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC1(C_Item)
{
	name = "Круг Воды I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (1 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC1_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC2(C_Item)
{
	name = "Книга рун Воды II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (2 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC2_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC3(C_Item)
{
	name = "Книга рун Воды III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (3 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC3_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC4(C_Item)
{
	name = "Книга рун Воды VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (4 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC4_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC5(C_Item)
{
	name = "Книга рун Воды V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (5 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC5_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC6(C_Item)
{
	name = "Книга рун Воды VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Воды (6 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC6_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC1(C_Item)
{
	name = "Книга рун Огня I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (1 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_01_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC2(C_Item)
{
	name = "Книга рун Огня II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (2 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_02_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC3(C_Item)
{
	name = "Книга рун Огня III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (3 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_03_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC4(C_Item)
{
	name = "Книга рун Огня IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (4 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_04_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC5(C_Item)
{
	name = "Книга рун Огня V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (5 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_05_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC6(C_Item)
{
	name = "Книга рун Огня VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун магов Огня (6 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_06_S1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC1(C_Item)
{
	name = "Книга рун Тьмы I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (1 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC2(C_Item)
{
	name = "Книга рун Тьмы II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (2 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC3(C_Item)
{
	name = "Книга рун Тьмы III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (3 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC4(C_Item)
{
	name = "Книга рун Тьмы IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (4 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC5(C_Item)
{
	name = "Книга рун Тьмы V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (5 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC6(C_Item)
{
	name = "Книга рун Тьмы VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун темных магов (6 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ6_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC1(C_Item)
{
	name = "Книга рун Спящего I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (1 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC2(C_Item)
{
	name = "Книга рун Спящего II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (2 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC3(C_Item)
{
	name = "Книга рун Спящего III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (3 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC4(C_Item)
{
	name = "Книга рун Спящего IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (4 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC5(C_Item)
{
	name = "Книга рун Спящего V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (5 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC6(C_Item)
{
	name = "Книга рун Спящего VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Книга рун Гуру (6 круг)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ6_s1;
	inv_animate = 1;
};

instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[4] = "Записка из таверны в лагере бандитов...";
	inv_animate = 1;
};

func void Use_Hinweis_02()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Парни!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лу пропал в болотах. Вероятно, его съели болотные акулы. Но что еще хуже - ключ от двери пропал вместе с ним. Кто найдет его, сможет забрать вещи Лу.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Снаф");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Booze(C_Item)
{
	name = "Рецепт изготовления чистого спирта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Booze;
	scemeName = "MAP";
	description = "Рецепт изготовления чистого спирта";
	text[4] = "Способ изготовления чистого спирта из шнапса...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Booze()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholBooze == FALSE)
		{
			MakePureAlcoholBooze = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Чистый спирт'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для изготовления чистого спирта из шнапса необходимо две порции самого шнапса. После чего их необходимо дистиллировать на алхимическом столе.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление чистого спирта:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходимо иметь под рукой две порции шнапса. После чего их необходимо дистиллировать на алхимическом столе.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Health_04(C_Item)
{
	name = "Рецепт эликсира чистой жизненной энергии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Рецепт лечебного зелья";
	text[3] = "Способ изготовления эликсира чистой жизненной энергии...";
	text[4] = "Необходимо знание рецепта лечебного эликсира...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Heilrezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_04] != TRUE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_Health_04] = TRUE;
			PLAYER_TALENT_ALCHEMY_14 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Эликсир чистой жизненной энергии'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для создания 'Эликсира чистой жизненной энергии' необходимо иметь чистый спирт, луговой горец, три лечебные эссенции и лист серафиса.");
		};
	};
	if((BookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_01 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание лечебного зелья:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим чистый спирт, один луговой горец, три лечебные эссенции и лист серафиса. Перемешать и варить согласно рецепту лечебного эликсира.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Это зелье может создать только алхимик, знающий рецепт лечебного эликсира.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Рецепт эликсира чистой магической энергии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Рецепт зелья маны";
	text[3] = "Способ изготовления эликсира чистой магической энергии...";
	text[4] = "Необходимо знание рецепта эликсира маны...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Manarezept_04()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_04] != TRUE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_Mana_04] = TRUE;
			PLAYER_TALENT_ALCHEMY_13 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Эликсир чистой магической энергии'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для создания 'Эликсира чистой магической энергии' необходимо иметь чистый спирт, луговой горец, три эссенции маны и лист серафиса.");
		};
		if((BookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_02 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Создание зелья маны:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходим чистый спирт, один луговой горец, три эссенции маны и лист серафиса. Перемешать и варить согласно рецепту эликсира маны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Это зелье может создать только алхимик, знающий рецепт эликсира маны.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Grog(C_Item)
{
	name = "Рецепт изготовления чистого спирта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Grog;
	scemeName = "MAP";
	description = "Рецепт изготовления чистого спирта";
	text[4] = "Способ изготовления чистого спирта из грога...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Grog()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholGrog == FALSE)
		{
			MakePureAlcoholGrog = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Чистый спирт из грога'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для изготовления чистого спирта из грога необходимо две порции самого грога. После чего их необходимо дистиллировать на алхимическом столе.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление чистого спирта:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходимо иметь под рукой две порции грога. После чего их необходимо дистиллировать на алхимическом столе.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Rom(C_Item)
{
	name = "Рецепт изготовления чистого спирта";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Rom;
	scemeName = "MAP";
	description = "Рецепт изготовления чистого спирта";
	text[4] = "Способ изготовления чистого спирта из рома...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Alcohol_Rom()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MakePureAlcoholRom == FALSE)
		{
			MakePureAlcoholRom = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Чистый спирт из рома'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для изготовления чистого спирта из рома необходимо две порции самого рома. После чего их необходимо дистиллировать на алхимическом столе.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление чистого спирта:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходимо иметь под рукой две порции рома. После чего их необходимо дистиллировать на алхимическом столе.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "Важное сообщение";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Висело на одной из хибар в болотах...";
	inv_animate = 1;
};


func void Use_Hinweis_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Парни, в этих сундуках находится неприкосновенный запас! Он предназначен ДЛЯ ВСЕХ. Но воспользоваться им можно только в случае крайней необходимости: в случае войны, нападения и в разумных пределах. Надеюсь, все будут придерживаться этого правила!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Флетчер");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Записка, найденая на теле рыбака Вильяма...";
	inv_animate = 1;
};


func void Use_William_01()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Вильям, в полнолуние я отвлеку стражу. Постарайся выбраться отсюда, но будь осторожен! Если ты пойдешь по дороге, ты сможешь выйти из болот. Лагерь пиратов находится по другую сторону долины на западе. Оттуда ты сможешь вернуться домой на корабле.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"P.S. Желаю удачи!");
	Doc_Show(nDocID);
};


instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[3] = "Рецепт эликсира изменения сознания...";
	text[4] = "Это зелье помогает восстановить память...";
	inv_animate = 1;
};


func void Use_MCELIXIER_01()
{
	var int nDocID;
	var int rnd;

	if(Knows_MCELIXIER == FALSE)
	{
		TalentCount_Alchemy += 1;
		Knows_MCELIXIER = TRUE;
		B_GivePlayerXP(100);
		AI_Print("Изучен алхимический рецепт - 'Эликсир изменения сознания'");
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
	if((BookBonus_03 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_03 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Эликсир изменения сознания:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Для создания этого эликсира необходим секрет из жал двух кровяных мух. К нему нужно добавить один экстракт маны и одну лечебную эссенцию. Перемешать, вскипятить и добавить красный жгучий перец.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Сальная записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Эта записка найдена в кармане Ангуса...";
	inv_animate = 1;
};


func void Use_Pirates_01()
{
	var int nDocID;
	Read_JuansText = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Пираты, получите последнюю посылку, предназначенную для нас, а затем принесите ее в вашу пещеру. Я встречу вас там и заплачу за эту посылку двойную цену!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Том");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Записка Фортуно";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Эта записка лежала в сундуке Фортуно...";
	inv_animate = 1;
};

func void Use_Joint_Rezept_01()
{
	var int nDocID;

	if(Green_Extrem == FALSE)
	{
		RankPoints = RankPoints + 1;
		Green_Extrem = TRUE;
		Log_CreateTopic(TOPIC_TalentHerb,LOG_NOTE);
		B_LogEntry(TOPIC_TalentHerb,"Чтобы создать 'Зеленого послушника' необходимы два стебля болотной травы и луговой горец.");
	};
	if((BookBonus_04 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_04 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Косяки здесь довольно хороши, но в болотном лагере они получались все же лучше. Если я возьму эссенцию двух болотных трав и добавлю луговой горец, получится косяк с эффектом зеленого послушника. Зеленый послушник помогает от любой боли и просветляет разум.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Рецепт 'Молота Лу'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[4] = "Рецепт для приготовления 'Молота Лу'...";
	inv_animate = 1;
};


func void UseLouRezept()
{
	var int nDocID;

	if(Knows_LousHammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_LousHammer = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Молот Лу'");
		B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать напиток 'Молот Лу' необходимо иметь болотную траву, бутылку рома, зуб болотожора и две репы.");
	};
	if((BookBonus_05 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_05 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Рецепт Молота Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите бутылку воды, две репы и немного болотной травы. Добавьте перемолотый зуб болотожора. Поместите все в бутылку, добавьте рома и вскипятите.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Удачи!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Рецепт двойного 'Молота Лу'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[4] = "Рецепт для приготовления двойного 'Молота Лу'...";
	inv_animate = 1;
};


func void UseLouRezept2()
{
	var int nDocID;

	if(Knows_Schlafhammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_Schlafhammer = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Молот Лу' с двойной порцией рома");
		B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать напиток 'Молот Лу' с двойной порцией рома необходимо иметь болотную траву, две бутылки рома, зуб болотожора и две репы.");
	};
	if((BookBonus_06 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_06 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Двойной Молот Лу");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Возьмите Молот Лу и перегоните его еще раз. Этот напиток способен приготовить только очень опытный винокур. Если за это возьмется дилетант, он рискует ослепнуть и даже лишиться жизни.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Рецепт 'Быстрая селедка'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[4] = "Рецепт приготовления 'Быстрой селедки'...";
	inv_animate = 1;
};


func void UseRezeptPiratentod()
{
	var int nDocID;

	if(Knows_SchnellerHering == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_SchnellerHering  = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Быстрая селедка'");
		B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать напиток 'Быстрая селедка' жизни необходимо иметь рыбу, ром и траву глорха.");
	};
	if((BookBonus_07 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_07 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Быстрая селедка");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Это пойло для настоящих мужчин! Как всегда, необходима бутылка воды. Добавьте немного рома и свежую рыбу. Как только жидкость станет желтой, выньте рыбу и добавьте пучок свежесорванной травы глорха.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Осторожно! Это пойло обладает очень сильным эффектом.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Клочок бумаги";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	inv_animate = 1;
};

instance ItWr_Addon_AxtAnleitung(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[4] = "Инструкция для изготовления легкого острого топора...";
	inv_animate = 1;
};

func void UseAxtAnleitung()
{
	var int nDocID;
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SMITH) >= 1)
	{
		Knows_Banditenaxt = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Бандитский топор");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот топор может выковать любой, знакомый с основами кузнечного дела. Необходимы два куска раскаленной сырой стали. Один кусок руды и три зуба волка, глорха или подобного им зверя. Перекуйте руду и зубы вместе со сталью на наковальне. Такой топор очень легок и наносит значительный урон!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_Addon_SUMMONANCIENTGHOST(C_Item)
{
	name = "Вызов 'Куарходрона'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[4] = "С помощью этого свитка можно вызвать Куарходрона...";
	inv_animate = 1;
};


func void UseSummonAncientGhost()
{
	if(SC_SummonedAncientGhost == FALSE)
	{
		B_Say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_ANCIENTGHOST") < 1000)
		{
			Wld_InsertNpc(NONE_ADDON_111_Quarhodron,"ADW_ANCIENTGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",NONE_ADDON_111_Quarhodron,NONE_ADDON_111_Quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SummonedAncientGhost = TRUE;
		}
		else
		{
			B_Say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ITWR_MAP_ADDONWORLD_1(C_Item)
{
	name = "Карта долины Зодчих";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_AddonWorld;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_AddonWorld()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(Document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document,-47783,36300,43949,-32300);
	Doc_Show(Document);
};

instance ITWR_MAGICDEFENCE_02(C_Item)
{
	name = "Рецепт эликсира защиты от магии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_magdef;
	scemeName = "MAP";
	description = "Рецепт эликсира защиты от магии";
	text[4] = "Способ изготовления эликсира защиты от магии...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_magdef()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWMAGDEF == FALSE)
		{
			KNOWMAGDEF = TRUE;
			Snd_Play("LevelUP");
			RankPoints = RankPoints + 1;
			AI_Print("Изучен алхимический рецепт - 'Эликсир защиты от магии'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать 'Эликсир защиты от магии' понадобятся чистый спирт, двадцать пять мясных грибов, шнапс и луговой горец.");
		};
		if((BookBonus_08 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_08 = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление эликсира:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, луговой горец, шнапс и двадцать пять мясных грибов. Грибы мелко растолочь, залить шнапсом и добавить луговой горец. Греть на слабом огне десять минут, затем охладить.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_PERMINTELLECT(C_Item)
{
	name = "Рецепт эликсира разума";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permint;
	scemeName = "MAP";
	description = "Рецепт эликсира разума";
	text[4] = "Способ изготовления эликсира разума из голов богомолов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_permint()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWPERMINT == FALSE)
		{
			KNOWPERMINT = TRUE;
			Snd_Play("LevelUP");
			RankPoints = RankPoints + 1;
			AI_Print("Изучен алхимический рецепт - 'Эликсир разума'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать 'Эликсир разума' понадобятся чистый спирт, десять голов богомола, болотная трава и луговой горец.");
		};
		if((BookBonus_12 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_12 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление эликсира:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, луговой горец, болотную траву и десять голов богомола. Разварить головы, отцедить жидкость и смешать с травой. Греть на медленном огне до упаривания в пять раз. Принимать охлажденным.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_SPEED_03(C_Item)
{
	name = "Рецепт напитка ускорения";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_speed_03;
	scemeName = "MAP";
	description = "Рецепт 'Черный глорх'";
	text[4] = "Способ изготовления напитка ускорения из печени черного глорха...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_speed_03()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWSPEED3 == FALSE)
		{
			KNOWSPEED3 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Черный глорх'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать напиток ускорения 'Черный глорх' понадобятся чистый спирт, печень черного глорха, грог и луговой горец.");
		};
		if((BookBonus_13 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_13 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление эликсира:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, луговой горец, грог и печень черного глорха. Печень отварить в гроге, слить бульон, смешать с травами. Упарить вдвое и выгнать по рецепту обычных напитков скорости.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_FIREDEF(C_Item)
{
	name = "Рецепт эликсира защиты от огня";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_firedef;
	scemeName = "MAP";
	description = "Рецепт эликсира защиты от огня";
	text[4] = "Способ изготовления эликсира защиты от огня из огненных языков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_firedef()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWFIREDEF == FALSE)
		{
			KNOWFIREDEF = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Эликсир защиты от огня'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать 'Эликсир защиты от огня' понадобятся чистый спирт, пять огненных языков, огненная трава и луговой горец.");
		};
		if((BookBonus_14 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_14 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление эликсира:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, луговой горец, огненную траву и пять огненных языков. Языки варить, пока бульон не станет бордовым. Отцедить жидкость, добавить травы, упарить вдвое на медленном огне. Затем резко охладить!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_FULLHEALTH_02(C_Item)
{
	name = "Рецепт лечебного напитка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_fullhealth_02;
	scemeName = "MAP";
	description = "Рецепт лечебного напитка";
	text[4] = "Способ изготовления напитка жизненной энергии из жал...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_fullhealth_02()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWFULLHEALTH2 == FALSE)
		{
			KNOWFULLHEALTH2 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Напиток жизненной энергии из жал'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать 'Напиток жизненной энергии' понадобятся чистый спирт, пять жал кровяного шершня, лечебное растение, луговой горец и лист серафиса.");
		};
		if((BookBonus_15 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_15 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление лечебного напитка:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, пять жал кровавого шершня, лечебное растение, луговой горец и лист серафиса. Жала вскрыть, отделить яд от оболочки. Растения смешать, получить сок. Оболочку залить соком, медленно добавить яд до растворения остатков растений. Отцедить и выгнать по рецепту обычного напитка.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_PROTFALL(C_Item)
{
	name = "Рецепт напитка защиты от падения";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_protfall;
	scemeName = "MAP";
	description = "Рецепт напитка защиты от падения";
	text[4] = "Способ изготовления напитка защиты от падения...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_protfall()
{
	var int nDocID;
	if(Npc_IsPlayer(self))
	{
		if(KNOWPROTFALL == FALSE)
		{
			RankPoints = RankPoints + 1;
			KNOWPROTFALL = TRUE;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Напиток защиты от падения'");
			B_LogEntry(TOPIC_TalentAlchemy,"Чтобы создать 'Напиток защиты от падения' понадобятся чистый спирт, пятнадцать крыльев кровяного шершня, сорняк и луговой горец.");
		};
		if((BookBonus_16 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_16 = TRUE;
		};
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Изготовление напитка:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Взять чистый спирт, пятнадцать крыльев кровавого шершня, сорняк и луговой горец. Крылья растолочь, настоять в соке трав, вынуть остатки крыльев. Получившуюся массу варить пять минут, постоянно помешивая. Резко охладить.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Эффект продлится не более пятнадцати секунд!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_REZEPTUREN(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Какой-то странный рецепт неизвестно чего...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_GLINTVEIN(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useglintvein;
	scemeName = "MAP";
	description = "Глинтвейн";
	text[4] = "Рецепт приготовления винного напитка";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void useglintvein()
{
	var int nDocID;

	if(KNOWSGLINTVEIN == FALSE)
	{
		RankPoints = RankPoints + 1;
		KNOWSGLINTVEIN = TRUE;
	};
	if((BookBonus_17 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_17 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Глинтвейн");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ингредиенты для приготовления Глинтвейна:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"1 бутылка вина, 1 бутылка любого крепкого самогона,");
	Doc_PrintLines(nDocID,0,"добавить немного белого рома, ложку меда и посыпать тертой огненной травой");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Пить только горячим!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Osair(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Письмо приора Осаира";
	text[4] = "Это письмо приор Осаир написал Нрозасу...";
	inv_animate = 1;
};

instance ItWr_TiamantPaperBlank(C_Item)
{
	name = "Пачка бумаги";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

instance ItWr_TiamantPaperToHaniar(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_TiamantPaperToHaniar;
	scemeName = "MAP";
	description = "Письмо приора Тиаманта";
	text[4] = "Это письмо приор Тиамант написал Ханиару Слепцу...";
	inv_animate = 1;
};

func void Use_TiamantPaperToHaniar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ханиар");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сообщаю тебе, что убийство тени по имени Хасим было необходимо во благо всех нас и выполнено по моему поручению подателем сего письма. Подробней объясню при встрече...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Тиамант");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_HaniarOrder(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarOrder;
	scemeName = "MAP";
	description = "Письмо приора Ханиара";
	inv_animate = 1;
};

func void Use_ItWr_HaniarOrder()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if(MIS_Intriges == FALSE)
		{
			MIS_Intriges = LOG_Running;
			Log_CreateTopic(TOPIC_Intriges,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Intriges,LOG_Running);
			B_LogEntry(TOPIC_Intriges,"Ханиар хочет, чтобы я разузнал отношение других приоров к приору Тиаманту. А также выяснил причину, которая заставила Тиаманта убить Хасима. Интересно! Как оказалось - внутри братства полно различных интриг...");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Разузнай, что остальные приоры братства думают о Тиаманте! Мне нужна каждая подробность, каждая деталь...Если выяснишь причину, почему Тиамант приказал убить Хасима, будет еще лучше.");
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

instance ItWr_DemonScroll(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DemonScroll;
	scemeName = "MAP";
	description = "Свиток";
	inv_animate = 1;
};

func void Use_ItWr_DemonScroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...НИР АСГАТ СУРО НАТИ ДАР КАН...");
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

instance ItWr_HaniarDemonScroll(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarDemonScroll;
	scemeName = "MAP";
	description = "Свиток Масиафа";
	inv_animate = 1;
};

func void Use_ItWr_HaniarDemonScroll()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...НИР АСГАТ СУРО НАТИ ДАР КАН...");
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

instance ItWr_Luka(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Luka;
	scemeName = "MAP";
	description = "Свиток Луки";
	inv_animate = 1;
};

func void Use_ItWr_Luka()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if((MIS_Intriges == LOG_Running) && (KnowWhyHasimDead == FALSE))
		{
			B_LogEntry(TOPIC_Intriges,"Теперь мне все стало ясно! По всей видимости, приор Тиамант решил прибрать золотой рудник в свои руки. Вряд ли это понравилось бы Ханиару и остальным приорам! Все они крайне жадные до золота люди. Что касается Хасима, то скорей всего он что-то узнал об этом, поэтому Тиамант и приказал его убить. Что я собственно и сделал... Думаю, что Ханиару не очень придутся по душе все эти новости.");
			KnowWhyHasimDead = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лука, пока повремени с Хасимом! Хотя этот ублюдок и подобрался к шахте слишком близко, у меня кажется есть тот, кто сделает всю грязную работу за нас...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Тиамант");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_OsaitToTiamant(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OsaitToTiamant;
	scemeName = "MAP";
	description = "Письмо Осаира";
	text[4] = "Это письмо приор Осаир написал Тиаманту...";
	inv_animate = 1;
};

func void Use_ItWr_OsaitToTiamant()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if((MIS_Intriges == LOG_Running) && (KnowOsairToTiamant == FALSE))
		{
			B_LogEntry(TOPIC_Intriges,"Судя из письма, Осаир крайне недоволен Тиамантом! Уверен, что Ханиару будет интересно об этом узнать.");
			KnowOsairToTiamant = TRUE;
			TiamantNeedsSlaves = TRUE;
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Тиамант! Некомпетентность твоих людей обходится мне все дороже и дороже. Если хочешь получить новую партию рабов в шахту - обеспечь для начала ее безопасность!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Осаир");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_HaniarToOsair(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarToOsair;
	scemeName = "MAP";
	description = "Письмо Ханиара";
	text[4] = "Это письмо приор Ханиар написал Осаиру...";
	inv_animate = 1;
};

func void Use_ItWr_HaniarToOsair()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Осаир! Наш брат Нрозас погиб при довольно странных обстоятельствах. Нам необходимо, подальше от лишних глаз, встретиться и обговорить с тобой некоторые моменты этой смерти.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Ханиар");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_DualFight(C_Item)
{
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DualFight;
	scemeName = "MAP";
	description = "Танец двух клинков";
	text[4] = "В этом свитке описаны приемы владения парным оружием";
	inv_animate = 1;
};

func void Use_ItWr_DualFight()
{
	var int nDocID;

	if(Npc_IsPlayer(self) && (hero.attribute[ATR_DEXTERITY] >= 150) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		if((hero.lp < 25) && (AIV_TwoHands == FALSE))
		{
			B_Say(hero,hero,"$NOLEARNNOPOINTS");
			AI_Print("Требуется не менее 25 очков опыта...");
		}
		else
		{
			if(AIV_TwoHands == FALSE)
			{
				AI_Print("Бой с парным оружием - обучен!");
				Snd_Play("LevelUP");
				AIV_TwoHands = TRUE;
				hero.lp = hero.lp - 25; 
			};

			nDocID = Doc_Create();
			Doc_SetPages(nDocID,1);
			Doc_SetPage(nDocID,0,"letters.TGA",0);
			Doc_SetFont(nDocID,0,FONT_Book_Letter);
			Doc_SetMargins(nDocID,-1,50,50,50,50,1);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Мощь атак, при использовании двух клинков, зависит исключительно от умения воина точно рассчитывать время первого и последующего удара.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Для этого стиля боя необходимо парное оружие...");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_Show(nDocID);
		};
	}
	else
	{
		B_Say(hero,hero,"$DONTREADYFORTHIS");
	};
};

instance ItWr_MoonBladesRezept(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_MoonBladesRezept;
	scemeName = "MAP";
	description = "Лунные клинки";
	text[4] = "Рецепт создания легендарного оружия...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_MoonBladesRezept()
{
	var int nDocID;
	var int rnd;

	if((KNOWS_MOONBLADES_LEFT == FALSE) && (KNOWS_MOONBLADES_RIGHT == FALSE))
	{
		B_GivePlayerXP(500);
		KNOWS_MOONBLADES_LEFT = TRUE;
		KNOWS_MOONBLADES_RIGHT = TRUE;

		if(MIS_MoonBlades == FALSE)
		{
			MIS_MoonBlades = LOG_Running;
			Log_CreateTopic(TOPIC_MoonBlades,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Running);
		};

		B_LogEntry(TOPIC_MoonBlades,"Теперь я знаю, как создать легендарное оружие - 'Лунные клинки' и что мне для этого нужно...Мне понадобится: две стальных заготовки, четыре слитка из магической руды, две черных жемчужины, десять штук угля, два ледяных кварца, две колбы ртути, два золотых слитка и два лунных камня.");

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
	if((BookBonus_18 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_18 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Лунные клинки'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"(из расчета изготовления двух клинков)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Cтальная заготовка - 2 штуки");
	Doc_PrintLine(nDocID,0,"Слиток из магической руды - 4 штуки");
	Doc_PrintLine(nDocID,0,"Черная жемчужина - 2 штуки");
	Doc_PrintLine(nDocID,0,"Уголь - 10 штук");
	Doc_PrintLine(nDocID,0,"Ледяной кварц - 2 штуки");
	Doc_PrintLine(nDocID,0,"Ртуть - 2 штуки");
	Doc_PrintLine(nDocID,0,"Лунный камень - 2 штуки");
	Doc_PrintLine(nDocID,0,"Золотой слиток - 2 штуки");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

var int cbow_once1;

instance ITWR_CBOW_T1(C_Item)
{
	name = "Арбалеты";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_cbow_t1;
	inv_animate = 1;
};

func void use_itwr_cbow_t1()
{
	var int nDocID;
	var int rnd;

	if(CBOW_ONCE1 == FALSE)
	{
		B_GivePlayerXP(250);
		DoLearnCBow = TRUE;
		CBOW_ONCE1 = TRUE;
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
	if((BookBonus_19 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_19 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Искусство стрельбы из арбалета является частью военного искусства, имеет древние корни и глубокие традиции. Это касается и техники и механики стрельбы. Стрелок должен крепко стоять на ногах и соблюдать правила обращения с арбалетом при его зарядке - иначе он рискует лишиться части своего тела или прострелить какую его часть. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Стрелы для арбалета должны быть легкими. Небольшой, трехперьевой (трехлезвийный) наконечник обеспечит большую точность, чем многосоставной тяжелый. Руководствуйтесь принципом, что лучше пробить небольшую дырочку там, куда Вы целитесь, чем огромную дыру там, куда Вы не хотели бы попасть.");
	Doc_Show(nDocID);
};


var int cbow_once2;

instance ITWR_CBOW_T2(C_Item)
{
	name = "Искусство стрельбы";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itwr_cbow_t2;
	inv_animate = 1;
};


func void use_itwr_cbow_t2()
{
	var int nDocID;
	var int rnd;

	if(CBOW_ONCE2 == FALSE)
	{
		B_GivePlayerXP(500);
		DoLearnCBow = TRUE;
		CBOW_ONCE2 = TRUE;
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
	if((BookBonus_20 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_20 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Правильное положение тела при зарядке арбалета, сила и постоянные тренировки обеспечат большую скорость зарядки. Самой распространенной ошибкой стрелка из арбалета является то, что тетива не взводится последовательно на одно и то же место и как можно ближе к ее центру.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Перекос тетивы хотя бы на полсантиметра в сторону значительно уводит стрелу от цели. Если Вам повезло обладать моделью, позволяющей во время взвода касаться руками обоих сторон направляющей для центрирования тетивы, это очень хорошо. Некоторые лучники делают две отметки на тетиве, по одной на каждой стороне от направляющей арбалета, натягивают тетиву, а затем передвигают ее вправо или влево для центрирования.");
	Doc_Show(nDocID);
};

instance ItWr_RagnarBand(C_Item)
{
	name = "Письмо бандита";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "Письмо бандита";
	text[4] = "Это письмо я нашел у одного из бандитов...";
	inv_animate = 1;
};

instance ItWr_OrcLanguage(C_Item)
{
	name = "Язык орков";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OrcLanguage;
	scemeName = "MAP";
	description = "Язык орков";
	inv_animate = 1;
};

func void Use_ItWr_OrcLanguage()
{
	var int nDocID;
	var int rnd;

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		PlayerKnowsOrcLanguage = TRUE;
		B_GivePlayerXP(100);
		B_Say(self,self,"$HOWINTEREST");
		Snd_Play("LevelUP");
		RankPoints = RankPoints + 1;
		AI_Print("Изучен язык орков...");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language,"Я владею языком орков.");

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
	if((BookBonus_21 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_21 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};

//-----------------------------------------------новые книги----------------------------------------

var int UberionBook;

instance ItWr_UberionBook(C_Item)
{
	name = "Дневник Юбериона";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "Дневник первого гуру Братства Спящего...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_UberionBook;
	inv_animate = 1;
};

func void Use_ItWr_UberionBook()
{
	var int nDocID;
	var int rnd;

	if(UberionBook == FALSE)
	{
		B_GivePlayerXP(2000);
		UberionBook = TRUE;
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
	if((BookBonus_22 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_22 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Меня постоянно мучают видения. В них мне является один и тот же образ - образ могущественного существа! Я дал ему имя - Спящий.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Я использовал растение, что растет на болотах, для приготовления особенной курительной смеси, которая способно даровать мне прозрение и немного увеличить мою магическую силу...");
	Doc_Show(nDocID);
};

instance ItWr_VatrasLee(C_Item)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Письмо Ватраса к генералу Ли...";
	inv_animate = 1;
};

instance ItWr_WaterMageDoc(C_Item)
{
	name = "Связка документов";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Большая связка старых записей магов Воды...";
	inv_animate = 1;
};

var int Read_AncientBook_01;

instance ItWr_AncientBook_01(C_Item)
{
	name = "Древний фолиант Зодчих";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2500;
	visual = "ITWR_ANCIENTBOOK.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_AncientBook_01;
	scemeName = "MAP";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_AncientBook_01()
{
	var int nDocID;

	if(Read_AncientBook_01 == FALSE)
	{
		Read_AncientBook_01 = TRUE;
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};
	if((BookBonus_23 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_23 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"ANCIENTBOOK_01.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_RezeptMist(C_Item)
{
	name = "Алхимический рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Рецепт изготовления какого-то странного зелья...";
	inv_animate = 1;
};

instance ItWr_RezeptIngridients(C_Item)
{
	name = "Записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Записка Нороласа";
	text[4] = "Список ингредиентов для зелья Нороласа...";
	on_state[0] = Use_ItWr_RezeptIngridients;
	inv_animate = 1;
};

func void Use_ItWr_RezeptIngridients()
{
	var int nDocID;

	if(KnowRezIng == FALSE)
	{
		KnowRezIng = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Состав необходимых ингредиентов:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Кость скелета");
	Doc_PrintLine(nDocID,0,"Черный жемчуг");
	Doc_PrintLine(nDocID,0,"Мертвая плоть");
	Doc_PrintLine(nDocID,0,"Яйцо ползуна");
	Doc_PrintLine(nDocID,0,"Сердце демона");
	Doc_PrintLine(nDocID,0,"Прах некроманта");
	Doc_PrintLine(nDocID,0,"Черный клевер");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};


instance ItWr_UrKarrasLetter(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Послание Ур-Карраса";
	text[4] = "Письмо Ур-Карраса к вождю клана Высокой Скалы...";
	inv_animate = 1;
};


instance ItWr_CassiaLetter(C_Item)
{
	name = "Список подозреваемых";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Список подозреваемых";
	text[4] = "Список подозреваемых в воровстве...";
	on_state[0] = Use_ItWr_CassiaLetter;
	inv_animate = 1;
};

func void Use_ItWr_CassiaLetter()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходимо проверить следующих людей:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Халвор");
	Doc_PrintLine(nDocID,0,"Нагур");
	Doc_PrintLine(nDocID,0,"Кардиф");
	Doc_PrintLine(nDocID,0,"Мо");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Надо выбить из них информацию касательно гильдии воров Хориниса...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fregarah(C_Item)
{
	name = "Записи Ксардаса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_ItWr_Fregarah;
	inv_animate = 1;
};

func void Use_ItWr_Fregarah()
{
	var int nDocID;
	var int rnd;

	if(FregarahSekret == FALSE)
	{
		B_GivePlayerXP(500);
		FregarahSekret = TRUE;
		Snd_Play("Levelup");
		B_LogEntry(TOPIC_XRANFREG,"Из дневника Ксардаса я узнал, что каменный гигант охранявший вход в тот храм, возможно как-то связан с событиями, развернувшимися несколько тысячелетий назад, когда Белиар убил своего брата Стонноса, четвертого божества этого мира...Теперь мне нужно отыскать какие-либо свидетельства, описывающие все эти события. Вот только где их искать?");
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
	if((BookBonus_145 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_145 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Годами я задавался одним и тем же вопросом - от куда тогда взялось это существо? Глаза на произошедшее открыли мне Хранители, поведав о Стонносе, четвертом боге этого мира, которого убил его же брат - Белиар! Я уверен, что появление того существа в этом мире, как-то связано с этими событиями.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Подобной мощи существа редко являются в мир, проявляя себя только в периоды великих потрясений. Скрытая в них невероятная сила превращает обычный предмет в артефакт, обладающий поистине выдающимися свойствами.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_01(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том I";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_01;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_01()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr01 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr01 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");
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
	if((BookBonus_146 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_146 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Четверо божественных братьев оказались слишком сильны, несмотря на разногласия, возникающие из-за их природы. Гордый Иннос, амбициозный Белиар, сосредоточенный Аданос и увлеченный Стонос. Пока они играют в мире, наши возможности ограничены Договором.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Три лучше, чем четыре. И у каждого достоинства есть свой изъян: самовлюбленный Иннос, завистливый Белиар, безразличный Аданос и жертвенный Стонос. Тот, кто проникает во тьму Скалы, вторгается во Тьму Белиара. Как просто посеять зерна сомнения и взрастить ростки ненависти, замешанной на зависти. Главное – осторожность!");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_02(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том II";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_02;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_02()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr02 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr02 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");		};
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
	if((BookBonus_147 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_147 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"План подходит к кульминации. Но зависть - плохой союзник и еще худший советник. Пока Иннос и Аданос отвлеклись, Белиар осуществил тайный план перехвата власти над земною тьмой и погубил попытавшегося помешать брата.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Теперь, когда могущественное божество пало, остается только изолировать ослабленное ментальное средоточие, вот только где найти подходящий сосуд, способный удержать подобную мощь?...");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_03(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том III";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_03;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_03()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr03 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr03 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");		};
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
	if((BookBonus_148 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_148 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Воззвав к Договору, нам удалось продвинуться в собственном плане. Чтобы сохранить от распада ментальное средоточие Стоноса, мы заключим его ослабленную мощь в плоть могущественного создания.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Божественные братья теперь не доверяют друг другу, так что нейтральный сосуд будет под присмотром каждого.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_04(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том IV";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_04;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_04()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr04 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr04 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");		};
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
	if((BookBonus_149 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_149 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Что-то пошло не так и магический всплеск невероятной силы повредил оболочку. Какие же мы глупцы! Надо решить - или пробудить ослабленное средоточие Стоноса или разрушить его окончательно.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Стоило ему на мгновение прийти в себя, как его ментальная сущность вырвалась за пределы оболочки, попутно впитывая в себя энергию его стихии. Он восстанавливает былую силу, я чувствую это даже сейчас.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_05(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том V";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_05;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_05()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr05 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr05 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");		};
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
	if((BookBonus_150 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_150 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Магическая руда – есть ничто иное, как окаменевшая кровь Стоноса. Но расплавленные недра – вот истинная сила бога Скалы! Теперь мы уже ничего не сможет с этим поделать.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вновь зародившееся создание не сам Стоннос, но часть его самого. Нам удалось убедить его служить нам и теперь оно там, где божественные братья не смогут использовать его в своих интересах.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_06(C_Item)
{
	name = "Хроники Стонноса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Хроники Стоноса - том VI";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_06;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_06()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr06 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr06 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Теперь я знаю все, что мне нужно! То существо, с которым столкнулись Пирокар и Ксардас, было ни что иное, как сам Стоннос. Точнее часть его самого. Это существо бессмертно и только кровь бога породившего его, способна уничтожить это создание. Судя по всему, обычная магическая руда - это и есть та сама кровь Стонноса! Мне вспомнилась история с Уризелем. Возможно это сработает вновь. Вот только, где мне найти столько руды?! И главное, какой предмет использовать для этих целей. Вопросы, вопросы, вопросы...");		};
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
	if((BookBonus_151 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_151 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Его сила и могущество впечатляют! Однако нам надо придумать способ уничтожить его на тот случай, если это понадобится. Однако только сила его сущности способна сразить его!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Кровь его мертвого бога - вот что нам нужно! Магическая энергия, заключенная в ней, сделает свое дело, когда придет время. А оно придет и довольно скоро... ");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_07(C_Item)
{
	name = "Последний вздох";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Последний вздох";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Stonnos_07;
	inv_animate = 1;
};

func void Use_ItWr_Stonnos_07()
{
	var int nDocID;
	var int rnd;

	if(StonnosHr07 == FALSE)
	{
		B_GivePlayerXP(500);
		StonnosHr07 = TRUE;
		Snd_Play("Levelup");
		B_Say(self,self,"$HOWINTEREST");
		AI_Print(PRINT_READGODSAWAY);
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
	if((BookBonus_152 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_152 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Судьба этого мира предрешена! Он будет уничтожен ветрами Хаоса и на его месте, вы возведем новый храм. Он будет прекрасен, как когда то был прекрасен и этот мир.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Их единственная надежда на спасение в руках того, кого боги нарекли своим Избранным! Только он способен доказать нам, что мы все ошиблись, приняв подобное решение, и этот мир все еще заслуживает быть прощенным.");
	Doc_Show(nDocID);
};

instance ItWr_Alchemy_01(C_Item)
{
	name = "Происхождение алхимии";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Происхождение алхимии";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Alchemy_01;
	inv_animate = 1;
};

func void Use_ItWr_Alchemy_01()
{
	var int nDocID;
	var int rnd;

	if(Alchemy_01 == FALSE)
	{
		B_GivePlayerXP(250);
		Alchemy_01 = TRUE;
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
	if((BookBonus_153 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_153 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мудрые научились извлекать магию из трав и частей преобразованных монстров. С тех пор алхимики ищут применения новым средствам и улучшают старые зелья. Те же, кто посягнул на собранное Белиаром, называются Темными алхимиками. В своих зельях они используют кости, черепа и эктоплазму магически сильных существ.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Эликсиры по-разному действуют на бойцов и магов. В результате их тренировок организм становится чувствительным к одним и приобретает иммунитет к другим алхимическим составам. Для максимального эффекта нужно принимать совместимый с личными тренировками эликсир.");
	Doc_Show(nDocID);
};

instance ItWr_Druid_01(C_Item)
{
	name = "Друиды";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Друиды";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItWr_Druid_01;
	inv_animate = 1;
};

func void Use_ItWr_Druid_01()
{
	var int nDocID;
	var int rnd;

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

instance ItWr_Sigil(C_Item)
{
	name = "Старый свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Sigil;
	scemeName = "MAP";
	description = "Рунный сигиль";
	text[4] = "Способ изготовления 'Серебряного рунного сигиля'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Sigil()
{
	var int nDocID;
	var int rnd;

	if(Npc_IsPlayer(self))
	{
		if(SigilKnow == FALSE)
		{
			SigilKnow = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен рецепт ковки - 'Серебряный рунный сигиль'");
			B_LogEntry(TOPIC_TalentSmith,"Для создания 'Cеребрянного рунного сигиля' необходимо иметь две унции ртути, три железных слитка, два куска черной руды, лунный камень, две черные жемчужины, смолу, четыре куска серы, десять кусков рунного камня, магический свиток заклинания 'Уничтожение нежити' и четыре куска ледяного кварц.");
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- Рунный сигиль -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот меч одно из лучших оружий, которое когда-либо создавал человек! Он способен не только спокойно разрезать врагов на мелкие куски, но наносить урон бестелесным создания, навроде призраков.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Однако выковать такое оружие способен только настоящий мастер кузнечного дела, ибо рецепт его изготовления невероятно сложен.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Unpoison(C_Item)
{
	name = "Старый свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Unpoison;
	scemeName = "MAP";
	description = "Сопротивление ядам";
	text[4] = "Способ сопротивление ядам...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Unpoison()
{
	var int nDocID;
	var int rnd;

	if(Npc_IsPlayer(self))
	{
		if(ResistPoisonKnow == FALSE)
		{
			ResistPoisonKnow = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучено: сопротивление яду");
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

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- Яды -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Яд - дело плохое! Особенно если он попал в организм. Надо позаботиться о том, чтобы организм как можно быстрее разложил яд.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Необходимо непрерывно двигаться и больше потеть! Тогда отравление ядом не причинит особого вреда.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance Itar_Pal_Cloack(C_Item)
{
	name = "Крылья Авабюл";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	value = 1;
	visual = "Pal_Flaga.MMS";
	material = MAT_LEATHER;
	description = "Крылья Авабюл";
	inv_animate = 1;
};

instance ItWr_ArmorDocs(C_Item)
{
	name = "Старые чертежи";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_ArmorDocs;
	scemeName = "MAP";
	description = "Старые чертежи";
	text[4] = "Похожи на чертежи для изготовления каких-то доспехов...";
	inv_animate = 1;
};

func void Use_ItWr_ArmorDocs()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ARM.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_MiltenSummon(C_Item)
{
	name = "Свиток Мильтена";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};
