instance DIA_AssignTalkChief(C_Info)
{
	nr = 1;
	condition = DIA_AssignTalkChief_condition;
	information = DIA_AssignTalkChief_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_AssignTalkChief_condition()
{
	if(self.vars[0] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_AssignTalkChief_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if(self.voice == 12)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_00");	//Вонючий вор!
	}
	else if(self.voice == 10)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_01");	//Ты, грязный вор!
	}
	else if(self.voice == 1)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_02");	//Ты, грязный ворюга!
	}
	else if(self.voice == 14)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_03");	//Ты, грязный ворюга!
	}
	else if(self.voice == 7)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_04");	//Грязный воришка!
	}
	else if(self.voice == 4)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_05");	//Ты, грязный вор!
	}
	else if((self.voice == 16) || (self.voice == 17))
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_07");	//Ах ты вор!
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_06");	//Грязный ворюга!	
	};

	if((self.voice == 16) || (self.voice == 17))
	{
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_08");	//Неужели ты думал, что я не замечу твоего воровства?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief,"Ну, укуси меня!",dia_assigntalkchief_biteme);
	Info_AddChoice(dia_assigntalkchief,"Может, забудем об этом?",dia_assigntalkchief_helpyou);

	if(self.aivar[AIV_MM_WuselEnd] < DayNow)
	{
		Info_AddChoice(dia_assigntalkchief,"О чем ты? Не понимаю...",dia_assigntalkchief_knowrhetorika);
	};
};

func void dia_assigntalkchief_biteme()
{
	HERO_CANESCAPEFROMGOTCHA = FALSE;
	HERO_PAYPRICEFROMGOTCHA = FALSE;
	self.vars[0] = FALSE;
	AI_Output(other,self,"DIA_AssignTalkChief_BiteMe_01_00");	//Ну, укуси меня!

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_F1_01_01");	//Ты об этом пожалеешь!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_F2_01_01");	//Ты об этом пожалеешь!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_01_01");	//Ты об этом пожалеешь!
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void dia_assigntalkchief_helpyou()
{
	var int payrand;
	payrand = Hlp_Random(100);
	HERO_CANESCAPEFROMGOTCHA = FALSE;
	self.vars[0] = FALSE;
	AI_Output(other,self,"DIA_AssignTalkChief_HelpYou_01_01");	//Может, забудем об этом?

	if(payrand >= 75)
	{
		HERO_PAYPRICEFROMGOTCHA = 200;
	}
	else if(payrand >= 50)
	{
		HERO_PAYPRICEFROMGOTCHA = 100;
	}
	else if(payrand >= 25)
	{
		HERO_PAYPRICEFROMGOTCHA = 50;
	}
	else
	{
		HERO_PAYPRICEFROMGOTCHA = FALSE;
	};
	if((self.guild == GIL_PAL) || (self.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_02");	//Слуга Инноса не имеет дел с ворами, вроде тебя!
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_03");	//Так что теперь поздно просить прощения.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(self.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_04");	//Слуга Аданоса не станет имееть дел с ворами!
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_05");	//Так что теперь поздно просить прощения.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(HERO_PAYPRICEFROMGOTCHA == FALSE)
	{
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_06");	//Забудь об этом, ублюдок!
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_07");	//Ты еще пожалеешь, что связался со мной.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_06");	//Забудь об этом, ублюдок!
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_07");	//Ты еще пожалеешь, что связался со мной.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_06");	//Забудь об этом, ублюдок!
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_07");	//Ты еще пожалеешь, что связался со мной.
		};

		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else
	{
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_08");	//Хммм...(в раздумьях) Ну хорошо. Я согласна.
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_09");	//Но тебе придется заплатить за свою дерзость.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_08");	//Хммм...(в раздумьях) Ну хорошо. Я согласна.
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_09");	//Но тебе придется заплатить за свою дерзость.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_08");	//Хммм...(в раздумьях) Ну хорошо. Я согласен.
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_09");	//Но тебе придется заплатить за свою дерзость.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_HelpYou_01_10");	//И сколько?
		B_Say_Gold(self,other,HERO_PAYPRICEFROMGOTCHA);
		Info_ClearChoices(dia_assigntalkchief);

		if(Npc_HasItems(other,ItMi_Gold) >= HERO_PAYPRICEFROMGOTCHA)
		{
			Info_AddChoice(dia_assigntalkchief,"Ладно! Держи свое золото.",dia_assigntalkchief_dealpay);
		};

		Info_AddChoice(dia_assigntalkchief,"Забудь об этом.",dia_assigntalkchief_nopay);
	};
};

func void dia_assigntalkchief_dealpay()
{
	AI_Output(other,self,"DIA_AssignTalkChief_DealPay_01_01");	//Ладно! Держи свое золото.
	B_GiveInvItems(other,self,ItMi_Gold,HERO_PAYPRICEFROMGOTCHA);

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_DealPay_F1_01_02");	//Вот и славно. Считай, что я ничего не видела.
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_DealPay_F2_01_02");	//Вот и славно. Считай, что я ничего не видела.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_DealPay_01_02");	//Вот и славно. Считай, что я ничего не видел.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_assigntalkchief_nopay()
{
	AI_Output(other,self,"DIA_AssignTalkChief_NoPay_01_01");	//Забудь об этом.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_NoPay_F1_01_02");	//Ну как хочешь! Тогда не обижайся.
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_NoPay_F2_01_02");	//Ну как хочешь! Тогда не обижайся.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_NoPay_01_02");	//Ну как хочешь! Тогда не обижайся.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void dia_assigntalkchief_knowrhetorika()
{
	AI_Output(other,self,"DIA_AssignTalkChief_KnowRhetorika_01_01");	//О чем ты? Не понимаю...

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F1_01_02");	//Немыслимо! Тебя поймали за руку, а у тебя все еще хватает наглости отрицать это!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F2_01_02");	//Немыслимо! Тебя поймали за руку, а у тебя все еще хватает наглости отрицать это!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_01_02");	//Немыслимо! Тебя поймали за руку, а у тебя все еще хватает наглости отрицать это!
	};

	AI_Output(other,self,"DIA_AssignTalkChief_KnowRhetorika_01_03");	//Я не собирался у тебя ничего красть! Тебе это показалось.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F1_01_04");	//И ты наивно полагаешь, что я поверю в эту чушь?!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F2_01_04");	//И ты наивно полагаешь, что я поверю в эту чушь?!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_01_04");	//И ты наивно полагаешь, что я поверю в эту чушь?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief,"(попытаться убедить)",dia_assigntalkchief_tellme);
};

func void dia_assigntalkchief_tellme()
{
	var int rhetorikarand;

	rhetorikarand = Hlp_Random(50);
	AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_01");	//Ну как, теперь веришь?
	self.aivar[AIV_MM_WuselEnd] = Wld_GetDay();

	if(RhetorikSkillValue[1] > rhetorikarand)
	{
		HERO_CANESCAPEFROMGOTCHA = FALSE;
		HERO_PAYPRICEFROMGOTCHA = FALSE;
		self.vars[0] = FALSE;
		TempRhetLearnSuccess += 1;

		if(TempRhetLearnSuccess >= 10)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			TempRhetLearnSuccess = FALSE;
		};

		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F1_01_02");	//Ладно, ладно... Считай, что убедил меня! Пожалуй, мне действительно все это лишь показалось.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F2_01_02");	//Ладно, ладно... Считай, что убедил меня! Пожалуй, мне действительно все это лишь показалось.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_TellMe_01_02");	//Ладно, ладно... Считай, что убедил меня! Пожалуй, мне действительно все это лишь показалось.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_03");	//Само собой.
		Info_ClearChoices(dia_assigntalkchief);
	}
	else
	{
		TempRhetLearnFail += 1;

		if(TempRhetLearnFail >= 20)
		{
			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
			};

			TempRhetLearnFail = FALSE;
		};
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F1_01_04");	//Нет! Ты абсолютно не убедил меня в правоте своих слов.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F2_01_04");	//Нет! Ты абсолютно не убедил меня в правоте своих слов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_TellMe_01_04");	//Нет! Ты абсолютно не убедил меня в правоте своих слов.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_05");	//Что же, очень жаль.
		Info_ClearChoices(dia_assigntalkchief);
		Info_AddChoice(dia_assigntalkchief,"Ну, укуси меня!",dia_assigntalkchief_biteme);
		Info_AddChoice(dia_assigntalkchief,"Может, тогда как-нибудь уладим это недоразумение?",dia_assigntalkchief_helpyou);
	};
};

func void B_AssignTalkChief(var C_Npc slf)
{
	if(slf.vars[0] == TRUE)
	{
		DIA_AssignTalkChief.npc = Hlp_GetInstanceID(slf);
	};
};