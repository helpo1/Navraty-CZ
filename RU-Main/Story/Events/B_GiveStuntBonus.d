
func void B_GiveStuntBonus_FUNC()
{
	if(StuntBonus_Once == FALSE)
	{
		Snd_Play("LevelUp");
		hero.exp = hero.exp + 200;
		AI_NoticePrint(3000,4098,NAME_ADDON_StuntBonus);
		StuntBonus_Once = TRUE;
		Snd_Play("THRILLJINGLE_01");
	}
	else
	{
		StuntBonus_Once = FALSE;
	};

	SC_MadeStunt = TRUE;
};

