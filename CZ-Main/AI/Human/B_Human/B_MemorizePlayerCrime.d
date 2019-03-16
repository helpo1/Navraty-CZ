
func void B_MemorizePlayerCrime(var C_Npc slf,var C_Npc taeter,var int crime)
{
	if(!Npc_IsPlayer(taeter))
	{
		return;
	};
	if(slf.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(Npc_IsPlayer(taeter) && (HeroTrans == TRUE))
	{
		return;
	};
	if(slf.guild == GIL_DMT)
	{
		return;
	};
	if(slf.guild == GIL_SLD)
	{
		return;
	};
	if(TaverneFightStart == TRUE)
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NOV_603_Agon)) && (AgonCanFight == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_119_Assasin))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_1191_Assasin))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_432_Moe))
	{
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BAU_930_Sekob)) && (slf.aivar[AIV_ToughGuy] == TRUE))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_425_Regis))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_421_Valentino))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_480_Fellan))
	{
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BAU_935_Bronko))
	{
		return;
	};
	if(crime > B_GetPlayerCrime(slf))
	{
		B_DeletePetzCrime(slf);
		B_AddPetzCrime(slf,crime);
	};
	if(crime >= B_GetPlayerCrime(slf))
	{
		slf.aivar[AIV_NpcSawPlayerCommit] = crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] = Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] = B_GetCurrentAbsolutionLevel(slf);
	};
};

