
instance DIA_VLK_6150_ORTEGO_EXIT(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 999;
	condition = dia_vlk_6150_ortego_exit_condition;
	information = dia_vlk_6150_ortego_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6150_ortego_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6150_ortego_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6150_ORTEGO_HELLO(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 5;
	condition = dia_vlk_6150_ortego_hello_condition;
	information = dia_vlk_6150_ortego_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_vlk_6150_ortego_hello_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_vlk_6150_ortego_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_00");	//Наконец-то ты пришел! А то я уже тебя заждался.
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_01");	//Ты меня ждал?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_02");	//Ну да, тебя... кого же еще? Хотя я и представлял тебя немного другим.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_03");	//Но лучше ответь - ты приготовил для меня мои деньги?
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_04");	//Какие еще деньги?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_05");	//Не понял...(злобно) Ты что, меня за идиота держишь?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_06");	//Те деньги, которые ты мне обещал за смерть этого жалкого старикашки алхимика.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_07");	//(смеется) Этот бедняга даже пикнуть не успел, как был уже мертв!
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_08");	//И теперь я жду своего золота, которое ты обещал мне в своем письме.
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_11");	//Так ты кого-то убил?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_12");	//(непонимающее) Да что с тобой, парень?! Я что, не ясно говорю? Или ты последние мозги пропил?
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_13");	//Со мной все в порядке. Просто, думаю, что я не тот, кто тебе нужен.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_14");	//Что?! Хммм... хочешь сказать, что я ошибся?
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_15");	//Так оно и есть.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_16");	//Ну что ж, это много объясняет. Погоди минутку, я сейчас тебе все объясню...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

