
func void b_heroknowforestbase()
{
	if(HEROKNOWFORESTBASE == FALSE)
	{
		Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
		B_LogEntry(TOPIC_XBS,"Я нашел лесной лагерь, в котором живет небольшая часть бывшего Братства Спящего.");
		HEROKNOWFORESTBASE = TRUE;
	};
	if(!Npc_KnowsInfo(hero,dia_strf_1107_fleeinfo) && (MIS_OCCOOKFLEE == LOG_Running) && (OCCOOKFLEEINFO == FALSE))
	{
		B_LogEntry(TOPIC_OCCOOKFLEE,"Надо бы предложить Лесной лагерь повару в качестве убежища.");
		OCCOOKFLEEINFO = TRUE;
	};
};

