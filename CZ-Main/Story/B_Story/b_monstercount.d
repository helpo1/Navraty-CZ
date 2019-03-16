
func void b_monstercount()
{
	var string concatText;

	if(SPECIESKILLED[4] >= 1)
	{
		concatText = "Žravá štěnice: ";
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[1]));
		concatText = ConcatStrings(concatText,"\nOvce: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[2]));
		concatText = ConcatStrings(concatText,"\nGoblin: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[3]));
		concatText = ConcatStrings(concatText,"\nČerný goblin: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[4]));
		concatText = ConcatStrings(concatText,"\nGobliní kostlivec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[5]));
		concatText = ConcatStrings(concatText,"\nVyvolaný gobliní kostlivec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[6]));
		concatText = ConcatStrings(concatText,"\nMrchožrout: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[7]));
		concatText = ConcatStrings(concatText,"\nStepní mrchožrout / Krysa: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[8]));
		concatText = ConcatStrings(concatText,"\nPolní škůdce: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[9]));
		concatText = ConcatStrings(concatText,"\nKrvavá moucha: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[10]));
		concatText = ConcatStrings(concatText,"\nJeštěr: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[11]));
		concatText = ConcatStrings(concatText,"\nOhnivý ještěr: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[12]));
		concatText = ConcatStrings(concatText,"\nVlk: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[13]));
		concatText = ConcatStrings(concatText,"\nWarg: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[14]));
		concatText = ConcatStrings(concatText,"\nVyvolaný vlk: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[15]));
		concatText = ConcatStrings(concatText,"\nDůlní červ: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[16]));
		concatText = ConcatStrings(concatText,"\nVálečník důlních červů: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[17]));
		concatText = ConcatStrings(concatText,"\nČíhavec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[18]));
		concatText = ConcatStrings(concatText,"\nKostlivec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[19]));
		concatText = ConcatStrings(concatText,"\nVyvolaný kostlivec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[20]));
		concatText = ConcatStrings(concatText,"\nKostlivý mág: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[21]));
		concatText = ConcatStrings(concatText,"\nZombie: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[22]));
		concatText = ConcatStrings(concatText,"\nChňapavec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[23]));
		concatText = ConcatStrings(concatText,"\nDračí chňapavec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[24]));
		concatText = ConcatStrings(concatText,"\nStínová šelma: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[25]));
		concatText = ConcatStrings(concatText,"\nNemrtvá stínová šelma: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[26]));
		concatText = ConcatStrings(concatText,"\nHarpyje: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[27]));
		concatText = ConcatStrings(concatText,"\nKamenný golem: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[28]));
		concatText = ConcatStrings(concatText,"\nOhnivý golem: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[29]));
		concatText = ConcatStrings(concatText,"\nLedový golem: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[30]));
		concatText = ConcatStrings(concatText,"\nVyvolaný golem: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[31]));
		concatText = ConcatStrings(concatText,"\nDémon: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[32]));
		concatText = ConcatStrings(concatText,"\nVyvolaný démon: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[33]));
		concatText = ConcatStrings(concatText,"\nArcidémon: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[34]));
		concatText = ConcatStrings(concatText,"\nTrol: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[35]));
		concatText = ConcatStrings(concatText,"\nČerný trol: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[36]));
		concatText = ConcatStrings(concatText,"\nMočálový žralok: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[37]));
		concatText = ConcatStrings(concatText,"\nOhnivý drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[38]));
		concatText = ConcatStrings(concatText,"\nLedový drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[39]));
		concatText = ConcatStrings(concatText,"\nKamenný drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[40]));
		concatText = ConcatStrings(concatText,"\nBažinný drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[41]));
		concatText = ConcatStrings(concatText,"\nNemrtvý drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[42]));
		concatText = ConcatStrings(concatText,"\nKrysokrt: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[43]));
		concatText = ConcatStrings(concatText,"\nSkřetí válečník: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[44]));
		concatText = ConcatStrings(concatText,"\nSkřetí šaman: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[45]));
		concatText = ConcatStrings(concatText,"\nElitní skřet: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[46]));
		concatText = ConcatStrings(concatText,"\nNemrtvý skřet: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[47]));
		concatText = ConcatStrings(concatText,"\nDračí ještěran: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[48]));
		concatText = ConcatStrings(concatText,"\nBludička: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[49]));
		concatText = ConcatStrings(concatText,"\nAligátor: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[50]));
		concatText = ConcatStrings(concatText,"\nBažinný golem: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[51]));
		concatText = ConcatStrings(concatText,"\nKamenný strážce: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[52]));
		concatText = ConcatStrings(concatText,"\nOhnivý duch: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[53]));
		concatText = ConcatStrings(concatText,"\nUpír: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[54]));
		concatText = ConcatStrings(concatText,"\nLedový vlk: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[55]));
		concatText = ConcatStrings(concatText,"\nKousavec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[56]));
		concatText = ConcatStrings(concatText,"\nBřitva: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[57]));
		concatText = ConcatStrings(concatText,"\nUtopenec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[58]));
		concatText = ConcatStrings(concatText,"\nMočálová krysa: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[59]));
		concatText = ConcatStrings(concatText,"\nKudlanka: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[60]));
		concatText = ConcatStrings(concatText,"\nVyvolaný kamenný strážce: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[61]));
		concatText = ConcatStrings(concatText,"\nVyvolaná zombie: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[62]));
		concatText = ConcatStrings(concatText,"\nDivočák: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[63]));
		concatText = ConcatStrings(concatText,"\nMočálový trubec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[64]));
		concatText = ConcatStrings(concatText,"\nLesní goblin: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[65]));
		concatText = ConcatStrings(concatText,"\nKamenná puma: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[66]));
		concatText = ConcatStrings(concatText,"\nVyvolaný močálový trubec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[67]));
		concatText = ConcatStrings(concatText,"\nLucian: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[70]));
		concatText = ConcatStrings(concatText,"\nSkřetí střelec: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[71]));
		concatText = ConcatStrings(concatText,"\nAzgalor, černý drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[72]));
		concatText = ConcatStrings(concatText,"\nRudý drak: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[73]));
		concatText = ConcatStrings(concatText,"\nZombie strážce: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[74]));
		concatText = ConcatStrings(concatText,"\nPátrač: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[75]));
		concatText = ConcatStrings(concatText,"\nNemrtvý šaman: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[76]));
		concatText = ConcatStrings(concatText,"\nDuch kopáče: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[78]));
		concatText = ConcatStrings(concatText,"\nDémonikon: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[79]));
		concatText = ConcatStrings(concatText,"\nSkřetí válečník: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[80]));
		concatText = ConcatStrings(concatText,"\nDuše: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[81]));
		concatText = ConcatStrings(concatText,"\nTemný rytíř / paladin: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[82]));
		concatText = ConcatStrings(concatText,"\nMořská želva: ");
		concatText = ConcatStrings(concatText,IntToString(SPECIESKILLED[83]));
		Log_CreateTopic("Hrdinské činy",LOG_NOTE);
		Log_AddEntry("Hrdinské činy",concatText);
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
		concatText = "- Obecné statistiky hry -";
	};

	concatText = ConcatStrings(concatText,"\n\nKapitola: ");
	concatText = ConcatStrings(concatText,IntToString(Kapitel));

	if(hero.guild == GIL_NDW)
	{
		concatText = ConcatStrings(concatText,"\nNovic mágů Vody");
	}
	else if(hero.guild == GIL_KDW)
	{
		concatText = ConcatStrings(concatText,"\nMág Vody");
	}
	else if(hero.guild == GIL_KDF)
	{
		concatText = ConcatStrings(concatText,"\nMág Ohně");
	}
	else if(hero.guild == GIL_KDM)
	{
		concatText = ConcatStrings(concatText,"\nMág Temnot");
	}
	else if(hero.guild == GIL_GUR)
	{
		concatText = ConcatStrings(concatText,"\nGuru Bratrstva");
	}
	else if(hero.guild == GIL_TPL)
	{
		concatText = ConcatStrings(concatText,"\nTemplář Bratrstva");
	}
	else if(hero.guild == GIL_SLD)
	{
		concatText = ConcatStrings(concatText,"\nŽoldák");
	}
	else if(hero.guild == GIL_DJG)
	{
		concatText = ConcatStrings(concatText,"\nDrakobijec");
	}
	else if(hero.guild == GIL_PAL)
	{
		concatText = ConcatStrings(concatText,"\nPaladin");
	};
	if(SBMODE == 1)
	{
		concatText = ConcatStrings(concatText,"\nObtížnost: Těžká");
	}
	else if(SBMODE == 2)
	{
		concatText = ConcatStrings(concatText,"\nObtížnost: Střední");
	}
	else if(SBMODE == 4)
	{
		concatText = ConcatStrings(concatText,"\nObtížnost: Lehká");
	};

	concatText = ConcatStrings(concatText,"\nHerní den: ");
	concatText = ConcatStrings(concatText,IntToString(Wld_GetDay()));
	concatText = ConcatStrings(concatText,"\nHerní čas (hodiny:minuty): ");

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
	concatText = ConcatStrings(concatText,"\nZabito příšer: ");

	if(Kapitel == 1)
	{
		Log_CreateTopic(TOPIC_HEROIC,LOG_NOTE);
	};

	Log_AddEntry(TOPIC_HEROIC,concatText);
};