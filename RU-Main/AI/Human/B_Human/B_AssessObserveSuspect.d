
func void B_AssessObserveSuspect()
{
	self.aivar[AIV_MM_EatGroundStart] = FALSE;

	if(Npc_IsPlayer(other) && (HeroInvisible == TRUE))
	{
		return;
	};
};

