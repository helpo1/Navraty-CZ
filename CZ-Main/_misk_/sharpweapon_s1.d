var int SharpBlade;
var int SharpMiscWeapon;

func void sharpweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SHARPWEAPON;
		AI_ProcessInfos(her);
	};
};

instance PC_SHARPWEAPON_END(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_sharpweapon_end_condition;
	information = pc_sharpweapon_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int pc_sharpweapon_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SHARPWEAPON)
	{
		return TRUE;
	};
};

func void pc_sharpweapon_end_info()
{
	CreateInvItems(hero,itmiswordblade_1,1);
	b_endproductiondialog();
	SharpBlade = FALSE;
	SharpMiscWeapon = FALSE;
};

instance PC_SharpNow(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_SharpNow_condition;
	information = PC_SharpNow_info;
	permanent = TRUE;
	description = "Naostřit čepel";
};

func int PC_SharpNow_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SHARPWEAPON) && (KNOWHOWSHARPWEAPON == TRUE) && (SharpBlade == FALSE) && (SharpMiscWeapon == FALSE))
	{
		return TRUE;
	};
};

func void PC_SharpNow_info()
{
	AI_Wait(self,1);
	B_GivePlayerXP(10);
	CreateInvItems(hero,ItMw_1H_Common_01_Blade,1);
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	Snd_Play("SHARP_DONE");
	b_endproductiondialog();
	SharpBlade = FALSE;
	SharpMiscWeapon = FALSE;
};

instance PC_SharpNow_MyWeapon(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_SharpNow_MyWeapon_condition;
	information = PC_SharpNow_MyWeapon_info;
	permanent = TRUE;
	description = "Naostřit nasazenou zbraň";
};

func int PC_SharpNow_MyWeapon_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SHARPWEAPON) && (KNOWHOWSHARPWEAPON == TRUE) && (SharpBlade == FALSE) && (SharpMiscWeapon == FALSE))
	{
		return TRUE;
	};
};

func void PC_SharpNow_MyWeapon_info()
{
	var string concatText;
	var C_Item SharpMyBlade;

	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		SharpMyBlade = Npc_GetEquippedMeleeWeapon(hero);

		if((Hlp_IsValidItem(SharpMyBlade) == TRUE) && (SharpMyBlade.damage[DAM_INDEX_FIRE] == TRUE))
		{		
			if(SharpMyBlade.hp == FALSE)
			{
				RankPoints = RankPoints + 1;
				SharpMyBlade.hp = TRUE;
				SharpMyBlade.damage[DAM_INDEX_EDGE] = SharpMyBlade.damage[DAM_INDEX_EDGE] + ((SharpMyBlade.damage[DAM_INDEX_EDGE] * 10) / 100);
				SharpMyBlade.count[1] = SharpMyBlade.damage[DAM_INDEX_EDGE];
				concatText = SharpMyBlade.visual_change;
				concatText = ConcatStrings(concatText," | Naostřená");
				SharpMyBlade.visual_change = concatText;
				SharpMyBlade.text[4] = concatText;
				SharpBladeID = Hlp_GetInstanceID(SharpMyBlade);
				//Print(PRINT_SharpedBlade);
				AI_PrintClr(PRINT_SharpedBlade,83,152,48);
				//B_Say(self,self,"$ITEMREADY");
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

	b_endproductiondialog();
	SharpBlade = FALSE;
	SharpMiscWeapon = FALSE;
};
