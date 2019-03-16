
instance Pal_204_Torwache(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 204;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Whistler,BodyTex_N,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_204;
};


func void Rtn_Start_204()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"NW_CITYHALL_GUARD_01");
	TA_Stand_ArmsCrossed(23,0,8,0,"NW_CITYHALL_GUARD_01");
};

