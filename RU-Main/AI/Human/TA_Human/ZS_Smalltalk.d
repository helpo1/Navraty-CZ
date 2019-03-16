
const int SmallTalkFreq = 4;

var int CantarSpeechFT;
var int JoraSpeechFT;
var int HakonSpeechFT;
var int BaltramSpeechFT;
var int BorkaSpeechFT;
var int ZurisSpeechFT;

func void ZS_Smalltalk()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_444_Jack)) && (JackMeetLHGhost == TRUE) && (FinishStoryLH == FALSE))
	{
		Npc_PercDisable(self,PERC_ASSESSTALK);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Stefan)) && (LeaveMeetGhost == TRUE) && (FinishStoryLH == FALSE))
	{
		Npc_PercDisable(self,PERC_ASSESSTALK);
	};
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Smalltalk_Loop()
{
	B_CheckHealth(self);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pir_1398_addon_inextremo_announcer))
	{
		if((Npc_GetDistToWP(self,"NW_CITY_KILLWAMBO_01") < 500) && (CheckGillianWambo == TRUE))
		{
			if(Npc_HasItems(self,itar_asmal) == 0)
			{
				CreateInvItem(self,itar_asmal);
				AI_EquipArmor(self,itar_asmal);
			}
			else
			{
				AI_EquipArmor(self,itar_asmal);
			};		

			CheckGillianWambo = FALSE;
		};
	};
	if(Npc_IsOnFP(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= (SmallTalkFreq * 2))
		{
			Npc_PerceiveAll(self);

			if(Wld_DetectNpc(self,-1,ZS_Smalltalk,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SmallTalkFreq);
					B_TurnToNpc(self,other);

					if(CurrentLevel == PRIORATWORLD_ZEN)
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk_Ass();
							};
						};
					}
					else
					{
						if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
						{
							if(Npc_GetDistToNpc(self,hero) <= PERC_DIST_DIALOG)
							{
								B_Say_Smalltalk();
							};
						};
					};
				};
			};

			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func void ZS_Stand_TraderCity()
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

func int ZS_Stand_TraderCity_loop()
{
	var int random;
	var int Eventrandy;
	var int zufall;
	var int TradeAniTalk;

	B_CheckHealth(self);

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
		AI_Standup(self);
		AI_PlayAni(self,"T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		Npc_SetStateTime(self,0);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_434_Borka)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(17,0,18,0) == TRUE) || (Wld_IsTime(20,0,21,0) == TRUE) || (Wld_IsTime(23,0,1,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 12) || (BorkaSpeechFT == FALSE))
		{
			if(BorkaSpeechFT == FALSE)
			{
				BorkaSpeechFT = TRUE;
			};
			if(self.vars[5] > 7)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Borka(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_409_Zuris)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(10,0,11,0) == TRUE) || (Wld_IsTime(13,0,14,0) == TRUE) || (Wld_IsTime(16,0,18,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 12) || (ZurisSpeechFT == FALSE))
		{
			if(ZurisSpeechFT == FALSE)
			{
				ZurisSpeechFT = TRUE;
			};
			if(self.vars[5] > 9)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Zuris(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_410_Baltram)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(8,0,9,0) == TRUE) || (Wld_IsTime(11,0,12,0) == TRUE) || (Wld_IsTime(15,0,16,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 12) || (BaltramSpeechFT == FALSE))
		{
			if(BaltramSpeechFT == FALSE)
			{
				BaltramSpeechFT = TRUE;
			};
			if(self.vars[5] > 10)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Baltram(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_407_Hakon)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(9,0,10,0) == TRUE) || (Wld_IsTime(12,0,14,0) == TRUE) || (Wld_IsTime(16,0,17,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 10) || (HakonSpeechFT == FALSE))
		{
			if(HakonSpeechFT == FALSE)
			{
				HakonSpeechFT = TRUE;
			};
			if(self.vars[5] > 11)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Hakon(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_408_Jora)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(7,0,8,0) == TRUE) || (Wld_IsTime(10,0,11,0) == TRUE) || (Wld_IsTime(13,0,14,0) == TRUE) || (Wld_IsTime(16,0,17,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 10) || (JoraSpeechFT == FALSE))
		{
			if(JoraSpeechFT == FALSE)
			{
				JoraSpeechFT = TRUE;
			};
			if(self.vars[5] > 11)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Jora(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	}
	else if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_468_Canthar)) && (self.aivar[AIV_TAPOSITION] == ISINPOS) && ((Wld_IsTime(9,0,10,0) == TRUE) || (Wld_IsTime(11,0,12,0) == TRUE) || (Wld_IsTime(15,0,16,0) == TRUE)))
	{
		if((Npc_GetStateTime(self) > 10) || (CantarSpeechFT == FALSE))
		{
			if(CantarSpeechFT == FALSE)
			{
				CantarSpeechFT = TRUE;
			};
			if(self.vars[5] > 10)
			{
				self.vars[5] = 0;
			};

			if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
			{
				if(Npc_GetDistToNpc(self,hero) <= 1000)
				{
					B_Say_Cantar(self.vars[5]);
				};
			};

			self.vars[5] = self.vars[5] + 1;
			Npc_SetStateTime(self,0);

			TradeAniTalk = Hlp_Random(1000);

			if(self.vars[5] > 1)
			{
				if(TradeAniTalk >= 900)
				{
					AI_PlayAni(self,"T_LGUARD_SCRATCH");
				}
				else if(TradeAniTalk >= 800)
				{
					AI_PlayAni(self,"T_LGUARD_STRETCH");
				}
				else if(TradeAniTalk >= 700)
				{
					AI_PlayAni(self,"T_LGUARD_CHANGELEG");
				}
				else if(TradeAniTalk >= 600)
				{
					AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
				}
				else if(TradeAniTalk >= 500)
				{
					AI_PlayAni(self,"T_PERCEPTION");
				}
				else if(TradeAniTalk >= 400)
				{
					AI_PlayAni(self,"T_BORINGKICK");
				}
				else if(TradeAniTalk >= 300)
				{
					AI_PlayAni(self,"T_SEARCH");
				}
				else if(TradeAniTalk >= 200)
				{
					AI_PlayAni(self,"R_LEGSHAKE");
				}
				else if(TradeAniTalk >= 100)
				{
					AI_PlayAni(self,"R_SCRATCHLSHOULDER");
				}
				else
				{
					AI_PlayAni(self,"R_SCRATCHHEAD");
				};
			};
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_Stand_TraderCity_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
	AI_PlayAni(self,"T_LGUARD_2_STAND");

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_468_Canthar))
	{
		CantarSpeechFT = FALSE;
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_408_Jora))
	{
		JoraSpeechFT = FALSE;
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_407_Hakon))
	{
		HakonSpeechFT = FALSE;
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_410_Baltram))
	{
		BaltramSpeechFT = FALSE;
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_434_Borka))
	{
		BorkaSpeechFT = FALSE;
	};
};

const int SmallTalkFreq_DeathMatch= 4;

func void ZS_Smalltalk_DeathMatch()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_Smalltalk_DeathMatch_Loop()
{
	var int zufall;

	b_staminainvent();

	if(Npc_IsOnFP(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= (SmallTalkFreq_DeathMatch * 2))
		{
			Npc_PerceiveAll(self);

			if(Wld_DetectNpc(self,-1,ZS_Smalltalk_DeathMatch,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SmallTalkFreq_DeathMatch);
					B_TurnToNpc(self,other);
					zufall = Hlp_Random(8);

					if((PW_OnSide == FALSE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_126_Haniar)))
					{
						if(zufall == 0)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_01",BS_STAND);
						}
						else if(zufall == 1)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_02",BS_STAND);
						}
						else if(zufall == 2)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_03",BS_STAND);
						}
						else if(zufall == 3)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_04",BS_STAND);
						}
						else if(zufall == 4)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_05",BS_STAND);
						}
						else if(zufall == 5)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_06",BS_STAND);
						}
						else if(zufall == 6)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_07",BS_STAND);
						}
						else if(zufall == 7)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_08",BS_STAND);
						};

						B_Say_Smalltalk_DeathMatch();
						PW_OnSide = TRUE;
					}
					else if((PW_OnSide == TRUE) && (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ass_125_Tiamant)))
					{
						if(zufall == 0)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_01",BS_STAND);
						}
						else if(zufall == 1)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_02",BS_STAND);
						}
						else if(zufall == 2)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_03",BS_STAND);
						}
						else if(zufall == 3)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_04",BS_STAND);
						}
						else if(zufall == 4)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_05",BS_STAND);
						}
						else if(zufall == 5)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_06",BS_STAND);
						}
						else if(zufall == 6)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_07",BS_STAND);
						}
						else if(zufall == 7)
						{
							AI_PlayAniBS(self,"T_DIALOGGESTURE_08",BS_STAND);
						};

						B_Say_Smalltalk_DeathMatch();
						PW_OnSide = FALSE;
					};

					if(PW_DeathMatch_Count == 16)
					{
						B_Attack(self,other,AR_KILL,1);
						B_Attack(other,self,AR_KILL,1);	
					};
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_Smalltalk_DeathMatch_End()
{
	b_staminainvent();
};