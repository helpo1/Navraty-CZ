
instance VLK_6021_FISK(Npc_Default)
{
	name[0] = "Фиск";
	guild = GIL_VLK;
	id = 6021;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter(self,3);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_ShortSword2);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Cavalorn,BodyTex_B,ITAR_Vlk_M);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,65);
	daily_routine = rtn_start_6021;
};


func void rtn_start_6021()
{
	TA_Stand_ArmsCrossed(5,10,21,30,"NW_CITY_FISK");
	TA_Sleep(21,30,5,10,"NW_CITY_HOTEL_BED_06");
};

