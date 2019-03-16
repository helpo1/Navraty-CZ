
instance DIA_KARDOR_EXIT(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 999;
	condition = dia_kardor_exit_condition;
	information = dia_kardor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kardor_exit_condition()
{
	return TRUE;
};

func void dia_kardor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDOR_HELLO(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 1;
	condition = dia_kardor_hello_condition;
	information = dia_kardor_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Co tady děláš?";
};


func int dia_kardor_hello_condition()
{
	if(MEETKARDOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardor_hello_info()
{
	AI_Output(other,self,"DIA_Kardor_Hello_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_Kardor_Hello_01_02");	//Pokud nevidíš, připravuju se na boj.
	AI_Output(other,self,"DIA_Kardor_Hello_01_03");	//Jaký boj?
	AI_Output(self,other,"DIA_Kardor_Hello_01_04");	//Řeknu ti, chlape. Všechny zrůdy tady se dříve nebo později rozhodnou zaútočit na toto místo.
	AI_Output(self,other,"DIA_Kardor_Hello_01_05");	//A já nechci jen sedět a čekat!
	AI_Output(self,other,"DIA_Kardor_Hello_01_06");	//Musím odejít z tohoto bohem zapomenutého místa... A teď je příležitost!
	AI_Output(other,self,"DIA_Kardor_Hello_01_07");	//Jaká příležitost?
	AI_Output(self,other,"DIA_Kardor_Hello_01_08");	//Dyugo řekl, že teleport na vrchu pyramidy vede přímo do skřetího města.
	AI_Output(self,other,"DIA_Kardor_Hello_01_09");	//A když pomoci něho utečeme, asi se budeme muset probít skrz hordy těch zelenokožců.
	AI_Output(self,other,"DIA_Kardor_Hello_01_10");	//Je tam mnoho skřetů! Je tedy lepší umět dobře zacházet mečem.
	AI_Output(other,self,"DIA_Kardor_Hello_01_11");	//Dyugo řekl tento šílený plán i ostatním. To na, na co se chystáte, je samovražda!...
	AI_Output(other,self,"DIA_Kardor_Hello_01_12");	//Nikdy se nedostanete z jejich města. Neprojdete ani skrz první základnu!
	AI_Output(self,other,"DIA_Kardor_Hello_01_13");	//Možná jo, ale je to lepší než dopadnout jako ti, co se tu ztratili před tím.
	MEETKARDOR = TRUE;
};


instance DIA_KARDOR_HELLO_TEACH(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 1;
	condition = dia_kardor_hello_teach_condition;
	information = dia_kardor_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že to s mečem umíš dobře.";
};


func int dia_kardor_hello_teach_condition()
{
	if((MEETKARDOR == TRUE) && (KARDORTEACHER == TRUE) && (KARDORREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardor_hello_teach_info()
{
	AI_Output(other,self,"DIA_Kardor_Hello_Teach_01_01");	//Slyšel jsem, že to s mečem umíš dobře.
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_02");	//Pravda, pravda. V tomhle údolí těžko přežiješ, pokud se nedokážeš ubránit.
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_03");	//Můžu tě naučit, jak lépe zacházet s mečem.
	AI_Output(other,self,"DIA_Kardor_Hello_Teach_01_04");	//Trocha tréninku nikdy neublíží!
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_05");	//Řekni, když budeš připravený.
	KARDORREADYTEACH = TRUE;
};


instance DIA_KARDOR_TH(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 7;
	condition = dia_kardor_th_condition;
	information = dia_kardor_th_info;
	permanent = TRUE;
	description = "Začneme s tréninkem!";
};


func int dia_kardor_th_condition()
{
	if((MEETKARDOR == TRUE) && (KARDORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardor_th_choices()
{
	Info_ClearChoices(dia_kardor_th);
	Info_AddChoice(dia_kardor_th,Dialog_Back,dia_kardor_th_back);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_kardor_th_2h1);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_kardor_th_2h5);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_kardor_th_1h1);
	Info_AddChoice(dia_kardor_th,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_kardor_th_1h5);
};

func void dia_kardor_th_info()
{
	AI_Output(other,self,"DIA_Kardor_TH_01_01");	//Začneme s tréninkem!
	dia_kardor_th_choices();
};

func void dia_kardor_th_back()
{
	Info_ClearChoices(dia_kardor_th);
};

func void dia_kardor_th_2h1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_2h5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_1h1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	dia_kardor_th_choices();
};

func void dia_kardor_th_1h5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	dia_kardor_th_choices();
};

