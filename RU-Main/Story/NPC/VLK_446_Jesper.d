
instance VLK_446_Jesper(Npc_Default)
{
	name[0] = "Джаспер";
	guild = GIL_OUT;
	id = 446;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItKe_Fingers,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Normal07,BodyTex_N,ITAR_Jesper);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,90);
	daily_routine = Rtn_PreStart_446;
};


func void Rtn_PreStart_446()
{
	TA_Stand_ArmsCrossed(7,0,23,0,"NW_CITY_KANAL_22");
	TA_Stand_ArmsCrossed(23,0,7,0,"NW_CITY_KANAL_22");
};

func void Rtn_Start_446()
{
	TA_Cook_Stove(7,0,14,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Read_Bookstand(14,0,18,0,"NW_CITY_KANAL_ROOM_JESPER");
	TA_Cook_Stove(18,0,21,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Read_Bookstand(21,0,7,0,"NW_CITY_KANAL_ROOM_JESPER");
};

func void Rtn_Dance_446()
{
	TA_Dance(7,0,20,0,"NW_CITY_KANAL_ROOM_05_03");
	TA_Dance(20,0,7,0,"NW_CITY_KANAL_ROOM_05_03");
};
