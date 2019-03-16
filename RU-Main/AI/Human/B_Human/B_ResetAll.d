
func void B_ResetAll(var C_Npc slf)
{
	var int msec;
	var C_Item itm;

	AI_Standup(slf);
	B_StopLookAt(slf);
	AI_RemoveWeapon(slf);
	msec = Hlp_Random(1000);
	AI_Waitms(slf,msec);

	if(slf.guild == GIL_PAL)
	{
		if(Npc_HasEquippedArmor(slf) == TRUE)
		{
			itm = Npc_GetEquippedArmor(slf);

			if((Hlp_IsItem(itm,ItAr_PAl_H_NPC) == TRUE) || (Hlp_IsItem(itm,ITAR_PAL_H_V1_NPC) == TRUE))
			{
				if(Npc_HasItems(self,ItAr_Pal_Helm_Open_Npc) == 0)
				{
					CreateInvItem(self,ItAr_Pal_Helm_Open_Npc);
					AI_EquipArmor(self,ItAr_Pal_Helm_Open_Npc);
				};			
			}
			else if(Hlp_IsItem(itm,ITAR_PAL_H_V2_NPC) == TRUE)
			{
				if(Npc_HasItems(self,ItAr_Pal_Elite_Helm_Npc) == 0)
				{
					CreateInvItem(self,ItAr_Pal_Elite_Helm_Npc);
					AI_EquipArmor(self,ItAr_Pal_Elite_Helm_Npc);
				};			
			};
		};
	};
};