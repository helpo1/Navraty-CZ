
instance DIA_HASAN_EXIT(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 999;
	condition = dia_hasan_exit_condition;
	information = dia_hasan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hasan_exit_condition()
{
	return TRUE;
};

func void dia_hasan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HASAN_HELLO(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 1;
	condition = dia_hasan_hello_condition;
	information = dia_hasan_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Что ты тут делаешь?";
};


func int dia_hasan_hello_condition()
{
	if(MEETHASAN == FALSE)
	{
		return TRUE;
	};
};

func void dia_hasan_hello_info()
{
	AI_Output(other,self,"DIA_Hasan_Hello_01_01");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Hasan_Hello_01_02");	//Что, что...(сердито) А разве не видно?
	AI_Output(self,other,"DIA_Hasan_Hello_01_03");	//Охраняю склад с нашими запасами еды и прочего барахла.
	AI_Output(other,self,"DIA_Hasan_Hello_01_04");	//А что, здесь водятся воры?
	AI_Output(self,other,"DIA_Hasan_Hello_01_05");	//Нет, воров здесь нет. Но если этого не делать, то никто не откажет себе в удовольствии за один присест наполнить свое брюхо вдоволь теми запасами, которые рассчитаны на неделю или месяц!
	AI_Output(self,other,"DIA_Hasan_Hello_01_06");	//С едой тут не очень хорошо, поэтому нам и приходится немного ограничивать ребят. Да они это и сами понимают, но соблазн велик! (смеется)
	AI_Output(self,other,"DIA_Hasan_Hello_01_07");	//Да и сделать запас впрок - тоже не помешает. Кто знает, что нас ждет дальше.
	AI_Output(other,self,"DIA_Hasan_Hello_01_08");	//Понятно. И ты все время дежуришь тут?
	AI_Output(self,other,"DIA_Hasan_Hello_01_09");	//Да, почти весь день. Правда, иногда меня подменяет Нэш. Но ему можно доверять - он надежный парнишка.
	MEETHASAN = TRUE;
};


instance DIA_HASAN_HELLO_TEACH(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 1;
	condition = dia_hasan_hello_teach_condition;
	information = dia_hasan_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты продаешь что-нибудь.";
};


func int dia_hasan_hello_teach_condition()
{
	if((MEETHASAN == TRUE) && (HASANTEACHER == TRUE) && (HASANREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_hasan_hello_teach_info()
{
	AI_Output(other,self,"DIA_Hasan_Hello_Teach_01_01");	//Руэн сказал, что ты можешь продать мне кое-какие вещи.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_02");	//Да, я могу тебе предложить пару вещей, если у тебя найдется пара золотых монет. Естественно, это не распространяется на еду и выпивку.
	AI_Output(other,self,"DIA_Hasan_Hello_Teach_01_03");	//А зачем вам тут золото?! Его же тут негде даже потратить.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_04");	//Ты прав, конечно, здесь оно нам без надобности. Но нас все-таки не покидает мысль о том, что когда-нибудь мы сможем выбраться отсюда. Поэтому золото нам может пригодиться.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_05");	//Потом и ребята, что ходят на охоту, иногда находят золотишко и всегда его могут обменять тут на что-то полезное.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_06");	//Так что, если тебе интересно, можешь и сам присмотреть себе что-нибудь.
	HASANREADYTEACH = TRUE;
};


instance DIA_HASAN_TRADE(C_Info)
{
	npc = vlk_6009_hasan;
	nr = 99;
	condition = dia_hasan_trade_condition;
	information = dia_hasan_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_hasan_trade_condition()
{
	if((MEETHASAN == TRUE) && (HASANREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_hasan_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Hasan_Trade_01_01");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Hasan_Trade_01_02");	//Выбирай.
	B_GiveTradeInv(self);
};

