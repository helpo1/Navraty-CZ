
func void b_magicgivenpc(var C_Npc slf,var C_Npc oth,var int damage)
{
	if(oth.protection[PROT_MAGIC] != IMMUNE)
	{
		Npc_ChangeAttribute(oth,ATR_MANA,-damage);
		Npc_ChangeAttribute(slf,ATR_MANA,damage);
		if(slf.attribute[ATR_MANA] >= slf.attribute[ATR_MANA_MAX])
		{
			slf.attribute[ATR_MANA] = slf.attribute[ATR_MANA_MAX];
		};
		if(oth.attribute[ATR_MANA] <= 0)
		{
			oth.attribute[ATR_MANA] = 0;
		};
	};
};

