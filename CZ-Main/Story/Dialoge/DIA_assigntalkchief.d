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
		AI_Output(self,other,"DIA_AssignTalkChief_01_00");	//Špinavý zloději!
	}
	else if(self.voice == 10)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_01");	//Ty špinavý zloději!
	}
	else if(self.voice == 1)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_02");	//Ty špinavý zloději!
	}
	else if(self.voice == 14)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_03");	//Ty špinavý zloději!
	}
	else if(self.voice == 7)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_04");	//Špinavý zloději!
	}
	else if(self.voice == 4)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_05");	//Ty špinavý zloději!
	}
	else if((self.voice == 16) || (self.voice == 17))
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_07");	//Ach, ty zloději!
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_06");	//Špinavý zloději!	
	};

	if((self.voice == 16) || (self.voice == 17))
	{
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_01_08");	//Vážně sis myslel, že si toho nevšimnu, ty chmatáku?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief,"Trhni si!",dia_assigntalkchief_biteme);
	Info_AddChoice(dia_assigntalkchief,"Nemůžeme na to zapomenout?",dia_assigntalkchief_helpyou);

	if(self.aivar[AIV_MM_WuselEnd] < DayNow)
	{
		Info_AddChoice(dia_assigntalkchief,"O čem to mluvíš? Nerozumím...",dia_assigntalkchief_knowrhetorika);
	};
};

func void dia_assigntalkchief_biteme()
{
	HERO_CANESCAPEFROMGOTCHA = FALSE;
	HERO_PAYPRICEFROMGOTCHA = FALSE;
	self.vars[0] = FALSE;
	AI_Output(other,self,"DIA_AssignTalkChief_BiteMe_01_00");	//Trhni si!

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_F1_01_01");	//Toho budeš litovat!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_F2_01_01");	//Toho budeš litovat!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_BiteMe_01_01");	//Toho budeš litovat!
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
	AI_Output(other,self,"DIA_AssignTalkChief_HelpYou_01_01");	//Nemůžeme na to zapomenout?

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
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_02");	//Služebník Innosův nemá co dočinění se zloději jako jsi ty!
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_03");	//Teď už je pozdě na omluvy.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(self.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_04");	//Služebník Adanův nemá co dočinění se zloději jako jsi ty!
		AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_05");	//Teď už je pozdě na omluvy.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	}
	else if(HERO_PAYPRICEFROMGOTCHA == FALSE)
	{
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_06");	//Zapomeň na to ničemo!
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_07");	//Ještě budeš litovat, že jsi šel proti mně.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_06");	//Zapomeň na to ničemo!
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_07");	//Ještě budeš litovat, že jsi šel proti mně.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_06");	//Zapomeň na to ničemo!
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_07");	//Ještě budeš litovat, že jsi šel proti mně.
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
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_08");	//Hmm... (zamyšleně) Dobrá tedy. Souhlasím.
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F1_01_09");	//Ale budeš muset za svou drzost zaplatit.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_08");	//Hmm... (zamyšleně) Dobrá tedy. Souhlasím.
				AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_F2_01_09");	//Ale budeš muset za svou drzost zaplatit.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_08");	//Hmm... (zamyšleně) Dobrá tedy. Souhlasím.
			AI_Output(self,other,"DIA_AssignTalkChief_HelpYou_01_09");	//Ale budeš muset za svou drzost zaplatit.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_HelpYou_01_10");	//A kolik?
		B_Say_Gold(self,other,HERO_PAYPRICEFROMGOTCHA);
		Info_ClearChoices(dia_assigntalkchief);

		if(Npc_HasItems(other,ItMi_Gold) >= HERO_PAYPRICEFROMGOTCHA)
		{
			Info_AddChoice(dia_assigntalkchief,"Dobře! Tady máš své zlato.",dia_assigntalkchief_dealpay);
		};

		Info_AddChoice(dia_assigntalkchief,"Zapomeň na to.",dia_assigntalkchief_nopay);
	};
};

func void dia_assigntalkchief_dealpay()
{
	AI_Output(other,self,"DIA_AssignTalkChief_DealPay_01_01");	//Dobře! Tady máš své zlato.
	B_GiveInvItems(other,self,ItMi_Gold,HERO_PAYPRICEFROMGOTCHA);

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_DealPay_F1_01_02");	//No dobře. Dejme tomu, že jsem nic neviděl.
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_DealPay_F2_01_02");	//No dobře. Dejme tomu, že jsem nic neviděl.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_DealPay_01_02");	//No dobře. Dejme tomu, že jsem nic neviděl.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_assigntalkchief_nopay()
{
	AI_Output(other,self,"DIA_AssignTalkChief_NoPay_01_01");	//Zapomeň na to.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_NoPay_F1_01_02");	//Jak chceš! Ale pak se nediv.
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_NoPay_F2_01_02");	//Jak chceš! Ale pak se nediv.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_NoPay_01_02");	//Jak chceš! Ale pak se nediv.
	};

	HERO_PAYPRICEFROMGOTCHA = FALSE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_Theft,1);
};

func void dia_assigntalkchief_knowrhetorika()
{
	AI_Output(other,self,"DIA_AssignTalkChief_KnowRhetorika_01_01");	//O čem to mluvíš? Nerozumím...

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F1_01_02");	//To je neuvěřitelné! Byl si chycen při činu, a ty máš ještě tu drzost to popírat!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F2_01_02");	//To je neuvěřitelné! Byl si chycen při činu, a ty máš ještě tu drzost to popírat!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_01_02");	//To je neuvěřitelné! Byl si chycen při činu, a ty máš ještě tu drzost to popírat!
	};

	AI_Output(other,self,"DIA_AssignTalkChief_KnowRhetorika_01_03");	//Já jsem ti nic ukrást nechtěl! To se ti asi zdálo.

	if((self.voice == 16) || (self.voice == 17))
	{
		if(self.voice == 16)
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F1_01_04");	//A ty si naivně myslíš, že budu takové kravině věřit?!
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_F2_01_04");	//A ty si naivně myslíš, že budu takové kravině věřit?!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_AssignTalkChief_KnowRhetorika_01_04");	//A ty si naivně myslíš, že budu takové kravině věřit?!
	};

	Info_ClearChoices(dia_assigntalkchief);
	Info_AddChoice(dia_assigntalkchief,"(pokusit se přesvědčit)",dia_assigntalkchief_tellme);
};

func void dia_assigntalkchief_tellme()
{
	var int rhetorikarand;

	rhetorikarand = Hlp_Random(50);
	AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_01");	//No tak co, teď už mi věříš?
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
				AI_Print("Rétorika + 1");
			};

			TempRhetLearnSuccess = FALSE;
		};

		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F1_01_02");	//Dobře, dobře... Přesvědčil jsi mě! Nakonec, možná se mi to opravdu jen celé zdálo.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F2_01_02");	//Dobře, dobře... Přesvědčil jsi mě! Nakonec, možná se mi to opravdu jen celé zdálo.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_TellMe_01_02");	//Dobře, dobře... Přesvědčil jsi mě! Nakonec, možná se mi to opravdu jen celé zdálo.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_03");	//No jasně.
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
				AI_Print("Rétorika + 1");
			};

			TempRhetLearnFail = FALSE;
		};
		if((self.voice == 16) || (self.voice == 17))
		{
			if(self.voice == 16)
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F1_01_04");	//Ne! Vůbec si mě nepřesvědčil o pravdivosti tvých slov.
			}
			else
			{
				AI_Output(self,other,"DIA_AssignTalkChief_TellMe_F2_01_04");	//Ne! Vůbec si mě nepřesvědčil o pravdivosti tvých slov.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_AssignTalkChief_TellMe_01_04");	//Ne! Vůbec si mě nepřesvědčil o pravdivosti tvých slov.
		};

		AI_Output(other,self,"DIA_AssignTalkChief_TellMe_01_05");	//Velice mě to mrzí.
		Info_ClearChoices(dia_assigntalkchief);
		Info_AddChoice(dia_assigntalkchief,"Trhni si!",dia_assigntalkchief_biteme);
		Info_AddChoice(dia_assigntalkchief,"Nemohli bychom nějak vyřešit toto nedorozumění?",dia_assigntalkchief_helpyou);
	};
};

func void B_AssignTalkChief(var C_Npc slf)
{
	if(slf.vars[0] == TRUE)
	{
		DIA_AssignTalkChief.npc = Hlp_GetInstanceID(slf);
	};
};