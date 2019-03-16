
instance DIA_Schwarzmagier_HELLO(C_Info)
{
	npc = DMT_1299_OberDementor_DI;
	nr = 5;
	condition = DIA_Schwarzmagier_HELLO_Condition;
	information = DIA_Schwarzmagier_HELLO_Info;
	important = TRUE;
};


func int DIA_Schwarzmagier_HELLO_Condition()
{
	return TRUE;
};


var int SC_KnowsMadPsi;

func void DIA_Schwarzmagier_HELLO_Info()
{
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//Takže ty, ubohý červ, ses odvážil přijít k branám mého pána.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//Kdo jako jsi?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Jsem Strážce Irdorathských síní. Nejtajemnější zdroj Beliarovi moci na zemi. Posvátná síla mého pána naplňuje mé ruce.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Jen jedno slovo stačí, aby ses propadl do nekonečného zapomnění.
	B_LogEntry(TOPIC_HallenVonIrdorath,"Stojím před poslední branou. Vypadá to, že klíč má mág, který se mi pokusil blokovat cestu.");
	Info_ClearChoices(DIA_Schwarzmagier_HELLO);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,"Zaveď mě za svým pánem.",DIA_Schwarzmagier_HELLO_meister);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,"Jen mi řekni jedno - kolik vás ještě musím zabít?",DIA_Schwarzmagier_HELLO_dmt);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,"Co je za tou branou?",DIA_Schwarzmagier_HELLO_hinterTor);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,"Kdo je tvůj pán?",DIA_Schwarzmagier_HELLO_wer);

	if(SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Schwarzmagier_HELLO,"To jsi byl ty v Spáčově chrámu.",DIA_Schwarzmagier_HELLO_schlaefer);
	};
};

func void DIA_Schwarzmagier_HELLO_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Kdo je tvůj pán?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//Poutník mezi světy. Jeho božské vědění nás ohromuje.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Je to Beliarův vyvolená, který zničí království následovníků Innose.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//Přinese smrt všem, kdo o něm pochybují.
};

func void DIA_Schwarzmagier_HELLO_hinterTor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//Co je za tou branou?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//(smích) Můj pán, který tě sleduje. Jenže ty se k němu nedostaneš.
};

func void DIA_Schwarzmagier_HELLO_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//To jsi byl ty v Spáčově chrámu.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//Ano. A už tehdy jsem ti řekl, že mě nemůžeš zastavit.
	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//Jen mi řekni jedno - kolik vás ještě musím zabít?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Nemáš ani tušení kolik nás je. Je nás neskutečně mnoho.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//Naše armády napadnou celý známý svět.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Osvobodíme svět od barbarů, kteří si říkají Strážci Innosova Ohně.
};

func void DIA_Schwarzmagier_HELLO_meister()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//(naštvaně) Dost řečí! Zničím tě!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Tvůj duch bude zapuzen do temnoty.

	if(Npc_HasItems(other,ItAm_Prot_BlackEye_Mis) == FALSE)
	{
		AI_PlayAni(hero,"T_INSANE");
		hero.attribute[ATR_MANA] = 0;
		if(hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		};
		SC_ObsessionCounter = 100;
		B_SCIsObsessed(hero);
	};
	Info_ClearChoices(DIA_Schwarzmagier_HELLO);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,Dialog_Ende,DIA_Schwarzmagier_HELLO_back);
};

func void DIA_Schwarzmagier_HELLO_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_EnemyOverride] = FALSE;
};