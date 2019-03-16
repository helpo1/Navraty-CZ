
instance Sld_807_Bullco(Npc_Default)
{
	name[0] = "Буллко";
	guild = GIL_SLD;
	id = 807;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Axe);
	B_CreateAmbientInv(self);
	CreateInvItems(self,ItRw_Arrow,5);
	CreateInvItems(self,ItRw_Sld_Bow,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_Normal_Olli_Kahn,BodyTex_N,itar_sld_M);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = Rtn_Start_807;
};

func void Rtn_Start_807()
{
	TA_Sit_Chair(9,15,10,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(10,0,10,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(10,15,12,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Stand_Eating(12,0,16,0,"NW_BIGFARM_HOUSE_14");
	TA_Stand_ArmsCrossed(16,0,20,0,"NW_BIGFARM_HOUSE_06");
	TA_Pee(20,0,20,15,"NW_BIGFARM_TREE");
	TA_Sit_Throne(20,15,9,0,"NW_BIGFARM_HOUSE_UP2_05");
};

func void Rtn_Pee_807()
{
	TA_Sit_Chair(9,15,10,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Pee(10,0,10,15,"NW_BIGFARM_TREE");
	TA_Sit_Chair(10,15,12,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	TA_Stand_Eating(12,0,16,0,"NW_BIGFARM_HOUSE_14");
	TA_Stand_ArmsCrossed(16,0,20,0,"NW_BIGFARM_HOUSE_06");
	TA_Pee(20,0,20,15,"NW_BIGFARM_TREE");
	TA_Sit_Throne(20,15,9,0,"NW_BIGFARM_HOUSE_UP2_05");
};

func void Rtn_Tot_807()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};