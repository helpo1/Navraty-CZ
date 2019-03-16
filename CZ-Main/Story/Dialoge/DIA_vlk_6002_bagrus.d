
instance DIA_BAGRUS_EXIT(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 999;
	condition = dia_bagrus_exit_condition;
	information = dia_bagrus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bagrus_exit_condition()
{
	return TRUE;
};

func void dia_bagrus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAGRUS_HELLO(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_condition;
	information = dia_bagrus_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Hej, jak se máš?";
};


func int dia_bagrus_hello_condition()
{
	if(MEETBAGRUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_info()
{
	AI_Output(other,self,"DIA_Bagrus_Hello_01_01");	//Hej, jak se máš?
	AI_Output(self,other,"DIA_Bagrus_Hello_01_02");	//Poslední dobou nic moc. Ty jsi asi ten chlápek, o kterým mluví celý tábor.
	AI_Output(self,other,"DIA_Bagrus_Hello_01_03");	//Prý hledáš draka.
	AI_Output(other,self,"DIA_Bagrus_Hello_01_04");	//Jenom černého dráčka jménem Azgalor. Víš o něm něco?
	AI_Output(self,other,"DIA_Bagrus_Hello_01_05");	//Absolutně nic. Kdyby tady nějací draci byli, rád bych je zabil sám.
	AI_Output(self,other,"DIA_Bagrus_Hello_01_06");	//Ale není tady nic kromě ohnivých ještěřů.
	AI_Output(other,self,"DIA_Bagrus_Hello_01_07");	//Jsi si jistý?
	MEETBAGRUS = TRUE;
};


instance DIA_BAGRUS_HELLO_TEACH(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_teach_condition;
	information = dia_bagrus_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Slyšel jsem, že si nejlepší lovec v táboře.";
};


func int dia_bagrus_hello_teach_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSTEACHER == TRUE) && (BARGUSREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_teach_info()
{
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_01");	//Slyšel jsem, že si nejlepší lovec v táboře.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_02");	//Nechci se vychvalovat, ale o lově vím dost.
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_03");	//A umíš taky vyjmout trofeje ze zvířat?
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_04");	//Ha, to je to nejdůležitější. Jenom zabít zvíře dokáže i úplný debil.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_05");	//Pokud ale nevíš co dál, je ti to na nic.
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_06");	//A mohl bys mě to naučit?
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_08");	//Určitě ti to mohu ukázat.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_10");	//Řekni, když budeš připravený.
	BARGUSREADYTEACH = TRUE;
};


instance DIA_BAGRUS_TEACHHUNTING(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_teachhunting_condition;
	information = dia_bagrus_teachhunting_info;
	permanent = TRUE;
	description = "Ukaž mi, jak vyjmout trofeje ze zvířat.";
};


func int dia_bagrus_teachhunting_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_bagrus_teachhunting_info()
{
	AI_Output(other,self,"DIA_Bagrus_TeachHunting_01_01");	//Ukaž mi, jak vyjmout trofeje ze zvířat.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_01_02");	//Co přesně chceš vědět?
		Info_AddChoice(dia_bagrus_teachhunting,Dialog_Back,dia_bagrus_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_bagrus_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_bagrus_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_bagrus_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání srdcí",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),dia_bagrus_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání ohnivých jazyků",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),dia_bagrus_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání rohů dračích chňapavců",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),dia_bagrus_teachhunting_drgsnapperhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání rohů stínových šelem",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),dia_bagrus_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Vyjímání dračích šupin",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),dia_bagrus_teachhunting_dragonscale);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Získávání dračí krve",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),dia_bagrus_teachhunting_dragonblood);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_01_03");	//Už umíš vše, co bych tě mohl naučit.
	};
};

func void dia_bagrus_teachhunting_back()
{
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Fur_01_00");	//Začni u nohou zvířete a zezadu, ne naopak.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Teeth_01_00");	//Když se pokoušíš vytrhnout zuby, dávej si zvláštní pozor, aby se nezlomily.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Claws_01_00");	//Je víc způsobů, jak vyjmout drápy. U některých zvířat potřebuješ sílu - u jiných je jenom vyřežeš nožem.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Heart_01_00");	//Srdce vyjmeš jenom hlubokým řezem do hrudníku. Ale stojí to za jenom u speciálních zvířat nebo magických bytostí.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_FireTongue_01_00");	//Na vyjmutí jazyka ohnivého ještěre potřebuješ ostrý nůž.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_drgsnapperhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DrgSnapperHorn_01_00");	//Nejlépe uděláš, když si na roh dračího chňapavce vezmeš pořádný nůž.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_shadowhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_ShadowHorn_01_00");	//Abys vytrhnul roh stínové šelmy, zapři se do její lebky vší sílou, tahej roh a vyřež ho naostřenou čepelí.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonscale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DragonScale_01_00");	//Je velice těžké vyjmout dračí šupiny. Není to ale tak těžké, pokud zapojíš rozum.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonblood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DragonBlood_01_00");	//Nejlépe bude, když krev odebereš z břicha. Najdi slabé místo a zapíchni do něj ostrý nůž.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

