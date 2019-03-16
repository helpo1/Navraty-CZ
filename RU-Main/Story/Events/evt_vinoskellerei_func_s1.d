
var int FoundVinosKellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP(XP_FoundVinosKellerei);

		if(MIS_FindKillPlace == LOG_Running)
		{
			B_LogEntry(TOPIC_FindKillPlace,"Отличное местечко, подальше от посторонних глаз! Думаю стоит навестить Шарлотту и расказать ей об этом месте.");
		};
	};
};

