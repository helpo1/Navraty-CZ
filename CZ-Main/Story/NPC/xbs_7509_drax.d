
instance XBS_7509_DRAX(Npc_Default)
{
	name[0] = "Drax";
	guild = GIL_OUT;
	id = 7509;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_Drax,BodyTex_N,ItAr_Sld_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_7509;
};


func void rtn_start_7509()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"WP_COAST_FOREST_04");
	TA_Sit_Campfire(23,0,8,0,"WP_COAST_FOREST_04");
};

func void rtn_Base_7509()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"WP_COAST_BASE_DRAX");
	TA_Stand_Eating(23,0,8,0,"WP_COAST_BASE_RATFORD");
};

func void Rtn_DracarBoard_7509()
{
	TA_Stand_Eating(8,0,23,0,"DRAKAR_SHIP_03");
	TA_Stand_ArmsCrossed(23,0,8,0,"DRAKAR_SHIP_03");
};