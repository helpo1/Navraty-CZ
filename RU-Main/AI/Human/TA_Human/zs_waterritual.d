
var int saturasritualready;
var int cronosritualready;
var int nefariusritualready;
var int merdarionritualready;

func void zs_waterritual()
{
	Perception_Set_Normal();
	Npc_PercDisable(self,PERC_ASSESSMAGIC);
	B_ResetAll(self);
	b_staminainvent();
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	self.aivar[AIV_MM_EatGroundStart] = FALSE;
};

func int zs_waterritual_loop()
{
	var int randy;
	var int randyKDW;
	var int randyKDW_Lightstar;

	B_CheckHealth(self);
	randyKDW = Hlp_Random(2500);
	randyKDW_Lightstar = Hlp_Random(2);

	if(WATERMAGESTART == FALSE)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW))
		{
			if((SATURASRITUALREADY == FALSE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_05") < 400))
			{
				SATURASRITUALREADY = TRUE;
				self.aivar[AIV_INVINCIBLE] = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14010_Addon_Cronos_ADW))
		{
			if((CRONOSRITUALREADY == FALSE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_08") < 400))
			{
				CRONOSRITUALREADY = TRUE;
				self.aivar[AIV_INVINCIBLE] = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14020_Addon_Nefarius_ADW))
		{
			if((NEFARIUSRITUALREADY == FALSE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_03") < 400))
			{
				NEFARIUSRITUALREADY = TRUE;
				self.aivar[AIV_INVINCIBLE] = TRUE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14050_Addon_Merdarion_ADW))
		{
			if((MERDARIONRITUALREADY == FALSE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RHADEMES_18") < 400))
			{
				MERDARIONRITUALREADY = TRUE;
				self.aivar[AIV_INVINCIBLE] = TRUE;
			};
		};
		if((SATURASRITUALREADY == TRUE) && (CRONOSRITUALREADY == TRUE) && (NEFARIUSRITUALREADY == TRUE) && (MERDARIONRITUALREADY == TRUE))
		{
			WATERMAGESTART = TRUE;
			return LOOP_CONTINUE;
		};
	};
	if((WATERMAGESTART == TRUE) && (WATERMAGESTOP == FALSE))
	{
		self.aivar[AIV_EnemyOverride] = TRUE;
		self.aivar[AIV_INVINCIBLE] = TRUE;

		if(Npc_GetStateTime(self) > randyKDW)
		{
			APPEARMONSTER = APPEARMONSTER + 1;
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(randyKDW_Lightstar == 0)
			{
				Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
			}
			else if(randyKDW_Lightstar == 1)
			{
				Wld_PlayEffect("spellFX_RingRitual2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
		if(APPEARMONSTER >= 20)
		{
			if(FIRSTWAVEMONSTERSTART == FALSE)
			{
				Wld_InsertNpc(waterritualzombie_01,"FP_STAND_BWM_02");
				Wld_InsertNpc(waterritualzombie_02,"FP_STAND_BWM_01");
				Wld_InsertNpc(waterritualzombie_03,"FP_ROAM_ADANOSTEMPEL_ORC_05");
				Wld_InsertNpc(waterritualzombie_04,"FP_STAND_BWM_03");
				FIRSTWAVEMONSTERSTART = TRUE;
				APPEARMONSTER = 0;
			};
			if((FIRSTWAVEMONSTERSTOP == TRUE) && (SECONDWAVEMONSTERSTART == FALSE))
			{
				Wld_InsertNpc(waterritualdarkskeleton_01,"FP_ROAM_ADANOSTEMPEL_ORC_06");
				Wld_InsertNpc(waterritualdarkskeleton_02,"FP_ROAM_ADANOSTEMPEL_ORC_05");
				Wld_InsertNpc(waterritualdarkskeleton_03,"FP_STAND_BWM_01");
				SECONDWAVEMONSTERSTART = TRUE;
				APPEARMONSTER = 0;
			};
			if((SECONDWAVEMONSTERSTOP == TRUE) && (THIRDWAVEMONSTERSTART == FALSE))
			{
				Wld_InsertNpc(waterritualknightdeath_01,"FP_STAND_BWM_01");
				Wld_InsertNpc(waterritualknightdeath_02,"FP_STAND_BWM_02");
				THIRDWAVEMONSTERSTART = TRUE;
				APPEARMONSTER = 0;
			};
			if((THIRDWAVEMONSTERSTOP == TRUE) && (FORTHWAVEMONSTERSTART == FALSE))
			{
				Wld_InsertNpc(waterritualskeletonlord,"FP_STAND_BWM_04");
				FORTHWAVEMONSTERSTART = TRUE;
				APPEARMONSTER = 0;
			};
			if((FORTHWAVEMONSTERSTOP == TRUE) && (FIFTHWAVEMONSTERSTART == FALSE))
			{
				Wld_InsertNpc(waterritualdemon,"FP_STAND_BWM_04");
				FIFTHWAVEMONSTERSTART = TRUE;
				APPEARMONSTER = 0;
			};
			if((FIFTHWAVEMONSTERSTOP == TRUE) && (WATERMAGESTOP == FALSE))
			{
				WATERMAGESTOP = TRUE;
				APPEARMONSTER = 0;
				Wld_SendTrigger("EVT_TRIGGER_ADANOSARISE_POWER");
				AI_Print(PRINT_ADANOSRETURNTEMPELPOWER);
			};
		};
	};
	if(WATERMAGESTOP == TRUE)
	{
		if(Npc_GetStateTime(self) > randyKDW)
		{
			APPEARMONSTER = APPEARMONSTER + 1;
			AI_AlignToWP(self);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(randyKDW_Lightstar == 0)
			{
				Wld_PlayEffect("spellFX_RingRitual1",self,self,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",self,self,0,0,0,FALSE);
			}
			else if(randyKDW_Lightstar == 1)
			{
				Wld_PlayEffect("spellFX_RingRitual2",self,self,0,0,0,FALSE);
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
		if(APPEARMONSTER >= 10)
		{
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_waterritual_end()
{
	b_staminainvent();
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(WATERMAGESTOP == TRUE)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(KDW_14000_Addon_Saturas_ADW))
		{
			STOPWATERRITUAL = TRUE;
		};

		self.aivar[AIV_EnemyOverride] = FALSE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	};
};

