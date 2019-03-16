
instance Pal_206_Ritter(Npc_Default)
{
	name[0] = NAME_Ritter;
	guild = GIL_PAL;
	id = 206;
	voice = 12;
	flags = 0;
	npcType = NPCTYPE_AMBIENT;
	B_SetAttributesToChapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,ItMw_1H_Blessed_02);
	B_CreateAmbientInv(self);
	B_SetNpcVisual(self,MALE,"Hum_Head_FatBald",Face_B_Normal_Kharim,BodyTex_B,ItAr_PAL_M_NPC);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,80);
	daily_routine = Rtn_Start_206;
};


func void Rtn_Start_206()
{
	TA_Stand_ArmsCrossed(7,14,14,0,"NW_CITY_LEOMAR_03");
	TA_Sit_Bench(14,0,16,0,"REICH");
	TA_Stand_ArmsCrossed(16,0,19,0,"NW_CITY_LEOMAR_03");
	TA_Smalltalk(19,0,23,1,"NW_CITY_UPTOWN_HUT_03_05");
	TA_Sleep(23,1,7,14,"NW_CITY_LEOMAR_BED_01");
};

