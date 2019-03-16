
instance SLD_6111_RUDAR(Npc_Default)
{
	name[0] = "Rudar";
	guild = GIL_SLD;
	id = 6110;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_N_NormalBart10,BodyTex_N,ItAr_Sld_H);
	Mdl_SetModelFatness(self,1.3);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,95);
	daily_routine = rtn_start_6111;
};


func void rtn_start_6111()
{
	TA_Smith_Sharp(8,0,22,0,"NW_BIGFARM_RUDAR");
	TA_Sit_Bench(22,0,8,0,"NW_BIGFARM_RUDAR_2");
};

