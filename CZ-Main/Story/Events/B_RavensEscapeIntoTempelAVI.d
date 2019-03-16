
var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;

func void b_ravensescapeintotempelavi()
{
	if(B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RavenIsInTempel = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW,"Proniknul jsem do Ravenova sídla. Spatřil jsem ho, jak právě vchází do velké brány. Nebyl jsem schopen ho následovat. Tuším, že ta brána vede do Adanova chrámu. Musím to oznámit Saturasovi.");
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};

