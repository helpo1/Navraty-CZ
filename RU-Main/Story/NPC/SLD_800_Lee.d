
instance SLD_800_Lee(Npc_Default)
{
	name[0] = "Ли";
	guild = GIL_SLD;
	id = 800;
	voice = 4;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	aivar[93] = TRUE;
	aivar[AIV_MM_RestEnd] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_lee_axt);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Lee,BodyTex_N,ITAR_SLD_H_LEE);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_800;
};


func void Rtn_Start_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair(19,0,22,0,"NW_BIGFARM_CAMPON_HAGEN");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void Rtn_WaitForShip_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_WAITFOR_SHIP_01");
	TA_Stand_Guarding(19,0,8,0,"NW_WAITFOR_SHIP_01");
};

func void Rtn_ShipOff_800()
{
	TA_Stand_Guarding(8,0,19,0,"NW_BIGFARM_HOUSE_LEE_GUARDING");
	TA_Sit_Chair(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_05");
	TA_Sleep(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

func void Rtn_Ship_800()
{
	TA_Stand_Guarding(8,0,23,0,"SHIP_CREW_01");
	TA_Sleep(23,0,8,0,"SHIP_IN_06");
};

func void rtn_tot_800()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_shipnew_800()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_02");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_02");
};

func void rtn_inbattle_800()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_LEE");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_LEE");
};

func void rtn_fleefrombattle_800()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

func void rtn_drained_800()
{
	ta_drained_yberion(23,0,7,0,"NW_BIGFIGHT_LEE");
	ta_drained_yberion(7,0,23,0,"NW_BIGFIGHT_LEE");
};

func void rtn_inkoma_800()
{
	ta_sleep_lee(8,0,19,0,"NW_BIGFARM_HOUSE_UP2_04");
	ta_sleep_lee(19,0,22,0,"NW_BIGFARM_HOUSE_UP2_04");
	ta_sleep_lee(22,0,8,0,"NW_BIGFARM_HOUSE_UP2_04");
};

instance SLD_854_Soeldner(Npc_Default)
{
	name[0] = NAME_Soeldner;
	guild = GIL_SLD;
	id = 854;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Tough_Drago,BodyTex_P,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_854;
};

func void Rtn_Start_854()
{
	TA_Stand_ArmsCrossed(8,0,20,0,"NW_BIGFARM_KITCHEN_04");
	TA_Stand_ArmsCrossed(20,0,8,0,"NW_BIGFARM_KITCHEN_04");
};

//----------------------квест Дариуса------------------------------------

instance SLD_852_Darius(Npc_Default)
{
	name[0] = "Дариус";
	guild = GIL_SLD;
	id = 852;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_IgnoresArmor] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_852;
};

func void Rtn_Start_852()
{
	TA_Stand_Guarding(8,0,22,0,"ORC_DARIUS");
	TA_Stand_Guarding(22,0,8,0,"ORC_DARIUS");
};

func void Rtn_Wait_852()
{
	TA_Sit_Campfire(8,0,22,0,"ORC_DARIUS_02");
	TA_Sit_Campfire(22,0,8,0,"ORC_DARIUS_02");
};

func void rtn_tot_852()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SLD_853_Bret(Npc_Default)
{
	name[0] = "Аделхард";
	guild = GIL_SLD;
	id = 853;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	aivar[AIV_IgnoresArmor] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_ZAHR,BodyTex_L,itar_sld_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_PreStart_853;
};

func void Rtn_PreStart_853()
{
	TA_Stand_Guarding(7,50,22,50,"OZ_MAN_11");
	TA_Stand_Guarding(22,50,7,50,"OZ_MAN_11");
};

func void Rtn_Start_853()
{
	TA_Sit_Campfire(7,50,22,50,"OZ_MAN_08");
	TA_Sit_Campfire(22,50,7,50,"OZ_MAN_08");
};

func void rtn_tot_853()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SLD_857_Darius(Npc_Default)
{
	name[0] = "Дариус";
	guild = GIL_SLD;
	id = 857;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	aivar[AIV_IgnoresArmor] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_L_Tough01,BodyTex_L,ItAr_Sld_H);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_857;
};

func void Rtn_Start_857()
{
	TA_Stand_Guarding(8,0,22,0,"NW_DARIUS");
	TA_Smalltalk(22,0,8,0,"NW_DARIUS_ST");
};

func void rtn_tot_857()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

instance SLD_858_Bret(Npc_Default)
{
	name[0] = "Аделхард";
	guild = GIL_SLD;
	id = 858;
	voice = 7;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	EquipItem(self,ItRw_Sld_Bow);
	CreateInvItems(self,ItRw_Arrow,10);
	aivar[AIV_IgnoresArmor] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",FACE_N_ZAHR,BodyTex_L,itar_sld_H);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_858;
};

func void Rtn_Start_858()
{
	TA_Stand_Guarding(8,0,22,0,"NW_BRET");
	TA_Smalltalk(22,0,8,0,"NW_BRET_ST");
};

func void rtn_tot_858()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};