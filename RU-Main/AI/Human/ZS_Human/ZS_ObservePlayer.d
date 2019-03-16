
func void ZS_ObservePlayer()
{
	Perception_Set_Normal();
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_LookAtNpc(self,other);
		B_TurnToNpc(self,other);
	}
	else
	{
		B_LookAtNpc(self,other);
	};
	if(Npc_WasInState(self,ZS_Sleep))
	{
		if(self.vars[0] == FALSE)
		{
			B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
		};
	};
	if((self.aivar[AIV_SeenLeftRoom] == TRUE) && Npc_IsPlayer(other))
	{
		self.aivar[AIV_SeenLeftRoom] = FALSE;

		if(Player_LeftRoomComment == FALSE)
		{
			if((self.guild != GIL_SLD) && (self.guild != GIL_DJG) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_413_Bosper)))
			{
				if(self.vars[0] == FALSE)
				{
					B_Say(self,other,"$WHATDIDYOUDOINTHERE");
				};
			}
			else
			{
				if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_413_Bosper))
				{
					if(CanTeachTownMaster == FALSE)
					{
						if(self.vars[0] == FALSE)
						{
							B_Say(self,other,"$WHATDIDYOUDOINTHERE");
						};
					};
				};
			};

			Player_LeftRoomComment = TRUE;
		};
	}
	else if((Hlp_Random(100) > 90) && Npc_IsPlayer(other) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY) && (self.npcType != NPCTYPE_FRIEND))
	{
		if((other.guild == GIL_SLD) && (KAPITELORCATC == FALSE) && (CurrentLevel == NEWWORLD_ZEN) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
		{
			if(self.vars[0] == FALSE)
			{
				B_Say(self,other,"$MILANGRYSLD");
			};
		};
		if((other.guild == GIL_SLD) && (KAPITELORCATC == FALSE) && (CurrentLevel == PALADINFORT_ZEN) && ((self.guild == GIL_PAL) || (self.guild == GIL_MIL)))
		{
			if(self.vars[0] == FALSE)
			{
				B_Say(self,other,"$MILANGRYSLD");
			};
		};
		if((other.guild == GIL_MIL) && (KAPITELORCATC == FALSE) && (self.guild == GIL_SLD) && (Npc_GetDistToWP(other,"NW_BIGFARM_CAMPON_KDF_05") < 7000))
		{
			if(self.vars[0] == FALSE)
			{
				B_Say(self,other,"$SLDANGRYMIL");
			};
		};
		if((other.guild == GIL_PAL) && (KAPITELORCATC == FALSE) && (self.guild == GIL_SLD) && (Npc_GetDistToWP(other,"NW_BIGFARM_CAMPON_KDF_05") < 7000))
		{
			if(self.vars[0] == FALSE)
			{
				B_Say(self,other,"$SLDANGRYPAL");
			};
		};
		if((other.guild == GIL_KDM) && (KAPITELORCATC == FALSE) && (CurrentLevel == NEWWORLD_ZEN) && (self.guild == GIL_KDF))
		{
			if(self.vars[0] == FALSE)
			{
				B_Say(self,other,"$KDFANGRYKDM");
			};
		};	
	};

	self.aivar[AIV_StateTime] = Hlp_Random(2) + 1;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_ObservePlayer_Loop()
{
	var int random;
	var int randomspch;

	B_CheckHealth(self);

	if(Npc_IsPlayer(other) && (self.guild != GIL_KDM) && (self.guild != GIL_DMT) && (HeroDrunk == TRUE) && (CurrentLevel != PRIORATWORLD_ZEN))
	{
		if(!C_BodyStateContains(other,BS_JUMP))
		{
			random = Hlp_Random(2000);
			AI_PointAtNpc(self,other);
			AI_StopPointAt(self);

			if((random <= 10) && (self.voice != 16) && (self.voice != 17))
			{
				randomspch = Hlp_Random(14);

				if(randomspch == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_11");
					Snd_Play3d(self,"HERO_DRUNK_01");
				}
				else if(randomspch == 1)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_15");
					Snd_Play3d(self,"HERO_DRUNK_08");
				}
				else if(randomspch == 2)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_16");
					Snd_Play3d(self,"HERO_DRUNK_02");
				}
				else if(randomspch == 3)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_17");
					Snd_Play3d(self,"HERO_DRUNK_09");
				}
				else if(randomspch == 4)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_21");
					Snd_Play3d(self,"HERO_DRUNK_03");
				}
				else if(randomspch == 5)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_20");
					Snd_Play3d(self,"HERO_DRUNK_10");
				}
				else if(randomspch == 6)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_11");
					Snd_Play3d(self,"HERO_DRUNK_04");
				}
				else if(randomspch == 7)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_15");
					Snd_Play3d(self,"HERO_DRUNK_11");
				}
				else if(randomspch == 8)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_16");
					Snd_Play3d(self,"HERO_DRUNK_05");
				}
				else if(randomspch == 9)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_17");
					Snd_Play3d(self,"HERO_DRUNK_12");
				}
				else if(randomspch == 10)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_21");
					Snd_Play3d(self,"HERO_DRUNK_06");
				}
				else if(randomspch == 11)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_10");
					Snd_Play3d(self,"HERO_DRUNK_13");
				}
				else if(randomspch == 12)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_11");
					Snd_Play3d(self,"HERO_DRUNK_07");
				}
				else if(randomspch == 13)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_15");
					Snd_Play3d(self,"HERO_DRUNK_14");
				};
			};
		}
		else
		{
			B_Attack(self,other,AR_ClearRoom,0);
			return LOOP_END;
		};
	};
	if(C_BodyStateContains(other,BS_SNEAK) && (Player_SneakerComment == FALSE))
	{
		Player_SneakerComment = TRUE;

		if(self.vars[0] == FALSE)
		{
			AI_PointAtNpc(self,other);
			B_Say(self,other,"$WHATSTHISSUPPOSEDTOBE");
			AI_StopPointAt(self);
		};

		Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	};
	if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
	{
		if(!C_BodyStateContains(self,BS_SIT))
		{
			B_TurnToNpc(self,other);
		};
		self.aivar[AIV_StateTime] = Hlp_Random(2) + 1;
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
	return LOOP_CONTINUE;
};

func void ZS_ObservePlayer_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	B_StopLookAt(self);
};

var int PlayMusicGame;

func void ZS_ObservePlayer_Game()
{
	Perception_Set_Normal();
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_LookAtNpc(self,other);
		B_TurnToNpc(self,other);
	}
	else
	{
		B_LookAtNpc(self,other);
	};

	PlayMusicGame = FALSE;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_ObservePlayer_Game_Loop()
{
	var int random;
	var int randomspch;

	B_CheckHealth(self);

	if(PlayMusicGame == FALSE)
	{
		AI_Output(self,self,"InGamePlay");	//
		PlayMusicGame = TRUE;
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else if(STARTPOCKERMATCH == FALSE)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};

	return LOOP_CONTINUE;
};

func void ZS_ObservePlayer_Game_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	B_StopLookAt(self);
	PlayMusicGame = FALSE;
};

func void ZS_CommentNakedHero()
{
	Perception_Set_Normal();
	b_staminainvent();

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_LookAtNpc(self,other);
		B_TurnToNpc(self,other);
	}
	else
	{
		B_LookAtNpc(self,other);
	};
	if(Npc_WasInState(self,ZS_Sleep))
	{
		if(self.vars[0] == FALSE)
		{
			B_Say(self,other,"$YOUDISTURBEDMYSLUMBER");
		};
	};
	if((self.voice == 16) || (self.voice == 17))
	{
		B_Say(self,other,"$SPAREME");
	}
	else
	{
		if((self.voice == 6) || (self.voice == 8))
		{
			B_Say(self,other,"$ADDON_WRONGARMOR");
		}
		else
		{
			B_Say(self,other,"$ADDON_NOARMOR_BDT");
		};
	};

	self.aivar[AIV_StateTime] = Hlp_Random(2) + 1;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_CommentNakedHero_Loop()
{
	var int random;
	var int randomspch;

	B_CheckHealth(self);

	if(C_BodyStateContains(other,BS_SNEAK) && (Player_SneakerComment == FALSE))
	{
		Player_SneakerComment = TRUE;

		if(self.vars[0] == FALSE)
		{
			AI_PointAtNpc(self,other);
			B_Say(self,other,"$WHATSTHISSUPPOSEDTOBE");
			AI_StopPointAt(self);
		};

		Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	};
	if(Npc_GetStateTime(self) > self.aivar[AIV_StateTime])
	{
		if(!C_BodyStateContains(self,BS_SIT))
		{
			B_TurnToNpc(self,other);
		};
		self.aivar[AIV_StateTime] = Hlp_Random(2) + 1;
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
	return LOOP_CONTINUE;
};

func void ZS_CommentNakedHero_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	B_StopLookAt(self);
};