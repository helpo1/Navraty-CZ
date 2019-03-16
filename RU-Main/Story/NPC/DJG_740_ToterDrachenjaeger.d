
instance DJG_740_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_ToterDrachenjaeger;
	guild = GIL_DJG;
	id = 740;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,5);
	aivar[AIV_MM_RestStart] = TRUE;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	CreateInvItems(self,ItMi_DarkPearl,1);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart01,BodyTex_N,itar_djg_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_740;
};


func void Rtn_Start_740()
{
	TA_Sit_Bench(8,0,23,0,"MT14");
	TA_Sit_Bench(23,0,8,0,"MT14");
};

//---------------------охотники Сильвио-----------------


instance DJG_7300_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7300;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Richter,BodyTex_N,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7300;
};

func void Rtn_Start_7300()
{
	TA_Stand_Guarding(8,0,23,0,"OW_ICEDRAGON_12");
	TA_Stand_Guarding(23,0,8,0,"OW_ICEDRAGON_12");
};

func void Rtn_DracarBoard_7300()
{
	TA_Smalltalk(8,0,23,0,"DRAKAR_SHIP_07");
	TA_Smalltalk(23,0,8,0,"DRAKAR_SHIP_07");
};

instance DJG_7301_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7301;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_7301;
};


func void Rtn_Start_7301()
{
	TA_Stand_Guarding(4,0,21,0,"OW_ICEDRAGON_12");
	TA_WacheFackel(21,0,4,0,"OW_ICEDRAGON_12");
};

func void Rtn_DracarBoard_7301()
{
	TA_Smalltalk(8,0,23,0,"DRAKAR_SHIP_08");
	TA_Smalltalk(23,0,8,0,"DRAKAR_SHIP_08");
};


instance DJG_7302_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7302;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Pacho,BodyTex_B,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_7302;
};


func void Rtn_Start_7302()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_ICEDRAGON_03");
	TA_Stand_Guarding(23,0,8,0,"OW_ICEDRAGON_03");
};

func void Rtn_DracarBoard_7302()
{
	TA_Smalltalk(8,0,23,0,"DRAKAR_SHIP_14");
	TA_Smalltalk(23,0,8,0,"DRAKAR_SHIP_14");
};

instance DJG_7303_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7303;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart17,BodyTex_N,ITAR_DJG_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7303;
};


func void Rtn_Start_7303()
{
	TA_Stand_Guarding(4,0,21,0,"OW_ICEDRAGON_03");
	TA_WacheFackel(21,0,4,0,"OW_ICEDRAGON_03");
};

func void Rtn_DracarBoard_7303()
{
	TA_Smalltalk(8,0,23,0,"DRAKAR_SHIP_13");
	TA_Smalltalk(23,0,8,0,"DRAKAR_SHIP_13");
};

instance DJG_7304_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7304;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart01,BodyTex_N,ITAR_DJG_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7304;
};


func void Rtn_Start_7304()
{
	TA_Practice_Sword(8,0,23,0,"OW_ICEDRAGON_05");
	TA_Stand_Drinking(23,0,8,0,"OW_ICEDRAGON_05");
};

func void Rtn_DracarBoard_7304()
{
	TA_Practice_Sword(8,0,23,0,"DRAKAR_SHIP");
	TA_Stand_Drinking(23,0,8,0,"DRAKAR_SHIP");
};

instance DJG_7305_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7305;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Richter,BodyTex_N,ITAR_DJG_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7305;
};


func void Rtn_Start_7305()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_ICEDRAGON_23");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_ICEDRAGON_23");
};

func void Rtn_DracarBoard_7305()
{
	TA_Stand_Guarding(4,0,21,0,"DRAKAR_SHIP_06");
	TA_WacheFackel(21,0,4,0,"DRAKAR_SHIP_06");
};

instance DJG_7306_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7306;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_7306;
};


func void Rtn_Start_7306()
{
	TA_Stand_Guarding(4,0,21,0,"OW_ICEDRAGON_24");
	TA_WacheFackel(21,0,4,0,"OW_ICEDRAGON_24");
};

func void Rtn_DracarBoard_7306()
{
	TA_Stand_Guarding(4,0,21,0,"DRAKAR_SHIP_10");
	TA_WacheFackel(21,0,4,0,"DRAKAR_SHIP_10");
};

instance DJG_7307_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7307;
	voice = 5;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Tough_Pacho,BodyTex_B,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_7307;
};


func void Rtn_Start_7307()
{
	TA_Stand_Drinking(8,0,23,0,"OW_ICEDRAGON_09");
	TA_Stand_Drinking(23,0,8,0,"OW_ICEDRAGON_09");
};

func void Rtn_DracarBoard_7307()
{
	TA_Stand_Guarding(4,0,21,0,"DRAKAR_SHIP_09");
	TA_WacheFackel(21,0,4,0,"DRAKAR_SHIP_09");
};

instance DJG_7308_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7308;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart17,BodyTex_N,ITAR_DJG_M_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7308;
};


func void Rtn_Start_7308()
{
	TA_Stand_ArmsCrossed(8,0,23,0,"OW_ICEREGION_47");
	TA_Stand_ArmsCrossed(23,0,8,0,"OW_ICEREGION_47");
};

func void Rtn_DracarBoard_7308()
{
	TA_Stand_Guarding(4,0,21,0,"DRAKAR_SHIP_15");
	TA_WacheFackel(21,0,4,0,"DRAKAR_SHIP_15");
};

instance DJG_7309_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7309;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart01,BodyTex_N,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7309;
};


func void Rtn_Start_7309()
{
	TA_Stand_Guarding(4,0,21,0,"ICEDRAGON");
	TA_WacheFackel(21,0,4,0,"ICEDRAGON");
};

func void Rtn_DracarBoard_7309()
{
	TA_Stand_Guarding(4,0,21,0,"DRAKAR_SHIP_11");
	TA_WacheFackel(21,0,4,0,"DRAKAR_SHIP_11");
};

instance DJG_7310_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7310;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Sld_Sword_New);
	EquipItem(self,ItRw_Crossbow_H_02);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart01,BodyTex_N,ITAR_DJG_M_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7310;
};

func void Rtn_Start_7310()
{
	TA_Stand_Guarding(4,0,21,0,"OW_ICEREGION_DAM");
	TA_WacheFackel(21,0,4,0,"OW_ICEREGION_DAM");
};

func void Rtn_DracarBoard_7310()
{
	TA_Stand_Guarding(8,0,23,0,"DRAKAR_SHIP_05");
	TA_Stand_Guarding(23,0,8,0,"DRAKAR_SHIP_05");
};

instance DJG_7311_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7311;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_N_Richter,BodyTex_N,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = Rtn_Start_7311;
};


func void Rtn_Start_7311()
{
	TA_Stand_Guarding(4,0,21,0,"OW_ICEREGION_38");
	TA_WacheFackel(21,0,4,0,"OW_ICEREGION_38");
};

func void Rtn_DracarBoard_7311()
{
	TA_Stand_Guarding(8,0,23,0,"DRAKAR_SHIP_17");
	TA_Stand_Guarding(23,0,8,0,"DRAKAR_SHIP_17");
};

instance DJG_7312_ToterDrachenjaeger(Npc_Default)
{
	name[0] = NAME_Drachenjaeger;
	guild = GIL_DJG;
	id = 7312;
	voice = 1;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_2h_Sld_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Orik,BodyTex_B,ITAR_DJG_H_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_7312;
};

func void Rtn_Start_7312()
{
	TA_Stand_Guarding(8,0,23,0,"OW_ICEREGION_38");
	TA_Stand_Guarding(23,0,8,0,"OW_ICEREGION_38");
};

func void Rtn_DracarBoard_7312()
{
	TA_Stand_Guarding(8,0,23,0,"DRAKAR_SHIP_16");
	TA_Stand_Guarding(23,0,8,0,"DRAKAR_SHIP_16");
};