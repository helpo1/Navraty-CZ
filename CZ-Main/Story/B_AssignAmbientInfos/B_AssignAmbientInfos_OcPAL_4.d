
instance DIA_OCPAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCPAL_4_EXIT_Condition;
	information = DIA_OCPAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCPAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCPAL_4_PEOPLE_Condition;
	information = DIA_OCPAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_OCPAL_4_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCPAL_4_PEOPLE_04_01");	//Velitel Garond. Najdeš ho v tý největší budově tady uvnitř hradu.
};


instance DIA_OCPAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCPAL_4_LOCATION_Condition;
	information = DIA_OCPAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o Hornickém údolí?";
};


func int DIA_OCPAL_4_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_LOCATION_15_00");	//Co mi můžeš říct o Hornickém údolí?
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_01");	//Co vím, tak je tu několik dolů - pokud tedy všechny nepadly do drápů skřetům.
	AI_Output(self,other,"DIA_OCPAL_4_LOCATION_04_02");	//Jednotky z větší části sestávají z trestanců, ale najdeš tu i pár paladinů.
};


instance DIA_OCPAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCPAL_4_STANDARD_Condition;
	information = DIA_OCPAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_OCPAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCPAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Jak se vede?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_01");	//Obklíčili nás skřeti! Ale budeme se bránit do posledního muže. A Innos nám pomůže v boji proti drakům!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_02");	//Už je to pěkně dlouho, co skřeti zaútočili. Kde jsou ty zatracený posily?
			if(other.guild == GIL_DJG)
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_03");	//Nemůžeš přeci vážně věřit tomu, že ty jako drakobijec máš šanci proti VŠEM těm drakům?
			}
			else
			{
				AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_04");	//Ti takzvaní drakobijci toho moc nesvedou!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_05");	//Díky Innosovi! Ty zatracený potvory jsou poraženy!
		};
	};
	if(Kapitel == 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_06");	//Nezdá se, že by smrt draků skřety nějak vyvedla z míry. Proč u Innose konečně neodtáhnou? Děje se tu něco divnýho.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_07");	//Ta zpropadená brána se zasekla. Skřeti se valí do hradu a nic už je nemůže zastavit.
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_08");	//Někdo musí informovat lorda Hagena. Potřebujeme ho TADY.
		};
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_04_09");	//Hrad dobyli skřeti! Jen málo lidí přežilo.
	};
};

func void B_AssignAmbientInfos_OCPAL_4(var C_Npc slf)
{
	dia_ocpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

