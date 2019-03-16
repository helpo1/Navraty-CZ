
instance DIA_LUIS_EXIT(C_Info)
{
	npc = vlk_6109_luis;
	nr = 999;
	condition = dia_luis_exit_condition;
	information = dia_luis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_luis_exit_condition()
{
	return TRUE;
};

func void dia_luis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LUIS_PICKPOCKET(C_Info)
{
	npc = vlk_6109_luis;
	nr = 900;
	condition = dia_luis_pickpocket_condition;
	information = dia_luis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_luis_pickpocket_condition()
{
	return C_Beklauen(30,28);
};

func void dia_luis_pickpocket_info()
{
	Info_ClearChoices(dia_luis_pickpocket);
	Info_AddChoice(dia_luis_pickpocket,Dialog_Back,dia_luis_pickpocket_back);
	Info_AddChoice(dia_luis_pickpocket,DIALOG_PICKPOCKET,dia_luis_pickpocket_doit);
};

func void dia_luis_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_luis_pickpocket);
};

func void dia_luis_pickpocket_back()
{
	Info_ClearChoices(dia_luis_pickpocket);
};


instance DIA_LUIS_HALLO(C_Info)
{
	npc = vlk_6109_luis;
	nr = 2;
	condition = dia_luis_hallo_condition;
	information = dia_luis_hallo_info;
	permanent = FALSE;
	description = "Это ты Луис?";
};


func int dia_luis_hallo_condition()
{
	if(MIS_KILLTARGET1 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_luis_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Luis_Hallo_01_00");	//Это ты Луис?
	AI_Output(self,other,"DIA_Luis_Hallo_01_01");	//Да, я. А что, у тебя ко мне дело?
	AI_Output(other,self,"DIA_Luis_Hallo_01_03");	//Говорят, что ты слишком много болтаешь о том, о чем бы следовало молчать.
	AI_Output(other,self,"DIA_Luis_Hallo_01_04");	//Некоторым людям это очень не нравится.
	AI_Output(self,other,"DIA_Luis_Hallo_01_05");	//(возмущенно) ЧТО?! Знаешь, если кому-то что-то не нравится, - то это их личные проблемы!
	AI_Output(self,other,"DIA_Luis_Hallo_01_06");	//А я буду говорить то, что хочу!
	AI_Output(other,self,"DIA_Luis_Hallo_01_07");	//Я вижу, ты не понял то, о чем я тебе сказал!
	AI_Output(self,other,"DIA_Luis_Hallo_01_08");	//Да? И что же ты сделаешь?
	AI_Output(other,self,"DIA_Luis_Hallo_01_09");	//Просто сейчас перережу тебе глотку, чтобы ты заткнулся раз и навсегда.
	AI_Output(self,other,"DIA_Luis_Hallo_01_10");	//ЧТО?! Ты это серьезно?!
	AI_ReadyMeleeWeapon(other);
	AI_Output(self,other,"DIA_Luis_Hallo_01_12");	//О боже! Да ты с ума сошел!
	AI_Output(self,other,"DIA_Luis_Hallo_01_13");	//Стража! Помогите кто-нибудь...(в панике) Меня хотят убить!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

