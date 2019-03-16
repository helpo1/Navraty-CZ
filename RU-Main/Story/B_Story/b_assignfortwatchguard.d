
func void b_assignfortwatchguard(var C_Npc watchguardfort)
{
	if(GRANTTOFORT == TRUE)
	{
		if(watchguardfort.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Мы следим за тобой. Помни об этом.
		};
		if(watchguardfort.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Не создавай здесь проблем, хорошо?
		};
		if(watchguardfort.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//И не надумай ничего красть, ясно?
		};

		AI_StopProcessInfos(watchguardfort);
		Npc_SetRefuseTalk(watchguardfort,60);
		Npc_SetRefuseTalk(pal_198_ritter,60);
		Npc_SetRefuseTalk(pal_197_ritter,60);
		Npc_SetRefuseTalk(pal_196_ritter,60);
		Npc_SetRefuseTalk(pal_195_ritter,60);
		Npc_SetRefuseTalk(pal_194_ritter,60);
		Npc_SetRefuseTalk(pal_193_ritter,60);
		Npc_SetRefuseTalk(pal_192_ritter,60);
		Npc_SetRefuseTalk(pal_191_ritter,60);
		Npc_SetRefuseTalk(pal_190_ritter,60);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(watchguardfort,20);
		Npc_SetRefuseTalk(pal_198_ritter,60);
		Npc_SetRefuseTalk(pal_197_ritter,60);
		Npc_SetRefuseTalk(pal_196_ritter,60);
		Npc_SetRefuseTalk(pal_195_ritter,60);
		Npc_SetRefuseTalk(pal_194_ritter,60);
		Npc_SetRefuseTalk(pal_193_ritter,60);
		Npc_SetRefuseTalk(pal_192_ritter,60);
		Npc_SetRefuseTalk(pal_191_ritter,60);
		Npc_SetRefuseTalk(pal_190_ritter,60);
	};
};

func void b_assignfortwatchguardtalk(var C_Npc watchguardfort)
{
	b_assignfortwatchguard(watchguardfort);
};

func int b_assignfortwatchguardinfoconditions(var C_Npc watchguardfort)
{
	if((Npc_RefuseTalk(self) == FALSE) && (VarusMeet == FALSE))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (Kapitel <= 4) && (VarusMeet == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

