
instance DIA_Pal_212_Schiffswache_EXIT(C_Info)
{
	npc = PAL_212_Schiffswache;
	nr = 999;
	condition = DIA_Pal_212_Schiffswache_EXIT_Condition;
	information = DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pal_212_Schiffswache_WERSEIDIHR(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information = DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;
	description = "Kdo jsi?";
};


func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Kdo jste?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//Jsme vyslanci krále Rhobara, služebníci Innose a paladinové této země.
};


instance DIA_Pal_212_Schiffswache_WASMACHSTDU2(C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;
	description = "Co tady děláte?";
};


func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//Co tady děláte?
	if(MIS_ShipIsFree == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//Jediné co tě může zajímat je, že já tě nepustím na loď.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//Hlídáme, aby nepovolaní nevstoupili na loď. Promiň, ale nemůžu tě pustit.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Je to plýtvání mým časem. Raději bych byl v Hornickém údolí spolu s mými bratry paladiny.
	};
	AI_StopProcessInfos(self);
};

