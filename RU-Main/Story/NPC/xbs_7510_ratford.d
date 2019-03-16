
instance XBS_7510_RATFORD(Npc_Default)
{
	name[0] = "Рэтфорд";
	guild = GIL_OUT;
	id = 7510;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_ShortSword5);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Fighter",Face_L_Ratford,BodyTex_L,ItAr_Sld_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,60);
	daily_routine = rtn_start_7510;
};


func void rtn_start_7510()
{
	TA_Sit_Campfire(8,0,23,0,"WP_COAST_FOREST_04");
	TA_Sit_Campfire(23,0,8,0,"WP_COAST_FOREST_04");
};

func void rtn_Base_7510()
{
	TA_Stand_Guarding(8,0,23,0,"WP_COAST_BASE_RATFORD");
	TA_Stand_Drinking(23,0,8,0,"WP_COAST_BASE_DRAX");
};

func void Rtn_DracarBoard_7510()
{
	TA_Study_WP(8,0,23,0,"DRAKAR_SHIP_01");
	TA_Study_WP(23,0,8,0,"DRAKAR_SHIP_01");
};