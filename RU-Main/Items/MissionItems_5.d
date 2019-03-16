
instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_XardasLetterToOpenBook;
	scemeName = "MAP";
	description = "Письмо Ксардаса";
	inv_animate = 1;
};


func void Use_XardasLetterToOpenBook()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если все будет так, как я и предполагал, то ты сейчас должен искать священные залы Ирдората. Книга, которую ты дал Пирокару, содержит все необходимые тебе указания. Слова 'КСАРАК БЕНДАРДО' открывают ее.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Мы встретимся еще!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Ксардас");
	Doc_Show(nDocID);
	if(MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Ксардас рассказал в письме, что за слова я должен произнести, чтобы открыть книгу ЗАЛЫ ИРДОРАТА.");
	};
	MIS_Xardas_SCCanOpenIrdorathBook = TRUE;
};


instance ItWr_HallsofIrdorath_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = "Залы Ирдората";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath;
	inv_animate = 1;
};


func void Use_HallsofIrdorath()
{
	if(MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,ItWr_HallsofIrdorath_Open_Mis,1);
		CreateInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		CreateInvItems(hero,ItWr_UseLampIdiot_Mis,1);
		AI_Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Я открыл книгу Ксардаса. Там находилось тайное сообщение и лежал какой-то уникальный ключ. Кто знает, что меня еще ожидает в подвалах монастыря.");
	}
	else
	{
		CreateInvItems(hero,ItWr_HallsofIrdorath_Mis,1);
		AI_Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ItWr_HallsofIrdorath_Open_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Rich_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Залы Ирдората";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_HallsofIrdorath_Open;
	inv_animate = 1;
};


func void Use_HallsofIrdorath_Open()
{
	var int nDocID;

	if(ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Я прочитал записи в книге. В них упоминается какая-то тайная библиотека. Она должна находиться где-то в подвалах монастыря. ");
		ItWr_SCReadsHallsofIrdorath = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...и я спрятал вход в библиотеку за тайной дверью, чтобы защитить мои записи о храмах Белиара. ");
	Doc_PrintLines(nDocID,0,"Если бы мои братья по вере знали о существовании этих записей, то эти проклятые дураки точно бы все уничтожили. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_PrintLine(nDocID,1,"");
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Теперь же они вообще не догадываются, что эти храмы когда-либо существовали. ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Для защиты библиотеки я поставил нескольких верных слуг. ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Ключ из книги открывает последнюю дверь. ");
	Doc_Show(nDocID);
};

var int BookBonusRhet;

instance ItWr_XardasSeamapBook_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_04.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Старая пыльная книга";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_XardasSeamapBook_Mis;
	inv_animate = 1;
};

func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;

	if((BookBonus_30 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_30 = TRUE;
	};
	if(BookBonusRhet == FALSE)
	{
		BookBonusRhet = TRUE;
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_WOOD_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_WOOD_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...теперь я уверен, что здесь идет речь о залах Ирдората. Они находятся вблизи на острове, недалеко от порта Хориниса. Интерес Белиара к магическим рудникам всегда был очевиден...");
	Doc_PrintLines(nDocID,0,"");

	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(nDocID,0,"...чем сильнее они, тем больше они ценятся, чтобы служить ему живыми. Такого одного обращенного паладина очень тяжело победить. Я надеюсь, что остальные здесь не заметят его... ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...обращенный паладин больше не реагирует на раздражители. Я спрятал его пожитки и снаряжение в задней комнате. Дверь может открываться только изнутри. Ему потребуется руна телепорта, чтобы попасть в помещение. Руководство по ее изготовлению я поместил вверху Альманаха, так что Он сможет его найти... ");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(nDocID,0,"...знаки отчетливы! Когда Он придет, ему будет нужна любая помощь, какую только мы сможем ему дать, Белиар сейчас слишком сильный. Мне удалось заполучить несколько очень ценных артефактов и я сохранил их на всякий случай, здесь внизу. Я руководствуюсь тем, что избранный будет один из нас и ");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,1,"написал для него несколько указаний в Альманахе.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...Теперь я уверен в себе. Мы не можем противиться судьбе. Когда Белиар будет чувствовать себя достаточно сильным, он постарается покорить весь мир. Я должен найти Избранника, иначе мы все погибнем.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(nDocID,0,"...начинается война, война за судьбу всего мира. Кажется я единственный, кто может толковать знамения. Кажется, что все вокруг меня игнорируют их. Придет Избранный и с его приходом начнется война. Эта война старее мира, но кажется что сейчас время последнего решения");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLines(nDocID,1,"и я не буду бездейственно смотреть, как другие берут в свои руки судьбу мира. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"...Я изучил древние рукописи и нашел руководство как изготовить легендарное оружие повелителя драконов. Но в любом случае я не имею никакого понятия, как найти необходимые компоненты. Для уверенности я положил рецепт в альманах, и если кто-то из нас и может сказать, что ждет нас в будущем, то только драконы. ");
	};

	Doc_Show(nDocID);
};


instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItWr_UseLampIdiot_Mis;
	scemeName = "MAP";
	description = "Смятое письмо";
	text[4] = "Небольшая записка, выпавшая из книги 'Залы Ирдората'...";
	inv_animate = 1;
};


func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Лампа открывает ход в нижний подвал...");
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


instance ItWr_Seamap_Irdorath(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Seamap_Irdorath;
	description = "Морская карта к острову Ирдорат";
	text[4] = "Карта, указывающая точное местоположение острова Ирдорат...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Seamap_Irdorath()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
	if((MIS_ShipIsFree == FALSE) && (Kapitel < 6))
	{
		B_Say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(Topic_Ship,LOG_MISSION);
		Log_SetTopicStatus(Topic_Ship,LOG_Running);
		B_LogEntry(Topic_Ship,"Кажется, я должен достигнуть этого вражеского острова! Но для этого мне нужен корабль, команда и капитан. ");
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};
	MIS_SCKnowsWayToIrdorath = TRUE;
};


instance ITMI_SEAMAPLOSTISLAND(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = use_itmi_seamaplostisland;
	description = "Морская карта к загадочному острову";
	text[4] = "На карте отмечен сам остров и нарисован точный к нему маршрут...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_seamaplostisland()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(nDocID);
};


instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseITWr_ForgedShipLetter_MIS;
	scemeName = "MAP";
	description = "Письменное разрешение";
	text[4] = "Документ, дающий доступ на корабль паладинов...";
	inv_animate = 1;
};


func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"	Письменное полномочие");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Этот документ дает право его владельцу взять корабль Лорда Хагена в свое распоряжение.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"-королевская печать-");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,200,50,50,50,1);
	Doc_Show(nDocID);
};

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Слезы Инноса";
	text[4] = "Воздействие неизвестно...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask_Sky.3ds";
	material = MAT_GLAS;
	on_state[0] = UseItPo_PotionOfDeath;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Слезы Инноса";
	text[3] = "Магу Огня этот напиток дарует огромную магическую силу...";
	text[4] = "Другие же просто умрут от него...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UseItPo_PotionOfDeath()
{
	var int KarmaInnos;

	KarmaInnos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;

	if(self.id == 0)
	{
		Snd_Play3d(hero,"BOTTLE_OPEN");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	}
	else if(KarmaInnos >= 500)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		B_RaiseAttribute_Bonus(self,ATR_HITPOINTS_MAX,50);
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ITAM_AMULETTOFDEATH_MIS_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip = UnEquip_ItAm_AmulettOfDeath_Mis;
	wear = WEAR_EFFECT;
	description = "Божественная аура Инноса";
	text[0] = NAME_Prot_Phis;
	count[0] = 40;
	text[1] = NAME_Prot_Point;
	count[1] = 40;
	text[2] = NAME_Prot_Fire;
	count[2] = 40;
	text[3] = NAME_Prot_Magic;
	count[3] = 40;
	text[4] = "Сам Иннос защищает носящего этот амулет...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};


func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] += 40;
	self.protection[PROT_BLUNT] += 40;
	self.protection[PROT_POINT] += 40;
	self.protection[PROT_FIRE] += 40;
	self.protection[PROT_MAGIC] += 40;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection[PROT_EDGE] -= 40;
	self.protection[PROT_BLUNT] -= 40;
	self.protection[PROT_POINT] -= 40;
	self.protection[PROT_FIRE] -= 40;
	self.protection[PROT_MAGIC] -= 40;
};

instance ItPo_HealRandolph_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealRandolph;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = "Лекарство Сагитты";
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Целебный напиток, лечащий похмелье...";
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};