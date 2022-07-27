
instance DIA_VLK_6137_GASPAR_EXIT(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 999;
	condition = dia_vlk_6137_gaspar_exit_condition;
	information = dia_vlk_6137_gaspar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6137_gaspar_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6137_gaspar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_6137_GASPAR_HELLO(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_hello_condition;
	information = dia_vlk_6137_gaspar_hello_info;
	permanent = FALSE;
	description = "Hele, co tady sakra děláš?!";
};


func int dia_vlk_6137_gaspar_hello_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_hello_info()
{
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_00");	//Hele, co tady sakra děláš?! A kde je Hanna?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_01");	//Jmenuji se Gaspar. Já...
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_02");	//Na tohle jsem se neptal!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_03");	//Teď jsem majitel já, a toto je můj hotel.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_05");	//Před několika dny zatkla Hannu městská stráž - obvinili jí z krádeže.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_06");	//Z čeho že jí obvinili?!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_07");	//Z krádeže! Okradla jednoho obchodníka a teď je v base. Přesně tam, kam patří!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_08");	//Co? Zbláznil ses kámo? To nemůže být pravda!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_09");	//Ale to víš, že může! V její truhle našli věci toho ubohého chlápka.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_10");	//Takže díky všem důkazům je očividné, že je vinna.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_12");	//Pokud tě zajímají podrobnosti toho případu, tak by sis měl pohovořit se samotným lordem Andrem.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_13");	//A už nemám čas s tebou mluvit.
	KNOWSHANNAINPRISION = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Po mém návratu do Khorinisu se ukázalo, že Hannu zatkli. Je obviněna z krádeže věcí jednoho obchodníka. Místo ní teď hotel vede osoba jménem Gaspar - hrozný chlap! Musím si promluvit s Andrem a zjistit, co se tu vlastně děje.");
};


instance DIA_VLK_6137_GASPAR_INPRISOIN(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoin_condition;
	information = dia_vlk_6137_gaspar_inprisoin_info;
	permanent = FALSE;
	description = "Ty jsi tedy svědkem v té věci s Hannou?";
};


func int dia_vlk_6137_gaspar_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONHAKON == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoin_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_00");	//Ty jsi tedy svědkem v té věci s Hannou?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_01");	//Jo to jsem já.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_02");	//Pak mi řekni, cos viděl.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_03");	//Vše, co jsem viděl, jsem už řekl lordu Andremu. Takže všechny otázky směruj na něj.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_04");	//Proč o tom vlastně nechceš mluvit?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_05");	//Protože... (je nervózní) Protože to není tvoje věc!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_07");	//Myslím, že se brzy ocitneš tam, kde je tvoje místo.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_08");	//Ty mi vyhrožuješ?!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_10");	//Poslouchej... (nervózně) Kašlu na všechny tvoje výhružky a varování!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_11");	//Raději se kliď z mého hotelu, než zavolám stráže.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Gaspar očividně skrývá něco ohledem Hanny. Myslím, že bych se o tom chlapovi měl dozvědět více - rozhodně v tomto případě nemá čisté ruce.");
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6137_GASPAR_INPRISOINAB(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoinab_condition;
	information = dia_vlk_6137_gaspar_inprisoinab_info;
	permanent = TRUE;
	description = "Nahrál jsi to na Hannu!";
};


func int dia_vlk_6137_gaspar_inprisoinab_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE) && (GASPARPISSOFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoinab_info()
{
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_00");	//Nahrál jsi to na Hannu!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_01");	//(vystrašeně) Co?!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_03");	//Tys podstrčil Hanně ty věci!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_04");	//Kdo? Já? Já s tím nemám nic společného! Nic o tom nevím!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_05");	//Víš! A nebude to těžké dokázat.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_06");	//Dobře, tak si to zkus.

	if((Npc_HasItems(other,itri_hakonmissring) >= 1) && (JOTELLSGASPAR == TRUE))
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_08");	//Podívej se, jaký tu mám krásný prsten.
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_09");	//A ještě znám jednu osobu, jmenuje se Joe. Mimochodem, taky tě zná.
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_10");	//A ví toho o tobě tolik, že to bude stačit, abys šel bručet.
		AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_11");	//(bledne) Co?!
		AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_13");	//Dělej, co chceš - mně už je to všechno jedno.
		GASPARPISSOFF = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6137_GASPAR_FUCKOFF(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 10;
	condition = dia_vlk_6137_gaspar_fuckoff_condition;
	information = dia_vlk_6137_gaspar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6137_gaspar_fuckoff_condition()
{
	if((GASPARPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

