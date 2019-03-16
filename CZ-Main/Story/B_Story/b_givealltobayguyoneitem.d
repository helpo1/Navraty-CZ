/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void b_givealltobayguy - upraveny výpisy

*/




func int b_givealltobayguyoneitem(var C_Npc giver,var C_Npc taker,var int item)
{
	var int x;
	x = Npc_HasItems(giver,item);
	if(x > 0)
	{
		CreateInvItems(taker,item,x);
		Npc_RemoveInvItems(giver,item,x);
	};
	return x;
};

func void b_givealltobayguy(var C_Npc giver,var C_Npc taker)
{
	var int total;
	var string cztext;
	total = 0;
	total += b_givealltobayguyoneitem(giver,taker,7107);
	total += b_givealltobayguyoneitem(giver,taker,6897);
	total += b_givealltobayguyoneitem(giver,taker,6916);
	total += b_givealltobayguyoneitem(giver,taker,6914);
	total += b_givealltobayguyoneitem(giver,taker,7123);
	total += b_givealltobayguyoneitem(giver,taker,7119);
	total += b_givealltobayguyoneitem(giver,taker,7116);
	total += b_givealltobayguyoneitem(giver,taker,7115);
	total += b_givealltobayguyoneitem(giver,taker,7114);
	total += b_givealltobayguyoneitem(giver,taker,7113);
	total += b_givealltobayguyoneitem(giver,taker,7112);
	total += b_givealltobayguyoneitem(giver,taker,7111);
	total += b_givealltobayguyoneitem(giver,taker,7110);
	total += b_givealltobayguyoneitem(giver,taker,7117);
	total += b_givealltobayguyoneitem(giver,taker,7118);
	total += b_givealltobayguyoneitem(giver,taker,7120);
	total += b_givealltobayguyoneitem(giver,taker,7121);
	total += b_givealltobayguyoneitem(giver,taker,7122);
	total += b_givealltobayguyoneitem(giver,taker,7124);
	total += b_givealltobayguyoneitem(giver,taker,7127);
	total += b_givealltobayguyoneitem(giver,taker,7128);
	total += b_givealltobayguyoneitem(giver,taker,7136);
	total += b_givealltobayguyoneitem(giver,taker,7633);
	total += b_givealltobayguyoneitem(giver,taker,7635);
	total += b_givealltobayguyoneitem(giver,taker,7637);
	total += b_givealltobayguyoneitem(giver,taker,7639);
	total += b_givealltobayguyoneitem(giver,taker,7213);
	total += b_givealltobayguyoneitem(giver,taker,7250);
	total += b_givealltobayguyoneitem(giver,taker,7252);
	total += b_givealltobayguyoneitem(giver,taker,7254);
	total += b_givealltobayguyoneitem(giver,taker,6347);
	total += b_givealltobayguyoneitem(giver,taker,7723);
	total += b_givealltobayguyoneitem(giver,taker,7720);
	total += b_givealltobayguyoneitem(giver,taker,7724);
	total += b_givealltobayguyoneitem(giver,taker,7737);
	total += b_givealltobayguyoneitem(giver,taker,7825);
	total += b_givealltobayguyoneitem(giver,taker,7879);
	total += b_givealltobayguyoneitem(giver,taker,7885);
	total += b_givealltobayguyoneitem(giver,taker,7898);
	total += b_givealltobayguyoneitem(giver,taker,7906);
	total += b_givealltobayguyoneitem(giver,taker,7933);
	total += b_givealltobayguyoneitem(giver,taker,6313);
	total += b_givealltobayguyoneitem(giver,taker,6314);
	total += b_givealltobayguyoneitem(giver,taker,6320);
	total += b_givealltobayguyoneitem(giver,taker,6321);
	total += b_givealltobayguyoneitem(giver,taker,6887);
	total += b_givealltobayguyoneitem(giver,taker,6889);
	total += b_givealltobayguyoneitem(giver,taker,6899);
	total += b_givealltobayguyoneitem(giver,taker,6901);
	total += b_givealltobayguyoneitem(giver,taker,6903);
	total += b_givealltobayguyoneitem(giver,taker,6908);
	total += b_givealltobayguyoneitem(giver,taker,6918);
	total += b_givealltobayguyoneitem(giver,taker,6282);
	total += b_givealltobayguyoneitem(giver,taker,6284);
	total += b_givealltobayguyoneitem(giver,taker,6298);
	// AI_Print(ConcatStrings(b_formnumberstring(total)," zabrano"));
	cztext = ConcatStrings("Zkonfiskováno ",IntToString(total));
	cztext = ConcatStrings(cztext," předmětů");
	AI_Print(cztext);
};

