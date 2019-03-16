var int TrollAwake;

func void ZS_MM_Rtn_Rest()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crypt_Skeleton_Lord))
	{
		AI_Teleport(self,"EVT_CRYPT_ROOM_02_SPAWNMAIN");
	}
	else if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_Rest_Loop()
{
	var int randomMove;
	var int randomspeech;

	b_staminainvent_monster(self);

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Draconian_Minion)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Skeleton_Lord_UD)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Azgalor)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(StoneGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Dragon)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Dragon)))
	{
		DragonRegenFast = TRUE;
	};
	if((self.guild == GIL_Stoneguardian) && (RavenIsDead == TRUE) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedGuardian))
	{
		B_KillNpc(self);
	};
	if(!Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],0) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(TROLL_YOUNG_PW))
		{
			AI_StartState(self,ZS_MM_AllScheduler,1,"");
			return LOOP_END;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		}
		else if((self.guild == GIL_ORC) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCBOWMEN) && Wld_IsTime(22,0,6,0))
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
			randomMove = Hlp_Random(3);

			if(randomMove == 0)
			{
				AI_PlayAni(self,"R_ROAM1");
			};
			if(randomMove == 1)
			{
				AI_PlayAni(self,"R_ROAM2");
			};
			if(randomMove == 2)
			{
				AI_PlayAni(self,"R_ROAM3");
			};
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
			if((self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS) && ((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech <= 25)
				{
					AI_RemoveWeapon(self);
					if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
					{
						CreateInvItem(self,itfo_addon_orcrum);
					};
					AI_UseItem(self,itfo_addon_orcrum);
					AI_SetWalkMode(self,NPC_WALK);
				};
				if(randomspeech == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_01");
					Snd_Play3d(self,"ORC_Happy");
				}
				else if(randomspeech == 10)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_02");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 20)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_03");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 30)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_04");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 40)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_05");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 50)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_06");
					Snd_Play3d(self,"ORC_Angry");
				}
				else if(randomspeech == 60)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_07");
					Snd_Play3d(self,"ORC_Frightened");
				}
				else if(randomspeech == 70)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_08");
					Snd_Play3d(self,"ORC_Angry");
				};
			};
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
			if((self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS) && ((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech <= 25)
				{
					AI_RemoveWeapon(self);
					if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
					{
						CreateInvItem(self,itfo_addon_orcrum);
					};
					AI_UseItem(self,itfo_addon_orcrum);
					AI_SetWalkMode(self,NPC_WALK);
				};
				if(randomspeech == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_01");
					Snd_Play3d(self,"ORC_Happy");
				}
				else if(randomspeech == 10)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_02");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 20)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_03");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 30)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_04");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 40)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_05");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 50)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_06");
					Snd_Play3d(self,"ORC_Angry");
				}
				else if(randomspeech == 60)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_07");
					Snd_Play3d(self,"ORC_Frightened");
				}
				else if(randomspeech == 70)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_08");
					Snd_Play3d(self,"ORC_Angry");
				};
			};
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
			if((self.aivar[AIV_MM_REAL_ID] != ID_ORCBF) && (self.aivar[AIV_MM_REAL_ID] != ID_ORCSHAMAN) && (self.flags != ORCTEMPLENPCFLAGS) && ((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech <= 25)
				{
					AI_RemoveWeapon(self);
					if(Npc_HasItems(self,itfo_addon_orcrum) < 1)
					{
						CreateInvItem(self,itfo_addon_orcrum);
					};
					AI_UseItem(self,itfo_addon_orcrum);
					AI_SetWalkMode(self,NPC_WALK);
				};
				if(randomspeech == 0)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_01");
					Snd_Play3d(self,"ORC_Happy");
				}
				else if(randomspeech == 10)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_02");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 20)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_03");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 30)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_04");
					Snd_Play3d(self,"ORC_Die_A1");
				}
				else if(randomspeech == 40)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_05");
					Snd_Play3d(self,"ORC_Die_A2");
				}
				else if(randomspeech == 50)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_06");
					Snd_Play3d(self,"ORC_Angry");
				}
				else if(randomspeech == 60)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_07");
					Snd_Play3d(self,"ORC_Frightened");
				}
				else if(randomspeech == 70)
				{
					AI_PlayAni(self,"T_DIALOGGESTURE_08");
					Snd_Play3d(self,"ORC_Angry");
				};
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(TROLL_YOUNG_PW)) && (TrollYoungPW == FALSE) && (PoisonResult == FALSE))
	{
		if((TrollEatMeat == TRUE) && (PoisonResult == FALSE))
		{
			if(TrollCountStep <= 1)
			{
				AI_GotoWP(self,"PW_TROLL_MEAT");
			}
			else if(TrollCountStep == 5)
			{
				AI_PlayAni(self,"T_WARN");
			}
			else if(TrollCountStep == 10)
			{
				if(PoisonDoneFull == TRUE)
				{
					AI_GotoWP(self,"PW_YOUNGTROLL");
					B_LogEntry(TOPIC_PW_PoisonNrozas,"Тролль понюхал наживку и не стал ее есть. Сдается мне, что я перестарался с количеством вылитого яда...");
					PoisonResult = TRUE;
				};
			}
			else if(TrollCountStep == 13)
			{
				AI_PlayAni(self,"T_FISTATTACKMOVE");
			}
			else if(TrollCountStep == 15)
			{
				if(PoisonDoneHalf == TRUE)
				{
					Wld_SendTrigger("EVT_TROLL_POISON");
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
					B_LogEntry(TOPIC_PW_PoisonNrozas,"Тролль съел наживку и мгновенно умер! Кажется, у меня все получилось...");
					CreateInvItems(self,ItAt_TrollPoisonTongue,1);
					PoisonResult = TRUE;
				}
				else if(PoisonDoneOneTear == TRUE)
				{
					Wld_SendTrigger("EVT_TROLL_POISON");
					B_LogEntry(TOPIC_PW_PoisonNrozas,"Тролль целиком заглотил наживку, но яд на него не подействовал. По всей видимости, я добавил слишком мало яда...Надо срочно поговорить с Гонсалесом, что теперь мне делать!");
					PoisonResult = TRUE;
				};
			};

			TrollCountStep = TrollCountStep + 1;
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Rest_End()
{
	b_staminainvent();
};

func void ZS_MM_Rtn_HaniarDemon()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();

	Wld_PlayEffect("SPELLFX_TELEPORT_RING",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};

	AI_AlignToWP(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int ZS_MM_Rtn_HaniarDemon_Loop()
{
	var int randomMove;

	b_staminainvent_monster(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		};

		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};

	if((self.aivar[AIV_TAPOSITION] == ISINPOS) && (Npc_GetStateTime(self) >= 5))
	{
		randomMove = Hlp_Random(3);
	
		if(randomMove == 1)
		{
			AI_PlayAni(self,"T_WARN");
			Wld_PlayEffect("SPELLFX_TELEPORT_RING",self,self,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		};

		Npc_SetStateTime(self,0);
	};

	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_HaniarDemon_End()
{
	b_staminainvent();
};
