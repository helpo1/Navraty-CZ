
instance VLK_445_Ramirez(Npc_Default)
{
	name[0] = "Рамирез";
	guild = GIL_OUT;
	id = 445;
	voice = 14;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ChiefRapier_Ramires);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Tough_Okyl,BodyTex_N,ITAR_RAMIREZ);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_445;
};

func void Rtn_Start_445()
{
	TA_Stand_ArmsCrossed(9,0,21,0,"NW_CITY_KANAL_ROOM_04_01");
	TA_Cook_Stove(21,0,23,0,"NW_CITY_KANAL_ROOM_05_03_COOK");
	TA_Sleep(23,0,9,0,"NW_CITY_KANAL_ROOM_05_BED_02");
};


func void Rtn_Idle_445()
{
	TA_Idle(7,0,23,0,"NW_CITY_KANAL_ROOM_05_02");
	TA_Idle(23,0,7,0,"NW_CITY_KANAL_ROOM_05_02");
};