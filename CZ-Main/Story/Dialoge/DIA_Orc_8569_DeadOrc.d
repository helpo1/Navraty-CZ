instance DIA_Orc_8569_DeadOrc_EXIT(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_exit_condition;
	information = DIA_Orc_8569_DeadOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8569_DeadOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8569_DeadOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8569_DeadOrc_Hello(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_Hello_condition;
	information = DIA_Orc_8569_DeadOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8569_DeadOrc_Hello_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (DeadRabOrkovInsertDone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8569_DeadOrc_Hello_info()
{
	B_GivePlayerXP(1500);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_01");	//Tak, kohopak to tady máme?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_02");	//Arrgh, člověk... Přijít mě zabít? 
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_03");	//Přijde na to. Alespoň s chodícími mrtvolami to tak vždy delám.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_04");	//Nog-Drag prosit, to nedělat. Nezabíjet!
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_05");	//Nog-Drag udělat vše, co člověk říct!
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_06");	//Dobrá, uklidni se! Proč bych tě taky zabíjel, stejně jsi už mrtvý.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_07");	//Nog-Drag nechtít znovu umřít! Když člověk ušetřit Nog-Drag, on udělat vše co si přát.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_08");	//Vidím, že tě můj vzhled hodně vyděsil. Takže se jmenuješ Nog-Drag?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_09");	//Člověk říct správně. Bratři kdysi dát toto jméno.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_10");	//Když vidím, jak se třeseš, je mi jasné, že k válečníkům asi nepatříš...
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_11");	//Správně! Nog-Drag nikdy nebýt válečník!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_12");	//Takže jsi jen obyčejný otrok. Hádám dobře?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_13");	//Člověk znát vše! Nog-Drag opravdu sloužit jako otrok, postavit veliký chrám pro svého pána.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_14");	//Tak ty jsi tady už od výstavby chrámu?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_15");	//Nog-Drag být tady dlouhou dobu. Vidět, jak bratři stavět chrám, i jak zlá démon pak všechny zabít. Vidět a pamatovat hodně!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_16");	//Pak možná víš jednu velmi důležitou věc, krerá mě zajímá.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_17");	//Nog-Drag říct vše, když člověk nezabít!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_18");	//Nejsi až tak hloupý... Dobře! Odpovíš mi na mou otázku - a já tě nezabiju.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_19");	//Člověk se ptát, Nog-Drag říct vše.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_20");	//Znáš šamana jménem Hash-Gor?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_21");	//Hash-Gor?! (vydešeně) Ale proč se ptát?
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_22");	//To se tě netýká! Jen mi odpověz na mou otázku.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_23");	//Ano, Nog-Drag znát velikého syna ducha Hash-Gor! Být největší šaman, když bratři stavět chrám.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_24");	//Proč ho nazýváš velikým?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_25");	//Hash-Gor znát kouzlo, které druzí synové ducha ne!
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_26");	//Ostatní bratři proto mít z Hash-Gor velký strach! 
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_27");	//Když se veliký šaman zlobit, on zabíjet skřety, sníst srdce a udělat nemrtvý, jako Nog-Drag.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_28");	//Jasně. Náhodou nevíš, kde bych Hash-Gora mohl najít?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_29");	//... být dlouhá doba co Nog-Drag naposledy vidět veliký šaman...
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_30");	//Nog-Drag věří, že Hash-Gor sám už být dlouho mrtev!
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_31");	//Takže člověk by měl hledat tam, kde skřeti ukládat mrtvé bratry.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_32");	//Ty myslíš skřetí hřbitov?
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_33");	//Nog-Drag myslet, že člověk správně poznat toto místo.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_34");	//Ale dávat tam pozor! Hash-Gor mocná a zlá šaman.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_35");	//Když člověk vzbudit jeho duše, moci snadno zemřít!
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_36");	//Dobře, dám si pozor.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_37");	//Člověk ještě něco ptát Nog-Drag?
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Info_18_38");	//Ne, už od tebe nic nepotřebuji.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Info_18_39");	//Takže teď člověk nechat Nog-Drag a neublížit?
	B_LogEntry(TOPIC_NagDumgar,"Potkal jsem nemrtvého skřeta jménem Nog-Drag. Kdysi byl jedním z otroků co se podíleli na stavbě Spáčova chrámu. Pod příslibem, že ho nezabiju mi vyprávěl o velikém šamanovi Hash-Gorovi. Nejspíš je už dávno mrtvý a v tom případě bych ho mohl najít na skřetím hřbitově.");
	Info_ClearChoices(DIA_Orc_8569_DeadOrc_Hello);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello,"Nu, změnil jsem názor.",DIA_Orc_8569_DeadOrc_Hello_No);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello,"Jak jsem slíbil, neublížím ti.",DIA_Orc_8569_DeadOrc_Hello_Yes);
};


func void DIA_Orc_8569_DeadOrc_Hello_Yes()
{
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_01");	//Jak jsem slíbil, neublížím ti.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_02");	//Ach... Nog-Drag děkovat člověk, že dodržet svůj slib.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_03");	//Za to mít dárek pro člověk, když hledat Hash-Gor.
	B_GiveInvItems(self,other,ItMi_DeadOrcItem,1);
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_04");	//Děkuju ti, Nog-Dragu. To se může hodit.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_05");	//Tak sbohem, skřete - musím už jít.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_Yes_18_06");	//Hodně štěstí, člověk...
	DeadOrcLeavePeace = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8569_DeadOrc_Hello_No()
{
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_01");	//Nu, změnil jsem názor.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_02");	//Myslím, že by nebylo správné nechat tě tu poběhovat.
	AI_Output(other,self,"DIA_Orc_8569_DeadOrc_Hello_No_18_03");	//Takže tě zabiju! Promiň.
	AI_Output(self,other,"DIA_Orc_8569_DeadOrc_Hello_No_18_04");	//Arrgh! Člověk podvést Nog-Drag!
	AI_StopProcessInfos(self);
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
};