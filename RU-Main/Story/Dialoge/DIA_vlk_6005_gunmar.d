
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
	description = "Как жизнь, приятель?";
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
	AI_Output(other,self,"DIA_Gunmar_Hello_01_01");	//Как жизнь, приятель?
	AI_Output(self,other,"DIA_Gunmar_Hello_01_02");	//Какая тут жизнь?! Парень, ты что, с луны свалился, а?
	AI_Output(self,other,"DIA_Gunmar_Hello_01_04");	//Как назовешь жизнь, смысл которой заключается только в том, чтобы каждый день думать, как спасти свою шкуру.
	AI_Output(self,other,"DIA_Gunmar_Hello_01_05");	//Кругом бродят такие орды разных тварей и нежити, что на охоту уже страшно выходить.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_07");	//Да уж, спокойной жизнью это точно не назовешь.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_08");	//Кстати, кроме орд нежити и прочих мерзких тварей ты, случайно, дракона в этих краях не видел?
	AI_Output(self,other,"DIA_Gunmar_Hello_01_09");	//Только дракона тут и не хватало! И так ступить шага в этих краях нельзя без того, чтобы не нарваться на неприятности.
	AI_Output(other,self,"DIA_Gunmar_Hello_01_10");	//Не кипятись, я просто спросил...
	AI_Output(self,other,"DIA_Gunmar_Hello_01_11");	//Хватит ко мне лезть со всякими странного рода вопросами. Лучше займись чем-нибудь полезным.
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
	description = "Говорят, ты лучший стрелок в округе.";
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
	AI_Output(other,self,"DIA_Gunmar_Hello_Teach_01_01");	//Говорят, ты лучший стрелок в округе.
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_02");	//Ну, раз говорят, значит, так оно и есть. А что?
	AI_Output(other,self,"DIA_Gunmar_Hello_Teach_01_03");	//Ты мог бы научить меня более метко стрелять из лука?
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_04");	//Почему бы и нет?
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_05");	//По крайней мере, лучше я буду тебя учить упражняться в стрельбе из лука, чем отвечать на твои странные вопросы.
	AI_Output(self,other,"DIA_Gunmar_Hello_Teach_01_06");	//Ну и когда начнем?
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
	description = "Научи меня точнее стрелять из лука и арбалета.";
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
	AI_Output(other,self,"DIA_Gunmar_Teach_01_01");	//Научи меня точнее стрелять из лука и арбалета.
	AI_Output(self,other,"DIA_Gunmar_Teach_01_02");	//Ну что ж, приступим.
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
		AI_Output(self,other,"DIA_Gunmar_Teach_Back_01_01");	//Уже лучше. Больше тренируйся и станешь таким же хорошим стрелком, как и я.
	};
	Info_ClearChoices(dia_gunmar_teach);
};

