
func int B_TeachThiefTalent(var C_Npc slf,var C_Npc oth,var int talent)
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

	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
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

	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		AI_Print(PRINT_LearnPicklock);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		AI_Print(PRINT_LearnSneak);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		AI_Print(PRINT_LearnAcrobat);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		AI_Print(PRINT_LearnPickpocket);
		Snd_Play("LevelUP");
		return TRUE;
	};

	return FALSE;
};

func int b_teachthieftalentfree(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	var int money;

	kosten = B_GetLearnCostTalent(oth,talent,1);

	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;

	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		AI_Print(PRINT_LearnPicklock);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		AI_Print(PRINT_LearnSneak);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		AI_Print(PRINT_LearnAcrobat);
		Snd_Play("LevelUP");
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		AI_Print(PRINT_LearnPickpocket);
		Snd_Play("LevelUP");
		return TRUE;
	};
	return FALSE;
};