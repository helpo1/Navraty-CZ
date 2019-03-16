
var int EVT_ARCHOLDEAD_FUNC_OneTime;

func void evt_archoldead_func()
{
	if(Npc_IsDead(Skeleton_Lord_Archol))
	{
		Skeleton_Archol1.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol2.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol3.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol4.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol5.aivar[AIV_EnemyOverride] = FALSE;
		Skeleton_Archol6.aivar[AIV_EnemyOverride] = FALSE;
	};
	if(EVT_ARCHOLDEAD_FUNC_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_HallenVonIrdorath,"Я нашел что-то вроде храма. Он населен большим количеством неживых существ. Все напоминает мне об этом жалком Храме Спящего! Но на этот раз я не откажусь. Не в этот раз!");
		EVT_ARCHOLDEAD_FUNC_OneTime = TRUE;
	};
};

