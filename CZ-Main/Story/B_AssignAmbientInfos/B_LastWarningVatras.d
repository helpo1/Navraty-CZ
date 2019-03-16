
func void B_LastWarningVatras()
{
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_00");	//Co jsi to udělal, mizero?
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_01");	//My z řádu Vody jsme tě opakovaně varovali před oddáváním se zlu.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_02");	//K mým uším se doneslo, že jsi opustil cestu rovnováhy.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_03");	//Vraždící a plundrující procházel jsi krajem, obtěžkán pocitem viny z mnoha zločinů.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_04");	//Bezpočet nevinných lidí bylo zavražděno TVOU rukou.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_05");	//Teď jsi spojen s temnými silami.
};

func void B_VatrasPissedOff()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_00");	//Od teď již nemůžeš počítat s mou podporou.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOffPerm_Add_05_01");	//Zmizni!

	if(Vatras_IsOnBoard == LOG_SUCCESS)
	{
		Crewmember_Count = Crewmember_Count - 1;
	};

	Vatras_IsOnBoard = LOG_FAILED;
	self.flags = 0;
	VatrasPissedOffForever = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PRAY");
};

