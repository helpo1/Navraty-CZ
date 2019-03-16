
instance DIA_Addon_BDT_10026_Wache_EXIT(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 999;
	condition = DIA_Addon_10026_Wache_EXIT_Condition;
	information = DIA_Addon_10026_Wache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_10026_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Wache_Hi(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 99;
	condition = DIA_Addon_10026_Wache_Hi_Condition;
	information = DIA_Addon_10026_Wache_Hi_Info;
	permanent = TRUE;
	description = "Jak se máš?";
};


func int DIA_Addon_10026_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//Jak se máš?
	if(Sklaven_Flucht == FALSE)
	{
		CreateInvItems(self,ItFo_Bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//Bohužel, stále máme moc málo otroků. Měli bychom brzy sehnat nějaké nové.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//Tihle chlápi jsou úplně hotoví. Asi proto, že dostali příliš málo jídla. (Smích)
		B_UseItem(self,ItFo_Bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//Ale já radši pošlu ty kopáče zpátky do práce, než abych těm psům dal kousek masa.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//Otroci jsou pryč, to je špatné. Tak to budeme muset asi znovu přitlačit na kopáče.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_10026_Wache_Gruft(C_Info)
{
	npc = BDT_10026_Addon_Wache;
	nr = 2;
	condition = DIA_Addon_10026_Wache_Gruft_Condition;
	information = DIA_Addon_10026_Wache_Gruft_Info;
	permanent = TRUE;
	description = "Víš něco o té kryptě?";
};


func int DIA_Addon_10026_Wache_Gruft_Condition()
{
	return TRUE;
};

func void DIA_Addon_10026_Wache_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Víš něco o té kryptě?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Ano. Hrobka je za tímto průchodem.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(Tiše) Prostě jdi podle tech mrtvol a najdeš to.
};

