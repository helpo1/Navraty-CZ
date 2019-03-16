
func int B_GhostSpecialDamage(var C_Npc oth,var C_Npc slf)
{
	var C_Npc Quarho;
	var C_Npc Rhadem;
	var C_Npc gomez;
	var C_Npc corristo;
	var C_Npc rodriguez;
	var C_Npc damarok;
	var C_Npc drago;
	var C_Npc torrez;
	var C_Npc her;
	var int randomhit;

	Quarho = Hlp_GetNpc(NONE_ADDON_111_Quarhodron);
	Rhadem = Hlp_GetNpc(NONE_ADDON_112_Rhademes);
	gomez = Hlp_GetNpc(none_104_gomez);
	corristo = Hlp_GetNpc(none_105_corristo);
	rodriguez = Hlp_GetNpc(none_106_rodriguez);
	damarok = Hlp_GetNpc(none_107_damarok);
	drago = Hlp_GetNpc(none_108_drago);
	torrez = Hlp_GetNpc(none_109_torrez);
	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(corristo)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rodriguez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(damarok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(drago)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(torrez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(gomez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(corristo)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rodriguez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(damarok)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(drago)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(torrez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)))
		{
			if(NETBEKLEADME_STEP1DONE == FALSE)
			{
				Wld_PlayEffect("SPELLFX_SKULL_COLLIDEFX",oth,oth,0,0,0,FALSE);
			};
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)))
		{
			if(NETBEKLEADME_STEP1DONE == FALSE)
			{
				Wld_PlayEffect("VOB_MAGICBURN",oth,oth,0,0,0,FALSE);
			};
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)))
		{
			if(NETBEKLEADME_STEP1DONE == FALSE)
			{
				Wld_PlayEffect("SPELLFX_DESTROYUNDEAD_COLLIDE",oth,oth,0,0,0,FALSE);
			};
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
		{
			if(NETBEKLEADME_STEP1DONE == FALSE)
			{
				Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",oth,oth,0,0,0,FALSE);
			};
		};
		if(oth.flags != NPC_FLAG_IMMORTAL)
		{
			if(Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(her))
			{
				Npc_ChangeAttribute(oth,ATR_HITPOINTS,-oth.attribute[ATR_HITPOINTS_MAX]);
			}
			else if(NETBEKLEADME_STEP1DONE == FALSE)
			{
				GhostAttackWarn = GhostAttackWarn + 1;

				if(GhostAttackWarn < 3)
				{
					oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] / 2;
				}
				else if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(her))
				{
					oth.attribute[ATR_HITPOINTS] = 0;
					GhostAttackWarn = 0;
					AI_PlayAni(oth,"T_DEAD");
				};
			};
		};
		return FALSE;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(necromacerzombie))
	{
		randomhit = Hlp_Random(100);
		if((Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(her)) && (randomhit > 50))
		{
			if(oth.attribute[ATR_HITPOINTS] > 50)
			{
				Wld_PlayEffect("SPELLFX_SUCKENERGY_SENDPERCEPTION",oth,oth,0,0,0,FALSE);
				oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS] - 50;
			}
			else
			{
				oth.attribute[ATR_HITPOINTS] = 0;
				AI_PlayAni(oth,"T_DEAD");
			};
		};
		return FALSE;
	};
	return TRUE;
};

