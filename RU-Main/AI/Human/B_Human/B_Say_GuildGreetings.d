
func void B_Say_GuildGreetings(var C_Npc slf,var C_Npc oth)
{
	var int zufall;
	var int zufalz;
	var int randmove;

	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Fighter_DI)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Fighter_DJG)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pc_fighter_li)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Fighter_NW_nach_DJG)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Fighter_NW_vor_DJG)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Fighter_OW)))
	{
		randmove = Hlp_Random(10);

		if(!C_BodyStateContains(slf,BS_SIT))
		{
			if(randmove == 0)
			{
				AI_PlayAni(slf,"T_GREETLEFT");
			}
			else if(randmove == 1)
			{
				AI_PlayAni(slf,"T_GREETRIGHT");
			}
			else if(randmove == 2)
			{
				AI_PlayAni(slf,"T_GREETCOOL");
			};
		};

		B_Say_Overlay(slf,oth,"$FRIENDLYGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Mage_DI)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pc_mage_li)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Mage_NW)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Mage_OW)))
	{
		randmove = Hlp_Random(10);

		if(!C_BodyStateContains(slf,BS_SIT))
		{
			if(randmove == 0)
			{
				AI_PlayAni(slf,"T_GREETLEFT");
			}
			else if(randmove == 1)
			{
				AI_PlayAni(slf,"T_GREETRIGHT");
			}
			else if(randmove == 2)
			{
				AI_PlayAni(slf,"T_GREETCOOL");
			};
		};

		B_Say_Overlay(slf,oth,"$FRIENDLYGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Psionic)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Psionic_DI)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pc_psionic_li)))
	{
		randmove = Hlp_Random(10);

		if(!C_BodyStateContains(slf,BS_SIT))
		{
			if(randmove == 0)
			{
				AI_PlayAni(slf,"T_GREETLEFT");
			}
			else if(randmove == 1)
			{
				AI_PlayAni(slf,"T_GREETRIGHT");
			}
			else if(randmove == 2)
			{
				AI_PlayAni(slf,"T_GREETCOOL");
			};
		};

		B_Say_Overlay(slf,oth,"$FRIENDLYGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Thief_DI)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(pc_thief_li)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Thief_NW)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_ThiefOW)))
	{
		randmove = Hlp_Random(10);

		if(!C_BodyStateContains(slf,BS_SIT))
		{
			if(randmove == 0)
			{
				AI_PlayAni(slf,"T_GREETLEFT");
			}
			else if(randmove == 1)
			{
				AI_PlayAni(slf,"T_GREETRIGHT");
			}
			else if(randmove == 2)
			{
				AI_PlayAni(slf,"T_GREETCOOL");
			};
		};

		B_Say_Overlay(slf,oth,"$FRIENDLYGREETINGS");
		return;
	};
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL) || (oth.guild == GIL_KDF)))
	{
		AI_PlayAni(slf,"T_GREETGRD");
		B_Say_Overlay(slf,oth,"$MILGREETINGS");
		return;
	};
	if((slf.guild == GIL_PAL) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF)))
	{
		AI_PlayAni(slf,"T_GREETGRD");
		B_Say_Overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDF) && (oth.guild == GIL_PAL))
	{
		B_Say_Overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDF) && (oth.guild == GIL_KDF))
	{
		B_Say_Overlay(slf,oth,"$KDFGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDF) && (oth.guild == GIL_NOV))
	{
		B_Say_Overlay(slf,oth,"$NOVGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDW) && (oth.guild == GIL_KDW))
	{
		B_Say_Overlay(slf,oth,"$KDWGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDW) && (oth.guild == GIL_NDW))
	{
		B_Say_Overlay(slf,oth,"$NOVGREETINGS");
		return;
	};
	if((slf.guild == GIL_SLD) && (oth.guild == GIL_SLD) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(SLD_800_Lee)))
	{
		B_Say_Overlay(slf,oth,"$SLDGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_Psionic)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_Psionic_DI)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(pc_psionic_li)))
	{
		if((slf.guild == GIL_SEK) && ((oth.guild == GIL_SEK) || (oth.guild == GIL_TPL) || (oth.guild == GIL_GUR)))
		{
			if((oth.guild == GIL_GUR) || (oth.guild == GIL_TPL))
			{
				AI_PlayAni(slf,"T_GREETNOV");
			};

			B_Say_Overlay(slf,oth,"$SEKGREETINGS");
			return;
		};
		if((slf.guild == GIL_TPL) && (oth.guild == GIL_SEK))
		{
			B_Say_Overlay(slf,oth,"$SEKGREETINGS");
			return;
		};
		if((slf.guild == GIL_TPL) && (oth.guild == GIL_TPL))
		{
			B_Say_Overlay(slf,oth,"$TPLGREETINGS");
			return;
		};
		if((slf.guild == GIL_TPL) && (oth.guild == GIL_GUR))
		{
			AI_PlayAni(slf,"T_GREETNOV");
			B_Say_Overlay(slf,oth,"$SEKGREETINGS");
			return;
		};
		if((slf.guild == GIL_GUR) && ((oth.guild == GIL_SEK) || (oth.guild == GIL_TPL)))
		{
			B_Say_Overlay(slf,oth,"$SEKGREETINGS");
			return;
		};
		if((slf.guild == GIL_GUR) && (oth.guild == GIL_GUR))
		{
			B_Say_Overlay(slf,oth,"$TPLGREETINGS");
			return;
		};
	}
	else
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_102_KREOL)) && (oth.guild == GIL_KDM) && (KREOL_MYTEACHER == TRUE))
	{
		B_Say_Overlay(slf,oth,"$KDMGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok)) && (Bartok_OrkGesagt == TRUE))
	{
		B_Bartok_ShitAnOrc();
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Koch))
	{
		B_Koch_Hackebeil();
		return;
	};
	if((Npc_CheckInfo(slf,1) == FALSE) && (Npc_GetAttitude(slf,oth) != ATT_FRIENDLY) && (slf.npcType != NPCTYPE_FRIEND))
	{
		if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4350_Priscila)) && ((AbigailPlaySong == FALSE) || (AbigailPlaySongDone == TRUE)))
		{
			B_Say_Overlay(slf,oth,"$WHATDOYOUWANT");
			return;
		}
		else if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SLD_10920_Loa)) && ((IS_INEXTREMO_LOA_PLAYING == FALSE) || (ConcertLoaBonus == TRUE)))
		{
			B_Say_Overlay(slf,oth,"$WHATDOYOUWANT");
			return;
		}
		else if((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(SLD_10920_Loa)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(VLK_4350_Priscila)))
		{
			zufalz = Hlp_Random(10);

			if(zufalz >= 5)
			{
				B_Say_Overlay(slf,oth,"$WHATDOYOUWANT");
			}
			else
			{
				if((self.voice == 16) || (self.voice == 17))
				{
					B_Say_Overlay(slf,oth,"$WHATDOYOUWANT");
				}
				else
				{
					B_Say_Overlay(slf,oth,"$ISAIDWHATDOYOUWANT");
				};
			};

			return;
		};
	};

	return;
};