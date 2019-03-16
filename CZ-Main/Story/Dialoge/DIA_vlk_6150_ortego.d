
instance DIA_VLK_6150_ORTEGO_EXIT(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 999;
	condition = dia_vlk_6150_ortego_exit_condition;
	information = dia_vlk_6150_ortego_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6150_ortego_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6150_ortego_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6150_ORTEGO_HELLO(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 5;
	condition = dia_vlk_6150_ortego_hello_condition;
	information = dia_vlk_6150_ortego_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_vlk_6150_ortego_hello_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_vlk_6150_ortego_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_00");	//Konečně jsi přišel! Čekal jsem tu na tebe.
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_01");	//Čekal jsi na mne?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_02");	//Na tebe... Na koho jiného? I když jsem si tě představoval trochu jinak.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_03");	//Ale lepší otázka - donesl jsi moje peníze?
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_04");	//Jaké peníze?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_05");	//Nerozumíš...(naštvaně) Máš mě za idiota?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_06");	//Ty peníze, cos mi slíbil, za vraždu toho starého ubohého alchymisty.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_07");	//(směje se) Ten ubožák nestihl ani pípnout, jak rychle byl mrtvý!
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_08");	//A teď čekám na svoje zlato, které jsi mi slíbil v dopise.
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_11");	//Ty jsi někoho zabil?
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_12");	//(nechápavě) Co je s tebou chlape?! Nemluvím snad jasně? Anebo máš už poslední zbytky mozku utopené v pálence?!
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_13");	//Já jsem úplně v pořádku, ale myslím, že nejsem ten, koho sháníš.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_14");	//Co?! Hmmm... chceš mi říct, že jsem se zmýlil?
	AI_Output(other,self,"DIA_VLK_6150_Ortego_Hello_01_15");	//Už to tak bude.
	AI_Output(self,other,"DIA_VLK_6150_Ortego_Hello_01_16");	//Aha, tak to je mi všechno jasné. Počkej chvilku, všechno ti vysvětlím...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

