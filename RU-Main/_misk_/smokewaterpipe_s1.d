
var int mana_rationday;
var int mana_rationday_m;
var int mana_rationday_m1;
var int HashishFT;
var int HashishST;
var int HashishWFT;
var int HasishBonusDay;

func void smokewaterpipe_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMOKEWATERPIPE;
		AI_ProcessInfos(her);
	};
};

instance PC_SMOKEWATERPIPE_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_smokewaterpipe_end_condition;
	information = pc_smokewaterpipe_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};


func int pc_smokewaterpipe_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SMOKEWATERPIPE)
	{
		return TRUE;
	};
};

func void pc_smokewaterpipe_end_info()
{
	b_endproductiondialog();
};


instance PC_SMOKEWATERPIPE_ADDON_HOUR(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_smokewaterpipe_addon_hour_condition;
	information = pc_smokewaterpipe_addon_hour_info;
	permanent = TRUE;
	description = "Сделать затяжку.";
};

func int pc_smokewaterpipe_addon_hour_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMOKEWATERPIPE) && (CurrentLevel != PRIORATWORLD_ZEN))
	{
		return TRUE;
	};
};

func void pc_smokewaterpipe_addon_hour_info()
{
	var int level;
	var int random;

	if((SBMODE == TRUE) && (JointRest == FALSE))
	{
		Hero_Fatigue = Hero_Fatigue + 1;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};

		JointRest = TRUE;
	};
	if(hero.guild == GIL_GUR)
	{
		if(MANA_RATIONDAY != Wld_GetDay())
		{
			level = hero.level;
			random = Hlp_Random(100);

			if(level > random)
			{
				B_GivePlayerXP(25);				
				RankPoints = RankPoints + 1;
				Print("Ваше сознание переполняют особенные ощущения!");
				B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,1);
				Npc_ChangeAttribute(self,ATR_MANA,1);
				BONUSCOUNT += 1;
				Npc_SetStateTime(self,0);
				MANA_RATIONDAY = Wld_GetDay();
			}
			else
			{
				Print("Ваше сознание наполняется необычной легкостью...");
			};
		}
		else
		{
			MANA_RATIONDAY = Wld_GetDay();
			Print("Вы испытываете обычные ощущения.");
		};
	};
};

instance PC_SMOKEWATERPIPE_ADDON_HASHISH(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SMOKEWATERPIPE_ADDON_HASHISH_condition;
	information = PC_SMOKEWATERPIPE_ADDON_HASHISH_info;
	permanent = TRUE;
	description = "Сделать затяжку.";
};

func int PC_SMOKEWATERPIPE_ADDON_HASHISH_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMOKEWATERPIPE) && (CurrentLevel == PRIORATWORLD_ZEN))
	{
		return TRUE;
	};
};

func void PC_SMOKEWATERPIPE_ADDON_HASHISH_info()
{
	var int daynow;
	var int ranskill;

	daynow = Wld_GetDay();
	ranskill = Hlp_Random(100);

	if(HashishWFT == FALSE)
	{
		HashishWFT = TRUE;
		HasishBonusDay = Wld_GetDay();
		b_endproductiondialog();
		AI_StartState(hero,ZS_MagicSleep,1,"");
	}
	else if((HashishWFT == TRUE) && (HashishFT == FALSE))
	{
		if(HasishBonusDay < (daynow - 1))
		{
			HashishFT = TRUE;
			HasishBonusDay = Wld_GetDay();
		};

		b_endproductiondialog();
		AI_StartState(hero,ZS_MagicSleep,1,"");
	}
	else if((HashishFT == TRUE) && (HashishST == FALSE))
	{
		if(HasishBonusDay < (daynow - 1))
		{
			HashishST = TRUE;
			HasishBonusDay = Wld_GetDay();
		};

		b_endproductiondialog();
	}
	else if(HashishST == TRUE)
	{
		if(HasishBonusDay < (daynow - 5))
		{
			Print("Ваc переполняет огромный прилив энергии!");

			if(ranskill >= 75)
			{
				B_RaiseAttribute_Bonus(self,ATR_STRENGTH,1);
				Npc_ChangeAttribute(self,ATR_STRENGTH,1);
			}
			else if(ranskill >= 50)
			{
				B_RaiseAttribute_Bonus(self,ATR_DEXTERITY,1);
				Npc_ChangeAttribute(self,ATR_DEXTERITY,1);
			}
			else if(ranskill >= 25)
			{
				B_RaiseAttribute(self,ATR_HITPOINTS_MAX,5);
				Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,5);
			}
			else
			{
				B_RaiseAttribute_Bonus(self,ATR_MANA_MAX,2);
				Npc_ChangeAttribute(self,ATR_MANA_MAX,2);
			};

			RankPoints = RankPoints + 1;
			Npc_SetStateTime(self,0);
			HasishBonusDay = Wld_GetDay();
		}
		else
		{
			Print("Вы испытываете обычные ощущения.");
		};
	};
};