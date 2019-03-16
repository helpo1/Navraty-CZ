
func void b_readydgjattack()
{
	if((MIS_STURMCASTLE == LOG_Running) && (DGJJOINPALADIN == TRUE))
	{
		if(!Npc_IsDead(DJG_708_Kurgan))
		{
			B_StartOtherRoutine(DJG_708_Kurgan,"Sturm");
		};
		if(!Npc_IsDead(DJG_710_Kjorn))
		{
			B_StartOtherRoutine(DJG_710_Kjorn,"Sturm");
		};
		if(!Npc_IsDead(DJG_712_Hokurn))
		{
			B_StartOtherRoutine(DJG_712_Hokurn,"Sturm");
		};
		if(!Npc_IsDead(DJG_711_Godar))
		{
			B_StartOtherRoutine(DJG_711_Godar,"Sturm");
		};
		if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
		{
			B_StartOtherRoutine(DJG_702_Rod,"Sturm");
		};
		if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
		{
			B_StartOtherRoutine(DJG_703_Cipher,"Sturm");
		};
		if(!Npc_IsDead(DJG_713_Biff) && ((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running)))
		{
			B_StartOtherRoutine(DJG_713_Biff,"Sturm");
		};
	};
};

func void b_readydgjmove()
{
	if((DGJMOVEPALADIN == TRUE) && (DGJMOVEPALADINONCE == FALSE))
	{
		DGJMOVEPALADINONCE = TRUE;
		if(!Npc_IsDead(DJG_708_Kurgan))
		{
			B_StartOtherRoutine(DJG_708_Kurgan,"Sturm");
		};
		if(!Npc_IsDead(DJG_710_Kjorn))
		{
			B_StartOtherRoutine(DJG_710_Kjorn,"Sturm");
		};
		if(!Npc_IsDead(DJG_712_Hokurn))
		{
			B_StartOtherRoutine(DJG_712_Hokurn,"Sturm");
		};
		if(!Npc_IsDead(DJG_711_Godar))
		{
			B_StartOtherRoutine(DJG_711_Godar,"Sturm");
		};
		if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
		{
			B_StartOtherRoutine(DJG_702_Rod,"Sturm");
		};
		if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
		{
			B_StartOtherRoutine(DJG_703_Cipher,"Sturm");
		};
		if(!Npc_IsDead(DJG_713_Biff) && ((Biff_FollowsThroughPass != LOG_SUCCESS) || (Biff_FollowsThroughPass != LOG_Running)))
		{
			B_StartOtherRoutine(DJG_713_Biff,"Sturm");
		};
	};
};

