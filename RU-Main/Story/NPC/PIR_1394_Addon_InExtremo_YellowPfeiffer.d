
instance PIR_1394_Addon_InExtremo_YellowPfeiffer(Npc_Default)
{
	name[0] = "Фейфер";
	npcType = npctype_main;
	guild = GIL_VLK;
	flags = 0;
	voice = 9;
	id = 1394;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IEDudelGelb);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"Hum_IE_Pfeiffer_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_Pfeiffer",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1394;
};


func void Rtn_Start_1394()
{
	TA_Concert(8,0,20,0,"OCR_IE_PFEIFFER");
	TA_Stand_Guarding(20,0,8,0,"OCR_IE_PFEIFFER");
};

