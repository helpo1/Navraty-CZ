
func int B_SelectSpell(var C_Npc slf,var C_Npc oth)
{
	var int dK_rnd;
	var int dK_Mega;
	var int spellvar;
	var string str;
	var string str2;
	var int CurrentChance;
	var int randskel;

	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_129_DeadNrozas))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bow))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM3))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM4))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM5))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bro_Dex))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bro_Str))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bro_Mag))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Lord_LV))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan))
	{
		return FALSE;	
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ilesil_Evil))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE_OM)
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_5570_Avabul))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_02)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT1)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT2)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT3)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT4)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT5)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT6)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT7)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT8)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_QT9)))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IlArah))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ghost_Uniq)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ghost)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ghost_SoulKeeper)))
	{
		return FALSE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ShadowGuardTwo))
	{
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};

		B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bro_Mag))
	{
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};

		B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_12971_STONNOS))
	{
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};
		if(Npc_HasItems(slf,ItRu_Quake) == 0)
		{
			CreateInvItems(slf,ItRu_Quake,1);
		};
      	if(Npc_GetDistToNpc(slf,oth) <= 400)
		{
			B_ReadySpell(slf,SPL_Quake,SPL_Cost_Quake);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
			return TRUE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(GUR_8004_PARVEZ))
	{
		if(Npc_HasItems(slf,ItRu_Berzerk) == 0)
		{
			CreateInvItems(slf,ItRu_Berzerk,1);
		};

		B_ReadySpell(slf,SPL_Berzerk,SPL_COST_Berzerk);
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13004_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13005_STONEMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13006_STONEMAGE)))
	{
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);	
			return TRUE;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13007_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13008_FIREMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13009_FIREMAGE)))
	{
		if(Npc_HasItems(slf,ItRu_Explosion) == 0)
		{
			CreateInvItems(slf,ItRu_Explosion,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Explosion,SPL_Cost_Explosion);
			return TRUE;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13010_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13011_WATERMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13012_WATERMAGE)))
	{
		if(Npc_HasItems(slf,ItRu_Waterfist) == 0)
		{
			CreateInvItems(slf,ItRu_Waterfist,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_WaterFist,SPL_Cost_Waterfist);
			return TRUE;
		};
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13001_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13002_DARKMAGE)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_13003_DARKMAGE)))
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
     		if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
			return TRUE;
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1297_stonnos)))
	{
		if(Npc_HasItems(slf,itru_teleportdagot) == 0)
		{
			CreateInvItems(slf,itru_teleportdagot,1);
		};
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1214_tegon)))
		{
			if(Npc_HasItems(slf,ItRu_Skull) == 0)
			{
				CreateInvItems(slf,ItRu_Skull,1);
			};
			if(C_NpcHasAttackReasonToKill(slf))
			{
				B_ReadySpell(slf,SPL_Skull,SPL_Cost_Skull);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_TELEPORTDAGOT,SPL_Cost_Teleport);
				return TRUE;
			};
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1217_farion)))
		{
			if(Npc_HasItems(slf,ItRu_FireMeteor) == 0)
			{
				CreateInvItems(slf,ItRu_FireMeteor,1);
			};
			if(C_NpcHasAttackReasonToKill(slf))
			{
				B_ReadySpell(slf,SPL_FireMeteor,SPL_Cost_FireMeteor);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_TELEPORTDAGOT,SPL_Cost_Teleport);
				return TRUE;
			};
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1220_wakon)))
		{
			if(Npc_HasItems(slf,ItRu_Geyser) == 0)
			{
				CreateInvItems(slf,ItRu_Geyser,1);
			};
			if(C_NpcHasAttackReasonToKill(slf))
			{
				B_ReadySpell(slf,SPL_Geyser,SPL_Cost_Geyser);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_TELEPORTDAGOT,SPL_Cost_Teleport);
				return TRUE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1297_stonnos))
		{
			if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
			{
				CreateInvItems(slf,ItRu_GuruWrath,1);
			};
			if(C_NpcHasAttackReasonToKill(slf))
			{
				B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_TELEPORTDAGOT,SPL_Cost_Teleport);
				return TRUE;
			};
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12140_tegon)))
	{
		if(Npc_HasItems(slf,ItRu_Skull) == 0)
		{
			CreateInvItems(slf,ItRu_Skull,1);
		};

		B_ReadySpell(slf,SPL_Skull,SPL_Cost_Skull);
		return TRUE;
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12170_farion)))
	{
		if(Npc_HasItems(slf,ItRu_FireMeteor) == 0)
		{
			CreateInvItems(slf,ItRu_FireMeteor,1);
		};

		B_ReadySpell(slf,SPL_FireMeteor,SPL_Cost_FireMeteor);
		return TRUE;
	}
	else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12200_wakon)))
	{
		if(Npc_HasItems(slf,ItRu_Geyser) == 0)
		{
			CreateInvItems(slf,ItRu_Geyser,1);
		};

		B_ReadySpell(slf,SPL_Geyser,SPL_Cost_Geyser);
		return TRUE;
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_12970_stonnos))
	{
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};

		B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
		return TRUE;
	};
	if(slf.guild == GIL_GUR)
	{
		if(RUNEMAGICNOTWORK == TRUE)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_Sleep) == 0)
		{
			CreateInvItems(slf,ItRu_Sleep,1);
		};
		if(Npc_HasItems(slf,ItRu_GuruWrath) == 0)
		{
			CreateInvItems(slf,ItRu_GuruWrath,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
			return TRUE;
		}
		else if(oth.guild > GIL_SEPERATOR_HUM)
		{
			B_ReadySpell(slf,SPL_GuruWrath,SPL_COST_GuruWrath);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Sleep,SPL_Cost_Sleep);
			return TRUE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_1192_Fregeal))
	{
		if(Npc_HasItems(slf,ItRu_GreenTentacle) == 0)
		{
			CreateInvItems(slf,ItRu_GreenTentacle,1);
		};
		if(Npc_HasItems(slf,ItRu_LightHeal) == 0)
		{
			CreateInvItems(slf,ItRu_LightHeal,1);
		};
		if(slf.attribute[ATR_HITPOINTS] < 5000)
		{
			B_ReadySpell(slf,SPL_LightHeal,SPL_Cost_LightHeal);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_GreenTentacle,SPL_Cost_Greententacle);
			return TRUE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_12987_Ituseld))
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
		if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
			return TRUE;
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_100_Xardas)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(none_102_kreol)))
	{
		if(Npc_HasItems(slf,ItRu_Skull) == 0)
		{
			CreateInvItems(slf,ItRu_Skull,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Skull,SPL_COST_Skull);
			return TRUE;
		};
	};
	if(slf.guild == GIL_DMT)
	{
		if(slf.flags == NPC_FLAG_XARADRIM)
		{
			return FALSE;
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(none_117_nergal)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1298_darkmage)))
		{
			if(Npc_HasItems(slf,ItRu_Deathball) == 0)
			{
				CreateInvItems(slf,ItRu_Deathball,1);
			};
			if(Npc_HasItems(slf,ItRu_Extricate) == 0)
			{
				CreateInvItems(slf,ItRu_Extricate,1);
			};
     			if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
			{
				B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
				return TRUE;
			};
		}
		else if((slf.level == 100) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1270_Dementor)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1271_Dementor)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1272_Dementor)))
		{
			if(Npc_HasItems(slf,ItRu_Deathball) == 0)
			{
				CreateInvItems(slf,ItRu_Deathball,1);
			};
			if(Npc_HasItems(slf,ItRu_Extricate) == 0)
			{
				CreateInvItems(slf,ItRu_Extricate,1);
			};
     			if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
			{
				B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
				return TRUE;
			};
		}
		else if((Npc_IsPlayer(oth) == TRUE) && ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_1299_OberDementor_DI)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DMT_4571_Jan))))
		{
			if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_MELEE)
			{
				return FALSE;
			}
			else
			{
				if(Npc_IsInFightMode(slf,FMODE_MELEE))
				{
					AI_RemoveWeapon(slf);
				};
				if(Npc_HasItems(slf,ItRu_Explosion) == 0)
				{
					CreateInvItems(slf,ItRu_Explosion,1);
				};

				B_ReadySpell(slf,SPL_Explosion,SPL_Cost_Explosion);
				return TRUE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Imarah))
		{
			if(Npc_IsPlayer(oth) == TRUE)
			{
				if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_MELEE)
				{
					return FALSE;
				}
				else
				{
					if(Npc_IsInFightMode(slf,FMODE_MELEE))
					{
						AI_RemoveWeapon(slf);
					};
					if(Npc_HasItems(slf,ItRu_Explosion) == 0)
					{
						CreateInvItems(slf,ItRu_Explosion,1);
					};

					B_ReadySpell(slf,SPL_Explosion,SPL_Cost_Explosion);
					return TRUE;
				};
			}
			else
			{
				return FALSE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ahiron))
		{
			if(Npc_IsPlayer(oth) == TRUE)
			{
				if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_MELEE)
				{
					return FALSE;
				}
				else
				{
					if(Npc_IsInFightMode(slf,FMODE_MELEE))
					{
						AI_RemoveWeapon(slf);
					};
					if(Npc_HasItems(slf,ItRu_Deathball) == 0)
					{
						CreateInvItems(slf,ItRu_Deathball,1);
					};

					B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
					return TRUE;
				};
			}
			else
			{
				return FALSE;
			};
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_130_CorGalomDemon))
		{
			if(Npc_HasItems(slf,ItRu_Deathball) == 0)
			{
				CreateInvItems(slf,ItRu_Deathball,1);
			};
			if(Npc_HasItems(slf,ItRu_Extricate) == 0)
			{
				CreateInvItems(slf,ItRu_Extricate,1);
			};
     			if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
			{
				B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_Deathball,SPL_Cost_Deathball);
				return TRUE;
			};
		}
		else
		{
			if(Npc_IsDrawingWeapon(slf))
			{
				return TRUE;
			};
			if(Npc_HasItems(slf,ItRu_BeliarsRage) == 0)
			{
				CreateInvItems(slf,ItRu_BeliarsRage,1);
			};
			if(Npc_HasItems(slf,ItRu_Extricate) == 0)
			{
				CreateInvItems(slf,ItRu_Extricate,1);
			};
     			if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
			{
				B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
				return TRUE;
			}
			else
			{
				B_ReadySpell(slf,SPL_Energyball,SPL_Cost_Energyball);
				return TRUE;
			};
		};
	};
	if(slf.guild == GIL_KDF)
	{
		if(RUNEMAGICNOTWORK == TRUE)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_Firestorm) == 0)
		{
			CreateInvItems(slf,ItRu_Firestorm,1);
		};
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KDF_500_Pyrokar))
		{
			if(Npc_HasItems(slf,ItRu_TeleportMonastery) == 0)
			{
				CreateInvItems(slf,ItRu_TeleportMonastery,1);
			};
			if((KAPITELORCATC == TRUE) && (PYROKARUSEONCE == FALSE))
			{
				B_ReadySpell(slf,SPL_TeleportMonastery,SPL_Cost_Teleport);
				return TRUE;
			};
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pc_mage_li))
		{
			if(Npc_HasItems(slf,ItRu_Geyser) == 0)
			{
				CreateInvItems(slf,ItRu_Geyser,1);
			};
			if((slf.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE))
			{
				B_ReadySpell(slf,SPL_Geyser,SPL_Cost_Geyser);
				return TRUE;
			};
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			B_ReadySpell(slf,SPL_Firestorm,SPL_Cost_InstantFireStorm);
			return TRUE;
		}
		else if(oth.guild > GIL_SEPERATOR_HUM)
		{
			B_ReadySpell(slf,SPL_Firestorm,SPL_Cost_InstantFireStorm);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_KDW)
	{
		if(RUNEMAGICNOTWORK == TRUE)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_LightningFlash) == 0)
		{
			CreateInvItems(slf,ItRu_LightningFlash,1);
		};
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
			return TRUE;
		}
		else if(oth.guild > GIL_SEPERATOR_HUM)
		{
			B_ReadySpell(slf,SPL_LightningFlash,SPL_Cost_LightningFlash);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(RUNEMAGICNOTWORK == TRUE)
		{
			return FALSE;
		};
		if(slf.fight_tactic == FAI_NAILED)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_PalHolyBolt) == 0)
		{
			CreateInvItems(slf,ItRu_PalHolyBolt,1);
		};
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE) && C_NpcIsEvil(oth))
		{
			B_ReadySpell(slf,SPL_PalHolyBolt,SPL_Cost_PalHolyBolt);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(vlk_6027_taliasan))
	{
		if(RUNEMAGICNOTWORK == TRUE)
		{
			return FALSE;
		};
		if(Npc_HasItems(slf,ItRu_Concussionbolt) == 0)
		{
			CreateInvItems(slf,ItRu_Concussionbolt,1);
		};
		if(C_NpcHasAttackReasonToKill(slf))
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_ConcussionBolt,SPL_COST_Concussionbolt);
			return TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE)
	{
		if(Npc_HasItems(slf,ItRu_BeliarsRage) == 0)
		{
			CreateInvItems(slf,ItRu_BeliarsRage,1);
		};

		B_ReadySpell(slf,SPL_Energyball,SPL_Cost_Energyball);
		return TRUE;
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(SkeletonMage_Azgolor)))
	{
		if(Npc_HasItems(slf,ItRu_Deathball) == 0)
		{
			CreateInvItems(slf,ItRu_Deathball,1);
		};

		B_ReadySpell(slf,SPL_Deathball,SPL_COST_Deathball);
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SkeletonMage_Azgolor))
	{
		if(Npc_HasItems(slf,ItRu_Explosion) == 0)
		{
			CreateInvItems(slf,ItRu_Explosion,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Explosion,SPL_COST_Explosion);
			return TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if(Npc_HasItems(slf,ItRu_OrcFireball) == 0)
		{
			CreateInvItems(slf,ItRu_OrcFireball,1);
		};

		B_ReadySpell(slf,SPL_OrcFireball,SPL_COST_OrcFireball);
		return TRUE;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ORC_6666_XASH_GOR))
	{
		if(Npc_HasItems(slf,ItRu_Explosion) == 0)
		{
			CreateInvItems(slf,ItRu_Explosion,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Explosion,SPL_COST_Explosion);
			return TRUE;
		};
	};
	if(slf.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCSHAMAN)
	{
		if(Npc_HasItems(slf,ItRu_Explosion) == 0)
		{
			CreateInvItems(slf,ItRu_Explosion,1);
		};
		if(Npc_HasItems(slf,ItRu_Extricate) == 0)
		{
			CreateInvItems(slf,ItRu_Extricate,1);
		};
      	if((Npc_GetDistToNpc(slf,oth) <= 400) && (Npc_GetLastHitSpellID(slf) != SPL_Extricate))
		{
			B_ReadySpell(slf,SPL_Extricate,SPL_Cost_Extricate);
			return TRUE;
		}
		else
		{
			B_ReadySpell(slf,SPL_Explosion,SPL_COST_Explosion);
			return TRUE;
		};
	};

	return FALSE;
};