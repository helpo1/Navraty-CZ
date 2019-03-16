
func void zs_mm_rtn_sleletonmage()
{
	Perception_Set_Monster_Rtn();
	b_staminainvent();
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_sleletonmage_loop()
{
	var int randomMove;
	var int randomspeech;

	b_staminainvent_monster(self);

	if(!Wld_IsTime(self.aivar[AIV_MM_RestStart],0,self.aivar[AIV_MM_RestEnd],0) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
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
	}
	else if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(3);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
			if((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech == 10)
				{
					Snd_Play3d(self,"ORC_Angry");
				};
				if(randomspeech == 20)
				{
					Snd_Play3d(self,"ORC_AMBIENT_SHORT");
				};
				if(randomspeech == 30)
				{
					Snd_Play3d(self,"ORC_Frightened");
				};
				if(randomspeech == 40)
				{
					Snd_Play3d(self,"ORC_Happy");
				};
				if(randomspeech == 50)
				{
					Snd_Play3d(self,"ORC_SPEECH_01");
				};
				if(randomspeech == 60)
				{
					Snd_Play3d(self,"ORC_SPEECH_02");
				};
				if(randomspeech == 70)
				{
					Snd_Play3d(self,"ORC_SPEECH_03");
				};
			};
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
			if((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech == 10)
				{
					Snd_Play3d(self,"ORC_Angry");
				};
				if(randomspeech == 20)
				{
					Snd_Play3d(self,"ORC_AMBIENT_SHORT");
				};
				if(randomspeech == 30)
				{
					Snd_Play3d(self,"ORC_Frightened");
				};
				if(randomspeech == 40)
				{
					Snd_Play3d(self,"ORC_Happy");
				};
				if(randomspeech == 50)
				{
					Snd_Play3d(self,"ORC_SPEECH_01");
				};
				if(randomspeech == 60)
				{
					Snd_Play3d(self,"ORC_SPEECH_02");
				};
				if(randomspeech == 70)
				{
					Snd_Play3d(self,"ORC_SPEECH_03");
				};
			};
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
			if((self.aivar[AIV_MM_REAL_ID] == ID_ORCBOWMEN) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE) || (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR))
			{
				randomspeech = Hlp_Random(100);
				if(randomspeech == 10)
				{
					Snd_Play3d(self,"ORC_Angry");
				};
				if(randomspeech == 20)
				{
					Snd_Play3d(self,"ORC_AMBIENT_SHORT");
				};
				if(randomspeech == 30)
				{
					Snd_Play3d(self,"ORC_Frightened");
				};
				if(randomspeech == 40)
				{
					Snd_Play3d(self,"ORC_Happy");
				};
				if(randomspeech == 50)
				{
					Snd_Play3d(self,"ORC_SPEECH_01");
				};
				if(randomspeech == 60)
				{
					Snd_Play3d(self,"ORC_SPEECH_02");
				};
				if(randomspeech == 70)
				{
					Snd_Play3d(self,"ORC_SPEECH_03");
				};
			};
		};
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_sleletonmage_end()
{
	b_staminainvent();
};

