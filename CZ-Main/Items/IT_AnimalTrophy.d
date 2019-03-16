
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
	name = "Hlava kudlanky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BCKopf;
	visual = "ItAt_Blattcrawler_01.3DS";
	material = MAT_LEATHER;
	description = "Hlava kudlanky";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Meatbugflesh(C_Item)
{
	name = "Maso ze žravé štěnice";
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
	name = "Ovčí kůže";
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
	name = "Králičí kůže";
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
	name = "Vlčí kůže";
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
	name = "Kůže ledového vlka";
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
	name = "Kůže bílé pumy";
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
	name = "Kůže bílého trola";
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
	name = "Kusadla polního škůdce";
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
	name = "Drápy";
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
	name = "Drápy rudného důlního červa";
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
	name = "Drápy číhavce";
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
	name = "Zuby";
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
	name = "Kusadla důlního červa";
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
	name = "Kusadla pavouka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SpiderMandibles;
	visual = "G3_Item_AnimalTrophy_Teeth_MineCrawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Obsahují jed...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_Wing(C_Item)
{
	name = "Křídla";
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
	name = "Žihadlo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sting;
	scemeName = "FOOD";
	on_state[0] = Use_Sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Žihadlo krvavé mouchy, obsahuje jed...";
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
	name = "Kůže plaza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_ReptileSkin;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = "Kůže plaza";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WargFur(C_Item)
{
	name = "Kůže warga";
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
	name = "Kůže skřetího psa";
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
	name = "Kůže divočáka";
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
	name = "Roh dračího chňapavce";
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
	name = "Krunýř důlního červa";
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
	name = "Kůže stínové šelmy";
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
	name = "Kůže močálového žraloka";
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
	name = "Trolí kůže";
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
	name = "Kůže černého trola";
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
	name = "Kůže jeskynního černého trola";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItAt_TrollCaveBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_WaranFiretongue(C_Item)
{
	name = "Ohnivý jazyk";
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
	name = "Trolí jazyk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Celý jazyk je nasáklý jedovatými sekrety...";
	inv_animate = 1;
};

instance ItAt_ShadowHorn(C_Item)
{
	name = "Roh stínové šelmy";
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
	name = "Zub močálového žraloka";
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
	name = "Zub písečného červa";
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
	name = "Trolí tesák";
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
	name = "Srdce kamenného golema";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_StoneGolemHeart;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Zvyšuje ochranu proti fyzickému poškození o:";
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
	name = "Srdce ohnivého golema";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FireGolemHeart;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Zvyšuje ochranu proti ohni o:";
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
	name = "Srdce ledového golema";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IceGolemHeart;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Zvyšuje ochranu proti magii o:";
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
	name = "Srdce bažinného golema";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPGOLEMHEART;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Zvyšuje odolnost o:";
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
	name = "Gobliní kost";
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
	name = "Kost z kostlivce";
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
	name = "Alephova kost";
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
	name = "Srdce démona";
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
	name = "Srdce strážce Vakhanských síní";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITAT_DEMONHEART_SKY.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Vyzařuje magickou energii neuvěřitelné síly...";
	text[4] = "Srdce prastarého strážce Vakhanských síní...";
	inv_animate = 1;
};

instance ITAT_LUZIANHEART(C_Item)
{
	name = "Lucianovo srdce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITAT_DEMONHEART_SKY.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce prastarého démona Luciana...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_UndeadDragonSoulStone(C_Item)
{
	name = "Kámen s duší nemrtvého draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_UndeadDragonSoulStone;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Kámen s duší mocného Beliarova vtělení...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItAt_IcedragonHeart(C_Item)
{
	name = "Srdce ledového draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_IcedragonHeart;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného ledového draka Finkregha...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_RockdragonHeart(C_Item)
{
	name = "Srdce kamenného draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RockdragonHeart;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného kamenného draka Pedrakhana...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_SwampdragonHeart(C_Item)
{
	name = "Srdce bažinného draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwampdragonHeart;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného bažinného draka Pandrodora...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_FiredragonHeart(C_Item)
{
	name = "Srdce ohnivého draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného ohnivého draka Feomathara...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DragonHeart(C_Item)
{
	name = "Dračí srdce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_Heart_03.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného draka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_REDDRAGONHEART(C_Item)
{
	name = "Srdce rudého draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_ReddragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného rudého draka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_BLACKDRAGONHEART(C_Item)
{
	name = "Srdce temného draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_DemonDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného černého draka Azgalora...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_UzdragonHeart(C_Item)
{
	name = "Srdce černého dračího strážce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_BlackDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného dračího strážce...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_GOLDDRAGONHEART(C_Item)
{
	name = "Srdce zlatého draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_FiredragonHeart;
	visual = "ItAt_GoldDragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Srdce mocného zlatého draka Ashtara...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_DragonBlood(C_Item)
{
	name = "Dračí krev";
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
	name = "Dračí šupiny";
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
	name = "Kůže černé pumy";
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
	name = "Kůže slokerse";
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
	name = "Vejce důlního červa";
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
	name = "Játra černého chňapavce";
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
	name = "Smažené maso ze žravé štěnice";
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
	name = "Smažená ryba";
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
	name = "Houbová polévka";
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
	name = "Masové ragú";
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
	name = "Ovčí kůže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Kůže ovce, kterou někdo ukradl Pepemu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_OlderHead(C_Item)
{
	name = "Hlava stařešiny";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "Orc_HeadWarrior.MMS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Hlava skřetího stařešiny...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
};

instance ItAt_SpiderEgg(C_Item)
{
	name = "Pavoučí vejce";
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
	name = "Lebka démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ITAT_DEMONSKULL.3DS";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Lebka mocného démona...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

//--------------------------redkiye trofei----------------------------

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
	name = "Kamenný dráp";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_StoneClaw(C_Item)
{
	name = "Kamenný dráp";
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
	name = "Černý zub";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_BlackTeeth(C_Item)
{
	name = "Černý zub";
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
	name = "Zkamenělý páteřní osten";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_IshiCurrat(C_Item)
{
	name = "Zkamenělý páteřní osten";
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
	name = "Roh Utura";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_UturTrollHorn(C_Item)
{
	name = "Roh Utura";
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
	name = "Plát z krunýře Karakusta";
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
	text[3] = "Obrovský plát z krunýře krále důlních červů...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItUt_CaracustPlate(C_Item)
{
	name = "Plát z krunýře Karakusta";
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
	name = "Jedovatý tesák Muritana";
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
	text[3] = "V tesáku se nashromáždil jed...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItLs_BeltCandle(C_Item)
{
	name = "Svítící lucerna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "NW_CITY_CANDLELANTERN_01.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	on_state[0] = Use_ItLs_BeltCandle;
	description = name;
	text[4] = "Můžu si ji nasadit...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_FireBeltCandle(C_Item)
{
	name = "Svítící lucerna";
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
	name = "Jedovatý tesák Muritana";
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
	text[3] = "V tesáku se nashromáždil jed...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_MuritanTooth(C_Item)
{
	name = "Jedovatý tesák Muritana";
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
	name = "Drápy Raboglava";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITUT_LURKERLEADER(C_Item)
{
	name = "Drápy Raboglava";
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
	name = "Rukvayino srdce";
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
	text[3] = "Srdce královny harpyjí...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITUT_SERDCEGARPII(C_Item)
{
	name = "Rukvayino srdce";
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
	name = "Tesák Skalozuba";
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
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItUt_Skalozub(C_Item)
{
	name = "Tesák Skalozuba";
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
	name = "Kamenné oko";
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
	text[3] = "Oko kamenné pumy, kterou jsem skolil...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItUt_STONEPUMAPIECE(C_Item)
{
	name = "Kamenné oko";
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
	name = "Dračí lebka";
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
	text[3] = "Lebka mocného draka...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_DragonSkull(C_Item)
{
	name = "Dračí lebka";
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
	name = "Hlava Ur-Thralla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItAt_UrTrallHead.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItAt_UrTrallHead;
	description = name;
	text[1] = NAME_DamageOrcBonus;
	text[3] = "Hlava mocného vůdce skřetů...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_UrTrallHead(C_Item)
{
	name = "Hlava Ur-Thralla";
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
	name = "Lebka bílého trola";
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
	text[3] = "Lebka mocného bílého trola...";
	text[4] = "Velice hodnotná a mimořádně vzácná lovecká trofej...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_roty = 180;
	inv_animate = 1;
};

instance ItUt_WhiteTrollSkull(C_Item)
{
	name = "Lebka bílého trola";
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