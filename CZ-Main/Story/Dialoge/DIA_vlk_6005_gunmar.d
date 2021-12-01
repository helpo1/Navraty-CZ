
instance DIA_GUNMAR_EXIT(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 999;
	condition = dia_gunmar_exit_condition;
	information = dia_gunmar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gunmar_exit_condition()
{
	return TRUE;
};

func void dia_gunmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GUNMAR_HELLO(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 1;
	condition = dia_gunmar_hello_condition;
	information = dia_gunmar_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Jak to jde, příteli?";
};


func int dia_gunmar_hello_condition()
{
	if(MEETGUNMAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_gunmar_hello_info()
{
	AI_Output(other,self,"DIA_Gunmar_Hello_01_01");	//Jak to jde, příteli?
	AI_Output(self,other,"DIA_Gunmar_Hello_01_02");	//Co tu sakra děláš? Si spad z oblohy?!
	AI_Output(self,other,"DIA_Gunmar_Hello_01_04");	//Jediný smysl života, kterej tu je je ten, když přemýšlíš jak si zachránit kůži a přežít další den.
	AI_Output(self,other,"DIA_Gunmar_Hello_01_05");	//Kolem těchhle hord příšer není dobrej život.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_07");	//No, takovýhle život mě neláká.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_08");	//Ale jinak - neviděl jsi mezi těmi kreaturami nějaké draky?
	AI_Output(self,other,"DIA_Gunmar_Hello_01_09");	//Jen to ne, horší to už být nemůže.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_10");	//Jen se ptám...
	AI_Output(self,other,"DIA_Gunmar_Hello_01_11");	//Přestaň mě tímhle lekat.
	MEETGUNMAR = TRUE;
};


instance DIA_GUNMAR_HELLO_TEACH(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 1;
	condition = dia_gunmar_hello_teach_condition;
	information = dia_gunmar_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že jsi nejlepší střelec v okolí.";
};


func int dia_gunmar_hello_teach_condition()
{
	if((MEETGUNMAR == TRUE) && (GUNMARTEACHER == TRUE) && (GUNMARREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gunmar_hello_teach_info()
{
	AI_Output(other,self,"DIA_Gunmar_Hello_Teach_01_01");	//Slyšel jsem, že jsi nejlepší střelec v okolí.
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_02");	//To možná jsem, ale co s tím?
	AI_Output(other,self,"DIA_Gunmar_Hello_Teach_01_03");	//Mohl bys zdokonalit mou střelbu z luku.
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_04");	//To bych mohl...
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_05");	//Koneckonců, raději tě budu učit střílet z luku, než odpovídat na tvé otázky.
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_06");	//Dobrá, kdy začneme?
	GUNMARREADYTEACH = TRUE;
};


var int gunmar_merke_bow;

instance DIA_GUNMAR_TEACH(C_Info)
{
	npc = vlk_6005_gunmar;
	nr = 8;
	condition = dia_gunmar_teach_condition;
	information = dia_gunmar_teach_info;
	permanent = TRUE;
	description = "Nauč mě lépe střílet z luku.";
};


func int dia_gunmar_teach_condition()
{
	if((MEETGUNMAR == TRUE) && (GUNMARREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gunmar_teach_choices()
{
	Info_ClearChoices(dia_gunmar_teach);
	Info_AddChoice(dia_gunmar_teach,Dialog_Back,dia_gunmar_teach_back);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_gunmar_teach_crossbow_1);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_gunmar_teach_crossbow_5);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_gunmar_teach_bow_1);
	Info_AddChoice(dia_gunmar_teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),dia_gunmar_teach_bow_5);
};

func void dia_gunmar_teach_info()
{
	AI_Output(other,self,"DIA_Gunmar_Teach_01_01");	//Nauč mě lépe střílet z luku.
	AI_Output(self,other,"DIA_Gunmar_Teach_01_02");	//Dobrá, začněme.
	GUNMAR_MERKE_BOW = other.HitChance[NPC_TALENT_BOW];
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,100);
	dia_gunmar_teach_choices();
};

func void dia_gunmar_teach_back()
{
	if(GUNMAR_MERKE_BOW < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Gunmar_Teach_Back_01_01");	//Už jsi mnohem lepší. Trénuj ještě více a budeš lepší než já.
	};
	Info_ClearChoices(dia_gunmar_teach);
};

