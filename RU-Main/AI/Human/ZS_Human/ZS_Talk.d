
var int zsTalkBugfix;

func void ZS_Talk()
{
	var C_Npc target;
	var C_Npc her;
	var string concatText;

	her = Hlp_GetNpc(PC_Hero);
	b_staminainvent();

	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};

	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;

	Npc_RemoveInvItems(self,ItSl_GoldPocket_None,Npc_HasItems(self,ItSl_GoldPocket_None));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Low,Npc_HasItems(self,ItSl_GoldPocket_Low));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Medium,Npc_HasItems(self,ItSl_GoldPocket_Medium));
	Npc_RemoveInvItems(self,ItSl_GoldPocket_Full,Npc_HasItems(self,ItSl_GoldPocket_Full));

	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			target = Npc_GetLookAtTarget(self);

			if(!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc(self,other);
			};
		}
		else
		{
			B_LookAtNpc(self,other);
		};

		AI_RemoveWeapon(self);
	};
	if((self.guild > GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(OrcWarrior_MineCommander)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Orc_8215_Kan)))
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
			AI_Standup(other);
			AI_TurnToNPC(self,other);
		};

		B_LookAtNpc(self,other);
		AI_RemoveWeapon(self);
	};
	if(Npc_IsPlayer(other) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_9158_VARUS)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(OrcWarrior_MineCommander)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Orc_8215_Kan)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PAL_250_Garond))))
	{
		AI_LookAtNpc(self,other);
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		B_TurnToNpc(self,other);
	};
	if(!C_BodyStateContains(other,BS_SIT))
	{
		B_TurnToNpc(other,self);

		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((Npc_GetAttitude(self,other) == ATT_ANGRY) || (Npc_GetAttitude(self,other) == ATT_HOSTILE))
		{
			if(!C_PlayerIsFakeBandit(self,other) || (self.guild != GIL_BDT))
			{
				Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
			};
		};
		if((self.npcType == NPCTYPE_AMBIENT) || (self.npcType == NPCTYPE_OCAMBIENT) || (self.npcType == NPCTYPE_BL_AMBIENT) || (self.npcType == NPCTYPE_TAL_AMBIENT) || (self.npcType == NPCTYPE_CSP_AMBIENT) || (self.npcType == NPCTYPE_XBSAMBIENT))
		{
			B_AssignAmbientInfos(self);

			if(C_NpcBelongsToCity(self))
			{
				if(KAPITELORCATC == FALSE)
				{
					B_AssignCityGuide(self);
				};
			};
		};
		if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff_NW)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Biff_DI)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Pardos)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Pardos_NW)))
		{
			B_Addon_GivePotion(self);
		};
		if((self.aivar[96] == TRUE) && (PALADINATTACK == TRUE) && (CASTLEISFREE == FALSE))
		{
			B_Addon_GoWithMe(self);
		};
		if((Npc_GetTalentValue(hero,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (self.aivar[AIV_MM_RestEnd] == FALSE) && (bNewSteal[0] == FALSE))
 		{
			B_Addon_Steal(self);
		};
		if(C_NpcIsToughGuy(self) && (self.aivar[AIV_ToughGuyNewsOverride] == FALSE))
		{
			B_AssignToughGuyNEWS(self);
		};
		if(C_NpcHasAmbientNews(self))
		{
			B_AssignAmbientNEWS(self);
		};
	};
	if(self.guild == GIL_DRAGON)
	{
		AI_PlayAni(self,"T_STAND_2_TALK");
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her))
	{
		PLAYER_MOBSI_PRODUCTION = MOBSI_Talk;
		CheckDialogStatus = TRUE;

		if((CinemaMod == TRUE) && ((STARTPOCKERMATCH == FALSE) || (STARTPOCKERMATCH == TRUE)))
		{
			Wld_StopEffect("DRAGONLOOK_FX");
			Wld_StopEffect("LOWHEALTH_FX");
			Wld_StopEffect("POISONED_FX");
			Wld_StopEffect("SPELLFX_FOG_SMOKE");
			//Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};
	};
	if(Npc_IsPlayer(other) && (Npc_CheckInfo(self,1) == FALSE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.level != 500) && (self.guild != GIL_DMT) && (self.flags != NPC_FLAG_XARADRIM) && !C_BodyStateContains(self,BS_SIT))
	{
		B_Say_GuildGreetings(self,other);
	};

	AI_ProcessInfos(self);
	zsTalkBugfix = FALSE;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Talk_Loop()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her)) && (IS_LOVCACH == TRUE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_447_Cassia)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_445_Ramirez)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_446_Jesper)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_494_Attila))))
	{
		print_Thief_Status(95,1);
	};
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(vlk_6134_valeran)) && (VALERANRECRUITEDDT == TRUE) && (HURRAYICANHIRE == TRUE))
	{
		print_campinfo();
	}
	else if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her)) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4303_Addon_Erol)) && (EROLRECRUITEDDT == TRUE) && (HURRAYICANHIRE == TRUE))
	{
		print_campinfo();
	};
	if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(her))
	{
		B_CheckHealth(self);
	};
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her))
	{
		PLAYER_MOBSI_PRODUCTION = MOBSI_Talk;
	};
	if(InfoManager_HasFinished() && (zsTalkBugfix == TRUE))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		self.aivar[AIV_NpcStartedTalk] = FALSE;
		self.aivar[AIV_TalkedToPlayer] = TRUE;

		if(self.guild < GIL_SEPERATOR_HUM)
		{
			B_StopLookAt(self);
			Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		};
		if(self.guild == GIL_DRAGON)
		{
			AI_PlayAni(self,"T_TALK_2_STAND");
		};

		return LOOP_END;
	}
	else
	{
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(her))
		{
			PLAYER_MOBSI_PRODUCTION = MOBSI_Talk;
		};
		zsTalkBugfix = TRUE;
		return LOOP_CONTINUE;
	};

	return LOOP_CONTINUE;
};

func void ZS_Talk_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	Npc_SetRefuseTalk(other,20);

	if(c_npcisbotheredbyplayerroomguildnew(self,other) || ((Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY)))
	{
		AI_StartState(self,ZS_ObservePlayer,0,"");
	};

	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;

	if(Mount_Up == TRUE)
	{
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	};
	if(Npc_IsPlayer(other) == TRUE)
	{
		if((POISONED == TRUE) && (ResistPoisonKnow == FALSE))
		{
			//Wld_PlayEffect("POISONED_FX",hero,hero,0,0,0,FALSE);
		}
		else 	if(LowHealth == TRUE)
		{
			//Wld_PlayEffect("LOWHEALTH_FX",hero,hero,0,0,0,FALSE);
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_431_Kardif)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_422_Salandril)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_970_Orlan)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sld_822_Raoul)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BDT_1098_Addon_Snaf)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1351_Addon_Samuel)) && (STARTPOCKERMATCH == 1))
	{
		Wld_StopEffect("DIALOGSCOPE_FX");
		STARTPOCKERMATCH = 2;
		b_pockerdialog_s1();
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_ObservePlayer_Game,1,"");
	};
	if(CipherGoDar == TRUE)
	{
		AI_SetWalkMode(Sld_803_Cipher,NPC_RUN);
		AI_GotoNpc(Sld_803_Cipher,Dar);
		B_Attack(Sld_803_Cipher,Dar,AR_NONE,0);
		CipherGoDar = FALSE;
	};
};
