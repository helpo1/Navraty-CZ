/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

instance ItAr_Pal_Helm - opraven název (Helma rytíře -> Helma paladina)

*/




const int Value_SwordBlade = 2;
const int Value_SwordBladeHot = 10;
const int Value_SwordRawHot = 10;
const int Value_SwordRaw = 10;
const int Value_Brush = 3;
const int Value_Flask = 5;
const int Value_Stomper = 3;
const int Value_Pan = 5;
const int Value_Saw = 5;
const int Value_Broom = 5;
const int Value_Rake = 5;
const int Value_Hammer = 5;
const int Value_Scoop = 3;
const int Value_Nugget = 30;
const int VALUE_SNUGGET = 10;
const int VALUE_NUGGET_PAL = 5;
const int Value_Joint = 20;
const int VALUE_REDJOINT = 500;
const int Value_Alarmhorn = 10;
const int Value_Lute = 10;
const int Value_Gold = 1;
const int Value_RuneBlank = 1000;
const int Value_Sulfur = 25;
const int Value_Quartz = 20;
const int Value_Pitch = 10;
const int Value_Rockcrystal = 40;
const int Value_Aquamarine = 100;
const int Value_HolyWater = 30;
const int Value_Coal = 5;
const int Value_DarkPearl = 500;
const int VALUE_ItMi_ApfelTabak = 8;
const int VALUE_ItMi_PilzTabak = 16;
const int VALUE_ItMi_SumpfTabak = 12;
const int VALUE_ItMi_DoppelTabak = 17;
const int VALUE_ItMi_HonigTabak = 15;
const int Value_SilverRing = 30;
const int Value_SilverNecklace = 60;
const int Value_SilverCandleHolder = 50;
const int Value_SilverPlate = 80;
const int Value_SilverCup = 70;
const int Value_SilverChalice = 100;
const int Value_GoldPlate = 100;
const int Value_GoldRing = 50;
const int Value_GoldNecklace = 90;
const int Value_GoldCandleHolder = 100;
const int Value_GoldCup = 110;
const int Value_BloodCup = 500;
const int Value_GoldChalice = 150;
const int Value_GoldChest = 500;
const int Value_JeweleryChest = 650;
const int VALUE_GOLDCHEST_EMPTY = 300;
const int VALUE_JEWELERYCHEST_EMPTY = 400;
const int Value_InnosStatue = 100;
const int Value_Sextant = 150;
const int Ri_GrahShar = 20;
const int Value_Goldnugget = 50;
const int Value_WhitePearl = 80;
const int Value_Addon_Joint_01 = 60;
const int VALUE_ADDON_JOINT_02 = 80;
const int VALUE_ADDON_JOINT_03 = 100;

var int FirstJoint;
var int bonus_joint_02;
var int bonus_joint_03;
var int jewelerychestpearl;

instance ItMi_Addon_GoldNugget(C_Item)
{
	name = "Zlatý nuget";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Osair_GoldNugget(C_Item)
{
	name = "Hrudka zlaté rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItMi_Addon_WhitePearl(C_Item)
{
	name = "Perla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_WhitePearl;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_SPECIALJOINT(C_Item)
{
	name = "Přivolávač snu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Addon_Joint_01 * 10;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = usespecialjoint;
	description = name;
	text[3] = "Tohle stéblo trávy má mnohem silnější účinky než ty obyčejné...";
	text[4] = "Dárek pro Baala Parveze...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

func void usespecialjoint()
{
	AI_StartState(self,ZS_MagicSleep,1,"");
};


instance ItMi_BaltramPaket(C_Item)
{
	name = "Baltramova zásilka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Těžký balík plný dobrých věcí";
	text[4] = "od farmáře Akila...";
	inv_animate = 1;
};

instance ItMi_LoaPartyFood(C_Item)
{
	name = "Balík jídla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík plný svěžího a chutného jídla...";
	inv_animate = 1;
};

instance ItMi_SkipShipPack(C_Item)
{
	name = "Balík součástek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík se součástkami pro lodní kormidlo...";
	inv_animate = 1;
};

instance ItMi_Packet_Baltram4Skip_Addon(C_Item)
{
	name = "Balík pro Skipa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Těžký balík plný dobrých věcí";
	text[4] = "určen pirátu Skipovi...";
	inv_animate = 1;
};

instance ItMi_BromorsGeld_Addon(C_Item)
{
	name = "Bromorova zlatá mísa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Na dně mísy je něčím ostrým vyryto jméno 'Bromor'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name = "Cavalornův kožený měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_CavalornsBeutel;
	description = name;
	text[4] = "Na měšci je vyšito jméno 'Cavalorn'...";
	inv_animate = 1;
};


func void Use_CavalornsBeutel()
{
	CreateInvItems(hero,ItMi_Nugget,1);
	AI_Print(PRINT_FoundOreNugget);
	SC_OpenedCavalornsBeutel = TRUE;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"Uvnitř Cavalornovy chatrče v Hornickém údolí jsem našel měšec s hrudkou rudy. Cavalorn, ten starý darebák, ho tady musel zapomenout.");
};


instance ItMi_Skull(C_Item)
{
	name = "Lebka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	inv_animate = 1;
};

instance ItMi_IECello(C_Item)
{
	name = "Violoncello";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemeName = "CELLO";
	on_state[0] = Use_Cello;
	description = name;
	inv_animate = 1;
};


func void Use_Cello()
{
};

instance ItMi_IEDrum(C_Item)
{
	name = "Buben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemeName = "PAUKE";
	on_state[0] = Use_Drum;
	description = name;
	inv_animate = 1;
};


func void Use_Drum()
{
};


instance ItMi_IEDrumScheit(C_Item)
{
	name = "Trumšajt";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemeName = "DRUMSCHEIT";
	on_state[0] = Use_Drumscheit;
	description = name;
	inv_animate = 1;
};


func void Use_Drumscheit()
{
};


instance ItMi_IEDrumStick(C_Item)
{
	name = "Bubenická palička";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
	inv_animate = 1;
};

instance ItMi_IEDudelBlau(C_Item)
{
	name = "Modré dudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
	inv_animate = 1;
};


func void Use_Dudel()
{
};


instance ItMi_IEDudelGelb(C_Item)
{
	name = "Žluté dudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemeName = "DUDEL";
	on_state[0] = Use_Dudel;
	description = name;
	inv_animate = 1;
};

instance ItMi_IEHarfe(C_Item)
{
	name = "Harfa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemeName = "HARFE";
	on_state[0] = Use_Harfe;
	description = name;
	inv_animate = 1;
};


func void Use_Harfe()
{
};


instance ItMi_IELaute(C_Item)
{
	name = "Loutna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemeName = "IELAUTE";
	on_state[0] = Use_Laute;
	description = name;
	inv_animate = 1;
};


func void Use_Laute()
{
};


instance ItMi_Addon_Lennar_Paket(C_Item)
{
	name = "Cinkající balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_LennarPaket;
	material = MAT_LEATHER;
	description = name;
	text[4] = "Uvnitř balíku nečo cinká...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_LennarPaket()
{
	B_PlayerFindItem(ItKE_lockpick,Lennar_picklock_amount);
	Snd_Play("Geldbeutel");
	LennarPaket_Open = TRUE;
};

instance ItMi_Zeitspalt_Addon(C_Item)
{
	name = "Černá ruda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "KOHLE_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Ruda s velice vzácnou strukturou...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Silber(C_Item)
{
	name = "Stříbrný nuget";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "MOON_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_MoonStone(C_Item)
{
	name = "Měsíční kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "MOON_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Ruda s mimořádně vzácnou strukturou...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Adamant(C_Item)
{
	name = "Adamant";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50000;
	visual = "SILVER_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Ruda s mimořádně odolnou strukturou...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//----------------------------------------------------------------------------------

instance ItMi_Addon_Joint_01(C_Item)
{
	name = "Zelený novic";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Addon_Joint_01;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Addon_Joint_01;
	description = name;
	text[2] = "Mírně zahání únavu...";
	text[3] = "Mimořádné účinky na Guru a templáře...";
	text[4] = NAME_Duration;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_JOINT_02(C_Item)
{
	name = "Severní soumrak";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ADDON_JOINT_02;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_joint_02;
	description = name;
	text[2] = "Mírně zahání únavu...";
	text[3] = "Mimořádné účinky na Guru a templáře...";
	text[4] = NAME_Duration;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_JOINT_03(C_Item)
{
	name = "Přivolávač snu";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ADDON_JOINT_03;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_joint_03;
	description = name;
	text[2] = "Mírně zahání únavu...";
	text[3] = "Mimořádné účinky na Guru a templáře...";
	text[4] = NAME_Duration;
	count[4] = 20;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

func void Use_Addon_Joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if((SBMODE == TRUE) && (JointRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 2;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			JointRest = TRUE;
		};
		if(FirstJoint == FALSE)
		{
			FirstJoint = TRUE;
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,3);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		};
		if((JointBonusType == FALSE) && (JointBonusDef != Wld_GetDay()) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)))
		{
			JointBonusDef = Wld_GetDay();
			JointBonusType = 1;

			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + JointBonus_01;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + JointBonus_01;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + JointBonus_01;
				AI_Print("Pohroužíš se do stavu magické koncentrace...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_01;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_01;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_01;
				AI_Print("Pohroužíš se do stavu bojové koncentrace...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Prožíváš obvyklé pocity...");
		};
	};
};

func void use_itmi_joint_02()
{
	if(Npc_IsPlayer(self))
	{
		if((SBMODE == TRUE) && (JointRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 3;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			JointRest = TRUE;
		};

		BONUS_JOINT_02 += 1;

		if(SECONDJOINT == FALSE)
		{
			B_GivePlayerXP(100);
			SECONDJOINT = TRUE;
		};
		if(BONUS_JOINT_02 >= 25)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
			Npc_ChangeAttribute(self,ATR_MANA,1);
			BONUS_JOINT_02 = 0;
		};
		if((JointBonusType == FALSE) && (JointBonusDef != Wld_GetDay()) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)))
		{
			JointBonusDef = Wld_GetDay();
			JointBonusType = 2;

			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + JointBonus_02;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + JointBonus_02;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + JointBonus_02;
				MagicMeditation = TRUE;
				AI_Print("Pohroužíš se do stavu magické meditace...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_02;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_02;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_02;
				FightMeditation = TRUE;
				AI_Print("Pohroužíš se do stavu bojové meditace...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Prožíváš obvyklé pocity...");
		};
	};
};

func void use_itmi_joint_03()
{
	if(Npc_IsPlayer(self))
	{
		if((SBMODE == TRUE) && (JointRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 4;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			JointRest = TRUE;
		};

		BONUS_JOINT_03 += 1;

		if(THIRDJOINT == FALSE)
		{
			B_GivePlayerXP(250);
			THIRDJOINT = TRUE;
		};
		if(BONUS_JOINT_03 >= 25)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,3);
			Npc_ChangeAttribute(self,ATR_MANA,3);
			BONUS_JOINT_03 = 0;
		};
		if((JointBonusType == FALSE) && (JointBonusDef != Wld_GetDay()) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)))
		{
			JointBonusDef = Wld_GetDay();
			JointBonusType = 3;

			if(hero.guild == GIL_GUR)
			{
				hero.protection[PROT_FIRE] = hero.protection[PROT_FIRE] + JointBonus_03;
				hero.protection[PROT_MAGIC] = hero.protection[PROT_MAGIC] + JointBonus_03;
				hero.protection[PROT_FLY] = hero.protection[PROT_FLY] + JointBonus_03;
				MagicMeditation = TRUE;
				ATR_INTELLECT += 50;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Pohroužíš se do stavu magického transu...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_03;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_03;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_03;
				FightMeditation = TRUE;
				WarTranse = TRUE;
				AI_Print("Pohroužíš se do stavu bojového transu...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Prožíváš obvyklé pocity...");
		};
	};
};

instance ItMi_Stomper(C_Item)
{
	name = "Pres";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stomper;
	visual = "ItMi_Stomper.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_BROTSCHIEBER(C_Item)
{
	name = "Sázecí lopata";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Stomper;
	visual = "ITMI_BROTSCHIEBER.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_RuneBlank(C_Item)
{
	name = "Runový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_GoblinRune(C_Item)
{
	name = "Runa gobliního šamana";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItRu_Druid_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_UpRuneBlank(C_Item)
{
	name = "Starší runový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HighRuneBlank(C_Item)
{
	name = "Vyšší runový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_PyroRune(C_Item)
{
	name = "Pyrokarův runový kámen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RuneBlank;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_PyroRune;
	text[4] = "Tahle runa dokáže pohlcovat magickou energii...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItMi_PyroRune()
{
	if((Npc_GetDistToWP(hero,"MAGICPLACE_01") < 1000) || (Npc_GetDistToWP(hero,"MAGICPLACE_02") < 1000) || (Npc_GetDistToWP(hero,"MAGICPLACE_03") < 1000) || (Npc_GetDistToWP(hero,"MAGICPLACE_04") < 1000) || (Npc_GetDistToWP(hero,"WP_ORCCAMP_INNER_15") < 1000))
	{
		if((Npc_GetDistToWP(hero,"MAGICPLACE_01") < 1000) && (MagicPlace01 == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_PRACTICEMAGIC5");
			MagicPlace01 = TRUE;

			if((MagicPlace01 == TRUE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE) && (MagicPlace04 == TRUE) && (MagicPlace05 == TRUE))
			{
				CreateInvItems(hero,ItRu_PyroRune,1);
				AI_Print(PRINT_MagicRuneFull);
				B_LogEntry(TOPIC_XRANFREG,"Myslím, že množství magické energie v runě už je dostatečné na to, abych s její pomocí toho kamenného golema zničil... Kde ho ale najít - to je otázka.");
			}
			else
			{
				CreateInvItems(hero,ItMi_PyroRune,1);
				AI_Print(PRINT_MagicRunePart);
			};
		}
		else if((Npc_GetDistToWP(hero,"MAGICPLACE_02") < 1000) && (MagicPlace02 == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_PRACTICEMAGIC5");
			MagicPlace02 = TRUE;

			if((MagicPlace01 == TRUE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE) && (MagicPlace04 == TRUE) && (MagicPlace05 == TRUE))
			{
				CreateInvItems(hero,ItRu_PyroRune,1);
				AI_Print(PRINT_MagicRuneFull);
				B_LogEntry(TOPIC_XRANFREG,"Myslím, že množství magické energie v runě je už dostatečné na to, abych s její pomocí toho kamenného golema zničil... Kde ho ale najít - to je otázka.");
			}
			else
			{
				CreateInvItems(hero,ItMi_PyroRune,1);
				AI_Print(PRINT_MagicRunePart);
			};
		}
		else if((Npc_GetDistToWP(hero,"MAGICPLACE_03") < 1000) && (MagicPlace03 == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_PRACTICEMAGIC5");
			MagicPlace03 = TRUE;

			if((MagicPlace01 == TRUE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE) && (MagicPlace04 == TRUE) && (MagicPlace05 == TRUE))
			{
				CreateInvItems(hero,ItRu_PyroRune,1);
				AI_Print(PRINT_MagicRuneFull);
				B_LogEntry(TOPIC_XRANFREG,"Myslím, že množství magické energie v runě je už dostatečné na to, abych s její pomocí toho kamenného golema zničil... Kde ho ale najít - to je otázka.");
			}
			else
			{
				CreateInvItems(hero,ItMi_PyroRune,1);
				AI_Print(PRINT_MagicRunePart);
			};
		}
		else if((Npc_GetDistToWP(hero,"MAGICPLACE_04") < 1000) && (MagicPlace04 == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_PRACTICEMAGIC5");
			MagicPlace04 = TRUE;

			if((MagicPlace01 == TRUE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE) && (MagicPlace04 == TRUE) && (MagicPlace05 == TRUE))
			{
				CreateInvItems(hero,ItRu_PyroRune,1);
				AI_Print(PRINT_MagicRuneFull);
				B_LogEntry(TOPIC_XRANFREG,"Myslím, že množství magické energie v runě je už dostatečné na to, abych s její pomocí toho kamenného golema zničil... Kde ho ale najít - to je otázka.");
			}
			else
			{
				CreateInvItems(hero,ItMi_PyroRune,1);
				AI_Print(PRINT_MagicRunePart);
			};
		}
		else if((Npc_GetDistToWP(hero,"WP_ORCCAMP_INNER_15") < 1000) && (MagicPlace05 == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			AI_PlayAni(hero,"T_PRACTICEMAGIC5");
			MagicPlace05 = TRUE;

			if((MagicPlace01 == TRUE) && (MagicPlace02 == TRUE) && (MagicPlace03 == TRUE) && (MagicPlace04 == TRUE) && (MagicPlace05 == TRUE))
			{
				CreateInvItems(hero,ItRu_PyroRune,1);
				AI_Print(PRINT_MagicRuneFull);
				B_LogEntry(TOPIC_XRANFREG,"Myslím, že množství magické energie v runě je už dostatečné na to, abych s její pomocí toho kamenného golema zničil... Kde ho ale najít - to je otázka.");
			}
			else
			{
				CreateInvItems(hero,ItMi_PyroRune,1);
				AI_Print(PRINT_MagicRunePart);
			};
		}
		else 
		{
			CreateInvItems(hero,ItMi_PyroRune,1);
			B_Say(hero,hero,"$DONTWORK");
			AI_Print(PRINT_NoMagicPlace);
		};
	}
	else
	{
		CreateInvItems(hero,ItMi_PyroRune,1);
		B_Say(hero,hero,"$DONTWORK");
		AI_Print(PRINT_NoMagicPlace);
	};
};

instance ItMi_GalomRuneBack(C_Item)
{
	name = "Neobvyklý runový kámen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItRu_TeleportXardas.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_GalomRuneBack;
	description = name;
	text[4] = "Vyzařuje magickou energii...";
	inv_animate = 1;
};

func void Use_ItMi_GalomRuneBack()
{
	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
		Snd_Play("MFX_TELEPORT_CAST");
		AI_Teleport(hero,"PW_OUT_TO_IN_CHAMBERS");
	};
};

instance ItMi_Pliers(C_Item)
{
	name = "Kleště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kleště na tesání a práci se dřevem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_AnvilPliers(C_Item)
{
	name = "Kovářské kleště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_AnvilPliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kleště na kování a tavení kovů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Flask(C_Item)
{
	name = "Alchymistická lahvička";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Flask;
	visual = "ItMi_AlchFlask_New_01.3ds";
	material = MAT_GLAS;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Hammer(C_Item)
{
	name = "Kladivo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Hammer;
	visual = "G3_Item_Tools_Hammer_Claw_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Scoop(C_Item)
{
	name = "Lžíce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Scoop;
	visual = "G3_Item_Tool_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Pan(C_Item)
{
	name = "Pánev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Pan;
	visual = "G3_Item_Tool_Pan_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_PanFull(C_Item)
{
	name = "Pánev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Pan;
	visual = "ItMi_PanFull.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Saw(C_Item)
{
	name = "Pila";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Saw;
	visual = "ItMi_Saw_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMiSwordraw(C_Item)
{
	name = "Surová ocel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwordRaw;
	//visual = "ItMiSwordraw.3DS";
	visual = "G3_OBJECTS_IRON_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMISWORDRAWHOT_1(C_Item)
{
	name = "Rozžhavená ocel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwordRawHot;
	//visual = "ItMiSwordrawhot.3DS";
	visual = "G3_OBJECTS_IRON_02.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "Rozžhavená čepel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwordBladeHot;
	visual = "ItMiSwordbladehot.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMISWORDBLADE_1(C_Item)
{
	name = "Čepel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SwordBlade;
	visual = "ItMiSwordblade.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = NAME_SHARP;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Broom(C_Item)
{
	name = "Koště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Broom;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemeName = "BROOM";
	on_state[0] = Use_Broom;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Broom()
{
	if(Npc_IsPlayer(self) && (BroomBONUS == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 50;
		AI_NoticePrint(3000,4098,NAME_Addon_BroomBonus);
		BroomBONUS = TRUE;
	};
	if(Npc_IsPlayer(self))
	{
		if((MIS_ParlanFegen == LOG_Running) && (Npc_GetDistToWP(hero,"NW_MONASTERY_MAGE03_01") < 300))
		{
			if(NOV_Helfer < 4)
			{
				B_Say(self,self,"$NOSWEEPING");
				AI_Print(PRINT_NoSweeping);
			}
			else
			{
				AI_Print("Teď už tady vypadá čistěji...");
				NOV_Helfer = NOV_Helfer + 1;
			};
		};
	};
};

instance ItMi_Lute(C_Item)
{
	name = "Loutna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Lute;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = Use_Lute;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_Lute()
{
	if(Npc_IsPlayer(self))
	{
		if(LUTEBONUS == FALSE)
		{
			Snd_Play("LevelUp");
			hero.exp = hero.exp + 50;
			AI_NoticePrint(3000,4098,NAME_Addon_MusicBonus);
			LUTEBONUS = TRUE;
		};
	};
};


instance ItMi_Brush(C_Item)
{
	name = "Kartáč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Brush;
	visual = "ItMi_Brush.3ds";
	material = MAT_WOOD;
	scemeName = "BRUSH";
	on_state[0] = Use_Brush;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Brush()
{
	if(Npc_IsPlayer(self) && (BRUSHBONUS == FALSE))
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 50;
		AI_NoticePrint(3000,4098,NAME_Addon_ClearBonus);
		BRUSHBONUS = TRUE;
	};
};

instance ItMi_Smoke_Pipe(C_Item)
{
	name = "Dýmka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "G3_Item_Smoke_Pipe_02.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_ItMi_Smoke_Pipe;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

func void Use_ItMi_Smoke_Pipe()
{
	if(Npc_IsPlayer(self))
	{
		CreateInvItems(self,ItMi_Smoke_Pipe,1);
	};
};

instance ItMi_Joint(C_Item)
{
	name = "Stéblo trávy z bažin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Joint;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Joint;
	description = name;
	text[2] = "Mírně zahání únavu...";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};


func void Use_Joint()
{
	if(Npc_IsPlayer(self))
	{
		if((SBMODE == TRUE) && (JointRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 1;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			JointRest = TRUE;
		};
	};
};


instance ITMI_REDJOINT(C_Item)
{
	name = "Stéblo červené trávy z bažin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_REDJOINT;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_redjoint;
	description = name;
	text[2] = "Účinky neznámé...";
	text[4] = "Tohle stéblo je ubaleno z červené trávy z bažin...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};


func void use_itmi_redjoint()
{
	if(Npc_IsPlayer(self))
	{
		//Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);

		if((SBMODE == TRUE) && (JointRest == FALSE))
		{
			Hero_Fatigue = Hero_Fatigue + 10;

			if(Hero_Fatigue >= 10)
			{
				Hero_Fatigue = 10;
			};

			JointRest = TRUE;
		};
		if(REDSWAMPBONUS == FALSE)
		{
			B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,3);
			Snd_Play("LevelUp");
			REDSWAMPBONUS = TRUE;
		};
		if((MIS_REDJOINT == LOG_Running) && (TESTSWAMPHERBREADY == TRUE))
		{
			MIS_REDJOINT = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_REDJOINT,LOG_SUCCESS);
		};
	};
};


instance ItMi_Packet(C_Item)
{
	name = "Balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void UsePacket()
{
};

instance ItMi_VatrasPacket(C_Item)
{
	name = "Lobartův balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Balík se zásobami jídla pro Vatrase...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Pocket(C_Item)
{
	name = "Kožený měšec";
	mainflag = ITEM_KAT_NONE | ITEM_MULTI;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UsePocket;
	description = name;
	text[4] = "Malý měšec, nepříliš těžký...";
	inv_animate = 1;
};

func void UsePocket()
{
	CreateInvItems(hero,ItMi_Gold,10);
	AI_Print(PRINT_FoundGold10);
	Snd_Play("Geldbeutel");
};

instance ItMi_Nugget(C_Item)
{
	name = "Magická ruda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Nugget_New.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_IronStuck(C_Item)
{
	name = "Železný ingot";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_IronStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_StuckGold(C_Item)
{
	name = "Zlatý ingot";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 250;
	visual = "ItMi_GoldStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_OreStuck(C_Item)
{
	name = "Ingot magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_SNUGGET(C_Item)
{
	name = "Železná ruda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_IronNugget.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ITMI_TESTNUGGET(C_Item)
{
	name = "Hrudka rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Hrudka rudy z ryzí rudné žíly...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Gold(C_Item)
{
	name = "Zlatá mince";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Gold;
	visual = "ItMi_Gold.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	//inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_OldCoin(C_Item)
{
	name = "Stará mince";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ITMI_BELIAR_GOLD(C_Item)
{
	name = "Prokleté zlato";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Gold.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_HolderGoldCandle(C_Item)
{
	name = "Zlatý svícen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldCandleHolder;
	visual = "ItMi_GoldCandleHolder_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_NecklaceGold(C_Item)
{
	name = "Zlatý náhrdelník";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_GoldNecklace;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SilverRing(C_Item)
{
	name = "Stříbrný prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_SilverRing;
	visual = "ItMi_Ring_Silver_New_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SilverCup(C_Item)
{
	name = "Stříbrný pohár";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SilverCup;
	visual = "ItMi_SilverCup_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SilverPlate(C_Item)
{
	name = "Stříbrný talíř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SilverPlate;
	visual = "ItMi_SilverPlate_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_PlateGold(C_Item)
{
	name = "Zlatý talíř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_CupGold(C_Item)
{
	name = "Zlatý pohár";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldCup;
	visual = "ItMi_GoldCup_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HarimCup(C_Item)
{
	name = "Kharimův zlatý pohár";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Na okraji poháru jsou vyryta tyhle slova:";
	text[4] = "'Nejlepšímu bojovníkovi arény Starého tábora od Gomeze...'";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_GOMEZGOLDCUP(C_Item)
{
	name = "Číše rudobarona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 700;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_ZloodCup_MIS(C_Item)
{
	name = "Krvavý kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BloodCup;
	visual = "ItMi_BloodCup_MIS_Sky.3DS";
	material = MAT_METAL;
	description = "Krvavý kalich";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_RingGold(C_Item)
{
	name = "Zlatý prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_Ring_Gold_New_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_RAVENGOLDRING(C_Item)
{
	name = "Zlatý prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_Ring_Gold_New_Raven.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Na prstenu je vyryto jméno 'Raven'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD * 3;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SilverChalice(C_Item)
{
	name = "Stříbrný kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SilverChalice;
	visual = "ItMi_SilverChalice_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_ChaliceGold(C_Item)
{
	name = "Zlatý kalich";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldChalice;
	visual = "ItMi_GoldChalice_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_ChestGold(C_Item)
{
	name = "Zlatá skříňka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldChest;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_goldchest;
	description = name;
	text[4] = "Zamčená zlatá skříňka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

func void use_itmi_goldchest()
{
	var int goldchestrandom;
	var string concatText;

	if(Npc_IsPlayer(self))
	{
		if(BELIARCURSEYOU == TRUE)
		{
			AI_Print("Uvnitř nic není...");
		}
		else
		{
			goldchestrandom = 100;
			CreateInvItems(self,ItMi_Gold,goldchestrandom);
			concatText = ConcatStrings("Našel jsi ",IntToString(goldchestrandom));
			concatText = ConcatStrings(concatText," zlatých mincí...");
			AI_Print(concatText);
		};

		CreateInvItems(self,ITMI_CHEST_EMPTYGOLD,1);
	};
};

instance ItMi_JeweleryChest(C_Item)
{
	name = "Šperkovnice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest_Sky.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_jewelerychest;
	description = name;
	text[4] = "Zamčená šperkovnice...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_jewelerychest()
{
	var int jewelerychestrandom;
	if(Npc_IsPlayer(self))
	{
		jewelerychestrandom = Hlp_Random(100);

		if(BELIARCURSEYOU == TRUE)
		{
			jewelerychestrandom = 0;
		};
		if(jewelerychestrandom >= 75)
		{
			CreateInvItems(self,ItMi_Addon_WhitePearl,1);
			CreateInvItems(self,ItMi_Aquamarine,1);
			CreateInvItems(self,ItMi_OldCoin,3);
			JEWELERYCHESTPEARL += 1;
			AI_Print("Našel jsi několik drahých kamenů!");
		}
		else if(jewelerychestrandom >= 50)
		{
			CreateInvItems(self,ItMi_SilverRing,1);
			CreateInvItems(self,ItMi_RingGold,1);
			CreateInvItems(self,ItMi_SilverNecklace,1);
			JEWELERYCHESTPEARL += 1;
			AI_Print("Našel jsi několik drahých šperků!");
		}
		else if(jewelerychestrandom >= 25)
		{
			CreateInvItems(self,ItMi_OldCoin,13);
			JEWELERYCHESTPEARL += 1;
			AI_Print("Našel jsi několik starých mincí!");
		}
		else
		{
			AI_Print("Uvnitř nic není...");
			JEWELERYCHESTPEARL += 1;
		};
		if(JEWELERYCHESTPEARL == 2)
		{
			CreateInvItems(self,ItMi_DarkPearl,1);
			JEWELERYCHESTPEARL = 0;
			if(jewelerychestrandom < 25)
			{
				AI_Print("... tedy téměř nic");
			};
		};
		CreateInvItems(self,itmi_jewelerychest_empty,1);
	};
};


instance ITMI_CHEST_EMPTYGOLD(C_Item)
{
	name = "Zlatá skříňka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_GOLDCHEST_EMPTY;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Prázdná zlatá skříňka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ITMI_JEWELERYCHEST_EMPTY(C_Item)
{
	name = "Šperkovnice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_JEWELERYCHEST_EMPTY;
	visual = "ItMi_JeweleryChest_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Prázdná šperkovnice...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TGoblin(C_Item)
{
	name = "Zlatá soška";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_GoblinReliq.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	description = name;
	text[4] = "Vypadá jako soška nějakého božství...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_InnosStatue(C_Item)
{
	name = "Soška Innose";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_InnosStatue;
	visual = "ItMi_InnosStatue_Sky.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	description = name;
	on_state[0] = Use_ItMi_InnosStatue;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_animate = 1;
};

func void Use_ItMi_InnosStatue()
{
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		AI_PlayAni(hero,"T_STAND_2_PRAY");
		B_Say(self,self,"$HELLO_INNOS");
		PrayMobileCheck = TRUE;
		AI_ProcessInfos(her);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};
	};
};

//-------------------------Mol'ba-----------------------

instance PC_PRAYMOBILE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PRAYMOBILE_end_condition;
	information = PC_PRAYMOBILE_end_info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_PRAYMOBILE_end_condition()
{
	if(PrayMobileCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_PRAYMOBILE_end_info()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DIALOGSCOPE_FX");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	PrayMobileCheck = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	AI_PlayAni(hero,"T_PRAY_2_STAND");
};

instance PC_PRAYMOBILE_DO(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PRAYMOBILE_DO_condition;
	information = PC_PRAYMOBILE_DO_info;
	permanent = TRUE;
	description = "Pomodlit se";
};

func int PC_PRAYMOBILE_DO_condition()
{
	if(PrayMobileCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_PRAYMOBILE_DO_info()
{
	if(hero.guild != GIL_KDM)
	{
		if(PrayDay != Wld_GetDay())
		{
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
			{
				B_GivePlayerXP(10);
				INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
			}
			else
			{
				if(hero.guild == GIL_NOV)
				{
					B_GivePlayerXP(5);
				};

				INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
			};

			RankPoints = RankPoints + 1;
			PrayDay = Wld_GetDay();
			AI_Print(Print_BlessNone);
		}
		else
		{
			AI_Print(PRINT_ENOUGHTPRAY);
		};
	}
	else
	{
		AI_Print(PRINT_BLESSNONEKDM);
	};
};

instance ItMi_Statue_Demon_01(C_Item)
{
	name = "Soška";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "Statue_Demon_01.3ds";
	scemeName = "MAP";
	material = MAT_STONE;
	on_state[0] = Use_ItMi_Statue_Demon_01;
	description = "Soška démona";
	text[4] = "Vzácná mramorová soška démona...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_animate = 1;
};

func void Use_ItMi_Statue_Demon_01()
{
	var C_Npc her;

	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		AI_PlayAni(hero,"T_STAND_2_PRAY");
		B_Say(self,self,"$HELLO_BELIAR");
		IdolMobileCheck = TRUE;
		AI_ProcessInfos(her);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};
	};
};

instance PC_IDOLMOBILE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_IDOLMOBILE_end_condition;
	information = PC_IDOLMOBILE_end_info;
	permanent = TRUE;
	description = "KONEC";
};

func int PC_IDOLMOBILE_end_condition()
{
	if(IdolMobileCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_IDOLMOBILE_end_info()
{
	AI_StopProcessInfos(hero);
	Wld_StopEffect("DIALOGSCOPE_FX");
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	IdolMobileCheck = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	AI_PlayAni(hero,"T_PRAY_2_STAND");
};

instance PC_IDOLMOBILE_DO(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_IDOLMOBILE_DO_condition;
	information = PC_IDOLMOBILE_DO_info;
	permanent = TRUE;
	description = "Pomodlit se";
};

func int PC_IDOLMOBILE_DO_condition()
{
	if(IdolMobileCheck == TRUE)
	{
		return TRUE;
	};
};

func void PC_IDOLMOBILE_DO_info()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if(PrayIdolDay != Wld_GetDay())
		{
			if(hero.guild == GIL_KDM)
			{
				B_GivePlayerXP(25);
				BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
			}
			else
			{
				if(hero.guild == GIL_NDM)
				{
					B_GivePlayerXP(10);
				};

				BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
			};

			RankPoints = RankPoints + 1;
			PrayIdolDay = Wld_GetDay();
			AI_Print(Print_BeliarPrayOk);
		}
		else
		{
			AI_Print(PRINT_ENOUGHTPRAY);
		};
	}
	else
	{
		AI_Print(PRINT_BLESSBELIARPRAYPALKDF);
	};
};

instance ITMI_ANTIENTSTATUE(C_Item)
{
	name = "Soška Stavitelů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "MAYAMINISTATUE.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_INNOSMRAMORSTATUE(C_Item)
{
	name = "Mramorová soška Innose";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ITMI_INNOSMRAMORSTATUE.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Vzácná soška Innose z černého nordmarského mramoru...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Sextant(C_Item)
{
	name = "Sextant";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sextant;
	visual = "ItMi_Sextant.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SilverCandleHolder(C_Item)
{
	name = "Stříbrný svícen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_SilverCandleHolder;
	visual = "ItMi_SilverCandleHolder_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SilverNecklace(C_Item)
{
	name = "Stříbrný náhrdelník";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = Value_SilverNecklace;
	visual = "ItMi_SilverNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Sulfur(C_Item)
{
	name = "Síra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Sulfur;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Quartz(C_Item)
{
	name = "Křemen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Quartz;
	visual = "ItMi_Quartz_New.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Pitch(C_Item)
{
	name = "Pryskyřice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Pitch;
	visual = "ItMi_Pitch_New.3DS";
	material = MAT_GLAS;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Rockcrystal(C_Item)
{
	name = "Kamenný krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Rockcrystal;
	visual = "ItMi_Rockcrystal_Sky.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Aquamarine(C_Item)
{
	name = "Akvamarín";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Aquamarine;
	visual = "AQUA_NUGGET.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Coal(C_Item)
{
	name = "Uhlí";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Coal;
	visual = "ItMi_Coal_Sky.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_DarkPearl(C_Item)
{
	name = "Černá perla";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_DarkPearl;
	visual = "ItMi_DarkPearl_New.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_ApfelTabak(C_Item)
{
	name = "Jablečný tabák";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_ApfelTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Váček s jablečným tabákem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_PilzTabak(C_Item)
{
	name = "Houbový tabák";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_PilzTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Váček s tmavým jablečno-houbovým tabákem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_DoppelTabak(C_Item)
{
	name = "Dvojitý jablečný tabák";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_DoppelTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Váček se dvojitou porcí jablečného tabáku...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Honigtabak(C_Item)
{
	name = "Medový tabák";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_HonigTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Váček se sladkým jablečným tabákem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SumpfTabak(C_Item)
{
	name = "Bylinný tabák";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Váček se směsí tabáku a trávy z bažin...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Hasish(C_Item)
{
	name = "Hašiš";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Podivně vypadající tmavý lisovaný prášek...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_QUICKSILVER(C_Item)
{
	name = "Rtuť";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Quicksilver_New.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_HORN(C_Item)
{
	name = "Roh";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Horn_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Rituální roh...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_ORCRING(C_Item)
{
	name = "Skřetí prsten";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MULTI | ITEM_MISSION | ITEM_RING;
	value = 1;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[4] = "Na prstenu jsou vyražena skřetí písmena tvořící znak X...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCSTAFF(C_Item)
{
	name = "Grachtnakk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItRw_Orcstaff_03.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Tahle palice vypadá jako hůl skřetího šamana...";
	inv_animate = 1;
};

instance ITMI_ORCAMULET(C_Item)
{
	name = "Skřetí talisman";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Tenhle amulet patrně náležel skřetímu šamanovi...";
	inv_animate = 1;
};

instance ITMI_ORCAMULET_VANHAN(C_Item)
{
	name = "Ur-Hanův skřetí talisman";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	on_equip = equip_itmi_orcamulet_vanhan;
	on_unequip = unequip_itmi_orcamulet_vanhan;
	material = MAT_STONE;
	description = name;
	text[4] = "Tenhle amulet patrně náležel skřetímu šamanovi Ur-Hanovi...";
	inv_animate = 1;
};


func void equip_itmi_orcamulet_vanhan()
{
	self.protection[PROT_FIRE] += 35;
};

func void unequip_itmi_orcamulet_vanhan()
{
	self.protection[PROT_FIRE] -= 35;
};


instance ITMI_IDOL_01(C_Item)
{
	name = "Skřetí duch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = "Beztvará soška nějakého skřetího božství...";
	inv_animate = 1;
};

instance ITMI_IDOL_02(C_Item)
{
	name = "Podobizna Temnoty";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Kamenná soška Temného boha Beliara...";
	text[4] = "Vyzařuje ohromnou magickou sílu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_IDOL_03(C_Item)
{
	name = "Obětní kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Idol_Ogront_02.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = "Obětní kámen skřetích šamanů...";
	inv_animate = 1;
};

instance ITMI_CRYSTALBLACK(C_Item)
{
	name = "Černý krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_BlackCrystal_Sky.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Veliký kus mimořádně vzácného černého krystalu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_1_ORCPORTALSTONE(C_Item)
{
	name = "Magický krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_FOCUS_06.3DS";
	material = MAT_METAL;
	description = name;
	inv_animate = 1;
};

instance ITMI_2_ORCPORTALSTONE(C_Item)
{
	name = "Magický krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITMI_FOCUS_06.3DS";
	material = MAT_GLAS;
	description = name;
	inv_animate = 1;
};

instance ITMI_DRAGONGOLDFOCUS(C_Item)
{
	name = "Kamenný krystal";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kámen ve tvaru ohniska s podivnými symboly...";
	inv_animate = 1;
};

instance ITMI_FISKPACKET(C_Item)
{
	name = "Fiskův balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "G3_Item_Packet_01.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_COALBAG(C_Item)
{
	name = "Balík uhlí";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík s uhlím...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_ALEFNUGGETSBAG(C_Item)
{
	name = "Balík rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_alefnuggetsbag;
	description = name;
	text[4] = "Těžký balík s magickou rudou...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_alefnuggetsbag()
{
	B_PlayerFindItem(ItMi_Nugget,600);
	B_LogEntry(TOPIC_VIPERNUGGETS,"Viper nelhal - v balíku, který jsem našel, muselo být alespoň šest set hrudek rudy!");
};

instance ITMI_FIRESHPERE(C_Item)
{
	name = "Element Ohně";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIREBOW";
	description = name;
	text[3] = "Kulatý kámen pokrytý starodávnými runami...";
	text[4] = "Obklopuje ho aura ohně...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_WATERSHPERE(C_Item)
{
	name = "Element Vody";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_WATERSPHERE";
	description = name;
	text[3] = "Kulatý kámen pokrytý starodávnými runami...";
	text[4] = "Obklopuje ho aura vody...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_STONESHPERE(C_Item)
{
	name = "Element Země";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_STONESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[3] = "Kulatý kámen pokrytý starodávnými runami...";
	text[4] = "Obklopuje ho aura světla...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_DARKSHPERE(C_Item)
{
	name = "Element Temnoty";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[3] = "Kulatý kámen pokrytý starodávnými runami...";
	text[4] = "Obklopuje ho černý dým...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_TRIRAMAR(C_Item)
{
	name = "Amulet Triramar";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 10000;
	visual = "ITMI_TRIRAMAR_SKY.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itmi_triramar;
	on_unequip = unequip_itmi_triramar;
	effect = "SPELLFX_EVILLIGHT";
	description = name;
	text[3] = "Amulet je pokrytý starodávnými runami...";
	text[4] = "Je v něm ukryta část moci Temného boha...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void equip_itmi_triramar()
{
	AI_Wait(hero,1);
	Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
	AI_PlayAni(self,"S_FIRE_VICTIM");
	Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
	B_Say(self,self,"$Dead");
	AI_StopFX(self,"VOB_MAGICBURN");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	Npc_StopAni(self,"S_FIRE_VICTIM");
};

func void unequip_itmi_triramar()
{
};


instance ITMI_PALADINCHEST(C_Item)
{
	name = "Skříňka paladinů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldChest;
	visual = "ItMi_GoldChest.3DS";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_itmi_paladinchest;
	inv_animate = 1;
};


func void use_itmi_paladinchest()
{
	B_PlayerFindItem(itke_si_sign,1);
};


instance ITMI_DRAGONGOLDGORN(C_Item)
{
	name = "Zlatý roh Akhianti";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2500;
	visual = "ITMI_GOLDDRAGONGORN_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "HORN";
	description = name;
	text[3] = "Zvuk tohoto artefaktu dokáže přivolat arcidémona Senyaka...";
	text[4] = "Může ale být použit jenom jednou!";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[1] = use_itmi_golddragongorn;
	inv_animate = 1;
};


func void use_itmi_golddragongorn()
{
	var int randomget;
	if(USEGOLDGORN == FALSE)
	{
		randomget = Hlp_Random(100);
		if((SENYAKSUMMON == FALSE) && (KNOWS_CRESTMAKE == TRUE))
		{
			B_GivePlayerXP(500);
			Wld_SpawnNpcRange(hero,senyak_demon,1,2000);
			SENYAKSUMMON = TRUE;
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"S pomocí Ashtarova rohu jsem přivolal Senyaka!");
		}
		else if(randomget >= 95)
		{
			Wld_SpawnNpcRange(self,DemonLord,1,2000);
		}
		else if(randomget >= 90)
		{
			Wld_SpawnNpcRange(self,Demon,1,2000);
		}
		else if(randomget >= 85)
		{
			Wld_SpawnNpcRange(self,DragonSnapper,1,2000);
		}
		else if(randomget >= 80)
		{
			Wld_SpawnNpcRange(self,StoneGolem,1,2000);
		}
		else if(randomget >= 75)
		{
			Wld_SpawnNpcRange(self,Troll,1,2000);
		}
		else if(randomget >= 70)
		{
			Wld_SpawnNpcRange(self,Warg,1,2000);
		}
		else if(randomget >= 65)
		{
			Wld_SpawnNpcRange(self,Shadowbeast,1,2000);
		}
		else if(randomget >= 60)
		{
			Wld_SpawnNpcRange(self,Snapper,1,2000);
		}
		else if(randomget >= 55)
		{
			Wld_SpawnNpcRange(self,Wolf,1,2000);
		}
		else if(randomget >= 50)
		{
			Wld_SpawnNpcRange(self,FireWaran,1,2000);
		}
		else if(randomget >= 45)
		{
			Wld_SpawnNpcRange(self,Harpie,1,2000);
		}
		else if(randomget >= 40)
		{
			Wld_SpawnNpcRange(self,Gobbo_Black,1,2000);
		}
		else if(randomget >= 35)
		{
			Wld_SpawnNpcRange(self,Keiler,1,2000);
		}
		else if(randomget >= 30)
		{
			Wld_SpawnNpcRange(self,Lurker,1,2000);
		}
		else if(randomget >= 25)
		{
			Wld_SpawnNpcRange(self,Waran,1,2000);
		}
		else if(randomget >= 20)
		{
			Wld_SpawnNpcRange(self,Giant_Bug,1,2000);
		}
		else if(randomget >= 15)
		{
			Wld_SpawnNpcRange(self,Bloodfly,1,2000);
		}
		else if(randomget >= 10)
		{
			Wld_SpawnNpcRange(self,Gobbo_Green,1,2000);
		}
		else if(randomget >= 5)
		{
			Wld_SpawnNpcRange(self,Scavenger,1,2000);
		}
		else if(randomget >= 0)
		{
			Wld_SpawnNpcRange(self,Molerat,1,2000);
		};
		USEGOLDGORN = TRUE;
	};
};

instance ItMi_StoneSoul_Senyak(C_Item)
{
	name = "Kámen s duší Senyaka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITMI_SENYAKSOUL.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_stonesoul_senyak;
	description = name;
	text[4] = "V tomhle kameni se nachází duše arcidémona Senyaka...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_stonesoul_senyak()
{
	if(SoulSenyakFree == FALSE)
	{
		Snd_Play("OPENSOUL");
		AI_Print("Osvobodil jsi Senyakovu duši!");
		Wld_SpawnNpcRange(hero,ghost_senyak_demon,1,2000);
		SoulSenyakFree = TRUE;
	};
};

instance ItMi_IlesilSoul(C_Item)
{
	name = "Kámen s duší";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITMI_STONESOUL_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_IlesilSoul;
	description = name;
	text[4] = "V tomhle kameni se nachází duše Ile'Sila...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItMi_IlesilSoul()
{
	if((IlesilSoulStoneIsUp == TRUE) && (IlesilIsFree == FALSE) && (Npc_GetDistToWP(hero,"LOSTVALLEY_SOULKEEPER_01") < 1000))
	{
		Snd_Play("OPENSOUL");
		IlesilIsFree = TRUE;
		Npc_ExchangeRoutine(NONE_1813_Ilesil,"HesFree");
		AI_Teleport(NONE_1813_Ilesil,"LOSTVALLEY_SOULKEEPER_01");
		Wld_PlayEffect("spellFX_Teleport_RING",NONE_1813_Ilesil,NONE_1813_Ilesil,0,0,0,FALSE);
	}
	else
	{
		B_Say(self,self,"$DONTWORK");
		CreateInvItems(hero,ItMi_IlesilSoul,1);
	};
};

instance ItMi_StoneSoul(C_Item)
{
	name = "Kámen s duší";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ITMI_STONESOUL_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_stonesoul;
	description = name;
	text[4] = "V tomhle kameni se nachází duše bytosti, kterou jsem zabil...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_stonesoul()
{
	Snd_Play("MYSTERY_06");
	AI_Print("Osvobodil jsi duši!");
};





instance ITMI_BENGARPACKET(C_Item)
{
	name = "Bengarův balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 800;
	visual = "G3_Item_Packet_01.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_bengarpacket;
	text[4] = "Balík se zbožím od Bengara...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_bengarpacket()
{
	CreateInvItems(hero,ItFo_Bacon,5);
	CreateInvItems(hero,ItFo_Bread,10);
	CreateInvItems(hero,ItFoMuttonRaw,20);
	CreateInvItems(hero,ItFo_Cheese,8);
	MIS_BENGARORDER = LOG_FAILED;
	BENGARPACKETOPEN = TRUE;
	B_LogEntry_Failed(TOPIC_BENGARORDER);
};


instance ITMI_BLACKBRENDI(C_Item)
{
	name = "Černá brandy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_BlackBrendi.3ds";
	material = MAT_GLAS;
	scemeName = "POTIONFAST";
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = 1000;
	inv_animate = 1;
};

instance ITMI_HANNAGOLDNECKLACE(C_Item)
{
	name = "Zlatý náhrdelník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldNecklace;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Dárek Hanně od její sestry Abigail...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Salt(C_Item)
{
	name = "Sůl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2;
	visual = "ItMi_Salt_New.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMI_SLEEPSACK(C_Item)
{
	name = "Spací pytel";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 20;
	visual = "ItMi_SleepSack_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Pytel z teplé ovčí kůže...";
	text[4] = "Můžu se v něm pořádně prospat...";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = use_sleepfur;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_SLEEPSACK_TEMP(C_Item)
{
	name = "Spací pytel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_SleepSack_New_02.3DS";
	material = MAT_LEATHER;
	description = name;
};

instance ItAr_Hut(C_Item)
{
	name = "Plátěná čapka";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Hut;
	on_unequip = UnEquip_ItAr_Hut;
	visual = "ITAR_THIEFHELMET.3ds";
	visual_change = "ITAR_THIEFHELMET.3ds";
	visual_skin = 0;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

instance ItAr_HoodHelm(C_Item)
{
	name = "Plátěná kápě";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Hut;
	on_unequip = UnEquip_ItAr_Hut;
	visual = "ItAr_HelmHood.3ds";
	visual_change = "ItAr_HelmHood.3ds";
	visual_skin = 0;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Fire;
	count[2] = protection[PROT_FIRE];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Hut()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Hut()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
	};
};

instance ItAr_ThiefHut(C_Item)
{
	name = "Čapka zloděje";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_ThiefHut;
	on_unequip = UnEquip_ItAr_ThiefHut;
	visual = "ITAR_THIEFHELMET.3ds";
	visual_change = "ITAR_THIEFHELMET.3ds";
	visual_skin = 0;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_ThiefHut()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_ThiefHut()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
	};
};

instance ItAr_PirateHat(C_Item)
{
	name = "Klobouk kapitána";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 10;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_PirateHat;
	on_unequip = UnEquip_ItAr_PirateHat;
	visual = "ItAr_Hem_Pirate.3ds";
	visual_change = "ItAr_Hem_Pirate.3ds";
	visual_skin = 0;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_PirateHat()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_PirateHat()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
	};
};

instance ItAr_Helm_01(C_Item)
{
	name = "Železná helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 500;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	on_equip = Equip_ItAr_Helm_01;
	on_unequip = UnEquip_ItAr_Helm_01;
	visual = "ItAr_Helm_01.3ds";
	visual_change = "ItAr_Helm_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUpTemp = FALSE;
		HelmIsUp = TRUE;
		HelmStam = 1;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_New_01(C_Item)
{
	name = "Helma lukostřelce";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 1000;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 150;
	on_equip = Equip_ItAr_Helm_New_01;
	on_unequip = UnEquip_ItAr_Helm_New_01;
	visual = "ITHL_MAKEDHELMET2_S_STUDDED.3ds";
	visual_change = "ITHL_MAKEDHELMET2_S_STUDDED.3ds";
	//visual = "ItAr_Helm_New_01.3ds";
	//visual_change = "ItAr_Helm_New_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_New_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 1;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_New_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_New_02(C_Item)
{
	name = "Er'Khazirova helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	//value = 4000;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 250;
	on_equip = Equip_ItAr_Helm_New_02;
	on_unequip = UnEquip_ItAr_Helm_New_02;
	visual = "ITHL_MAKEDHELMET1_AS_THORNIARA_ROBE.3ds";
	visual_change = "ITHL_MAKEDHELMET1_AS_THORNIARA_ROBE.3ds";
	//visual = "ItAr_Helm_New_02.3ds";
	//visual_change = "ItAr_Helm_New_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Dex_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_New_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 2;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_New_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_02(C_Item)
{
	name = "Nordmarská helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 1000;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_02;
	on_unequip = UnEquip_ItAr_Helm_02;
	visual = "ITHL_MAKEDHELMET3_A_TOOSHOO_LEATHER.3ds";
	visual_change = "ITHL_MAKEDHELMET3_A_TOOSHOO_LEATHER.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 2;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_Hunt(C_Item)
{
	name = "Přilbice berserkera";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 10;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 275;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Hunt;
	on_unequip = UnEquip_ItAr_Helm_Hunt;
	visual = "ItAr_Hem_Hunt.3DS";
	visual_change = "ItAr_Hem_Hunt.3DS";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_Hunt()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 3;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_Hunt()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_03(C_Item)
{
	name = "Helma rytíře";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FLY] = 10;
	//value = 1500;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_03;
	on_unequip = UnEquip_ItAr_Helm_03;
	visual = "ITHL_HELMET_S_DAWNGUARDFULL.3ds";
	visual_change = "ITHL_HELMET_S_DAWNGUARDFULL.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_03()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 2;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_03()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Pal_Helm(C_Item)
{
	name = "Helma paladina";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Pal_Helm;
	on_unequip = UnEquip_ItAr_Pal_Helm;
	//visual = "ItAr_Pal_Helm.3ds";
	//visual_change = "ItAr_Pal_Helm.3ds";
	visual = "ItAr_Helm_Paladin_01.3ds";
	visual_change = "ItAr_Helm_Paladin_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Pal_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 3;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Pal_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Pal_Helm_Open_Npc(C_Item)
{
	name = "Helma paladina";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	visual = "ItAr_Helm_Paladin_02.3ds";
	visual_change = "ItAr_Helm_Paladin_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_animate = 0;
};

instance ItAr_Pal_Helm_Open(C_Item)
{
	name = "Helma paladina";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Pal_Helm_Open;
	on_unequip = UnEquip_ItAr_Pal_Helm_Open;
	//visual = "ItAr_Pal_Helm_Open.3ds";
	//visual_change = "ItAr_Pal_Helm_Open.3ds";
	visual = "ItAr_Helm_Paladin_02.3ds";
	visual_change = "ItAr_Helm_Paladin_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Pal_Helm_Open()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 3;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Pal_Helm_Open()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Pal_Elite_Helm_Npc(C_Item)
{
	name = "Helma generála paladinů";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	visual = "ItAr_Helm_Paladin_Elite_01.3ds";
	visual_change = "ItAr_Helm_Paladin_Elite_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

instance ItAr_Pal_Elite_Helm(C_Item)
{
	name = "Helma generála paladinů";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 25;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Pal_Helm_Open;
	on_unequip = UnEquip_ItAr_Pal_Helm_Open;
	//visual = "ItAr_Pal_Helm_Open.3ds";
	//visual_change = "ItAr_Pal_Helm_Open.3ds";
	visual = "ItAr_Helm_Paladin_Elite_01.3ds";
	visual_change = "ItAr_Helm_Paladin_Elite_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Pal_Elite_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 4;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Pal_Elite_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_DJG_Helm(C_Item)
{
	name = "Helma drakobijce";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 20;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 200;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_DJG_Helm;
	on_unequip = UnEquip_ItAr_DJG_Helm;
	visual = "ItAr_DJG_Helm.3ds";
	visual_change = "ItAr_DJG_Helm.3ds";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_DJG_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 3;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_DJG_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_Demon(C_Item)
{
	name = "Dračí helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 15;
	protection[PROT_FLY] = 30;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 350;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Helm_Demon;
	on_unequip = UnEquip_ItAr_Helm_Demon;
	visual = "ITAR_DRAGONHELM.3DS";
	visual_change = "ITAR_DRAGONHELM.3DS";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_Demon()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 4;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_Demon()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance G3_ARMOR_HELMET_CRONE(C_Item)
{
	name = "Koruna Ledu";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 50;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	on_equip = Equip_ItAr_Helm_Crown;
	on_unequip = UnEquip_ItAr_Helm_Crown;
	visual = "ItMi_IceCrown.3ds";
	visual_change = "ItMi_IceCrown.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[2] = NAME_Prot_Fire;
	count[2] = protection[PROT_FIRE];
	text[3] = NAME_Prot_Magic;
	count[3] = protection[PROT_MAGIC];
	text[4] = "Legendární artefakt vytvořený Adanem...";
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_Crown()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		CrownIsUp = TRUE;

		if(self.attribute[ATR_STRENGTH] >= self.attribute[ATR_DEXTERITY])
		{
			if(self.attribute[ATR_STRENGTH] >= self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + BONUS_CRONE;
				AI_Print("Cítíš, jak tě prostupuje síla!");
				BONUS_CRONE_FLAG = 1;
			}
			else
			{
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (BONUS_CRONE * 10);
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + (BONUS_CRONE * 10);
	
				if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
				{
					self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
				};

				AI_Print("Cítíš, jak tě prostupuje magická energie!");
				BONUS_CRONE_FLAG = 3;
			};
		}
		else if(self.attribute[ATR_DEXTERITY] > self.attribute[ATR_STRENGTH])
		{
			if(self.attribute[ATR_DEXTERITY] >= self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] + BONUS_CRONE;
				AI_Print("Cítíš, jak tě prostupuje obratnost!");
				BONUS_CRONE_FLAG = 2;
			}
			else
			{
				self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (BONUS_CRONE * 10);
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + (BONUS_CRONE * 10);
	
				if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
				{
					self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
				};

				AI_Print("Cítíš, jak tě prostupuje magická energie!");
				BONUS_CRONE_FLAG = 3;
			};
		};

		if(self.guild == GIL_KDW)
		{
			self.protection[PROT_FIRE] += 25;
			self.protection[PROT_MAGIC] += 25;
		};

		HelmStam = 1;
	};
};

func void UnEquip_ItAr_Helm_Crown()
{
	if(Npc_IsPlayer(self))
	{
		CrownIsUp = FALSE;

		if(BONUS_CRONE_FLAG == 1)
		{
			self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - BONUS_CRONE;
		}
		else if(BONUS_CRONE_FLAG == 2)
		{
			self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] - BONUS_CRONE;
		}
		else if(BONUS_CRONE_FLAG == 3)
		{
			self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - (BONUS_CRONE * 10);
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - (BONUS_CRONE * 10);
	
			if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
			};
		};

		if(self.guild == GIL_KDW)
		{
			self.protection[PROT_FIRE] -= 25;
			self.protection[PROT_MAGIC] -= 25;
		};

		BONUS_CRONE_FLAG = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_God_Helm(C_Item)
{
	name = "Prastará helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	protection[PROT_FLY] = 40;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 400;
	material = MAT_METAL;
	on_equip = Equip_ItAr_God_Helm;
	on_unequip = UnEquip_ItAr_God_Helm;
	visual = "ITAR_ANCIENTHELM.3ds";
	visual_change = "ITAR_ANCIENTHELM.3ds";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_God_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 5;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_God_Helm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ITMI_SLEEPERHELM(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	on_equip = equip_itmi_sleeperhelm;
	visual = "ITAR_SLEEPER_HELM.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void equip_itmi_sleeperhelm()
{
	if(Npc_IsPlayer(self))
	{
		AI_Wait(hero,3);
		Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Snd_Play("MFX_GHOSTVOICE");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};

instance ITMI_HELMSLEEPER_MIS(C_Item)
{
	name = "Maska Spáče";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITAR_SLEEPER_MASK_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[2] = "V této masce je ukryta část moci Spáče,";
	text[3] = "zlého démona, kterého jsem přemohl...";
	text[4] = "Vyzařuje silnou temnou auru...";
	inv_animate = 1;
};

instance ITMI_HELMSLEEPER(C_Item)
{
	name = "Maska Spáče";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 25;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	on_equip = equip_ITMI_HELMSLEEPER;
	on_unequip = unequip_ITMI_HELMSLEEPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 650;
	mag_circle = 4;
	visual = "ITAR_SLEEPER_MASK_01.3ds";
	visual_change = "ITAR_SLEEPER_MASK_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ITMI_HELMSLEEPER()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 2;
		SleeperMaskIsOn = TRUE;
		AI_Print("Získal jsi novou schopnost - 'Oko Spáče'!");
		Wld_PlayEffect("SPELLFX_HEALSHRINE",self,self,0,0,0,FALSE);

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ITMI_HELMSLEEPER()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
		SleeperMaskIsOn = FALSE;
	};
};

instance ITMI_KOMPAS(C_Item)
{
	name = "Kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "";
	inv_animate = 1;
};

instance ITMI_FALKGRANDFATHERITEM_01(C_Item)
{
	name = "Starý měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itmi_falkgrandfatheritem_01;
	description = "Starý měšec";
	text[4] = "Na měšci je vyšito písmeno 'B'...";
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_01()
{
	B_PlayerFindItem(itwr_falkgrandfather_01,1);
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ITMI_FALKGRANDFATHERITEM_02(C_Item)
{
	name = "Prázdná láhev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_Rum_02.3ds";
	scemeName = "MAPSEALED";
	material = MAT_GLAS;
	on_state[0] = use_itmi_falkgrandfatheritem_02;
	description = "Láhev";
	text[3] = "Prázdná láhev od rumu...";
	text[4] = "Z hrdla láhve kouká kus papíru...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_02()
{
	B_PlayerFindItem(itwr_Galkgrandfather_02,1);
};


instance ITMI_FALKGRANDFATHERITEM_03(C_Item)
{
	name = "Ryba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 5;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_falkgrandfatheritem_03;
	description = name;
	text[4] = "V této rybě je něco zašito...";
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_03()
{
	B_PlayerFindItem(itwr_Halkgrandfather_03,1);
};


instance ITMI_FALKGRANDFATHERITEM_04(C_Item)
{
	name = "Prázdná láhev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_Rum_01.3ds";
	scemeName = "MAPSEALED";
	material = MAT_GLAS;
	on_state[0] = use_itmi_falkgrandfatheritem_04;
	description = "Láhev";
	text[3] = "Prázdná láhev od grogu...";
	text[4] = "Z hrdla láhve kouká kus papíru...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_04()
{
	B_PlayerFindItem(itwr_Jalkgrandfather_04,1);
};


instance ITMI_STUFF_GEARWHEEL_01(C_Item)
{
	name = "Ozubené kolo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Kousek kovu opracovaný do tvaru ozubeného kola...";
	inv_animate = 1;
};

instance ITMI_STUFF_GEARWHEEL_02(C_Item)
{
	name = "Kamenná hvězda";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Gearwheel_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Kousek kamene opracovaný do tvaru hvězdy...";
	inv_animate = 1;
};

instance ITMI_MISSTORLOFTHING(C_Item)
{
	name = "Starý kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_NERGALCORPSE(C_Item)
{
	name = "Prach";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "Nergal_Corpse.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Tělesné pozůstatky nekromanta Nergala...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_ZombieCorpse(C_Item)
{
	name = "Maso z mrtvoly";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 20;
	visual = "ItMi_ZombieCorpse.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Plazma(C_Item)
{
	name = "Ektoplazma";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Plazma.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_GADERSTONE(C_Item)
{
	name = "Duch předků";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_GaderStone.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Magický artefakt Strážce Gadera...";
	inv_animate = 1;
};

instance ITMI_WATERCRYSTAL(C_Item)
{
	name = "Perla Vody";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2200;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Získal jsem ji od Ducha Vody...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_FIRESTONE(C_Item)
{
	name = "Ohnivý krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1750;
	visual = "ItMi_FireStone.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Pozůstatek ducha Ohně, kterého jsem porazil...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PIECEDARKGOLEM(C_Item)
{
	name = "Kus stínového golema";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItMi_PieceDarkGolem.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Pozůstatek stínového golema, kterého jsem zničil...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCMAINTOTEM(C_Item)
{
	name = "Totem síly";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_OrcMainTotem.3ds";
	material = MAT_STONE;
	description = name;
	text[3] = "Totem síly je symbolem moci vůdce skřetů...";
	text[4] = "Jeho majitel se skřetů nemusí obávat...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};


instance ItMi_GrahShar(C_Item)
{
	name = "Grakh Shakh";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 100;
	visual = "ItMi_OrcMainTotem.3ds";
	material = MAT_STONE;
	on_equip = Equip_ItMi_GrahShar;
	on_unequip = UnEquip_ItMi_GrahShar;
	description = name;
	text[3] = NAME_Bonus_Str;
	count[3] = Ri_GrahShar;
	text[4] = "Symbol Mor Dara, nejlepšího válečníka skřetů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

func void Equip_ItMi_GrahShar()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,Ri_GrahShar);
	Delta_Bonus_Str = Delta_Bonus_Str + Ri_GrahShar;
};

func void UnEquip_ItMi_GrahShar()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-Ri_GrahShar);

	Delta_Bonus_Str = Delta_Bonus_Str - Ri_GrahShar;

	if(Delta_Bonus_Str < 0)
	{
		Delta_Bonus_Str = 0;
	};
};

instance ITMI_POISONBOTTLE(C_Item)
{
	name = "Prázdná láhev";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[4] = "V téhle láhvi se nalézal silný jed...";
	inv_animate = 1;
};

instance ITMI_ADANOSAMULET(C_Item)
{
	name = "Amulet starodávných rituálů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[4] = "Tenhle předmět používali Stavitelé při svých pradávných rituálech...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCWARHORN(C_Item)
{
	name = "Skřetí roh";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ITMI_ORCWARHORN_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "HORN";
	description = name;
	text[4] = "Válečný roh skřetů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


// Drag Nimrod -----------------------------------------------

instance ItMi_MagicOrePliers(C_Item)
{
	name = "Magické kleště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Tenhle nástroj je vyroben z magické rudy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_5(C_Item)
{
	name = "Ingot čisté magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ItMi_PureOreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Rudný ingot z té nejčistší slitiny magické rudy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_4(C_Item)
{
	name = "Ingot čisté magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Čistý rudný ingot znamenité kvality...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_3(C_Item)
{
	name = "Ingot čisté magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 900;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Čistý rudný ingot dobré kvality...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_2(C_Item)
{
	name = "Ingot čisté magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 800;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Čistý rudný ingot obvyklé kvality...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_1(C_Item)
{
	name = "Ingot čisté magické rudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 700;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Čistý rudný ingot nevalné kvality...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_DragNimrod(C_Item)
{
	name = "Skřetí lístek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OrcN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_DragNimrod;
	scemeName = "MAP";
	description = name;
	text[4] = "Kousek papíru se skřetími zápisky...";
	inv_animate = 1;
};

func void use_DragNimrod()
{
	var int nDocID;
	
	if(PlayerKnowsOrcLanguage == TRUE)
	{
		if(KNOW_NIMROD_MAKE == FALSE)
		{
			B_GivePlayerXP(150);
			B_Say(self,self,"$HOWINTEREST");
			KNOW_NIMROD_MAKE = TRUE;
			RankPoints = RankPoints + 10;
			B_LogEntry(TOPIC_TagNorGrHunWeap,"Smysl skřetích zápisků je přibližně následující... - 'Skřeti ještě nikdy neměli větší zbraň! Myslím, že ani veliký vůdce všech skřetů si nezaslouží ji vlastnit. Její smrtící síla je strašlivá a jediným výstřelem může srazit i mocného nordmarského bizona. K její výrobě je potřeba - ČISTÝ ingot magické rudy, roh černého trola, tukem natřené šlachy nějakého dravce, dřevo tropického buku na výrobu těla a artefakt velikého lovce minulosti.'");

			if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerRudoplav == TRUE))
			{
				B_LogEntry_Quiet(TOPIC_TagNorGrHunWeap,"Teď vím, jak vyrobit skvělou skřetí zbraň - 'Drag Nimrod'! Ve skutečnosti to ale nebude tak jednoduché. Zápisky, které mi dal Tag-Nor, se zmiňují o ČISTÉM ingotu magické rudy. Dovedu sice tavit magickou rudu, nicméně tohle bude zřejmě složitější problém. Myslím, že bych se měl raději jít zeptat Vipera...");
			}
			else if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerRudoplav == FALSE))
			{
				B_LogEntry_Quiet(TOPIC_TagNorGrHunWeap,"Teď vím, jak vyrobit skvělou skřetí zbraň - 'Drag Nimrod'! Ve skutečnosti to ale nebude tak jednoduché. Zápisky, které mi dal Tag-Nor, se zmiňují o ČISTÉM ingotu magické rudy. Nemám ani zdání, jak bych ho mohl najít nebo vyrobit. Budu muset najít nějakého taviče rudy, který se v tom vyzná...");
			};
		}
		else
		{
			var int rnd;
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
		if((BookBonus_24 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_24 = TRUE;
		};
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
		Doc_SetFont(nDocID,0,FONT_BookHeadline);
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_Show(nDocID);
	}
	else
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,1);
		Doc_SetPage(nDocID,0,"LETTERSORCS.TGA",0);
		Doc_SetFont(nDocID,0,FONT_BookHeadline);
		Doc_SetMargins(nDocID,-1,50,50,50,50,1);
		Doc_Show(nDocID);
		B_Say(self,self,"$CANTREADTHIS");
		PlayerKnowsOrcLanguageNeedTwo = TRUE;
	};
};

instance ITMI_SeekerSoul(C_Item)
{
	name = "Temný krystal s duší";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	description = name;
	text[4] = "Podivně vypadající magická substance černé barvy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_NOVMATERIAL(C_Item)
{
	name = "Balík látky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 500;
	visual = "G3_Item_Packet_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík se značným množstvím stlačené tkaniny...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_AssGoldPocket(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	material = MAT_LEATHER;
	description = "Měšec";
	text[4] = "Měšec nacpaný zlatem...";
	inv_animate = 1;
};

instance ItMi_HasimAmuls(C_Item)
{
	name = "Vzácné modlitební korále";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "G3_Artefact_Amulett_Violett_01.3DS";
	material = MAT_LEATHER;
	description = "Vzácné modlitební korále";
	text[3] = "Na některých kamenech jsou vyryty znaky";
	text[4] = "tvořící jméno 'Hasim'...";
	inv_animate = 1;
};

instance ItMi_PacketColesulfur(C_Item)
{
	name = "Špinavý balík";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Těžký balík se značným množstvím síry a uhlí...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SulfurMuttonRaw(C_Item)
{
	name = "Sírové maso";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_SulfurMuttonRaw;
	description = name;
	text[4] = "Syrové maso, pořádně napuštěné sírou...";
	inv_animate = 1;
};

func void Use_SulfurMuttonRaw()
{
	AI_DropItem(self,ItMi_SulfurMuttonRaw);

	if(CurrentLevel == PRIORATWORLD_ZEN)
	{
		if((MuritanPWisUp == FALSE) && (Npc_GetDistToWP(self,"PW_CAVEBLACKTROLL") < 1000))
		{
			Wld_InsertNpc(Muritan_PW,"FP_ROAM_PW_MONSTER_18");
			MuritanPWisUp = TRUE;
		};
	};
};

instance ItMi_Feder(C_Item)
{
	name = "Pírko";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Feder_Sky.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HarpyFeder(C_Item)
{
	name = "Pírka harpyje";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_HarpyFeder_Sky.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Palette(C_Item)
{
	name = "Barvy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Palette.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Pinsel(C_Item)
{
	name = "Štětec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pinsel.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Bottle_Empty(C_Item)
{
	name = "Láhev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItFo_Water.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

//------------------------------------------itemy dlya plato Drevnikh-----------------------------

instance ItMi_LP_StonePlate_01(C_Item)
{
	name = "Prastará kamenná tabulka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	description = "Prastará kamenná tabulka";
	text[4] = "Celá tabulka je pokryta nápisy v prastarém jazyce...";
	inv_animate = 1;
};

instance ItWr_CroneAdanos(C_Item)
{
	name = "Prastará tabulka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	description = "Prastará tabulka";
	text[3] = "Stará ošumělá tabulka...";
	text[4] = "Celá tabulka je pokryta nápisy v prastarém jazyce...";
	on_state[0] = Use_ItWr_AdanosCrone;
	inv_animate = 1;
};

func void Use_ItWr_AdanosCrone()
{
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	B_Say(hero,hero,"$CANTREADTHIS");

	if(MIS_AdanosCrone == FALSE)
	{
		MIS_AdanosCrone = LOG_Running;
		Log_CreateTopic(TOPIC_AdanosCrone,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_AdanosCrone,LOG_Running);
		B_LogEntry(TOPIC_AdanosCrone,"V Adanově chrámu jsem našel kamennou tabulku, ale nedokázal jsem ji přečíst! Musím ji ukázat Saturasovi. Možná uspěje on. Nebo někdo jiný, kdo zná prastarý jazyk Stavitelů lépe než já.");
	};
};

instance ItWr_AdanosCrone_Ready(C_Item)
{
	name = "Magická prastará tabulka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	description = "Magická prastará tabulka";
	text[3] = "Stará ošumělá tabulka...";
	text[4] = "Celá tabulka je pokryta nápisy v prastarém jazyce...";
	text[5] = "Vyzařuje magickou energii...";
	on_state[0] = Use_ItWr_AdanosCrone_Ready;
	inv_animate = 1;
};

func void Use_ItWr_AdanosCrone_Ready()
{
	if(Npc_IsPlayer(self) && (StoneTitanAwake == FALSE))
	{
		if(CurrentLevel == ADDONWORLD_ZEN)
		{
			if(Npc_GetDistToWP(hero,"ADW_ADANOSTEMPEL_RAVEN_01") < 1000)
			{
				Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				StoneTitanAwake = TRUE;
				b_awake_stoneguardian_boss();
			}
			else
			{
				Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
				B_Say(hero,hero,"$DONTWORK");
			};
		}	
		else
		{
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$DONTWORK");
		};
	};
};

instance ItMi_PortalRuneAdanos(C_Item)
{
	name = "Runové srdce Strážce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItWr_StoneAdanosPortal(C_Item)
{
	name = "Runová tabulka Strážce";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[4] = "Všechny nápisy jsou ve velice prastarém jazyce...";
	inv_animate = 1;
};

instance ItMi_XoD_01(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Podivně vypadající kamenný úlomek s ornamentem...";
	text[5] = "Vyzařuje magickou energii...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_YoD_02(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Podivně vypadající kamenný úlomek s ornamentem...";
	text[5] = "Vyzařuje magickou energii...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ZoD_03(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Podivně vypadající kamenný úlomek s ornamentem...";
	text[5] = "Vyzařuje magickou energii...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_UoD_04(C_Item)
{
	name = "Kamenný úlomek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Podivně vypadající kamenný úlomek s ornamentem...";
	text[5] = "Vyzařuje magickou energii...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_AdanosTear(C_Item)
{
	name = "Adanova slza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_AdanosTear.3ds";
	material = MAT_METAL;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItRi_GoldSkipetr_NoMagic(C_Item)
{
	name = "Zlaté žezlo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	material = MAT_METAL;
	visual = "ARTEFAKT.3DS";
	on_state[0] = Use_GoldSkipetr;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "Vespodu žezla se nalézá hluboký otvor ve tvaru kapky...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_GoldSkipetr()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_AdanosTear) >= 1) && (CurrentLevel == ADANOSVALLEY_ZEN))
		{
			Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			Npc_RemoveInvItems(hero,ItMi_AdanosTear,1);
			Npc_RemoveInvItems(hero,ItRi_GoldSkipetr_NoMagic,1);
			CreateInvItems(hero,ItRi_AdanosGoldSkipetr,1);
			B_Say(hero,hero,"$HOWINTEREST");
			Wld_InsertNpc(Stoneguardian_AV_01,"FP_SHATTERED_STONEGUARD_01");
			Wld_InsertNpc(Stoneguardian_AV_02,"FP_SHATTERED_STONEGUARD_02");
			Wld_InsertNpc(Stoneguardian_AV_03,"FP_SHATTERED_STONEGUARD_03");
			Wld_InsertNpc(Stoneguardian_AV_04,"FP_SHATTERED_STONEGUARD_04");
			Wld_InsertNpc(Stoneguardian_AV_05,"FP_SHATTERED_STONEGUARD_05");
			Wld_SendTrigger("EVT_STONEGUARDAWAKE_01");
			Wld_SendTrigger("EVT_STONEGUARDAWAKE_02");
			Wld_SendTrigger("EVT_STONEGUARDAWAKE_03");
			Wld_SendTrigger("EVT_STONEGUARDAWAKE_04");
			Wld_SendTrigger("EVT_STONEGUARDAWAKE_05");
			B_LogEntry(TOPIC_AdanosCrone,"Adanova slza padla do otvoru ve zlatém žezle jako ulitá! Celou plošinu ozářil jasný záblesk a z nebe se spustil ledový déšť... K čemu se tenhle předmět používal?");
		}
		else
		{
			Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItRi_GoldSkipetr_NoMagic,1);
		};
	};
};

instance ItRi_AdanosGoldSkipetr(C_Item)
{
	name = "Adanovo zlaté žezlo";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	material = MAT_METAL;
	value = 1000;
	material = MAT_METAL;
	visual = "ARTEFAKT.3DS";
	on_equip = equip_ItRi_AdanosGoldSkipetr;
	on_unequip = unequip_ItRi_AdanosGoldSkipetr;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MOON_SMOKE";
	description = name;
	text[4] = "Žezlo vyzařuje magickou energii...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void equip_ItRi_AdanosGoldSkipetr()
{
	Wld_PlayEffect("spellFX_RingRitual2",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);

	ScipIsUp = TRUE;

	if(HeroDragonLook == FALSE)
	{
		Wld_PlayEffect("DRAGONLOOK_FX",hero,hero,0,0,0,FALSE);
		HeroDragonLook = TRUE;
	};

	if(hero.attribute[ATR_MANA] > 1)
	{
		hero.attribute[ATR_MANA] = 1;
	};

	if((StoneGuardsAVisAwake_01 == FALSE) && (Npc_GetDistToWP(self,"AV_STONEGUARD_01") < 1000))
	{
		b_awake_stoneguardian(Stoneguardian_AV_01);
		StoneGuardsAVisAwake_01 = TRUE;
		AI_Print(PRINT_AWAKEOLDGUARDS);
	};
	if((StoneGuardsAVisAwake_02 == FALSE) && (Npc_GetDistToWP(self,"AV_STONEGUARD_02") < 1000))
	{
		b_awake_stoneguardian(Stoneguardian_AV_02);
		StoneGuardsAVisAwake_02 = TRUE;
		AI_Print(PRINT_AWAKEOLDGUARDS);
	};
	if((StoneGuardsAVisAwake_03 == FALSE) && (Npc_GetDistToWP(self,"AV_STONEGUARD_03") < 1000))
	{
		b_awake_stoneguardian(Stoneguardian_AV_03);
		StoneGuardsAVisAwake_03 = TRUE;
		AI_Print(PRINT_AWAKEOLDGUARDS);
	};
	if((StoneGuardsAVisAwake_04 == FALSE) && (Npc_GetDistToWP(self,"AV_STONEGUARD_04") < 1000))
	{
		b_awake_stoneguardian(Stoneguardian_AV_04);
		StoneGuardsAVisAwake_04 = TRUE;
		AI_Print(PRINT_AWAKEOLDGUARDS);
	};
	if((StoneGuardsAVisAwake_05 == FALSE) && (Npc_GetDistToWP(self,"AV_STONEGUARD_05") < 1000))
	{
		b_awake_stoneguardian(Stoneguardian_AV_05);
		StoneGuardsAVisAwake_05 = TRUE;
		AI_Print(PRINT_AWAKEOLDGUARDS);
	};
};

func void unequip_ItRi_AdanosGoldSkipetr()
{
	ScipIsUp = FALSE;

	if(HeroDragonLook == TRUE)
	{
		Wld_StopEffect("DRAGONLOOK_FX");	
		HeroDragonLook = FALSE;
	};
};

instance ItMi_XunePart_01(C_Item)
{
	name = "Část runové desky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	on_state[0] = Use_RunePart_01;
	scemeName = "MAPSEALED";
	material = MAT_STONE;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	inv_animate = 1;
};


instance ItMi_ZunePart_02(C_Item)
{
	name = "Část runové desky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	on_state[0] = Use_RunePart_02;
	scemeName = "MAPSEALED";
	material = MAT_STONE;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	inv_animate = 1;
};


instance ItMi_YunePart_03(C_Item)
{
	name = "Část runové desky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	on_state[0] = Use_RunePart_03;
	scemeName = "MAPSEALED";
	material = MAT_STONE;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	inv_animate = 1;
};


instance ItMi_WunePart_04(C_Item)
{
	name = "Část runové desky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	on_state[0] = Use_RunePart_04;
	scemeName = "MAPSEALED";
	material = MAT_STONE;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	inv_animate = 1;
};


instance ItMi_UunePart_05(C_Item)
{
	name = "Část runové desky";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	on_state[0] = Use_RunePart_05;
	scemeName = "MAPSEALED";
	material = MAT_STONE;
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	inv_animate = 1;
};

func void Use_RunePart_01()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_ZunePart_02) >= 1) && (Npc_HasItems(hero,ItMi_YunePart_03) >= 1) && (Npc_HasItems(hero,ItMi_WunePart_04) >= 1) && (Npc_HasItems(hero,ItMi_UunePart_05) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_XunePart_01,1);
			Npc_RemoveInvItems(hero,ItMi_ZunePart_02,1);
			Npc_RemoveInvItems(hero,ItMi_YunePart_03,1);
			Npc_RemoveInvItems(hero,ItMi_WunePart_04,1);
			Npc_RemoveInvItems(hero,ItMi_UunePart_05,1);
			CreateInvItems(hero,ItMi_DuneAdanos,1);
			B_Say(hero,hero,"$HOWINTEREST");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItMi_XunePart_01,1);
		};
	};
};

func void Use_RunePart_02()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_XunePart_01) >= 1) && (Npc_HasItems(hero,ItMi_YunePart_03) >= 1) && (Npc_HasItems(hero,ItMi_WunePart_04) >= 1) && (Npc_HasItems(hero,ItMi_UunePart_05) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_XunePart_01,1);
			Npc_RemoveInvItems(hero,ItMi_ZunePart_02,1);
			Npc_RemoveInvItems(hero,ItMi_YunePart_03,1);
			Npc_RemoveInvItems(hero,ItMi_WunePart_04,1);
			Npc_RemoveInvItems(hero,ItMi_UunePart_05,1);
			CreateInvItems(hero,ItMi_DuneAdanos,1);
			B_Say(hero,hero,"$HOWINTEREST");
			B_LogEntry(TOPIC_AdanosCrone,"Spojil jsem části kamene Strážců. Společně vytvořili ohromný kus kamenné desky... Myslím, že je to jeden z kusů oltářní desky.");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItMi_ZunePart_02,1);
		};
	};
};

func void Use_RunePart_03()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_XunePart_01) >= 1) && (Npc_HasItems(hero,ItMi_ZunePart_02) >= 1) && (Npc_HasItems(hero,ItMi_WunePart_04) >= 1) && (Npc_HasItems(hero,ItMi_UunePart_05) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_XunePart_01,1);
			Npc_RemoveInvItems(hero,ItMi_ZunePart_02,1);
			Npc_RemoveInvItems(hero,ItMi_YunePart_03,1);
			Npc_RemoveInvItems(hero,ItMi_WunePart_04,1);
			Npc_RemoveInvItems(hero,ItMi_UunePart_05,1);
			CreateInvItems(hero,ItMi_DuneAdanos,1);
			B_Say(hero,hero,"$HOWINTEREST");
			B_LogEntry(TOPIC_AdanosCrone,"Spojil jsem části kamene Strážců. Společně vytvořili ohromný kus kamenné desky... Myslím, že je to jeden z kusů oltářní desky.");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItMi_YunePart_03,1);
		};
	};
};

func void Use_RunePart_04()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_XunePart_01) >= 1) && (Npc_HasItems(hero,ItMi_ZunePart_02) >= 1) && (Npc_HasItems(hero,ItMi_YunePart_03) >= 1) && (Npc_HasItems(hero,ItMi_UunePart_05) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_XunePart_01,1);
			Npc_RemoveInvItems(hero,ItMi_ZunePart_02,1);
			Npc_RemoveInvItems(hero,ItMi_YunePart_03,1);
			Npc_RemoveInvItems(hero,ItMi_WunePart_04,1);
			Npc_RemoveInvItems(hero,ItMi_UunePart_05,1);
			CreateInvItems(hero,ItMi_DuneAdanos,1);
			B_Say(hero,hero,"$HOWINTEREST");
			B_LogEntry(TOPIC_AdanosCrone,"Spojil jsem části kamene Strážců. Společně vytvořili ohromný kus kamenné desky... Myslím, že je to jeden z kusů oltářní desky.");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItMi_WunePart_04,1);
		};
	};
};

func void Use_RunePart_05()
{
	if(Npc_IsPlayer(self))
	{
		if((Npc_HasItems(hero,ItMi_XunePart_01) >= 1) && (Npc_HasItems(hero,ItMi_ZunePart_02) >= 1) && (Npc_HasItems(hero,ItMi_YunePart_03) >= 1) && (Npc_HasItems(hero,ItMi_WunePart_04) >= 1))
		{
			Npc_RemoveInvItems(hero,ItMi_XunePart_01,1);
			Npc_RemoveInvItems(hero,ItMi_ZunePart_02,1);
			Npc_RemoveInvItems(hero,ItMi_YunePart_03,1);
			Npc_RemoveInvItems(hero,ItMi_WunePart_04,1);
			Npc_RemoveInvItems(hero,ItMi_UunePart_05,1);
			CreateInvItems(hero,ItMi_DuneAdanos,1);
			B_Say(hero,hero,"$HOWINTEREST");
			B_LogEntry(TOPIC_AdanosCrone,"Spojil jsem části kamene Strážců. Společně vytvořili ohromný kus kamenné desky... Myslím, že je to jeden z kusů oltářní desky.");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			CreateInvItems(hero,ItMi_UunePart_05,1);
		};
	};
};

instance ItMi_DuneAdanos(C_Item)
{
	name = "Runová tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_DuneAdanos;
	description = name;
	text[4] = "Tahle tabulka vypadá jako část jedné veliké tabulky...";
	inv_animate = 1;
};

func void Use_ItMi_DuneAdanos()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"BOOK_PYRAMIDPASS_01.tga",1);
	Doc_Show(nDocID);
};

instance ItMi_GuneAdanos_02(C_Item)
{
	name = "Runová tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_GuneAdanos_02;
	description = name;
	text[4] = "Tahle tabulka vypadá jako část jedné veliké tabulky...";
	inv_animate = 1;
};

func void Use_ItMi_GuneAdanos_02()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"BOOK_PYRAMIDPASS_02.tga",1);
	Doc_Show(nDocID);
};

instance ItMi_LuneAdanos_Full(C_Item)
{
	name = "Runová tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	on_state[0] = Use_ItMi_LuneAdanos_Full;
	description = name;
	text[4] = "Kompletně sestavená magická tabulka...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

func void Use_ItMi_LuneAdanos_Full()
{
	var int nDocID;

	if(KnowPassBigPyramid == FALSE)
	{
		KnowPassBigPyramid = TRUE;
		B_Say(hero,hero,"$HOWINTEREST");
		B_LogEntry(TOPIC_AdanosCrone,"Kresba na sestavené tabulce znázorňuje řadu magických symbolů.");
	};

	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"BOOK_PYRAMIDPASS.tga",1);
	Doc_Show(nDocID);
};

instance ItMi_TearsRune(C_Item)
{
	name = "Kamenné slzy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_RuneBlank_New.3DS";
	effect = "SPELLFX_MOON_SMOKE";
	material = MAT_STONE;
	description = name;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_BlackOrcTalisman(C_Item)
{
	name = "Amulet skřetího válečníka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Symbol výjimečnosti elitních skřetů...";
	inv_animate = 1;
};

instance ItMi_HuntSign(C_Item)
{
	name = "Talisman velkého lovce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_HuntSign.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Symbol, který patřil jednomu z velikých lovců...";
	inv_animate = 1;
};

instance ItMi_BukTree(C_Item)
{
	name = "Řezivo z tropického buku";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_BukTree.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Nevelký kus tropického buku...";
	inv_animate = 1;
};

instance ItMi_Buk_Arbalet(C_Item)
{
	name = "Socha kuše";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Buk_Arbalet.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Vyrobena ze dřeva tropického buku...";
	inv_animate = 1;
};

instance ItAt_BlackTrollHorn(C_Item)
{
	name = "Roh černého trola";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "G3_Item_AnimalTrophy_Horn_ShadowBeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Roh mocného černého trola...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_PumaMuscle(C_Item)
{
	name = "Šlachy pumy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Odolné šlachy pumy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_PumaMuscle_Jir(C_Item)
{
	name = "Šlachy pumy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITAT_VEINLIZARD.3DS";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Velice odolné šlachy pumy...";
	text[4] = "Ošetřeny tukem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_OldTextMine(C_Item)
{
	name = "Prastará tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	inv_animate = 1;
};

instance ItMi_PortalCrystal(C_Item)
{
	name = "Krystalový kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "G3_Item_Story_FocusStone_01.3ds";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItAr_Helm_G3_01(C_Item)
{
	name = "Ocelová helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 1000;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	on_equip = Equip_ItAr_Helm_G3_01;
	on_unequip = UnEquip_ItAr_Helm_G3_01;
	visual = "ItAr_Helm_G3_01.3ds";
	visual_change = "ItAr_Helm_G3_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_G3_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUpTemp = FALSE;
		HelmIsUp = TRUE;
		HelmStam = 2;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_G3_01()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_G3_02(C_Item)
{
	name = "Helma žoldáka";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	//value = 1500;
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 150;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_G3_02;
	on_unequip = UnEquip_ItAr_Helm_G3_02;
	visual = "ItAr_Helm_G3_02.3ds";
	visual_change = "ItAr_Helm_G3_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_G3_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUpTemp = FALSE;
		HelmIsUp = TRUE;
		HelmStam = 2;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_G3_02()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};


instance ItAr_Helm_G3_04(C_Item)
{
	name = "Rohatá helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 5;
	protection[PROT_FLY] = 10;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 180;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_G3_04;
	on_unequip = UnEquip_ItAr_Helm_G3_04;
	visual = "ItAr_Helm_G3_04.3ds";
	visual_change = "ItAr_Helm_G3_04.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_G3_04()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUpTemp = FALSE;
		HelmIsUp = TRUE;
		HelmStam = 3;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_G3_04()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_G3_06(C_Item)
{
	name = "Věnec démonů";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 100;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_G3_06;
	on_unequip = UnEquip_ItAr_Helm_G3_06;
	visual = "ItAr_Helm_UndeadKing.3ds";
	visual_change = "ItAr_Helm_UndeadKing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_All;
	count[1] = protection[PROT_EDGE];
	text[3] = "Prastarý artefakt vládce démonů Eligora...";
	text[4] = "Zcela chrání před psychickými útoky...";
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_G3_06()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		HelmIsUpTemp = FALSE;
		HelmIsUp = TRUE;
		SleeperStone = TRUE;
		HelmStam = 6;
	};
};

func void UnEquip_ItAr_Helm_G3_06()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		SleeperStone = FALSE;
		HelmStam = 0;
	};
};

instance ItAr_Helm_Skel_Low(C_Item)
{
	name = "Helma kostlivce";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Skel(C_Item)
{
	name = "Helma kostlivého válečníka";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_G3_04.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Skel_Elite(C_Item)
{
	name = "Helma kostlivého strážce";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_G3_06.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Skel_King(C_Item)
{
	name = "Helma kostlivého lorda";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_G3_06.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Arahar(C_Item)
{
	name = "Helma kostlivého lorda";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_UndeadKing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Skel_IlArah(C_Item)
{
	name = "Il'Arahova helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_IlArah.3DS";
	effect = "SPELLFX_FIREBOW";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Avabul(C_Item)
{
	name = "Avabulina koruna";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_WOOD;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_Avabul.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Janus(C_Item)
{
	name = "Janusova helma";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_Jan.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

instance ItAr_Helm_Egezart(C_Item)
{
	name = "Helma věčnosti";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_Helm_Skel;
	on_unequip = UnEquip_ItAr_Helm_Skel;
	visual = "ItAr_Helm_Egezart.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 1;
};

func void Equip_ItAr_Helm_Skel()
{
	if(Npc_IsPlayer(self))
	{
		Mdl_ApplyOverlayMds(self,"humans_skeleton.mds");
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Snd_Play("MFX_GHOSTVOICE");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
	};
};

func void UnEquip_ItAr_Helm_Skel()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
	};
};

instance ItMi_DragonStaffPiece_01(C_Item)
{
	name = "Část hole";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kovová část magické hole...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_02(C_Item)
{
	name = "Část hole";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kovová část magické hole...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_03(C_Item)
{
	name = "Část hole";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kovová část magické hole...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_04(C_Item)
{
	name = "Část hole";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Kovová část magické hole...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_Eye(C_Item)
{
	name = "Oko draka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Mrtvé oko mocného stvoření...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_SteelForm(C_Item)
{
	name = "Forma na výrobu šperků";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_SteelForm.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Používána k výrobě lůžek pro šperky...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Diamod(C_Item)
{
	name = "Diamant";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5000;
	visual = "ItMi_Diamond.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Emerald(C_Item)
{
	name = "Smaragd";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ItMi_Emerald.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Ruby(C_Item)
{
	name = "Rubín";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ItMi_Ruby.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Sapphire(C_Item)
{
	name = "Safír";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ItMi_Sapphire.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Opal(C_Item)
{
	name = "Opál";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ItMi_Amethyst.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Topaz(C_Item)
{
	name = "Topaz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Topaz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_GroshBottle(C_Item)
{
	name = "Čutora s grogem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	description = "Čutora s grogem";
	inv_animate = 1;
};

instance ItMi_ZharpStone(C_Item)
{
	name = "Brusný kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItMi_SharpStone_New_01.3DS";
	material = MAT_STONE;
	on_state[0] = Use_ItMi_SharpStone;
	scemeName = "MAP";
	description = name;
	text[3] = "Používán k ostření zbraní...";
	text[4] = "Po naostření zbraně zvyšuje způsobené poškození o (%):";
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItMi_SharpStone()
{
	var string concatText;
	var C_Item SharpBlade;

	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		SharpBlade = Npc_GetEquippedMeleeWeapon(hero);

		if((Hlp_IsValidItem(SharpBlade) == TRUE) && (SharpBlade.damage[DAM_INDEX_FIRE] == TRUE))
		{		
			if(SharpBlade.hp == FALSE)
			{
				SharpBlade.hp = TRUE;
				SharpBlade.damage[DAM_INDEX_EDGE] = SharpBlade.damage[DAM_INDEX_EDGE] + ((SharpBlade.damage[DAM_INDEX_EDGE] * 10) / 100);
				SharpBlade.count[1] = SharpBlade.damage[DAM_INDEX_EDGE];
				concatText = SharpBlade.visual_change;
				concatText = ConcatStrings(concatText," | Naostřená");
				SharpBlade.visual_change = concatText;
				SharpBlade.text[4] = concatText;
				SharpBladeID = Hlp_GetInstanceID(SharpBlade);
				//Print(PRINT_SharpedBlade);
				AI_PrintClr(PRINT_SharpedBlade,83,152,48);
				B_Say(self,self,"$ITEMREADY");
				Snd_Play3d(hero,"SHARP_DONE");
			}
			else
			{
				//Print(PRINT_NoSharpedBlade);
				AI_PrintClr(PRINT_NoSharpedBlade,177,58,17);
			};
		}
		else
		{
			//Print(PRINT_NoSharpedBladeType);
			AI_PrintClr(PRINT_NoSharpedBladeType,177,58,17);
		};
	}
	else
	{
		//Print(PRINT_NoSharpedBladeKnow);
		AI_PrintClr(PRINT_NoSharpedBladeKnow,177,58,17);
	};
};

instance ItMi_AncientRuneStone(C_Item)
{
	name = "Runový kámen Stavitelů";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItRu_Beliar06.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Runový kámen Stavitelů, zbavený magie...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_NecrUrn(C_Item)
{
	name = "Urna s popelem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_NECRURN.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Urna s popelem neznámého mága...";
	inv_animate = 1;
};

instance ItMi_Avatar_Water(C_Item)
{
	name = "Ledový krystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Magická esence ledového atronacha...";
	effect = "SPELLFX_GEYSER_FOUNTAIN";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Fire(C_Item)
{
	name = "Kousek ztuhlé lávy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIREBOW";
	description = name;
	text[4] = "Magická esence ohnivého atronacha...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Dark(C_Item)
{
	name = "Temný krystal s duší";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[4] = "Magická esence stvoření Temnoty...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_HaosAvatarStone(C_Item)
{
	name = "Krystal Chaosu";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[4] = "Magická esence Chaosu...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Stone(C_Item)
{
	name = "Kamenné oko";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_STONESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[4] = "Magická esence kamenného atronacha...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//-------------------------------novyye itemy--------------------------------------

instance ItMi_BigRuby(C_Item)
{
	name = "Královský rubín";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItMi_BigRuby.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Drahý kámen nesmírných rozměrů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DiamondChoker(C_Item)
{
	name = "Briliantový náhrdelník";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 5000;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Vzácný a velice drahý šperk...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HuntHornGold(C_Item)
{
	name = "Zlatý lovecký roh";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItMi_Horn_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Bohatě zdobená pomůcka na lovení...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_KnifeGold(C_Item)
{
	name = "Zlatá dýka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItMi_GoldKnife.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Vzácná a velice drahá zbraň...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_OreBaronCrown(C_Item)
{
	name = "Koruna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItMi_OreBaronCrown.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Vykládaná drahými kameny...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Wax(C_Item)
{
	name = "Lahvička s inkoustem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Wax.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Používána ke psaní...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_Seamap_Mirtana(C_Item)
{
	name = NAME_Map;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_ItWr_Seamap_Mirtana;
	description = "Námořní mapa";
	text[4] = "Mapa ukazující přesný kurz na pevninu...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItWr_Seamap_Mirtana()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_World_Seamap.tga",1);
	Doc_Show(nDocID);
};

instance ItAr_ShrecHelm(C_Item)
{
	name = "Helma kněze Stavitelů";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 5;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 25;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 150;
	material = MAT_LEATHER;
	on_equip = Equip_ItAr_ShrecHelm;
	on_unequip = UnEquip_ItAr_ShrecHelm;
	visual = "ItAr_Hem_Yarkendar.3ds";
	visual_change = "ItAr_Hem_Yarkendar.3ds";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Mana_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_ShrecHelm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 1;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_ShrecHelm()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};

var int KrowBookRead;

instance ItWr_KrowBook(C_Item)
{
	name = "Crowův deník";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Book_Poor_02.3ds";
	material = MAT_LEATHER;
	description = "";
	inv_animate = 1;
};

instance ItMi_StoneGuardianPiece(C_Item)
{
	name = "Úlomek runového kamene";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BowRope_01(C_Item)
{
	name = "Tětiva z vlčí kůže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2;
	visual = "ItMi_BowRope_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BowRope_02(C_Item)
{
	name = "Tětiva z kůže divočáka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 4;
	visual = "ItMi_BowRope_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BowRope_03(C_Item)
{
	name = "Tětiva z kůže warga";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 12;
	visual = "ItMi_BowRope_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BowRope_04(C_Item)
{
	name = "Tětiva z kůže stínové šelmy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 30;
	visual = "ItMi_BowRope_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BowRope_05(C_Item)
{
	name = "Tětiva z trolí kůže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_BowRope_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_JustTree(C_Item)
{
	name = "Řezivo z obyčejného dřeva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_JustTree.3ds";
	material = MAT_WOOD;
	description = name;
	inv_animate = 1;
};

instance ItMi_EveTree(C_Item)
{
	name = "Řezivo z vrbového dřeva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_EveTree.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_VyzTree(C_Item)
{
	name = "Řezivo z jilmového dřeva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_BukTree.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_YsuoTree(C_Item)
{
	name = "Řezivo z jasanového dřeva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 15;
	visual = "ItMi_YsuoTree.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BokTree(C_Item)
{
	name = "Řezivo z bukového dřeva";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 20;
	visual = "ItMi_BokTree.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_JustBowCorpse(C_Item)
{
	name = "Krátké lučiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_JustBowCorpse.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_EveCorpse(C_Item)
{
	name = "Vrbové lučiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_EveCorpse.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_VyzCorpse(C_Item)
{
	name = "Jilmové lučiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_VyzCorpse.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_YsuoCorpse(C_Item)
{
	name = "Jasanové lučiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 15;
	visual = "ItMi_YsuoCorpse.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BokCorpse(C_Item)
{
	name = "Bukové lučiště";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 20;
	visual = "ItMi_BokCorpse.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TeleportStone(C_Item)
{
	name = "Prastará runová tabulka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_TeleportStone.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Vyzařuje magickou energii...";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	inv_animate = 1;
};

instance ItMi_Fitil(C_Item)
{
	name = "Doutnák děla";
	mainflag = ITEM_KAT_NONE;
	value = 5;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_Fitil.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_CanoneBall(C_Item)
{
	name = "Dělová koule";
	mainflag = ITEM_KAT_NONE;
	value = 15;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "KanonenKugel.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_CanoneBall_Fire(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "KanonenKugel.3ds";
	material = MAT_METAL;
	effect = "SPELLFX_CHARGEFIREBALL_COLLIDE";
	description = name;
	inv_animate = 1;
};

instance ItMi_MagicPowder(C_Item)
{
	name = "Magický střelný prach";
	mainflag = ITEM_KAT_NONE;
	value = 500;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ITMI_MAGICPOWDER.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Používat opatrně...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TeleportFarm(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_NONE;
	value = 500;
	flags = ITEM_MISSION;
	visual = "ItRu_TeleportFarm.3ds";
	material = MAT_STONE;
	description = NAME_SPL_TeleportFarm;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TeleportTaverne(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_NONE;
	value = 500;
	flags = ITEM_MISSION;
	visual = "ItRu_Teleport_2.3ds";
	material = MAT_STONE;
	description = NAME_SPL_TeleportTaverne;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TeleportPsicamp(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_NONE;
	value = 500;
	flags = ITEM_MISSION;
	visual = "ItRu_Water09.3DS";
	material = MAT_STONE;
	description = NAME_SPL_TELEPORTPSICAMP;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance CA_ITMI_BRANCH(C_Item)
{
	name = "Dřevěná větev";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "CA_ITMI_BRANCH.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BeliarPowerStone(C_Item)
{
	name = "Temný kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_BeliarSign.3ds";
	material = MAT_METAL;
	effect = "SPELLFX_MAGIC_SMOKE";
	description = name;
	text[3] = "Symbol Beliarova Vyvoleného...";
	text[4] = "Vyzařuje temnou magickou energii...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//--------------------------------sumki------------------------------

instance ItBg_Armor(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 350;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Armor;
	description = "Brašna na vybavení";
	text[4] = "Používána ke skladování zbrojí, opasků, helem a štítů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Armor()
{
	OpenPocket(item,ITEM_KAT_ARMOR | ITEM_SHIELD | ITEM_BELT);
};

instance ItBg_Weapon(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Bag_01.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Weapon;
	description = "Brašna na zbraně";
	text[4] = "Používána ke skladování různých zbraní a munice...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Weapon()
{
	OpenPocket(item,ITEM_KAT_NF | ITEM_KAT_FF | ITEM_KAT_MUN);
};

instance ItBg_Alchemy(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 150;
	visual = "ItMi_Bag_02.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Alchemy;
	description = "Alchymistova brašna";
	text[4] = "Používána ke skladování alchymistických nápojů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Alchemy()
{
	OpenPocket(item,ITEM_KAT_POTIONS);
};

instance ItBg_Mage(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 200;
	visual = "ItMi_Bag_03.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Mage;
	description = "Mágova brašna";
	text[4] = "Používána ke skladování run, knih a svitků...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Mage()
{
	OpenPocket(item,ITEM_KAT_RUNE | ITEM_KAT_DOCS);
};

instance ItBg_Jewerly(C_Item)
{
	name = "Brašna";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 250;
	visual = "ItMi_Bag_04.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Jewerly;
	description = "Brašna na šperky";
	text[4] = "Používána ke skladování prstenů, amuletů a klíčů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Jewerly()
{
	OpenPocket(item,ITEM_RING | ITEM_AMULET);
};

instance ItBg_PlatsFood(C_Item)
{
	name = "Pytel";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Bag_05.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_PlatsFood;
	description = "Pytel s proviantem";
	text[4] = "Používán ke skladování jídla a rostlin...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_PlatsFood()
{
	OpenPocket(item,ITEM_KAT_FOOD);
};

instance ItBg_Trash(C_Item)
{
	name = "Pytel";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 50;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Trash;
	description = "Pytel";
	text[4] = "Používán ke skladování různých věcí...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_HELM;
	inv_rotz = 45;
	inv_rotx = -90;
	inv_rotx = -45;
	inv_animate = 1;
};

func void Use_ItBg_Trash()
{
	OpenPocket(item,ITEM_KAT_ARMOR | ITEM_SHIELD | ITEM_BELT | ITEM_KAT_NF | ITEM_KAT_FF | ITEM_KAT_MUN | ITEM_KAT_POTIONS | ITEM_KAT_RUNE | ITEM_KAT_DOCS | ITEM_RING | ITEM_AMULET | ITEM_KAT_FOOD | ITEM_KAT_NONE | INV_MAX_MAGIC);
};

instance ItPl_ExBlueMalve(C_Item)
{
	name = "Modrý sléz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItPl_ExBlueMalve.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_BlackPearlNeckle(C_Item)
{
	name = "Náhrdelník z černých perel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_BlackPearlNeckle.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Vzácný a šíleně drahý šperk...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_SONJAWIG(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	value = 1;
	wear = WEAR_HEAD;
	visual = "ITMI_SONJAWIG_NEW.3DS";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
};

instance ITMI_GERALTHAIR(C_Item)
{
	name = "Bílý vlk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_GERALTHAIR.3DS";
	material = MAT_LEATHER;
	description = "Bílý vlk";
};


//--------------------------mutageny-------------------------------

instance ItMi_Mutagen_Str_Low(C_Item)
{
	name = "Malý mutagen síly";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Str_Normal(C_Item)
{
	name = "Mutagen síly";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Str_Strong(C_Item)
{
	name = "Velký mutagen síly";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Low(C_Item)
{
	name = "Malý mutagen obratnosti";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Normal(C_Item)
{
	name = "Mutagen obratnosti";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Strong(C_Item)
{
	name = "Velký mutagen obratnosti";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Low(C_Item)
{
	name = "Malý mutagen zdraví";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Normal(C_Item)
{
	name = "Mutagen zdraví";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Strong(C_Item)
{
	name = "Velký mutagen zdraví";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Low(C_Item)
{
	name = "Malý mutagen many";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Normal(C_Item)
{
	name = "Mutagen many";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Strong(C_Item)
{
	name = "Velký mutagen many";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Low(C_Item)
{
	name = "Malý mutagen výdrže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Normal(C_Item)
{
	name = "Mutagen výdrže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Strong(C_Item)
{
	name = "Velký mutagen výdrže";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[3] = "Velice vzácná alchymistická přísada...";
	text[4] = "Používán k posílení účinků lektvarů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMw_Kirka_New(C_Item)
{
	name = "Krumpáč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	visual = "ItMw_020_2h_Pickaxe_01_Sky.3DS";
	description = name;
	text[4] = "Používán k těžbě rudy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Axe_L_01(C_Item)
{
	name = "Krumpáč";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "ITMW_KIRKA_NEW.3DS";
	description = name;
	text[4] = "Používán k těžbě rudy...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Chopper(C_Item)
{
	name = "Dřevorubecká sekyra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "ITMW_2H_LUMBERAXE_01.3DS";
	description = name;
	text[4] = "Používána ke kácení stromů...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_Axe_WoodChoppin(C_Item)
{
	name = "Kalač";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "WOODCHOPPIIN_AXE.3DS";
	description = name;
	text[4] = "Používán ke štípání polen...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_FlyCarpet(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	material = MAT_WOOD;
	value = 1000;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = 350;
	mag_circle = 4;
	visual = "FLYING_CARPET_01.3DS";
	description = "Er'Khazirův magický koberec";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Mana_needed;
	count[3] = 350;
	text[4] = "Dokáže se pohybovat vzduchem...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_FlyCarpet(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_WOOD;
	value = 1;
	visual = "FLYING_CARPET_02.3DS";
	description = name;
};

instance ItMi_SMD_Mutagen(C_Item)
{
	name = "Malá esence démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_MD_Mutagen(C_Item)
{
	name = "Esence démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_LMD_Mutagen(C_Item)
{
	name = "Silná esence démona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SMAD_Mutagen(C_Item)
{
	name = "Malá esence arcidémona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Slabé účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_MAD_Mutagen(C_Item)
{
	name = "Esence arcidémona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Obvyklé účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_LMAD_Mutagen(C_Item)
{
	name = "Silná esence arcidémona";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 450;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Silné účinky...";
	text[4] = "Používána k posílení démonologické runy...";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItTrollStone(C_Item)
{
	name = "Kámen";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_TrollStone.3ds";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItMi_Angel(C_Item)
{
	name = "Udice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItMi_Angel.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_FAngel(C_Item)
{
	name = "Udice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItSe_FAngel.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_MeetKnife(C_Item)
{
	name = "Nůž";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Scoop;
	visual = "ITMW_1H_ON_107.3DS";
	material = MAT_WOOD;
	description = "Nůž na porcování masa";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HildaKnife(C_Item)
{
	name = "Nůž";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Scoop;
	visual = "ITMW_1H_ON_107.3DS";
	material = MAT_WOOD;
	description = "Hildin nůž";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_LotarRing(C_Item)
{
	name = "Stříbrný prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Na prstenu je vyryto jméno 'Lothar'...";
	text[4] = "Svítí podivnou magickou září...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_StafanRing(C_Item)
{
	name = "Stříbrný prsten";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Na prstenu je vyrytý nápis 'Stefanovi od Ha...'";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMw_KillPirateSaebel(C_Item)
{
	name = "Stará pirátská šavle";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMw_PirCutlas.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Na čepeli zůstali zaschlé kapky něčí krve...";
	inv_animate = 1;
};

instance ItMi_DarkScroll(C_Item)
{
	name = "Temný svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "V tomhle svitku je ukryta neznámá temná magie...";
	inv_animate = 1;
};

instance ItMi_ShipShceme(C_Item)
{
	name = "Schéma řízení";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Obsahuje nákresy součástek řízení 'Elsy'...";
	inv_animate = 1;
};

var int IlTowerOnce;

instance ItMi_Darktransfer(C_Item)
{
	name = "Runa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_Darktransfer;
	description = "Runa přemístění";
	text[3] = "Tuhle runu vyrobil Vatras...";
	text[4] = "Zavede mě k Lotharovu vrahovi...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItMi_Darktransfer()
{
	if(Npc_IsPlayer(self))
	{
		TeleportItuseld = TRUE;
	};
};

//-----------------epik---------------------------------------------

instance ItMi_IlisilAmulet(C_Item)
{
	name = "Ile'Silův medailon";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItAm_Mana_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Tenhle medailon mi dal Ile'Sil...";
	text[3] = "Ochraňuje před zhoubnými účinky ostrovního klimatu...";
	text[4] = "Nemusím ho mít nasazený...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ArahArEye(C_Item)
{
	name = "Arah'Arovo oko";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_DARKEYE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Mrtvé oko mocného licha...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ArahArEye_Unknown(C_Item)
{
	name = "Kousek zkamenělého masa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_DARKEYE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Kulatý kousek zkamenělého masa...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_FiarasHeart(C_Item)
{
	name = "Fiarasovo srdce";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Srdce ohnivého golema Fiarase...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_Seed_Agony(C_Item)
{
	name = "Sémě bolesti";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Seed_Agony.3DS";
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_Seed_Despair(C_Item)
{
	name = "Sémě prokletí";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Seed_Despair.3DS";
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_Seed_Doom(C_Item)
{
	name = "Sémě destrukce";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Seed_Doom.3DS";
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_XardasMagicScroll(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_XardasMagicScroll;
	description = "Xardasův magický svitek";
	text[4] = "Dokáže přivolat ducha zemřelého...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void Use_ItMi_XardasMagicScroll()
{
	if(Npc_IsPlayer(self) && (StefanIns == FALSE) && (MIS_HauntedLighthouse == LOG_Running))
	{
		if(Npc_GetDistToWP(self,"Z_LH_SCROLL_01") < 500)
		{
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
			Wld_InsertNpc(Skeleton_Stefan,"NW_SOUL_LH_01");
			StefanIns = TRUE;
			B_LogEntry(TOPIC_HauntedLighthouse,"Použil jsem Xardasův svitek. Teď tady musím všechno prověřit...");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			AI_Print("Tohle není správné místo...");
			CreateInvItems(self,ItMi_XardasMagicScroll,1);
		};
	};
};

instance ItAr_Helm_Blood(C_Item)
{
	name = "Helma krve";
	mainflag = ITEM_KAT_ARMOR;
	flags = ITEM_MISSION;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 30;
	protection[PROT_FLY] = 40;
	value = protection[PROT_MAGIC];
	wear = WEAR_HEAD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 450;
	material = MAT_METAL;
	on_equip = Equip_ItAr_Helm_Blood;
	on_unequip = UnEquip_ItAr_Helm_Blood;
	visual = "DAEDRAHELM3.3DS";
	visual_change = "DAEDRAHELM3.3DS";
	visual_skin = 0;
	description = name;
	text[0] = NAME_Str_needed;
	count[0] = cond_value[2];
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Blunt;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_Prot_Point;
	count[3] = protection[PROT_POINT];
	text[4] = NAME_Prot_Fire;
	count[4] = protection[PROT_FIRE];
	text[5] = NAME_Prot_Magic;
	count[5] = protection[PROT_MAGIC];
	inv_zbias = INVCAM_ENTF_HELM;
	inv_animate = 0;
};

func void Equip_ItAr_Helm_Blood()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = TRUE;
		HelmIsUpTemp = FALSE;
		HelmStam = 5;

		if((ArmorWithCapisUp == TRUE) || (MageArmorWithCapisUp == TRUE))
		{
			AI_UnequipArmor(self);
		};
	};
};

func void UnEquip_ItAr_Helm_Blood()
{
	if(Npc_IsPlayer(self))
	{
		HelmIsUp = FALSE;
		HelmIsUpTemp = FALSE;
		HelmStam = 0;
	};
};