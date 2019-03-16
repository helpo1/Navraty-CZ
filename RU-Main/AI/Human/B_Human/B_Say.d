
func void B_Say(var C_Npc slf,var C_Npc oth,var string text)
{
	AI_OutputSVM(slf,oth,text);
};

func void B_Say_Sound(var C_Npc slf,var C_Npc oth,var string text)
{
	AI_Output(slf,oth,text);
};
