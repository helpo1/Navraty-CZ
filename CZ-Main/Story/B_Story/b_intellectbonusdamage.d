
func void b_intellectbonusdamage(var C_Npc oth,var C_Npc slf)
{
	var int intdamage;

	if(Npc_IsPlayer(oth))
	{
		if(Npc_IsInFightMode(oth,FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) == SPELL_BAD) && (BELIARCURSEYOU == FALSE) && (slf.attribute[ATR_HITPOINTS] > 1) && (slf.protection[PROT_FIRE] != IMMUNE) && (slf.protection[PROT_MAGIC] != IMMUNE))
		{
			if(slf.attribute[ATR_HITPOINTS] > ATR_INTELLECT)
			{
				intdamage = ATR_INTELLECT;
			}
			else
			{
				intdamage = slf.attribute[ATR_HITPOINTS] - 1;
			};

			Npc_ChangeAttribute(slf,ATR_HITPOINTS,-intdamage);
		};
	};
};

