
instance DIA_Orc_8568_NagDumgar_EXIT(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_exit_condition;
	information = DIA_Orc_8568_NagDumgar_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8568_NagDumgar_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8568_NagDumgar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8568_NagDumgar_Hello(C_Info)
{
	npc = Orc_8568_NagDumgar;
	condition = DIA_Orc_8568_NagDumgar_Hello_condition;
	information = DIA_Orc_8568_NagDumgar_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8568_NagDumgar_Hello_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (NagDumgarInsertDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8568_NagDumgar_Hello_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_01");	//Еще одна глупая тварь прийти сюда, чтобы найти здесь свою смерть!
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_02");	//Тогда считай, что ты ее уже найти, жалкий человек. Ибо она быть перед тобой!
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_03");	//Хммм. Так ты и есть тот самый ужасный Наг-Думгар?
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_04");	//(свирепо) Быть он самый.
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_05");	//Ну, что же, хорошо, что не пришлось тебя долго искать.
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_06");	//Хотя я встречал демонов и пострашнее, чем ты - того же Спящего.
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_07");	//ЧТО?! Как сметь ты упоминать имя моего господина, ничтожество!
	AI_Output(other,self,"DIA_Orc_8568_NagDumgar_Hello_Info_18_08");	//Твой господин моими стараниями уже давно отправился туда, где ему самое место. И вскоре ты тоже последуешь за ним!
	AI_Output(self,other,"DIA_Orc_8568_NagDumgar_Hello_Info_18_10");	//Аргххх...(неистово) Я УНИЧТОЖУ ТЕБЯ, ЖАЛКИЙ ЧЕРВЯК!
	B_LogEntry(TOPIC_NagDumgar,"Я отыскал Наг-Думгара. Осталось лишь пустить ему кишки - и можно возвращаться к Ур-Траллу.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};