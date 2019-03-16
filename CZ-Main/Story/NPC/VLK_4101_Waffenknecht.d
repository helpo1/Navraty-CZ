
instance VLK_4101_Waffenknecht(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 4101;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Weak_Ulbert,BodyTex_N,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = Rtn_Start_4101;
};


func void Rtn_Start_4101()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_PALISADE_06");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_PALISADE_06");
};

func void Rtn_BabyParty_4101()
{
	TA_Stand_Guarding(8,0,20,0,"OC_GUARD_PALISADE_06");
	TA_Stand_ArmsCrossed(20,0,23,59,"OC_DAMAROK");
	TA_Stand_Guarding(23,59,8,0,"OC_GUARD_PALISADE_06");
};

func void rtn_attack_4101()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OC_EBR_GUARDPASSAGE_02");
	TA_Stand_ArmsCrossed(23,0,8,0,"OC_EBR_GUARDPASSAGE_02");
};

