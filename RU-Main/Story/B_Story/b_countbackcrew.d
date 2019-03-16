
func void b_countbackcrew()
{
	if((MIS_HELPCREW == LOG_Running) && (PERMCOUNTBACKNW >= GLOBALCOUNTBACKNW) && (MOVECREWTOHOME == FALSE))
	{
		Log_AddEntry(TOPIC_HELPCREW,"Я поговорил со всеми, кто находился на корабле. Теперь только Иннос решит - кому жить, а кому нет!");
		MOVECREWTOHOME = TRUE;
	};
	if(PYROKARUSEONCE == FALSE)
	{
		PYROKARUSEONCE = TRUE;
	};
};

