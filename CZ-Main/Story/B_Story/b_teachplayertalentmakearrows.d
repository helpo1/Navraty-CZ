
func int b_teachplayertalentmakearrows(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	kosten = B_GetLearnCostTalent(oth,talent,1);
	money = (kosten * 100) / TEMPSSBMODE;

	if(talent != NPC_TALENT_MAKEARROWS)
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_RemoveInvItems(oth,ItMi_Gold,money);

	if(talent == NPC_TALENT_MAKEARROWS)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_MAKEARROWS,1);
		AI_Print("Naučeno: Výroba obyčejných šípů a šipek");
		KNOWHOWTOMAKEARROWS = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Nyní umím vyrábět obyčejné šípy a šipky. Pro jejich výrobu potřebuji pilu na zpracování řeziva, kleště na výrobu dříků u truhlářského ponku a rozžhavenou ocel na výrobu hrotů na kovadlině. Pak už jen najít vhodný pracovní stůl a spojit dříky a hroty do šípů nebo šipek.");
		return TRUE;
	};
	return FALSE;
};

