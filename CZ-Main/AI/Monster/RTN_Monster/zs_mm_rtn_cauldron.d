
func void zs_mm_rtn_cauldron()
{
	perception_set_helper_rtn();
	b_staminainvent();
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_mm_rtn_cauldron_loop()
{
	var string detMob;

	b_staminainvent_monster(self);

	if(Npc_GetStateTime(self) >= 7)
	{
		Npc_SetStateTime(self,0);
		if(Npc_GetBodyState(hero) == BS_MOBINTERACT_INTERRUPT)
		{
			detMob = Npc_GetDetectedMob(hero);
			if(Hlp_StrCmp(detMob,"CAULDRON"))
			{
				if(Npc_HasItems(hero,ItFo_Fish) >= 1)
				{
					Npc_RemoveInvItems(hero,ItFo_Fish,1);
					B_GiveInvItems(self,hero,ItFo_FishSoup,1);
				}
				else
				{
					AI_Print("Nemáš žádné ryby...");
					AI_Standup(hero);
				};
			};
		};
	};

	return LOOP_CONTINUE;
};

func void zs_mm_rtn_cauldron_end()
{
	b_staminainvent();
};

