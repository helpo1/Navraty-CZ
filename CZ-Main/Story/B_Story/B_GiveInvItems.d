/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int B_GiveInvItems - upraveny výpisy

*/




func int B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	var string concatText;
	var string itemname;

	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,itemInstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};

	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
	itemname = item.name;

	if(Npc_IsPlayer(giver))
	{
		if(itemInstance == ItMi_Gold)
		{
			// concatText = ConcatStrings(IntToString(amount),PRINT_GoldGegeben);
			concatText = ConcatStrings("Předáno ",IntToString(amount));
			concatText = ConcatStrings(concatText," zlatých");
			AI_Print(concatText);
		}
		// else if(amount == 1)
		// {
		// 	concatText = ConcatStrings(itemname,PRINT_Addon_gegeben);
		// 	AI_Print(concatText);
		// }
		else
		{
		// 	concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
		// 	concatText = ConcatStrings(concatText," (");
		// 	concatText = ConcatStrings(concatText,itemname);
		// 	concatText = ConcatStrings(concatText,")");
		
			concatText = ConcatStrings("Předáno ",IntToString(amount));
			concatText = ConcatStrings(concatText,"x ");
			concatText = ConcatStrings(concatText,itemname);
			AI_Print(concatText);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(itemInstance == ItMi_Gold)
		{
			// concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			concatText = ConcatStrings("Získáno ",IntToString(amount));
			concatText = ConcatStrings(concatText," zlatých");
			AI_Print(concatText);
		}
		// else if(amount == 1)
		// {
		// 	concatText = ConcatStrings(itemname,PRINT_Addon_erhalten);
		// 	AI_Print(concatText);
		// }
		else
		{
		// 	concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
		// 	concatText = ConcatStrings(concatText," (");
		// 	concatText = ConcatStrings(concatText,itemname);
		// 	concatText = ConcatStrings(concatText,")");
		
			concatText = ConcatStrings("Získáno ",IntToString(amount));
			concatText = ConcatStrings(concatText,"x ");
			concatText = ConcatStrings(concatText,itemname);
			AI_Print(concatText);
		};
	};

	return TRUE;
};

func int B_GiveInvItemsManyThings(var C_Npc giver,var C_Npc taker)
{
	var string concatText;

	if(Npc_IsPlayer(giver))
	{
		concatText = "Odevzdal jsi několik předmětů...";
		AI_Print(concatText);
	}
	else if(Npc_IsPlayer(taker))
	{
		concatText = "Získal jsi několik předmětů...";
		AI_Print(concatText);
	};
	return TRUE;
};

