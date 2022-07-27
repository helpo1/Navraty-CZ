
instance DIA_Cornelius_Exit(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 999;
	condition = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

func void DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_SeeMurder(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent = FALSE;
	description = "Viděl jsi Lotharovu vraždu, co?";
};


func int DIA_Cornelius_SeeMurder_Condition()
{
	if(RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_SeeMurder_Info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Viděl jsi Lotharovu vraždu, co?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(nervózně) Nebudu odpovídat na žádné otázky týkající se probíhajícího vyšetřování.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen už má zaznamenáno vše, co vím.
};


instance DIA_Cornelius_WhatYouSee(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 5;
	condition = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent = FALSE;
	description = "Cos to říkal?";
};


func int DIA_Cornelius_WhatYouSee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_SeeMurder))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Cos to říkal?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(nervózně) Opravdu teď nemám čas.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(nervózně) Musíš jít, úřad se právě zavírá.
	B_LogEntry(TOPIC_RescueBennet,"Cornelius se se mnou odmítá bavit.");
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_Enough(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 6;
	condition = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent = FALSE;
	description = "Dost už toho! Co jsi viděl?";
};


func int DIA_Cornelius_Enough_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_WhatYouSee))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Enough_Info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Dost už toho! Co jsi viděl?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(nervózně) Já... viděl jsem, jak ten žoldák zezadu srazil toho paladina.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(nervózně) A pak si vzal jeho meč a proklál mu jím hruď.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Jsi si naprosto jistý?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(vyděšeně) Ano, samozřejmě. Viděl jsem to na vlastní oči.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(vyděšeně) Ale teď už vážně nemám čas, čeká na mě halda papírování.
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_DontBelieveYou(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent = TRUE;
	description = "Nevěřím ti.";
};


func int DIA_Cornelius_DontBelieveYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_Enough) && (Cornelius_TellTruth != TRUE) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Nevěřím ti.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(s falešnou důvěrností) A co, co s tím budeš dělat?
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Co chceš?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Svýho života si dost ceníš, co?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Můžou ti zařídit příjemný rozhovor v klášteře.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Můžu žoldákům říct, kde bydlíš.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Křivá přísaha ti zajistí útulnou kobku - na dlouhou dobu!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
	if(hero.guild == GIL_KDM)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Máš rád bolest?!",dia_cornelius_dontbelieveyou_kdm);
	};
	if(hero.guild == GIL_KDW)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Ve jménu Adana, řekni pravdu!",dia_cornelius_dontbelieveyou_kdw);
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Můžu udělat něco speciálního.",dia_cornelius_dontbelieveyou_sek);
	};
};

func void DIA_Cornelius_DontBelieveYou_WhatYouWant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Co chceš?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(arogantně) Nikdy jsi neměl tolik peněz, abys mi mohl zaplatit.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 zlatých. Jo, to by mohlo stačit k tomu, abych si to rozmyslel.
	B_LogEntry(TOPIC_RescueBennet,"Za 2000 zlatých je se mnou Cornelius ochoten mluvit.");
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_WantSurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Svýho života si dost ceníš, co?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(vyděšeně) Když mě napadneš, pověsí tě.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//Mám mocné přátele. Takže se na mě neopovažuj vztáhnout ruku.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//A teď odsud vypadni! Nebo zavolám stráže!
	AI_StopProcessInfos(self);
};

func void DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//Můžou ti zařídit příjemný rozhovor v klášteře.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(bílý jak stěna) Co tím myslíš?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Fajn, známe způsob, jak dostat pravdu na světlo. Bolestivý způsob.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Ne, prosím, ne. Řeknu ti všechno, co chceš.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdm()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_00");	//Máš rád bolest?!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDM_13_01");	//Co tím chceš říci?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_02");	//No, myslím, že bych tě mohl seznámit s některým z mých zaměstnanců.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_03");	//Myslím, že pár zombií by ti rozvázalo jazyk, kdyby ti hluboko do prdele daly ručičku.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_04");	//Nebo... Například démon! Měl bys vidět, jak miluje lidské maso!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDM_13_05");	//(bílý jako sníh) Udělám vše, co budeš chtít...
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdw()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_00");	//Ve jménu Adana, řekni pravdu!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_01");	//I kdybych se měl vzdát některých ze svých zásad...
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_02");	//Jestli chceš, budu informovat Vatrase o zlu tvých skutků.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_03");	//Ale dělal bych to pro pravdu Adanovu!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_05");	//Lidé by ti plivali do očí a hanobili by tvé jméno!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDW_15_06");	//CO? A kdo by ti věřil?!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_07");	//Je jedno, jestli ne mě, ale Vatrasovi ano.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDW_13_08");	//Dobře, dobře. Řeknu ti vše, co chceš!
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_sek()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_00");	//Můžu udělat něco speciálního.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_01");	//Jak jistě víš, naše Bratrstvo má hodně přátel mezi lidmi z tohoto města.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_02");	//A také s tvojim šéfem!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_15_03");	//Co chceš dělat?! (bílý jako sníh)
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_04");	//Budeš si muset hledat novou práci.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_05");	//A s největší pravděpodobností bys žádnou nenašel!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_06");	//Taky můžu říci pár slov Lariusovi a ten už něco vymyslí.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_15_07");	//Ty... to neuděláš!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_08");	//Věř mi, dokážu to!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_13_09");	//Dobrá, řeknu ti vše co chceš.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//Můžu žoldákům říct, kde bydlíš.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(bílý jak stěna) Co to má znamenat?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Vsadím se, že by za seznámení s tebou dali život. Vůbec z toho nemají radost.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//To nemůžeš. Zabijí mě!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//S největší pravděpodobností.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//Řeknu ti, co budeš chtít, ale nesmíš to udělat.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//Křivá přísaha ti zajistí útulnou kobku - na dlouhou dobu!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Snažíš se mi vyhrožovat? Mně, tajemníkovi místodržícího?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Jestli okamžitě nevypadneš, budu se dívat na to, jak tě degradují.
	Cornelius_ThreatenByMilSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_PayCornelius(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent = TRUE;
	description = "Tady je zlato.";
};


func int DIA_Cornelius_PayCornelius_Condition()
{
	if((Cornelius_PayForProof == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PayCornelius_Info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Raději se ani nebudu ptát, kdes k tomu přišel.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Abych byl upřímný, tak mě to ani nezajímá.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Ale jsme partneři.
	Cornelius_TellTruth = TRUE;
};

instance DIA_Cornelius_RealStory(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent = TRUE;
	description = "Tak co se doopravdy stalo?";
};

func int DIA_Cornelius_RealStory_Condition()
{
	if(Cornelius_TellTruth == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_RealStory_Info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Tak co se doopravdy stalo?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Nevím, co se stalo. Dostal jsem nějaké zlato za to, že obviním toho žoldáka.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//V takových časech jako teď se každý stará jen sám o sebe. Potřeboval jsem peníze.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Kdo ti zaplatil?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//To neřeknu. Zabije mě, když ho prásknu.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Jsi připraven tohle říct také lordu Hagenovi?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Nejsem blázen. Nemůžu zůstat ve městě.

	if(Npc_HasItems(self,ItWr_CorneliusTagebuch_Mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//Dám ti svůj deník, to by jako důkaz mohlo stačit.
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_RescueBennet,"Cornelius lhal - podplatili ho, aby Benneta dostal do basy. Kdo mu ale ty peníze dal, to mi neprozradil. Je celý podělaný strachy.");
	CorneliusFlee = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_Cornelius_Fleeing(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Cornelius_Fleeing_Condition()
{
	if((CorneliusFlee == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Fleeing_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Cornelius_PICKPOCKET(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 900;
	condition = DIA_Cornelius_PICKPOCKET_Condition;
	information = DIA_Cornelius_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(pokusit se ukrást knihu)";
};


func int DIA_Cornelius_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItWr_CorneliusTagebuch_Mis) >= 1) && (RecueBennet_KnowsCornelius == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,Dialog_Back,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
};

