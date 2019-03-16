
const int AM_EyeProtFire = 50;
var int readbooksdone_99;

instance ItMi_InnosEye_MIS(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	description = name;
	on_equip = Equip_InnosEye;
	on_unequip = UnEquip_InnosEye;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[4] = "Глаз наполнен магической энергией!";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_InnosEye_Bad(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Артефакт наполнен магической энергией!";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void UnEquip_InnosEye()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};

instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Discharged_Mis;
	on_unequip = unequip_itmi_innoseye_discharged_mis;
	text[2] = NAME_Prot_Fire;
	count[2] = AM_EyeProtFire;
	text[4] = "Глаз ослаблен и потерял свой блеск...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	self.protection[PROT_FIRE] += AM_EyeProtFire;
};

func void unequip_itmi_innoseye_discharged_mis()
{
	self.protection[PROT_FIRE] -= AM_EyeProtFire;
};


instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 1;
	visual = "ITMI_INNOSEYE_MIS_SKY.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = Equip_ItMi_InnosEye_Broken_Mis;
	text[3] = TEXT_Innoseye_Setting;
	text[4] = TEXT_Innoseye_Gem;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Royl.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PermissionToWearInnosEye;
	scemeName = "MAP";
	description = "Письменное полномочие Пирокару";
	text[4] = "Это письмо наделяет владельца правом обладать 'Глазом Инноса'...";
	inv_animate = 1;
};


func void Use_PermissionToWearInnosEye()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER_ROYAL.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Подателю этого письма нужно предоставить доступ в святые залы монастыря. Его желаниям относительно владения глазом Инноса нужно следовать безотлагательно. Эти указания подтверждаются властью моей должности, как главного уполномоченного острова и короля, и считаются правомочными.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Лорд Хаген");
	Doc_Show(nDocID);
};


instance ItWr_XardasBookForPyrokar_Mis(C_Item)
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
	on_state[0] = Use_XardasBookForPyrokar;
	inv_animate = 1;
};


func void Use_XardasBookForPyrokar()
{
	AI_Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItWr_CorneliusTagebuch_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Дневник Корнелиуса";
	text[4] = "Дневник помошника городской главы Хориниса...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = UseCorneliusTagebuch;
	inv_animate = 1;
};


func void UseCorneliusTagebuch()
{
	var int nDocID;

	if(Cornelius_IsLiar == FALSE)
	{
		B_LogEntry(TOPIC_RescueBennet,"Дневник является доказательством, которое мне необходимо для освобождения Беннета.");
		Cornelius_IsLiar = TRUE;
	};

	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
	Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Если Лариус и в дальнейшем будет так поступать, я буду искать себе другое место. ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Сегодня ночью со мной случилось что-то странное. Человек в черной мантии разбудил меня, придя в спальню. Я совсем не волновался, хотя об этих людях рассказывают много разных страшных историй. Сила, которую излучал незнакомец, ощущалась физически. Голос же был тихим и успокаивающим.");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Он предложил мне двадцать тысяч золотых за то, чтобы я добился обвинения и распоряжения о повешении одного из наемников. Такая сумма слишком огромна, чтобы сомневаться.");
	Doc_PrintLines(nDocID,1,"Я сразу же согласился, наемники в любом случае заслуживают урока. Золото обеспечит беззаботное существование в будущем.");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"Мне почти ничего не пришлось придумывать. Сегодня арестовали одного из наемников. Обвинением больше, обвинением меньше – его приговорят к казни. Отличный повод, чтобы сдержать данное мною слово и заработать на безбедную старость.");
	Doc_Show(nDocID);
};


instance ITWR_DementorObsessionBook_MIS(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Альманах одержимости";
	text[4] = "При одном только взгляде на книгу, она начинает сводить с ума...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_DementorObsessionBook;
	inv_animate = 1;
};


func void Use_DementorObsessionBook()
{
	var int nDocID;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);

	if(hero.guild == GIL_KDF)
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(nDocID,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_SetFont(nDocID,0,Font_Book_New);
		Doc_PrintLine(nDocID,0,"");
		Doc_SetFont(nDocID,0,Font_Book_New_Small);
		Doc_PrintLines(nDocID,0,"Приди ко мне сила твоя");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Из черного зала ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Приди же в меня");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Лучем невидимого света");
		Doc_PrintLines(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Войди в меня и зажги");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_SetFont(nDocID,1,Font_Book_New);
		Doc_SetFont(nDocID,1,Font_Book_New_Small);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");

		if(Kapitel >= 3)
		{
			Doc_PrintLine(nDocID,1,"Вино");
			Doc_PrintLine(nDocID,1,"Фернандо");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Малак");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Бромор");
		};
		if(Kapitel >= 4)
		{
			Doc_PrintLine(nDocID,1,"Энгром");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Рэндольф");
			Doc_PrintLine(nDocID,1,"");
		};
		if(Kapitel >= 5)
		{
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Секоб");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"Брутус");
			Doc_PrintLine(nDocID,1,"");
		};
		Doc_Show(nDocID);
	};
};


instance ItWr_PyrokarsObsessionList(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_PyrokarsObsessionList;
	scemeName = "MAP";
	description = "Магическое письмо Пирокара";
	inv_animate = 1;
};


func void Use_PyrokarsObsessionList()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Одержимые злом...:");

	if(Kapitel >= 3)
	{
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Фернандо");
		Doc_PrintLine(nDocID,0,"Вино");
		Doc_PrintLine(nDocID,0,"Малак");
		Doc_PrintLine(nDocID,0,"Бромор");
	};
	if(Kapitel >= 4)
	{
		Doc_PrintLine(nDocID,0,"Энгром");
		Doc_PrintLine(nDocID,0,"Рандольф");
	};
	if(Kapitel >= 5)
	{
		Doc_PrintLine(nDocID,0,"Секоб");
		Doc_PrintLine(nDocID,0,"Брутус");
		Doc_PrintLine(nDocID,0,"");
	};
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItPo_HealHilda_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_HpEssenz;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealHilda;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Лекарство, избаляющее от черной лихорадки...";
	text[5] = NAME_Value;
	count[5] = Value_HpEssenz;
	inv_animate = 1;
};


func void Use_HealHilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
};


instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name = "Трость";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = Value_VLKMace;
	damageTotal = Damage_VLKMace;
	damagetype = DAM_BLUNT;
	range = Range_VLKMace;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = Condition_VLKMace;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[1] = NAME_Damage;
	count[1] = damageTotal;
	text[2] = NAME_Str_needed;
	count[2] = cond_value[2];
	text[3] = NAME_RADIUS;
	count[3] = range;
	text[4] = "На ней высечена литера 'М'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MalethsBanditGold(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_MalethsBanditGold;
	description = name;
	text[4] = "Кошелек, полный золота...";
	inv_animate = 1;
};

func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold,300);
};


instance ItMi_Moleratlubric_MIS(C_Item)
{
	name = "Жир кротокрыса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_Pitch_New.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_BabosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosLetter;
	scemeName = "MAP";
	description = "Письмо Бабо";
	inv_animate = 1;
};


func void Use_BabosLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Дорогой Бабо!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Ты конечно же удивишься, что мы решили написать тебе это письмо. Мы желаем счастья тебе в твоем дальнейшем пути и надеемся, что ты не забудешь своих подруг. Успехов в монастыре и наслаждайся картинкой!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Фет и Бонка");
	Doc_Show(nDocID);
};


instance ItWr_BabosPinUp_MIS(C_Item)
{
	name = "Рисунок";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosPinUp;
	scemeName = "MAP";
	description = "Изображение обнаженной женщины";
	inv_animate = 1;
};


func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Pinup.TGA",0);
	Doc_Show(nDocID);
};


instance ItWr_BabosDocs_MIS(C_Item)
{
	name = "Связка бумаг";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_BabosDocs;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "Несколько сложенных в одну пачку документов...";
	inv_animate = 1;
};


func void Use_BabosDocs()
{
	BabosDocsOpen = TRUE;
	CreateInvItems(self,ItWr_BabosLetter_MIS,1);
	CreateInvItems(self,ItWr_BabosPinUp_MIS,1);
};

instance ItWr_Astronomy_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_Rich_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Божественная энергия звезд";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_Astronomy;
	inv_animate = 1;
};


var int Astronomy_once;

func void Use_Astronomy()
{
	var int nDocID;

	if(Astronomy_once == FALSE)
	{
		B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
		RankPoints = RankPoints + 1;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		Astronomy_once = TRUE;
	};
	if((BookBonus_25 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_25 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetFont(nDocID,-1,Font_Book_New_Small);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...если бы объединить силу быка с принципами войны, то все были бы поражены тем результатом, который мог бы получиться. ");
	Doc_PrintLines(nDocID,0,"Несравнимая сила быка и целенаправленность воинов могут вместе достигнуть древнего равенства сил. Космические границы между измерениями слабеют настолько, что уже проступают черты образа Белиара и они легко могут переходить в наш мир. ");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"То, что это значит, показывают нам войны раннего времени, когда граница между мирами была еще сильнее. Слуги зла принесли смерть и разрушение на землю и только с помощью Инноса и его избранников люди смогли победить эту беду. ");
	Doc_PrintLines(nDocID,1,"Но он должен возвратиться, ведь уже более ста лет Иннос не посылает нам своих избранников. ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"");
	Doc_Show(nDocID);
};


var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name = NAME_Trank;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ITMI_CUREPOTION_SKY.3ds";
	material = MAT_GLAS;
	on_state[0] = Use_HealObsession;
	scemeName = "POTIONFAST";
	wear = WEAR_EFFECT;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = HP_Essenz;
	text[4] = "Лекарство, избаляющее от одержимости...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_HealObsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	if(Npc_IsPlayer(self))
	{
		B_ClearSCObsession(self);
	};
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",self,self,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ItSe_Golemchest_Mis(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_GolemChest;
	description = "Кошелек";
	text[4] = "Полный золотых монет кошелек...";
	inv_animate = 1;
};


func void Use_GolemChest()
{
	CreateInvItems(hero,ItMi_Gold,50);
	AI_Print(PRINT_FoundGold50);
	AI_Print(PRINT_FoundRing);
	CreateInvItems(hero,ItRi_Prot_Total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ShatteredGolem_Mis;
	description = "Очень старая карта";
	text[4] = "На ней обозначено крестом только одно место...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_ShatteredGolem_Mis()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_DiegosLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_DiegosLetter_Mis;
	scemeName = "MAP";
	description = "Письмо Диего";
	text[4] = "Это письмо предназначается для Гербранта...";
	inv_animate = 1;
};


func void Use_DiegosLetter_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Гербрант, лучше бы ты предпочел убить меня тогда. Я снова в городе и направляюсь к тебе. Если я тебя найду, я разрежу тебе твое жирное брюхо до горла. Ты достаточно долго меня знаешь, чтобы понимать, что я не оставлю это безнаказанно. Твой единственный шанс остаться в живых, это навсегда исчезнуть из этого дома и передать мне все свои дела.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Диего");
	Doc_Show(nDocID);
};


instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Big.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = Use_DiegosTreasure;
	description = "Старый кошелек Диего";
	text[4] = "Тугонабитый золотыми монетами кошелек...";
	inv_animate = 1;
};


func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;
	B_PlayerFindItem(ItMi_Gold,DiegosTreasure);
};


instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name = "Святая вода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HolyWater;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = "Святая вода";
	text[4] = "Этот флакон со святой водой дал мне Маг Огня, Ультар...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


var int ItWr_MinenAnteil_Mis_OneTime;

instance ItWr_MinenAnteil_Mis(C_Item)
{
	name = NAME_Scroll;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = Value_HpElixier;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MinenAnteil_Mis;
	scemeName = "MAP";
	description = "Акция";
	text[4] = "Ценная бумага, дающая право владения рудниковыми участками";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_MinenAnteil_Mis()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Владельцу этого письма дано королевское разрешение на получение средств из королевского владения, и служить прокуратором на королевских землях.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Королевсий Прокуратор");
	Doc_PrintLine(nDocID,0,"Саландрил");
	Doc_Show(nDocID);
	SC_KnowsProspektorSalandril = TRUE;
	if(ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile,"Имя человека, который продал торговцам рудниковые участки - Саландрил. Я бесспорно найду его в верхней части Хориниса, конечно же, если он не скрывается от закона.");
		if(Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile,"Саландрил мертв. Я должен уведомить об этом Серпентеса.");
		};
		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};


instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name = NAME_Amulett;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = Value_Am_HpMana;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	description = "Зов Души";
	text[4] = "Амулет, защищающий от темной магии странников...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name = "Кусок камня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_KarrasBlessedStone_Mis_Sky.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[4] = "Горная порода священной земли...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_RichterKomproBrief;
	scemeName = "MAP";
	description = "Записка Судьи";
	text[4] = "Эту записку написал городской судья Хориниса...";
	inv_animate = 1;
};


func void Use_RichterKomproBrief()
{
	var int nDocID;
	SCKnowsRichterKomproBrief = TRUE;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Моргард, ты бездельник! Выполни мой приказ, иначе я обращусь к другим силам и вы все будете арестованы. Дело планируется на завтрашнюю ночь. Лариус уже стал подозрительным. Если мы сейчас не уничтожем его, то больше не будет никакой возможности. Я позабочусь о том, чтобы вы встретили его сегодня вечером на рыночной площади.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_MorgahardTip(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = Use_MorgahardTip;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};


func void Use_MorgahardTip()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,0,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Я ухожу и надеюсь, что мы еще встретимся в более спокойное время. Не бойся, парень. Если все получится, я буду просить Онара сделать для нас это дело. Все будет в порядке!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"M.");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ITWR_MAP_SHRINE_MIS_1(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_NewWorld_Shrine_MIS;
	description = "Карта святой земли";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_NewWorld_Shrine_MIS()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(Document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document,-28000,50500,95500,-42500);
	Doc_Show(Document);
};


instance ItWr_VinosKellergeister_Mis(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_Poor_01.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Винный дух";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_VinosKellergeister_Mis;
	inv_animate = 1;
};


func void Use_VinosKellergeister_Mis()
{
	var int nDocID;
	var int rnd;

	if(READBOOKSDONE_99 == FALSE)
	{
		READBOOKSDONE_99 = TRUE;
		B_Say(self,self,"$HOWINTEREST");
		Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
		RankPoints = RankPoints + 1;
		B_LogEntry(TOPIC_COOK,"Для изготовления 'Джина' необходимо продистиллировать десять бутылок шнапса на алхимическом столе.");
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
	if((BookBonus_26 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_26 = TRUE;
	};
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,2);
	Doc_SetPage(nDocID,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(nDocID,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(nDocID,0,275,20,30,20,1);
	Doc_SetFont(nDocID,0,Font_Book_New);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Энергия грозди ");
	Doc_SetFont(nDocID,0,Font_Book_New_Small);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...я попробовал уже достаточное количество, но все же плоды, которые поставляют мне последнюю неделю с верхнего моря превосходят мои даже самые смелые ожидания...");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"...эта лоза такая сочная, какую нельзя найти во всей стране...");
	Doc_PrintLines(nDocID,0,"");
	Doc_SetMargins(nDocID,-1,30,20,275,20,1);
	Doc_SetFont(nDocID,1,Font_Book_New);
	Doc_SetFont(nDocID,1,Font_Book_New_Small);
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...чем дальше тем лучше. Но я не могу прогнать мысль, что меня поймают с моим тайным производством Джина. Я не имею понятия, что со мной сделают, если ополчение найдет меня здесь. Я боюсь, что тогда я буду брошен за барьер... ");
	Doc_PrintLine(nDocID,1,"");
	Doc_PrintLines(nDocID,1,"...они полны подозрений. Я хочу оставить всю работу, пока они смотрят за мной, и только тогда примусь опять за работу, когда буду уверен, что они больше не преследуют меня... ");
	Doc_Show(nDocID);
};


instance ITWR_DEATH1(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH1;
	scemeName = "MAP";
	description = "Дыхание смерти I том";
	text[4] = "Первая часть рецепта эликсира 'Дыхание смерти'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH1()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH1 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH1 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDAS_ROBA,"Я нашел первый кусок рецепта...");
		};

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
	if((BookBonus_27 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_27 = TRUE;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Дыхание смерти'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Сердце демона - 1 штука");
	Doc_PrintLine(nDocID,0,"Кости скелета - 20 штук");
	Doc_PrintLine(nDocID,0,"Мертвая плоть - 5 штук");
	Doc_PrintLine(nDocID,0,"Череп - 1 штука");
	Doc_PrintLine(nDocID,0,"Царский щавель - 2 штуки");
	Doc_PrintLine(nDocID,0,"Драконий корень - 2 штуки");
	Doc_PrintLine(nDocID,0,"Ягода гоблина - 2 штуки");
	Doc_PrintLine(nDocID,0,"Солнечное алоэ - 1 штука");
	Doc_PrintLine(nDocID,0,"Волшебный корень - 1 штука");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________ ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"КОНЕЦ ПЕРВОЙ ЧАСТИ РЕЦЕПТА");
	Doc_PrintLines(nDocID,0,"______________ ");
	Doc_Show(nDocID);
};


instance ITWR_DEATH2(C_Item)
{
	name = NAME_Book;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItWr_Book_Uniq_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = Use_ITWR_DEATH2;
	scemeName = "MAP";
	description = "Дыхание смерти II том";
	text[4] = "Вторая часть рецепта эликсира 'Дыхание смерти'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ITWR_DEATH2()
{
	var int nDocID;
	var int rnd;

	if(KNOWS_BREATH_OF_DEATH2 == FALSE)
	{
		B_GivePlayerXP(250);
		KNOWS_BREATH_OF_DEATH2 = TRUE;

		if(MIS_ROBA_XARDAS == LOG_Running)
		{
			B_LogEntry(TOPIC_XARDAS_ROBA,"Я нашел второй кусок рецепта...");
		};

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
	if((BookBonus_28 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print("Интеллект + 1");
		BookBonus_28 = TRUE;
	};

	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,0,FONT_BookHeadline);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_SetFont(nDocID,0,FONT_Book);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"'Дыхание смерти'");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"______________ ");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"ПРОДОЛЖЕНИЕ ПЕРВОЙ ЧАСТИ РЕЦЕПТА");
	Doc_PrintLines(nDocID,0,"______________ ");
	Doc_PrintLine(nDocID,0,"Серафис - 10 штук");
	Doc_PrintLine(nDocID,0,"Черная жемчужина - 1 штука");
	Doc_PrintLine(nDocID,0,"Огненный язык - 3 штуки");
	Doc_PrintLine(nDocID,0,"Аквамарин - 5 штук");
	Doc_PrintLine(nDocID,0,"Жемчужина - 3 штуки");
	Doc_PrintLine(nDocID,0,"Горный хрусталь - 10 штук");
	Doc_PrintLine(nDocID,0,"Кварц - 5 штук");
	Doc_PrintLine(nDocID,0,"Слезный перец - 1 штука");
	Doc_PrintLine(nDocID,0,"Вино 'Бальзам Провидения' - 1 бутыль");
	Doc_PrintLine(nDocID,0,"Эликсир максимальной маны - 1 бутыль");
	Doc_PrintLine(nDocID,0,"Вода - 15 бутылей");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};