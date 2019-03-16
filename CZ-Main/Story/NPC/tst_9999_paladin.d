
instance TST_9999_PALADIN(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9999;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_9999;
};


func void Rtn_Start_9999()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8698");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8698");
};


instance TST_9998_PALADIN(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9998;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_9998;
};


func void Rtn_Start_9998()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8660");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8660");
};


instance TST_9997_PALADIN(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9997;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9997;
};


func void rtn_start_9997()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8699");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8699");
};


instance TST_9996_PALADIN(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 9996;
	voice = 9;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_OCAMBIENT;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_2h_Pal_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_NormalBart_Swiney,BodyTex_N,itar_pal_m_v1_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = rtn_start_9996;
};


func void rtn_start_9996()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8751");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8751");
};

