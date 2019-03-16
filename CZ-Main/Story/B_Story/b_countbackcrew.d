
func void b_countbackcrew()
{
	if((MIS_HELPCREW == LOG_Running) && (PERMCOUNTBACKNW >= GLOBALCOUNTBACKNW) && (MOVECREWTOHOME == FALSE))
	{
		Log_AddEntry(TOPIC_HELPCREW,"Mluvil jsem s každým na lodi. Sám Innos nechť rozhodne o našem osudu!");
		MOVECREWTOHOME = TRUE;
	};
	if(PYROKARUSEONCE == FALSE)
	{
		PYROKARUSEONCE = TRUE;
	};
};

