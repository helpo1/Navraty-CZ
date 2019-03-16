
instance DIA_DIA_VLK_6130_BENCHEL_EXIT(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 999;
	condition = dia_vlk_6130_benchel_exit_condition;
	information = dia_vlk_6130_benchel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6130_benchel_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6130_benchel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDI(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendi_condition;
	information = dia_vlk_6130_benchel_missbrendi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6130_benchel_missbrendi_condition()
{
	if(BENCHELTELLTHANKS == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendi_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_01");	//Díky, že jsi mi pomohl!... (popadá dech)
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_02");	//Ti hajzli mě málem poslali na druhej břeh... (nervózně)
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_04");	//Chlape, ty jsi Benchel?!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_05");	//Jo! Benchel, tak se jmenuji.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_06");	//Pak ti mám povědět, že Lutera unavuje čekání!
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_08");	//Měl jsi mu přinést černou brandy z hostince 'U Mrtvé harpyje'.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_13");	//Věř mi, nevěděl jsem o čase!... A když jsem šel, přepadli mě tyhle ďáblovy děvky.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_14");	//Chytli mě a přepadli.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_18");	//Co po tobě chtěli?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_24");	//A řekl jsem mu o své práci...
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_25");	//Nech mě hádat - o černé brandy?!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_28");	//Jedna láhev je drahá jak můj týdenní plat!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_30");	//Kdysi cena tak vysoká nebyla, ale stoupla dvojnásobně, co lodě nejezdí na ostrov.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_31");	//Cena černý brandy ještě nikdy takhle vysoko nebyla!
	B_LogEntry(TOPIC_BLACKBRENDI,"Pomohl jsem Benchelovy dohodnout se s bandity.");
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDIFOLLOW(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendifollow_condition;
	information = dia_vlk_6130_benchel_missbrendifollow_info;
	permanent = FALSE;
	description = "Ta brandy musí za Luterem.";
};


func int dia_vlk_6130_benchel_missbrendifollow_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6130_benchel_missbrendi))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendifollow_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_01");	//Ta brandy musí za Luterem.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_02");	//To jo!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_04");	//Raději bych... (nervózně)
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_07");	//Já mám život moc rád, takže v tomhle končím.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_11");	//Neber to jako důvod, nechceš dovést k městské bráně?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_12");	//Vzal bys mě s sebou?!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_18");	//Jo, jdu...
	B_LogEntry(TOPIC_BLACKBRENDI,"Souhlasil jsem, že Benchela doprovodím k městské bráně.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	BENCHELFOLLOWME = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

instance DIA_VLK_6130_BENCHEL_ANGEKOMMEN(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_angekommen_condition;
	information = dia_vlk_6130_benchel_angekommen_info;
	important = TRUE;
};

func int dia_vlk_6130_benchel_angekommen_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELFOLLOWME == TRUE) && (Npc_GetDistToWP(self,"CITY2") < 6000))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_angekommen_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_00");	//Počkej, myslím, že dál už půjdu sám!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_01");	//Raději bych...
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_02");	//... prostě nechci...!
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_03");	//Co tím myslíš?!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_04");	//Že tohle dobrodružství mi stačilo!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_05");	//Už nikdy nechci vidět bandity.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_06");	//Až potkáš Lutera, můžeš mu sdělit, že končím!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_09");	//Vem ty láhve k němu!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_10");	//Určitě ti poděkuje, he, he...
	B_GiveInvItems(self,other,itmi_blackbrendi,5);
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_12");	//A co teď budeš dělat?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_13");	//Nic!...
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_14");	//Užívat odpočinku!
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_15");	//Když myslíš, řeknu to Luterovi.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_16");	//Díky, příteli.
	BENCHELLEAVEME = TRUE;
	B_LogEntry(TOPIC_BLACKBRENDI,"Mám Luterovi vyřídit, že Benchel u něj končí. Raději má život než práci, řekl si po přepadení... Musím Luterovi donést ten chlast.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RestInTavern");
};

instance DIA_VLK_6130_BENCHEL_HALLO(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_hallo_condition;
	information = dia_vlk_6130_benchel_hallo_info;
	permanent = TRUE;
	description = "Jak to jde";
};

func int dia_vlk_6130_benchel_hallo_condition()
{
	if(BENCHELLEAVEME == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_Hallo_01_00");	//Jak to jde
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Hallo_01_01");	//Nádherně, příteli.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Hallo_01_02");	//Nikdy jsem se necítil tak lehce!
};


instance DIA_VLK_6130_BENCHEL_GO(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_go_condition;
	information = dia_vlk_6130_benchel_go_info;
	permanent = TRUE;
	description = "Pojď, jdeme.";
};


func int dia_vlk_6130_benchel_go_condition()
{
	if((BENCHELLEAVEME == FALSE) && (BENCHELFOLLOWME == TRUE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_go_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_Go_01_00");	//Pojď, jdeme.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Go_01_01");	//Dobrá, tak jdeme...
	BENCHELFOLLOWME = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

