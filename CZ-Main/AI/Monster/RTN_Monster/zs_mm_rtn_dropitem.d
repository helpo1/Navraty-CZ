
func void zs_mm_rtn_dropitem()
{
	perception_set_helper_rtn();
	b_staminainvent();
	B_MM_DeSynchronize();

	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

var int herohasanitem;

func int zs_mm_rtn_dropitem_loop()
{
	b_staminainvent_monster(self);

	if(Npc_GetStateTime(self) >= 2)
	{
		Npc_SetStateTime(self,0);
		return LOOP_END;
	};

	return LOOP_CONTINUE;
};

func void zs_mm_rtn_dropitem_end()
{
	b_staminainvent();
	self.flags = NPC_FLAG_GHOST;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};