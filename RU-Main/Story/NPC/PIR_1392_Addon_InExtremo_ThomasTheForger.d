
instance PIR_1392_Addon_InExtremo_ThomasTheForger(Npc_Default)
{
	name[0] = "Томас";
	npcType = npctype_main;
	guild = GIL_VLK;
	flags = 0;
	voice = 8;
	id = 1392;
	flags = 0;
	attribute[ATR_STRENGTH] = 20;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 88;
	attribute[ATR_HITPOINTS] = 88;
	CreateInvItem(self,ItMi_IECello);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"HUM_IE_THOMAS_INSTRUMENT",DEFAULT,DEFAULT,"HUM_HEAD_THOMAS",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	daily_routine = Rtn_Start_1392;
};


func void Rtn_Start_1392()
{
	TA_Concert(8,0,20,0,"OCR_IE_THOMAS");
	TA_Stand_Eating(20,0,8,0,"OCR_IE_THOMAS");
};

