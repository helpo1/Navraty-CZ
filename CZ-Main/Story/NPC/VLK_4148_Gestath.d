
instance VLK_4148_Gestath(Npc_Default)
{
	name[0] = "Gestath";
	guild = GIL_OUT;
	id = 4148;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Thorus,BodyTex_B,ITAR_DJG_Crawler);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_4148;
};


func void Rtn_Start_4148()
{
	TA_Cook_Campfire(8,0,23,0,"OW_DJG_ROCKCAMP_01");
	TA_Sit_Campfire(23,0,8,0,"OW_DJG_ROCKCAMP_01");
};

func void Rtn_Tot_4148()
{
	TA_Sleep(8,0,23,0,"TOT");
	TA_Sleep(23,0,8,0,"TOT");
};

instance VLK_4149_Gestath(Npc_Default)
{
	name[0] = "Gestath";
	guild = GIL_NONE;
	id = 4149;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Sld_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Thorus,BodyTex_B,ITAR_DJG_Crawler);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_4149;
};

func void Rtn_Start_4149()
{
	TA_Sit_Bench(8,0,23,0,"NW_HUNTERCAMP_03");
	TA_Sit_Bench(23,0,8,0,"NW_HUNTERCAMP_03");
};

func void Rtn_HuntCamp_4149()
{
	TA_Stand_Guarding(8,0,23,0,"NW_TROLLAREA_GOBBO_01");
	TA_Sit_Bench(23,0,8,0,"NW_HUNTERCAMP_03");
};

func void Rtn_TOT_4149()
{
	TA_Stand_Guarding(8,0,23,0,"TOT");
	TA_Stand_Guarding(23,0,8,0,"TOT");
};