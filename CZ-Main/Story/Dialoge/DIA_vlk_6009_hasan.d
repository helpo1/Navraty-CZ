
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
	description = "Co tady děláš?";
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
	AI_Output(other,self,"DIA_Hasan_Hello_01_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_Hasan_Hello_01_02");	//Co, co!... (nahněvaně) Jako kdybys to neviděl!...
	AI_Output(self,other,"DIA_Hasan_Hello_01_03");	//Střežím sklad s naším jídlem.
	AI_Output(other,self,"DIA_Hasan_Hello_01_04");	//To jsou tady nějací zloději?!
	AI_Output(self,other,"DIA_Hasan_Hello_01_05");	//Ne, žádní zloději. Ale kdybych to nedělal, nikdo by neodolal pokušení naplnit si břicho těmito zásobami!
	AI_Output(self,other,"DIA_Hasan_Hello_01_06");	//Jídlo tady je tak dobré, že musíme lidi krotit. Ano, chápou to, ale pokušení je veliké!
	AI_Output(self,other,"DIA_Hasan_Hello_01_07");	//Musíme si taky dělat zásoby na dlouhou dobu. Nikdo neví, co nás čeká.
	AI_Output(other,self,"DIA_Hasan_Hello_01_08");	//Jasně. A celou dobu jsi tu ty?
	AI_Output(self,other,"DIA_Hasan_Hello_01_09");	//Ano, celý den. Někdy mě ale vystřídá Nash. Je to spolehlivý chlapík a můžu mu věřit.
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
	description = "Ty jsi obchodník.";
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
	AI_Output(other,self,"DIA_Hasan_Hello_Teach_01_01");	//Ruen mi řekl, že mi můžeš něco prodat.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_02");	//Ano, můžu ti něco prodat výměnou za několik zlatek. Přirozeně se to nevztahuje na jídlo a pití.
	AI_Output(other,self,"DIA_Hasan_Hello_Teach_01_03");	//A na co ti je tady zlato?! Vždyť ho ani nemůžeš nikde minout...
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_04");	//Určitě máš pravdu, na nic ho nepotřebujeme. Ale stále je tu šance, že se odsud dostaneme. Čili nám zlato může přijít vhod.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_05");	//A někdy naší lovci něco najdou a můžou to tady vyměnit za něco užitečného.
	AI_Output(self,other,"DIA_Hasan_Hello_Teach_01_06");	//Pokud chceš, můžeš si taky něco zajímavého najít.
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
	description = "Ukaž mi své zboží.";
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

	AI_Output(other,self,"DIA_Hasan_Trade_01_01");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Hasan_Trade_01_02");	//Jen vybírej.
	B_GiveTradeInv(self);
};

