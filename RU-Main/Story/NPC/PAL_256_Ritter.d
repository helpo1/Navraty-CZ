
instance PAL_256_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 256;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_NormalBart_Cronos,BodyTex_P,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_256;
};


func void Rtn_Start_256()
{
	TA_Practice_Sword(8,0,19,0,"OC_TRAIN_02");
	TA_Sit_Campfire(19,0,8,0,"OC_CAMPFIRE_OUT_02");
};

func void rtn_attacka_256()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_01");
};

func void rtn_attackb_256()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_02");
};

