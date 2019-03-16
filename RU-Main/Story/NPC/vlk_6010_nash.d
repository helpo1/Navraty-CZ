
instance VLK_6010_NASH(Npc_Default)
{
	name[0] = "Нэш";
	guild = GIL_OUT;
	id = 6010;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
	attribute[ATR_REGENERATEMANA] = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItAr_Shield_01);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Normal16,BodyTex_N,ITAR_ABORIGEN_ARMOR);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,29);
	daily_routine = rtn_start_6010;
};


func void rtn_start_6010()
{
	TA_Stand_Guarding(20,0,8,0,"SV_HUMAN_08");
	TA_Stand_Eating(8,0,20,0,"SV_HUMAN_03");
};

