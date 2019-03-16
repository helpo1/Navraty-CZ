
func void B_SelectWeapon(var C_Npc slf,var C_Npc oth)
{
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_660_Olaf)) && (Fight_Olaf == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_662_Bram)) && (Fight_Bram == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_663_Valgard)) && (Fight_Valgard == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_661_Graden)) && (Fight_Graden == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_125_Tiamant))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_126_Haniar))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_127_Osair))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_128_Nrozas))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_129_DeadNrozas))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon))
	{
		return;
	};
	if(C_BodyStateContains(slf,BS_FALL) || C_BodyStateContains(slf,BS_SWIM) || C_BodyStateContains(slf,BS_DIVE))
	{
		return;
	};
	if(B_SelectSpell(slf,oth))
	{
		return;
	};
	if((Npc_IsInFightMode(slf,FMODE_MAGIC) == TRUE) || (Npc_IsInFightMode(slf,FMODE_FAR) == TRUE) || (Npc_IsInFightMode(slf,FMODE_MELEE) == TRUE))
	{
		if(Npc_IsInFightMode(slf,FMODE_MAGIC) == TRUE)
		{
			if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_MELEE)
			{
				if(Npc_HasEquippedMeleeWeapon(slf) == TRUE)
				{
					AI_RemoveWeapon(slf);
					AI_ReadyMeleeWeapon(slf);
					return;
				}
				else
				{
					return;
				};
			}
			else
			{
				return;
			};
		}
		else if(Npc_IsInFightMode(slf,FMODE_FAR) == TRUE)
		{
			if(Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_INNER)
			{
				if(Npc_HasEquippedMeleeWeapon(slf) == TRUE)
				{
					AI_RemoveWeapon(slf);
					AI_ReadyMeleeWeapon(slf);
					return;
				}
				else
				{
					return;
				};
			}
			else
			{
				return;			
			};
		}
		else if(Npc_IsInFightMode(slf,FMODE_MELEE) == TRUE)
		{
			if(Npc_HasEquippedRangedWeapon(slf) == TRUE)
			{
				if(Npc_GetDistToNpc(slf,oth) >= FIGHT_DIST_RANGED_INNER)
				{
					AI_RemoveWeapon(slf);
					AI_ReadyRangedWeapon(slf);
					return;
				}
				else
				{
					return;
				};
			}
			else
			{
				return;			
			};
		};
	}
	else
	{
		if(Npc_HasEquippedRangedWeapon(slf) == TRUE)
		{
			if(Npc_GetDistToNpc(slf,oth) >= FIGHT_DIST_RANGED_INNER)
			{
				AI_RemoveWeapon(slf);
				AI_ReadyRangedWeapon(slf);
				return;
			}
			else
			{
				if(Npc_HasEquippedMeleeWeapon(slf) == TRUE)
				{
					AI_RemoveWeapon(slf);
					AI_ReadyMeleeWeapon(slf);
					return;
				}
				else
				{
					return;
				};
			};
		}
		else
		{
			if(Npc_HasEquippedMeleeWeapon(slf) == TRUE)
			{
				AI_RemoveWeapon(slf);
				AI_ReadyMeleeWeapon(slf);
				return;
			}
			else
			{
				return;
			};
		};
	};
};

