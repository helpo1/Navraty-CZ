func void B_ClearBookInv(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(vlk_6027_taliasan))
	{
		if(BookTalBonus_01 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_CBOW_T1,Npc_HasItems(slf,ITWR_CBOW_T1));
		};
		if(BookTalBonus_02 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_CBOW_T2,Npc_HasItems(slf,ITWR_CBOW_T2));
		};
		if(BookTalBonus_03 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_EinhandBuch,Npc_HasItems(slf,ItWr_EinhandBuch));
		};
		if(BookTalBonus_04 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_ZweihandBuch,Npc_HasItems(slf,ItWr_ZweihandBuch));
		};
		if(BookTalBonus_05 == TRUE)
		{
			Npc_RemoveInvItems(slf,ASTRONOMIE,Npc_HasItems(slf,ASTRONOMIE));
		};
		if(BookTalBonus_06 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DEMONLANG,Npc_HasItems(slf,ITWR_DEMONLANG));
		};
		if(BookTalBonus_07 == TRUE)
		{
			Npc_RemoveInvItems(slf,LEHREN_DER_GOETTER1,Npc_HasItems(slf,LEHREN_DER_GOETTER1));
		};
		if(BookTalBonus_08 == TRUE)
		{
			Npc_RemoveInvItems(slf,LEHREN_DER_GOETTER2,Npc_HasItems(slf,LEHREN_DER_GOETTER2));
		};
		if(BookTalBonus_09 == TRUE)
		{
			Npc_RemoveInvItems(slf,LEHREN_DER_GOETTER3,Npc_HasItems(slf,LEHREN_DER_GOETTER3));
		};
		if(BookTalBonus_10 == TRUE)
		{
			Npc_RemoveInvItems(slf,DAS_MAGISCHE_ERZ,Npc_HasItems(slf,DAS_MAGISCHE_ERZ));
		};
		if(BookTalBonus_11 == TRUE)
		{
			Npc_RemoveInvItems(slf,SCHLACHT_UM_VARANT1,Npc_HasItems(slf,SCHLACHT_UM_VARANT1));
		};
		if(BookTalBonus_12 == TRUE)
		{
			Npc_RemoveInvItems(slf,SCHLACHT_UM_VARANT2,Npc_HasItems(slf,SCHLACHT_UM_VARANT2));
		};
		if(BookTalBonus_13 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_SOULRIVER,Npc_HasItems(slf,ITWR_SOULRIVER));
		};
		if(BookTalBonus_14 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_AZGOLOR,Npc_HasItems(slf,ITWR_AZGOLOR));
		};
		if(BookTalBonus_15 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_INNOSPRAY,Npc_HasItems(slf,ITWR_INNOSPRAY));
		};
		if(BookTalBonus_16 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_MANIAC,Npc_HasItems(slf,ITWR_MANIAC));
		};
		if(BookTalBonus_17 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_KAMPFKUNST,Npc_HasItems(slf,ITWR_KAMPFKUNST));
		};
		if(BookTalBonus_18 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_ELEMENTAREARCANEI,Npc_HasItems(slf,ITWR_ELEMENTAREARCANEI));
		};
		if(BookTalBonus_19 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_JAGD_UND_BEUTE,Npc_HasItems(slf,ITWR_JAGD_UND_BEUTE));
		};
		if(BookTalBonus_20 == TRUE)
		{
			Npc_RemoveInvItems(slf,MYRTANAS_LYRIK,Npc_HasItems(slf,MYRTANAS_LYRIK));
		};
		if(BookTalBonus_21 == TRUE)
		{
			Npc_RemoveInvItems(slf,WAHRE_MACHT,Npc_HasItems(slf,WAHRE_MACHT));
		};
		if(BookTalBonus_22 == TRUE)
		{
			Npc_RemoveInvItems(slf,MACHTVOLLE_KUNST,Npc_HasItems(slf,MACHTVOLLE_KUNST));
		};
		if(BookTalBonus_23 == TRUE)
		{
			Npc_RemoveInvItems(slf,GOETTERGABE,Npc_HasItems(slf,GOETTERGABE));
		};
		if(BookTalBonus_24 == TRUE)
		{
			Npc_RemoveInvItems(slf,GEHEIMNISSE_DER_ZAUBEREI,Npc_HasItems(slf,GEHEIMNISSE_DER_ZAUBEREI));
		};
		if(BookTalBonus_25 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_UMSONST_01,Npc_HasItems(slf,ITWR_UMSONST_01));
		};
		if(BookTalBonus_26 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_ANCIENT,Npc_HasItems(slf,ITWR_ANCIENT));
		};
		if(BookTalBonus_27 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DRAGONTALE,Npc_HasItems(slf,ITWR_DRAGONTALE));
		};
		if(BookTalBonus_28 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DRAGONTALE_2,Npc_HasItems(slf,ITWR_DRAGONTALE_2));
		};
		if(BookTalBonus_29 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DEMONTALE,Npc_HasItems(slf,ITWR_DEMONTALE));
		};
		if(BookTalBonus_30 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_SKELETONTALE,Npc_HasItems(slf,ITWR_SKELETONTALE));
		};
		if(BookTalBonus_31 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_GOLEMBOOK1,Npc_HasItems(slf,ITWR_GOLEMBOOK1));
		};
		if(BookTalBonus_32 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_GOLEMBOOK2,Npc_HasItems(slf,ITWR_GOLEMBOOK2));
		};
		if(BookTalBonus_33 == TRUE)
		{
			Npc_RemoveInvItems(slf,ELEMENTARE_ARCANEI,Npc_HasItems(slf,ELEMENTARE_ARCANEI));
		};
		if(BookTalBonus_34 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_MonasterySecret,Npc_HasItems(slf,ItWr_MonasterySecret));
		};
		if(BookTalBonus_35 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_OLDBOOK1,Npc_HasItems(slf,ITWR_OLDBOOK1));
		};
		if(BookTalBonus_36 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_OLDBOOK2,Npc_HasItems(slf,ITWR_OLDBOOK2));
		};
		if(BookTalBonus_37 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_OLDBOOK3,Npc_HasItems(slf,ITWR_OLDBOOK3));
		};
		if(BookTalBonus_38 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_OLDBOOK4,Npc_HasItems(slf,ITWR_OLDBOOK4));
		};
		if(BookTalBonus_39 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_OLDBOOK5,Npc_HasItems(slf,ITWR_OLDBOOK5));
		};
		if(BookTalBonus_40 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_Astronomy_Mis,Npc_HasItems(slf,ItWr_Astronomy_Mis));
		};
		if(BookTalBonus_41 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_VinosKellergeister_Mis,Npc_HasItems(slf,ItWr_VinosKellergeister_Mis));
		};
		if(BookTalBonus_42 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DEATH1,Npc_HasItems(slf,ITWR_DEATH1));
		};
		if(BookTalBonus_43 == TRUE)
		{
			Npc_RemoveInvItems(slf,ITWR_DEATH2,Npc_HasItems(slf,ITWR_DEATH2));
		};
		if(BookTalBonus_44 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_HallsofIrdorath_Open_Mis,Npc_HasItems(slf,ItWr_HallsofIrdorath_Open_Mis));
		};
		if(BookTalBonus_45 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_XardasSeamapBook_Mis,Npc_HasItems(slf,ItWr_XardasSeamapBook_Mis));
		};
		if(BookTalBonus_46 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_Alchemy_01,Npc_HasItems(slf,ItWr_Alchemy_01));
		};
		if(BookTalBonus_47 == TRUE)
		{
			Npc_RemoveInvItems(slf,ItWr_Druid_01,Npc_HasItems(slf,ItWr_Druid_01));
		};
	};
};
