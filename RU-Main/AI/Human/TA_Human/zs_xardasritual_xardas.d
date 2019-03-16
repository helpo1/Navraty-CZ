
func void zs_xardasritual_xardas()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	Npc_PercDisable(self,PERC_ASSESSTALK);
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_xardasritual_xardas_loop()
{
	var C_Npc outter1;
	var C_Npc outter2;
	var C_Npc outter3;
	var C_Npc outter4;
	var C_Npc outter5;
	var int guardreaktion;

	outter1 = Hlp_GetNpc(xardas_slave_01);
	outter2 = Hlp_GetNpc(xardas_slave_02);
	outter3 = Hlp_GetNpc(xardas_slave_03);
	outter4 = Hlp_GetNpc(none_117_nergal);

	if(!Npc_IsOnFP(self,"SMALLTALK") && Wld_IsFPAvailable(self,"SMALLTALK") && (NPCSTANONCE == FALSE))
	{
		NPCSTANONCE = TRUE;
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	if((Npc_GetStateTime(self) >= 2) && (RITUALTRIGGER == FALSE))
	{
		RITUALTRIGGER = TRUE;
		Npc_SetStateTime(self,0);
		Wld_SendTrigger("EVT_TRIGGER_XARDAS_RITUAL");
	};
	if(XARDASMADEMOVE00 == FALSE)
	{
		if((Npc_GetStateTime(self) >= 5) && (XARDASSUMMONSLAVES == FALSE))
		{
			Npc_SetStateTime(self,0);
			Wld_InsertNpc(xardas_slave_01,"NW_XARDAS_RITUAL_01");
			Wld_InsertNpc(xardas_slave_02,"NW_XARDAS_RITUAL_02");
			Wld_InsertNpc(xardas_slave_03,"NW_XARDAS_RITUAL_03");
			Wld_PlayEffect("spellFX_Teleport_RING",outter1,outter1,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Teleport_RING",outter2,outter2,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_Teleport_RING",outter3,outter3,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			XARDASSUMMONSLAVES = TRUE;
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
		if((Npc_GetStateTime(self) >= 10) && (XARDASMADEMOVE03 == FALSE) && (XARDASSUMMONSLAVES == TRUE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC4");
			Npc_SetStateTime(self,0);
			XARDASMADEMOVE03 = TRUE;
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
		if((Npc_GetStateTime(self) >= 7) && (XARDASMADEMOVE02 == FALSE) && (XARDASMADEMOVE03 == TRUE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC3");
			Npc_SetStateTime(self,0);
			XARDASMADEMOVE02 = TRUE;
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
		if((Npc_GetStateTime(self) >= 8) && (XARDASMADEMOVE01 == FALSE) && (XARDASMADEMOVE02 == TRUE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC4");
			Npc_SetStateTime(self,0);
			XARDASMADEMOVE01 = TRUE;
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
		if((Npc_GetStateTime(self) >= 8) && (XARDASMADEMOVE00 == FALSE) && (XARDASMADEMOVE01 == TRUE))
		{
			Wld_InsertNpc(none_117_nergal,"NW_XARDAS_SOUL");
			Wld_PlayEffect("spellFX_Teleport_RING",outter4,outter4,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			Npc_SetStateTime(self,0);
			XARDASMADEMOVE00 = TRUE;
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
	}
	else if(XARDASFINISHRITUAL == FALSE)
	{
		if(Npc_IsOnFP(self,"SMALLTALK"))
		{
			if(Npc_GetStateTime(self) >= 10)
			{
				Npc_PerceiveAll(self);
				if(Npc_GetStateTime(self) >= 80)
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
					Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
					Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
					AI_PlayAni(self,"T_PRACTICEMAGIC5");
					XARDASFINISHRITUAL = TRUE;
					Npc_SetStateTime(self,0);
					AI_Wait(self,1);
					return LOOP_CONTINUE;
				};
				if(Wld_DetectNpc(self,-1,zs_xardasritual_nergal,-1))
				{
					guardreaktion = Hlp_Random(1000);
					B_TurnToNpc(self,other);
					B_Say_Smalltalk();
					if(guardreaktion >= 900)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_11");
					}
					else if(guardreaktion >= 800)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_15");
					}
					else if(guardreaktion >= 700)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_16");
					}
					else if(guardreaktion >= 600)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_18");
					}
					else if(guardreaktion >= 500)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_21");
					}
					else if(guardreaktion >= 400)
					{
						AI_PlayAni(self,"T_DIALOGGESTURE_20");
					};
					AI_Wait(self,1);
					return LOOP_CONTINUE;
				};
			};
		}
		else if(Wld_IsFPAvailable(self,"SMALLTALK"))
		{
			AI_GotoFP(self,"SMALLTALK");
			AI_Standup(self);
			AI_AlignToFP(self);
			return LOOP_CONTINUE;
		};
	}
	else
	{
		if((Npc_GetStateTime(self) >= 5) && (XARDASMADEFINISHMOVE == FALSE))
		{
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			XARDASMADEFINISHMOVE = TRUE;
			B_KillNpc(xardas_slave_01);
			B_KillNpc(xardas_slave_02);
			B_KillNpc(xardas_slave_03);
			Npc_SetStateTime(self,0);
			AI_Wait(self,1);
			return LOOP_CONTINUE;
		};
		if((Npc_GetStateTime(self) >= 5) && (XARDASMADEFINISHMOVE == TRUE))
		{
			Npc_ExchangeRoutine(none_117_nergal,"TOT");
			B_KillNpc(none_117_nergal);
			Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
			Npc_ExchangeRoutine(self,"WaitForPlayerRitual");
			XARDASFINISHRITUALOK = TRUE;
			return LOOP_END;
		};
	};

	return LOOP_CONTINUE;
};

func void zs_xardasritual_xardas_end()
{
	b_staminainvent();
};

var int XarSpeech;
var int PyrSpeech;
var int VatSpeech;
var int FTMovwSpeechXar;
var int FTMovwSpeechPyr;
var int FTMovwSpeechVat;
var int TempXarSpeech;
var int TempPyrSpeech;
var int VatrasCanTellHere;
var int XarSpeechStart;
var C_Npc Mage_Xars;
var C_Npc Mage_Pyrs;
var C_Npc Mage_Vats;

func void ZS_MageSpeech()
{
	Perception_Set_Normal();
	B_ResetAll(self);
	b_staminainvent();
	AI_SetWalkMode(self,NPC_WALK);

	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};

	Mage_Xars = Hlp_GetNpc(NONE_100_Xardas);
	Mage_Pyrs = Hlp_GetNpc(KDF_500_Pyrokar);
	Mage_Vats = Hlp_GetNpc(VLK_439_Vatras);
};

func int ZS_MageSpeech_Loop()
{
	var int zufall;

	if(MageSpeechEnd == TRUE)
	{
		return LOOP_END;
	};
	if(Npc_IsOnFP(self,"PREACH"))
	{
		AI_AlignToFP(self);
	}
	else if(Wld_IsFPAvailable(self,"PREACH"))
	{
		AI_GotoFP(self,"PREACH");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_439_Vatras)) && (VatrasCanTellHere == TRUE))
	{
		if(VatSpeech == FALSE)
		{
			AI_Output(Mage_Vats,Mage_Vats,"DIA_Vatras_EndSpeech_01");	//
			AI_Wait(Mage_Vats,3);
			VatSpeech += 1;
		}
		else
		{
			return LOOP_END;
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) && (XarSpeechStart == TRUE))
	{
		if((XarSpeech > PyrSpeech) && (XarSpeech < 20))
		{
			if(TempXarSpeech == FALSE)
			{
				B_Preach_MageSpeech_Xar(XarSpeech);
				AI_Wait(self,1);
				TempXarSpeech += 1;
			}
			else
			{
				PyrSpeech = XarSpeech + 1;
				TempXarSpeech = FALSE;
			};
		}
		else
		{
			if((XarSpeech == 19) && (VatrasCanTellHere == FALSE))
			{
				VatrasCanTellHere = TRUE;
			};
		};
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_500_Pyrokar)) && (XarSpeechStart == TRUE))
	{
		if((XarSpeech < PyrSpeech) && (PyrSpeech < 19))
		{
			if(TempPyrSpeech == FALSE)
			{
				B_Preach_MageSpeech_Pyr(PyrSpeech);
				AI_Wait(self,1);
				TempPyrSpeech += 1;
			}
			else
			{
				XarSpeech = PyrSpeech + 1;
				TempPyrSpeech = FALSE;
			};
		};
	};	
	if((XarSpeechStart == FALSE) && Npc_IsOnFP(Mage_Xars,"PREACH") && Npc_IsOnFP(Mage_Pyrs,"PREACH"))
	{
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(NONE_100_Xardas)) && (FTMovwSpeechXar == FALSE))
		{
			B_TurnToNpc(Mage_Xars,Mage_Pyrs);
			FTMovwSpeechXar = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDF_500_Pyrokar)) && (FTMovwSpeechPyr == FALSE))
		{
			B_TurnToNpc(Mage_Pyrs,Mage_Xars);
			AI_PlayAni(self,"T_STAND_2_LGUARD");
			FTMovwSpeechPyr = TRUE;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_439_Vatras)) && (FTMovwSpeechVat == FALSE))
		{
			AI_PlayAni(self,"T_STAND_2_HGUARD");
			FTMovwSpeechVat = TRUE;
		};

		if((FTMovwSpeechXar == TRUE) && (FTMovwSpeechPyr == TRUE) && (FTMovwSpeechVat == TRUE))
		{
			XarSpeechStart = TRUE;
			XarSpeech += 1;
			PyrSpeech = FALSE;
			VatSpeech = FALSE;
		};
	};

	return LOOP_CONTINUE;
};

func void ZS_MageSpeech_End()
{
	b_staminainvent();
	bManaBar = 1;
	bHealthBar = 1;
	CamModeOn = FALSE;
	Mage_Xars.aivar[AIV_INVINCIBLE] = FALSE;
	Mage_Pyrs.aivar[AIV_INVINCIBLE] = FALSE;
	Mage_Vats.aivar[AIV_INVINCIBLE] = FALSE;
	Mage_Xars.aivar[AIV_EnemyOverride] = FALSE;
	Mage_Pyrs.aivar[AIV_EnemyOverride] = FALSE;
	Mage_Vats.aivar[AIV_EnemyOverride] = FALSE;
	Npc_ModifyBodyState(hero,BS_MOD_CONTROLLED,0);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
	MageSpeechEnd = TRUE;
	AI_PlayAni(Mage_Pyrs,"T_LGUARD_2_STAND");
	AI_PlayAni(Mage_Vats,"T_HGUARD_2_STAND");
};