
instance DIA_NOFELD_EXIT(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 999;
	condition = dia_nofeld_exit_condition;
	information = dia_nofeld_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nofeld_exit_condition()
{
	return TRUE;
};

func void dia_nofeld_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOFELD_HELLO(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 1;
	condition = dia_nofeld_hello_condition;
	information = dia_nofeld_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Zdravím.";
};


func int dia_nofeld_hello_condition()
{
	if(MEETNOFELD == FALSE)
	{
		return TRUE;
	};
};

func void dia_nofeld_hello_info()
{
	AI_Output(other,self,"DIA_Nofeld_Hello_01_01");	//Zdravím.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_02");	//Á, ty jsi ten nováček. Jak se ti líbí tábor?
	AI_Output(other,self,"DIA_Nofeld_Hello_01_03");	//No, je... Pěkný.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_04");	//Není nic moc, ale hlavně, že je tu teplo a nemusíš se bát o život.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_05");	//Né jako venku. Vždy tam je něco nebezpečné a musíš být ve střehu!
	AI_Output(self,other,"DIA_Nofeld_Hello_01_06");	//Těžko si můžeš oddýchnout, pokud nejsi mrtvola. A vůbec nemůžeš tušit, jestli se k tobě někdo nepřiplíží a nepodřeže ti hrdlo.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_07");	//A tady na tebe nic neútočí?
	AI_Output(self,other,"DIA_Nofeld_Hello_01_08");	//Ne... Ještě se tak nestalo! A kdyby jo, chlapče, hned si nepozvané návštěvníky všimnu.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_10");	//Jinak, nestřetl jsi tu něco jako draka?
	AI_Output(self,other,"DIA_Nofeld_Hello_01_11");	//Draka?... Ne, nestřetl. Vždy jsem myslel, že to jsou jenom pohádky.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_12");	//Aha.
	MEETNOFELD = TRUE;
};


instance DIA_NOFELD_HELLO_TEACH(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 1;
	condition = dia_nofeld_hello_teach_condition;
	information = dia_nofeld_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že jsi šikovný chlapík.";
};


func int dia_nofeld_hello_teach_condition()
{
	if((MEETNOFELD == TRUE) && (NOFELDTEACHER == TRUE) && (NOFELDREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_nofeld_hello_teach_info()
{
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_01");	//Slyšel jsem, že jsi šikovný chlapík.
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_02");	//A?
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_03");	//Přemýšlel jsem, jestli bys mi nepomohl stát se obratnějším.
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_04");	//No... mohl bych ti ukázat několik triků, po kterých se tvá obratnost zvýší.
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_05");	//Ukážeš mi je?
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_06");	//Proč ne? Řekni mi, když budeš připravený.
	NOFELDREADYTEACH = TRUE;
};


var int nofeld_merkedex;

instance DIA_NOFELD_TEACH(C_Info)
{
	npc = vlk_6003_nofeld;
	nr = 20;
	condition = dia_nofeld_teach_condition;
	information = dia_nofeld_teach_info;
	permanent = TRUE;
	description = "Začneme s tréninkem.";
};


func int dia_nofeld_teach_condition()
{
	if((MEETNOFELD == TRUE) && (NOFELDREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_nofeld_teach_info()
{
	AI_Output(other,self,"DIA_Nofeld_Teach_01_01");	//Začneme s tréninkem.
	NOFELD_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

func void dia_nofeld_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > NOFELD_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Nofeld_Teach_Back_01_01");	//Právě ses stal obratnějším!
	};
	Info_ClearChoices(dia_nofeld_teach);
};

func void dia_nofeld_teach_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

func void dia_nofeld_teach_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_nofeld_teach);
	Info_AddChoice(dia_nofeld_teach,Dialog_Back,dia_nofeld_teach_back);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_nofeld_teach_1);
	Info_AddChoice(dia_nofeld_teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_nofeld_teach_5);
};

