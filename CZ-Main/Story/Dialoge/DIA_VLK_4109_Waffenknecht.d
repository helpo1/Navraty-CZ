
instance DIA_WAFFEN4109_EXIT(C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 999;
	condition = dia_waffen4109_exit_condition;
	information = dia_waffen4109_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_waffen4109_exit_condition()
{
	return TRUE;
};

func void dia_waffen4109_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAFFEN4109_HALLO(C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 1;
	condition = dia_waffen4109_hallo_condition;
	information = dia_waffen4109_hallo_info;
	description = "Hej, jak to jde?";
	permanent = TRUE;
};


func int dia_waffen4109_hallo_condition()
{
	return TRUE;
};


var int waffen4109firsttime;

func void dia_waffen4109_hallo_info()
{
	AI_Output(other,self,"DIA_Waffen4109_HALLO_15_00");	//Hej, jak to jde?
	if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other,"DIA_Waffen4109_HALLO_03_01");	//Ten zatracený kuchař zdrhnul a já tu musím vařit.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Waffen4109_HALLO_03_02");	//Myslíš, že je to zdravé? Celé dny tu stát u krabic?
		if(WAFFEN4109FIRSTTIME == FALSE)
		{
			AI_Output(other,self,"DIA_Waffen4109_HALLO_15_01");	//Co jinak děláš?
			AI_Output(self,other,"DIA_Waffen4109_HALLO_03_03");	//Vyrábím šípy. Potřebujeme hodně šípu.
			AI_Output(other,self,"DIA_Waffen4109_HALLO_15_02");	//Jo, to dá logiku.
			if(KNOWHOWTOMAKEARROWS == FALSE)
			{
				AI_Output(other,self,"DIA_Waffen4109_HALLO_15_03");	//Ty umíš vyrábět šípy? Nauč mě to!
				AI_Output(self,other,"DIA_Waffen4109_HALLO_03_04");	//Hmm... Myslíš, že já na to mám čas?
				AI_Output(self,other,"DIA_Waffen4109_HALLO_03_05");	//Poohlédni se jinde.
			};
			WAFFEN4109FIRSTTIME = TRUE;
		};
	};
};
