
instance DIA_GILLIMOR_EXIT(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 999;
	condition = dia_gillimor_exit_condition;
	information = dia_gillimor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gillimor_exit_condition()
{
	return TRUE;
};

func void dia_gillimor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILLIMOR_HELLO(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_condition;
	information = dia_gillimor_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Zdravím.";
};


func int dia_gillimor_hello_condition()
{
	if(MEETGILLIMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_info()
{
	AI_Output(other,self,"DIA_Gillimor_Hello_01_01");	//Zdravím.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_02");	//Vítám tě, cizinče. Je od tebe odvážné, že ses tu ukázal.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_03");	//Většinou tu nezabloudí ani živá duše! Co tě sem přivází?
	AI_Output(other,self,"DIA_Gillimor_Hello_01_04");	//Hledám černého draka. Slyšel jsem, že by měl žít někde tady.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_05");	//Nestřetl's ho někde tady v údolí?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_06");	//Hmm... Jenom velice zřídka opouštím tábor. Nic takového jsem neviděl.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_07");	//Ty nechodíš lovit? A co ostatni?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_08");	//Ne, ani ne. Jako lovec jsem na nic.
	AI_Output(self,other,"DIA_Gillimor_Hello_01_09");	//Pokud opouštím tábor, je to jenom abych doplnil zásoby léčiv.
	AI_Output(other,self,"DIA_Gillimor_Hello_01_10");	//Vyznáš se v rostlinách?
	AI_Output(self,other,"DIA_Gillimor_Hello_01_11");	//Více méně jsem něco pochytil.
	MEETGILLIMOR = TRUE;
};


instance DIA_GILLIMOR_HELLO_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_teach_condition;
	information = dia_gillimor_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že se vyznáš v alchymii.";
};


func int dia_gillimor_hello_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORTEACHER == TRUE) && (GILLIMORREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_teach_info()
{
	AI_Output(other,self,"DIA_Gillimor_Hello_Teach_01_01");	//Slyšel jsem, že se vyznáš v alchymii.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_02");	//Ano, nejsem zlý. Umím uvařit více druhů lektvarů.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_03");	//Naneštěstí je tady dost těžké najít ingredience pro některé z nich.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_04");	//Takže si to procvičuji na léčivých lektvarech.
	AI_Output(other,self,"DIA_Gillimor_Hello_Teach_01_05");	//A můžeš mi některé z nich připravit?
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_06");	//Ano, mohl bych, pokud mi doneseš potřebné ingredience.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_07");	//A pokud tě to zajímá, taky bych tě mohl některé naučit připravit.
	AI_Output(self,other,"DIA_Gillimor_Hello_Teach_01_09");	//Jenom řekni, když budeš chtít.
	GILLIMORREADYTEACH = TRUE;
};


instance DIA_GILLIMOR_BREWFORME(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 39;
	condition = dia_gillimor_brewforme_condition;
	information = dia_gillimor_brewforme_info;
	permanent = TRUE;
	description = "Připrav mi...";
};


func int dia_gillimor_brewforme_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_brewforme_info()
{
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme,"... Léčivý extrakt.",dia_gillimor_brewforme_health);
};

func void dia_gillimor_brewforme_back()
{
	Info_ClearChoices(dia_gillimor_brewforme);
};

func void dia_gillimor_brewforme_health()
{
	AI_Output(other,self,"DIA_Gillimor_BrewForMe_Health_01_01");	//Připrav mi léčivý elixír.
	AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_02");	//Máš ty věci?
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1))
	{
		AI_Output(other,self,"DIA_Gillimor_BrewForMe_Health_01_03");	//Ano, tady.
		B_GiveInvItems(other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_04");	//Dobře. Lektvar ti dám hned teď, abys nemusel dlouho čekat.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Gillimor_BrewForMe_Health_01_05");	//Nemáš všechny věci. Vrať se, když je budeš mít.
	};
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme,"Udělej mi Léčivý extrakt.",dia_gillimor_brewforme_health);
};


instance DIA_GILLIMOR_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 10;
	condition = dia_gillimor_teach_condition;
	information = dia_gillimor_teach_info;
	permanent = TRUE;
	description = "Nauč mě vařit lektvary...";
};


func int dia_gillimor_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_teach_info()
{
	AI_Output(other,self,"DIA_Gillimor_Teach_01_01");	//Nauč mě vařit lektvary.
	AI_Output(self,other,"DIA_Gillimor_Teach_01_02");	//Odhalím ti tajemství alchymie.
	Info_ClearChoices(dia_gillimor_teach);
	Info_AddChoice(dia_gillimor_teach,Dialog_Back,dia_gillimor_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_gillimor_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Extrakt hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_gillimor_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Elixír hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_gillimor_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Elixír života",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_gillimor_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_gillimor_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Extrakt many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_gillimor_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Elixír many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_gillimor_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Elixír ducha",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_gillimor_teach_perm_mana);
	};
};

func void dia_gillimor_teach_back()
{
	Info_ClearChoices(dia_gillimor_teach);
};

func void dia_gillimor_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_gillimor_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_gillimor_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_gillimor_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_gillimor_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_gillimor_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_gillimor_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_gillimor_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

