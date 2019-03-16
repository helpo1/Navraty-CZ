var int bonushw;
var int bonusrw;

var int Bow_FEquip_01;
var int Bow_FEquip_02;
var int Bow_FEquip_03;
var int Bow_FEquip_04;
var int Bow_FEquip_05;
var int Bow_FEquip_06;
var int Bow_FEquip_07;
var int Bow_FEquip_08;
var int Bow_FEquip_09;
var int CBow_FEquip_01;
var int Sword_FEquip_01;

func void B_InitMunition()
{
	var C_Item weapon;

	if(Npc_HasEquippedRangedWeapon(hero) == TRUE)
	{
		weapon = Npc_GetEquippedRangedWeapon(hero);

		if((Hlp_IsItem(weapon,ITRW_SHADOWBOW) != TRUE) && ((weapon.flags & ITEM_BOW) == ITEM_BOW))
		{
			if(Use_PoisonArrow == TRUE)
			{
				weapon.munition = ItRw_PoisonArrow;
				Use_Arrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				Print("Vybaveno otrávenými šípy...");
			}
			else if(Use_Arrow == TRUE)
			{
				weapon.munition = ItRw_Arrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				Print("Vybaveno obyčejnými šípy...");
			}
			else if(Use_FireArrow == TRUE)
			{
				weapon.munition = ItRw_Addon_FireArrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_Arrow = FALSE;
				Use_MagicArrow = FALSE;
				Print("Vybaveno ohnivými šípy...");
			}
			else if(Use_MagicArrow == TRUE)
			{
				weapon.munition = ItRw_Addon_MagicArrow;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_Arrow = FALSE;
				Use_FireArrow = FALSE;
				Print("Vybaveno magickými šípy...");
			}
			else if(Use_HolyArrow == TRUE)
			{
				weapon.munition = ItRw_HolyArrow;
				Use_PoisonArrow = FALSE;
				Use_MagicArrow = FALSE;
				Use_Arrow = FALSE;
				Use_FireArrow = FALSE;
				Print("Vybaveno posvěcenými šípy...");
			}
			else
			{
				weapon.munition = ItRw_Arrow;
				Use_Arrow = TRUE;
				Use_PoisonArrow = FALSE;
				Use_HolyArrow = FALSE;
				Use_FireArrow = FALSE;
				Use_MagicArrow = FALSE;
				Print("Vybaveno obyčejnými šípy...");
			};
		};
		if((Hlp_IsItem(weapon,ITRW_ADDON_MAGICCROSSBOW_SHV) != TRUE) && ((weapon.flags & ITEM_CROSSBOW) == ITEM_CROSSBOW))
		{
			if(Use_Bolt == TRUE)
			{
				weapon.munition = ItRw_Bolt;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = FALSE;
				Print("Vybaveno obyčejnými šipkami...");
			}
			else if(Use_MagicBolt == TRUE)
			{
				weapon.munition = ItRw_Addon_MagicBolt;
				Use_Bolt = FALSE;
				Use_HolyBolt = FALSE;
				Print("Vybaveno magickými šipkami...");
			}
			else if(Use_HolyBolt == TRUE)
			{
				weapon.munition = ItRw_HolyBolt;
				Use_Bolt = FALSE;
				Use_MagicBolt = FALSE;
				Print("Vybaveno posvěcenými šipkami...");
			}
			else
			{
				weapon.munition = ItRw_Bolt;
				Use_Bolt = TRUE;
				Use_MagicBolt = FALSE;
				Use_HolyBolt = FALSE;
				Print("Vybaveno obyčejnými šipkami...");
			};
		};
	};
};

//------------------------odnoruchnoye oruzhiye-----------------------------

func void equip_1h_light()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_light()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_light_dex()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 1;

			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_1h_light_dex()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_1h_medium()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_medium()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_medium_dex()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void equip_1h_blackheart()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_blackheart()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_GoldBrand()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_GoldBrand()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_heavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_heavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_heavy_ginnok()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_heavy_ginnok()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_heavy_slayer()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;
		OrcBanish = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_heavy_slayer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		OrcBanish = FALSE;
	};
};

func void equip_1h_heavy_dex()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void equip_1h_veryheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 6;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_veryheavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_superheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 7;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_superheavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_simpleblack()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 5;
		SIMPLEBLACK_1H_ONME = TRUE;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_simpleblack()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		SIMPLEBLACK_1H_ONME = FALSE;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_xaradrim()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		if(BEHARADRIM == TRUE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
			Snd_Play("SFX_HealObsession");
			MELEEWEAPONINDEX = 5;
			EquipedIndex_1H = TRUE;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					if(hero.attribute[ATR_REGENERATEMANA] >= 90)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
					};
				};
			};
		}
		else if(HEROTRANS == 0)
		{
			AI_Wait(hero,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_1h_xaradrim()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_blessed_1h()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		if((self.guild != GIL_PAL) && (HEROTRANS == 0))
		{
			AI_Wait(self,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		}
		else
		{
			MELEEWEAPONINDEX = 4;
			EquipedIndex_1H = TRUE;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
					Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					if(hero.attribute[ATR_REGENERATEMANA] >= 90)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
					}
					else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
					{
						Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
					};
				};
			};
		};
	};
};

func void unequip_blessed_1h()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_medium_pir()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_medium_pir()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void Equip_1H_02()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_02);
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void UnEquip_1H_02()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_02);
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};


func void Equip_1H_04()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_04);
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void UnEquip_1H_04()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_04);
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

//------------------------dvuruchnoye oruzhiye-----------------------------

func void equip_2h_light_axe()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 1;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_light_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
			AXE_ST2 = FALSE;
		};

		AXE_STON = FALSE;
	};
};

func void equip_2h_medium_axe()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 2;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_medium_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = FALSE;
	};
};

func void equip_2h_medium_axe_epic()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 2;
		GoblinKing = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_medium_axe_epic()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
		GoblinKing = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = FALSE;
	};
};

func void equip_2h_heavy_axe()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 5;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 3;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_heavy_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = FALSE;
	};
};

func void equip_2h_veryheavy_axe()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 8;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 4;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");

		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_veryheavy_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;
		EquipedIndex_2H = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");

		};

		AXE_STON = FALSE;
	};
};

func void equip_2h_superheavy_axe()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 9;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 5;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_2h_superheavy_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");

		};

		AXE_STON = FALSE;
	};
};

func void equip_ulumulu()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(ULUMULUISEQUIP_NO != TRUE)
		{	
			ULUMULUISEQUIP = TRUE;
		};

		MELEEWEAPONINDEX = 4;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_ulumulu()
{
	if(self.id == 0)
	{
		ULUMULUISEQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = FALSE;
	};
};

//-------------------------------------Mechi0---------------------------------

func void equip_2h_light()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 1;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_light()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_medium()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 2;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_medium()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_medium_speer()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_2H = TRUE;

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		};

		if(LowHealth == TRUE)
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};

			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
			{
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
			};
		};

		AIV_Speer = TRUE;
		B_CheckAcroAni(hero);
	};
};

func void unequip_2h_medium_speer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Speer = FALSE;
	};
};

func void equip_2h_heavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 5;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 3;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_heavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_heavy_speer()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		};

		if(LowHealth == TRUE)
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};

			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
			{
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
			};
		};

		AIV_Speer = TRUE;
		B_CheckAcroAni(hero);
	};
};


func void unequip_2h_heavy_speer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Speer = FALSE;
	};
};

func void equip_2h_veryheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 8;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 4;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_veryheavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		BONUSHW = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_superheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 9;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 5;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_superheavy()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_superheavy_drach()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		Wld_PlayEffect("SPELLFX_FEAR_WINGS",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_WINGS2",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SPELLFX_FEAR_GROUND",self,self,0,0,0,FALSE);

		MELEEWEAPONINDEX = 9;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 7;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void equip_2h_simpleblack()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 5;
		SIMPLEBLACK_2H_ONME = TRUE;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 3;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void unequip_2h_simpleblack()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		SIMPLEBLACK_2H_ONME = FALSE;
		EquipedIndex_2H = FALSE;
	};
};

func void Equip_2H_04()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		B_AddFightSkill(self,NPC_TALENT_2H,Waffenbonus_04);
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 3;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
	};
};

func void UnEquip_2H_04()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_2H,-Waffenbonus_04);
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_xaradrim()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		if(BEHARADRIM == TRUE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
			Snd_Play("SFX_HealObsession");
			MELEEWEAPONINDEX = 6;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 5;


			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};
		}
		else if(HEROTRANS == 0)
		{
			AI_Wait(hero,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_2h_xaradrim()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_blessed_2h()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		if((self.guild != GIL_PAL) && (HEROTRANS == 0))
		{
			AI_Wait(self,3);
			AI_PlayAni(self,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			B_Say(self,self,"$Dead");
			AI_StopFX(self,"VOB_MAGICBURN");
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(self,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		}
		else
		{
			MELEEWEAPONINDEX = 5;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 4;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};
		};
	};
};

func void unequip_blessed_2h()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

//----------------------------------oruzhiye na lovkost'-------------------------------------------

func void equip_1h_light_AssBlade()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_1h_light_AssBlade()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_chiefweapon_01()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 1;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_02);
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_01()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_02);
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_chiefweapon_02()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 2;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_03);
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_02()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_03);
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_chiefweapon_03()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 3;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_04);
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_03()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_04);
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_chiefweapon_04()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 4;
			B_AddFightSkill(self,NPC_TALENT_1H,Waffenbonus_05);
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_04()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		B_AddFightSkill(self,NPC_TALENT_1H,-Waffenbonus_05);
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_chiefweapon_05()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 5;
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_05()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};


func void equip_chiefweapon_scorpion()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 1;
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_chiefweapon_scorpion()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.MDS");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};


//----------------------------------------oruzhiye orkov---------------------------------------------------


func void equip_2h_heavy_orc()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 4;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 3;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			EquipedIndex_2H = FALSE;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};


func void unequip_2h_heavy_orc()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

func void equip_2h_heavy_orc_b1()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 4;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 3;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			EquipedIndex_2H = FALSE;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};


func void unequip_2h_heavy_orc_b1()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

func void equip_2h_heavy_orc_b2()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 4;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 3;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			EquipedIndex_2H = FALSE;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};


func void unequip_2h_heavy_orc_b2()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

func void equip_2h_veryheavy_orc()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 6;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 4;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			EquipedIndex_2H = FALSE;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};

func void unequip_2h_veryheavy_orc()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

func void equip_2h_veryheavy_orc_b1()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 7;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 4;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			EquipedIndex_2H = FALSE;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};

func void unequip_2h_veryheavy_orc_b1()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};
func void equip_2h_veryheavy_orc_b2()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 8;
		EquipedIndex_2H = TRUE;
		CrushIndex_2H = 4;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};
		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		};
	};
};

func void unequip_2h_veryheavy_orc_b2()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};
	};
};

func void equip_stab_orc_l()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_02");
			ATR_INTELLECT += BONUSMANA_STABS_ORC_L;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			MELEEWEAPONINDEX = 3;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};

func void unequip_stab_orc_l()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			ATR_INTELLECT -= BONUSMANA_STABS_ORC_L;

			if(ATR_INTELLECT < 1)
			{
				ATR_INTELLECT = 1;
			};
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

func void equip_stab_orc_h()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			ATR_INTELLECT += BONUSMANA_STABS_ORC_H;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			Snd_Play3d(hero,"EQUIP_WEAPON_02");
			MELEEWEAPONINDEX = 4;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};

			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				//Mdl_ApplyOverlayMds(hero,"Humans_O2Hl2.MDS");
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			};

			AIV_OrcWeaponEquip = TRUE;
		}
		else
		{
			MELEEWEAPONINDEX = 0;
			AI_UnequipWeapons(hero);
			B_Say(hero,hero,"$TOOHEAVYFORME");
			AIV_OrcWeaponEquip = FALSE;
		};
	};
};

func void unequip_stab_orc_h()
{
	if(self.id == 0)
	{
		if(OFStyle == TRUE)
		{
			ATR_INTELLECT -= BONUSMANA_STABS_ORC_H;

			if(ATR_INTELLECT < 1)
			{
				ATR_INTELLECT = 1;
			};
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			if(hero.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_1hST1.mds");
			};

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_O2Hl2.MDS");
			Mdl_RemoveOverlayMds(hero,"Humans_O2Hl2.MDS");
		};

		AIV_OrcWeaponEquip = FALSE;
	};
};

//------------------------------------------posokhi--------------------------------------------------

func void equip_zauberstab_kdf()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDF)
		{
			ATR_INTELLECT += BONUSMANA_STABS_KDF;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_KDF_EQUIP = TRUE;
			MELEEWEAPONINDEX = 2;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");	
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_06 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_KDF_EQUIP = FALSE;
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_kdf()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_KDF;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_KDF_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_06 = FALSE;
	};
};

func void equip_stab_kdf()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDF)
		{
			ATR_INTELLECT += BONUSMANA_STAB_KDF;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			MELEEWEAPONINDEX = 1;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");	
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_01 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_stab_kdf()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STAB_KDF;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_01 = FALSE;
	};
};

func void equip_zauberstab_kdw()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDW)
		{
			ATR_INTELLECT += BONUSMANA_STABS_KDW;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_KDW_EQUIP = TRUE;
			MELEEWEAPONINDEX = 2;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafw.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_07 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_KDW_EQUIP = FALSE;
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_kdw()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_KDW;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_KDW_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_07 = FALSE;
	};
};

func void equip_stab_kdw()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDW)
		{
			ATR_INTELLECT += BONUSMANA_STAB_KDW;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			MELEEWEAPONINDEX = 1;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafw.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_02 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_stab_kdw()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STAB_KDW;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_02 = FALSE;
	};
};

func void equip_zauberstab_kdm()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDM)
		{
			ATR_INTELLECT += BONUSMANA_STABS_KDM;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_KDM_EQUIP = TRUE;
			MELEEWEAPONINDEX = 2;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafd.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_08 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_KDM_EQUIP = FALSE;
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_kdm()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_KDM;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_KDM_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_08 = FALSE;
	};
};

func void equip_stab_kdm()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_KDM)
		{
			ATR_INTELLECT += BONUSMANA_STAB_KDM;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			MELEEWEAPONINDEX = 1;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafd.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_03 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_stab_kdm()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STAB_KDM;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_03 = FALSE;
	};
};

func void equip_zauberstab_gur()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_GUR)
		{
			ATR_INTELLECT += BONUSMANA_STABS_GUR;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_GUR_EQUIP = TRUE;
			MELEEWEAPONINDEX = 2;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafg.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_09 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_GUR_EQUIP = FALSE;
			Wld_PlayEffect("SPELLFX_MASTEROFDISASTER_COLLIDE",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_gur()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_GUR;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_GUR_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_09 = FALSE;
	};
};

func void equip_stab_gur()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if(self.guild == GIL_GUR)
		{
			ATR_INTELLECT += BONUSMANA_STAB_GUR;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			MELEEWEAPONINDEX = 1;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafg.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_04 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			Wld_PlayEffect("SPELLFX_MASTEROFDISASTER_COLLIDE",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_stab_gur()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STAB_GUR;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_04 = FALSE;
	};
};

func void equip_zauberstab_dragon()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR))
		{
			ATR_INTELLECT += BONUSMANA_STABS_DRAGON;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_DEMON_EQUIP = TRUE;
			MELEEWEAPONINDEX = 3;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_10 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_DEMON_EQUIP = FALSE;
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_dragon()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_DRAGON;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_DEMON_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_10 = FALSE;
	};
};

func void equip_zauberstab_demon()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR))
		{
			ATR_INTELLECT += BONUSMANA_STABS_DEMON;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_DEMON_EQUIP = TRUE;
			MELEEWEAPONINDEX = 3;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafdemon.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_05 = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_DEMON_EQUIP = FALSE;
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_demon()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_DEMON;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_DEMON_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_05 = FALSE;
	};
};

func void equip_zauberstab_blood()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");

		if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR))
		{
			ATR_INTELLECT += BONUSMANA_STABS_BLOOD;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			ZAUBERSTAB_BLOOD_EQUIP = TRUE;
			MELEEWEAPONINDEX = 4;

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
			};

			if(LowHealth == TRUE)
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
				};

				//Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				//Mdl_ApplyOverlayMds(hero,"PRE_Humans_Stafx.MDS");
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
			}
			else
			{
				if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};

				//Mdl_ApplyOverlayMds(hero,"Humans_Stafdemon.MDS");
				Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
				Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

				if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
				{
					Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
				}
				else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
				};
			};

			AIV_Staff_Blood = TRUE;
		}
		else if(HEROTRANS == 0)
		{
			ZAUBERSTAB_BLOOD_EQUIP = FALSE;
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_zauberstab_blood()
{
	if(self.id == 0)
	{
		ATR_INTELLECT -= BONUSMANA_STABS_BLOOD;

		if(ATR_INTELLECT < 1)
		{
			ATR_INTELLECT = 1;
		};

		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		ZAUBERSTAB_BLOOD_EQUIP = FALSE;
		MELEEWEAPONINDEX = 0;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Staff_Blood = FALSE;
	};
};

func void equip_zauberstab_npc()
{
	if(self.id == 0)
	{
		B_Say(hero,hero,"$Dead");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		MELEEWEAPONINDEX = 0;
	};
};

func void unequip_zauberstab_npc()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

//------------------------------------------imennoye--------------------------------------------------

func void equip_itmw_gorn_axt()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 6;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_itmw_gorn_axt()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = FALSE;
	};
};

func void equip_itmw_lee_axt()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 6;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_itmw_lee_axt()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = FALSE;
	};
};

func void equip_itmw_kord_axt()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_itmw_kord_axt()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_itmw_lares_axt()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_itmw_lares_axt()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_itmw_torlof_axt()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 5;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};
		};

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.MDS");
			AXE_ST3 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.MDS");
			AXE_ST2 = TRUE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.MDS");
		};

		AXE_STON = TRUE;
	};
};

func void unequip_itmw_torlof_axt()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;

		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
		Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			AXE_ST3 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			AXE_ST2 = FALSE;
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
		};

		AXE_STON = FALSE;
	};
};

func void equip_itmw_sentenca_sword()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_itmw_sentenca_sword()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_itmw_wolf_waffer()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_itmw_wolf_waffer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_itmw_lester_sword()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void unequip_itmw_lester_sword()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_blessed_1h_venzel()
{
	if(self.id == 0)
	{
		AI_Wait(self,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_itmw_abigeilspage()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_6136_abigeil))
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		Snd_Play("SFX_HealObsession");
		B_AddFightSkill(self,NPC_TALENT_1H,ABIGELBONUSSTAGE);
		MELEEWEAPONINDEX = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	}
	else
	{
		AI_Wait(self,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void unequip_itmw_abigeilspage()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_6136_abigeil))
	{
		Snd_Play("SFX_HealObsession");
		B_AddFightSkill(self,NPC_TALENT_1H,-ABIGELBONUSSTAGE);
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	}
	else
	{
		AI_Wait(self,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		B_Say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};
};

func void Equip_Meisterdegen()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 2;
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void UnEquip_Meisterdegen()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void equip_itmw_diego_degen()
{
	if(self.id == 0)
	{
		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			B_Say(self,self,"$DONTWORK");
			AI_UnequipWeapons(self);
		}
		else
		{
			Snd_Play3d(hero,"EQUIP_WEAPON_01");
			MELEEWEAPONINDEX = 3;
			Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
			Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

			if(self.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
			}
			else if(self.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
			}
			else
			{
				Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
			};

			EquipedIndex_Chief = TRUE;
			EquipedIndex_1H = TRUE;
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

		if(self.HitChance[NPC_TALENT_1H] >= 90)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST3.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 60)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST2.mds");
		}
		else if(self.HitChance[NPC_TALENT_1H] >= 30)
		{
			Mdl_ApplyOverlayMds(self,"Humans_Rapier_ST1.mds");
		}
		else
		{
			Mdl_ApplyOverlayMds(self,"Humans_Pirate.mds");
		};
	};
};

func void unequip_itmw_diego_degen()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
		EquipedIndex_Chief = FALSE;
		Ani_EquipedIndex_Chief = TRUE;
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		B_CheckFightAni1H(self);
	}
	else
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	};
};

func void Equip_Betty()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_01");
		MELEEWEAPONINDEX = 3;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};
	};
};

func void UnEquip_Betty()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

//-------------------------------------proklyatoye-----------------------------------------

func void equip_2h_heavydam()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_heavydam()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_2h_heavydam_axe()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_AXEST2.MDS");
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_heavydam_axe()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_1h_heavydam()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_1h_heavydam()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_heavydam_elite()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};
	if(self.id != 0)
	{
		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
		Mdl_ApplyOverlayMds(self,"humans_1hST3.mds");
	};
};

func void unequip_1h_heavydam_elite()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_1h_ghost()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_GHOST)
		{
			Mdl_RemoveOverlayMds(self,"humans_1hST3.mds");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
			Mdl_ApplyOverlayMds(self,"humans_1h_fly.mds");
		};
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");

};

func void unequip_1h_ghost()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;
	};
};

func void equip_bow_heavy_dam()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		RANGEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_bow_heavy_dam()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
	};
};

func void equip_crossbow_light_dam()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		RANGEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_crossbow_light_dam()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
	};
};

func void equip_2h_lightdam()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_2h_lightdam_speer()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam_speer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_2h_lightdam_elitespeer()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam_elitespeer()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_holypalsword()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;

		if((NETBEKLEADME_STEP1DONE == FALSE) && (HEROTRANS == 0))
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void equip_2h_lightdam_staff()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam_staff()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_2h_lightdam_elitestaff()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam_elitestaff()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

func void equip_2h_lightdam_oberstaff()
{
	if((self.id == 0) && (HEROTRANS == 0))
	{
		AI_PlayAni(hero,"S_FIRE_VICTIM");
		Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
		B_Say(hero,hero,"$Dead");
		AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(hero,"S_FIRE_VICTIM");
		MELEEWEAPONINDEX = 0;
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	};

	Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
	Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
};

func void unequip_2h_lightdam_oberstaff()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
	};
};

//------------------------bozhestvennoye oruzhiye-----------------------------

func void equip_blessedblack_magic()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BLESSED_WEAPON");
		MELEEWEAPONINDEX = 1;
		BONUSHW = 2;
		EquipedIndex_1H = TRUE;

		if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
		{
			if(LowHealth == TRUE)
			{
				Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
				Mdl_ApplyOverlayMds(hero,"PRE_Hum_Shield2.MDS");
			}
			else
			{
				if(hero.attribute[ATR_REGENERATEMANA] >= 90)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST4.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 60)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST3.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 30)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST2.MDS");
				}
				else if(hero.attribute[ATR_REGENERATEMANA] >= 1)
				{
					Mdl_ApplyOverlayMds(hero,"Shield_ST1.MDS");
				};
			};
		};

		if((NETBEKLEADME_STEP1DONE == FALSE) && (HEROTRANS == 0))
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void unequip_blessedblack_magic()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_1H = FALSE;

		if((NETBEKLEADME_STEP1DONE == FALSE) && (HEROTRANS == 0))
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

func void equip_blessedblack_magic_2h()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"BLESSED_WEAPON");
		if((NETBEKLEADME_STEP1DONE == FALSE) && (HEROTRANS == 0))
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		}
		else
		{
			MELEEWEAPONINDEX = 2;
			EquipedIndex_2H = TRUE;
			CrushIndex_2H = 6;

			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				if(LowHealth == TRUE)
				{
					Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");
				}
				else
				{
					Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
					Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");
					Mdl_RemoveOverlayMds(hero,"Shield.MDS");
				};
			};
		};
	};
};

func void unequip_blessedblack_magic_2h()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if((NETBEKLEADME_STEP1DONE == FALSE) && (HEROTRANS == 0))
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"VOB_MAGICBURN");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};
	};
};

//---------------------------------------------------------------------------------------------------------
//-----------------------------------------------------luki i arbalety-------------------------------------
//---------------------------------------------------------------------------------------------------------

func void equip_bow_craft_01()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		B_AddFightSkill(self,NPC_TALENT_BOW,1);
		RANGEWEAPONINDEX = 1;
		B_InitMunition();
	
		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_01,Npc_HasItems(hero,ItSl_BackArrowSack_01));
	};
};

func void unequip_bow_craft_01()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-1);
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_craft_02()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		B_AddFightSkill(self,NPC_TALENT_BOW,2);
		RANGEWEAPONINDEX = 1;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_01 = TRUE;
		};


		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_01,Npc_HasItems(hero,ItSl_BackArrowSack_01));
	};
};

func void unequip_bow_craft_02()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-2);
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_craft_03()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		B_AddFightSkill(self,NPC_TALENT_BOW,3);
		RANGEWEAPONINDEX = 2;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_01,Npc_HasItems(hero,ItSl_BackArrowSack_01));
	};
};

func void unequip_bow_craft_03()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-3);
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_craft_04()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		B_AddFightSkill(self,NPC_TALENT_BOW,4);
		RANGEWEAPONINDEX = 2;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_01,Npc_HasItems(hero,ItSl_BackArrowSack_01));
	};
};

func void unequip_bow_craft_04()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-4);
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_craft_05()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		B_AddFightSkill(self,NPC_TALENT_BOW,5);
		RANGEWEAPONINDEX = 3;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_01,Npc_HasItems(hero,ItSl_BackArrowSack_01));
	};
};

func void unequip_bow_craft_05()
{
	if(self.id == 0)
	{
		B_AddFightSkill(self,NPC_TALENT_BOW,-5);
		RANGEWEAPONINDEX = 0;
		B_InitMunition();
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_light()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 1;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_02 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_09);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_02 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_09);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_09,Npc_HasItems(hero,ItSl_BackArrowSack_09));
	};
};

func void equip_bow_medium()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 3;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_03 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_04);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_03 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_04);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_04,Npc_HasItems(hero,ItSl_BackArrowSack_04));
	};
};

func void equip_bow_heavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 5;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_04 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_02);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_04 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_02);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_02,Npc_HasItems(hero,ItSl_BackArrowSack_02));
	};
};

func void equip_bow_veryheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 7;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_05 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_07);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_05 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_07);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_07,Npc_HasItems(hero,ItSl_BackArrowSack_07));
	};
};

func void unequip_bow_light()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void unequip_bow_medium()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void unequip_bow_heavy()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void unequip_bow_veryheavy()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_crossbow_light()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 2;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void equip_crossbow_medium()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 4;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void equip_crossbow_heavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 6;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void equip_crossbow_veryheavy()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void equip_crossbow_shv()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();
		Use_ShvBolt = TRUE;

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_light()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void unequip_crossbow_medium()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void unequip_crossbow_heavy()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void unequip_crossbow_veryheavy()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void unequip_crossbow_shv()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 SPINE");
		Use_ShvBolt = FALSE;
	};
};

func void equip_bow_medium_uniq()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 3;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_06 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_06 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_05,Npc_HasItems(hero,ItSl_BackArrowSack_05));
	};
};

func void unequip_bow_medium_uniq()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_heavy_uniq()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 5;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_06 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_06 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_05,Npc_HasItems(hero,ItSl_BackArrowSack_05));
	};
};

func void unequip_bow_heavy_uniq()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_bones()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 5;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_04 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_02);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_04 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_02);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_02,Npc_HasItems(hero,ItSl_BackArrowSack_02));
	};
};

func void unequip_bow_bones()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_keren()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 5;
		B_InitMunition();
		Use_OreArrow = TRUE;

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_07 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_06);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_07 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_06);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_06,Npc_HasItems(hero,ItSl_BackArrowSack_06));
	};
};

func void unequip_bow_keren()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
		Use_OreArrow = FALSE;
	};
};

func void equip_holybow()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 7;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_08 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_08);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_08 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_08);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_08,Npc_HasItems(hero,ItSl_BackArrowSack_08));
	};
};

func void unequip_holybow()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_demon()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 7;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_09 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_09 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_10,Npc_HasItems(hero,ItSl_BackArrowSack_10));
	};
};

func void unequip_bow_demon()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_bow_chaos()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 7;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_09 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_09 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_10,Npc_HasItems(hero,ItSl_BackArrowSack_10));
		InsanePower = TRUE;

		if(SleeperStone == FALSE)
		{
			B_Say(hero,hero,"$AARGH_1");
			AI_PlayAni(hero,"T_INSANE");
			//Wld_PlayEffect("INSANE_FX",hero,hero,0,0,0,FALSE);
		};
	};
};

func void unequip_bow_chaos()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
		Wld_StopEffect("INSANE_FX");
		InsanePower = FALSE;
	};
};

func void equip_crossbow_veryheavy_dr1()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_veryheavy_dr1()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void equip_crossbow_veryheavy_dr2()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_veryheavy_dr2()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void equip_crossbow_veryheavy_dr3()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_veryheavy_dr3()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void equip_crossbow_veryheavy_dr4()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_veryheavy_dr4()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void equip_crossbow_veryheavy_dr5()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 8;
		B_InitMunition();

		if(SlotSpineIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 SPINE");
			SlotSpineIsActive = TRUE;
		};
		if(CBow_FEquip_01 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 SPINE",ItSl_BackBoltSack_01);
			Ext_RemoveFromSlot(self,"BIP01 SPINE");
			Bow_FEquip_01 = TRUE;
		};

		Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
		Npc_RemoveInvItems(hero,ItSl_BackBoltSack_01,Npc_HasItems(hero,ItSl_BackBoltSack_01));
	};
};

func void unequip_crossbow_veryheavy_dr5()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Str < 0)
		{
			Delta_Bonus_Str = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 SPINE");
	};
};

func void equip_bow_heavy_uniq_ham()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 5;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_06 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_06 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_05);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_05,Npc_HasItems(hero,ItSl_BackArrowSack_05));
	};
};

func void unequip_bow_heavy_uniq_ham()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;

		if(Delta_Bonus_Dex < 0)
		{
			Delta_Bonus_Dex = 0;
		};

		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_2h_heavy_speer_chaos()
{
	if(self.id == 0)
	{
		if(HEROTRANS == 0)
		{
			AI_PlayAni(hero,"S_FIRE_VICTIM");
			Wld_PlayEffect("SPELLFX_MAGIC_SMOKE",hero,hero,0,0,0,FALSE);
			B_Say(hero,hero,"$Dead");
			AI_StopFX(hero,"SPELLFX_MAGIC_SMOKE");
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
			Npc_StopAni(hero,"S_FIRE_VICTIM");
			MELEEWEAPONINDEX = 0;
		};

		Mdl_RemoveOverlayMds(self,"Humans_Pirate.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST3.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST2.mds");
		Mdl_RemoveOverlayMds(self,"Humans_Rapier_ST1.mds");
	}
	else
	{
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");
	};
};


func void unequip_2h_heavy_speer_chaos()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;
	};
};

func void equip_bow_blood()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		RANGEWEAPONINDEX = 7;
		B_InitMunition();

		if(SlotClavicleIsActive == FALSE)
		{
			ActivateZSSlot(self,"BIP01 R CLAVICLE");
			SlotClavicleIsActive = TRUE;
		};
		if(Bow_FEquip_09 == FALSE)
		{
			Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
			Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
			Bow_FEquip_09 = TRUE;
		};

		Ext_PutInSlot(hero,"BIP01 R CLAVICLE",ItSl_BackArrowSack_10);
		Npc_RemoveInvItems(hero,ItSl_BackArrowSack_10,Npc_HasItems(hero,ItSl_BackArrowSack_10));
	};
};

func void unequip_bow_blood()
{
	if(self.id == 0)
	{
		RANGEWEAPONINDEX = 0;
		Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
	};
};

func void equip_2h_medium_halleberde()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		MELEEWEAPONINDEX = 4;
		EquipedIndex_2H = TRUE;

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		};

		if(LowHealth == TRUE)
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};

			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
			{
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
			};
		};

		AIV_Speer = TRUE;
		B_CheckAcroAni(hero);
	};
};

func void unequip_2h_medium_halleberde()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Speer = FALSE;
	};
};
func void equip_2h_heavy_halleberde()
{
	if(self.id == 0)
	{
		Snd_Play3d(hero,"EQUIP_WEAPON_02");
		MELEEWEAPONINDEX = 6;
		EquipedIndex_2H = TRUE;

		if(hero.HitChance[NPC_TALENT_2H] >= 90)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 60)
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
		}
		else if(hero.HitChance[NPC_TALENT_2H] >= 30)
		{
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST1.MDS");
			Mdl_RemoveOverlayMds(hero,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(hero,"humans_2hST1.mds");
		};

		if(LowHealth == TRUE)
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"PRE_Hum_Shield2.MDS");	
			};

			Mdl_RemoveOverlayMds(hero,"PRE_START.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_START.MDS");
		}
		else
		{
			if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
			{
				Mdl_RemoveOverlayMds(hero,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(hero,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(hero,"Hum_Shield2.MDS");	
				Mdl_RemoveOverlayMds(hero,"Shield.MDS");
			};

			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 3)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 2)
			{
				Mdl_ApplyOverlayMds(hero,"HUMANS_AXEST2.MDS");
			}
			else if(Npc_GetTalentSkill(hero,NPC_TALENT_2H) >= 1)
			{
				Mdl_ApplyOverlayMds(hero,"Humans_SPST1.MDS");
			};
		};

		AIV_Speer = TRUE;
		B_CheckAcroAni(hero);
	};
};

func void unequip_2h_heavy_halleberde()
{
	if(self.id == 0)
	{
		MELEEWEAPONINDEX = 0;
		EquipedIndex_2H = FALSE;

		if(LowHealth == TRUE)
		{
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"PRE_Humans_Speer.mds");
			Mdl_ApplyOverlayMds(hero,"PRE_Start.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(hero,"Humans_Stafx.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafw.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafd.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafg.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Stafdemon.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_Speer.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST1.mds");
			Mdl_RemoveOverlayMds(hero,"Humans_SPST2.mds");
			Mdl_RemoveOverlayMds(hero,"HUMANS_AXEST2.MDS");

			if(hero.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST3.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST2.mds");
			}
			else if(hero.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_ApplyOverlayMds(hero,"humans_2hST1.mds");
			};
		};

		AIV_Speer = FALSE;
	};
};