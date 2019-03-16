
instance NONE_116_MUD(Npc_Default)
{
	name[0] = "Mud";
	guild = GIL_NONE;
	id = 116;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1H_Mace_L_03);
	B_CreateAmbientInv(self);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",1,0,"Hum_Head_Pony",Face_N_ZombieMud,0,itar_prisonel);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_116;
};


func void rtn_start_116()
{
	TA_Sit_Bench(8,0,23,0,"WP_ORCTEMPLEORE_MUD");
	TA_Sit_Bench(23,0,8,0,"WP_ORCTEMPLEORE_MUD");
};

