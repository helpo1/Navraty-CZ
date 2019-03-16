
var int EVT_OPEN_DOOR_LIBRARY_S1_OneTime;

func void evt_open_door_library_s1()
{
	if(EVT_OPEN_DOOR_LIBRARY_S1_OneTime == FALSE)
	{
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_19");
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_18");
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_30");
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_21");
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_22");
		Wld_InsertNpc(Skeleton_Lord,"FP_ROAM_NW_KDF_LIBRARY_20");
		Wld_InsertNpc(SecretLibrarySkeleton,"NW_KDF_LIBRARY_14");
		Npc_RemoveInvItems(hero,ItKe_MonastarySecretLibrary_Mis,1);
		EVT_OPEN_DOOR_LIBRARY_S1_OneTime = TRUE;
	};
};

