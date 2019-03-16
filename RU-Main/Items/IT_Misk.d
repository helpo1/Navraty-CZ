
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
	name = "Золотой самородок";
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
	name = "Кусок золотой руды";
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
	name = "Жемчужина";
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
	name = "Зов сна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Addon_Joint_01 * 10;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = usespecialjoint;
	description = name;
	text[3] = "Этот болотник обладает более сильным эффектом, чем обычный...";
	text[4] = "Подарок для Идола Парвеза...";
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
	name = "Посылка Бельтрама";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Тяжелый пакет, полный всякого барахла...";
	text[4] = "Этот пакет дал мне крестьянин Акил...";
	inv_animate = 1;
};

instance ItMi_LoaPartyFood(C_Item)
{
	name = "Сверток с едой";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 500;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый сверток, полный всякой свежей и вкусной еды...";
	inv_animate = 1;
};

instance ItMi_SkipShipPack(C_Item)
{
	name = "Сверток с деталями";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый сверток с деталями для корабельного руля...";
	inv_animate = 1;
};

instance ItMi_Packet_Baltram4Skip_Addon(C_Item)
{
	name = "Пакет для Скипа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Тяжелый пакет, полный всякого барахла...";
	text[4] = "Предназначен для пирата по имени Скип...";
	inv_animate = 1;
};

instance ItMi_BromorsGeld_Addon(C_Item)
{
	name = "Золотая чаша Бромора";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "На дне этой чаши острым предметом нацарапано имя 'Бромор'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_ADDON_CavalornsBeutel(C_Item)
{
	name = "Кожаный мешочек Кавалорна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = Use_CavalornsBeutel;
	description = name;
	text[4] = "На мешочке вышито имя 'Кавалорн'...";
	inv_animate = 1;
};


func void Use_CavalornsBeutel()
{
	CreateInvItems(hero,ItMi_Nugget,1);
	AI_Print(PRINT_FoundOreNugget);
	SC_OpenedCavalornsBeutel = TRUE;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut,LOG_Running);
	B_LogEntry(TOPIC_Addon_CavalornTheHut,"У хижины Кавалорна в рудной долине я нашел кошелек со слитком руды. Кавалорн, старый разбойник, наверняка забыл его там.");
};


instance ItMi_Skull(C_Item)
{
	name = "Череп";
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
	name = "Виолончель";
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
	name = "Drum";
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
	name = "Китаррон";
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
	name = "DrumStick";
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
	name = "Волынка";
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
	name = "Волынка";
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
	name = "Арфа";
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
	name = "Лютня";
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
	name = "Звенящий пакет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	on_state[0] = Use_LennarPaket;
	material = MAT_LEATHER;
	description = name;
	text[4] = "Внутри пакета что-то звенит...";
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
	name = "Черная руда";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "KOHLE_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Очень редкая по составу рудная порода...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Silber(C_Item)
{
	name = "Серебряный самородок";
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
	name = "Лунный камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "MOON_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Крайне редкая по составу рудная порода...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Adamant(C_Item)
{
	name = "Адамант";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50000;
	visual = "SILVER_NUGGET.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Крайне прочная по составу рудная порода...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//----------------------------------------------------------------------------------

instance ItMi_Addon_Joint_01(C_Item)
{
	name = "Зеленый послушник";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Addon_Joint_01;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Addon_Joint_01;
	description = name;
	text[2] = "Немного снижает усталость...";
	text[3] = "Дополнительный эффект воздействия на гуру и стражей";
	text[4] = NAME_Duration;
	count[4] = 10;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_JOINT_02(C_Item)
{
	name = "Северный темный";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ADDON_JOINT_02;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_joint_02;
	description = name;
	text[2] = "Немного снижает усталость...";
	text[3] = "Дополнительный эффект воздействия на гуру и стражей";
	text[4] = NAME_Duration;
	count[4] = 15;
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_JOINT_03(C_Item)
{
	name = "Зов мечты";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ADDON_JOINT_03;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_joint_03;
	description = name;
	text[2] = "Немного снижает усталость...";
	text[3] = "Дополнительный эффект воздействия на гуру и стражей";
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
				AI_Print("Вы погружаетесь в состояние магической концентрации...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_01;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_01;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_01;
				AI_Print("Вы погружаетесь в состояние боевой концентрации...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Вы испытываете обычные ощущения...");
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
				AI_Print("Вы погружаетесь в состояние магической медитации...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_02;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_02;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_02;
				FightMeditation = TRUE;
				AI_Print("Вы погружаетесь в состояние боевой медитации...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Вы испытываете обычные ощущения...");
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
				AI_Print("Вы погружаетесь в состояние магического транса...");
			}
			else if(hero.guild == GIL_TPL)
			{
				hero.protection[PROT_EDGE] = hero.protection[PROT_EDGE] + JointBonus_03;
				hero.protection[PROT_BLUNT] = hero.protection[PROT_BLUNT] + JointBonus_03;
				hero.protection[PROT_POINT] = hero.protection[PROT_POINT] + JointBonus_03;
				FightMeditation = TRUE;
				WarTranse = TRUE;
				AI_Print("Вы погружаетесь в состояние боевого транса...");
			};

			Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
		}
		else
		{
			AI_Print("Вы испытываете обычные ощущения...");
		};
	};
};

instance ItMi_Stomper(C_Item)
{
	name = "Толкун";
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
	name = "Печная лопатка";
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
	name = "Рунный камень";
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
	name = "Руна шамана гоблинов";
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
	name = "Старший рунный камень";
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
	name = "Высший рунный камень";
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
	name = "Рунный камень Пирокара";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_RuneBlank;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	description = name;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_PyroRune;
	text[4] = "Эта руна способна поглощать магическую энергию...";
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
				B_LogEntry(TOPIC_XRANFREG,"Полагаю, что количества магической энергии в руне теперь достаточно, чтобы попробовать с помощью нее уничтожить того каменного голема...Правда, где его искать - это вопрос.");
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
				B_LogEntry(TOPIC_XRANFREG,"Полагаю, что количества магической энергии в руне теперь достаточно, чтобы попробовать с помощью нее уничтожить того каменного голема...Правда, где его искать - это вопрос.");
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
				B_LogEntry(TOPIC_XRANFREG,"Полагаю, что количества магической энергии в руне теперь достаточно, чтобы попробовать с помощью нее уничтожить того каменного голема...Правда, где его искать - это вопрос.");
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
				B_LogEntry(TOPIC_XRANFREG,"Полагаю, что количества магической энергии в руне теперь достаточно, чтобы попробовать с помощью нее уничтожить того каменного голема...Правда, где его искать - это вопрос.");
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
				B_LogEntry(TOPIC_XRANFREG,"Полагаю, что количества магической энергии в руне теперь достаточно, чтобы попробовать с помощью нее уничтожить того каменного голема...Правда, где его искать - это вопрос.");
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
	name = "Необычный рунный камень";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItRu_TeleportXardas.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_GalomRuneBack;
	description = name;
	text[4] = "Излучает магическую энергию...";
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
	name = "Щипцы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Предназначены для столярных работ...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_AnvilPliers(C_Item)
{
	name = "Кузнечные клещи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_AnvilPliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Предназначены для плавки метелла и ковки...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Flask(C_Item)
{
	name = "Алхимический сосуд";
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
	name = "Молоток";
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
	name = "Половник";
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
	name = "Сковорода";
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
	name = "Сковорода";
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
	name = "Пила";
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
	name = "Стальная заготовка";
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
	name = "Раскаленная стальная заготовка";
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
	name = "Раскаленный самокованый клинок";
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
	name = "Самокованый клинок";
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
	name = "Метла";
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
				AI_Print("Кажется тут теперь чисто...");
				NOV_Helfer = NOV_Helfer + 1;
			};
		};
	};
};

instance ItMi_Lute(C_Item)
{
	name = "Лютня";
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
	name = "Щетка";
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
	name = "Трубка";
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
	name = "Косяк из болотной травы";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Joint;
	visual = "ITMI_JOINT_SPEC.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = Use_Joint;
	description = name;
	text[2] = "Немного снижает усталость...";
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
	name = "Косяк из красной болотной травы";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_REDJOINT;
	visual = "G3_Item_Smoke_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = use_itmi_redjoint;
	description = name;
	text[2] = "Эффект воздействия неизвестен...";
	text[4] = "Этот косяк изготовлен из красной болотной травы...";
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
	name = "Пакет";
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
	name = "Пакет Лобарта";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Пакет с продовольствием для Ватраса";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Pocket(C_Item)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE | ITEM_MULTI;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = UsePocket;
	description = name;
	text[4] = "Небольшой мешочек, не очень тяжелый...";
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
	name = "Магическая руда";
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
	name = "Железный слиток";
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
	name = "Золотой слиток";
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
	name = "Рудный слиток";
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
	name = "Железная руда";
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
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Nugget;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Кусок руды из самородной жилы...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
	inv_animate = 1;
};

instance ItMi_Gold(C_Item)
{
	name = "Золотая монета";
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
	name = "Старинная монета";
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
	name = "Проклятое золото";
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
	name = "Золотой подсвечник";
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
	name = "Золотое ожерелье";
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
	name = "Серебряное кольцо";
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
	name = "Серебряный кубок";
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
	name = "Серебряная тарелка";
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
	name = "Золотая тарелка";
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
	name = "Золотой кубок";
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
	name = "Золотой кубок Харима";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldCup;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "По краю кубка выбиты следующие слова:";
	text[4] = "'Лучшему бойцу арены Старого лагеря от Гомеза...'";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_GOMEZGOLDCUP(C_Item)
{
	name = "Чаша Рудного барона";
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
	name = "Кровавая чаша";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_BloodCup;
	visual = "ItMi_BloodCup_MIS_Sky.3DS";
	material = MAT_METAL;
	description = "Кровавая чаша";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_RingGold(C_Item)
{
	name = "Золотое кольцо";
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
	name = "Золотое кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = Value_GoldRing;
	visual = "ItMi_Ring_Gold_New_Raven.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "На кольце выгравировано имя 'Ворон'...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD * 3;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SilverChalice(C_Item)
{
	name = "Серебряная чаша";
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
	name = "Золотая ваза";
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
	name = "Золотая шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldChest;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_goldchest;
	description = name;
	text[4] = "Запертая золотая шкатулка...";
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
			AI_Print("Внутри оказалось пусто...");
		}
		else
		{
			goldchestrandom = 100;
			CreateInvItems(self,ItMi_Gold,goldchestrandom);
			concatText = ConcatStrings("Найдено ",IntToString(goldchestrandom));
			concatText = ConcatStrings(concatText," золотых монет...");
			AI_Print(concatText);
		};

		CreateInvItems(self,ITMI_CHEST_EMPTYGOLD,1);
	};
};

instance ItMi_JeweleryChest(C_Item)
{
	name = "Драгоценная шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_JeweleryChest;
	visual = "ItMi_JeweleryChest_Sky.3DS";
	material = MAT_METAL;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_jewelerychest;
	description = name;
	text[4] = "Запертая драгоценная шкатулка...";
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
			AI_Print("Найдено несколько драгоценных камней!");
		}
		else if(jewelerychestrandom >= 50)
		{
			CreateInvItems(self,ItMi_SilverRing,1);
			CreateInvItems(self,ItMi_RingGold,1);
			CreateInvItems(self,ItMi_SilverNecklace,1);
			JEWELERYCHESTPEARL += 1;
			AI_Print("Найдено несколько драгоценных украшений!");
		}
		else if(jewelerychestrandom >= 25)
		{
			CreateInvItems(self,ItMi_OldCoin,13);
			JEWELERYCHESTPEARL += 1;
			AI_Print("Найдено несколько старинных монет!");
		}
		else
		{
			AI_Print("Внутри оказалось пусто...");
			JEWELERYCHESTPEARL += 1;
		};
		if(JEWELERYCHESTPEARL == 2)
		{
			CreateInvItems(self,ItMi_DarkPearl,1);
			JEWELERYCHESTPEARL = 0;
			if(jewelerychestrandom < 25)
			{
				AI_Print("...почти пусто");
			};
		};
		CreateInvItems(self,itmi_jewelerychest_empty,1);
	};
};


instance ITMI_CHEST_EMPTYGOLD(C_Item)
{
	name = "Золотая шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_GOLDCHEST_EMPTY;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Пустая золотая шкатулка...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 0;
};

instance ITMI_JEWELERYCHEST_EMPTY(C_Item)
{
	name = "Драгоценная шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_JEWELERYCHEST_EMPTY;
	visual = "ItMi_JeweleryChest_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Пустая драгоценная шкатулка......";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_TGoblin(C_Item)
{
	name = "Золотая статуэтка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItMi_GoblinReliq.3DS";
	material = MAT_METAL;
	scemeName = "MAP";
	description = name;
	text[4] = "Походит на фигурку какого-то божества...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_InnosStatue(C_Item)
{
	name = "Статуэтка Инноса";
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

//-------------------------Мольба-----------------------

instance PC_PRAYMOBILE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PRAYMOBILE_end_condition;
	information = PC_PRAYMOBILE_end_info;
	permanent = TRUE;
	description = "(...закрыть)";
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
	description = "Молиться";
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
	name = "Статуэтка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "Statue_Demon_01.3ds";
	scemeName = "MAP";
	material = MAT_STONE;
	on_state[0] = Use_ItMi_Statue_Demon_01;
	description = "Статуэтка демона";
	text[4] = "Драгоценная мраморная статуэтка демона";
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
	description = "(...закрыть)";
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
	description = "Молиться";
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
	name = "Статуэтка зодчих";
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
	name = "Мраморная статуэтка Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 3000;
	visual = "ITMI_INNOSMRAMORSTATUE.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Драгоценная статуэтка Инноса из черного нордмарского мрамора...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Sextant(C_Item)
{
	name = "Секстант";
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
	name = "Серебряный подсвечник";
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
	name = "Серебряное ожерелье";
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
	name = "Сера";
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
	name = "Ледяной кварц";
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
	name = "Смола";
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
	name = "Горный хрусталь";
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
	name = "Аквамарин";
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
	name = "Уголь";
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
	name = "Черная жемчужина";
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
	name = "Яблочный табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_ApfelTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Кисет с яблочным табаком...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_PilzTabak(C_Item)
{
	name = "Грибной табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_PilzTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Кисет с темным яблочно-грибным табаком...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_DoppelTabak(C_Item)
{
	name = "Двойной яблочный табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_DoppelTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Кисет с двойной порцией яблочного табака...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Honigtabak(C_Item)
{
	name = "Медовый табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_HonigTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Кисет со сладким медовым табаком...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SumpfTabak(C_Item)
{
	name = "Травяной табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Табачная смесь из болотной травы...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Hasish(C_Item)
{
	name = "Ганджа";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ItMi_SumpfTabak;
	visual = "ItMi_Pocket_Spec.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Странного вида темный прессованный порошек...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_QUICKSILVER(C_Item)
{
	name = "Ртуть";
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
	name = "Горн";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Horn_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Ритуальный горн...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_ORCRING(C_Item)
{
	name = "Орочье кольцо";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MULTI | ITEM_MISSION | ITEM_RING;
	value = 1;
	visual = "ItMi_Ring_Silver_New_Runed.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[4] = "На кольце выбиты орочьи письмена и стоит клеймо ввиде символа X...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCSTAFF(C_Item)
{
	name = "Грахтнакк";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItRw_Orcstaff_03.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Эта палка похожа на посох орка-шамана...";
	inv_animate = 1;
};

instance ITMI_ORCAMULET(C_Item)
{
	name = "Орочий талисман";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Этот амулет похоже принадлежал орку-шаману...";
	inv_animate = 1;
};

instance ITMI_ORCAMULET_VANHAN(C_Item)
{
	name = "Орочий талисман Ур-Хана";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	on_equip = equip_itmi_orcamulet_vanhan;
	on_unequip = unequip_itmi_orcamulet_vanhan;
	material = MAT_STONE;
	description = name;
	text[4] = "Этот амулет похоже принадлежал орку-шаману Ур-Хану...";
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
	name = "Дух Орков";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = "Фигурка какого-то бесформенного божественного существа орков...";
	inv_animate = 1;
};

instance ITMI_IDOL_02(C_Item)
{
	name = "Облик Тьмы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Каменная статуэтка темного бога Белиара...";
	text[4] = "Излучает огромную магическую силу...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_IDOL_03(C_Item)
{
	name = "Жертвенный камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Idol_Ogront_02.3DS";
	material = MAT_CLAY;
	description = name;
	text[4] = "Жертвенный камень шаманов орков...";
	inv_animate = 1;
};

instance ITMI_CRYSTALBLACK(C_Item)
{
	name = "Черный кристалл";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_BlackCrystal_Sky.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Большой кусок очень редкого черного хрусталя...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_1_ORCPORTALSTONE(C_Item)
{
	name = "Магический кристалл";
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
	name = "Магический кристалл";
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
	name = "Каменный кристалл";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Focus_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Камень в виде фокусирующего кристала, со страными символами...";
	inv_animate = 1;
};

instance ITMI_FISKPACKET(C_Item)
{
	name = "Пакет Фиска";
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
	name = "Пакет с углем";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый клейменный пакет с углем...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_ALEFNUGGETSBAG(C_Item)
{
	name = "Пакет с рудой";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Packet.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_alefnuggetsbag;
	description = name;
	text[4] = "Тяжелый клейменный пакет с магической рудой...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_alefnuggetsbag()
{
	B_PlayerFindItem(ItMi_Nugget,600);
	B_LogEntry(TOPIC_VIPERNUGGETS,"Вайпер не соврал - в найденом мною пакете, действительно оказалось не меньше шестиста кусков!");
};

instance ITMI_FIRESHPERE(C_Item)
{
	name = "Сфера Огня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIREBOW";
	description = name;
	text[3] = "Камень сферического вида, испещренный древними рунами...";
	text[4] = "Сфера окружена огненной аурой...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_WATERSHPERE(C_Item)
{
	name = "Сфера Воды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_WATERSPHERE";
	description = name;
	text[3] = "Камень сферического вида, испещренный древними рунами...";
	text[4] = "Сфера окружена аурой воды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITMI_STONESHPERE(C_Item)
{
	name = "Сфера Скалы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_STONESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[3] = "Камень сферического вида, испещренный древними рунами...";
	text[4] = "Сфера окружена белой аурой...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_DARKSHPERE(C_Item)
{
	name = "Сфера Тьмы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[3] = "Камень сферического вида, испещренный древними рунами...";
	text[4] = "Сфера окружена черным дымом...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_TRIRAMAR(C_Item)
{
	name = "Амулет Трирамар";
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
	text[3] = "Амулет исписчрен древними рунами...";
	text[4] = "В нем заключена часть силы Темного Бога...";
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
	name = "Шкатулка паладинов";
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
	name = "Золотой рог Ахианти";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2500;
	visual = "ITMI_GOLDDRAGONGORN_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "HORN";
	description = name;
	text[3] = "Звук этого артефакта способен призвать архидемона С'эньяка...";
	text[4] = "Горн можно использовать только один раз!!!";
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
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я призвал С'эньяка с помощью горна Аш'Тара!");
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
	name = "Камень с душой С'эньяка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITMI_SENYAKSOUL.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_stonesoul_senyak;
	description = name;
	text[4] = "В этом камне находится душа архидемона С'эньяка...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_stonesoul_senyak()
{
	if(SoulSenyakFree == FALSE)
	{
		Snd_Play("OPENSOUL");
		AI_Print("Вы освободили душу С'эньяка!");
		Wld_SpawnNpcRange(hero,ghost_senyak_demon,1,2000);
		SoulSenyakFree = TRUE;
	};
};

instance ItMi_IlesilSoul(C_Item)
{
	name = "Камень души";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10000;
	visual = "ITMI_STONESOUL_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_IlesilSoul;
	description = name;
	text[4] = "В этом камне находится душа Иле'Силя...";
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
	name = "Камень души";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ITMI_STONESOUL_01.3ds";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_stonesoul;
	description = name;
	text[4] = "В этом камне находится душа убитого мной существа...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

func void use_itmi_stonesoul()
{
	Snd_Play("MYSTERY_06");
	AI_Print("Вы освободили душу!");
};





instance ITMI_BENGARPACKET(C_Item)
{
	name = "Пакет Бенгара";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 800;
	visual = "G3_Item_Packet_01.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	on_state[0] = use_bengarpacket;
	text[4] = "Пакет с товарами от Бенгара...";
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
	name = "Черный думтрейский брэнди";
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
	name = "Золотое ожерелье";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_GoldNecklace;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Подарок Ханне от ее сестры Абигаль...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Salt(C_Item)
{
	name = "Соль";
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
	name = "Спальный мешок";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 20;
	visual = "ItMi_SleepSack_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	description = name;
	text[3] = "Сделан из теплой овечьей шкуры...";
	text[4] = "На нем я могу хорошо поспать...";
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
	name = "Спальный мешок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_SleepSack_New_02.3DS";
	material = MAT_LEATHER;
	description = name;
};

instance ItAr_Hut(C_Item)
{
	name = "Матерчатая шапка";
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
	name = "Матерчатая накидка";
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
	name = "Шапка вора";
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
	name = "Шляпа капитана";
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
	name = "Железный шлем";
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
	name = "Шлем лучника";
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
	name = "Шлем Эр'Хазира";
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
	name = "Нордмарский шлем";
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
	name = "Покров берсерка";
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
	name = "Шлем рыцаря";
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
	name = "Шлем рыцаря";
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
	name = "Шлем паладина";
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
	name = "Шлем паладина";
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
	name = "Шлем генерала паладинов";
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
	name = "Шлем генерала паладинов";
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
	name = "Шлем драконоборца";
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
	name = "Драконий шлем";
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
	name = "Корона Льда";
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
	text[4] = "Легендарный артефакт, созданный Аданосом...";
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
				AI_Print("Вы чувствуете, как становитесь сильнее!");
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

				AI_Print("Вы чувствуете, как вас переполняет духовной энергией!");
				BONUS_CRONE_FLAG = 3;
			};
		}
		else if(self.attribute[ATR_DEXTERITY] > self.attribute[ATR_STRENGTH])
		{
			if(self.attribute[ATR_DEXTERITY] >= self.attribute[ATR_MANA_MAX])
			{
				self.attribute[ATR_DEXTERITY] = self.attribute[ATR_DEXTERITY] + BONUS_CRONE;
				AI_Print("Вы чувствуете, как становитесь ловчее!");
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

				AI_Print("Вы чувствуете, как вас переполняет духовной энергией!");
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
	name = "Древний шлем";
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
	name = "Маска Спящего";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITAR_SLEEPER_MASK_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[2] = "В этой маске заключена часть силы Спящего,";
	text[3] = "злого демона, низвергнутого когда-то мной...";
	text[4] = "Излучает сильную темную ауру...";
	inv_animate = 1;
};

instance ITMI_HELMSLEEPER(C_Item)
{
	name = "Маска Спящего";
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
		AI_Print("Вам дарована особенная способность - 'Око Спящего'!");
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
	name = "Компас";
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
	name = "Старый кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_itmi_falkgrandfatheritem_01;
	description = "Старый кошелек";
	text[4] = "На кошелке вышита литера 'Б'...";
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_01()
{
	B_PlayerFindItem(itwr_falkgrandfather_01,1);
	B_PlayerFindItem(ItMi_Gold,50);
};


instance ITMI_FALKGRANDFATHERITEM_02(C_Item)
{
	name = "Пустая бутылка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_Rum_02.3ds";
	scemeName = "MAPSEALED";
	material = MAT_GLAS;
	on_state[0] = use_itmi_falkgrandfatheritem_02;
	description = "Бутылка";
	text[3] = "Пустая бутылка из под рома...";
	text[4] = "Из горлышка бутылки торчит кусок бумаги...";
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
	name = "Рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 5;
	visual = "ItFo_Fish_Sky.3DS";
	material = MAT_LEATHER;
	scemeName = "MAPSEALED";
	on_state[0] = use_itmi_falkgrandfatheritem_03;
	description = name;
	text[4] = "В этой рыбе что-то зашито...";
	inv_animate = 1;
};


func void use_itmi_falkgrandfatheritem_03()
{
	B_PlayerFindItem(itwr_Halkgrandfather_03,1);
};


instance ITMI_FALKGRANDFATHERITEM_04(C_Item)
{
	name = "Пустая бутылка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 5;
	visual = "ItMi_Rum_01.3ds";
	scemeName = "MAPSEALED";
	material = MAT_GLAS;
	on_state[0] = use_itmi_falkgrandfatheritem_04;
	description = "Бутылка";
	text[3] = "Пустая бутылка из под грога...";
	text[4] = "Из горлышка бутылки торчит кусок бумаги...";
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
	name = "Шестерня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Gearwheel_01.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Кусок металла, обработаный ввиде шестигранника...";
	inv_animate = 1;
};

instance ITMI_STUFF_GEARWHEEL_02(C_Item)
{
	name = "Каменная звезда";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Stuff_Gearwheel_02.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Кусок камня, обработаный в виде звезды...";
	inv_animate = 1;
};

instance ITMI_MISSTORLOFTHING(C_Item)
{
	name = "Старый компас";
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
	name = "Прах";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1000;
	visual = "Nergal_Corpse.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Телесный прах некроманта Нергала...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_ZombieCorpse(C_Item)
{
	name = "Мертвая плоть";
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
	name = "Эктоплазма";
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
	name = "Дух предков";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_GaderStone.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Магический артефакт хранителя Гадера...";
	inv_animate = 1;
};

instance ITMI_WATERCRYSTAL(C_Item)
{
	name = "Водная жемчужина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2200;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Эта жемчужина досталась мне от Духа Воды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_FIRESTONE(C_Item)
{
	name = "Огненный кристалл";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1750;
	visual = "ItMi_FireStone.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Это частица побежденного мною Духа Огня...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_PIECEDARKGOLEM(C_Item)
{
	name = "Кусок теневого голема";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1500;
	visual = "ItMi_PieceDarkGolem.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Это частица побежденного мною теневого голема...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCMAINTOTEM(C_Item)
{
	name = "Тотем Силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_OrcMainTotem.3ds";
	material = MAT_STONE;
	description = name;
	text[3] = "Тотем Силы является знаком власти вождя орков...";
	text[4] = "Его хозяин может не бояться орков!";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};


instance ItMi_GrahShar(C_Item)
{
	name = "Грах Шах";
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
	text[4] = "Символ Мор Дар, лучшего воина орков...";
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
	name = "Пустой пузырек";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ITFO_POTION_STRENGTH_01.3DS";
	material = MAT_GLAS;
	scemeName = "POTION";
	description = name;
	text[4] = "В этом пузырьке когда-то находился сильнодействующий яд...";
	inv_animate = 1;
};

instance ITMI_ADANOSAMULET(C_Item)
{
	name = "Амулет древних ритуалов";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[4] = "Этот предмет зодчие использовали для своих древних ритуалов...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ITMI_ORCWARHORN(C_Item)
{
	name = "Орочий горн";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ITMI_ORCWARHORN_SKY.3DS";
	material = MAT_LEATHER;
	scemeName = "HORN";
	description = name;
	text[4] = "Боевой горн орков...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


// Драг Нимрод -----------------------------------------------

instance ItMi_MagicOrePliers(C_Item)
{
	name = "Магические клещи";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Этот инструмент изготовлен из магической руды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_5(C_Item)
{
	name = "Чистая рудная болванка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 2000;
	visual = "ItMi_PureOreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Рудная заготовка из чистейшего сплава магической руды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_4(C_Item)
{
	name = "Рудная болванка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Чистая рудная заготовка превосходнейшего качества...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_3(C_Item)
{
	name = "Рудная болванка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 900;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Чистая рудная заготовка хорошего качества...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_2(C_Item)
{
	name = "Рудная болванка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 800;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Чистая рудная заготовка обычного качества...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_MagicOreRaw_1(C_Item)
{
	name = "Чистая рудная болванка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 700;
	visual = "ItMi_OreStuck_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Чистая рудная заготовка плохого качества...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_DragNimrod(C_Item)
{
	name = "Орочья записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_OrcN.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_DragNimrod;
	scemeName = "MAP";
	description = name;
	text[4] = "Клочок бумаги с орочьими записями...";
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
			B_LogEntry(TOPIC_TagNorGrHunWeap,"Суть орочьих записей сводится примерно к следующему...- 'Более великого оружия у орков еще не было! Думаю, что даже великий вождь всех орков не достоин владеть им. Его убойная мощь чудовищна и способна завалить даже могучего нормардского бизона с одно выстрела. Все, что нужно для его создания это - ЧИСТАЯ болванка магической руды, рог черного троля, смазанные жиром сухожилия какого-нибудь хищника, дерево тропического бука для создания упора и артефакт, принадлежавший великому охотнику прошлого.'");

			if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerRudoplav == TRUE))
			{
				B_LogEntry_Quiet(TOPIC_TagNorGrHunWeap,"Теперь я знаю, как создать великое оружие орков - Драг Нимрод! Однако на деле все оказалось не так просто. В записях, что дал мне Таг-Нор, упоминается ЧИСТАЯ болванка из магической руды. Я просто умею плавить магическую руду, но тут речь видимо идет немного о другом. Думаю, что стоит спросить об этом Вайпера...");
			}
			else if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerRudoplav == FALSE))
			{
				B_LogEntry_Quiet(TOPIC_TagNorGrHunWeap,"Теперь я знаю, как создать великое оружие орков - Драг Нимрод! Однако на деле все оказалось не так просто. В записях, что дал мне Таг-Нор, упоминается ЧИСТАЯ болванка из магической руды. У меня нет никаких мыслей насчет того, как ее заполучить или изготовить. Придется найти плавильщика, который в этом разбирается...");
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
			AI_Print("Интеллект + 1");
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
	name = "Темный кристалл души";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	description = name;
	text[4] = "Странного вида магическая субстанция черного цвета...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ITMI_NOVMATERIAL(C_Item)
{
	name = "Пакет с тканью";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 500;
	visual = "G3_Item_Packet_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый пакет с большим количеством прессованной ткани...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_AssGoldPocket(C_Item)
{
	name = "Кошелек";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	material = MAT_LEATHER;
	description = "Кошелек";
	text[4] = "Туго набитый золотом кошелек...";
	inv_animate = 1;
};

instance ItMi_HasimAmuls(C_Item)
{
	name = "Драгоценные четки";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "G3_Artefact_Amulett_Violett_01.3DS";
	material = MAT_LEATHER;
	description = "Драгоценные четки";
	text[3] = "На некоторых камнях выбиты символы";
	text[4] = "образовывающие слово 'Хасим'...";
	inv_animate = 1;
};

instance ItMi_PacketColesulfur(C_Item)
{
	name = "Грязный пакет";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Тяжелый пакет с большим количеством серы и угля...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_SulfurMuttonRaw(C_Item)
{
	name = "Серное мясо";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_SulfurMuttonRaw;
	description = name;
	text[4] = "Сырое мясо, хорошо обработанное серой...";
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
	name = "Перо";
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
	name = "Перья гарпии";
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
	name = "Краски";
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
	name = "Кисть";
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
	name = "Бутылка";
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

//------------------------------------------итемы для плато Древних-----------------------------

instance ItMi_LP_StonePlate_01(C_Item)
{
	name = "Древняя каменная табличка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	description = "Древняя каменная табличка";
	text[4] = "Вся покрыта надписями на древнем языке...";
	inv_animate = 1;
};

instance ItWr_CroneAdanos(C_Item)
{
	name = "Древняя скрижаль";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	description = "Древняя скрижаль";
	text[3] = "Старинная потертая скрижаль...";
	text[4] = "Вся скрижаль испещрена надписями на древнем языке...";
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
		B_LogEntry(TOPIC_AdanosCrone,"В храме Аданоса я нашел древнюю табличку. Однако я не смог ее прочесть! Надо показать ее Сатурасу. Может быть у него получится? Или тому, кто знает древний язык Зодчих лучше меня.");
	};
};

instance ItWr_AdanosCrone_Ready(C_Item)
{
	name = "Магическая древняя скрижаль";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	description = "Магическая древняя скрижаль";
	text[3] = "Старинная потертая скрижаль...";
	text[4] = "Вся скрижаль испещрена надписями на древнем языке...";
	text[5] = "Излучает магическую энергию...";
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
	name = "Рунное сердце Стража";
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
	name = "Рунная скрижаль Стража";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_StonePlate_PowerUp_04.3DS";
	material = MAT_STONE;
	scemeName = "MAP";
	description = name;
	text[4] = "Все надписи сделаны на очень древнем языке...";
	inv_animate = 1;
};

instance ItMi_XoD_01(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Странного вида каменный осколок с орнаментом...";
	text[5] = "Излучает магическую энергию...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_YoD_02(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Странного вида каменный осколок с орнаментом...";
	text[5] = "Излучает магическую энергию...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ZoD_03(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Странного вида каменный осколок с орнаментом...";
	text[5] = "Излучает магическую энергию...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_UoD_04(C_Item)
{
	name = "Каменный осколок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Странного вида каменный осколок с орнаментом...";
	text[5] = "Излучает магическую энергию...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_AdanosTear(C_Item)
{
	name = "Слеза Аданоса";
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
	name = "Золотой скипетр";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	material = MAT_METAL;
	visual = "ARTEFAKT.3DS";
	on_state[0] = Use_GoldSkipetr;
	scemeName = "MAPSEALED";
	description = name;
	text[4] = "В основании скипетра имеется углубленное отверстие в виде капли...";
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
			B_LogEntry(TOPIC_AdanosCrone,"Слеза Аданоса, как влитая, вошла в основание золотого скипетра! Все плато озарилось яркой вспышкой и с неба пошел ледяной дождь...Для чего использовался этот предмет?");
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
	name = "Золотой скипетр Аданоса";
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
	text[4] = "Скипетр источает магическую энергию...";
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
	name = "Кусок рунной плитки";
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
	name = "Кусок рунной плитки";
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
	name = "Кусок рунной плитки";
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
	name = "Кусок рунной плитки";
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
	name = "Кусок рунной плитки";
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
			B_LogEntry(TOPIC_AdanosCrone,"Я соединил куски камня Стражей. Все вместе они собрались в огромный кусок скрижальной доски...Думаю, что это один из кусков скрижали алтаря.");
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
			B_LogEntry(TOPIC_AdanosCrone,"Я соединил куски камня Стражей. Все вместе они собрались в огромный кусок скрижальной доски...Думаю, что это один из кусков скрижали алтаря.");
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
			B_LogEntry(TOPIC_AdanosCrone,"Я соединил куски камня Стражей. Все вместе они собрались в огромный кусок скрижальной доски...Думаю, что это один из кусков скрижали алтаря.");
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
			B_LogEntry(TOPIC_AdanosCrone,"Я соединил куски камня Стражей. Все вместе они собрались в огромный кусок скрижальной доски...Думаю, что это один из кусков скрижали алтаря.");
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
	name = "Рунная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_DuneAdanos;
	description = name;
	text[4] = "Похоже, что эта плитка часть какой-то большой скрижали...";
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
	name = "Рунная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_GuneAdanos_02;
	description = name;
	text[4] = "Похоже, что эта плитка часть какой-то большой скрижали...";
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
	name = "Рунная плитка";
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
	text[4] = "Полностью собранная магическая скрижаль...";
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
		B_LogEntry(TOPIC_AdanosCrone,"Рисунок на собраной скрижальной доске изображает некую последовательность магических символов.");
	};

	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"BOOK_PYRAMIDPASS.tga",1);
	Doc_Show(nDocID);
};

instance ItMi_TearsRune(C_Item)
{
	name = "Камень Слез";
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
	name = "Орочий амулет воина";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Amulet_Ulumulu_01.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Знак отличия элитных орков...";
	inv_animate = 1;
};

instance ItMi_HuntSign(C_Item)
{
	name = "Талисман великого охотника";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_HuntSign.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Символ, принадлежавший ранее одному из великих охотников...";
	inv_animate = 1;
};

instance ItMi_BukTree(C_Item)
{
	name = "Кусок тропического бука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_BukTree.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Небольшой кусок тропического бука...";
	inv_animate = 1;
};

instance ItMi_Buk_Arbalet(C_Item)
{
	name = "Арбалетный упор";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_Buk_Arbalet.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Изготовлен из дерева тропического бука...";
	inv_animate = 1;
};

instance ItAt_BlackTrollHorn(C_Item)
{
	name = "Рог черного тролля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "G3_Item_AnimalTrophy_Horn_ShadowBeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Рог могучего пещерного тролля...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_PumaMuscle(C_Item)
{
	name = "Сухожилия пумы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Прочные сухожилия пумы...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItAt_PumaMuscle_Jir(C_Item)
{
	name = "Сухожилия пумы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ITAT_VEINLIZARD.3DS";
	material = MAT_LEATHER;
	description = name;
	text[3] = "Очень прочные сухожилия пумы...";
	text[4] = "Обработаны жиром...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_OldTextMine(C_Item)
{
	name = "Древняя плитка";
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
	name = "Камень-кристалл";
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
	name = "Стальной шлем";
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
	name = "Шлем наемника";
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
	name = "Рогатый шлем";
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
	name = "Венец демонов";
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
	text[3] = "Древнейший артефакт владыки демонов, Элигора...";
	text[4] = "Полностью защищает от ментальных атак";
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
	name = "Шлем скелета";
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
	name = "Шлем скелета-воина";
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
	name = "Шлем скелета-стража";
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
	name = "Шлем скелета-лорда";
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
	name = "Шлем скелета-лорда";
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
	name = "Шлем Иль'Арах";
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
	name = "Корона Авабюл";
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
	name = "Шлем Януса";
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
	name = "Шлем Вечности";
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
	name = "Кусок жезла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Металлический кусок магического жезла...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_02(C_Item)
{
	name = "Кусок жезла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Металлический кусок магического жезла...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_03(C_Item)
{
	name = "Кусок жезла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Металлический кусок магического жезла...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_04(C_Item)
{
	name = "Кусок жезла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Металлический кусок магического жезла...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DragonStaffPiece_Eye(C_Item)
{
	name = "Глаз дракона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Безжизненое око могущественного существа...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_SteelForm(C_Item)
{
	name = "Форма для оправы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 100;
	visual = "ItMi_SteelForm.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Используется для изготовления украшений...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Diamod(C_Item)
{
	name = "Алмаз";
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
	name = "Изумруд";
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
	name = "Рубин";
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
	name = "Сапфир";
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
	name = "Опал";
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
	name = "Топаз";
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
	name = "Фляга с грогом";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	visual = "ItMi_Rum_02.3ds";
	material = MAT_GLAS;
	description = "Фляга с грогом";
	inv_animate = 1;
};

instance ItMi_ZharpStone(C_Item)
{
	name = "Точильный оселок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItMi_SharpStone_New_01.3DS";
	material = MAT_STONE;
	on_state[0] = Use_ItMi_SharpStone;
	scemeName = "MAP";
	description = name;
	text[3] = "Используется для заточки оружия...";
	text[4] = "Увеличивает урон оружия при заточке в % на:";
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
				concatText = ConcatStrings(concatText," | Заточено");
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
	name = "Рунный камень Зодчих";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItRu_Beliar06.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Рунный камень Зодчих, лишенный магии...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_NecrUrn(C_Item)
{
	name = "Урна с прахом";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_NECRURN.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Урна с прахом неизвестного мага...";
	inv_animate = 1;
};

instance ItMi_Avatar_Water(C_Item)
{
	name = "Ледяной кристалл";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_WATERSPHERE.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Магическая сущность ледяного атронаха...";
	effect = "SPELLFX_GEYSER_FOUNTAIN";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Fire(C_Item)
{
	name = "Кусок застывшей лавы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_FIRESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIREBOW";
	description = name;
	text[4] = "Магическая сущность огненного атронаха...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Dark(C_Item)
{
	name = "Темный кристалл души";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[4] = "Магическая сущность создания Тьмы...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_HaosAvatarStone(C_Item)
{
	name = "Кристалл Хаоса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_DARKSPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_FIRESWORDBLACK";
	description = name;
	text[4] = "Магическая сущность Хаоса...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

instance ItMi_Avatar_Stone(C_Item)
{
	name = "Каменный глаз";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItMi_STONESPHERE.3ds";
	material = MAT_GLAS;
	effect = "SPELLFX_STONESPHERE";
	description = name;
	text[4] = "Магическая сущность каменного атронаха...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//-------------------------------новые итемы--------------------------------------

instance ItMi_BigRuby(C_Item)
{
	name = "Королевский рубин";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 5000;
	visual = "ItMi_BigRuby.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Драгоценный камень огромных размеров...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_DiamondChoker(C_Item)
{
	name = "Бриллиантовое ожерелье";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 5000;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Редкое и очень дорогое украшение...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HuntHornGold(C_Item)
{
	name = "Золотой охотничий рог";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 2000;
	visual = "ItMi_Horn_Sky.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Богато украшенное приспособление для охоты...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_KnifeGold(C_Item)
{
	name = "Золотой кинжал";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 3000;
	visual = "ItMi_GoldKnife.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Редкое и очень дорогое оружие...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_OreBaronCrown(C_Item)
{
	name = "Корона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItMi_OreBaronCrown.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Инкрустирована драгоценными камнями...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Wax(C_Item)
{
	name = "Пузырек с чернилами";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Wax.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Используется для письма...";
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
	description = "Морская карта";
	text[4] = "Карта, указывающая точный курс к материку...";
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
	name = "Шлем жреца Зодчих";
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
	name = "Дневник Кроу";
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
	name = "Кусок рунного камня";
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
	name = "Тетива из шкуры волка";
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
	name = "Тетива из шкуры кабана";
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
	name = "Тетива из шкуры варга";
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
	name = "Тетива из шкуры мракориса";
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
	name = "Тетива из шкуры тролля";
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
	name = "Заготовка из древесины";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_JustTree.3ds";
	material = MAT_WOOD;
	description = name;
	inv_animate = 1;
};

instance ItMi_EveTree(C_Item)
{
	name = "Заготовка ивовой древесины";
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
	name = "Заготовка вязовой древесины";
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
	name = "Заготовка ясеневой древесины";
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
	name = "Заготовка буковой древесины";
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
	name = "Древко короткого лука";
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
	name = "Древко ивового лука";
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
	name = "Древко вязового лука";
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
	name = "Древко ясеневого лука";
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
	name = "Древко букового лука";
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
	name = "Древняя рунная плитка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_TeleportStone.3ds";
	material = MAT_STONE;
	description = name;
	text[4] = "Излучает магическую энергию...";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	inv_animate = 1;
};

instance ItMi_Fitil(C_Item)
{
	name = "Пушечный фитиль";
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
	name = "Пушечное ядро";
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
	name = "Магический порох";
	mainflag = ITEM_KAT_NONE;
	value = 500;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ITMI_MAGICPOWDER.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Использовать с осторожностью...";
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
	name = "Деревянная ветка";
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
	name = "Темный камень";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	visual = "ItMi_BeliarSign.3ds";
	material = MAT_METAL;
	effect = "SPELLFX_MAGIC_SMOKE";
	description = name;
	text[3] = "Символ Избранного Белиара...";
	text[4] = "Излучает темную магическую энергию...";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
	inv_animate = 1;
};

//--------------------------------сумки------------------------------

instance ItBg_Armor(C_Item)
{
	name = "Сумка";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 350;
	visual = "ItMi_Suma.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Armor;
	description = "Доспешная сумка";
	text[4] = "Используется для хранения доспехов, поясов, шлемов и щитов...";
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
	name = "Сумка";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 300;
	visual = "ItMi_Bag_01.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Weapon;
	description = "Оружейная сумка";
	text[4] = "Используется для хранения различного оружия и боеприпасов...";
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
	name = "Сумка";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 150;
	visual = "ItMi_Bag_02.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Alchemy;
	description = "Cумка алхимика";
	text[4] = "Используется для хранения алхимических напитков...";
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
	name = "Сумка";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 200;
	visual = "ItMi_Bag_03.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Mage;
	description = "Cумка мага";
	text[4] = "Используется для хранения рун, книг и свитков...";
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
	name = "Сумка";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 250;
	visual = "ItMi_Bag_04.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Jewerly;
	description = "Cумка для украшений";
	text[4] = "Используется для хранения колец, амулетов и ключей...";
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
	name = "Мешок";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 100;
	visual = "ItMi_Bag_05.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_PlatsFood;
	description = "Мешок с припасами";
	text[4] = "Используется для хранения еды и трав...";
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
	name = "Мешок";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION;
	value = 50;
	visual = "ITMI_POCKET_BIG.3ds";
	scemeName = "MAP";
	material = MAT_LEATHER;
	on_state[0] = Use_ItBg_Trash;
	description = "Вещевой мешок";
	text[4] = "Используется для хранения различных вещей...";
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
	name = "Голубая мальва";
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
	name = "Ожерелье из черного жемчуга";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_BlackPearlNeckle.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Редкое и безумно дорогое украшение...";
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
	name = "Белый волк";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_GERALTHAIR.3DS";
	material = MAT_LEATHER;
	description = "Белый волк";
};


//--------------------------мутагены-------------------------------

instance ItMi_Mutagen_Str_Low(C_Item)
{
	name = "Малый мутаген силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Str_Normal(C_Item)
{
	name = "Мутаген силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Str_Strong(C_Item)
{
	name = "Большой мутаген силы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Str.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Low(C_Item)
{
	name = "Малый мутаген ловкости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Normal(C_Item)
{
	name = "Мутаген ловкости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Dex_Strong(C_Item)
{
	name = "Большой мутаген ловкости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Dex.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Low(C_Item)
{
	name = "Малый мутаген жизненной энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Normal(C_Item)
{
	name = "Мутаген жизненной энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_HP_Strong(C_Item)
{
	name = "Большой мутаген жизненной энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_HP.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Low(C_Item)
{
	name = "Малый мутаген магической энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Normal(C_Item)
{
	name = "Мутаген магической энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Mana_Strong(C_Item)
{
	name = "Большой мутаген магической энергии";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Mana.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Low(C_Item)
{
	name = "Малый мутаген выносливости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Normal(C_Item)
{
	name = "Мутаген выносливости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_Mutagen_Stamina_Strong(C_Item)
{
	name = "Большой мутаген выносливости";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1500;
	visual = "ItMi_Mutagen_Stamina.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[3] = "Очень редкий алхимический ингредиент...";
	text[4] = "Используется для усиления действия эликсиров";
	text[5] = NAME_Value;
	count[5] = value;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMw_Kirka_New(C_Item)
{
	name = "Кирка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 100;
	visual = "ItMw_020_2h_Pickaxe_01_Sky.3DS";
	description = name;
	text[4] = "Используется для добычи руды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_2H_Axe_L_01(C_Item)
{
	name = "Кирка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "ITMW_KIRKA_NEW.3DS";
	description = name;
	text[4] = "Используется для добычи руды...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_Chopper(C_Item)
{
	name = "Топор дровосека";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "ITMW_2H_LUMBERAXE_01.3DS";
	description = name;
	text[4] = "Используется для рубки деревьев...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMw_1H_Axe_WoodChoppin(C_Item)
{
	name = "Колун";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	visual = "WOODCHOPPIIN_AXE.3DS";
	description = name;
	text[4] = "Используется для рубки поленьев...";
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
	description = "Магический ковер Эр'Хазира";
	text[2] = NAME_Mag_Circle;
	count[2] = mag_circle;
	text[3] = NAME_Mana_needed;
	count[3] = 350;
	text[4] = "Способен перемещаться по воздуху...";
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
	name = "Малая эссенция демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_MD_Mutagen(C_Item)
{
	name = "Эссенция демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_LMD_Mutagen(C_Item)
{
	name = "Сильная эссенция демона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_SMAD_Mutagen(C_Item)
{
	name = "Малая эссенция архидемона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Слабый эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_MAD_Mutagen(C_Item)
{
	name = "Эссенция архидемона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Обычный эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_LMAD_Mutagen(C_Item)
{
	name = "Сильная эссенция архидемона";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 450;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Сильный эффект воздействия";
	text[4] = "Используется для усиления руны демонолога";
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItTrollStone(C_Item)
{
	name = "Камень";
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
	name = "Удочка";
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
	name = "Удочка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItSe_FAngel.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ItMi_MeetKnife(C_Item)
{
	name = "Нож";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Scoop;
	visual = "ITMW_1H_ON_107.3DS";
	material = MAT_WOOD;
	description = "Нож для разделки мяса";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_HildaKnife(C_Item)
{
	name = "Нож";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Scoop;
	visual = "ITMW_1H_ON_107.3DS";
	material = MAT_WOOD;
	description = "Нож Хильды";
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItMi_LotarRing(C_Item)
{
	name = "Серебряное кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "На кольце выгравировано имя - Лотар...";
	text[4] = "Излучает странное магическое свечение...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMi_StafanRing(C_Item)
{
	name = "Серебряное кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMi_Ring_Silver_New_Named.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "На кольце выгравирована надпись - Стефану от Ха...";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};

instance ItMw_KillPirateSaebel(C_Item)
{
	name = "Старая пиратская сабля";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "ItMw_PirCutlas.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "На клинке остались запекшиеся капли чей-то крови...";
	inv_animate = 1;
};

instance ItMi_DarkScroll(C_Item)
{
	name = "Темный свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Этот свиток содержит неизвестную темную магию...";
	inv_animate = 1;
};

instance ItMi_ShipShceme(C_Item)
{
	name = "Схема рулевого управления";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Содержит изображение деталей рулевого управления 'Эльзы'...";
	inv_animate = 1;
};

var int IlTowerOnce;

instance ItMi_Darktransfer(C_Item)
{
	name = "Руна";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 10;
	visual = "ItMi_RuneBlank_New.3DS";
	material = MAT_STONE;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_Darktransfer;
	description = "Руна перемещения";
	text[3] = "Руна созданная Ватрасом...";
	text[4] = "Она приведет к убийце Лотара...";
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

//-----------------эпик---------------------------------------------

instance ItMi_IlisilAmulet(C_Item)
{
	name = "Медальон Иле'Силя";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItAm_Mana_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Этот медальон дал мне Иле'Силь...";
	text[3] = "Защищает от пагубного воздействия климата острова...";
	text[4] = "Необязателен к экипировке...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ArahArEye(C_Item)
{
	name = "Око Арах'Ара";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_DARKEYE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Безжизненое око могущественного лича...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_ArahArEye_Unknown(C_Item)
{
	name = "Кусок окаменевшей плоти";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ITMI_DARKEYE.3ds";
	material = MAT_METAL;
	description = name;
	text[4] = "Круглый кусок окаменевшей плоти...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_FiarasHeart(C_Item)
{
	name = "Сердце Фиараса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "Сердце огненного голема, Фиараса...";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_animate = 1;
};

instance ItMi_Seed_Agony(C_Item)
{
	name = "Семя боли";
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
	name = "Семя проклятия";
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
	name = "Семя разрушения";
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
	name = "Свиток";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	description = name;
	scemeName = "MAPSEALED";
	on_state[0] = Use_ItMi_XardasMagicScroll;
	description = "Магический свиток Ксардаса";
	text[4] = "Способен призвать дух умершего...";
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
			B_LogEntry(TOPIC_HauntedLighthouse,"Я использовал свиток Ксардаса. Теперь надо тут все проверить...");
		}
		else
		{
			B_Say(hero,hero,"$DONTWORK");
			AI_Print("Не то место...");
			CreateInvItems(self,ItMi_XardasMagicScroll,1);
		};
	};
};

instance ItAr_Helm_Blood(C_Item)
{
	name = "Шлем Крови";
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