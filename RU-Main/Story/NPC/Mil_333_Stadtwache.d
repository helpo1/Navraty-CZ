
instance Mil_333_Stadtwache(Npc_Default)
{
	name[0] = NAME_Stadtwache;
	guild = GIL_MIL;
	id = 333;
	voice = 6;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_NewsOverride] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,ItMw_1h_Mil_Sword);
	EquipItem(self,ItRw_Mil_Crossbow);
	CreateInvItems(self,ItRw_Bolt,10);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_P_Normal03,BodyTex_P,ITAR_Mil_L);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_Start_333;
};


func void Rtn_Start_333()
{
	TA_Guard_Passage(4,0,21,0,"NW_CITY_ENTRANCE_BACK_GUARD_02");
	TA_Guard_Passage(21,0,4,0,"NW_CITY_ENTRANCE_BACK_GUARD_02");
};

