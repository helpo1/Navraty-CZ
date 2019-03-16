
func void B_Attack(var C_Npc slf,var C_Npc oth,var int attack_reason,var int wait)
{
	slf.aivar[AIV_WaitBeforeAttack] = wait;
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(attack_reason == AR_SuddenEnemyInferno)
	{
		slf.aivar[AIV_EnemyOverride] = FALSE;
		Npc_SendPassivePerc(slf,PERC_ASSESSFIGHTSOUND,slf,oth);
	};
	if(Npc_IsInState(slf,ZS_Talk))
	{
		slf.aivar[AIV_INVINCIBLE] = FALSE;
		oth.aivar[AIV_INVINCIBLE] = FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(vlk_6108_salentin)) && (USESALENTINAMULET == TRUE))
	{
		AI_StartState(slf,ZS_Flee,0,"");
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_126_Haniar)) && (oth.guild == GIL_DEMON))
	{
		return;
	};
	if((Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Mil_316_Wambo)) && ((slf.guild == GIL_PAL) || (slf.guild == GIL_MIL)))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ass_126_Haniar)) && (TempleIsClear == FALSE) && (KnowPlaceMeeting == TRUE) && ((Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(NONE_1190_Assasin)) || Npc_IsPlayer(oth)))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_1190_Assasin)) && (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Ass_126_Haniar)) && (TempleIsClear == FALSE) && (KnowPlaceMeeting == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(dmt_1257_dementor))
	{
		if(MIS_BELIARHELPME == LOG_Running)
		{
			MIS_BELIARHELPME = LOG_OBSOLETE;
			Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
		};

		Wld_StopEffect("DEMENTOR_FX");
		Npc_ExchangeRoutine(slf,"Start");
		ZigosTeleportOn = TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_480_Fellan)) && (FELLANGORFIRSTMEET == TRUE))
	{
		if(FELLANGORTHIRDMEET == TRUE)
		{
			if(FELLANGORSAVE == FALSE)
			{
				if(MIS_BELIARHELPME == LOG_Running)
				{
					B_LogEntry(TOPIC_BELIARHELPME,"Porazil jsem Fellangora! Je čas vrátit se za Zigosem a vyzvednout si slíbenou odměnu.");
				};

				Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_Innoseye",slf,slf,0,0,0,FALSE);
				Wld_StopEffect("DEMENTOR_FX");
				Npc_ExchangeRoutine(slf,"TOT");
				slf.aivar[93] = FALSE;
				slf.flags = 0;
				Wld_PlayEffect("VOB_MAGICBURN",slf,slf,0,0,0,FALSE);
				B_Say(slf,hero,"$Dead");
				Npc_ChangeAttribute(slf,ATR_HITPOINTS,-slf.attribute[ATR_HITPOINTS_MAX]);
				INSANEKILLDONE = TRUE;
			}
			else
			{
				if(MIS_BELIARHELPME == LOG_Running)
				{
					B_LogEntry(TOPIC_BELIARHELPME,"Nechal jsem Fellangora jít! Teď bych asi se Zigosovou vděčností počítat neměl.");
				};
				Wld_StopEffect("DEMENTOR_FX");
				Npc_ExchangeRoutine(slf,"TOT");
				FellanTeleportOn = TRUE;
			};
		}
		else if(FELLANGORSECONDMEET == TRUE)
		{
			Wld_StopEffect("DEMENTOR_FX");
			Mdl_SetVisualBody(slf,"hum_body_Naked0",BodyTex_N,0,"Hum_Head_Bald",Face_N_Normal20,0,ITAR_Vlk_L);
			self.name[0] = "Rupert";
			FellanTeleportOn = TRUE;
		}
		else
		{
			Wld_StopEffect("DEMENTOR_FX");
			Mdl_SetVisualBody(slf,"Hum_Body_Babe0",BodyTexBabe_N,0,"Hum_Head_Babe",FaceBabe_N_GreyCloth,0,ITAR_BauBabe_L);
			self.name[0] = "Elena";
			FellanTeleportOn = TRUE;
		};
	};
	if(Npc_IsInState(slf,ZS_Attack) && (Hlp_GetInstanceID(oth) == slf.aivar[AIV_LASTTARGET]))
	{
		if(!C_NpcHasAttackReasonToKill(slf) && (attack_reason > slf.aivar[AIV_ATTACKREASON]))
		{
			slf.aivar[AIV_ATTACKREASON] = attack_reason;

			if(Npc_IsPlayer(oth))
			{
				slf.aivar[AIV_LastPlayerAR] = attack_reason;
			};
		};
	}
	else
	{
		slf.aivar[AIV_ATTACKREASON] = attack_reason;

		if(Npc_IsPlayer(oth))
		{
			slf.aivar[AIV_LastPlayerAR] = attack_reason;
		};
	};
	if(slf.aivar[AIV_ATTACKREASON] != AR_NONE)
	{
		if(slf.aivar[AIV_ATTACKREASON] == AR_SheepKiller)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_SHEEPKILLER);
		};
		if((slf.aivar[AIV_ATTACKREASON] == AR_ReactToDamage) || (slf.aivar[AIV_ATTACKREASON] == AR_ReactToWeapon) || (slf.aivar[AIV_ATTACKREASON] == AR_GuardStopsIntruder))
		{
			if(!C_NpcIsToughGuy(slf) && !(Npc_IsPlayer(oth) && (slf.npcType == NPCTYPE_FRIEND)))
			{
				B_MemorizePlayerCrime(slf,oth,CRIME_ATTACK);
			};
		};
		if((slf.aivar[AIV_ATTACKREASON] == AR_Theft) || (slf.aivar[AIV_ATTACKREASON] == AR_UseMob))
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_THEFT);
		};
		if(slf.aivar[AIV_ATTACKREASON] == AR_HumanMurderedHuman)
		{
			B_MemorizePlayerCrime(slf,oth,CRIME_MURDER);
		};
		if(Npc_GetAttitude(slf,oth) != ATT_HOSTILE)
		{
			B_SetAttitude(slf,ATT_ANGRY);
		};
	};
	if(Npc_IsInState(slf,ZS_Attack))
	{
		return;
	};
	if(slf.aivar[AIV_ATTACKREASON] == AR_KILL)
	{
		B_SetAttitude(slf,ATT_HOSTILE);
	};
	if(Npc_IsPlayer(oth))
	{
		slf.aivar[AIV_LastFightAgainstPlayer] = FIGHT_CANCEL;
		slf.aivar[AIV_LastFightComment] = FALSE;
	};
	if(!Npc_IsInState(slf,ZS_Talk))
	{
		Npc_ClearAIQueue(slf);
	};

	B_ClearPerceptions(slf);
	Npc_SetTarget(slf,oth);

	if(C_BodyStateContains(slf,BS_LIE))
	{
		AI_StartState(slf,ZS_Attack,1,"");
	}
	else
	{
		AI_StartState(slf,ZS_Attack,0,"");
	};
};

func void b_makeenemy(var C_Npc npcone,var C_Npc npctwo)
{
	B_Attack(npcone,npctwo,AR_KILL,0);
	B_Attack(npctwo,npcone,AR_KILL,0);
};

