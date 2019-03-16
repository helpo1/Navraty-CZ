
func void b_monstercount()
{
	var string concatText;

	if(SPECIESKILLED[4] >= 1)
	{
		concatText = "Мясных жуков: ";
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[1]));
		concatText = ConcatStrings(concatText,"\nОвец: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[2]));
		concatText = ConcatStrings(concatText,"\nГоблинов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[3]));
		concatText = ConcatStrings(concatText,"\nЧерных гоблинов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[4]));
		concatText = ConcatStrings(concatText,"\nСкелетов гоблина: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[5]));
		concatText = ConcatStrings(concatText,"\nВызванных Скелетов гоблина: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[6]));
		concatText = ConcatStrings(concatText,"\nПадальщиков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[7]));
		concatText = ConcatStrings(concatText,"\nЛуговых падальщиков/Крыс: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[8]));
		concatText = ConcatStrings(concatText,"\nПолевых жуков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[9]));
		concatText = ConcatStrings(concatText,"\nКровяных шершней: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[10]));
		concatText = ConcatStrings(concatText,"\nВаранов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[11]));
		concatText = ConcatStrings(concatText,"\nОгненных ящеров: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[12]));
		concatText = ConcatStrings(concatText,"\nВолков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[13]));
		concatText = ConcatStrings(concatText,"\nВаргов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[14]));
		concatText = ConcatStrings(concatText,"\nВызванных волков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[15]));
		concatText = ConcatStrings(concatText,"\nПолзунов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[16]));
		concatText = ConcatStrings(concatText,"\nВоинов ползунов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[17]));
		concatText = ConcatStrings(concatText,"\nШныгов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[18]));
		concatText = ConcatStrings(concatText,"\nСкелетов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[19]));
		concatText = ConcatStrings(concatText,"\nВызванных скелетов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[20]));
		concatText = ConcatStrings(concatText,"\nМагов скелетов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[21]));
		concatText = ConcatStrings(concatText,"\nЗомби: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[22]));
		concatText = ConcatStrings(concatText,"\nГлорхов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[23]));
		concatText = ConcatStrings(concatText,"\nДраконьих снепперов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[24]));
		concatText = ConcatStrings(concatText,"\nМракорисов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[25]));
		concatText = ConcatStrings(concatText,"\nМракорисов нежитей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[26]));
		concatText = ConcatStrings(concatText,"\nГарпий: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[27]));
		concatText = ConcatStrings(concatText,"\nКаменных големов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[28]));
		concatText = ConcatStrings(concatText,"\nОгненных големов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[29]));
		concatText = ConcatStrings(concatText,"\nЛедяных големов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[30]));
		concatText = ConcatStrings(concatText,"\nВызванных големов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[31]));
		concatText = ConcatStrings(concatText,"\nДемонов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[32]));
		concatText = ConcatStrings(concatText,"\nВызванных демонов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[33]));
		concatText = ConcatStrings(concatText,"\nЛордов демонов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[34]));
		concatText = ConcatStrings(concatText,"\nТроллей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[35]));
		concatText = ConcatStrings(concatText,"\nЧерных троллей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[36]));
		concatText = ConcatStrings(concatText,"\nБолотожоров: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[37]));
		concatText = ConcatStrings(concatText,"\nОгненных драконов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[38]));
		concatText = ConcatStrings(concatText,"\nЛедянных драконов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[39]));
		concatText = ConcatStrings(concatText,"\nКаменных драконов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[40]));
		concatText = ConcatStrings(concatText,"\nБолотных драконов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[41]));
		concatText = ConcatStrings(concatText,"\nДраконов нежитей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[42]));
		concatText = ConcatStrings(concatText,"\nКротокрысов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[43]));
		concatText = ConcatStrings(concatText,"\nВоинов орков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[44]));
		concatText = ConcatStrings(concatText,"\nШаманов орков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[45]));
		concatText = ConcatStrings(concatText,"\nЭлитных орков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[46]));
		concatText = ConcatStrings(concatText,"\nОрков нежитей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[47]));
		concatText = ConcatStrings(concatText,"\nДраконьих ящеров: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[48]));
		concatText = ConcatStrings(concatText,"\nОгоньков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[49]));
		concatText = ConcatStrings(concatText,"\nАллигаторов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[50]));
		concatText = ConcatStrings(concatText,"\nБолотных големов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[51]));
		concatText = ConcatStrings(concatText,"\nКаменных стражей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[52]));
		concatText = ConcatStrings(concatText,"\nДухов огня: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[53]));
		concatText = ConcatStrings(concatText,"\nВурдалаков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[54]));
		concatText = ConcatStrings(concatText,"\nЛедянных волков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[55]));
		concatText = ConcatStrings(concatText,"\nКусачей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[56]));
		concatText = ConcatStrings(concatText,"\nБритвозубов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[57]));
		concatText = ConcatStrings(concatText,"\nУтопленников: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[58]));
		concatText = ConcatStrings(concatText,"\nБолотных крыс: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[59]));
		concatText = ConcatStrings(concatText,"\nБогомолов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[60]));
		concatText = ConcatStrings(concatText,"\nВызванных каменных стражей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[61]));
		concatText = ConcatStrings(concatText,"\nВызванных зомби: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[62]));
		concatText = ConcatStrings(concatText,"\nКабанов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[63]));
		concatText = ConcatStrings(concatText,"\nЯдовитых болотных мух: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[64]));
		concatText = ConcatStrings(concatText,"\nЛесных гоблинов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[65]));
		concatText = ConcatStrings(concatText,"\nПум: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[66]));
		concatText = ConcatStrings(concatText,"\nРунных болотных мух: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[67]));
		concatText = ConcatStrings(concatText,"\nЛюциан: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[70]));
		concatText = ConcatStrings(concatText,"\nОрков-арбалетчиков: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[71]));
		concatText = ConcatStrings(concatText,"\nАзгалор, черный дракон: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[72]));
		concatText = ConcatStrings(concatText,"\nКрасный дракон: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[73]));
		concatText = ConcatStrings(concatText,"\nЗомби-стражей: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[74]));
		concatText = ConcatStrings(concatText,"\nИщущих: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[75]));
		concatText = ConcatStrings(concatText,"\nШаманы-нежить: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[76]));
		concatText = ConcatStrings(concatText,"\nПризраков рудокопа: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[78]));
		concatText = ConcatStrings(concatText,"\nДемоникон: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[79]));
		concatText = ConcatStrings(concatText,"\nОрков-воинов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[80]));
		concatText = ConcatStrings(concatText,"\nДуши: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[81]));
		concatText = ConcatStrings(concatText,"\nОбращенных воинов и Лордов: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[82]));
		concatText = ConcatStrings(concatText,"\nМорских черепах: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[83]));
		Log_CreateTopic("Героические достижения",LOG_NOTE);
		Log_AddEntry("Героические достижения",concatText);
		EXP_MADE_AKT = 25;
	};
};

func void b_reportcount()
{
	var int gameeff;
	var int gametime;
	var int monstctime;
	var string concatText;

	gametime = (TIME_HOUR * 3600) + (TIME_MINUTES * 60);

	if(Kapitel == 1)
	{
		concatText = "- Общая статистика игры -";
	};

	concatText = ConcatStrings(concatText,"\n\nГлава: ");
	concatText = ConcatStrings(concatText,IntToString(Kapitel));

	if(hero.guild == GIL_NDW)
	{
		concatText = ConcatStrings(concatText,"\nПослушник магов Воды");
	}
	else if(hero.guild == GIL_KDW)
	{
		concatText = ConcatStrings(concatText,"\nМаг Воды");
	}
	else if(hero.guild == GIL_KDF)
	{
		concatText = ConcatStrings(concatText,"\nМаг Огня");
	}
	else if(hero.guild == GIL_KDM)
	{
		concatText = ConcatStrings(concatText,"\nТемный маг");
	}
	else if(hero.guild == GIL_GUR)
	{
		concatText = ConcatStrings(concatText,"\nГуру Братства");
	}
	else if(hero.guild == GIL_TPL)
	{
		concatText = ConcatStrings(concatText,"\nСтраж Братства");
	}
	else if(hero.guild == GIL_SLD)
	{
		concatText = ConcatStrings(concatText,"\nНаемник");
	}
	else if(hero.guild == GIL_DJG)
	{
		concatText = ConcatStrings(concatText,"\nДраконоборец");
	}
	else if(hero.guild == GIL_PAL)
	{
		concatText = ConcatStrings(concatText,"\nПаладин");
	};
	if(SBMODE == 1)
	{
		concatText = ConcatStrings(concatText,"\nУровень сложности: Тяжелый");
	}
	else if(SBMODE == 2)
	{
		concatText = ConcatStrings(concatText,"\nnУровень сложности: Нормальный");
	}
	else if(SBMODE == 4)
	{
		concatText = ConcatStrings(concatText,"\nnУровень сложности: Легкий");
	};

	concatText = ConcatStrings(concatText,"\nИгровой день: ");
	concatText = ConcatStrings(concatText,IntToString(Wld_GetDay()));
	concatText = ConcatStrings(concatText,"\nВремя в игре (часов:минут): ");

	if(TIME_HOUR < 10)
	{
		concatText = ConcatStrings(concatText,"0");
	};

	concatText = ConcatStrings(concatText,IntToString(TIME_HOUR));
	concatText = ConcatStrings(concatText," : ");

	if(TIME_MINUTES < 10)
	{
		concatText = ConcatStrings(concatText,"0");
	};

	concatText = ConcatStrings(concatText,IntToString(TIME_MINUTES));
	concatText = ConcatStrings(concatText,"\nУбито монстров: ");

	if(Kapitel == 1)
	{
		Log_CreateTopic(TOPIC_HEROIC,LOG_NOTE);
	};

	Log_AddEntry(TOPIC_HEROIC,concatText);
};