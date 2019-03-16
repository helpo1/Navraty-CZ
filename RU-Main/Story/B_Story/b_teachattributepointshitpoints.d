
func int b_teachattributepointshitpoints(var C_Npc slf,var C_Npc oth,var int attrib,var int points,var int teacherMAX)
{
	var string concatText;
	var int kosten;
	var int realAttribute;
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

	kosten = B_GetLearnCostAttribute(oth,attrib) * points;
	money = (kosten * 100) / TEMPSSBMODE;

	if(oth.attribute[ATR_HITPOINTS_MAX] >= teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if((oth.attribute[ATR_HITPOINTS_MAX] + points) > teacherMAX)
	{
		concatText = ConcatStrings(PRINT_NoLearnOverPersonalMAX,IntToString(teacherMAX));
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLP,177,58,17);
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
	B_RaiseAttribute(oth,ATR_HITPOINTS_MAX,points * 10);
	Npc_ChangeAttribute(oth,ATR_HITPOINTS,points * 10);
	return TRUE;
};

