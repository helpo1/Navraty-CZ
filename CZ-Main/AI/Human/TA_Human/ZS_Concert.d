var int Count_Concert;
var int RandomMuse;
var int Can_INEXTREMO;
var int MusicPlayNow;
var int OneTimeJesMus;
var int HeroAwayMus;

func void ZS_Concert()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	Count_Concert = 0;
	RandomMuse = 0;
	MusicPlayNow = FALSE;
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int ZS_Concert_Loop()
{
	B_CheckHealth(self);

	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1394_Addon_InExtremo_YellowPfeiffer))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IEDudelGelb) == FALSE)
				{
					CreateInvItem(self,ItMi_IEDudelGelb);
				};

				AI_UseItemToState(self,ItMi_IEDudelGelb,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IEDudelGelb,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IEHarfe) == FALSE)
				{
					CreateInvItem(self,ItMi_IEHarfe);
				};

				AI_UseItemToState(self,ItMi_IEHarfe,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IEHarfe,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1391_Addon_InExtremo_TheFlail))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IELaute) == FALSE)
				{
					CreateInvItem(self,ItMi_IELaute);
				};

				AI_UseItemToState(self,ItMi_IELaute,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IELaute,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1392_Addon_InExtremo_ThomasTheForger))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IECello) == FALSE)
				{
					CreateInvItem(self,ItMi_IECello);
				};

				AI_UseItemToState(self,ItMi_IECello,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IECello,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1393_Addon_InExtremo_Unicorn))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IELaute) == FALSE)
				{
					CreateInvItem(self,ItMi_IELaute);
				};

				AI_UseItemToState(self,ItMi_IELaute,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IELaute,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
		{
			if(MusicPlayNow == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IEDrumScheit) == FALSE)
				{
					CreateInvItem(self,ItMi_IEDrumScheit);
				};

				AI_UseItemToState(self,ItMi_IEDrumScheit,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IEDrumScheit,-1);
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1396_Addon_InExtremo_Flex))
		{
			if(Npc_GetDistToNpc(self,hero) < 3000)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IEDudelBlau) == FALSE)
				{
					CreateInvItem(self,ItMi_IEDudelBlau);
				};

				AI_UseItemToState(self,ItMi_IEDudelBlau,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IEDudelBlau,-1);
				Count_Concert = 0;
				RandomMuse = 0;
				MusicPlayNow = FALSE;
				return LOOP_CONTINUE;
			};
		}
		else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1398_ADDON_INEXTREMO_ANNOUNCER))
		{
			if(ConcertIsOn == TRUE)
			{
				AI_GotoFP(self,"STAND");

				if(Npc_HasItems(self,ItMi_IEDudelGelb) == FALSE)
				{
					CreateInvItem(self,ItMi_IEDudelGelb);
				};

				AI_UseItemToState(self,ItMi_IEDudelGelb,1);
				self.aivar[AIV_TAPOSITION] = ISINPOS;
			}
			else
			{
				AI_UseItemToState(self,ItMi_IEDudelGelb,-1);
				return LOOP_CONTINUE;
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1396_Addon_InExtremo_Flex)) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		if((MIS_JESPERMUSIC == LOG_SUCCESS) && (OneTimeJesMus == FALSE))
		{
			Count_Concert = 0;
			RandomMuse = 0;
			MusicPlayNow = FALSE;
			Can_INEXTREMO = FALSE;
			OneTimeJesMus = TRUE;
			IS_INEXTREMO_PLAYING = FALSE;
		};
		if((IS_INEXTREMO_PLAYING == FALSE) && ((ConcertIsOn == FALSE) || (ConcertBonus == TRUE)))
		{
			if(MusicPlayNow == FALSE)
			{
				RandomMuse = Hlp_Random(6);
				MusicPlayNow = TRUE;
				Count_Concert = 0;
			};
			if(RandomMuse == 0)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_00");	//
					};

					Npc_SetRefuseTalk(self,3000);
				}
				else if(Count_Concert >= 3500)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else if(RandomMuse == 1)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_01");	//
					};
				}
				else if(Count_Concert >= 3500)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else if(RandomMuse == 2)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_02");	//
					};
				}
				else if(Count_Concert >= 5000)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else if(RandomMuse == 3)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_03");	//
					};
				}
				else if(Count_Concert >= 3500)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else if(RandomMuse == 4)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_04");	//
					};
				}
				else if(Count_Concert >= 3500)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else if(RandomMuse == 5)
			{
				if(Count_Concert == 1)
				{
					if(Menu_ReadInt("AST","bCanKilMus") == TRUE)
					{
						AI_Output(self,self,"DAY_CONCERT_05");	//
					};
				}
				else if(Count_Concert >= 3500)
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
				};	

				Count_Concert += 1;
			}
			else
			{
				RandomMuse = 0;
				Count_Concert = 0;
				MusicPlayNow = FALSE;
			};
		}
		else
		{
			if(IS_INEXTREMO_PLAYING == TRUE)
			{
				if(Can_INEXTREMO == TRUE)
				{
					if(Count_Concert == 150)
					{
						AI_Output(self,self,"DAY_CONCERT_JESPER");	//
					}
					else if(Count_Concert >= 3500)
					{
						Count_Concert = 0;
						RandomMuse = 0;
						MusicPlayNow = FALSE;
						Can_INEXTREMO = FALSE;
						IS_INEXTREMO_PLAYING = FALSE;
					};	

					Count_Concert += 1;
				}
				else
				{
					Count_Concert = 0;
					RandomMuse = 0;
					MusicPlayNow = FALSE;
					Can_INEXTREMO = TRUE;
					return LOOP_END;
				};
			}
			else
			{
				RandomMuse = 0;
				Count_Concert = 0;
				MusicPlayNow = FALSE;
			};
		};
	};
	if(Wld_IsTime(16,30,17,30) && (Npc_GetDistToWP(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,"OCR_ANNOUNCER") <= 500) && (Npc_IsDead(PIR_1398_ADDON_INEXTREMO_ANNOUNCER) == FALSE) && (Npc_GetDistToWP(hero,"OCR_CHARLOTTE") <= 400) && (ConcertIsOn == FALSE) && (ConcertBonus == FALSE))
	{
		bManaBar = 0;
		bHealthBar = 0;
		CamModeOn = TRUE;
		ConcertIsOn = TRUE;
		B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"BonusStart");
		B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"BonusStart");
		B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"BonusStart");
		B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"BonusStart");
		B_StartOtherRoutine(PIR_1398_ADDON_INEXTREMO_ANNOUNCER,"BonusStart");
		Wld_SendTrigger("EVT_START_CONCERT");
		Snd_Play3d(self,"CS_CONCERT");
		Npc_ModifyBodyState(hero,0,BS_MOD_CONTROLLED);
	};

	return LOOP_CONTINUE;
};

func void ZS_Concert_End()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1394_Addon_InExtremo_YellowPfeiffer))
	{
		AI_UseItemToState(self,ItMi_IEDudelGelb,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1390_Addon_InExtremo_DrPymonte))
	{
		AI_UseItemToState(self,ItMi_IEHarfe,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1391_Addon_InExtremo_TheFlail))
	{
		AI_UseItemToState(self,ItMi_IEDrum,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1392_Addon_InExtremo_ThomasTheForger))
	{
		AI_UseItemToState(self,ItMi_IECello,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1393_Addon_InExtremo_Unicorn))
	{
		AI_UseItemToState(self,ItMi_IELaute,-1);
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1395_Addon_InExtremo_Lutter))
	{
		AI_UseItemToState(self,ItMi_IEDrumScheit,-1);
	};
};