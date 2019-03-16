
func void B_Upgrade_Hero_HackChance(var int Wert)
{
	var string concatText;
	concatText = ConcatStrings(PRINT_ADDON_HACKCHANCE,IntToString(Wert));
	concatText = ConcatStrings(concatText,")");
	AI_Print(concatText);
	Hero_HackChance = Hero_HackChance + Wert;
	Snd_Play("Geldbeutel");
};

