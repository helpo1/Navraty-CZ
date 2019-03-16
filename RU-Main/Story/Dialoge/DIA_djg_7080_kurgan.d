
instance DIA_DJG_7080_KURGAN_EXIT(C_Info)
{
	npc = djg_7080_kurgan;
	nr = 999;
	condition = dia_djg_7080_kurgan_exit_condition;
	information = dia_djg_7080_kurgan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_djg_7080_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_djg_7080_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_7080_KURGAN_HELLO(C_Info)
{
	npc = djg_7080_kurgan;
	condition = dia_djg_7080_kurgan_hello_condition;
	information = dia_djg_7080_kurgan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_djg_7080_kurgan_hello_condition()
{
	if(DGJREVENGEME == TRUE)
	{
		return TRUE;
	};
};

func void dia_djg_7080_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_HELLO_01_00");	//Так, так... А вот и ты, дружок. А мы тебя ждали.
	AI_Output(other,self,"DIA_DJG_7080_Kurgan_HELLO_01_01");	//Что еще такое?
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_HELLO_01_02");	//Только не делай вид, будто ничего не понимаешь! Думаю, что пришло время платить по счетам.
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_HELLO_01_03");	//Или ты думал, что я забуду про свое обещание? Сейчас мы с тобой за все поквитаемся, ублюдок!
	Info_ClearChoices(dia_djg_7080_kurgan_hello);
	Info_AddChoice(dia_djg_7080_kurgan_hello,Dialog_Ende,dia_djg_7080_kurgan_hello_attack);
};

func void dia_djg_7080_kurgan_hello_attack()
{
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,1);
	B_Attack(kjornnw,other,AR_GuildEnemy,1);
	B_Attack(godarnw,other,AR_GuildEnemy,1);
	B_Attack(hokurnnw,other,AR_GuildEnemy,1);
};


instance DIA_DJG_7080_KURGAN_PERM(C_Info)
{
	npc = djg_7080_kurgan;
	condition = dia_djg_7080_kurgan_perm_condition;
	information = dia_djg_7080_kurgan_perm_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_djg_7080_kurgan_perm_condition()
{
	if(DGJREVENGEME == FALSE)
	{
		return TRUE;
	};
};

func void dia_djg_7080_kurgan_perm_info()
{
	AI_Output(other,self,"DIA_DJG_7080_Kurgan_Perm_01_00");	//Как дела?
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_Perm_01_01");	//Получше, чем было в Долине Рудников.
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_Perm_01_02");	//По крайней мере, тут пока можно чувствовать себя в безопасности.
	AI_Output(self,other,"DIA_DJG_7080_Kurgan_Perm_01_03");	//Хотя сомнений нет, что орки скоро доберутся и сюда.
	AI_Output(other,self,"DIA_DJG_7080_Kurgan_Perm_01_04");	//Вполне вероятно.
};


instance DIA_DJG_7080_KURGAN_PICKPOCKET(C_Info)
{
	npc = djg_7080_kurgan;
	nr = 900;
	condition = dia_djg_7080_kurgan_pickpocket_condition;
	information = dia_djg_7080_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_djg_7080_kurgan_pickpocket_condition()
{
	return C_Beklauen(100,500);
};

func void dia_djg_7080_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_djg_7080_kurgan_pickpocket);
	Info_AddChoice(dia_djg_7080_kurgan_pickpocket,Dialog_Back,dia_djg_7080_kurgan_pickpocket_back);
	Info_AddChoice(dia_djg_7080_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_djg_7080_kurgan_pickpocket_doit);
};

func void dia_djg_7080_kurgan_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_djg_7080_kurgan_pickpocket);
};

func void dia_djg_7080_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_djg_7080_kurgan_pickpocket);
};

