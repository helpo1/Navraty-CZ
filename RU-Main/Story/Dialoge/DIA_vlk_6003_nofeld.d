
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
	description = "Привет.";
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
	AI_Output(other,self,"DIA_Nofeld_Hello_01_01");	//Привет.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_02");	//А, это ты новенький. Как тебе наш лагерь?
	AI_Output(other,self,"DIA_Nofeld_Hello_01_03");	//Ну, так... симпатичный.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_04");	//Да, местечко теплое. Главное, тут тепло и здесь можно не опасаться за свою жизнь.
	AI_Output(self,other,"DIA_Nofeld_Hello_01_05");	//Не то, что там, снаружи. То и дело, кто-нибудь рыскает в близи с пещерой. Там надо держать ухо востро!
	AI_Output(self,other,"DIA_Nofeld_Hello_01_06");	//Чуть расслабишься и все, считай, что уже труп. Даже не заметишь, как кто-нибудь подкрадется сзади и оттяпает тебе твою голову.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_07");	//А монстры не пытались атаковать вас здесь, в лагере?
	AI_Output(self,other,"DIA_Nofeld_Hello_01_08");	//Нет, до этого дело не доходило. А если уж на то пошло, ребята, что у входа быстро разберутся с непрошеным гостем.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_10");	//А ты случайно не встречал здесь нечто похожее на дракона?
	AI_Output(self,other,"DIA_Nofeld_Hello_01_11");	//Дракона? Нет, братишка, не встречал. И вообще я всегда считал, что это все сказки.
	AI_Output(other,self,"DIA_Nofeld_Hello_01_12");	//Ясно.
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
	description = "Я слышал, ты ловкий парень.";
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
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_01");	//Я слышал, ты ловкий парень.
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_02");	//И что?
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_03");	//Ну, я подумал, вдруг ты сможешь помочь мне стать более ловким?
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_04");	//Ну... я бы мог показать тебе пару трюков, которые бы, несомненно, повысили бы твою ловкость.
	AI_Output(other,self,"DIA_Nofeld_Hello_Teach_01_05");	//Покажешь?
	AI_Output(self,other,"DIA_Nofeld_Hello_Teach_01_06");	//Почему бы и нет? Скажи, когда будешь готов.
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
	description = "Начнем тренировку.";
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
	AI_Output(other,self,"DIA_Nofeld_Teach_01_01");	//Начнем тренировку.
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
		AI_Output(self,other,"DIA_Nofeld_Teach_Back_01_01");	//Вот. Теперь ты стал более ловким!
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

