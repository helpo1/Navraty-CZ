
var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;

func void b_ravensescapeintotempelavi()
{
	if(B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RavenIsInTempel = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW,"Я проник в покои Ворона. Я как раз смог увидеть, как он исчез за закрытой дверью. Я не смог за ним последовать. Я думаю, эта дверь ведет в храм Аданоса. Я должен сообщить об этом Сатурасу.");
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};

