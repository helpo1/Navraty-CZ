instance DIA_Orc_8569_DeadOrc_EXIT(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_exit_condition;
	information = DIA_Orc_8569_DeadOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8569_DeadOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8569_DeadOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8569_DeadOrc_Hello(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_Hello_condition;
	information = DIA_Orc_8569_DeadOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8569_DeadOrc_Hello_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (DeadRabOrkovInsertDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8569_DeadOrc_Hello_info()
{
	B_GivePlayerXP(1500);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_01");	//Так. И кто тут у нас?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_02");	//Аргххх, человек...(испуганно) Ты прийти, чтобы убить меня?!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_03");	//Может быть. По крайней мере, я всегда поступаю так с ходячими трупами.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_04");	//Прошу тебя, не делать этого. Не бить меня, не убивать меня! 
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_05");	//Ног-Драг сделать все, что человек ему говорить.
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_06");	//Ладно, успокойся! Зачем мне тебя убивать, ведь ты и так уже мертв.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_07");	//Ног-Драг не хотеть еще раз умирать! Если человек пощадить его, то тот сделать все, что прикажет ему человек.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_08");	//А я смотрю, ты очень напуган моим появлением. Так значит, тебя звать Ног-Драг?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_09");	//Да, человек, мои братья когда-то звать меня так.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_10");	//И судя по всему, ты не принадлежал к кругу воинов, раз так трясешься за свою жизнь.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_11");	//Человек быть прав! Ног-Драг никогда не быть воином.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_12");	//Значит, ты просто был рабом. Я угадал?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_13");	//Человек все знать! Ног-Драг действительно быть раб и строить тут большой храм, как приказывать его хозяин.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_14");	//Так ты тут со времен строительства Храма?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_15");	//Ног-Драг уже давно быть тут. Видеть, как орки делать храм и как злой демон убивать их всех. Видеть и помнить очень много!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_16");	//Тогда, возможно, ты знаешь одну очень важную вещь, которая меня интересует.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_17");	//Ног-Драг рассказать человек все, если тот не станет убивать его!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_18");	//Вот ты заладил одно и то же... Хорошо! Ответь на мой вопрос - и я сохраню тебе жизнь.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_19");	//Тогда человек спрашивать, Ног-Драг все говорить.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_20");	//Ты знаешь шамана по имени Хаш-Гор?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_21");	//Хаш-Гор?! (ужасно испугавшись) Но зачем человек спрашивать про него?!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_22");	//Это тебя не касается! Просто ответь на мой вопрос.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_23");	//Да, Ног-Драг знать великого шамана Хаш-Гора. Он быть тут самый главный, когда орки строить Храм.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_24");	//А почему ты называешь его великим?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_25");	//Потому что Хаш-Гор знать магия, который не знать другие шаманы! 
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_26");	//Из-за этого все братья орки очень боятся Хаш-Гор! 
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_27");	//Если великий шаман гневаться, то он убивать орков, поедать их сердца и делать мертвыми, как Ног-Драг.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_28");	//Ясно. А ты случайно не знаешь, где я сейчас смогу отыскать Хаш-Гора?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_29");	//...пройти очень много времени с тех пор, как Ног-Драг видеть великий шаман в последний раз...
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_30");	//Ног-Драг полагать, что Хаш-Гор уже сам давно быть мертвый!
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_31");	//Поэтому, возможно, человек стоит поискать его там, где орки обычно хоронить своих мертвых братьев.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_32");	//Ты имеешь в виду кладбище орков?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_33");	//Ног-Драг думать, что человек правильно назвать это место.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_34");	//Но он быть там очень осторожный! Хаш-Гор быть очень могущественный и злой шаман.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_35");	//Если человек случайно побеспокоить его дух, то он сам легко может стать мертвый.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_36");	//Ладно, я это учту.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_37");	//Человек еще что-нибудь спрашивать Ног-Драга?
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_38");	//Нет, больше мне от тебя ничего не надо.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_39");	//Значит, теперь человек не тронет Ног-Драга и не станет его убивать?!
	B_LogEntry(TOPIC_NagDumgar,"Я повстречал орка-нежить по имени Ног-Драг. Когда-то он был одним из рабов, принимавших участие в строительстве Храма Спящего. Взяв с меня обещание не убивать его, Ног-Драг рассказал мне о великом шамане Хаш-Горе. Скорее всего, он уже мертв, и искать его в таком случае следует на кладбище орков.");
	Info_ClearChoices(DIA_Orc_8569_DeadOrc_Hello);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello,"Нет, я передумал.",DIA_Orc_8569_DeadOrc_Hello_No);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello,"Я не трону тебя.",DIA_Orc_8569_DeadOrc_Hello_Yes);
};


func void DIA_Orc_8569_DeadOrc_Hello_Yes()
{
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_01");	//Я не трону тебя, как и обещал.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_02");	//Аргххх... Ног-Драг благодарить человек, что тот сдержать свое обещание.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_03");	//За это он даст ему одну вещь, которая поможет человек, если он идти искать Хаш-Гора.
	B_GiveInvItems(self,other,ItMi_DeadOrcItem,1);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_04");	//Спасибо, Ног-Драг. Надеюсь, она мне действительно пригодится.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_05");	//Теперь прощай, орк - мне пора.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_06");	//Добрый путь, человек...
	DeadOrcLeavePeace = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8569_DeadOrc_Hello_No()
{
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_01");	//Нет, я передумал.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_02");	//Думаю, что будет не очень правильно оставить тебя тут разгуливать по Храму.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_03");	//Так что сейчас я тебя прикончу! Уж извини.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_No_18_04");	//Аргххх! Человек обмануть Ног-Драга!
	AI_StopProcessInfos(self);
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
};