
instance VLK_4102_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4102;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal01,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4102;
};

func void Rtn_Start_4102()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_TOWER_01");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_TOWER_01");
};

func void Rtn_BabyParty_4102()
{
	TA_Stand_Guarding(8,0,20,0,"OC_GUARD_TOWER_01");
	TA_Stand_Drinking(20,0,23,59,"OC_RODRIGUEZ");
	TA_Stand_Guarding(23,59,8,0,"OC_GUARD_TOWER_01");
};
