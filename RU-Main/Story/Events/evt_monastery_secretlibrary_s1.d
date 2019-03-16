func void evt_monastery_secretlibrary_s1()
{
	if(SecretLibraryIsOpen == FALSE)
	{
		SecretLibraryIsOpen = TRUE;
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_01");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_02");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_04");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_25");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_27");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_17");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_15");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_16");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_03");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_06");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_08");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_14");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_11");
		Wld_InsertNpc(skeleton_knight_shield,"FP_ROAM_NW_KDF_LIBRARY_12");
		Wld_InsertNpc(SKELETON_KNIGHT,"FP_ROAM_NW_KDF_LIBRARY_10");
	};

	AI_Print("Впереди повеяло смертью...");
};

func void EVT_OCJail_s1()
{
	if(OCJailIsOpen == FALSE)
	{
		OCJailIsOpen = TRUE;
		Wld_InsertNpc(SKELETON_WARRIOR_OC,"OC_JAIL_01");
		Wld_InsertNpc(Skeleton_OC,"OC_JAIL_07");
		Wld_InsertNpc(Skeleton_Shield_OC,"OC_JAIL_02");
		Wld_InsertNpc(SKELETON_WARRIOR_OC,"OC_JAIL_08");
		Wld_InsertNpc(Skeleton_Shield_OC,"OC_JAIL_09");
		Wld_InsertNpc(Skeleton_Speer_OC,"OC_JAIL_03");
		Wld_InsertNpc(Skeleton_Speer_OC,"OC_JAIL_10");
		Wld_InsertNpc(Skeleton_OC,"OC_JAIL_04");
		Wld_InsertNpc(Skeleton_Speer_OC,"OC_JAIL_05");
		Wld_InsertNpc(Skeleton_OC,"OC_JAIL_06");

		if(Npc_HasItems(hero,ItKe_Garond) >= 1)
		{
			Npc_RemoveInvItems(hero,ItKe_Garond,1);
		};
	};
};