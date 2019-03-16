
const int Value_SheepFur = 10;
const int Value_WolfFur = 15;
const int Value_Keilerfur = 15;
const int Value_IceWolfFur = 20;
const int Value_ReptileSkin = 20;
const int Value_WargFur = 60;
const int Value_ShadowFur = 150;
const int Value_IcePumaFur = 250;
const int Value_PumaFur = 200;
const int Value_SharkSkin = 80;
const int Value_TrollFur = 250;
const int Value_TrollBlackFur = 500;
const int Value_TrollIceFur = 1000;

const int Value_BCKopf = 10;
const int Value_Meatbugflesh = 5;
const int Value_BugMandibles = 5;
const int Value_Claw = 5;
const int Value_LurkerClaw = 8;
const int Value_Teeth = 10;
const int Value_CrawlerMandibles = 12;
const int Value_SpiderMandibles = 30;
const int Value_Wing = 10;
const int Value_Sting = 12;
const int Value_DrgSnapperHorn = 50;
const int Value_CrawlerPlate = 25;
const int Value_WaranFiretongue = 40;
const int Value_ShadowHorn = 60;
const int Value_SharkTeeth = 40;
const int Value_DesertSharkTeeth = 60;
const int Value_TrollTooth = 70;
const int Value_GoblinBone = 5;
const int Value_SkeletonBone = 8;
const int Value_DemonHeart = 500;
const int Value_StoneGolemHeart = 150;
const int Value_FireGolemHeart = 250;
const int Value_IceGolemHeart = 300;
const int VALUE_SWAMPGOLEMHEART = 200;
const int Value_UndeadDragonSoulStone = 10000;
const int Value_IcedragonHeart = 800;
const int Value_FiredragonHeart = 700;
const int Value_SwampdragonHeart = 500;
const int Value_RockdragonHeart = 600;
const int Value_DragonBlood = 300;
const int Value_DragonScale = 200;

var int orcheart_bonus;
var int draconianheart_bonus;
var int fl_bonus;
var int pi_bonus;

instance ItAt_Addon_BCKopf(C_Item)
{
	name = "Голова богомола";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS";
	material = MAT_LEATHER;
	description = "Голова богомола";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Meatbugflesh(C_Item)
{
	name = "Мясо мясного жука";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Meatbugflesh;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_Meatbugflesh;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Meatbugflesh()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ItAt_SheepFur(C_Item)
{
	name = "Шкура овцы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SheepFur;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_RabbitFur(C_Item)
{
	name = "Кроличья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItAt_RabbitFur_New_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WolfFur(C_Item)
{
	name = "Шкура волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_WolfFur;
	visual = "ItAt_WolfFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_IceWolfFur(C_Item)
{
	name = "Шкура белого волка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IceWolfFur;
	visual = "ItAt_IceWolfFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WhitePuma(C_Item)
{
	name = "Шкура белой пумы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IcePumaFur;
	visual = "ItAt_IceWolfFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WhiteTroll(C_Item)
{
	name = "Шкура белого тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_TrollIceFur;
	visual = "ItAt_IceWolfFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_BugMandibles(C_Item)
{
	name = "Мандибулы полевого хищника";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BugMandibles;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Claw(C_Item)
{
	name = "Когти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Claw;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_OreBugClaw(C_Item)
{
	name = "Клешня рудного ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_LurkerClaw;
	visual = "ITAT_CLAW_RUDOGRIZ.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_LurkerClaw(C_Item)
{
	name = "Когти шныга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_LurkerClaw;
	visual = "ItAt_LurkerClaw_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Teeth(C_Item)
{
	name = "Клыки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Teeth;
	visual = "ITAT_TEETH.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_CrawlerMandibles(C_Item)
{
	name = "Мандибулы ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_CrawlerMandibles;
	visual = "G3_Item_AnimalTrophy_Teeth_MineCrawler_01.3DS";
	material = MAT_LEATHER;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SpiderMandibles(C_Item)
{
	name = "Мандибулы паука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SpiderMandibles;
	visual = "G3_Item_AnimalTrophy_Teeth_MineCrawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Cодержат внутри яд...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Wing(C_Item)
{
	name = "Крылья";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Wing;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Sting(C_Item)
{
	name = "Жало";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sting;
	scemeName = "FOOD";
	on_state[0] = Use_Sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Жало кровавой мухи, содержащее внутри яд...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Sting()
{
	if(Knows_Bloodfly == TRUE)
	{
		if(Bloodfly_Bonus <= 10)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			AI_Print(PRINT_FullyHealed);
			Bloodfly_Bonus = Bloodfly_Bonus + 1;
		}
		else
		{
			AI_Print(PRINT_Mandibles);
		};
	}
	else
	{
		AI_Print(PRINT_Bloodfly);
		if(self.attribute[ATR_HITPOINTS] > 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1;
		};
	};
};

instance itat_LurkerSkin(C_Item)
{
	name = "Шкура рептилии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ReptileSkin;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = "Кожа рептилии";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WargFur(C_Item)
{
	name = "Шкура варга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_WargFur;
	visual = "ItAt_WargFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_OrcDogFur(C_Item)
{
	name = "Шкура орочей гончей";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_WargFur;
	visual = "ItAt_OrcDogFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Addon_KeilerFur(C_Item)
{
	name = "Шкура кабана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Keilerfur;
	visual = "ItAt_KeilerFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DrgSnapperHorn(C_Item)
{
	name = "Рог драконьего снеппера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DrgSnapperHorn;
	visual = "ITAT_SHADOWHORN_NEW.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_CrawlerPlate(C_Item)
{
	name = "Панцирь ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_CrawlerPlate;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_ShadowFur(C_Item)
{
	name = "Шкура мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ShadowFur;
	visual = "ItAt_ShadowFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SharkSkin(C_Item)
{
	name = "Шкура болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SharkSkin;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_TrollFur(C_Item)
{
	name = "Шкура тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_TrollFur;
	visual = "ItAt_TrollFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_TrollBlackFur(C_Item)
{
	name = "Шкура черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_TrollBlackFur;
	visual = "ItAt_TrollBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_CaveBlackFurTroll(C_Item)
{
	name = "Шкура пещерного черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItAt_TrollCaveBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WaranFiretongue(C_Item)
{
	name = "Огненный язык";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_WaranFiretongue;
	visual = "G3_Item_AnimalTrophy_Misc_WaranTongue_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_TrollPoisonTongue(C_Item)
{
	name = "Язык тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Весь язык пропитан ядовитыми выделениями...";
	inv_animate = 1;
};

instance ItAt_ShadowHorn(C_Item)
{
	name = "Рог мракориса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ShadowHorn;
	visual = "G3_Item_AnimalTrophy_Horn_ShadowBeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SharkTeeth(C_Item)
{
	name = "Зуб болотожора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SharkTeeth;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DesertSharkTeeth(C_Item)
{
	name = "Зуб песчанного червя";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DesertSharkTeeth;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_TrollTooth(C_Item)
{
	name = "Клык тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_TrollTooth;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItAt_StoneGolemHeart(C_Item)
{
	name = "Сердце каменного голема";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StoneGolemHeart;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Увеличивает защиту от физического урона на:";
	count[3] = 50;
	text[4] = NAME_Time_Done;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItAt_StoneGolemHeart;
	inv_animate = 1;
};

func void Use_ItAt_StoneGolemHeart()
{
	if(Npc_IsPlayer(self))
	{
		if(BuffStoneGolemHeart == FALSE)
		{
			BuffStoneGolemHeart = TRUE;
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		};
	};
};

instance ItAt_FireGolemHeart(C_Item)
{
	name = "Сердце огненного голема";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FireGolemHeart;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Увеличивает защиту от огня на:";
	count[3] = 25;
	text[4] = NAME_Time_Done;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItAt_FireGolemHeart;
	inv_animate = 1;
};

func void Use_ItAt_FireGolemHeart()
{
	if(Npc_IsPlayer(self))
	{
		if(BuffFireGolemHeart == FALSE)
		{
			BuffFireGolemHeart = TRUE;
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_ORANGE",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		};
	};
};

instance ItAt_IceGolemHeart(C_Item)
{
	name = "Сердце ледяного голема";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IceGolemHeart;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Увеличивает защиту от магии на:";
	count[3] = 15;
	text[4] = NAME_Time_Done;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItAt_IceGolemHeart;
	inv_animate = 1;
};

func void Use_ItAt_IceGolemHeart()
{
	if(Npc_IsPlayer(self))
	{
		if(BuffIceGolemHeart == FALSE)
		{
			BuffIceGolemHeart = TRUE;
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_BLUE",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		};
	};
};

instance ItAt_SwampGolemHeart(C_Item)
{
	name = "Сердце болотного голема";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPGOLEMHEART;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Увеличивает стойкость на:";
	count[3] = 10;
	text[4] = NAME_Time_Done;
	count[4] = 5;
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = Use_ItAt_SwampGolemHeart;
	inv_animate = 1;
};

func void Use_ItAt_SwampGolemHeart()
{
	if(Npc_IsPlayer(self))
	{
		if(BuffSwampGolemHeart == FALSE)
		{
			BuffSwampGolemHeart = TRUE;
			AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_GREEN",self,self,0,0,0,FALSE);
			AI_Wait(self,1);
			AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		};
	};
};

instance ItAt_GoblinBone(C_Item)
{
	name = "Кость гоблина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoblinBone;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SkeletonBone(C_Item)
{
	name = "Кость скелета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SkeletonBone;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_SKELETONBONEALEF(C_Item)
{
	name = "Кость Алефа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SkeletonBone;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DemonHeart(C_Item)
{
	name = "Сердце демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DemonHeart;
	visual = "ITAT_DEMONHEART_SKY.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_KratukHeart(C_Item)
{
	name = "Сердеце стража Вакханы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITAT_DEMONHEART_SKY.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Излучает магическую энергию невероятной силы";
	text[4] = "Это сердце принадлежало древнему стражу Вакханы...";
	inv_animate = 1;
};

instance ITAT_LUZIANHEART(C_Item)
{
	name = "Сердце Люциана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITAT_DEMONHEART_SKY.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце принадлежало древнему демону Люциану...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_UndeadDragonSoulStone(C_Item)
{
	name = "Камень души дракона-нежити";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_UndeadDragonSoulStone;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Камень души могущественного аватара Белиара...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItAt_IcedragonHeart(C_Item)
{
	name = "Сердце ледяного дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IcedragonHeart;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего ледяного дракона Финкрега...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_RockdragonHeart(C_Item)
{
	name = "Сердце каменного дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RockdragonHeart;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего каменного дракона Педракана...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SwampdragonHeart(C_Item)
{
	name = "Сердце болотного дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampdragonHeart;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего болотного дракона Пандродора...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_FiredragonHeart(C_Item)
{
	name = "Сердце огненного дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего огненного дракона Феоматара...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DragonHeart(C_Item)
{
	name = "Сердце дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_Heart_03.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего дракона...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_REDDRAGONHEART(C_Item)
{
	name = "Сердце красного дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_ReddragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего красного дракона...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_BLACKDRAGONHEART(C_Item)
{
	name = "Сердце дракона-демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_DemonDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могущественного черного дракона Азгалора...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_UzdragonHeart(C_Item)
{
	name = "Сердце черного дракона-стража";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_BlackDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего дракона-стража...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_GOLDDRAGONHEART(C_Item)
{
	name = "Сердце золотого дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_GoldDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Это сердце могучего золотого дракона Аш'Тара...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DragonBlood(C_Item)
{
	name = "Кровь дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DragonBlood;
	visual = "ITPO_MAGIE_01_EX.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItAt_DragonScale(C_Item)
{
	name = "Чешуя дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DragonScale;
	visual = "ItAt_DragonScale_Sky.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_PUMAFUR(C_Item)
{
	name = "Шкура черной пумы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_PumaFur;
	visual = "ItAt_PumaFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_SLOKERSFUR(C_Item)
{
	name = "Шкура слокерса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 700;
	visual = "ItAt_SloFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_CRAWLERQUEEN(C_Item)
{
	name = "Яйцо ползуна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItAt_Crawlerqueen.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_BlackSnapperLiver(C_Item)
{
	name = "Печень черного глорха";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 20;
	visual = "ITAT_SNAPPERMEAT_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = Use_ItAt_BlackSnapperLiver;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItAt_BlackSnapperLiver()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		B_Say(self,self,"$COUGH");
	};
};

instance ITAT_MEATBUGFLESH_GEBRATEN(C_Item)
{
	name = "Поджаренное мясо жука";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Meatbugflesh * 2;
	visual = "ITAT_MEATBUGFLESH_GEBRATEN.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = use_meatbugflesh_gebraten;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_meatbugflesh_gebraten()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,20);
		Hero_Hunger = Hero_Hunger + 2;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ITFO_FISH_GEBRATEN(C_Item)
{
	name = "Поджаренная рыба";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FishSoup;
	visual = "ITFO_FISH_GEBRATEN.3DS";
	material = MAT_LEATHER;
	scemeName = "FOODHUGE";
	on_state[0] = use_fish_gebraten;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 20;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = Value_FishSoup;
	inv_animate = 1;
};


func void use_fish_gebraten()
{
	if(self.id == 0)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,20);
		Hero_Hunger = Hero_Hunger + 3;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ITFO_PILZSUPPE(C_Item)
{
	name = "Грибной суп";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 30;
	visual = "ITFO_PILZSUPPE.3DS";
	material = MAT_LEATHER;
	scemeName = "RICE";
	on_state[0] = use_pilzsuppe;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 60;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_pilzsuppe()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,60);
		PI_BONUS += 1;

		if(PI_BONUS == 20)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
			Npc_ChangeAttribute(self,ATR_MANA,2);
			Snd_Play("LevelUp");
		};

		Hero_Hunger = Hero_Hunger + 5;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};


instance ITFO_FLEISCHWANZENRAGOUT(C_Item)
{
	name = "Мясное рагу";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 40;
	visual = "ItFo_Stew_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "RICE";
	on_state[0] = use_fwragout;
	description = name;
	text[1] = NAME_Bonus_HP;
	count[1] = 35;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_fwragout()
{
	if(Npc_IsPlayer(self))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,35);
		FL_BONUS += 1;

		if(FL_BONUS == 20)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
			Npc_ChangeAttribute(self,ATR_MANA,1);
			Snd_Play("LevelUp");
		};

		Hero_Hunger = Hero_Hunger + 8;

		if(Hero_Hunger > 10)
		{
			Hero_Hunger = 10;
		};
	};
};

instance ITAT_SHEEPGRIMGASH(C_Item)
{
	name = "Овечья шкура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Эта шкурка украденной у Пепе овцы...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_OlderHead(C_Item)
{
	name = "Голова старейшины";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "Orc_HeadWarrior.MMS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Эта голова принадлежала горному орку-старейшине...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
};

instance ItAt_SpiderEgg(C_Item)
{
	name = "Паучий кокон";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "SpiderEgg.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DemonSkull(C_Item)
{
	name = "Череп демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITAT_DEMONSKULL.3DS";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Этот череп принадлежал могущественному демону...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

//--------------------------редкие трофеи----------------------------

func void B_ClearUseTrophy()
{
	Trophy_STONEPUMAPIECE = FALSE;
	Trophy_WhiteTrollSkull = FALSE;
	Trophy_Skalozub = FALSE;
	Trophy_DragonSkull = FALSE;
	Trophy_SERDCEGARPII = FALSE;
	Trophy_LURKERLEADER = FALSE;
	Trophy_MuritanTooth = FALSE;
	Trophy_CaracustPlate = FALSE;
	Trophy_UturTrollHorn = FALSE;
	Trophy_IshiCurrat = FALSE;
	Trophy_BlackTeeth = FALSE;
	Trophy_StoneClaw = FALSE;
	Trophy_UrTrallHead = FALSE;
};

instance ItAt_XtoneClaw(C_Item)
{
	name = "Каменный коготь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION |ITEM_MULTI;
	value = 150;
	visual = "ItAt_StoneClaw_Sky.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_StoneClaw;
	description = name;
	text[1] = NAME_Prot_Point;
	count[1] = 5;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_StoneClaw(C_Item)
{
	name = "Каменный коготь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	visual = "ItTr_StoneClaw.3DS";
	material = MAT_STONE;
	description = name;
};

func void Use_ItAt_StoneClaw()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_StoneClaw == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_StoneClaw);
			Npc_RemoveInvItems(self,ItUt_StoneClaw,Npc_HasItems(self,ItUt_StoneClaw));
			Trophy_StoneClaw = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_StoneClaw = FALSE;
		};
	};
};

instance ItAt_DlackTeeth(C_Item)
{
	name = "Черный клык";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION |ITEM_MULTI;
	value = 250;
	visual = "ItAt_BlackTeeth.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_BlackTeeth;
	description = name;
	text[1] = NAME_Prot_Phis;
	count[1] = 5;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_BlackTeeth(C_Item)
{
	name = "Черный клык";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_BlackTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_BlackTeeth()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_BlackTeeth == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_BlackTeeth);
			Npc_RemoveInvItems(self,ItUt_BlackTeeth,Npc_HasItems(self,ItUt_BlackTeeth));
			Trophy_BlackTeeth = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_BlackTeeth = FALSE;
		};
	};
};

instance ItAt_CurratIshi(C_Item)
{
	name = "Окаменелый спинной шип";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_TrollTooth_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_IshiCurrat;
	description = name;
	text[1] = NAME_Prot_Fire;
	count[1] = 5;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_IshiCurrat(C_Item)
{
	name = "Окаменелый спинной шип";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_IshiCurrat.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_IshiCurrat()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_IshiCurrat == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_IshiCurrat);
			Npc_RemoveInvItems(self,ItUt_IshiCurrat,Npc_HasItems(self,ItUt_IshiCurrat));
			Trophy_IshiCurrat = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_IshiCurrat = FALSE;
		};
	};
};

instance ItAt_GturTrollHorn(C_Item)
{
	name = "Рог Утура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "G3_Item_AnimalTrophy_Horn_ShadowBeast_01.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_UturTrollHorn;
	description = name;
	text[1] = NAME_WieldBonus2H;
	count[1] = 5;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_UturTrollHorn(C_Item)
{
	name = "Рог Утура";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_UturTrollHorn.3DS";
	material = MAT_STONE;
	description = name;
};

func void Use_ItAt_UturTrollHorn()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_UturTrollHorn == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_UturTrollHorn);
			Npc_RemoveInvItems(self,ItUt_UturTrollHorn,Npc_HasItems(self,ItUt_UturTrollHorn));
			Trophy_UturTrollHorn = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_UturTrollHorn = FALSE;
		};
	};
};

instance ItAt_ZaracustPlate(C_Item)
{
	name = "Пластина панциря Каракуста";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ITAT_CRAWLERSPIDER.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_CaracustPlate;
	description = name;
	text[1] = NAME_Prot_Phis;
	count[1] = 15;
	text[2] = NAME_Prot_Point;
	count[2] = 15;
	text[3] = "Огромная пластина от панциря короля ползунов...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_CaracustPlate(C_Item)
{
	name = "Пластина панциря Каракуста";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_CaracustPlate.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_CaracustPlate()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_CaracustPlate == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_CaracustPlate);
			Npc_RemoveInvItems(self,ItUt_CaracustPlate,Npc_HasItems(self,ItUt_CaracustPlate));
			Trophy_CaracustPlate = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_CaracustPlate = FALSE;
		};
	};
};

instance ItAt_BuritanTooth(C_Item)
{
	name = "Ядовитый клык Муритана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 750;
	visual = "ItAt_MuritanClaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_MuritanTooth;
	description = name;
	text[1] = NAME_Damage_Poison;
	count[1] = 50;
	text[3] = "В сердцевине клыка скопился яд...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItLs_BeltCandle(C_Item)
{
	name = "Светильный фонарь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "NW_CITY_CANDLELANTERN_01.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	on_state[0] = Use_ItLs_BeltCandle;
	description = name;
	text[4] = "Возможность экипировки...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_FireBeltCandle(C_Item)
{
	name = "Светильный фонарь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_WarCandle_01.3DS";
	effect = "SPELLFX_WARCANDLE";
	material = MAT_METAL;
	description = name;
};

func void Use_ItLs_BeltCandle()
{
	if(Npc_IsPlayer(self))
	{
		if(CandleIsOn == FALSE)
		{
			ActivateZSSlot(self,"BIP01 L THIGH");
			Ext_RemoveFromSlot(self,"BIP01 L THIGH");	
			Ext_PutInSlot(self,"BIP01 L THIGH",ItUt_FireBeltCandle);
			Npc_RemoveInvItems(self,ItUt_FireBeltCandle,Npc_HasItems(self,ItUt_FireBeltCandle));
			CandleIsOn = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 L THIGH");
			CandleIsOn = FALSE;
		};
	};
};

instance ItAt_PW_MuritanTooth(C_Item)
{
	name = "Ядовитый клык Муритана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 750;
	visual = "ItAt_MuritanClaw.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_MuritanTooth;
	description = name;
	text[1] = NAME_Damage_Poison;
	count[1] = 50;
	text[3] = "В сердцевине клыка скопился яд...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_MuritanTooth(C_Item)
{
	name = "Ядовитый клык Муритана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_MuritanTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

func void Use_ItAt_MuritanTooth()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_MuritanTooth == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_MuritanTooth);
			Npc_RemoveInvItems(self,ItUt_MuritanTooth,Npc_HasItems(self,ItUt_MuritanTooth));
			Trophy_MuritanTooth = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_MuritanTooth = FALSE;
		};
	};
};

instance ITAT_LEADERLURKER(C_Item)
{
	name = "Когти Рабоглава";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "G3_Item_AnimalTrophy_Claw_Lurker_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ITAT_LURKERLEADER;
	description = name;
	text[1] = NAME_WieldBonus1H;
	count[1] = 5;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITUT_LURKERLEADER(C_Item)
{
	name = "Когти Рабоглава";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_LURKERLEADER.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_LURKERLEADER()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_LURKERLEADER == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_LURKERLEADER);
			Npc_RemoveInvItems(self,ItUt_LURKERLEADER,Npc_HasItems(self,ItUt_LURKERLEADER));
			Trophy_LURKERLEADER = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_LURKERLEADER = FALSE;
		};
	};
};

instance ITAT_GARPIISERDCE(C_Item)
{
	name = "Сердце Руквайи";
	mainflag = ITEM_MISSION;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItAt_Heart_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ITAT_SERDCEGARPII;
	description = name;
	text[1] = NAME_Prot_Magic;
	count[1] = 5;
	text[3] = "Сердце королевы гарпий...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITUT_SERDCEGARPII(C_Item)
{
	name = "Сердце Руквайи";
	mainflag = ITEM_MISSION;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_SERDCEGARPII.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_SERDCEGARPII()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_SERDCEGARPII == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_SERDCEGARPII);
			Npc_RemoveInvItems(self,ItUt_SERDCEGARPII,Npc_HasItems(self,ItUt_SERDCEGARPII));
			Trophy_SERDCEGARPII = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_SERDCEGARPII = FALSE;
		};
	};
};

instance ItAt_ZubSkalo(C_Item)
{
	name = "Клык Скалозуба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 400;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_Skalozub;
	description = name;
	text[1] = NAME_TROPHY_STAMINA;
	count[1] = 2;
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_Skalozub(C_Item)
{
	name = "Клык Скалозуба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_Skalozub.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

func void Use_ItAt_Skalozub()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_Skalozub == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_Skalozub);
			Npc_RemoveInvItems(self,ItUt_Skalozub,Npc_HasItems(self,ItUt_Skalozub));
			Trophy_Skalozub = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_Skalozub = FALSE;
		};
	};
};

instance ITMI_UTONEPUMAPIECE(C_Item)
{
	name = "Каменный глаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_StonePumaPiece.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_STONEPUMAPIECE;
	description = name;
	text[1] = NAME_WieldBowBonus;
	count[1] = 5;
	text[3] = "Это глаз побежденной мною каменной пумы...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItUt_STONEPUMAPIECE(C_Item)
{
	name = "Каменный глаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_STONEPUMAPIECE.3ds";
	material = MAT_STONE;
	description = name;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

func void Use_ItAt_STONEPUMAPIECE()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_STONEPUMAPIECE == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_STONEPUMAPIECE);
			Npc_RemoveInvItems(self,ItUt_STONEPUMAPIECE,Npc_HasItems(self,ItUt_STONEPUMAPIECE));
			Trophy_STONEPUMAPIECE = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_STONEPUMAPIECE = FALSE;
		};
	};
};

instance ItAt_XragonSkull(C_Item)
{
	name = "Череп дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2500;
	visual = "ItAt_DragonSkull.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_DragonSkull;
	description = name;
	text[0] = NAME_RegenHealthSecLong;
	count[0] = 1;
	text[1] = NAME_RegenManaSecLong;
	count[1] = 1;
	text[2] = NAME_RegenStaminaSecLong;
	count[2] = 1;
	text[3] = "Этот череп принадлежал могущественному дракону...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_DragonSkull(C_Item)
{
	name = "Череп дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_DragonSkull.3DS";
	material = MAT_LEATHER;
	description = name;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
};

func void Use_ItAt_DragonSkull()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_DragonSkull == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_DragonSkull);
			Npc_RemoveInvItems(self,ItUt_DragonSkull,Npc_HasItems(self,ItUt_DragonSkull));
			Trophy_DragonSkull = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_DragonSkull = FALSE;
		};
	};
};

instance ItAt_HeadUrTrall(C_Item)
{
	name = "Голова Ур-Тралла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_UrTrallHead.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_UrTrallHead;
	description = name;
	text[1] = NAME_DamageOrcBonus;
	text[3] = "Эта голова принадлежала могучему вождю орков...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_UrTrallHead(C_Item)
{
	name = "Голова Ур-Тралла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_UrTrallHead.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_UrTrallHead()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_UrTrallHead == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_UrTrallHead);
			Npc_RemoveInvItems(self,ItUt_UrTrallHead,Npc_HasItems(self,ItUt_UrTrallHead));
			Trophy_UrTrallHead = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_UrTrallHead = FALSE;
		};
	};
};

instance ItAt_SkullWhiteTroll(C_Item)
{
	name = "Череп белого тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ITAT_DEMONSKULL.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_WhiteTrollSkull;
	description = name;
	text[1] = NAME_Bonus_HpMax;
	count[1] = 200;
	text[3] = "Этот череп принадлежал могущественному белому троллю...";
	text[4] = "Очень ценный и крайне редкий охотничий трофей...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_WhiteTrollSkull(C_Item)
{
	name = "Череп белого тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItTr_WhiteTrollSkull.3DS";
	material = MAT_LEATHER;
	description = name;
};

func void Use_ItAt_WhiteTrollSkull()
{
	if(Npc_IsPlayer(self))
	{
		if(Trophy_WhiteTrollSkull == FALSE)
		{
			B_ClearUseTrophy();
			ActivateZSSlot(self,"BIP01 PELVIS");
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
			Ext_PutInSlot(self,"BIP01 PELVIS",ItUt_WhiteTrollSkull);
			Npc_RemoveInvItems(self,ItUt_WhiteTrollSkull,Npc_HasItems(self,ItUt_WhiteTrollSkull));
			Trophy_WhiteTrollSkull = TRUE;
		}
		else
		{
			Ext_RemoveFromSlot(self,"BIP01 PELVIS");
			Trophy_WhiteTrollSkull = FALSE;
		};
	};
};