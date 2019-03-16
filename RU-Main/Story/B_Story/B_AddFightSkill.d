
func void B_AddFightSkill(var C_Npc slf,var int talent,var int percent)
{
	if(Npc_IsPlayer(slf) == TRUE)
	{
		if(talent == NPC_TALENT_1H)
		{
			slf.HitChance[NPC_TALENT_1H] = slf.HitChance[NPC_TALENT_1H] + percent;

			if(slf.HitChance[NPC_TALENT_1H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,3);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
			};
		};
		if(talent == NPC_TALENT_2H)
		{
			slf.HitChance[NPC_TALENT_2H] = slf.HitChance[NPC_TALENT_2H] + percent;

			if(slf.HitChance[NPC_TALENT_2H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,3);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
			};
		};
		if(talent == NPC_TALENT_BOW)
		{
			slf.HitChance[NPC_TALENT_BOW] = slf.HitChance[NPC_TALENT_BOW] + percent;
			slf.attribute[ATR_REGENERATEHP] = slf.HitChance[NPC_TALENT_BOW];

			if(slf.HitChance[NPC_TALENT_BOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
			};
		};
		if(talent == NPC_TALENT_CROSSBOW)
		{
	 		slf.HitChance[NPC_TALENT_CROSSBOW] = slf.HitChance[NPC_TALENT_CROSSBOW] + percent;
			slf.mission[0] = slf.HitChance[NPC_TALENT_CROSSBOW];

			if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
			};
		};

		CheckAniFight = TRUE;
	}
	else
	{
		if(talent == NPC_TALENT_1H)
		{
			slf.HitChance[NPC_TALENT_1H] = slf.HitChance[NPC_TALENT_1H] + percent;

			if(slf.HitChance[NPC_TALENT_1H] > 100)
			{
				slf.HitChance[NPC_TALENT_1H] = 100;
			};
			if(slf.HitChance[NPC_TALENT_1H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,3);
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_1hST3.mds");
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_1hST2.mds");
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_1hST1.mds");
			}
			else
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.MDS");
			};
		};
		if(talent == NPC_TALENT_2H)
		{
			slf.HitChance[NPC_TALENT_2H] = slf.HitChance[NPC_TALENT_2H] + percent;

			if(slf.HitChance[NPC_TALENT_2H] > 100)
			{
				slf.HitChance[NPC_TALENT_2H] = 100;
			};
			if(slf.HitChance[NPC_TALENT_1H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,3);
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_2hST3.mds");
			}
			else	if(slf.HitChance[NPC_TALENT_2H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_2hST1.mds");
			}
			else
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.MDS");
			};
		};
		if(talent == NPC_TALENT_BOW)
		{
			slf.HitChance[NPC_TALENT_BOW] = slf.HitChance[NPC_TALENT_BOW] + percent;

			if(slf.HitChance[NPC_TALENT_BOW] > 100)
			{
				slf.HitChance[NPC_TALENT_BOW] = 100;
			};
			if(slf.HitChance[NPC_TALENT_BOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_bowT2.mds");
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_bowT1.mds");
			}
			else
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
			};
		};
		if(talent == NPC_TALENT_CROSSBOW)
		{
			slf.HitChance[NPC_TALENT_CROSSBOW] = slf.HitChance[NPC_TALENT_CROSSBOW] + percent;

			if(slf.HitChance[NPC_TALENT_CROSSBOW] > 100)
			{
				slf.HitChance[NPC_TALENT_CROSSBOW] = 100;
			};
			if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_cbowT2.mds");
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
				Mdl_ApplyOverlayMds(slf,"humans_cbowT1.mds");
			}
			else
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
			};
		};
	};
};

func void B_CheckFightAni1H(var C_Npc slf)
{
	if(slf.HitChance[NPC_TALENT_1H] >= 90)
	{
		if((LowHealth == FALSE) && (Ani_Shield_S == FALSE) && (EquipedIndex_Chief == FALSE))
		{
			Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
			Mdl_ApplyOverlayMds(slf,"humans_1hST3.mds");
		};
	}
	else if(slf.HitChance[NPC_TALENT_1H] >= 60)
	{
		if((LowHealth == FALSE) && (Ani_Shield_S == FALSE) && (EquipedIndex_Chief == FALSE))
		{
			Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
			Mdl_ApplyOverlayMds(slf,"humans_1hST2.mds");
		};
	}
	else if(slf.HitChance[NPC_TALENT_1H] >= 30)
	{
		if((LowHealth == FALSE) && (Ani_Shield_S == FALSE) && (EquipedIndex_Chief == FALSE))
		{
			Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
			Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
			Mdl_ApplyOverlayMds(slf,"humans_1hST1.mds");
		};
	}
	else
	{
		Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
		Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
		Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
	};
};

func void B_AddFightSkill_NoAni(var C_Npc slf,var int talent,var int percent)
{
	if(Npc_IsPlayer(slf) == TRUE)
	{
		if(talent == NPC_TALENT_1H)
		{
			slf.HitChance[NPC_TALENT_1H] = slf.HitChance[NPC_TALENT_1H] + percent;

			if(slf.HitChance[NPC_TALENT_1H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,3);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,2);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,1);
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_1H,0);
			};
		};
		if(talent == NPC_TALENT_2H)
		{
			slf.HitChance[NPC_TALENT_2H] = slf.HitChance[NPC_TALENT_2H] + percent;

			if(slf.HitChance[NPC_TALENT_2H] >= 90)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,3);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,2);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,1);
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_2H,0);
			};
		};
		if(talent == NPC_TALENT_BOW)
		{
			slf.HitChance[NPC_TALENT_BOW] = slf.HitChance[NPC_TALENT_BOW] + percent;
			slf.attribute[ATR_REGENERATEHP] = slf.HitChance[NPC_TALENT_BOW];

			if(slf.HitChance[NPC_TALENT_BOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,2);
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,1);
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_BOW,0);
			};
		};
		if(talent == NPC_TALENT_CROSSBOW)
		{
	 		slf.HitChance[NPC_TALENT_CROSSBOW] = slf.HitChance[NPC_TALENT_CROSSBOW] + percent;
			slf.mission[0] = slf.HitChance[NPC_TALENT_CROSSBOW];

			if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,2);
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,1);
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
			{
				Npc_SetTalentSkill(slf,NPC_TALENT_CROSSBOW,0);
			};
		};
	};
};

func void B_CheckFightAni(var C_Npc slf,var int talent)
{
	if(Npc_IsPlayer(slf) == TRUE)
	{
		if(talent == NPC_TALENT_1H)
		{
			if(slf.HitChance[NPC_TALENT_1H] >= 90)
			{
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(slf,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Hum_Shield2.MDS");

				if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
				{
					if(LowHealth == FALSE)
					{
						Mdl_ApplyOverlayMds(slf,"humans_1hST3.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if(EquipedIndex_Chief == TRUE)
				{
					Mdl_ApplyOverlayMds(slf,"Humans_Rapier_ST3.mds");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_Hum_Shield2.MDS");
					}
					else
					{
						if(slf.attribute[ATR_REGENERATEMANA] >= 90)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST4.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 60)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST3.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 30)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST2.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 1)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST1.MDS");
						};
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 60)
			{
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(slf,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Hum_Shield2.MDS");

				if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
				{
					if(LowHealth == FALSE)
					{
						Mdl_ApplyOverlayMds(slf,"humans_1hST2.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if(EquipedIndex_Chief == TRUE)
				{
					Mdl_ApplyOverlayMds(slf,"Humans_Rapier_ST2.mds");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_Hum_Shield2.MDS");
					}
					else
					{
						if(slf.attribute[ATR_REGENERATEMANA] >= 90)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST4.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 60)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST3.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 30)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST2.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 1)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST1.MDS");
						};
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 30)
			{
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(slf,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Hum_Shield2.MDS");

				if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
				{
					if(LowHealth == FALSE)
					{
						Mdl_ApplyOverlayMds(slf,"humans_1hST1.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if(EquipedIndex_Chief == TRUE)
				{
					Mdl_ApplyOverlayMds(slf,"Humans_Rapier_ST1.mds");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_Hum_Shield2.MDS");
					}
					else
					{
						if(slf.attribute[ATR_REGENERATEMANA] >= 90)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST4.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 60)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST3.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 30)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST2.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 1)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST1.MDS");
						};
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_1H] >= 0)
			{
				Mdl_RemoveOverlayMds(slf,"humans_1hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_1hST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Pirate.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST3.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Rapier_ST1.mds");
				Mdl_RemoveOverlayMds(slf,"Shield_ST4.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST2.MDS");
				Mdl_RemoveOverlayMds(slf,"Shield_ST1.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Hum_Shield2.MDS");

				if((EquipedIndex_Chief == FALSE) && (AIV_Shield_01 == FALSE) && (AIV_Shield_02 == FALSE) && (AIV_Shield_03 == FALSE) && (AIV_Shield_04 == FALSE) && (AIV_Shield_05 == FALSE) && (AIV_Shield_06 == FALSE) && (AIV_Shield_07 == FALSE) && (AIV_Shield_Caracust == FALSE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if(EquipedIndex_Chief == TRUE)
				{
					Mdl_ApplyOverlayMds(slf,"Humans_Pirate.mds");
				}
				else if((AIV_Shield_01 == TRUE) || (AIV_Shield_02 == TRUE) || (AIV_Shield_03 == TRUE) || (AIV_Shield_04 == TRUE) || (AIV_Shield_05 == TRUE) || (AIV_Shield_06 == TRUE) || (AIV_Shield_07 == TRUE) || (AIV_Shield_Caracust == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_Hum_Shield2.MDS");
					}
					else
					{
						if(slf.attribute[ATR_REGENERATEMANA] >= 90)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST4.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 60)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST3.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 30)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST2.MDS");
						}
						else if(slf.attribute[ATR_REGENERATEMANA] >= 1)
						{
							Mdl_ApplyOverlayMds(slf,"Shield_ST1.MDS");
						};
					};
				};
			};
		};
		if(talent == NPC_TALENT_2H)
		{
			if(slf.HitChance[NPC_TALENT_2H] >= 90)
			{
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST2.mds");

				if((AIV_Speer == FALSE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
				{
					if(LowHealth == FALSE)
					{
						if(AXE_ST3 == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST3.mds");
						}
						else if(AXE_ST2 == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST3.mds");
							AXE_ST2 = FALSE;
							AXE_ST3 = TRUE;
						}
						else if(AXE_STON == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST3.mds");
							AXE_ST2 = FALSE;
							AXE_ST3 = TRUE;
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST3.mds");
						};
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if((RH_Ready_2X2 == TRUE) || (LH_Ready_2X2 == TRUE))
				{
					if(LH_Ready_2X2 == TRUE)
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START_2X2.MDS");
							Mdl_ApplyOverlayMds(slf,"WOUNDED_2X2.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_2x2ST3.MDS");
						};
					}
					else
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_1x2ST3.MDS");
						};
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					if(LowHealth == TRUE)
					{
						//Mdl_ApplyOverlayMds(slf,"PRE_Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						//Mdl_ApplyOverlayMds(slf,"Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"Humans_SPST2.MDS");
					};
				}
				else if(AIV_Speer == TRUE)
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"Humans_SPST2.MDS");
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 60)
			{
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST2.mds");

				if((AIV_Speer == FALSE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
				{
					if(LowHealth == FALSE)
					{
						if(AXE_ST2 == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
						}
						else if(AXE_STON == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
							AXE_ST2 = TRUE;
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"humans_2hST2.mds");
						};
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};	
				}
				else if((RH_Ready_2X2 == TRUE) || (LH_Ready_2X2 == TRUE))
				{
					if(LH_Ready_2X2 == TRUE)
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START_2X2.MDS");
							Mdl_ApplyOverlayMds(slf,"WOUNDED_2X2.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_2x2ST3.MDS");
						};
					}
					else
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_1x2ST3.MDS");
						};
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					if(LowHealth == TRUE)
					{
						//Mdl_ApplyOverlayMds(slf,"PRE_Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						//Mdl_ApplyOverlayMds(slf,"Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				}
				else if(AIV_Speer == TRUE)
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 30)
			{
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST2.mds");

				if((AIV_Speer == FALSE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
				{
					if(LowHealth == FALSE)
					{
						Mdl_ApplyOverlayMds(slf,"humans_2hST1.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if((RH_Ready_2X2 == TRUE) || (LH_Ready_2X2 == TRUE))
				{
					if(LH_Ready_2X2 == TRUE)
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START_2X2.MDS");
							Mdl_ApplyOverlayMds(slf,"WOUNDED_2X2.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_2x2ST3.MDS");
						};
					}
					else
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_1x2ST3.MDS");
						};
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					if(LowHealth == TRUE)
					{
						//Mdl_ApplyOverlayMds(slf,"PRE_Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						//Mdl_ApplyOverlayMds(slf,"Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"Humans_SPST1.MDS");
					};
				}
				else if(AIV_Speer == TRUE)
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						Mdl_ApplyOverlayMds(slf,"Humans_SPST1.MDS");
					};
				};
			}
			else if(slf.HitChance[NPC_TALENT_2H] >= 0)
			{
				Mdl_RemoveOverlayMds(slf,"humans_2hST3.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST2.mds");
				Mdl_RemoveOverlayMds(slf,"humans_2hST1.mds");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST1.MDS");
				Mdl_RemoveOverlayMds(slf,"HUMANS_AXEST2.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_START_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"HUM_2X2.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_2x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"Humans_1x2ST3.MDS");
				Mdl_RemoveOverlayMds(slf,"WOUNDED_2X2.MDS.MDS");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_O2Hl2.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafx.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafw.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafd.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafg.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Stafdemon.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"PRE_START.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_Speer.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST1.mds");
				Mdl_RemoveOverlayMds(slf,"Humans_SPST2.mds");

				if((AIV_Speer == FALSE) && (AIV_OrcWeaponEquip == FALSE) && (RH_Ready_2X2 == FALSE) && (LH_Ready_2X2 == FALSE) && (AIV_Staff_Blood == FALSE) && (AIV_Staff_01 == FALSE) && (AIV_Staff_02 == FALSE) && (AIV_Staff_03 == FALSE) && (AIV_Staff_04 == FALSE) && (AIV_Staff_05 == FALSE) && (AIV_Staff_06 == FALSE) && (AIV_Staff_07 == FALSE) && (AIV_Staff_08 == FALSE) && (AIV_Staff_09 == FALSE) && (AIV_Staff_10 == FALSE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if((RH_Ready_2X2 == TRUE) || (LH_Ready_2X2 == TRUE))
				{
					if(LH_Ready_2X2 == TRUE)
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START_2X2.MDS");
							Mdl_ApplyOverlayMds(slf,"WOUNDED_2X2.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_2x2ST3.MDS");
						};
					}
					else
					{
						if(LowHealth == TRUE)
						{
							Mdl_ApplyOverlayMds(slf,"PRE_START.MDS");
						}
						else
						{
							Mdl_ApplyOverlayMds(slf,"Humans_1x2ST3.MDS");
						};
					};
				}
				else if(AIV_OrcWeaponEquip == TRUE)
				{
					if(LowHealth == TRUE)
					{
						//Mdl_ApplyOverlayMds(slf,"PRE_Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					}
					else
					{
						//Mdl_ApplyOverlayMds(slf,"Humans_O2Hl2.MDS");
						Mdl_ApplyOverlayMds(slf,"HUMANS_AXEST2.MDS");
					};
				}
				else if((AIV_Staff_01 == TRUE) || (AIV_Staff_Blood == TRUE) || (AIV_Staff_02 == TRUE) || (AIV_Staff_03 == TRUE) || (AIV_Staff_04 == TRUE) || (AIV_Staff_05 == TRUE) || (AIV_Staff_06 == TRUE) || (AIV_Staff_07 == TRUE) || (AIV_Staff_08 == TRUE) || (AIV_Staff_09 == TRUE) || (AIV_Staff_10 == TRUE))
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				}
				else if(AIV_Speer == TRUE)
				{
					if(LowHealth == TRUE)
					{
						Mdl_ApplyOverlayMds(slf,"PRE_START.mds");
					};
				};
			};
		};
		if(talent == NPC_TALENT_BOW)
		{
			if(slf.HitChance[NPC_TALENT_BOW] >= 60)
			{
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");

				if(LowHealth == FALSE)
				{
					Mdl_ApplyOverlayMds(slf,"humans_BowT2.mds");
				};
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 30)
			{
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");

				if(LowHealth == FALSE)
				{
					Mdl_ApplyOverlayMds(slf,"humans_BowT1.mds");
				};
			}
			else if(slf.HitChance[NPC_TALENT_BOW] >= 0)
			{
				Mdl_RemoveOverlayMds(slf,"humans_bowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_bowT2.MDS");
			};
		};
		if(talent == NPC_TALENT_CROSSBOW)
		{
			if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 60)
			{
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");

				if(LowHealth == FALSE)
				{
					Mdl_ApplyOverlayMds(slf,"humans_CBowT2.mds");
				};
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 30)
			{
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");

				if(LowHealth == FALSE)
				{
					Mdl_ApplyOverlayMds(slf,"humans_CBowT1.mds");
				};
			}
			else if(slf.HitChance[NPC_TALENT_CROSSBOW] >= 0)
			{
				Mdl_RemoveOverlayMds(slf,"humans_cbowT1.MDS");
				Mdl_RemoveOverlayMds(slf,"humans_cbowT2.MDS");
			};
		};
	};
	if((Npc_IsInFightMode(slf,FMODE_NONE) == TRUE) && (Npc_GetTalentSkill(slf,NPC_TALENT_ACROBAT) == TRUE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(AcrobatTurnOFF == FALSE)
		{
			Mdl_RemoveOverlayMds(slf,"Humans_Acrobatic.MDS");
			Mdl_ApplyOverlayMds(slf,"Humans_Acrobatic.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(slf,"Humans_Acrobatic.MDS");
		};
	};
};


func void B_CheckAcroAni(var C_Npc slf)
{
	if((Npc_IsInFightMode(slf,FMODE_NONE) == TRUE) && (Npc_GetTalentSkill(slf,NPC_TALENT_ACROBAT) == TRUE) && (OptionCheck == FALSE) && (HeroTRANS == FALSE) && (ENDGAMECREDITS == FALSE) && (CaptureCheat == TRUE) && (HeroIsDead == FALSE))
	{
		if(AcrobatTurnOFF == FALSE)
		{
			Mdl_RemoveOverlayMds(slf,"Humans_Acrobatic.MDS");
			Mdl_ApplyOverlayMds(slf,"Humans_Acrobatic.MDS");
		}
		else
		{
			Mdl_RemoveOverlayMds(slf,"Humans_Acrobatic.MDS");
		};
	};
};