func int B_DeSynchronize()
{
	var int msec;
	msec = Hlp_Random(1000);
	AI_Waitms(self,msec);
	return TRUE;
};

func void B_AddPetzCrime(var C_Npc slf,var int crime)
{
	if(C_NpcBelongsToOldCamp(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_OldCamp_Murder = PETZCOUNTER_OldCamp_Murder + 1;
			GLOBAL_OLDCAMP_MURDER = GLOBAL_OLDCAMP_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_OldCamp_Theft = PETZCOUNTER_OldCamp_Theft + 1;
			GLOBAL_OLDCAMP_THEFT = GLOBAL_OLDCAMP_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_OldCamp_Attack = PETZCOUNTER_OldCamp_Attack + 1;
			GLOBAL_OLDCAMP_ATTACK = GLOBAL_OLDCAMP_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_OldCamp_Sheepkiller = PETZCOUNTER_OldCamp_Sheepkiller + 1;
		};
	};
	if(C_NpcBelongsToCity(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_City_Murder = PETZCOUNTER_City_Murder + 1;
			GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_City_Theft = PETZCOUNTER_City_Theft + 1;
			GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_City_Attack = PETZCOUNTER_City_Attack + 1;
			GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_City_Sheepkiller = PETZCOUNTER_City_Sheepkiller + 1;
			AI_PrintClr("Ваше убийство овец не осталось незамеченным!",223, 121, 0);
		};
	};
	if(C_NpcBelongsToMonastery(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_Monastery_Murder = PETZCOUNTER_Monastery_Murder + 1;
			GLOBAL_MONASTERY_MURDER = GLOBAL_MONASTERY_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_Monastery_Theft = PETZCOUNTER_Monastery_Theft + 1;
			GLOBAL_MONASTERY_THEFT = GLOBAL_MONASTERY_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Monastery_Attack = PETZCOUNTER_Monastery_Attack + 1;
			GLOBAL_MONASTERY_ATTACK = GLOBAL_MONASTERY_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Monastery_Sheepkiller = PETZCOUNTER_Monastery_Sheepkiller + 1;
			AI_PrintClr("Ваше убийство овец не осталось незамеченным!",223, 121, 0);
		};
	};
	if(C_NpcBelongsToFarm(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_Farm_Murder = PETZCOUNTER_Farm_Murder + 1;
			GLOBAL_FARM_MURDER = GLOBAL_FARM_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_Farm_Theft = PETZCOUNTER_Farm_Theft + 1;
			GLOBAL_FARM_THEFT = GLOBAL_FARM_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Farm_Attack = PETZCOUNTER_Farm_Attack + 1;
			GLOBAL_FARM_ATTACK = GLOBAL_FARM_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
		if(crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Farm_Sheepkiller = PETZCOUNTER_Farm_Sheepkiller + 1;
			AI_PrintClr("Ваше убийство овец не осталось незамеченным!",223, 121, 0);
		};
		if(((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BAU_910_Maria)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BAU_911_Elena))) && ((ONARTOMM1 == 5) || (ONARTOMM1 == 6)))
		{
			PETZCOUNTER_Farm_Attack = PETZCOUNTER_Farm_Attack + 10;
			GLOBAL_FARM_ATTACK = GLOBAL_FARM_ATTACK + 10;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
	};
	if(C_NpcBelongsToBL(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_BL_Murder = PETZCOUNTER_BL_Murder + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_BL_Theft = PETZCOUNTER_BL_Theft + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_BL_Attack = PETZCOUNTER_BL_Attack + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
	};
	if(c_npcbelongstocoast(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_COAST_MURDER = PETZCOUNTER_COAST_MURDER + 1;
			GLOBAL_COAST_MURDER = GLOBAL_COAST_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_COAST_THEFT = PETZCOUNTER_COAST_THEFT + 1;
			GLOBAL_COAST_THEFT = GLOBAL_COAST_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_COAST_ATTACK = PETZCOUNTER_COAST_ATTACK + 1;
			GLOBAL_COAST_ATTACK = GLOBAL_COAST_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
	};
	if(c_npcbelongstopsicamp(slf))
	{
		if(crime == CRIME_MURDER)
		{
			PETZCOUNTER_PSICAMP_MURDER = PETZCOUNTER_PSICAMP_MURDER + 1;
			GLOBAL_PSICAMP_MURDER = GLOBAL_PSICAMP_MURDER + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше убийство не осталось незамеченным!",177,58,17);
		};
		if(crime == CRIME_THEFT)
		{
			PETZCOUNTER_PSICAMP_THEFT = PETZCOUNTER_PSICAMP_THEFT + 1;
			GLOBAL_PSICAMP_THEFT = GLOBAL_PSICAMP_THEFT + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваше воровство не осталось незамеченным!",223, 121, 0);
		};
		if(crime == CRIME_ATTACK)
		{
			PETZCOUNTER_PSICAMP_ATTACK = PETZCOUNTER_PSICAMP_ATTACK + 1;
			GLOBAL_PSICAMP_ATTACK = GLOBAL_PSICAMP_ATTACK + 1;
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
			AI_PrintClr("Ваша драка не осталась незамеченной!",223, 121, 0);
		};
	};
};

