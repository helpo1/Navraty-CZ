
var int printrazorcount;

func string b_formnumberstring(var int amount)
{
	var string ntext;
	var string itemstr;
	var int divider;
	var int divider10;
	var string str;
	var string suffix;
	divider = amount % 10;
	divider10 = (amount / 10) % 10;
	if(PRINTRAZORCOUNT == FALSE)
	{
		itemstr = ConcatStrings(PRINT__ITEMS,"");
	}
	else
	{
		itemstr = ConcatStrings(" бритвозуб","");
	};
	if((amount > 0) && (amount <= 10))
	{
		if(amount == 1)
		{
			str = ConcatStrings("один","");
		}
		else if(amount == 2)
		{
			str = ConcatStrings("два","");
		}
		else if(amount == 3)
		{
			str = ConcatStrings("три","");
		}
		else if(amount == 4)
		{
			str = ConcatStrings("четыре","");
		}
		else if(amount == 5)
		{
			str = ConcatStrings("пять","");
		}
		else if(amount == 6)
		{
			str = ConcatStrings("шесть","");
		}
		else if(amount == 7)
		{
			str = ConcatStrings("семь","");
		}
		else if(amount == 8)
		{
			str = ConcatStrings("восемь","");
		}
		else if(amount == 9)
		{
			str = ConcatStrings("девять","");
		}
		else if(amount == 10)
		{
			str = ConcatStrings("десять","");
		};
		ntext = ConcatStrings(str,itemstr);
	}
	else
	{
		ntext = ConcatStrings(IntToString(amount),itemstr);
	};
	if(divider != 1)
	{
		if((divider >= 2) && (divider <= 4) && (divider10 != 1))
		{
			suffix = ConcatStrings("а","");
		}
		else
		{
			suffix = ConcatStrings("ов","");
		};
		return ConcatStrings(ntext,suffix);
	};
	return ntext;
};

func string b_formgivestring(var C_Npc giver,var int amount)
{
	if(Npc_IsPlayer(giver))
	{
		return ConcatStrings(PRINT__GEGEBEN,b_formnumberstring(amount));
	};
	return ConcatStrings(PRINT__ERHALTEN,b_formnumberstring(amount));
};

func void B_PlayerFindItem(var int itm,var int amount)
{
	var string concatText;
	var string itemname;

	if(Npc_IsPlayer(self))
	{
		CreateInvItems(self,itm,amount);
		itemname = item.name;
		if(itm == ItMi_Gold)
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_GoldErhalten);
			AI_Print(concatText);
			Snd_Play("Geldbeutel");
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_Addon_erhalten);
			AI_Print(concatText);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_Print(concatText);
		};
	};
};