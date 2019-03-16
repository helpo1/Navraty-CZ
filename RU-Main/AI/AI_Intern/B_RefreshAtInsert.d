
func void B_RefreshAtInsert()
{
	var C_Npc her;
	var C_Item weaponequip;
	var int ranitem;

	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};

	her = Hlp_GetNpc(PC_Hero);

	if((Npc_HasEquippedMeleeWeapon(self) == FALSE) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (self.guild != GIL_GUR) && (self.guild != GIL_KDW) && (self.guild != GIL_KDF) && (self.guild != GIL_DMT) && ((self.guild <= GIL_SEPERATOR_HUM) || (self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE_OM)))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.aivar[AIV_MM_RoamStart] = FALSE;

		if((Npc_HasEquippedWeapon(self) == FALSE) && (self.aivar[AIV_MagicUser] != MAGIC_ALWAYS) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BAU_980_Sagitta)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_4570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_5570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_414_Hanna)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_435_Nadja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_436_Sonja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_471_Edda)))
		{
			if(self.guild == GIL_MIL)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Mil_Sword,Npc_HasItems(self,ItMw_1h_Mil_Sword));
				CreateInvItems(self,ItMw_1h_Mil_Sword,1);
			}
			else if(self.guild == GIL_PAL)
			{
				Npc_RemoveInvItems(self,ItMw_1H_Blessed_02,Npc_HasItems(self,ItMw_1H_Blessed_02));
				CreateInvItems(self,ItMw_1H_Blessed_02,1);
			}
			else if(self.guild == GIL_SLD)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Sld_Axe,Npc_HasItems(self,ItMw_1h_Sld_Axe));
				CreateInvItems(self,ItMw_1h_Sld_Axe,1);
			}
			else if(self.guild == GIL_BAU)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Bau_Axe,Npc_HasItems(self,ItMw_1h_Bau_Axe));
				CreateInvItems(self,ItMw_1h_Bau_Axe,1);
			}
			else if(self.guild == GIL_NOV)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Nov_Mace,Npc_HasItems(self,ItMw_1h_Nov_Mace));
				CreateInvItems(self,ItMw_1h_Nov_Mace,1);
			}
			else if(self.guild == GIL_PIR)
			{
				Npc_RemoveInvItems(self,ItMw_Piratensaebel,Npc_HasItems(self,ItMw_Piratensaebel));
				CreateInvItems(self,ItMw_Piratensaebel,1);
			}
			else if(self.guild == GIL_BDT)
			{
				Npc_RemoveInvItems(self,ItMw_Nagelknueppel,Npc_HasItems(self,ItMw_Nagelknueppel));
				CreateInvItems(self,ItMw_Nagelknueppel,1);
			}
			else if(self.guild == GIL_DJG)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword_New,Npc_HasItems(self,ItMw_1h_Sld_Sword_New));
				CreateInvItems(self,ItMw_1h_Sld_Sword_New,1);
			}
			else if(self.guild == GIL_VLK)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Vlk_Sword,Npc_HasItems(self,ItMw_1h_Vlk_Sword));
				CreateInvItems(self,ItMw_1h_Vlk_Sword,1);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(STRF_8146_Hart))
			{
				Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,Npc_HasItems(self,ItMw_2H_OrcAxe_01));
				CreateInvItems(self,ItMw_2H_OrcAxe_01,1);
			}
			else if(self.guild == GIL_SEK)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Vlk_Axe,Npc_HasItems(self,ItMw_1h_Vlk_Axe));
				CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
			}
			else if(self.guild == GIL_TPL)
			{
				Npc_RemoveInvItems(self,ItMw_Zweihaender1,Npc_HasItems(self,ItMw_Zweihaender1));
				CreateInvItems(self,ItMw_Zweihaender1,1);
			}
			else if(self.guild == GIL_STRF)
			{
				Npc_RemoveInvItems(self,ItMw_StoneHammer,Npc_HasItems(self,ItMw_StoneHammer));
				CreateInvItems(self,ItMw_StoneHammer,1);
			}
			else if(self.guild == GIL_OUT)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
				CreateInvItems(self,ItMw_1h_Sld_Sword,1);
			}
			else if(self.guild == GIL_NONE)
			{
				Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
				CreateInvItems(self,ItMw_1h_Sld_Sword,1);
			}
			else if(self.guild == GIL_SKELETON)
			{
				Npc_RemoveInvItems(self,ItMw_1h_MISC_Sword,Npc_HasItems(self,ItMw_1h_MISC_Sword));
				CreateInvItems(self,ItMw_1h_MISC_Sword,1);
			}
			else if((self.guild == GIL_ORC) || (self.guild == GIL_SEPERATOR_ORC) || (self.guild == GIL_FRIENDLY_ORC))
			{
				Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,Npc_HasItems(self,ItMw_2H_OrcAxe_01));
				CreateInvItems(self,ItMw_2H_OrcAxe_01,1);
			}
			else if(self.guild == GIL_DRACONIAN)
			{
				Npc_RemoveInvItems(self,ITMW_2H_DRACONSWORD_01,Npc_HasItems(self,ITMW_2H_DRACONSWORD_01));
				CreateInvItems(self,ITMW_2H_DRACONSWORD_01,1);
			}
			else if(self.guild == GIL_UNDEADORC)
			{
				Npc_RemoveInvItems(self,ITMW_2H_ORCMACE_01,Npc_HasItems(self,ITMW_2H_ORCMACE_01));
				CreateInvItems(self,ITMW_2H_ORCMACE_01,1);
			}
			else
			{
				Npc_RemoveInvItems(self,ItMw_1h_Sld_Sword,Npc_HasItems(self,ItMw_1h_Sld_Sword));
				CreateInvItems(self,ItMw_1h_Sld_Sword,1);
			};
		};
	};
	if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (self.guild <= GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(BAU_980_Sagitta)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_4570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_5570_Avabul)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_414_Hanna)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_435_Nadja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_436_Sonja)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(VLK_471_Edda)))
	{
		if(Npc_HasEquippedMeleeWeapon(self) == FALSE)
		{
			AI_EquipBestMeleeWeapon(self);
		};
		if((Npc_HasEquippedRangedWeapon(self) == TRUE) && (self.guild <= GIL_SEPERATOR_HUM))
		{
			weaponequip = Npc_GetEquippedRangedWeapon(self);

			if((weaponequip.flags & ITEM_BOW) == ITEM_BOW)
			{
				ActivateZSSlot(self,"BIP01 R CLAVICLE");
				Ext_RemoveFromSlot(self,"BIP01 R CLAVICLE");
				ranitem = Hlp_Random(100);

				if(ranitem >= 75)
				{
					Ext_PutInSlot(self,"BIP01 R CLAVICLE",ItSl_BackArrowSack_07);
					Npc_RemoveInvItems(self,ItSl_BackArrowSack_07,Npc_HasItems(self,ItSl_BackArrowSack_07));
					ranitem = FALSE;
				}
				else if(ranitem >= 50)
				{
					Ext_PutInSlot(self,"BIP01 R CLAVICLE",ItSl_BackArrowSack_02);
					Npc_RemoveInvItems(self,ItSl_BackArrowSack_02,Npc_HasItems(self,ItSl_BackArrowSack_02));
					ranitem = FALSE;
				}
				else if(ranitem >= 25)
				{
					Ext_PutInSlot(self,"BIP01 R CLAVICLE",ItSl_BackArrowSack_04);
					Npc_RemoveInvItems(self,ItSl_BackArrowSack_04,Npc_HasItems(self,ItSl_BackArrowSack_04));
					ranitem = FALSE;
				}
				else
				{
					Ext_PutInSlot(self,"BIP01 R CLAVICLE",ItSl_BackArrowSack_09);
					Npc_RemoveInvItems(self,ItSl_BackArrowSack_09,Npc_HasItems(self,ItSl_BackArrowSack_09));
					ranitem = FALSE;
				};
			}
			else
			{
				ActivateZSSlot(self,"BIP01 SPINE");
				Ext_RemoveFromSlot(self,"BIP01 SPINE");
				Ext_PutInSlot(self,"BIP01 SPINE",ItSl_BackBoltSack_01);
				Npc_RemoveInvItems(self,ItSl_BackBoltSack_01,Npc_HasItems(self,ItSl_BackBoltSack_01));
			};
		};
		if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (self.flags != NPC_FLAG_GHOST) && (self.aivar[AIV_MM_REAL_ID] != ID_SKELETON) && (self.aivar[AIV_MM_RestStart] == FALSE) && (self.npcType != NPCTYPE_XBSAMBIENT) && (self.guild != GIL_SEK) && (self.guild != GIL_DMT) && (self.guild != GIL_STRF) && (self.aivar[90] == FALSE) && (self.guild <= GIL_SEPERATOR_HUM) && (self.flags != NPC_FLAG_XARADRIM) && (self.flags != NPC_FLAG_IMMORTAL))
		{
			ActivateZSSlot(self,"BIP01 SPINE1");
			Ext_RemoveFromSlot(self,"BIP01 SPINE1");			

			if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(BAU_980_Sagitta)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10921_Loa_ADW)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SLD_10920_Loa)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_6136_ABIGEIL)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_61360_ABIGEIL)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_414_Hanna)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PIR_1397_ADDON_INEXTREMO_CHARLOTTE)))
			{
				Ext_PutInSlot(self,"BIP01 SPINE1",ItSl_GoldPocket_Woman_New);
				Npc_RemoveInvItems(self,ItSl_GoldPocket_Woman_New,Npc_HasItems(self,ItSl_GoldPocket_Woman_New));
			}
			else if(self.aivar[AIV_Gender] == MALE)
			{
				Ext_PutInSlot(self,"BIP01 SPINE1",ItSl_GoldPocket);
				Npc_RemoveInvItems(self,ItSl_GoldPocket,Npc_HasItems(self,ItSl_GoldPocket));
			}
			else
			{
				Ext_PutInSlot(self,"BIP01 SPINE1",ItSl_GoldPocket_Woman);
				Npc_RemoveInvItems(self,ItSl_GoldPocket_Woman,Npc_HasItems(self,ItSl_GoldPocket_Woman));
			};
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_5570_Avabul))
	{
		ActivateZSSlot(self,"BIP01 HEAD");
		Ext_RemoveFromSlot(self,"BIP01 HEAD");	
		Ext_PutInSlot(self,"BIP01 HEAD",ItAr_Helm_Avabul);
		Npc_RemoveInvItems(self,ItAr_Helm_Avabul,Npc_HasItems(self,ItAr_Helm_Avabul));
		ActivateZSSlot(self,"BIP01 SPINE2");
		Ext_RemoveFromSlot(self,"BIP01 SPINE2");	
		Ext_PutInSlot(self,"BIP01 SPINE2",Itar_Avabul_Wings);
		Npc_RemoveInvItems(self,Itar_Avabul_Wings,Npc_HasItems(self,Itar_Avabul_Wings));
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(VLK_4570_Avabul))
	{
		ActivateZSSlot(self,"BIP01 SPINE2");
		Ext_RemoveFromSlot(self,"BIP01 SPINE2");	
		Ext_PutInSlot(self,"BIP01 SPINE2",Itar_Avabul_Wings);
		Npc_RemoveInvItems(self,Itar_Avabul_Wings,Npc_HasItems(self,Itar_Avabul_Wings));
	};
	if((self.aivar[AIV_MM_REAL_ID] == ID_GHOST) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Ghost_Uniq)))
	{
		ActivateZSSlot(self,"BIP01 L HAND");
		Ext_RemoveFromSlot(self,"BIP01 L HAND");	
		Ext_PutInSlot(self,"BIP01 L HAND",Itar_Ghost_Candle);
		Npc_RemoveInvItems(self,Itar_Ghost_Candle,Npc_HasItems(self,Itar_Ghost_Candle));
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Ghost_Uniq))
	{
		ActivateZSSlot(self,"BIP01 L HAND");
		Ext_RemoveFromSlot(self,"BIP01 L HAND");	
		Ext_PutInSlot(self,"BIP01 L HAND",ITMI_GHOST_TORCH_01);
		Npc_RemoveInvItems(self,ITMI_GHOST_TORCH_01,Npc_HasItems(self,ITMI_GHOST_TORCH_01));
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
	{
		ActivateZSSlot(self,"BIP01 PELVIS");
		Ext_RemoveFromSlot(self,"BIP01 PELVIS");	
		Ext_PutInSlot(self,"BIP01 PELVIS",ItSl_CraitBag);
		Npc_RemoveInvItems(self,ItSl_CraitBag,Npc_HasItems(self,ItSl_CraitBag));
	};
};