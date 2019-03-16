
func void ZS_MM_AllScheduler()
{
	var int deltalevel;
	var int curkap;
	var C_Item otherweap;
	var C_Item npcweapon;

	b_staminainvent();
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	AI_RemoveWeapon(self);
	npcweapon = Npc_GetEquippedMeleeWeapon(self);

	if(self.attribute[ATR_MANA_MAX] < 50)
	{
		self.attribute[ATR_MANA_MAX] = 50;
		self.attribute[ATR_MANA] = 50;
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SPIDER)
	{
		AI_StartState(self,zs_mm_rtn_spider,1,"");
		return;
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_GHOST)
	{
		AI_StartState(self,ZS_MM_Rtn_Ghost,1,"");
		return;
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN) && (Npc_HasItems(self,ItMw_1h_Bau_Mace) >= 1))
	{
		Npc_RemoveInvItems(self,ItMw_1h_Bau_Mace,Npc_HasItems(self,ItMw_1h_Bau_Mace));
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK) && (Npc_HasItems(self,ItMw_1h_Gobbo_Hammer) >= 1))
	{
		Npc_RemoveInvItems(self,ItMw_1h_Gobbo_Hammer,Npc_HasItems(self,ItMw_1h_Gobbo_Hammer));
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Shield)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Dark)))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel_Low) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel_Low);
			AI_EquipArmor(self,ItAr_Helm_Skel_Low);
		};		
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel);
			AI_EquipArmor(self,ItAr_Helm_Skel);
		};		
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel_Elite) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel_Elite);
			AI_EquipArmor(self,ItAr_Helm_Skel_Elite);
		};		
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_SHIELD_MASTER)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_FIRESHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_DARKSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_WATERSHPERE)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SKELETON_WARRIOR_DARK_STONESHPERE)))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel_King) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel_King);
			AI_EquipArmor(self,ItAr_Helm_Skel_King);
		};		
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(AraharPlague))
	{
		if(Npc_HasItems(self,ItAr_Helm_Arahar) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Arahar);
			AI_EquipArmor(self,ItAr_Helm_Arahar);
		};		
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Chaos))
	{
		if(Npc_HasItems(self,ItAr_Helm_Skel_Elite) == 0)
		{
			CreateInvItem(self,ItAr_Helm_Skel_King);
			AI_EquipArmor(self,ItAr_Helm_Skel_King);
		};		
	};
	if((Hlp_IsItem(npcweapon,ITMW_1H_DoomSpeer) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_1H_DoomSpeer_Elite) == TRUE))
	{
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");	
	};
	if(Hlp_IsItem(npcweapon,ITMW_2H_DOOMAXE) == TRUE)
	{
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"HUMANS_AXEST2.MDS");	
	};
	if((Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST_ELITE) == TRUE) || (Hlp_IsItem(npcweapon,ITMW_SHADOWPRIEST_OBER) == TRUE))
	{
		Mdl_RemoveOverlayMds(self,"humans_2hST3.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST2.mds");
		Mdl_RemoveOverlayMds(self,"humans_2hST1.mds");
		Mdl_ApplyOverlayMds(self,"Humans_SPST2.MDS");	
	};
	if((self.guild == GIL_Stoneguardian) && (RavenIsDead == TRUE) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedGuardian))
	{
		B_KillNpc(self);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Haniar_Demon_03)))
	{
		AI_StartState(self,ZS_MM_Rtn_HaniarDemon,1,"");
		return;
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW))
	{
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
		return;
	};
	if(self.guild == GIL_MEATBUG)
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_MEATBUG_FOLLOWER)
		{
			AI_StartState(self,zs_mm_rtn_followtrf,1,"");
			return;
		};
	};
	if((self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine) && (self.guild == GIL_ORC))
	{
		AI_StartState(self,zs_mm_rtn_standdrinking,1,"");
		return;
	};
	if(Wld_IsTime(self.aivar[AIV_MM_SleepStart],0,self.aivar[AIV_MM_SleepEnd],0) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
	{
		if((self.guild != GIL_DEMON) && (self.guild != GIL_DRAGON))
		{
			AI_StartState(self,ZS_MM_Rtn_Sleep,1,"");
		};
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],0) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_RoamStart],0,self.aivar[AIV_MM_RoamEnd],0) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
	{
		if((self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) && (self.flags != ORCTEMPLENPCFLAGS))
		{
			if(Wld_IsTime(6,0,22,0))
			{
				AI_StartState(self,ZS_MM_Rtn_Roam,1,"");
			}
			else
			{
				AI_StartState(self,zs_mm_rtn_orcsitroam,1,"");
			};
		}
		else
		{
			AI_StartState(self,ZS_MM_Rtn_Roam,1,"");
		};
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_EatGroundStart],0,self.aivar[AIV_MM_EatGroundEnd],0) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_EatGround,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_WuselStart],0,self.aivar[AIV_MM_WuselEnd],0) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_Rtn_Wusel,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_OrcSitStart],0,self.aivar[AIV_MM_OrcSitEnd],0) || (self.aivar[AIV_MM_OrcSitStart] == OnlyRoutine))
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ORC_7551_PREACHSHAMAN))
		{
			if(Wld_IsTime(22,5,5,55))
			{
				AI_StartState(self,zs_mm_rtn_orcpraynail,1,"");
			}
			else
			{
				AI_StartState(self,ZS_MM_Rtn_OrcPreach,1,"");
			};
		}
		else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcShaman_Pray_01)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcShaman_Pray_02)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcShaman_Pray_03)))
		{
			if(Wld_IsTime(22,5,5,55))
			{
				AI_StartState(self,zs_mm_rtn_orcpraynail,1,"");
			}
			else
			{
				AI_StartState(self,zs_mm_rtn_orcpraynail,1,"");
			};
		}
		else if((self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS))
		{
			if(Wld_IsTime(22,5,5,55))
			{
				AI_StartState(self,zs_mm_rtn_orcpray,1,"");
			}
			else
			{
				AI_StartState(self,ZS_MM_Rtn_OrcSit,1,"");
			};
		}
		else
		{
			AI_StartState(self,ZS_MM_Rtn_OrcSit,1,"");
		};
	}
	else
	{
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
	};
};

