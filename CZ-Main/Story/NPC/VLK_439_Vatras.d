
instance VLK_439_Vatras(Npc_Default)
{
	name[0] = "Vatras";
	guild = GIL_KDW;
	id = 439;
	voice = 5;
	flags = 0;
	npcType = npctype_main;
	aivar[93] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	B_SetAttributesToChapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	CreateInvItems(self,ItSc_LightHeal,2);
	CreateInvItems(self,ItSc_Zap,2);
	CreateInvItems(self,ItSc_Icebolt,2);
	CreateInvItems(self,ItSc_Light,2);
	CreateInvItems(self,ItSc_TrfScavenger,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Psionic",Face_B_Saturas,BodyTex_B,ItAr_KDW_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	EquipItem(self,ItMW_Addon_Stab02_NPC);
	daily_routine = Rtn_Start_439;
};

func void Rtn_Start_439()
{
	TA_Preach_Vatras(5,0,20,0,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Sit_Throne(20,0,23,0,"NW_CITY_UPTOWN_HUT_03_SIT");
	TA_Sleep(23,0,5,0,"NW_CITY_UPTOWN_HUT_03_BED");
};

func void Rtn_RitualInnosEyeRepair_439()
{
	TA_Stand_Guarding(8,0,20,0,"NW_TROLLAREA_RITUAL_04");
	TA_Stand_Guarding(20,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void Rtn_MageSpeech_439()
{
	TA_MageSpeech(8,0,20,0,"NW_TROLLAREA_RITUAL_04");
	TA_MageSpeech(20,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void Rtn_RitualInnosEye_439()
{
	TA_Circle(8,0,23,0,"NW_TROLLAREA_RITUAL_04");
	TA_Circle(23,0,8,0,"NW_TROLLAREA_RITUAL_04");
};

func void Rtn_WAITFORSHIP_439()
{
	TA_Sit_Bench(8,0,23,0,"NW_WAITFOR_SHIP_04");
	TA_Sit_Bench(23,0,8,0,"NW_WAITFOR_SHIP_04");
};

func void Rtn_Ship_439()
{
	TA_Read_Bookstand(8,0,23,0,"SHIP_IN_22");
	TA_Sleep(23,0,8,0,"SHIP_IN_04");
};

func void Rtn_PRAY_439()
{
	TA_Pray_Innos_FP(5,5,20,10,"NW_CITY_MERCHANT_TEMPLE_FRONT");
	TA_Pray_Innos_FP(20,10,5,5,"NW_CITY_MERCHANT_TEMPLE_IN");
};

func void rtn_tot_439()
{
	TA_Stand_WP(8,0,20,0,"TOT");
	TA_Stand_WP(20,0,8,0,"TOT");
};

func void rtn_orcatcnw_439()
{
	TA_Stand_Guarding(8,0,20,0,"NW_MONASTERY_GRASS_VATRAS");
	TA_Stand_Guarding(20,0,8,0,"NW_MONASTERY_GRASS_VATRAS");
};

func void rtn_shipnew_439()
{
	TA_Stand_Guarding(8,0,22,0,"SHIP_DECK_01");
	TA_Stand_Guarding(22,0,8,0,"SHIP_DECK_01");
};

func void rtn_campon_439()
{
	TA_Stand_WP(9,0,23,0,"NW_BIGFARM_CAMPON_KDW_06");
	TA_Stand_WP(23,0,9,0,"NW_BIGFARM_CAMPON_KDW_06");
};

func void rtn_inbattle_439()
{
	ta_bigfight(8,0,22,0,"NW_BIGFIGHT_8687");
	ta_bigfight(22,0,8,0,"NW_BIGFIGHT_8687");
};

func void rtn_fleefrombattle_439()
{
	TA_FleeToWp(8,0,22,0,"NW_BIGFARM_PATH_04");
	TA_FleeToWp(22,0,8,0,"NW_BIGFARM_PATH_04");
};

