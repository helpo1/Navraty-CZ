
instance MIL_357_MILIZ(Npc_Default)
{
	name[0] = NAME_Waffenknecht;
	guild = GIL_MIL;
	id = 357;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ItMw_1h_Mil_Sword);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Tough_Silas,BodyTex_B,ITAR_PAL_L_NPC);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,50);
	daily_routine = rtn_start_357;
};


func void rtn_start_357()
{
	TA_Practice_Sword(8,0,21,0,"NW_CITY_NEARHALL_01");
	TA_Smalltalk(21,0,8,0,"NW_CITY_NEARHALL_01");
};

