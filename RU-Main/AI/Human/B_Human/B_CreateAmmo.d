
func void B_CreateAmmo(var C_Npc slf)
{
	var C_Item rangedWeapon;

	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		rangedWeapon = Npc_GetReadiedWeapon(slf);

		if(rangedWeapon.munition == ItRw_Arrow)
		{
			if(Npc_HasItems(slf,ItRw_Arrow) < 3)
			{
				CreateInvItems(slf,ItRw_Arrow,5);
			};
		}
		else if(rangedWeapon.munition == ItRw_Bolt)
		{
			if(Npc_HasItems(slf,ItRw_Bolt) < 3)
			{
				CreateInvItems(slf,ItRw_Bolt,5);
			};
		};
	}
	else if(Npc_HasEquippedRangedWeapon(slf))
	{
		rangedWeapon = Npc_GetEquippedRangedWeapon(slf);

		if(rangedWeapon.munition == ItRw_Arrow)
		{
			if(Npc_HasItems(slf,ItRw_Arrow) < 3)
			{
				CreateInvItems(slf,ItRw_Arrow,5);
			};
		}
		else if(rangedWeapon.munition == ItRw_Bolt)
		{
			if(Npc_HasItems(slf,ItRw_Bolt) < 3)
			{
				CreateInvItems(slf,ItRw_Bolt,5);
			};
		};
	}
	else
	{
		return;
	};
};

