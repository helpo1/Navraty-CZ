
func void B_AssessMurder()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Crait))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(other))
	{
		return;
	};
	if(Npc_IsPlayer(victim))
	{
		return;
	};
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Mil_316_Wambo)) && (WamboMustDie == TRUE))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)) && (TempleIsClear == FALSE) && (KnowPlaceMeeting == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_102_KREOL))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1212_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1213_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1214_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1215_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1216_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1217_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1218_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1219_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1220_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_1297_stonnos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12120_dagot)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12130_morius)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12140_tegon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12150_kelios)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12160_demos)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12170_farion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12180_gader)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12190_narus)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12200_wakon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_12970_stonnos)))
	{
		return;
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_178_Prior_ArchDemon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_175_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_174_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_173_Adept_Demon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_172_Adept_Demon)))
	{
		return;
	};
	if((STARTBIGBATTLE == TRUE) && (self.aivar[98] == TRUE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other) && !Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(B_AssessEnemy())
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.guild == GIL_DMT))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_NATTER))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_CRAB))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Rabbit)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(Rabbit_02)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (victim.aivar[AIV_MM_REAL_ID] == ID_MEATBUG))
	{
		return;
	};
	if(self.guild == GIL_STRF)
	{
		return;
	};
	if((victim.aivar[AIV_ToughGuy] == FALSE) && ((victim.aivar[AIV_MM_REAL_ID] == ID_BARAN) || (victim.aivar[AIV_MM_REAL_ID] == ID_ZIEGE)))
	{
		if(C_WantToAttackSheepKiller(self,other))
		{
			B_Attack(self,other,AR_SheepKiller,0);
			return;
		}
		else if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_SHEEPKILLER);
		};
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		B_Attack(self,other,AR_MonsterMurderedHuman,0);
		return;
	};
	if(victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(self.aivar[AIV_EnemyOverride] == TRUE)
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
		{
			B_Attack(self,other,AR_GuildEnemy,0);
			return;
		};
		return;
	};
	if(((Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY)) && ((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.npcType == NPCTYPE_FRIEND))
	{
		return;
	};
	if(!C_WantToAttackMurder(self,other))
	{
		if(C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime(self,other,CRIME_MURDER);
		};
		return;
	};
	if((other.aivar[AIV_DropDeadAndKill] == TRUE) || (victim.aivar[AIV_DropDeadAndKill] == TRUE))
	{
		return;
	};
	if((victim.guild == GIL_BDT) && !C_NpcBelongsToBL(victim))
	{
		return;
	};
	if((victim.guild == GIL_DMT) && (self.guild == GIL_DMT))
	{
		B_Attack(self,other,AR_GuildEnemy,0);
		return;
	};

	B_Attack(self,other,AR_HumanMurderedHuman,0);
};

