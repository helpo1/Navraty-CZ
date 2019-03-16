
func void InitPerceptions()
{
	Perc_SetRange(PERC_ASSESSDAMAGE,PERC_DIST_DRAGON_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSOTHERSDAMAGE,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSDEFEAT,WATCHFIGHT_DIST_MAX);
	Perc_SetRange(PERC_ASSESSMURDER,PERC_DIST_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSTHREAT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_DRAWWEAPON,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,1000);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTHEFT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSUSEMOB,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSENTERROOM,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSMAGIC,PERC_DIST_DRAGON_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSSTOPMAGIC,PERC_DIST_DRAGON_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSWARN,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_MOVEMOB,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSSURPRISE,FIGHT_DIST_CANCEL);
	Perc_SetRange(PERC_OBSERVEINTRUDER,100);
	Perc_SetRange(PERC_ASSESSREMOVEWEAPON,100);
	Perc_SetRange(PERC_CATCHTHIEF,150);
	Perc_SetRange(PERC_ASSESSCALL,100);
	Perc_SetRange(PERC_MOVENPC,100);
	Perc_SetRange(PERC_ASSESSCASTER,100);
	Perc_SetRange(PERC_NPCCOMMAND,100);
	Perc_SetRange(PERC_OBSERVESUSPECT,100);
};

func void Perception_Set_Normal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;

	if(Npc_KnowsInfo(self,1) || C_NpcIsGateGuard(self))
	{
		Npc_SetPercTime(self,0.2);
	}
	else
	{
		Npc_SetPercTime(self,1.3);
	};

	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessPortalCollision);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessThreat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessDrawWeapon);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_CATCHTHIEF,B_CatchThief);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
};

func void Perception_Set_Mount()
{
	self.senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessThreat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
};

func void Perception_Set_Minimal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_SetPercTime(self,1.0);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_CATCHTHIEF,B_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessPortalCollision);
};

func void perception_set_none()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = 0;
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
};

func void perception_set_orc()
{
	Npc_SetPercTime(self,1.5);

	if((self.flags & NPC_FLAG_GHOST) == 0)
	{
		self.senses = SENSE_HEAR | SENSE_SEE;
		self.senses_range = PERC_DIST_ACTIVE_MAX;
		self.aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
		self.aivar[AIV_MM_FollowInWater] = TRUE;
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessPlayer);
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
		Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		self.senses = 0;
		self.senses_range = 0;
		self.aivar[AIV_MM_FollowTime] = 0;
		self.aivar[AIV_MM_FollowInWater] = FALSE;
		Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
		Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
		Npc_PercDisable(self,PERC_ASSESSMURDER);
		Npc_PercDisable(self,PERC_ASSESSTALK);
		Npc_PercDisable(self,PERC_ASSESSPLAYER);
		Npc_PercDisable(self,PERC_ASSESSENEMY);
		Npc_PercDisable(self,PERC_ASSESSBODY);
		Npc_PercDisable(self,PERC_ASSESSMAGIC);
		Npc_PercDisable(self,PERC_ASSESSDAMAGE);
		Npc_PercDisable(self,PERC_ASSESSTHEFT);
		Npc_PercDisable(self,PERC_DRAWWEAPON);
		Npc_PercDisable(self,PERC_ASSESSENTERROOM);
		Npc_PercDisable(self,PERC_ASSESSTHREAT);
		Npc_PercDisable(self,PERC_ASSESSFIGHTSOUND);
		Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
		Npc_PercDisable(self,PERC_ASSESSWARN);
		Npc_PercDisable(self,PERC_ASSESSOTHERSDAMAGE);
		Npc_PercDisable(self,PERC_ASSESSSTOPMAGIC);
		Npc_PercDisable(self,PERC_ASSESSSURPRISE);
	};
};

func void Perception_Set_Monster_Rtn()
{
	self.senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	Npc_SetPercTime(self,1.5);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
};

func void perception_set_beliar_rtn()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_MM_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
};

func void perception_set_helper_rtn()
{
	self.senses = 0;
	self.senses_range = 0;
	self.aivar[AIV_MM_FollowTime] = 0;
	self.aivar[AIV_MM_FollowInWater] = FALSE;
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercDisable(self,PERC_ASSESSMURDER);
	Npc_PercDisable(self,PERC_ASSESSTALK);
	Npc_PercDisable(self,PERC_ASSESSPLAYER);
	Npc_PercDisable(self,PERC_ASSESSENEMY);
	Npc_PercDisable(self,PERC_ASSESSBODY);
	Npc_PercDisable(self,PERC_ASSESSMAGIC);
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_PercDisable(self,PERC_ASSESSTHEFT);
	Npc_PercDisable(self,PERC_DRAWWEAPON);
	Npc_PercDisable(self,PERC_ASSESSENTERROOM);
	Npc_PercDisable(self,PERC_ASSESSTHREAT);
	Npc_PercDisable(self,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(self,PERC_ASSESSWARN);
	Npc_PercDisable(self,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(self,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(self,PERC_ASSESSSURPRISE);
};