
var int FoundVinosKellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP(XP_FoundVinosKellerei);

		if(MIS_FindKillPlace == LOG_Running)
		{
			B_LogEntry(TOPIC_FindKillPlace,"Vynikající místečko vzdálené od zvědavých očí! Myslím, že stojí za to navštívit Charlotte a říct jí o tomto místě.");
		};
	};
};

