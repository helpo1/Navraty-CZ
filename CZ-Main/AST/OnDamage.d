class aSDamageDesc
{
	var int			nSpellID;				//ID Zaklinaniya nanesshego uron
	var int			nSpellCat;				//Kategoriya zaklinaniya nanesshego uron
	var int			nSpellLevel;			//Uroven' zaklinaniya nanesshego uron
	var int			arrDamage[8];			//Massiv urona po tipam (polnyy uron oruzhiya)
	var int			arrDamageEffective[8];	//Massiv urona po tipam (real'nyy uron kotoryy byl nanesen)
	var STRING		strVisualFX;			//Imya vizual'nogo effekta ???
	var float		fTimeDuration;			//Vremya deystviya urona (kogda nps gorit)
	var float		fTimeinterval;			//Interval cherez kotoryy nanositsya uron
	var float		fDamagePerinterval;		//Uron za interval
	var int			bDamageDontKill;		//NPS ne budet ubit
	var int			bIsDead;				//NPS mertv
	var int			bIsUnconscious;			//NPS bez soznaniya
};

//Peremennyye NE IZMENYAT', ikh znacheniya ustanavlivayutsya dvizhkom!
instance oDamage(aSDamageDesc);
var int pAttaker;
var int pWeapon;
var int pHit;

var int pos;
var int RavenBlitz;

func void OnDamage()
{
	var c_npc pOther; 
	var c_item pItem; 
	var c_item lItem; 
	var c_item rItem; 
	var c_npc pSelf; 
	var string str;
	var int AllDamage;
	var int RavenRandy;
	var int RavenDamage;
	var int ranscream;
	var int ranblood;
	var int PoisonChance;
	var int RandParrySnd;
	var int AllDam;
	var int tmpDamage;
	var C_Item OthWeap;
	var C_Item pItm;
	var int MultiIceSh;
	var int ptmpDamage;

	var int TempTougthness;
	var int TempReduceStam;

	var int TempReduceInt;
	var int TempDamMana;
	var int tmpExtDamage;

	var int randy;

	pOther = Hlp_GetNpc(pAttaker);
	pItem  = Hlp_GetItem(pWeapon);
	pSelf  = Hlp_GetNpc(pHit);

	if(Npc_IsPlayer(pSelf) && (Hlp_IsValidNpc(pOther) == TRUE) && (BlockIsUpSnd == TRUE) && (HEROTRANS == FALSE) && (Mount_Up == FALSE))
	{
		Snd_Play("CS_IHL_ST_WO");
		BlockIsUpSnd = FALSE;
	};
	if(Npc_IsPlayer(pSelf) && (Hlp_IsValidNpc(pOther) == TRUE) && (IceShield == FALSE) && (IceSHTimer == FALSE))
	{
		pItm = Npc_GetEquippedArmor(pSelf);

		if(Hlp_IsItem(pItm,ITAR_KDW_L_Addon) || Hlp_IsItem(pItm,ITAR_KDW_H) || Hlp_IsItem(pItm,ItAr_KDW_SH) || Hlp_IsItem(pItm,ITAR_KDW_ADANOS))
		{
			if(Hlp_IsItem(pItm,ITAR_KDW_L_Addon))
			{
				MultiIceSh = 1;
			}
			else if(Hlp_IsItem(pItm,ITAR_KDW_H) || Hlp_IsItem(pItm,ITAR_KDW_ADANOS))
			{
				MultiIceSh = 2;
			}
			else if(Hlp_IsItem(pItm,ItAr_KDW_SH))
			{
				MultiIceSh = 3;
			};

			IceSH = pSelf.level * MultiIceSh;

			if((IceSH > 0) && (Hlp_Random(100) <= 50))
			{
				if(Menu_ReadInt("AST","bShowFireShield") == TRUE)
				{
					Wld_PlayEffect("SPELLFX_ICESPELL_SENDPERCEPTION",pSelf,pSelf,0,0,0,FALSE);
				};

				pSelf.protection[PROT_EDGE] += IceSH;  
				pSelf.protection[PROT_BLUNT] += IceSH;  
				pSelf.protection[PROT_POINT] += IceSH; 
				pSelf.protection[PROT_FIRE] += IceSH; 
				pSelf.protection[PROT_MAGIC] += IceSH; 
				IceShield = TRUE;
				IceSHTimer = TRUE;
			};
		};
	};
	if(Menu_ReadInt("AST","bShowDamage") == TRUE)
	{
		if(Hlp_GetInstanceID(pSelf) == Hlp_GetInstanceID(hero))
		{
			OthWeap = Npc_GetReadiedWeapon(pOther);

			if((OthWeap.flags & (ITEM_2HD_AXE | ITEM_SWD | ITEM_2HD_SWD)) == (OthWeap.flags & (ITEM_2HD_AXE | ITEM_SWD | ITEM_2HD_SWD)))
			{
				tmpDamage = tmpDamage + oDamage.arrDamageEffective[0] + oDamage.arrDamageEffective[1] + oDamage.arrDamageEffective[2] + oDamage.arrDamageEffective[3] + oDamage.arrDamageEffective[4] + oDamage.arrDamageEffective[5] + (oDamage.arrDamageEffective[6] / 10) + (oDamage.arrDamageEffective[7] / 10);
			}
			else
			{
				tmpDamage = oDamage.arrDamageEffective[0] + oDamage.arrDamageEffective[1] + oDamage.arrDamageEffective[2] + oDamage.arrDamageEffective[3] + oDamage.arrDamageEffective[4] + oDamage.arrDamageEffective[5] + oDamage.arrDamageEffective[6] + oDamage.arrDamageEffective[7];
			};
			if(tmpDamage < 1)
			{
				tmpDamage = NPC_MINIMAL_DAMAGE;
			};

			concatText = ConcatStrings("Utržil jsi ",IntToString(tmpDamage));
			concatText = ConcatStrings(concatText," bodů zranění");
			AI_PrintClr(concatText,177,58,17);
			tmpDamage = 0;
		};
	};
	if(Npc_IsPlayer(pOther) && (Hlp_IsValidNpc(pSelf) == TRUE))
	{
		OthWeap = Npc_GetReadiedWeapon(pOther);

		if((OthWeap.flags & (ITEM_2HD_AXE | ITEM_SWD | ITEM_2HD_SWD)) == (OthWeap.flags & (ITEM_2HD_AXE | ITEM_SWD | ITEM_2HD_SWD)))
		{
			ptmpDamage = ptmpDamage + oDamage.arrDamageEffective[0] + oDamage.arrDamageEffective[1] + oDamage.arrDamageEffective[2] + oDamage.arrDamageEffective[3] + oDamage.arrDamageEffective[4] + oDamage.arrDamageEffective[5] + (oDamage.arrDamageEffective[6] / 10) + (oDamage.arrDamageEffective[7] / 10);
		}
		else
		{
			ptmpDamage = oDamage.arrDamageEffective[0] + oDamage.arrDamageEffective[1] + oDamage.arrDamageEffective[2] + oDamage.arrDamageEffective[3] + oDamage.arrDamageEffective[4] + oDamage.arrDamageEffective[5] + oDamage.arrDamageEffective[6] + oDamage.arrDamageEffective[7];
		};
		if(ptmpDamage < 1)
		{
			ptmpDamage = NPC_MINIMAL_DAMAGE;
		};

		GL_DAMAGE_PLAYER = ptmpDamage;
		ptmpDamage = FALSE;
	};
	if(Npc_IsPlayer(pSelf) && (hero.guild <= GIL_SEPERATOR_HUM) && (Hlp_IsValidNpc(pOther) == TRUE) && (HEROTRANS == FALSE) && (Mount_Up == FALSE))
	{
		PoisonChance = Hlp_Random(100);
		ranblood = Hlp_Random(100);

		lItem = Hlp_GetSlotItem(pSelf,"ZS_LEFTHAND");
		rItem = Hlp_GetSlotItem(pSelf,"ZS_RIGHTHAND");

		if(Hlp_IsValidItem(lItem) && (((lItem.mainflag & ITEM_KAT_POTIONS) == ITEM_KAT_POTIONS) || ((lItem.mainflag & ITEM_KAT_FOOD) == ITEM_KAT_FOOD)))
		{
			Ext_RemoveFromSlot(pSelf,"ZS_LEFTHAND");	
		};
		if(Npc_HasEquippedArmor(pSelf) == FALSE)
		{
			tmpExtDamage = (pSelf.attribute[ATR_HITPOINTS_MAX] * 25) / 100;
			Npc_ChangeAttribute(pSelf,ATR_HITPOINTS,-tmpExtDamage);

			if(PlayerIsBleeding == FALSE)
			{
				PlayerIsBleeding = TRUE;
				BleedingPower = 100;
			};
		};
		if((Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(Ilarah)) && (IlArahActTwo == TRUE) && (IlArahAllDemonsRage == FALSE))
		{
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-100000);
			IlArahAllDemonsRage = TRUE;
		};
		if((Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(Ilarah)) && (IlArahActFour == TRUE))
		{
			pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + 500;

			if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
			{
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
			};

			pSelf.attribute[ATR_HITPOINTS] = pSelf.attribute[ATR_HITPOINTS] - 500;
		};
		if((Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(Imarah)) && (ImarahHeals == TRUE))
		{
			pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + pSelf.attribute[ATR_HITPOINTS_MAX];

			if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
			{
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
			};

			pSelf.attribute[ATR_HITPOINTS] = pSelf.attribute[ATR_HITPOINTS] - (pSelf.attribute[ATR_HITPOINTS_MAX] / 4);
		};
		if(ranblood >= 75)
		{
			Wld_PlayEffect("SPELLFX_BLOODDEAD1",pSelf,pSelf,0,0,0,FALSE);
		};
		if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(VLK_5570_Avabul))
		{	
			Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",pSelf,pSelf,0,0,0,FALSE);
		};
		if(FlyCarpetIsOn == TRUE)
		{
			Ext_RemoveFromSlot(pSelf,"BIP01");	
			Npc_RemoveInvItems(pSelf,ItSe_FlyCarpet,Npc_HasItems(pSelf,ItSe_FlyCarpet));
			AI_Dodge(pSelf);
			Mdl_RemoveOverlayMds(pSelf,"fliegender_drache.mds");
			FlyCarpetIsOn = FALSE;
			CheckDismount = TRUE;
		};
		if((PalLightIsOn == TRUE) && (C_NpcIsUndead(pOther) == TRUE) && (pOther.flags != NPC_FLAG_IMMORTAL) && (pOther.flags != NPC_FLAG_GHOST) && (pOther.flags != NPC_FLAG_XARADRIM) && (pOther.flags != ORCTEMPLENPCFLAGS) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(XranFreg)))
		{
			if(pOther.attribute[ATR_HITPOINTS] > 50)
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",pOther,pOther,0,0,0,FALSE);
				B_MagicHurtNpc(pSelf,pOther,50);
			}
			else
			{
				pOther.protection[PROT_BLUNT] = TRUE;
				pOther.protection[PROT_EDGE] = TRUE;
				pOther.protection[PROT_POINT] = TRUE;
				pOther.protection[PROT_FIRE] = TRUE;
				pOther.protection[PROT_FLY] = TRUE;
				pOther.protection[PROT_MAGIC] = TRUE;
				pOther.flags = FALSE;
				B_MagicHurtNpc(pSelf,pOther,50);
			};
		};
		if(pOther.aivar[AIV_MM_REAL_ID] == ID_GHOST)
		{
			ranscream = Hlp_Random(10);
			
			if(ranscream < 5)
			{
				Snd_Play("MFX_DESTROYUNDEAD_CAST");
			};
		};
		if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(DarkZhnez)) 
		{
			pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + pOther.attribute[ATR_STRENGTH];

			if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
			{
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
			};
		};
		if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(XranFreg)) 
		{
			pSelf.attribute[ATR_HITPOINTS] = pSelf.attribute[ATR_HITPOINTS] - 500;
			pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + 500;

			if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
			{
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
			};
		};
		if((PlayerIsBleeding == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && ((pOther.guild == GIL_WOLF) || (pOther.aivar[AIV_MM_REAL_ID] == ID_DEMON) || (pOther.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) || (pOther.guild == GIL_LURKER) || (pOther.guild == GIL_SNAPPER) || (pOther.guild == GIL_SHADOWBEAST) || (pOther.guild == GIL_Alligator) || (pOther.guild == GIL_Gargoyle)))
		{
			if(pOther.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 90)
				{
					PlayerIsBleeding = TRUE;
					Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
					BleedingPower = pOther.attribute[ATR_STRENGTH] / 10;
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 45)
				{
					PlayerIsBleeding = TRUE;
					BleedingPower = pOther.attribute[ATR_STRENGTH] / 10;
					Wld_PlayEffect("SPELLFX_BLOODDEAD1",hero,hero,0,0,0,FALSE);
				};
			};
		};
		if((PlayerIsWeakness == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && ((pOther.guild == GIL_HARPY) || (pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (pOther.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)))
		{
			if(pOther.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 50)
				{
					if(hero.protection[PROT_FLY] < Hlp_Random(300))
					{
						PlayerIsWeakness = TRUE;
					};
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 25)
				{
					if(hero.protection[PROT_FLY] < Hlp_Random(150))
					{
						PlayerIsWeakness = TRUE;
					};
				};
			};
		};
		if((PlayerIsSick == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && ((pOther.guild == GIL_ZOMBIE) || (pOther.guild == GIL_Giant_Rat)))
		{
			if(pOther.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 50)
				{
					PlayerIsSick = TRUE;
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 25)
				{
					PlayerIsSick = TRUE;
				};
			};
		};
		if((PlayerIsCurse == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Ancient_Warrior_02)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(ZOMBIE_OM3)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(ZOMBIE_OM4)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(ZOMBIE_OM5)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Skeleton_Bow)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Troll_Black_AV)) && ((pOther.guild == GIL_DEMON) || (pOther.guild == GIL_DMT) || (pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) || (Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(Skeleton_Lord_Ginnok)) || (pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST) || (pOther.aivar[AIV_MM_REAL_ID] == ID_GHOST)))
		{
			if(pOther.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 70)
				{
					if(hero.protection[PROT_MAGIC] < Hlp_Random(500))
					{
						PlayerIsCurse = TRUE;
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					};
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 35)
				{
					if(hero.protection[PROT_MAGIC] < Hlp_Random(250))
					{
						PlayerIsCurse = TRUE;
						Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					};
				};
			};
		};
		if((PlayerIsIgnition == FALSE) && (SBMODE == TRUE) && (HEROTRANS == FALSE) && ((pOther.guild == GIL_FIREGOLEM) || (pOther.aivar[AIV_MM_REAL_ID] == ID_DEMON) || (pOther.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD) || (pOther.guild == GIL_DRAGON)))
		{
			if(pOther.aivar[90] == TRUE)
			{
				randy = Hlp_Random(100);
			
				if(randy <= 80)
				{
					if(hero.protection[PROT_FIRE] < Hlp_Random(300))
					{
						PlayerIsIgnition = TRUE;
						Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
					};
				};
			}
			else
			{
				randy = Hlp_Random(100);
			
				if(randy <= 40)
				{
					if(hero.protection[PROT_FIRE] < Hlp_Random(150))
					{
						PlayerIsIgnition = TRUE;
						Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
					};
				};
			};
		};
		if((pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD) && (pOther.aivar[90] == TRUE) && (ATR_STAMINA[0] > 0))
		{
			TempTougthness = hero.protection[PROT_FLY] / 10;

			if(TempTougthness < 50)
			{
				TempReduceStam = 50 - TempTougthness;

				if(ATR_STAMINA[0] > TempReduceStam)
				{
					ATR_STAMINA[0] -= TempReduceStam;
				}
				else
				{
					ATR_STAMINA[0] = 0;
				};
			};
		};
		if((pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (pOther.aivar[90] == TRUE) && (ATR_STAMINA[0] > 0))
		{
			TempTougthness = hero.protection[PROT_FLY] / 10;

			if(TempTougthness < 25)
			{
				TempReduceStam = 25 - TempTougthness;

				if(ATR_STAMINA[0] > TempReduceStam)
				{
					ATR_STAMINA[0] -= TempReduceStam;
				}
				else
				{
					ATR_STAMINA[0] = 0;
				};
			};
		};
		if((pOther.aivar[90] == FALSE) && (ATR_STAMINA[0] > 0) && ((pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_LORD)))
		{
			TempTougthness = hero.protection[PROT_FLY] / 10;

			if(TempTougthness < 10)
			{
				TempReduceStam = 10 - TempTougthness;

				if(ATR_STAMINA[0] > TempReduceStam)
				{
					ATR_STAMINA[0] -= TempReduceStam;
				}
				else
				{
					ATR_STAMINA[0] = 0;
				};
			};
		};
		if((pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST) && (pOther.aivar[90] == TRUE) && (hero.attribute[ATR_MANA] > 0)) 
		{
			TempReduceInt = ATR_INTELLECT / 10;
	
			if(TempReduceInt < 25)
			{
				TempDamMana = 25 - TempReduceInt;
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + (TempDamMana * 10);

				if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
				{
					pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
				};
				if(hero.attribute[ATR_MANA] > TempDamMana)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - TempDamMana;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			};
		};
		if((pOther.guild == GIL_DEMON) && (pOther.aivar[90] == TRUE) && (hero.attribute[ATR_MANA] > 0) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Troll_Black_AV)))
		{
			TempReduceInt = ATR_INTELLECT / 10;
	
			if(TempReduceInt < 50)
			{
				TempDamMana = 50 - TempReduceInt;
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + (TempDamMana * 10);

				if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
				{
					pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
				};
				if(hero.attribute[ATR_MANA] > TempDamMana)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - TempDamMana;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			};
		};
		if((pOther.aivar[90] == FALSE) && (hero.attribute[ATR_MANA] > 0) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Gobbo_Gazcul)) && (Hlp_GetInstanceID(pOther) != Hlp_GetInstanceID(Troll_Black_AV)) && ((pOther.guild == GIL_DEMON) || (pOther.aivar[AIV_MM_REAL_ID] == ID_SKELETON_PRIEST)))
		{
			TempReduceInt = ATR_INTELLECT / 10;
	
			if(TempReduceInt < 10)
			{
				TempDamMana = 10 - TempReduceInt;
				pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS] + (TempDamMana * 10);

				if(pOther.attribute[ATR_HITPOINTS] > pOther.attribute[ATR_HITPOINTS_MAX])
				{
					pOther.attribute[ATR_HITPOINTS] = pOther.attribute[ATR_HITPOINTS_MAX];
				};
				if(hero.attribute[ATR_MANA] > TempDamMana)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - TempDamMana;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			};
		};
		if(pOther.aivar[90] == TRUE)
		{
			if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(PaleCrawler))
			{
				if(ResistPoisonKnow == FALSE)
				{
					POISONED = TRUE;
					LastHeroHit = FALSE;
					Wld_PlayEffect("SPELLFX_BLOODDEAD3",hero,hero,0,0,0,FALSE);
				}
				else
				{
					if((PoisonChance < 25) || (PoisonChance > 75))
					{
						POISONED = TRUE;
						LastHeroHit = FALSE;
						Wld_PlayEffect("SPELLFX_BLOODDEAD3",hero,hero,0,0,0,FALSE);
					};
				};
			}
			else if((ResistPoisonKnow == FALSE) && (Npc_GetDistToNpc(pOther,pSelf) < 650) && (Mount_Up == FALSE) && (POISONED == FALSE) && ((pOther.vars[1] == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Right) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Npc_Right) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Hero) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Known) == TRUE)))
			{
				POISONED = TRUE;
				LastHeroHit = FALSE;
				Wld_PlayEffect("SPELLFX_BLOODDEAD3",hero,hero,0,0,0,FALSE);
			};
		}
		else if((ResistPoisonKnow == FALSE) && (pSelf.protection[PROT_POINT] >= PoisonChance) && (Npc_GetDistToNpc(pOther,pSelf) < 650) && (Mount_Up == FALSE) && (POISONED == FALSE) && ((pOther.vars[1] == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Right) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Npc_Right) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Hero) == TRUE) || (Hlp_IsItem(pItem,ItMw_1H_AssBlade_Known) == TRUE)))
		{
			POISONED = TRUE;
			LastHeroHit = FALSE;
			Wld_PlayEffect("SPELLFX_BLOODDEAD3",hero,hero,0,0,0,FALSE);
		};
		if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(PaleCrawler_Minion))
		{
			Npc_ChangeAttribute(pOther,ATR_HITPOINTS,-pOther.attribute[ATR_HITPOINTS_MAX]);
		};
		if(Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(SkeletonMage_Azgolor)) 
		{
			if(IhiyalRegen == FALSE)
			{
				if(hero.attribute[ATR_MANA] > 1)
				{
					Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",hero,hero,0,0,0,FALSE);
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] / 2;
					IhiyalRegen = FALSE;
				}
				else
				{
					if(pOther.attribute[ATR_HITPOINTS] < pOther.attribute[ATR_HITPOINTS_MAX])
					{
						IhiyalRegen = TRUE;
					}
					else
					{
						IhiyalRegen = FALSE;
					};
				};
			};
		};
		if((Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(BDT_1090_Addon_Raven)) || (Hlp_GetInstanceID(pOther) == Hlp_GetInstanceID(BDT_2090_Addon_Raven)))
		{
			if(ATR_INTELLECT < 100)
			{
				if(RavenBlitz <= 0)
				{
					RavenDamage = 100 - ATR_INTELLECT;
					Wld_PlayEffect("spellFX_BELIARSRAGE",pSelf,pSelf,0,0,0,FALSE);
					Npc_ChangeAttribute(pSelf,ATR_HITPOINTS,-RavenDamage);
					RavenBlitz += 1;
				}
				else if(RavenBlitz >= 3)
				{
					RavenRandy = Hlp_Random(100);

					if(RavenRandy <= 50)
					{
						RavenBlitz = 0;
					};
				}
				else
				{
					RavenBlitz += 1;
				};
			};
		};
		if((DefStrafeIsOn == TRUE) && (Hlp_IsValidItem(pItem) == TRUE))
		{
			RandParrySnd = Hlp_Random(10);
		
			if(RandParrySnd == 0)
			{
				Snd_Play("CS_IAI_ME_ME_A1");
			}
			else if(RandParrySnd == 1)
			{
				Snd_Play("CS_IAI_ME_ME_A2");
			}	
			else if(RandParrySnd == 3)
			{
				Snd_Play("CS_IAI_ME_ME_A3");
			}	
			else if(RandParrySnd == 5)
			{
				Snd_Play("CS_IAI_ME_ME_A4");
			}	
			else if(RandParrySnd == 7)
			{
				Snd_Play("CS_IAI_ME_ME_A5");
			}	
			else if(RandParrySnd == 9)
			{
				Snd_Play("CS_IAI_ME_ME_A6");
			};
		};
	};
};
