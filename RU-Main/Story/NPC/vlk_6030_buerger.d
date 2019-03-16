
instance VLK_6030_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6030;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	aivar[AIV_MM_RestStart] = TRUE;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart22,BodyTex_N,ITAR_Bau_L_01);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6030;
};


func void rtn_start_6030()
{
	TA_Stand_Drinking(8,0,20,0,"OCR_CROWD_03");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_03");
};

func void rtn_tot_6030()
{
	TA_Sit_Bench(8,0,20,0,"NW_CITY_MERCHANT_CONCERTPUB_03");
	TA_Sit_Bench(20,0,8,0,"NW_CITY_MERCHANT_CONCERTPUB_03");
};

//------------------------------посетители Корагона-----------------------------

instance VLK_6038_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6038;
	voice = 6;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_ToughGuy] = TRUE;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Axe);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_N_NormalBart22,BodyTex_N,ITAR_Bau_L_01);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6038;
};

func void rtn_start_6038()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_TAVERN_IN_06");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_TAVERN_IN_06");
};

instance VLK_6039_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6039;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Huno,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6039;
};

func void rtn_start_6039()
{
	TA_Stand_Drinking(8,0,20,0,"TAVERN02_B");
	TA_Stand_Drinking(20,0,8,0,"TAVERN02_B");
};

instance VLK_6040_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6040;
	voice = 8;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,2);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,ItMw_1h_Vlk_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_NormalBart06,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6040;
};

func void rtn_start_6040()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_TAVERN_IN_04");
};

instance VLK_6041_BUERGER(Npc_Default)
{
	name[0] = NAME_Buerger;
	guild = GIL_VLK;
	id = 6041;
	voice = 1;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,3);
	level = 1;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Huno,BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_6041;
};

func void rtn_start_6041()
{
	TA_Stand_Drinking(8,0,20,0,"NW_CITY_MERCHANT_TAVERN01_IN_01");
	TA_Stand_Drinking(20,0,8,0,"NW_CITY_MERCHANT_TAVERN01_IN_01");
};