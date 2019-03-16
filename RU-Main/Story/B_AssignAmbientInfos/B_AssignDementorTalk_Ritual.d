
func void B_AssignDementorTalk_Ritual()
{
	var int randy;
	var int randyspeech;

	randyspeech = Hlp_Random(2);

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if(Npc_HasItems(hero,ItAm_Prot_BlackEye_Mis) == FALSE)
	{
		AI_PlayAni(hero,"T_INSANE");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		Snd_Play3d(hero,"HERODEAD");
	};
	if(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Ты пришел слишком поздно.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Мы уничтожили Глаз Инноса, и теперь ему никогда не вернуть былую силу.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Теперь мы продемонстрируем всю тщетность твоих попыток бросить вызов Хозяину.
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry(TOPIC_INNOSEYE,"Эти жуткие ребята действуют мне на нервы. Они испортили Глаз Инноса. И теперь я не знаю, как мне починить его.");
		B_LogEntry_Quiet(TOPIC_TraitorPedro,"Я нашел Глаз Инноса. Но что-то нигде не видно Педро. Эти черные маги в сговоре с ним.");
		B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		randy = Hlp_Random(4);

		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Почувствуй нашу силу!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//За Хозяина!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Тебе нигде не скрыться.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Мы убьем тебя.
		};
	};

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,2,500);
	}
	else
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,1,500);
	};

	self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
};

func void B_AssignDementorTalk_Ritual_Exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_EnemyOverride] = FALSE;
};