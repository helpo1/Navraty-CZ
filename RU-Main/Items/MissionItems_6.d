
instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_XardasNotfallBeutel;
	description = name;
	text[4] = "В кошелеке виден твердый предмет и письменный документ...";
	inv_animate = 1;
};


func void Use_XardasNotfallBeutel()
{
	var string concatText;
	CreateInvItems(hero,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	CreateInvItems(hero,ItMi_InnosEye_Discharged_Mis,1);
	concatText = ConcatStrings(PRINT__ERHALTEN,"два");
	concatText = ConcatStrings(concatText,PRINT__ITEMS);
	concatText = ConcatStrings(concatText,"а");
	AI_Print(concatText);
};


instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasErmahnungFuerIdioten;
	scemeName = "MAP";
	description = "Сообщение от Ксардаса";
	inv_animate = 1;
};


func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мой юный защитник, ты глубоко огорчил меня. Как можно отправляться в этот страшный путь на корабле, не имея при себе глаза Инноса? Я могу только надеяться, что твоя халатность имеет границы! Иначе ты никогда не освободишь мир от беды и я должен буду лично убить тебя за твою глупость.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Ксардас");
	Doc_Show(nDocID);
};


instance ItWr_Krypta_Garon(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_Krypta_Garon;
	scemeName = "MAP";
	description = "Старое письмо";
	text[4] = "Странное письмо, написанное очень нечетким подчерком...";
	inv_animate = 1;
};


func void Use_Krypta_Garon()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я обречен! Мои хлопоты вернуть Инубиса на праведный путь оказались напрасными. Инубис опять восстал из мертвых! Высланный старым орденом паладинов он жаждет мести.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Защити Иннос наши души!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Эван");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

var int LastDoorToUndeadFT;

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ItWr_LastDoorToUndeadDrgDI_MIS;
	scemeName = "MAP";
	description = "Записка темного мага";
	inv_animate = 1;
};


func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"KHADOSH ");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"EMEM KADAR");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Глаз Власти освещает твой путь!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);

	if(LastDoorToUndeadFT == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath,"В записке черного мага я обнаружил слова КАРДОШ ЕМЕМ КАДАР. Это похоже на какое-то странное заклинание, но как и для чего оно применяется и что это за Глаз Власти?");
		LastDoorToUndeadFT = TRUE;
	};
};

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RezeptFuerMegaTrank;
	scemeName = "MAP";
	description = "Древний рецепт";
	inv_animate = 1;
};


func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;
	nDocID = Doc_Create();

	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] == FALSE)
		{
			PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
			PLAYER_TALENT_ALCHEMY_11 = TRUE;
			RankPoints = RankPoints + 1;
			Snd_Play("LevelUP");
			AI_Print("Изучен алхимический рецепт - 'Эмбарла Фиргасто'");
			B_LogEntry(TOPIC_TalentAlchemy,"Для создания 'Эмбарла Фиргасто' необходимо иметь чистый спирт, девять яиц дракона, черную жемчужину и кусок серы.");
		};
		if((BookBonus_02 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_02 = TRUE;
		};
	};

	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Эмбарла Фиргасто");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Девять яиц дракона, черная жемчужина и щепотка серы. Эмульсия доводится до кипения и при постоянном помешивании пропускается через дистиллятор.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"P.S. Эликсир применять очень осторожно! У него тяжелые побочные воздействия. С маной будет твориться что-то непонятное.");
	Doc_Show(nDocID);
};

var int Diary_BlackNovice;

instance ItWr_Diary_BlackNovice_MIS(C_Item)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дневник темного послушника";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Diary_BlackNovice;
	inv_animate = 1;
};


func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я жду своего вызова уже месяц. Я уже не верю, что они меня возьмут. Я сделал все, что они мне поручили. Я все им носил вслед.");
	Doc_PrintLines(nDocID,0,"Хранитель ключей дал мне задание запереть решетку. У меня до сих пор не дошли руки до этого. Если это будет продолжаться дальше, то кто-нибудь еще успеет просто так пройти через ворота.");
	Doc_PrintLines(nDocID,0,"Как глупо, что я не могу запомнить комбинацию. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Я бы уже давно тайком побывал в большом зале. Мне не терпится увидеть Господина. Пустят ли меня к нему, когда я стану одним из них? ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Вчера попытал счастья. Я уже потерпел неудачу в двух камерах с рычагами, пока я не смог нажать три рычага западного крыла в правильном порядке. Эта сволочь заперла камеры. Завтра я попробую, отнять у него ключ...");
	Doc_Show(nDocID);

	if(Diary_BlackNovice == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath,"В дневнике послушника темного мага много говориться о камерах с рычагами, Мастере Ключей, комбинациях переключателей и другой фигне. Надо об этом помнить, может в будущем еще пригодится.");
		Diary_BlackNovice = TRUE;
	};
};


instance ItWr_ZugBruecke_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_ZugBruecke;
	scemeName = "MAP";
	description = "Старое письмо";
	inv_animate = 1;
};


func void Use_ZugBruecke()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,70,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мне наверно все равно, можно ли перейти мост с другой стороны, или нет. Что касается меня, вы все равно все попадете к дьяволу. Я отвел мост, пока нахожусь в моей резиденции. Если я поймаю кого-нибудь, кто будет стрелять из лука по выключателям, то собственноручно повешу его на ближайшем столбе.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Архол");
	Doc_Show(nDocID);
};


instance ItMi_PowerEye(C_Item)
{
	name = "Глаз Власти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[4] = "Необычного вида нефритовая фигурка, напоминающая глаз дракона...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL(C_Item)
{
	name = "Кусок камня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[3] = "Тусклый камень неизвестной породы...";
	text[4] = "По своей форме напоминает чье-то закрытое око...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PRISONSOUL_AWAKE(C_Item)
{
	name = "Око Гнева";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[3] = "Камень излучает энергию неизвестного происхождения...";
	text[4] = "По своей форме напоминает чье-то закрытое око...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCBLOOD(C_Item)
{
	name = "Орочья кровь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Густая жидкость, чёрного цвета...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_BARLOKHEART(C_Item)
{
	name = "Кровь демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	wear = WEAR_EFFECT;
	description = name;
	text[4] = "Кровь демона огня, багрово-красного цвета с резким запахом серы...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};