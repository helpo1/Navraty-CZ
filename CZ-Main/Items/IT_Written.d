
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
	name = "Runy pravé magie";
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
	name = "Runy mágů Vody I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC1_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC2(C_Item)
{
	name = "Runy mágů Vody II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (2. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC2_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC3(C_Item)
{
	name = "Runy mágů Vody III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (3. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC3_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC4(C_Item)
{
	name = "Runy mágů Vody IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (4. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC4_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC5(C_Item)
{
	name = "Runy mágů Vody V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC5_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDW_CIRC6(C_Item)
{
	name = "Runy mágů Vody VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Vody (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Runemaking_KDW_CIRC6_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC1(C_Item)
{
	name = "Runy mágů Ohně I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_01_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC2(C_Item)
{
	name = "Runy mágů Ohně II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (2. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_02_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC3(C_Item)
{
	name = "Runy mágů Ohně III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (3. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_03_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC4(C_Item)
{
	name = "Runy mágů Ohně IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (4. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_04_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC5(C_Item)
{
	name = "Runy mágů Ohně V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_05_S1;
	inv_animate = 1;
};

instance ITWR_Addon_Runemaking_KDF_CIRC6(C_Item)
{
	name = "Runy mágů Ohně VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Ohně (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Bookstand_Kreise_06_S1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC1(C_Item)
{
	name = "Runy mágů Temnoty I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC2(C_Item)
{
	name = "Runy mágů Temnoty II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (2. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC3(C_Item)
{
	name = "Runy mágů Temnoty III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (3. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC4(C_Item)
{
	name = "Runy mágů Temnoty IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (4. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC5(C_Item)
{
	name = "Runy mágů Temnoty V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_DMT_CIRC6(C_Item)
{
	name = "Runy mágů Temnoty VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run mágů Temnoty (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_dmt_circ6_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC1(C_Item)
{
	name = "Runy magie Guru I";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (1. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ1_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC2(C_Item)
{
	name = "Runy magie Guru II";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (2. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ2_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC3(C_Item)
{
	name = "Runy magie Guru III";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (3. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ3_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC4(C_Item)
{
	name = "Runy magie Guru IV";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (4. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ4_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC5(C_Item)
{
	name = "Runy magie Guru V";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (5. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ5_s1;
	inv_animate = 1;
};

instance ITWR_ADDON_RUNEMAKING_GUR_CIRC6(C_Item)
{
	name = "Runy magie Guru VI";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Uniq_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Kniha run magie Guru (6. kruh)";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_bookstand_gur_circ6_s1;
	inv_animate = 1;
};

instance ITWr_Addon_Hinweis_02(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_02;
	scemeName = "MAP";
	description = name;
	text[4] = "Zpráva z hospody v táboře banditů...";
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
	Doc_PrintLine(nDocID,0,"Hele chlapi!");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lou zmizel v bažinách. Pravděpodobně ho sežrali močáloví žraloci. Co je ale horší - klíč ode dvěří se ztatil s ním. Kdo ho najde, může si nechat jeho věci.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Snaf");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Booze(C_Item)
{
	name = "Recept na přípravu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Booze;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z kořalky...";
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
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z kořalky)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z kořalky): 2x kořalka.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je důležité mít dvě láhve kořalky. Ty je poté nutné vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Health_04(C_Item)
{
	name = "Recept na léčivý lektvar";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Heilrezept_04;
	scemeName = "MAP";
	description = "Recept na elixír čisté životní energie";
	text[3] = "Způsob přípravy elixíru čisté životní energie...";
	text[4] = "Je potřeba znalost receptu léčivých elixírů...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír čisté hojivé síly'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ČISTÉ HOJIVÉ SÍLY: čistý alkohol, luční pohanka, 3x esence hojivé síly a modrý bez.");
		};
	};
	if((BookBonus_01 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_01 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava elixíru čisté životní energie:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, esence hojivé síly a modrý bez. Zamícháme a vaříme dle receptu přípravy hojivého elixíru.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Tenhle lektvar může namíchat pouze ten alchymista, který zná recept na výrobu elixíru hojivé síly.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Mana_04(C_Item)
{
	name = "Recept na elixír many";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Manarezept_04;
	scemeName = "MAP";
	description = "Recept na elixír many";
	text[3] = "Způsob připravy elixíru many...";
	text[4] = "Je potřeba znalost lektvarů many...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír čisté many'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ČISTÉ MANY: čistý alkohol, luční pohanka, 3x esence many a modrý bez.");
		};
		if((BookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava elixíru many:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, esence many a modrý bez. Micháme a vaříme podle receptu elixíru many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Tenhle lektvar může namíchat pouze ten alchymista, který zná recept na výrobu elixíru many.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Grog(C_Item)
{
	name = "Recept na přípravu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Grog;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z grogu...";
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
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z grogu)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z grogu): 2x grog.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Výroba čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na přípravu jsou potřeba dva grogy. Poté je nutné je vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Alcohol_Rom(C_Item)
{
	name = "Recept na výrobu čistého alkoholu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Alcohol_Rom;
	scemeName = "MAP";
	description = "Recept na přípravu čistého alkoholu";
	text[4] = "Způsob přípravy čistého alkoholu z rumu...";
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
			AI_Print("Naučeno: Alchymie - 'Čistý alkohol (z rumu)'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČISTÝ ALKOHOL (z rumu): 2x rum.");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Příprava čistého alkoholu:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je důležité mít po ruce dva rumy. Poté je nutné je vydestilovat u alchymistického stolu.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Hinweis_01(C_Item)
{
	name = "Důležitá zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Hinweis_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Visela na jedné z chatrčí v bažině...";
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
	Doc_PrintLines(nDocID,0,"Chlapi, v těchto truhlách můžete najít železné zásoby! Jsou pro VŠECHNY. Mějte však na mysli, že je můžete brát jen v případu nouze: v čase války, napadení a hlavně berte v rozumných dávkách. Doufám, že se všichni budou držet tohoto pravidla a bude to fungovat!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Fletcher");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_William_01(C_Item)
{
	name = "Vzkaz";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_William_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tohle měl u sebe rybář William...";
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
	Doc_PrintLines(nDocID,0,"Williame, při úplňku odlákám stráže. Pokus se odtud vypadnout, ale buď opatrný! Pokud se budeš držet při hlavní cestě, dostaneš se z bažiny. Tábor pirátů se nachází na druhé straně údolí, až na západě. Na lodi se z tama můžeš vydat domů.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"P.S. Hodně štěstí!");
	Doc_Show(nDocID);
};


instance ITWr_Addon_MCELIXIER_01(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MCELIXIER_01;
	scemeName = "MAP";
	description = name;
	text[3] = "Recept na lektvar proměny mysli...";
	text[4] = "Tento lektvar pomůže oživit ztacené vzpomínky...";
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
		AI_Print("Naučeno: Alchymie - 'Lektvar proměny mysli'");
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
		AI_Print("Inteligence + 1");
		BookBonus_03 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lektvar proměny mysli:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Na přípravu tohoto lektvaru jsou třeba žihadla ze dvou krvavých much. K nim je potřeba přidat jeden extrakt many a jednu esenci hojivé síly. Promíchat, povařit a přidat jeden sáček červeného pepře.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Pirates_01(C_Item)
{
	name = "Umaštěná zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Pirates_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tento vzkaz měl Angus v kapse...";
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
	Doc_PrintLines(nDocID,0,"Piráti, získejte tu poslední zásilku, která je určená pro nás, a doneste ji do vaší jeskyně. Setkáme se tam a zaplatím vám za ní dvakrát tolik!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"				- Tom");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Joint_01(C_Item)
{
	name = "Fortunův zápisek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Joint_Rezept_01;
	scemeName = "MAP";
	description = name;
	text[4] = "Tento vzkaz byl ve Fortunově truhle...";
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
		B_LogEntry(TOPIC_TalentHerb,"Ingredience pro ubalení ZELENÉHO NOVICE: 2x tráva z bažin a luční pohanka.");
	};
	if((BookBonus_04 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_04 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Špeky co tu balí jsou dost dobré, ale v táboře v bažinách to posunuli ještě dál. Pokud vezmu esenci ze dvou lodyh trávy z bažin a přidám k nim jednu luční pohanku, je možné ubalit špeka se stejným efektem zeleného novice. Zelený novic napomáha tišit bolest a rozjasňuje mysl.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Lou_Rezept(C_Item)
{
	name = "Recept na 'Louovo kladivo'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Louova kladiva'...";
	inv_animate = 1;
};


func void UseLouRezept()
{
	var int nDocID;

	if(Knows_LousHammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_LousHammer = TRUE;
		AI_Print("Naučeno: Alchymie - 'Louovo kladivo'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LOUOVO KLADIVO: tráva z bažin, rum, zub močálového žraloka a 2x tuřín.");
	};
	if((BookBonus_05 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_05 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Recept na Louovo kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi láhev vody, dva tuříny a trochu trávy z bažin. Přidej nadrcený zub močálového žraloka. Dej vše do láhve, přidej rum a vař.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Hodně štěstí!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWr_Addon_Lou_Rezept2(C_Item)
{
	name = "Recept na 'Dvojité Louovo kladivo'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLouRezept2;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Dvojitého Louova kladiva'...";
	inv_animate = 1;
};


func void UseLouRezept2()
{
	var int nDocID;

	if(Knows_Schlafhammer == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_Schlafhammer = TRUE;
		AI_Print("Naučeno: Alchymie - 'Dvojité Louovo kladivo'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro DVOJITÉ LOUOVO KLADIVO: tráva z bažin, 2x rum, zub močálového žraloka a 2x tuřín.");
	};
	if((BookBonus_06 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_06 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Dvojité Louovo kladivo");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi Louovo kladivo a znovu ho vydestiluj. Tento nápoj jsou schopní připravit jen ti nejzkušenější páleničáři. Pokusí-li se o to nezkušený amatér, riskuje slepotu nebo rovnou dokonce smrt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWr_Addon_Piratentod(C_Item)
{
	name = "Recept na 'Rychlý sleď'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseRezeptPiratentod;
	scemeName = "MAP";
	description = name;
	text[4] = "Recept na přípravu 'Rychlého sledě'...";
	inv_animate = 1;
};


func void UseRezeptPiratentod()
{
	var int nDocID;

	if(Knows_SchnellerHering == FALSE)
	{
		RankPoints = RankPoints + 1;
		Knows_SchnellerHering  = TRUE;
		AI_Print("Naučeno: Alchymie - 'Rychlý sleď'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro RYCHLÉHO SLEDĚ: ryba, rum a chňapavčí býlí.");
	};
	if((BookBonus_07 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_07 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Rychlý sleď");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je to dryák pro pořádné chlapy! Jako vždy je potřeba láhev vody. Přidáme trochu rumu a jednu čerstvou rybu. Jakmile se tekutina zbarví do žluta, vyndáme rybu a přidáme svazek čerstvého chňapavčího býlí.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Opatrně! Tento dryák má velmi silný efekt.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance Fakescroll_Addon(C_Item)
{
	name = "Kus papíru";
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
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseAxtAnleitung;
	scemeName = "MAP";
	description = name;
	text[4] = "Instrukce jak zhotovit lehkou a ostrou sekeru...";
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
	Doc_PrintLine(nDocID,0,"Sekyra banditů");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tuto sekyru může ukovat každý, kdo je obeznámen se základy kovařiny. Na výrobu jsou potřeba dva rozpálené kusy surové oceli. Dále jeden kus rudy, tři zuby vlka, chňapavce či jiného podobného tvora. Skujte rudu, zuby a ocel na kovadlině a to pořádně. Tato sekyra je velice lehká a způsobuje značně veliké poškození!");
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
	name = "Vyvolej 'Quarhodrona'";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseSummonAncientGhost;
	scemeName = "MAP";
	description = name;
	text[4] = "S pomocí tohoto svitku můžu vyvolat Quarhodrona...";
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
	name = "Mapa údolí Stavitelů";
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
	name = "Elixír ochrany proti magii";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_magdef;
	scemeName = "MAP";
	description = "Elixír ochrany proti magii";
	text[4] = "Způsob přípravy elixíru ochrany proti magii...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír ochrany proti magii'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OCHRANY PROTI MAGII: čistý alkohol, 25x otrokův chléb, kořalka a luční pohanka.");
		};
		if((BookBonus_08 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava lektvaru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, kořalku a otrokovy chleby. Otrokovy chleby rozdrť najemno, zalej kořalkou a přidej luční pohanku. Zahřívej na mírném ohni po dobu deseti minut, potom nech ochládnout.");
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
	name = "Recept na elixír rozumu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permint;
	scemeName = "MAP";
	description = "Recept na elixír rozumu";
	text[4] = "Způsob přípravy elixíru rozumu z hlav kudlanek...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír rozumu'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ROZUMU: čistý alkohol, 10x hlava kudlanky, tráva z bažin a luční pohanka.");
		};
		if((BookBonus_12 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmi čistý alkohol, luční pohanku, trávu z bažin a deset hlav kudlanek. Povař hlavy, sceď vodu a smíchej s trávou. Zahřívej na mírném ohni a přílévej vývar, do té doby než vypaření proběhne pětkrát. Užívej vychladlé.");
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
	name = "Recept na lektvar rychlosti";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_speed_03;
	scemeName = "MAP";
	description = "Recept na 'Černý chňapavec'";
	text[4] = "Způsob přípravy napoje rychlosti z jater černého chňapavce...";
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
			AI_Print("Naučeno: Alchymie - 'Černý chňapavec'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ČERNÉHO CHŇAPAVCE: čistý alkohol, játra černého chňapavce, grog a luční pohanka.");
		};
		if((BookBonus_13 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, luční pohanku, grog a játra černého chňapavce. Játra povaříme v grogu, slijeme vývar a smícháme s bylinkama. Provaříme dvakrát a dále pokračujeme v postupu jako u běžných lektvarů rychlosti.");
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
	name = "Recept na elixír ochrany proti ohni";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_firedef;
	scemeName = "MAP";
	description = "Recept na elixír ochrany proti ohni";
	text[4] = "Způsob přípravy elixíru ochrany proti ohni z ohnivých jazyků...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír ochrany proti ohni'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OCHRANY PROTI OHNI: čistý alkohol, 5x ohnivý jazyk, ohnivé býlí a luční pohanka.");
		};
		if((BookBonus_14 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, luční pohanku, ohnivé býlí a ohnivé jazyky. Vaříme jazyky až do doby, kdy je vývar tmavě červený. Scedíme tekutinu, přidáme bylinky a dvakrát zahřejeme na mírném ohni. Poté prudce zchladíme!");
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
	name = "Recept na elixír léčivé síly";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_fullhealth_02;
	scemeName = "MAP";
	description = "Recept na elixír léčivé síly";
	text[4] = "Způsob přípravy elixíru léčivé síly z žihadel...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír hojivé síly ze žihadel'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR HOJIVÉ SÍLY ZE ŽIHADEL: čistý alkohol, 5x žihadlo krvavé mouchy, léčivá rostlina, luční pohanka a modrý bez.");
		};
		if((BookBonus_15 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava léčivého elixíru:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, žihadla krvavé mouchy, léčivou rostlinu, luční pohanku a modrý bez. Rozřízneme žihadla a získáme z nich jed. Smíchame byliny, aby pustili šťávu. Zbytky žihadel zalijeme šťávou z bylin a pomalu přidáváme jed až do rozpuštění zbytku bylin. Scedíme a dál pokračujeme v přípravě jako u běžných elixírů.");
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
	name = "Recept na elixír odolnosti";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_protfall;
	scemeName = "MAP";
	description = "Recept na elixír odolnosti";
	text[4] = "Způsob přípravy elixíru odolnosti...";
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
			AI_Print("Naučeno: Alchymie - 'Elixír ochrany proti pádu'");
			B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OCHRANY PROTI PÁDU: čistý alkohol, 15x křídla, tráva a luční pohanka.");
		};
		if((BookBonus_16 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	Doc_PrintLines(nDocID,0,"Příprava nápoje:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vezmeme čistý alkohol, křídla krvavé mouchy, trávu a luční pohanku. Křídla nadrtíme, vylouhujeme ve šťávě z bylinek a nakonec odstraníme zbytky křídel. Za neustálého míchání tuto směs povaříme pět minut. Prudce zchladíme.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Účinky nepotrvají déle než patnáct vteřin!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ITWR_REZEPTUREN(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Nějaký zvláštní recept na kdo ví co...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITWR_GLINTVEIN(C_Item)
{
	name = "Recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useglintvein;
	scemeName = "MAP";
	description = "Svařené víno";
	text[4] = "Recept na přípravu vinného nápoje";
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
		AI_Print("Inteligence + 1");
		BookBonus_17 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"Svařené víno");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Ingredience na přípravu svařeného vína:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"1 láhev vína, 1 láhev silného měsíčního svitu,");
	Doc_PrintLines(nDocID,0,"přidáme trochu bíleho rumu, lžíci medu a posypené vločkama z ohnivého býlí");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Pít pouze horké!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Osair(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = "Dopis převora Osaira";
	text[4] = "Tento dopis napsal převor Osair Nrozasovi...";
	inv_animate = 1;
};

instance ItWr_TiamantPaperBlank(C_Item)
{
	name = "Svazek papírů";
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
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_TiamantPaperToHaniar;
	scemeName = "MAP";
	description = "Dopis převora Tiamanta";
	text[4] = "Tento dopis napsal převor Tiamant Haniarovi Slepému...";
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
	Doc_PrintLine(nDocID,0,"Haniare");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Říkám ti, že zabití stína jménem Hasim bylo vykonáno pro dobro nás všech a na můj příkaz Hasima odstranil člověk, co ti doručil tento dopis. Vysvětlím a podám více detailů jak se setkáme...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Tiamant");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_HaniarOrder(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarOrder;
	scemeName = "MAP";
	description = "Dopis převora Haniara";
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
			B_LogEntry(TOPIC_Intriges,"Haniar chce, abych zjistil jaký mají ostatní převorové vztah k převoru Tiamantovi. Mám také zjistit důvod, proč Tiamant nechal zavraždit Hasima. Zajímavé! Jak to tak vypadá - tak se uvnitř bratrstva odehrává hodně intrik...");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Zjisti, co si ostatní převorové bratrstva myslí o Tiamantovi! Bude pro mě užitečná každá drobnost, každý detail... jestli zjistíš důvod, proč Tiamant nechal zabít Hasima, bude to ještě lepší.");
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
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DemonScroll;
	scemeName = "MAP";
	description = "Svitek";
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
	Doc_PrintLines(nDocID,0,"... NIR ASGAT SURO NATI DAR CAS ...");
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
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarDemonScroll;
	scemeName = "MAP";
	description = "Masyafský svitek";
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
	Doc_PrintLines(nDocID,0,"... NIR ASGAT SURO NATI DAR CAS ...");
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
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Luka;
	scemeName = "MAP";
	description = "Lukův svitek";
	inv_animate = 1;
};

func void Use_ItWr_Luka()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if((MIS_Intriges == LOG_Running) && (KnowWhyHasimDead == FALSE))
		{
			B_LogEntry(TOPIC_Intriges,"Teď už mi začíná být vše jasné! Zdá se, že převor Tiamant se rozhodl převzít vedení zlatého dolu do svých rukou. Toto by se stěží líbilo Haniarovi a ostatním převorům. Všichni jsou velice hamižní. A co se týče Hasima, nejspíš se o tom něco dověděl a tak ho Tiamant přikázal zabít. Což jsem taky vlastně udělal... Myslím, že Haniarovi se nebudou všechny tyto novinky líbit.");
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
	Doc_PrintLines(nDocID,0,"Luko, zatím vyčkej a neřeš s Hasimem nic! I když se ten bastard příblížil k dolu až moc blízko, znám někoho, kdo za nás tu špinavou práci udělá...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Tiamant");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_OsaitToTiamant(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OsaitToTiamant;
	scemeName = "MAP";
	description = "Osairův dopis";
	text[4] = "Tento dopis napsal převor Osair Tiamantovi...";
	inv_animate = 1;
};

func void Use_ItWr_OsaitToTiamant()
{
	var int nDocID;

	if(Npc_IsPlayer(self))
	{
		if((MIS_Intriges == LOG_Running) && (KnowOsairToTiamant == FALSE))
		{
			B_LogEntry(TOPIC_Intriges,"Soudě dle dopisu, Osair je s Tiamantem velice nespokojen! Jsem si jistý, že Haniara to bude velice zajímat.");
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
	Doc_PrintLines(nDocID,0,"Tiamante! Neschopnost tvojich lidí mě stojí více a více peněz. Jestli chceš aby vůbec do dolu dorazila další várka otroku - musíš jim nejprve zajistit bezpečí!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Osair");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_HaniarToOsair(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_HaniarToOsair;
	scemeName = "MAP";
	description = "Haniarův dopis";
	text[4] = "Tento dopis napsal převor Haniar Osairovi...";
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
	Doc_PrintLines(nDocID,0,"Osaire! Náš bratr Nrozas zemřel za poměrně zvláštních okolností. Musíme se setkat, dál od zvědavých očí, abychom spolu prodiskutovali poslední momenty jeho smrti...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			- Haniar");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_DualFight(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_DualFight;
	scemeName = "MAP";
	description = "Tanec dvou čepelí";
	text[4] = "V tomto svitku je popsána technika boje se dvěma zbraněmi";
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
			AI_Print("Vyžaduje nejméně 25 VB...");
		}
		else
		{
			if(AIV_TwoHands == FALSE)
			{
				AI_Print("Naučeno: Boj se dvěma zbraněmi");
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
			Doc_PrintLines(nDocID,0,"Síla útoku, při používání dvou čepelí, záleží výhradně na schopnosti válečníka přesně vypočítat vhodnou dobu prvního a následujícího útoku.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Pro tento styl boje je vyžadován pár zbraní...");
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
	description = "Měsíční čepele";
	text[4] = "Návod na výrobu legendární zbraně...";
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

		B_LogEntry(TOPIC_MoonBlades,"Teď už vím, jak vyrobit legendární zbraň - 'Měsíční čepele'... Co k tomu potřebuji: 2 surové oceli, 4 pruty z magické oceli, 2 černé perly, 10 uhlí, 2 křemeny, 2 láhve rtuti, 2 zlaté ingoty a 2 měsíční kameny.");

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
		AI_Print("Inteligence + 1");
		BookBonus_18 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Měsíční čepele'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"(Výčet věcí na zhotovení měsíčních čepelí)");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Surová ocel - 2 kusy");
	Doc_PrintLine(nDocID,0,"Pruty z magické oceli - 4 kusy");
	Doc_PrintLine(nDocID,0,"Černá perla - 2 kusy");
	Doc_PrintLine(nDocID,0,"Uhlí - 10 kusů");
	Doc_PrintLine(nDocID,0,"Křemen - 2 kusy");
	Doc_PrintLine(nDocID,0,"Rtuť - 2 kusy");
	Doc_PrintLine(nDocID,0,"Měsíční kámen - 2 kusy");
	Doc_PrintLine(nDocID,0,"Zlaté ingoty - 2 kusy");
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
	name = "Kuše";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_19 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Umění střelby z kuše je součástí válečnického umění, má starobylé kořeny a zakořeněné hluboké tradice. Toto se týká jak technik tak mechanik střelby. Střelec musí stát pevně na nohách a respektovat zásady zacházení s kuší při nabíjení - jinak riskuje ztrátu určité části těla nebo průstřel části těla.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Šipky do kuše musí být lehké. Malá, tříhrotá (třízubá) špička zajišťuje lepší přesnost spíše než velkou těžkopádnost. Princip je, že je lepší prorazit malou díru tam kam míříme, spíše než velkou díru, kde nechceme, aby šipka prošla.");
	Doc_Show(nDocID);
};


var int cbow_once2;

instance ITWR_CBOW_T2(C_Item)
{
	name = "Umění střelby";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_20 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,FONT_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Správné držení těla při nabíjení kuše, síla a neustálé zlepšování zajistí lepší rychlost nabíjení. Nejčastěšjí chyba při práci s kuší je, že tětiva nebývá natahována stále na to stejné místo a jak nejvíc je do středu možné.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Přetažení tětivy o půl centimetru do strany výrazně odvádí šipku od svého cíle. Pokud máte dostatek štěstí a dostanete se k modelu kuše, která vám dovolí dotknout se obou stran úchytu při centrování tětivy, je to jen dobře. Někteří kušníci si dělají dvě značky na tětivě a to po jedné na každé straně pažby. Poté natahují tětivu a posouvají ji doprava nebo doleva podle středu.");
	Doc_Show(nDocID);
};

instance ItWr_RagnarBand(C_Item)
{
	name = "Dopis bandity";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	description = "Dopis bandity";
	text[4] = "Našel jsem tento dopis u jednoho z banditů...";
	inv_animate = 1;
};

instance ItWr_OrcLanguage(C_Item)
{
	name = "Skřetí jazyk";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_OrcLanguage;
	scemeName = "MAP";
	description = "Skřetí jazyk";
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
		AI_Print("Naučeno: Skřetí jazyk");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language,"Mluvím skřetím jazykem.");

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_21 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_Show(nDocID);
};

//-----------------------------------------------novyye knigi----------------------------------------

var int UberionBook;

instance ItWr_UberionBook(C_Item)
{
	name = "Y'Berionův deník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = name;
	text[4] = "Deník prvního Guru Bratrstva Spáče...";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_22 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jsem neustále mučen vizemi. Vždy v nich vidím ten stejný obraz - obraz mocného stvoření! Nazval jsem ho - Spáč.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Použil jsem rostlinu, která roste v bažinách a přiravil jsem z ní speciální směs na kouření, která způsobuje osvícení a zvyšuje mou magickou moc...");
	Doc_Show(nDocID);
};

instance ItWr_VatrasLee(C_Item)
{
	name = "Dopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Dopis od Vatrase generálu Leeovi...";
	inv_animate = 1;
};

instance ItWr_WaterMageDoc(C_Item)
{
	name = "Svazek dokumentů";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Velký svazek starých záznamů mágů Vody...";
	inv_animate = 1;
};

var int Read_AncientBook_01;

instance ItWr_AncientBook_01(C_Item)
{
	name = "Starobylý rukopis Stavitelů";
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
			AI_Print("Rétorika + 1");
		};
	};
	if((BookBonus_23 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
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
	name = "Alchymistický recept";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Recept na přípravu nějakého zvláštního lektvaru...";
	inv_animate = 1;
};

instance ItWr_RezeptIngridients(C_Item)
{
	name = "Vzkaz";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Vzkaz od Norolase";
	text[4] = "Seznam ingrediencí na Norolasův lektvar...";
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
	Doc_PrintLines(nDocID,0,"Seznam potřebných ingrediencí:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Kosti z kostlivce");
	Doc_PrintLine(nDocID,0,"Černá perla");
	Doc_PrintLine(nDocID,0,"Maso z mrtvoly");
	Doc_PrintLine(nDocID,0,"Vejce důlního červa");
	Doc_PrintLine(nDocID,0,"Srdce démona");
	Doc_PrintLine(nDocID,0,"Prach nekromanta");
	Doc_PrintLine(nDocID,0,"Černý jetel");
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
	description = "Ur-Karrasovo sdělení";
	text[4] = "Ur-Karrasův dopis vůdci klanu Vysoké skály...";
	inv_animate = 1;
};


instance ItWr_CassiaLetter(C_Item)
{
	name = "Seznam podezřelých";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Seznam podezřelých";
	text[4] = "Seznam podezřelých z krádeže...";
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
	Doc_PrintLines(nDocID,0,"Je nutné přověřit následující lidi:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Halvor");
	Doc_PrintLine(nDocID,0,"Nagur");
	Doc_PrintLine(nDocID,0,"Kardif");
	Doc_PrintLine(nDocID,0,"Moe");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Musím z nich vyrazit informaci o cechu zlodějů...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItWr_Fregarah(C_Item)
{
	name = "Xardasovy zápisky";
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
		B_LogEntry(TOPIC_XRANFREG,"Z Xardasova deníku se dozvídám, že ten kamenný strážce u vstupu do chrámu by mohl mít co dělat s událostmi, jež se odehrály několik tisíc let zpět, kdy Beliar zavraždil jeho bratra Stonnose, čtvrtého z bohů na této zemi... Teď jen potřebuju najít nějaké důkazy, které popisujou všechny tyto události. Kde je však hledat?");
		B_Say(self,self,"$HOWINTEREST");
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_145 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Po dlouhé roky jsem si pokládal tu samou otázku - odkud se to stvoření vzalo? Až Strážci mi poodhalili pohled na události, kdy Stonnos, čtvrtý z bohů tohoto světa, byl zabit jeho bratrem - Beliarem! Jsem si zcela jistý, že nenadálé zjevení tohoto stvoření v našem světě je s těmito událostmi nějak přepojeno.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Taková bytost se na našem světě objeví jen ojediněle, často v dobách velkých převratů. Neskutečná síla, která se v nich nachází dokáže přeměnit běžný předmět na arktefakt, jež disponuje opravdu úžasnými vlastnostmi.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_01(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kronika Stonnosova - svazek I";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
		AI_Print("Inteligence + 1");
		BookBonus_146 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Čtyři božští bratři byli velice silní i přes své rozepře, které vyvstávaly z jejich vlastní podstaty. Vznešený Innos, ctižádostivý Beliar, soustředěný Adanos a nadšený Stonnos. Dokud hrají svou roli v tomto světě, naše možnosti jsou vymezeny jejich úmluvou.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Tři jsou lepší než čtyři. A každá ctnost má i své nedostatky: samolibost Innose, závistivost Beliara, lhostejnost Adana i přílišná obětavost Stonnose. Ten, kdo proniká do temnoty Skály, vstupuje i do Temnoty Beliara. Jak jednoduše zasýt sémě pochybnosti a pěstovat zárodky nenávisti zamíchané se závistí. Hlavní věc je – ostražitost!");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_02(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kroniky Stonnosovy - svazek II";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
	if((BookBonus_147 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_147 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Plán vrcholí. Avšak závist - ta je špatný spojenec a ještě horší rádce. Zatímco Innosova a Adanova pozornost byla odvedena pryč, Beliar vykonal svůj tajný plán k získání moci nad zemskou temnotou a zahubil svého bratra a ukončil jeho konání na zemi.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Teprve když tato mocná bytost padla, poslední, co bylo třeba udělat, bylo izolovat Stonnosovu oslabenou duševní podstatu. Ale kde najít vhodnou schránku, která by byla schopná udržet takovou sílu?...");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_03(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kroniky Stonnosovy - Svazek III";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
	if((BookBonus_148 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_148 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Vědomi si úmluvy, podařilo se nám pokračovat v našem plánu. Abychom zabránili rozpadu zbytku duševní podstaty Stonnosovy síly, uvěznili jsme jeho oslabenou moc do těla mocné bytosti.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Božští bratři až teprve teď věří jeden druhému, kdy bude tato neutrální schránka pod dohledem každého z nich.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_04(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kroniky Stonnosovy - svazek IV";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
	if((BookBonus_149 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_149 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Něco se pokazilo a magická exploze neuvěřitelné síly poškodila schránku. Co jsme to za hlupáky! Teď je důležité se rozhodnout - probudit oslabenou duševní podstatu Stonnose nebo ho nadobro zničit.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jakmile na moment zase přišel Stonnos k sobě a jeho duševní podstata unikala za hranice schránky, současně pohlcujíc energii svého elementu, získal svou bývalou sílu zpět. Mám to i dnes celé před očima, tak jak to bylo tehdy.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_05(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kroniky Stonnosovy - svazek V";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
	if((BookBonus_150 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_150 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Magická ruda - není nic jiného než zkaměnělá krev Stonnose. Ale rozžhavené zemské hlubiny - to je ta pravá síla boha kamene! Teď už s tím nemůžeme dělat vůbec nic.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Nově stvořená bytost není však Stonnos sám, nýbrž jen část jeho samotnéno. Podařilo se nám ho přesvědčit, aby nám sloužil a je to tak, že nyní ho žádný z božských bratří nemůže použít ve svůj vlastní prospěch.");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_06(C_Item)
{
	name = "Kroniky Stonnosovy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Kroniky Stonnosovy - svazek VI";
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
			AI_Print("Rétorika + 1");
		};

		if((MIS_XRANFREG == LOG_Running) && (StonnosHr01 == TRUE) && (StonnosHr02 == TRUE) && (StonnosHr03 == TRUE) && (StonnosHr04 == TRUE) && (StonnosHr05 == TRUE) && (StonnosHr06 == TRUE) && (StonnosHrAll == FALSE))
		{
			B_RaiseAttribute(self,ATR_HITPOINTS_MAX,100);
			Snd_Play("Levelup");
			StonnosHrAll = TRUE;
			B_LogEntry(TOPIC_XRANFREG,"Teď už vím vše, co jsem potřeboval! To stvoření s kterým se Pyrokar a Xardas setkali, nebyl nikdo jiný než Stonnos sám. Je nesmrtelný a pouze a jen krev boha, který ho splodil, může zničit toto stvoření. Podle všeho, obyčejná magická ruda - je stejná jako krev Stonnose! Vzpomínám si na příběh o Urizielovi. Možná to bude fungovat znova. Jenže kde já najdu tolik rudy?! A co je nejdůležitější, jaký předmět použít pro tyto účely. Otázky, otázky, samé otázky...");
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
	if((BookBonus_151 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Inteligence + 1");
		BookBonus_151 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jeho síla a schopnosti jsou pozoruhodné! Musíme však najít způsob jak ho zničit, pokud by to bylo potřeba. Nicméně jen síla jeho podstaty je schopná ho zničit!");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Krev jeho mrtvého boha - to je to co my potřebujeme! Magická síla s ní spojená je to, co udělá svou práci, až nastane správný čas. A to bude dříve než si myslíme...");
	Doc_Show(nDocID);
};

instance ItWr_Stonnos_07(C_Item)
{
	name = "Poslední vydechnutí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Poslední vydechnutí";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_152 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Osud tohoto světa je zpečetěn! Bude zničen větry chaosu a na jeho místě, vybudujeme nový chrám. Bude nádherný tak jako i tento svět byl nádherný.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Jejich jediná naděje na záchranu leží v rukou toho, jež bohové jmenovali svým vyvoleným! Jen pouze on nám může dokázat, že jsme se mýlili, když jsme se tak rozhodli a že tento svět si zaslouží, aby mu bylo prominuto.");
	Doc_Show(nDocID);
};

instance ItWr_Alchemy_01(C_Item)
{
	name = "Původ alchymie";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Původ alchymie";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_153 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Moudří lidé se naučili získávat magickou moc z bylin a z částí různých stvoření. Od té doby, alchymisti hledají využití pro nové léčebné prostředky a způsoby jak vylepšit ty staré. Ty, jejichž podstatu napadl sám Beliar, nazýváme temnými alchymisty. Ve svých lektvarech užívají kosti, lebky a ektoplazmu mocných magických stvoření.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Elixíry mají rozličné účinky na válečníky a na mágy. Výsledkem tréninku se organizmus stává citlivým na určité alchymistické směsi a vůči dalším si buduje imunitu. Pro dosažení co nejlepších účinků užívejte elixíry přirozené vášmu osobnímu tréninku.");
	Doc_Show(nDocID);
};

instance ItWr_Druid_01(C_Item)
{
	name = "Druidi";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItWr_Book_Rich_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Druidi";
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
			AI_Print("Rétorika + 1");
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
		AI_Print("Inteligence + 1");
		BookBonus_154 = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,-1,"font_10_book.tga");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Když rostliny a zvířata změnili svou původní podstatu, druidi se jich začali bát. Avšak Adanos se obrátil k moudrým a pravil, že zlo je možné přeměnit na dobro, a jed na medicínu. Varoval je i vylekal hněvem tří bohů, že moudrost nesmí být obrácena ve zlo a medicína v jed. Bohužel ne všichni vydrželi odolávat tomu pokušení.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Druidi pronikli do tajů bylin. Jejich znalosti pomáhají alchymistům měnit jed na elixíry. Z vůle druidů, kde keře byly, lesy rostly, kde pouště byly, keře rostly. Bohužel takovéto dílo se druidům podaří jednou, dvakrát za život. Pomocníci jež slouží v lesích druidům jsou enti - na půl živé stromy, které jsou schopné pohybu, jako golemové.");
	Doc_Show(nDocID);
};

instance ItWr_Sigil(C_Item)
{
	name = "Starý svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Sigil;
	scemeName = "MAP";
	description = "Runový sihill";
	text[4] = "Způsob výroby 'Stříbrného runového sihillu'...";
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
			AI_Print("Naučeno: Kovářství - 'Stříbrný runový sihill'");
			B_LogEntry(TOPIC_TalentSmith,"Materiály pro vykování STŘÍBRNÉHO RUNOVÉHO SIHILLU: 2x rtuť, 3x železný ingot, 2x černá ruda, měsíční kámen, 2x černá perla, pryskyřice, 4x síra, 10x úlomek runového kamene, svitek kouzla 'Zničení nemrtvého' a 4x křemen.");
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
	Doc_PrintLines(nDocID,0,"- Runový sihill -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Tento meč je pravděpodobně ta nejlepší zbraň, kterou kdy člověk vyrobil! Nejen, že může v tichosti nasekat napřátelé na malé kousky, může také způsobit zranění nehmotným bytostem, například přízrakům.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Bohužel jen pravý mistr kovařiny je schopen ukovat zbraň takovéhoto rázu, protože recept na výrobu je nesmírně složitý.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_Unpoison(C_Item)
{
	name = "Starý svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_Unpoison;
	scemeName = "MAP";
	description = "Odolnost proti jedům";
	text[4] = "Způsob obrany proti jedům...";
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
			AI_Print("Naučeno: Odolnost proti jedu");
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
	Doc_PrintLines(nDocID,0,"- Jedy -");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Jed - je zlo! Obvzlášť když se dostane do organizmu. Musíme se postarat o to, aby tělo začalo jed rozkládat co nejdříve.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Je velice důležité se neustále pohybovat a hodně potit! Potom otrava jedem nebude působit tolik újmy.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};

instance Itar_Pal_Cloack(C_Item)
{
	name = "Avabulina křídla";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	value = 1;
	visual = "Pal_Flaga.MMS";
	material = MAT_LEATHER;
	description = "Avabulina křídla";
	inv_animate = 1;
};

instance ItWr_ArmorDocs(C_Item)
{
	name = "Staré kresby";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_ArmorDocs;
	scemeName = "MAP";
	description = "Staré kresby";
	text[4] = "Podobné nákresům na výrobu nějaké zbroje...";
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
	name = "Miltenův svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_animate = 1;
};
