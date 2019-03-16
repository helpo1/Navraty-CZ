
instance BDT_6112_HANS(Npc_Default)
{
	name[0] = "Hans";
	guild = GIL_BDT;
	id = 6112;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_BL_MAIN;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ITMW_2H_AXE_KOLUN_107);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_BDT_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_6112;
};


func void rtn_start_6112()
{
	TA_Sit_Bench(9,0,21,0,"NW_BDT_HANS_S");
	TA_Sit_Bench(21,0,9,0,"NW_BDT_HANS_S");
};

