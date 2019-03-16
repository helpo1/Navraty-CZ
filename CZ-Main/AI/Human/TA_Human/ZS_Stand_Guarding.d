
func void ZS_Stand_Guarding()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_DeSynchronize();

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XOR_12205_TERINAKS)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(XOR_12207_WARRIORNATURE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ilesil_Evil)))
	{
		if(Npc_HasItems(self,ItAr_Helm_Egezart) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Egezart);
			AI_EquipArmor(self,ItAr_Helm_Egezart);
		};		
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4201_Wirt)) && (CoragonGuestBack == TRUE) && (CoragonGuestBackCheck == FALSE))
	{
		if(Npc_HasItems(self,ITAR_Mil_L) == 0)
		{
			CreateInvItem(self,ITAR_Mil_L);
		};
	
		AI_EquipBestArmor(self);
		CoragonGuestBackCheck = TRUE;
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Guarding_loop()
{
	var int random;
	var int zufall;

	B_CheckHealth(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1061_Wache)) && (self.aivar[AIV_EnemyOverride] == TRUE) && (DexterNoLoyalMore == TRUE))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;

		if((IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE) && (Npc_GetDistToWP(self,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 1000))
		{
			B_LookAtNpc(self,SLD_10920_Loa);
		};
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.flags != NPC_FLAG_XARADRIM) && (self.guild != GIL_KDF) && (self.guild != GIL_KDW) && (self.guild != GIL_GUR) && (self.guild != GIL_KDM) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS))
	{
		random = Hlp_Random(9);

		if((IS_INEXTREMO_LOA_PLAYING == TRUE) && (ConcertLoaBonus == FALSE) && (Npc_GetDistToWP(self,"NW_BIGFARM_CAMPON_PSI_GURU_04") <= 1000))
		{
			zufall = Hlp_Random(100);

			if(zufall >= 80)
			{
				B_TurnToNpc(self,SLD_10920_Loa);
				B_LookAtNpc(self,SLD_10920_Loa);
				Snd_Play3d(self,"AMB_WHISLE_02");
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
				return LOOP_END;
			}
			else if(zufall >= 50)
			{
				B_TurnToNpc(self,SLD_10920_Loa);
				B_LookAtNpc(self,SLD_10920_Loa);
				AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
				return LOOP_END;
			};
		};
		if(random == 1)
		{
			AI_PlayAni(self,"T_HGUARD_LOOKAROUND");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_PERCEPTION");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_BORINGKICK");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"R_LEGSHAKE");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"COUGH");
			};
		}
		else if(random == 6)
		{	
			AI_PlayAni(self,"R_SCRATCHLSHOULDER");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"R_SCRATCHHEAD");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"YAWN");
			};
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Guarding_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

func void ZS_WacheFackel()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(self.aivar[AIV_MM_RoamEnd] == FALSE)
	{
		Mdl_ApplyOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		ActivateZSSlot(self,"BIP01 L HAND");
		Ext_RemoveFromSlot(self,"BIP01 L HAND");	
		Ext_PutInSlot(self,"BIP01 L HAND",ItLsFireTorch);
		Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));	
		self.aivar[AIV_MM_RoamEnd] = TRUE;
	};

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1061_Wache)) && (self.aivar[AIV_EnemyOverride] == TRUE) && (DexterNoLoyalMore == TRUE))
	{
		self.aivar[AIV_EnemyOverride] = FALSE;
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_WacheFackel_Loop()
{
	var int random;

	if(Npc_IsOnFP(self,"STAND") && (self.aivar[AIV_TAPOSITION] != ISINPOS))
	{
		Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		Mdl_ApplyOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	}
	else if(Wld_IsFPAvailable(self,"STAND") && (self.aivar[AIV_TAPOSITION] != ISINPOS))
	{
		Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		Mdl_ApplyOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
	}
	else if(self.aivar[AIV_TAPOSITION] != ISINPOS)
	{
		Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		Mdl_ApplyOverlayMds(self,"HUMANS_NEWTORCH.MDS");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 15) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(6);

		if(random == 0)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 1)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"R_LEGSHAKE");

			if(Npc_GetDistToNpc(self,hero) < 650)
			{
				Snd_Play3d(self,"SNIFF");
			};
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"R_SCRATCHEGG");
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_WacheFackel_End()
{
	self.aivar[AIV_MM_RoamEnd] = FALSE;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	Mdl_RemoveOverlayMds(self,"HUMANS_NEWTORCH.MDS");
	Ext_RemoveFromSlot(self,"BIP01 L HAND");
	Npc_RemoveInvItems(self,ItLsFireTorch,Npc_HasItems(self,ItLsFireTorch));
	b_staminainvent();
};

func void ZS_Stand_Guarding_Orc()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_Guarding_Orc_loop()
{
	var int random;
	b_staminainvent();
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetStateTime(self) > 10) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random(9);

		if(random == 1)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 2)
		{
			AI_PlayAni(self,"T_PERCEPTION");
		}
		else if(random == 3)
		{
			AI_PlayAni(self,"T_BORINGKICK");
		}
		else if(random == 4)
		{
			AI_PlayAni(self,"T_SEARCH");
		}
		else if(random == 5)
		{
			AI_PlayAni(self,"R_ROAM1");
		}
		else if(random == 6)
		{
			AI_PlayAni(self,"R_ROAM2");
		}
		else if(random == 7)
		{
			AI_PlayAni(self,"R_ROAM3");
		}
		else if(random == 8)
		{
			AI_PlayAni(self,"T_PERCEPTION");
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Guarding_Orc_end()
{
	b_staminainvent();
};

func void ZS_Stand_Plaz()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Stand_Plaz_loop()
{
	var int random;
	b_staminainvent();

	B_CheckHealth(self);

	if(Npc_IsOnFP(self,"GUARD"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"GUARD"))
	{
		AI_GotoFP(self,"GUARD");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_Plaz_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_Stand_IlARah()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IlArah))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel_IlArah) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel_IlArah);
			AI_EquipArmor(self,ItAr_Helm_Skel_IlArah);
		};		
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_Stand_IlARah_loop()
{
	var int random;
	var int zufall;

	if(Npc_IsOnFP(self,"STAND") && (self.aivar[AIV_TAPOSITION] != ISINPOS))
	{
		AI_AlignToFP(self);

		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND") && (self.aivar[AIV_TAPOSITION] != ISINPOS))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else if(self.aivar[AIV_TAPOSITION] != ISINPOS)
	{
		AI_AlignToWP(self);

		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if((Npc_GetDistToWP(hero,"KRATUK") < 1500) && (CurrentLevel == HAOSWORLD_ZEN) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && (self.aivar[AIV_EnemyOverride] == TRUE))
	{
		AI_TurnToNPC(self,hero);
		self.aivar[AIV_EnemyOverride] = FALSE;
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_IlARah_end()
{
	b_staminainvent();
};
