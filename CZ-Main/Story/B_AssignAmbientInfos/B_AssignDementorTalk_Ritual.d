
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
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Prišel jsi příliš pozdě.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Zničili jsme Innosovo oko, takže již nikdy neobnoví svou sílu.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Nyní ti ukážeme zbytečnost tvého pokusu vyzvat Mistra.
		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry(TOPIC_INNOSEYE,"Tihle dotěrní chlápci mi začínají jít na nervy. Zničili Innosovo oko. Netuším jak ho opravit.");
		B_LogEntry_Quiet(TOPIC_TraitorPedro,"Našel jsem Innosovo oko, ale stále žádné stopy po Pedrovi. Ten temný mág tu musí být někde schovaný.");
		B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		randy = Hlp_Random(4);

		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Teď pocítíš naši sílu.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//Za Mistra.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Nikde se nám neschováš.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Zabijeme tě!
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