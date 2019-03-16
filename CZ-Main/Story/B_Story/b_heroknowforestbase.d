
func void b_heroknowforestbase()
{
	if(HEROKNOWFORESTBASE == FALSE)
	{
		Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
		B_LogEntry(TOPIC_XBS,"V lesích jsem objevil tábor, který vybudovala část bývalých sektářů z tábora v bažinách.");
		HEROKNOWFORESTBASE = TRUE;
	};
	if(!Npc_KnowsInfo(hero,dia_strf_1107_fleeinfo) && (MIS_OCCOOKFLEE == LOG_Running) && (OCCOOKFLEEINFO == FALSE))
	{
		B_LogEntry(TOPIC_OCCOOKFLEE,"Lesní tábor by byl vhodné útočiště pro kuchaře.");
		OCCOOKFLEEINFO = TRUE;
	};
};

