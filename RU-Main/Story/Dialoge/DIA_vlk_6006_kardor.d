
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
	description = "Что ты делаешь?";
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
	AI_Output(other,self,"DIA_Kardor_Hello_01_01");	//Что ты делаешь?
	AI_Output(self,other,"DIA_Kardor_Hello_01_02");	//А что, разве не видно? Готовлюсь к бою, что же еще.
	AI_Output(other,self,"DIA_Kardor_Hello_01_03");	//К какому бою?
	AI_Output(self,other,"DIA_Kardor_Hello_01_04");	//Я тебе вот что скажу, парень. Рано или поздно вся эта нечить, что бродит вокруг, наверняка решит заняться и этим местечком.
	AI_Output(self,other,"DIA_Kardor_Hello_01_05");	//А я не хочу сидеть сложа руки и ждать этого момента!
	AI_Output(self,other,"DIA_Kardor_Hello_01_06");	//Надо сматываться из этого богом забытого местечка... а тут такая возможность!
	AI_Output(other,self,"DIA_Kardor_Hello_01_07");	//Какая возможность?
	AI_Output(self,other,"DIA_Kardor_Hello_01_08");	//Дюго сказал, что тот телепорт наверху пирамиды ведет напрямик в город орков.
	AI_Output(self,other,"DIA_Kardor_Hello_01_09");	//И если мы решим им воспользоваться, чтобы убраться отсюда, нам, скорее всего, придется пробиваться через орды этих зеленокожих тварей.
	AI_Output(self,other,"DIA_Kardor_Hello_01_10");	//Судя по всему, орков там много! Поэтому получше владеть своим мечом мне не помешает.
	AI_Output(other,self,"DIA_Kardor_Hello_01_11");	//Все-таки Дюго успел заразить и других своей безумной идеей. Поверь мне: то, что вы задумали - чистое самоубийство!
	AI_Output(other,self,"DIA_Kardor_Hello_01_12");	//Вам никогда не прорваться через их город. Вам даже через их аванпост не пройти, не то, что уж через целый город!
	AI_Output(self,other,"DIA_Kardor_Hello_01_13");	//Может и так, но, по крайней мере, лучше уж погибнуть, чем стать бездушной нежитью, как те парни, что уже погибли здесь.
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
	description = "Я слышал, ты неплохо обращаешься с мечом.";
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
	AI_Output(other,self,"DIA_Kardor_Hello_Teach_01_01");	//Я слышал, ты неплохо обращаешься с мечом.
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_02");	//Что есть, то есть. А как же иначе? Здесь, в долине трудно выжить, если ты не умеешь постоять за себя.
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_03");	//Могу и тебя научить получше обращаться со своим оружием.
	AI_Output(other,self,"DIA_Kardor_Hello_Teach_01_04");	//Да, я не прочь потренироваться!
	AI_Output(self,other,"DIA_Kardor_Hello_Teach_01_05");	//Ну, тогда просто скажи, как будешь готов.
	KARDORREADYTEACH = TRUE;
};


instance DIA_KARDOR_TH(C_Info)
{
	npc = vlk_6006_kardor;
	nr = 7;
	condition = dia_kardor_th_condition;
	information = dia_kardor_th_info;
	permanent = TRUE;
	description = "Давай начнем тренировку!";
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
	AI_Output(other,self,"DIA_Kardor_TH_01_01");	//Начнем тренировку!
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

