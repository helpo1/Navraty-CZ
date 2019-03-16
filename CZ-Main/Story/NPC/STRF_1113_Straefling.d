
instance STRF_1113_Straefling(Npc_Default)
{
	name[0] = NAME_Straefling;
	guild = GIL_STRF;
	id = 1113;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_StoneHammer);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal14,BodyTex_N,ITAR_Prisoner);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,15);
	daily_routine = Rtn_Start_1113;
};


func void Rtn_Start_1113()
{
	TA_Stand_Eating(7,0,8,0,"OW_NEWMINE_SAW");
	TA_Saw(8,0,23,0,"OW_NEWMINE_SAW");
	TA_Sit_Campfire(23,0,7,0,"OW_NEWMINE_SAW");
};

