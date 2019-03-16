
func void orcchestopen_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ULUMULUISEQUIP = FALSE;
	};
};

func void orcoldchestopen_s1()
{
	if(MIS_OldOrcKey == LOG_Running)
	{
		B_GivePlayerXP(500);
		Npc_RemoveInvItems(hero,ItKe_OldOrcKey,1);
		MIS_OldOrcKey = LOG_Success;
		Log_SetTopicStatus(TOPIC_OldOrcKey,LOG_Success);
		B_LogEntry(TOPIC_OldOrcKey,"Я нашел сундук, к которому подходит ключ.");
	};
};
