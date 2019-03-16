
func void B_SummonedAssessTalk()
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
	{
		if(CountBelChos > 0)
		{
			CountBelChos -= 1;
		};
	};

	Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

func void ZS_MM_Rtn_Summoned()
{
	var int HalfDamageSumm;

	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector))
	{
		Npc_SetPercTime(self,1);
		Npc_PercEnable(self,PERC_ASSESSPLAYER,B_MM_AssessPlayer);
		Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_AssessDamage);
		Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_AssessOthersDamage);
		b_staminainvent();
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait)))
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	}
	else
	{
		Npc_PercEnable(self,PERC_ASSESSTALK,B_SummonedAssessTalk);
	};

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.aivar[AIV_TAPOSITION] = FALSE;

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	{
		if(self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
		{
			HalfDamageSumm = self.attribute[ATR_STRENGTH] * 2;

			self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + (ATR_INTELLECT / 2);

			if(self.attribute[ATR_STRENGTH] > HalfDamageSumm)
			{
				self.attribute[ATR_STRENGTH] = HalfDamageSumm;
			};

			self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		};
	};
	if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		Wld_PlayEffect("spellFX_Teleport_RING",self,self,0,0,0,FALSE);
	};

	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int ZS_MM_Rtn_Summoned_Loop()
{
	var int sumtimelive;
	var int randomMove;
	var int tickrun;
	var int WispSearchFlags;
	var int randy;

	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector))
	{
		b_staminainvent();
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	{
		Npc_PerceiveAll(self);
		WispSearchFlags = FALSE;

		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_NF)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_NF;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_FF)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_FF | ITEM_KAT_MUN;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_NONE)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_NONE | ITEM_KAT_KEYS | ITEM_KAT_LIGHT | ITEM_KAT_ARMOR;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_RUNE)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_RUNE | ITEM_KAT_DOCS;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_MAGIC)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_MAGIC;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_FOOD)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_FOOD;
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE) && ((WispSearching == WispSearch_ALL) || (WispSearching == WispSearch_POTIONS)))
		{
			WispSearchFlags = WispSearchFlags | ITEM_KAT_POTIONS;
		};
		if(WispSearchFlags != 0)
		{
			if(Wld_DetectItem(self,WispSearchFlags) == TRUE)
			{
				if(Hlp_IsValidItem(item) && (item.value > 0))
				{
					if(Npc_GetHeightToItem(self,item) < 500)
					{
						randy = Hlp_Random(100);
						AI_GotoItem(self,item);

						if(Npc_GetDistToNpc(self,hero) > 500)
						{
							Wld_PlayEffect("spellFX_ItemAusbuddeln",item,item,0,0,0,FALSE);
						};
					}
					else
					{
						if(Npc_GetDistToNpc(self,hero) > 500)
						{
							AI_GotoNpc(self,hero);
						};

						self.wp = Npc_GetNearestWP(self);
					};
				}
				else
				{
					if(Npc_GetDistToNpc(self,hero) > 500)
					{
						AI_GotoNpc(self,hero);
					};

					self.wp = Npc_GetNearestWP(self);
				};
			}
			else
			{
				if(Npc_GetDistToNpc(self,hero) > 500)
				{
					AI_GotoNpc(self,hero);
				};

				self.wp = Npc_GetNearestWP(self);
			};
		}
		else
		{
			if(Npc_GetDistToNpc(self,hero) > 500)
			{
				AI_GotoNpc(self,hero);
			};

			self.wp = Npc_GetNearestWP(self);
		};

		return LOOP_CONTINUE;
	};

	Npc_PerceiveAll(self);
	Npc_GetNextTarget(self);

	if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (hero.attribute[ATR_MANA] >= 1) && (RegenSummoned == TRUE))
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) + 1;
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 1;

			if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
			};
		};
	};
	//if((CountBelChos == FALSE) && ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc))))
	//{
	//	Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
	//	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	//};
	if((Npc_GetDistToNpc(self,hero) >= 2500) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
		{
			AI_Teleport(self,"TOT");
	
			if(HeroDragonLook == TRUE)
			{
				Wld_StopEffect("DRAGONLOOK_FX");	
				HeroDragonLook = FALSE;
			};
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
		{
			if(CountBelChos > 0)
			{
				CountBelChos -= 1;
			};
		};			

		Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
	};
	if((Npc_GetDistToNpc(self,hero) > 500) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		AI_GotoNpc(self,hero);

		if((Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
		{
			self.aivar[AIV_TAPOSITION] += 1;

			if(self.aivar[AIV_TAPOSITION] >= 60)
			{
				self.aivar[AIV_TAPOSITION] = FALSE;

				if(hero.attribute[ATR_MANA] < 1)
				{
					if(XARDAS_KNOWSSACTANOME == TRUE)
					{
						if(hero.attribute[ATR_HITPOINTS] > 1)
						{
							hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 1;
						}
						else
						{
							if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
							{
								AI_Teleport(self,"TOT");
	
								if(HeroDragonLook == TRUE)
								{
									Wld_StopEffect("DRAGONLOOK_FX");	
									HeroDragonLook = FALSE;
								};
							};
							if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
							{
								if(CountBelChos > 0)
								{
									CountBelChos -= 1;
								};
							};
				
							Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
							Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
						};
					}
					else
					{
						if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
						{
							AI_Teleport(self,"TOT");

							if(HeroDragonLook == TRUE)
							{
								Wld_StopEffect("DRAGONLOOK_FX");	
								HeroDragonLook = FALSE;
							};
						};
						if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
						{
							if(CountBelChos > 0)
							{
								CountBelChos -= 1;
							};
						};		
	
						Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
						Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
					};
				}
				else
				{
					if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE)
					{
						if(hero.attribute[ATR_MANA] >= 1)
						{
							hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 1;
						}
						else
						{
							hero.attribute[ATR_MANA] = 0;
						};
					}
					else
					{
						if(hero.attribute[ATR_MANA] >= 1)
						{
							hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 1;
						}	
						else
						{
							hero.attribute[ATR_MANA] = 0;
						};
					};
				};
			};
		};
	}
	else if((Npc_GetStateTime(self) >= 1) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Crait)) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector)))
	{
		self.aivar[AIV_TAPOSITION] = FALSE;

		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		if(hero.attribute[ATR_MANA] < 1)
		{
			if(XARDAS_KNOWSSACTANOME == TRUE)
			{
				if(hero.attribute[ATR_HITPOINTS] > 1)
				{
					hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - 1;
				}
				else
				{
					if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
					{
						AI_Teleport(self,"TOT");
	
						if(HeroDragonLook == TRUE)
						{
							Wld_StopEffect("DRAGONLOOK_FX");	
							HeroDragonLook = FALSE;
						};
					};
					if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
					{
						if(CountBelChos > 0)
						{
							CountBelChos -= 1;
						};
					};
			
					Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
					Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else
			{
				if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DRAGON)
				{
					AI_Teleport(self,"TOT");

					if(HeroDragonLook == TRUE)
					{
						Wld_StopEffect("DRAGONLOOK_FX");	
						HeroDragonLook = FALSE;
					};
				};
				if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Warrior_Chosen)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Skeleton_Orc)))
				{
					if(CountBelChos > 0)
					{
						CountBelChos -= 1;
					};
				};

				Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			};
		}
		else
		{
			if(self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON_MAGE)
			{
				if(hero.attribute[ATR_MANA] >= 1)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 1;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			}
			else
			{
				if(hero.attribute[ATR_MANA] >= 1)
				{
					hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - 1;
				}
				else
				{
					hero.attribute[ATR_MANA] = 0;
				};
			};
		};

		Npc_SetStateTime(self,0);
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Crait))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] += 1;
		};
		if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		};
		if(Npc_GetStateTime(self) > 10)
		{
			randomMove = Hlp_Random(10);

			if(randomMove == 0)
			{
				AI_PlayAni(self,"R_ROAM1");
			};
			if(randomMove == 1)
			{
				AI_PlayAni(self,"R_ROAM2");
			};
			if(randomMove == 2)
			{
				AI_PlayAni(self,"R_ROAM3");
			};
			if(randomMove == 3)
			{
				AI_PlayAni(self,"R_SCRATCHFLOOR");
			};
			if(randomMove == 4)
			{
				AI_PlayAni(self,"R_HOWL");
			};
			if(randomMove == 5)
			{
				AI_PlayAni(self,"R_SNIFF");
			};

			Npc_SetStateTime(self,0);
		};
		if(Npc_GetDistToNpc(self,hero) >= 3000)
		{
			Wld_PlayEffect("VOB_MAGICBURN",self,self,0,0,0,FALSE);
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
			CraitIsUp = FALSE;
			CraitCanUp = FALSE;
		};
	};

	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Summoned_End()
{
	b_staminainvent();
};