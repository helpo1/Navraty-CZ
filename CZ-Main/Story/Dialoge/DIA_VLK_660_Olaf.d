instance DIA_VLK_664_Masbo_EXIT(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 999;
	condition = DIA_VLK_664_Masbo_EXIT_Condition;
	information = DIA_VLK_664_Masbo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_664_Masbo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_664_Masbo_Hallo(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 1;
	condition = DIA_VLK_664_Masbo_Hallo_Condition;
	information = DIA_VLK_664_Masbo_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Hallo_Info()
{
	AI_Output(self,other,"DIA_VLK_664_Masbo_Hallo_01_00");	//Hej chlape, chceš bojovat?
};

instance DIA_VLK_664_Masbo_Intro(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Intro_Condition;
	information = DIA_VLK_664_Masbo_Intro_Info;
	permanent = FALSE;
	description = "Co tím myslíš?";
};

func int DIA_VLK_664_Masbo_Intro_Condition()
{
	return TRUE;
};

func void DIA_VLK_664_Masbo_Intro_Info()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_01");	//Jen to, že si můžeš dobře vydělat, jestli to umíš s pěstmi.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_02");	//Vidíš ty chlapy? Tak to jsou nejlepší bojovníci Khorinisu!
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_03");	//Jestli někoho z nich porazíš, vyděláš si hodně zlata.
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_04");	//To zní dobře!
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_05");	//To si piš! Máme však jedno pravidlo - ten, kdo chce bojovat, musí nejprve zaplatit malý obnos v hotovosti.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_06");	//Vítěz bere oba vklady. No a poražený má smůlu.
	AI_Output(other,self,"DIA_VLK_664_Masbo_Intro_01_07");	//A kolik je vklad?
	AI_Output(self,other,"DIA_VLK_664_Masbo_Intro_01_08");	//Je to velmi jednoduché - sto zlatých mincí! Takže, si to nejprve dobře rozmysli, než se pustíš do zápasu.
};

instance DIA_VLK_664_Masbo_Fight(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_Fight_Condition;
	information = DIA_VLK_664_Masbo_Fight_Info;
	permanent = TRUE;
	description = "Chci bojovat!";
};

func int DIA_VLK_664_Masbo_Fight_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_VLK_664_Masbo_Intro) == TRUE) && (TaverneFightEnd == FALSE) && (TaverneFightStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_Info()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_01_00");	//Chci bojovat.

	if((OlafWin == FALSE) || (GradenWin == FALSE) || (BramWin == FALSE) || (ValgardWin == FALSE))
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_01_01");	//Dobře! Ale nejdřív zaplať vklad.
		Info_ClearChoices(DIA_VLK_664_Masbo_Fight);
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Nemám tolik.",DIA_VLK_664_Masbo_Fight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 100)
		{
			Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Tady máš.",DIA_VLK_664_Masbo_Fight_Gold);
		};
	}
	else
	{
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,5);
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_01_02");	//Už jsi všechny porazil! Nikdo s tebou už nechce zápasit.
		TaverneFightEnd = TRUE;
	};
};

func void DIA_VLK_664_Masbo_Fight_NoGold()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_NoGold_01_00");	//Nemám tolik zlata.
	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_NoGold_01_01");	//Tak ho sežeň, bez peněz nebude zápas.
	AI_StopProcessInfos(self);
};

func void DIA_VLK_664_Masbo_Fight_Gold()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Gold_01_00");	//Tady máš.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Gold_01_01");	//Výborně! Tak si vyber soupeře.
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	TaverneFightStart = TRUE;
	Info_ClearChoices(DIA_VLK_664_Masbo_Fight);

	if(OlafWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Kurt 'Železná pěst'.",DIA_VLK_664_Masbo_Fight_Olaf);
	};
	if(GradenWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Graden 'Kladivo'.",DIA_VLK_664_Masbo_Fight_Graden);
	};
	if(BramWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Bram 'Divoch'.",DIA_VLK_664_Masbo_Fight_Bram);
	};
	if(ValgardWin == FALSE)
	{
		Info_AddChoice(DIA_VLK_664_Masbo_Fight,"Valgard 'Lebkoštěp'.",DIA_VLK_664_Masbo_Fight_Valgard);
	};
};

func void DIA_VLK_664_Masbo_Fight_Olaf()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_00");	//Chci bojovat s Kurtem přezdívaným 'Železná pěst'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Dobře! Tak nejprve vám stručně vysvětlim pravidla.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Za prvé, před bojem, se pozdravte s protivníkem. Je to nezbytnost!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Za druhé, používat se smí pouze pěsti!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Pokud vytáhneš zbraň nebo použiješ nějaký druh magie, boj pro tebe skončí. A to navždy!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//A nakonec - budete bojovat v této části hostince. Kdo ustoupí dál, boj prohrál.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Je ti vše jasné?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Jasnější to už být nemůže.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Výborně! Můžeš do ringu.
	Fight_Olaf = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFight");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Graden()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Graden_01_00");	//Chci bojovat s Gradenem přezdívaným 'Kladivo'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Dobře! Tak nejprve vám stručně vysvětlim pravidla.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Za prvé, před bojem, se pozdravte s protivníkem. Je to nezbytnost!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Za druhé, používat se smí pouze pěsti!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Pokud vytáhneš zbraň nebo použiješ nějaký druh magie, boj pro tebe skončí. A to navždy!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//A nakonec - budete bojovat v této části hostince. Kdo ustoupí dál, boj prohrál.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Je ti vše jasné?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Jasnější to už být nemůže.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Výborně! Můžeš do ringu.
	Fight_Graden = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_661_Graden,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Bram()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Bram_01_00");	//Chci bojovat s Bramem přezdívaným 'Divoch'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Dobře! Tak nejprve vám stručně vysvětlim pravidla.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Za prvé, před bojem, se pozdravte s protivníkem. Je to nezbytnost!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Za druhé, používat se smí pouze pěsti!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Pokud vytáhneš zbraň nebo použiješ nějaký druh magie, boj pro tebe skončí. A to navždy!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//A nakonec - budete bojovat v této části hostince. Kdo ustoupí dál, boj prohrál.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Je ti vše jasné?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Jasnější to už být nemůže.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Výborně! Můžeš do ringu.
	Fight_Bram = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_662_Bram,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

func void DIA_VLK_664_Masbo_Fight_Valgard()
{
	AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Valgard_01_00");	//Chci bojovat s Valgardem přezdívaným 'Lebkoštěp'.

	if(KnowFightRulesFist == FALSE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_01");	//Dobře! Tak nejprve vám stručně vysvětlim pravidla.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_02");	//Za prvé, před bojem, se pozdravte s protivníkem. Je to nezbytnost!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_03");	//Za druhé, používat se smí pouze pěsti!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_04");	//Pokud vytáhneš zbraň nebo použiješ nějaký druh magie, boj pro tebe skončí. A to navždy!
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_05");	//A nakonec - budete bojovat v této části hostince. Kdo ustoupí dál, boj prohrál.
		AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_06");	//Je ti vše jasné?
		AI_Output(other,self,"DIA_VLK_664_Masbo_Fight_Olaf_01_07");	//Jasnější to už být nemůže.
		KnowFightRulesFist = TRUE;
	};

	AI_Output(self,other,"DIA_VLK_664_Masbo_Fight_Olaf_01_08");	//Výborně! Můžeš do ringu.
	Fight_Valgard = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_663_Valgard,"GotoFight");
	B_StartOtherRoutine(VLK_660_Olaf,"GotoFightWatch");
	B_StartOtherRoutine(VLK_662_Bram,"GotoFightWatch");
	B_StartOtherRoutine(VLK_661_Graden,"GotoFightWatch");
};

instance DIA_VLK_664_Masbo_FightEnd(C_Info)
{
	npc = VLK_664_Masbo;
	nr = 5;
	condition = DIA_VLK_664_Masbo_FightEnd_Condition;
	information = DIA_VLK_664_Masbo_FightEnd_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_664_Masbo_FightEnd_Condition()
{
	if((FightCurrentWin == TRUE) || (FightCurrentLost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_664_Masbo_FightEnd_Info()
{
	if(FightCurrentWin == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_00");	//Gratuluju k vítězství, kamaráde!
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_01");	//Tady je tvá výhra.
		B_GiveInvItems(self,other,ItMi_Gold,200);
	}
	else if(FightCurrentLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_02");	//Promiň, ale prohrál jsi.
		AI_Output(self,other,"DIA_VLK_664_Masbo_FightEnd_01_03");	//Tvé peníze bere vítěz.
	};

	FightCurrentWin = FALSE;
	FightCurrentLost = FALSE;
	TaverneFightStart = FALSE;
	AI_StopProcessInfos(self);
};

//------------------------------boytsy--------------------------------------------------------------

instance DIA_VLK_660_Olaf_EXIT(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 999;
	condition = DIA_VLK_660_Olaf_EXIT_Condition;
	information = DIA_VLK_660_Olaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_660_Olaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_660_Olaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_GetOff(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_GetOff_condition;
	information = DIA_VLK_660_Olaf_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_GetOff_Condition()
{
	if((Fight_Olaf == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_GetOff_Info()
{
	if(OlafWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_660_Olaf_Fight(C_Info)
{
	npc = VLK_660_Olaf;
	nr = 10;
	condition = DIA_VLK_660_Olaf_Fight_condition;
	information = DIA_VLK_660_Olaf_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_660_Olaf_Fight_Condition()
{
	if((Fight_Olaf == TRUE) && (Fight_Olaf_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_660_Olaf_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Olaf_Now = TRUE;
	Fight_Olaf = FALSE;
	Info_ClearChoices(DIA_VLK_660_Olaf_Fight);
	Info_AddChoice(DIA_VLK_660_Olaf_Fight,"Začněte boj!",DIA_VLK_660_Olaf_Fight_Now);
};

func void DIA_VLK_660_Olaf_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_661_Graden_EXIT(C_Info)
{
	npc = VLK_661_Graden;
	nr = 999;
	condition = DIA_VLK_661_Graden_EXIT_Condition;
	information = DIA_VLK_661_Graden_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_661_Graden_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_661_Graden_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Graden_GetOff(C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_GetOff_condition;
	information = DIA_VLK_661_Graden_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_GetOff_Condition()
{
	if((Fight_Graden == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Graden_GetOff_Info()
{
	if(GradenWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_661_Graden_Fight(C_Info)
{
	npc = VLK_661_Graden;
	nr = 10;
	condition = DIA_VLK_661_Graden_Fight_condition;
	information = DIA_VLK_661_Graden_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_661_Graden_Fight_Condition()
{
	if((Fight_Graden == TRUE) && (Fight_Graden_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_661_Graden_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Graden_Now = TRUE;
	Fight_Graden = FALSE;
	Info_ClearChoices(DIA_VLK_661_Graden_Fight);
	Info_AddChoice(DIA_VLK_661_Graden_Fight,"Začněte boj!",DIA_VLK_661_Graden_Fight_Now);
};

func void DIA_VLK_661_Graden_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_662_Bram_EXIT(C_Info)
{
	npc = VLK_662_Bram;
	nr = 999;
	condition = DIA_VLK_662_Bram_EXIT_Condition;
	information = DIA_VLK_662_Bram_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_662_Bram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_662_Bram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_GetOff(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_GetOff_condition;
	information = DIA_VLK_662_Bram_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_GetOff_Condition()
{
	if((Fight_Bram == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_GetOff_Info()
{
	if(BramWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_662_Bram_Fight(C_Info)
{
	npc = VLK_662_Bram;
	nr = 10;
	condition = DIA_VLK_662_Bram_Fight_condition;
	information = DIA_VLK_662_Bram_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_662_Bram_Fight_Condition()
{
	if((Fight_Bram == TRUE) && (Fight_Bram_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_662_Bram_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Bram_Now = TRUE;
	Fight_Bram = FALSE;
	Info_ClearChoices(DIA_VLK_662_Bram_Fight);
	Info_AddChoice(DIA_VLK_662_Bram_Fight,"Začněte boj!",DIA_VLK_662_Bram_Fight_Now);
};

func void DIA_VLK_662_Bram_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_VLK_663_Valgard_EXIT(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 999;
	condition = DIA_VLK_663_Valgard_EXIT_Condition;
	information = DIA_VLK_663_Valgard_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_VLK_663_Valgard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_663_Valgard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_GetOff(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_GetOff_condition;
	information = DIA_VLK_663_Valgard_GetOff_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_GetOff_Condition()
{
	if((Fight_Valgard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_GetOff_Info()
{
	if(ValgardWin == TRUE)
	{
		B_Say(self,other,"$NEXTTIMEYOUREINFORIT");
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
	};

	AI_StopProcessInfos(self);
};

instance DIA_VLK_663_Valgard_Fight(C_Info)
{
	npc = VLK_663_Valgard;
	nr = 10;
	condition = DIA_VLK_663_Valgard_Fight_condition;
	information = DIA_VLK_663_Valgard_Fight_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_663_Valgard_Fight_Condition()
{
	if((Fight_Valgard == TRUE) && (Fight_Valgard_Now == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_VLK_663_Valgard_Fight_Info()
{
	AI_UnequipWeapons(hero);
	AI_UnequipWeapons(self);
	B_ClearWeapons(self);
	Fight_Valgard_Now = TRUE;
	Fight_Valgard = FALSE;
	Info_ClearChoices(DIA_VLK_663_Valgard_Fight);
	Info_AddChoice(DIA_VLK_663_Valgard_Fight,"Začněte boj!",DIA_VLK_663_Valgard_Fight_Now);
};

func void DIA_VLK_663_Valgard_Fight_Now()
{
	B_Say(self,other,"$YouDareHitMe");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};