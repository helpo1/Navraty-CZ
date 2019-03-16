
func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if((MIS_ShipIsFree == TRUE) || (MIS_SCvisitShip == LOG_Running))
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//Sledujeme tě. Nezapomínej na to.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Dokud jsi tady, nedělej žádné potíže.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Ani nepomysli na to, že bys tu mohl něco ukrást, rozumíš?
		};
		AI_StopProcessInfos(Schiffswache);
		Npc_SetRefuseTalk(Schiffswache,60);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,60);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,60);
	}
	else	if(Wld_IsTime(7,0,9,30) || Wld_IsTime(18,0,20,30))
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	}
	else
	{
		B_Say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,1);
		Npc_SetRefuseTalk(Schiffswache,20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_221_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache,20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache,20);
	};
};

func void B_AssignSchiffswachenInfos(var C_Npc Schiffswache)
{
	if(MIS_OCGateOpen == TRUE)
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//Ti zatracení skřeti zaútočili na Garondův hrad. Musíme jednat rychle.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//Jestli někdy dostaneme toho zrádce, co otevřel hlavní bránu do hradu, uděláme s ním krátký proces.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//Už nemůžeme déle čekat. Chlapi v Hornickém údolí potřebují naši pomoc dřív, než zaútočí další vlna skřetů.
		};
	}
	else
	{
		if(Schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond žádá úplnou mobilizaci. Do Hornického údolí se vydáme co nevidět.
		};
		if(Schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//Skřeti musí dostat pořádnou lekci.
		};
		if(Schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//Nemůžu se dočkat, až těm skřetům dáme co proto. Vyrazíme každou chvíli.
		};
	};
	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if(Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos(Schiffswache);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if((Kapitel < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCvisitShip != LOG_Running) && (Npc_IsInState(self,ZS_Stand_Plaz) == FALSE))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

