
instance PAL_259_Wache(Npc_Default)
{
	name[0] = NAME_Wache;
	guild = GIL_PAL;
	id = 259;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_ToughBald_Nek,BodyTex_P,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_259;
};


func void Rtn_Start_259()
{
	TA_Stand_Guarding(8,0,23,0,"OC_OPEN_ROOM_GUARD_01");
	TA_Stand_Guarding(23,0,8,0,"OC_OPEN_ROOM_GUARD_01");
};

func void rtn_attack_259()
{
	TA_Stand_Guarding(8,0,23,0,"OC_GUARD_PALISADE_02");
	TA_Stand_Guarding(23,0,8,0,"OC_GUARD_PALISADE_02");
};

