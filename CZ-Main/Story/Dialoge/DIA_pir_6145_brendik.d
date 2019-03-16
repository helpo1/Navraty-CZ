
instance DIA_BRENDIK_EXIT(C_Info)
{
	npc = pir_6145_brendik;
	nr = 999;
	condition = dia_brendik_exit_condition;
	information = dia_brendik_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_brendik_exit_condition()
{
	return TRUE;
};

func void dia_brendik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HELLO(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_hello_condition;
	information = dia_brendik_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brendik_hello_condition()
{
	return TRUE;
};

func void dia_brendik_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Brendik_Hello_01_00");	//Hej, ty! Stát!
	AI_Output(other,self,"DIA_Brendik_Hello_01_01");	//Kdo?! Já?!
	AI_Output(self,other,"DIA_Brendik_Hello_01_02");	//Ne, já asi!... Vidíš tu snad někoho jiného?!
	AI_Output(self,other,"DIA_Brendik_Hello_01_04");	//Teď mluv: Co tu děláš, a hlavně, co tu chceš?!
	AI_Output(other,self,"DIA_Brendik_Hello_01_05");	//No, šel jsem se projít.
	AI_Output(self,other,"DIA_Brendik_Hello_01_06");	//Ha!... (šklebí se) Zajímavé místo na procházku! Nejsi nějaký bandita?!... (zvědavě)
	AI_Output(other,self,"DIA_Brendik_Hello_01_07");	//To teda fakt ne, vypadám snad jako bandita?!
	AI_Output(self,other,"DIA_Brendik_Hello_01_08");	//Hmm... (pozorně zkoumá) No dobrá. Ale něco zkusíš a je po tobě, jasný?!
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_Brendik_Hello_01_10");	//To si zapamatuji.
	MEETBRENDIK = TRUE;
};


instance DIA_BRENDIK_FINDLOSTHUSB(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_findlosthusb_condition;
	information = dia_brendik_findlosthusb_info;
	permanent = FALSE;
	description = "Jmenuješ se Brendik?";
};


func int dia_brendik_findlosthusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_brendik_findlosthusb_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_00");	//Jmenuješ se Brendik?
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_01");	//Jo... A co je ti po tom?!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_02");	//Posílá mě tvoje žena, Gritta. Pamatuješ si na ni?
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_03");	//Cože?! Moje ŽENA?!... (s hrůzou) To není možné! Jen to ne!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_04");	//Něco je špatně?!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_05");	//Chci žít normální život - raději me zabij!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_06");	//Vypadá to, že se nějak bojíš své ženy!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_07");	//Ona je prostě nesnesitelná! Má v hlavě jen peníze a oblečení!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_08");	//'Brendiku kup mi nové šaty!', 'Brendiku chci klobouk!', 'Brendiku kup mi kožené boty'... Víš kolik to všechno stojí?!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_09");	//Pracoval jsem tvrdě jak kůň a ona furt chtěla jen prachy, a pak si stěžovala poč si mě vůbec brala.
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_10");	//Abych řekl pravdu tak se tvá žena vůbec nezměnila... Potkal jsem jí, protože dlužila jednomu obchodníkovi, pro kterýho jsem dělal.
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_11");	//Ale vypadala, že jí hodně chybíš, hlavně nevěděla, jestli žiješ nebo jsi mrtvý.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_12");	//(sarkasticky) No samozřejmě! Její strýc Thorben ji asi nemohl koupit vše co chtěla!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_13");	//Prostě jí řekni, že ji už nikdy neuvidím a stejne ona me. Taky jí řekni, že byl omyl, že jsem si ji vzal!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_14");	//V Khorinisu jsem byl NIKDO! Tady jsem chlap. Vážím si kluků v táboře a kapitána Grega.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_15");	//Nikdy se nevrátím ke svému starému životu!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_16");	//Prostě ji řekni že jsem na živu a ať mi dá pokoj!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_17");	//Řeknu jí to.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_18");	//Bezva!
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Našel jsem Brendika. Vypadal velice znepokojen tím, že ho jeho žena hledá. A v žádném případě se nechce vrátit. Měl bych to povedet Gritte.");
	BRENDIKNOTBACK = TRUE;
};


instance DIA_BRENDIK_WHATDO(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_whatdo_condition;
	information = dia_brendik_whatdo_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int dia_brendik_whatdo_condition()
{
	return TRUE;
};

func void dia_brendik_whatdo_info()
{
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_01");	//Hlídám bandity - Gregův rozkaz.
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_02");	//A proč zrovna tady?
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_03");	//Tady vodsud na ně hezky vidím.
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_04");	//A v bažinách je moc nebezpečných nestvůr.
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_05");	//Je tu bezpečněji, než to vypadá...
};


instance DIA_BRENDIK_GOTOGREG(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_gotogreg_condition;
	information = dia_brendik_gotogreg_info;
	permanent = FALSE;
	description = "Chce tě Greg!";
};


func int dia_brendik_gotogreg_condition()
{
	if(MEETBRENDIKGREG == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_gotogreg_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_00");	//Chce tě Greg!
	AI_Output(self,other,"DIA_Brendik_GoToGreg_01_01");	//A co ode mě chce?!
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_02");	//Abys pohnul prdelí a odklusal do tábora.
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_03");	//Myslí si, že už se flákáš moc dlouho.
	AI_Output(self,other,"DIA_Brendik_GoToGreg_01_04");	//Konečně bude nejaká zábava... Ty bažiny mě už nudí!
	BRENDIKGOCAMP = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HOW(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_how_condition;
	information = dia_brendik_how_info;
	permanent = TRUE;
	description = "Co je s tebou?";
};


func int dia_brendik_how_condition()
{
	if(BRENDIKNOTBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_how_info()
{
	AI_Output(other,self,"DIA_Brendik_How_01_01");	//Co je s tebou?
	AI_Output(self,other,"DIA_Brendik_How_01_02");	//Ale nic, jen jsem se trochu zamyslel!
	AI_Output(self,other,"DIA_Brendik_How_01_03");	//Eh... Kdybychom tak měli svou loď! Tak bychom tu jen tak nečinně nesedeli.
};


instance DIA_BRENDIK_PICKPOCKET(C_Info)
{
	npc = pir_6145_brendik;
	nr = 900;
	condition = dia_brendik_pickpocket_condition;
	information = dia_brendik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_brendik_pickpocket_condition()
{
	return C_Beklauen(105,350);
};

func void dia_brendik_pickpocket_info()
{
	Info_ClearChoices(dia_brendik_pickpocket);
	Info_AddChoice(dia_brendik_pickpocket,Dialog_Back,dia_brendik_pickpocket_back);
	Info_AddChoice(dia_brendik_pickpocket,DIALOG_PICKPOCKET,dia_brendik_pickpocket_doit);
};

func void dia_brendik_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_brendik_pickpocket);
};

func void dia_brendik_pickpocket_back()
{
	Info_ClearChoices(dia_brendik_pickpocket);
};

