
instance DIA_OCVLK_6_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_6_EXIT_Condition;
	information = DIA_OCVLK_6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_6_PEOPLE_Condition;
	information = DIA_OCVLK_6_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tady tomu velí?";
};


func int DIA_OCVLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//Kdo tady tomu velí?
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//Garond má velení nad celou pevností - nebo alespoň nad tím, co z ní zbylo.
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//Ale sám se prakticky o nic nestará - leda když se některý z jeho mužů dostane do potíží.
	if(Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//Pokud chceš nějaké vybavení, měl bys zajít za Engorem. Najdeš ho v domku naproti Garondovi.
	};
};


instance DIA_OCVLK_6_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_6_LOCATION_Condition;
	information = DIA_OCVLK_6_LOCATION_Info;
	permanent = TRUE;
	description = "Co mi můžeš říct o situaci v Hornickém údolí?";
};


func int DIA_OCVLK_6_LOCATION_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_OCVLK_6_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//Co mi můžeš říct o situaci v Hornickém údolí?
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//Ta skřetí palisáda mi dělá starosti. Raději ani nechci vědět, co za ní skřeti skrývají.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//Nejdřív se jich tu potulovalo jen pár - postavili palisádu. Pak jedné noci přitáhli i s obléhacími stroji.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//Měli jsme štěstí a podařilo se nám útok odrazit.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//Za tou zdí se rozprostírá moře. Pokud ještě připlujou další lodě se skřety na palubě, nebudeme mít žádnou šanci.
};


instance DIA_OCVLK_6_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_6_STANDARD_Condition;
	information = DIA_OCVLK_6_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_OCVLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_6_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//Jak se vede?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//Vstup do armády a bude se ti dobře dařit, říkali. A teď tohle!
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//Teď je pod trestem smrti zakázáno se jen přiblížit k zásobám potravin. Zdá se, že se Garond bojí, že bychom mohli vyplenit zásoby a pak vzít kramle. (zatrpklý smích)
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//Všichni pochcípeme hlady, pokud nás teda dřív neusmaží ti zatracení draci!
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//Drakobijci. Nenech se vysmát! Ti nic nezmůžou.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//Říká se, že všichni draci jsou mrtví! Teď máme šanci!
		};
	};
	if(Kapitel == 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//Tahle zpropadená ruda. Měli bychom ji všechnu shodit dolů z cimbuří. Pak by nás skřeti možná nechali na pokoji.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//Ty směšné bedny, které tak nedbale naházeli před vchod, nemůžou skřetům nijak překazit jejich plány!
		};
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_08");	//Ještě se musíš ptát, chlape? Rozhlédni se kolem sebe!
	};
};

func void B_AssignAmbientInfos_OCVLK_6(var C_Npc slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

