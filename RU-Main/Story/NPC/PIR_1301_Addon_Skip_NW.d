
instance PIR_1301_Addon_Skip_NW(Npc_Default)
{
	name[0] = "Скип";
	guild = GIL_PIR;
	id = 1301;
	voice = 8;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1h_MISC_Sword);
	B_SetNpcVisual(self,MALE,"Hum_Head_Pony",Face_N_Pirat01,BodyTex_N,ITAR_PIR_L_Addon);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,70);
	daily_routine = Rtn_Start_1301;
};


func void Rtn_Start_1301()
{
	TA_Cook_Campfire(5,0,20,0,"NW_CITY_PIRATESCAMP_04");
	TA_Cook_Campfire(20,0,5,0,"NW_CITY_PIRATESCAMP_04");
};

func void Rtn_Tot_1301()
{
	TA_Sit_Campfire(5,0,20,0,"TOT");
	TA_Sit_Campfire(20,0,5,0,"TOT");
};

