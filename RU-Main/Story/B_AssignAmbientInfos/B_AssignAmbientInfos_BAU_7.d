
instance DIA_BAU_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_BAU_7_EXIT_Condition;
	information = DIA_BAU_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BAU_7_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_BAU_7_STANDARD_Condition;
	information = DIA_BAU_7_STANDARD_Info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other,self,"DIA_BAU_7_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_01");	//Мы объявили независимость - мы больше не платим налоги городу. Король все равно ничего не делает для нас. С нас хватит!
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_02");	//Сейчас мне нечего рассказать тебе.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_03");	//Все только и говорят о драконах! Король всегда найдет способ выжать побольше денег из простых людей.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_04");	//Будь осторожен: последнее время через проход толпами валят темные личности и различные дикие животные.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARZ_07_05");	//Тут только все и говорят о вторжении мертвяков. Чер побери, откуда они все взялись?!
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_BAU_7_STANDARD_07_06");	//Кажется, что мы скоро все умрем. Орки никого не пощадят!
	};
};

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	dia_bau_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_7_standard.npc = Hlp_GetInstanceID(slf);
};

