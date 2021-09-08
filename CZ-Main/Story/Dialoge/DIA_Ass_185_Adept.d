instance DIA_Ass_185_Adept_EXIT(C_Info)
{
	npc = Ass_185_Adept;
	nr = 999;
	condition = DIA_Ass_185_Adept_exit_condition;
	information = DIA_Ass_185_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_185_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_185_Adept_exit_info()
{
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_01");	//(zachmuřeně) Odpusť, příteli. Bohužel tě nemůžu nechat jen tak odejít.
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_02");	//Samozřejmě to není tajemství, ale můj pán nebude rád, jestli všem o této rudě řekneš.
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_03");	//Neboj se, zabiju tě rychle.
	B_LogEntry(TOPIC_Intriges,"Luka se rozhodl mě zabít. Jako vždy - ukázal jsem se na špatném místě ve špatnou dobu.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Pray");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_185_Adept_Hello(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_hello_condition;
	information = DIA_Ass_185_Adept_hello_info;
	permanent = FALSE;
	important = TRUE;
};
	
func int DIA_Ass_185_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_185_Adept_hello_info()
{
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_01");	//Ale, ale. Koho pak to tu máme?
	AI_Output(other,self,"DIA_Ass_185_Adept_hello_01_02");	//Kdo se ptá?
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_03");	//Bratři mi říkají Luka, ale myslím, že moje jméno ti toho moc neříká. 
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_04");	//(hodnotí) Hmmm. Nebudíš zrovna dojem jako silák.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_05");	//Na druhou stranu jsem slyšel,že sis docela chytře poradil s Hasimem.
	AI_Output(other,self,"DIA_Ass_185_Adept_hello_01_06");	//Jak to víš?
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_07");	//Jak? To já jsem se o něj musel postarat. 
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_08");	//Avšak mistr Tiamant se z nějakého důvodu rozhodl důvěřovat tobě.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_09");	//A ty jsi samozřejmě svoji šanci nepromarnil... 
	B_LogEntry(TOPIC_Intriges,"Ve zlatém dole jsem potkal stína - Luka. Zdá se, že tohle setkání není jen tak, protože pracuje pro mistra Tiamanta. Musím se od něj dozvědět víc.");
};	

instance DIA_Ass_185_Adept_Tiamant(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_Tiamant_condition;
	information = DIA_Ass_185_Adept_Tiamant_info;
	permanent = FALSE;
	description = "Proč dal mistr Tiamant příkaz ho zabít?";
};
	
func int DIA_Ass_185_Adept_Tiamant_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_Tiamant_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_Tiamant_01_01");	//Proč dal mistr Tiamant příkaz ho zabít?
	AI_Output(self,other,"DIA_Ass_185_Adept_Tiamant_01_02");	//Staral se do věcí, do kterých mu nic nebylo. Víc tě nemusí zajímat.
	AI_Output(self,other,"DIA_Ass_185_Adept_Tiamant_01_03");	//Pokud nechceš skončit stejně tak, jako on.
};	

instance DIA_Ass_185_Adept_WhatDo(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_WhatDo_condition;
	information = DIA_Ass_185_Adept_WhatDo_info;
	permanent = FALSE;
	description = "A co tu vůbec děláš?";
};
	
func int DIA_Ass_185_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_WhatDo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_01");	//A co tu vůbec děláš?
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_02");	//Já sám vůbec nevím. Ale když už jsi sem přišel ty, tak tě asi očekávám.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_03");	//Zajimavé. Proč?
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_04");	//Tu samou otázku ti můžu dát taky. Co se ti tu zalíbilo, když ses tu ukázal?
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_05");	//Plním příkaz mistra Osaira. Myslí si, že se tu nachází velký zlatý důl.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_06");	//Vypadá to, že tu fakt je!
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_07");	//Opravdu?
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_08");	//No ano, je akorát za tebou.
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_09");	//Ach... (sarkasticky) Asi jsem si nevšiml.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_10");	//To je zvláštní, vždyť se skoro celá jeskyně třpytí zlatem.
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_11");	//No, to se občas stává.
};	


instance DIA_Ass_185_Adept_StrangeGuy(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_StrangeGuy_condition;
	information = DIA_Ass_185_Adept_StrangeGuy_info;
	permanent = FALSE;
	description = "Takže pracuješ pro mistra Tiamanta?";
};
	
func int DIA_Ass_185_Adept_StrangeGuy_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_StrangeGuy_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_01");	//Takže pracuješ pro mistra Tiamanta?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_02");	//Ano, přesně tak. To tě tak udivuje?
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_03");	//Proč v případu s Hasimem se rozhodl důvěřovat novici a ne tobě?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_04");	//To lze snadno vysvětlit.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_05");	//Pokud bys naštípal dříví, nikoho by nikdy nenapadlo, že jsi to dělal na jeho příkaz.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_06");	//Nikdo by ti jednoduše nevěřil.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_07");	//A s lháři se tady moc nepáráme. Tik - a už jsi u Beliara.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_08");	//No, vypadá to, že ty zrovna nepatříš mezi tupé lidi, kteří si kopou vlastní jámu.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_09");	//Hasim byl tvrdý oříšek. Velmi jsem se divil, když jsem zjistil, že se ti ho podařilo zabít.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_10");	//Doufám, že znovu potvrdíš svoji reputaci. Jinak to nebude zajímavé! 
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_11");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_12");	//Neboj se, za chvíli to zjistíš sám. 
};	