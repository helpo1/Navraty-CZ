
instance Pal_285_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 285;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart05,BodyTex_N,ItAr_PAl_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_guardpass_285;
};


func void Rtn_Start_285()
{
	TA_Stand_Guarding(8,0,23,0,"NW_CITY_PALCAMP_08");
	TA_Stand_Guarding(23,0,8,0,"NW_CITY_PALCAMP_08");
};

func void rtn_guardpass_285()
{
	TA_Stand_Guarding(8,0,22,0,"NW_PASS_GATEGUARD_01");
	TA_Stand_Guarding(22,0,8,0,"NW_PASS_GATEGUARD_01");
};

