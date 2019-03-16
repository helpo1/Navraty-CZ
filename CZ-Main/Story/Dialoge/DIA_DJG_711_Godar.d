
instance DIA_Godar_EXIT(C_Info)
{
	npc = DJG_711_Godar;
	nr = 999;
	condition = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Godar_Hello(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Godar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//He? Co?
};


instance DIA_Godar_ComeFrom(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_Godar_ComeFrom_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Přišli jsme z... eh, z města.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Jste banditi!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom,"Proč jsme se předtím ve městě nikdy neviděli?",DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom,"Takže tak. Z města.",DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Jste banditi!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Opatrně! Bereš si příliš velké sousto!
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Klídek. Nechci vás prásknout.",DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom,"Mě nevyděsíš.",DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Klídek. Nechci vás prásknout.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//V to doufám. Ve tvém vlastním zájmu. Jinak jsi mrtvý!
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Mě nevyděsíš.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//Uvidíme.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Nikdy jsem tě ve městě neviděl.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Nemůžu vystát lidi, co strkaj nos do věcí, do kterejch jim nic není, jasný?
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Houby.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom,"Já vím, přišel jsi z města.",DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//Já vím, přišel jsi z města.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Přesně tak.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Houby.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Tak to bych to měl do tebe nahustit...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Jasně. Tak teda z města.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//Hele! On rozumí!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Tady, lokni si!
	CreateInvItems(self,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_UseItem(other,ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};


instance DIA_Godar_Plan(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Godar_Plan_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//Zaslechli jsme o lovu draků. Tak jsme si sbalili saky paky a přišli sem.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Ale abych byl upřímný, o dracích nevím ani prd. Chci jen získat trochu zlata.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Draci mají zlato, nebo ne?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Samozřejmě.
};


instance DIA_Godar_DragonLore(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent = FALSE;
	description = "Co víš o těch dracích?";
};


func int DIA_Godar_DragonLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Co víš o těch dracích?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Slyšel jsem jen pohádky pro děti.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Znáš to, panny, zlato, ohnivý dech a takový věci.
};


instance DIA_Godar_Destination(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent = FALSE;
	description = "Kam se chystáte vyrazit?";
};


func int DIA_Godar_Destination_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Plan) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Kam se chystáte vyrazit?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//To netuším. Ještě jsme se nerozhodli.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Měli byste zajít na hrad.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Tam mě nikdo nedostane ani párem stínových šelem. Ne k paladinům.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Nemám v úmyslu vrátit se do vězení. Už jsem tam jednou byl a docela mi to stačí.
	};
};


instance DIA_Godar_Orks(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent = FALSE;
	description = "A co skřeti?";
};


func int DIA_Godar_Orks_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Destination) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//A co skřeti?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Obléhají celý hrad. Nenechali jedinou skulinu.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Pokoušet se tam proplížit je naprostý nesmysl. Ani nemysli na to, že by ses tam prosekal, jinak jsi mrtvý muž.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nikomu se ještě nepodařilo tamtudy projít.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Á, jasně.
};


instance DIA_Godar_Prison(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent = FALSE;
	description = "Za co jsi seděl?";
};


func int DIA_Godar_Prison_Condition()
{
	if((KAPITELORCATC == FALSE) && Npc_KnowsInfo(other,DIA_Godar_Destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//Za co jsi seděl?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Vypadám snad, že bych se ti to chystal vyklopit, co?
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Vy mágové jste s paladiny ve spojení. Ne ne, příteli. Zapomeň na to.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Ty svině mě zabásli za pytlačení. Kvůli dvěma zavšivenejm zajícům!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Napařili mi za to 10 let.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//A to bylo všechno?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//No... Taky jsem se samozřejmě bránil...
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//A?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Nemohl jsem nic dělat, ten chlápek zakopnul a zlomil si vaz. Vážně!
		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison,"To zní povědomě.",DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison,"A ty ses nechal chytit?",DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//To zní povědomě.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Víš, co si myslím? Ti bohatí bastardi nemají ani tucha, jak tu s náma zacházeli.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//Vůbec je to nezajímalo.
	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//A ty ses nechal chytit?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(vztekle) Vsadím se, žes nikdy nebyl zavřenej, co?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Tak to bych ti měl ukázat, co se může tvýmu tělu ve vězení stát.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Godar_Hunting(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco o lovu?";
};


func int DIA_Godar_Hunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Godar_Prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_SEK) && (hero.guild != GIL_TPL) && (hero.guild != GIL_GUR)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Můžeš mě naučit něco o lovu?
	if(GodarLikesYou == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//To nemyslíš vážně, co? Zmizni!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Ze zvířat se dá získat mnohem víc než jen maso. Kožešiny a drápy můžeš pak někde prodat. Dá se na tom docela vydělat.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Už se nemůžu dočkat, až si to rozdám s drakem!
		Godar_TeachAnimalTrophy = TRUE;
	};
};


instance DIA_Godar_Dragonstuff(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak vykuchat draka.";
};


var int Godar_TeachDragonStuff;

func int DIA_Godar_Dragonstuff_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_SEK) && (hero.guild != GIL_TPL) && (hero.guild != GIL_GUR)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)) && (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Ukaž mi, jak vykuchat draka.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//Chceš všechny prachy pro sebe, co?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//No dobrá, ale bude tě to stát 1000 zlatých!
	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff,"Za tolik mi to nestojí.",DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff,"To je fér.",DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//To je fér.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Ne bez prachů. Nejdřív mi dej ty peníze.
	};
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Za tolik mi to nestojí.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Jak je libo.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};


instance DIA_Godar_Teach(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak lovit.";
};


func int DIA_Godar_Teach_Condition()
{
	if((Godar_TeachAnimalTrophy == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_KDM) && (hero.guild != GIL_SEK) && (hero.guild != GIL_TPL) && (hero.guild != GIL_GUR)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Ukaž mi, jak lovit.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		Info_AddChoice(DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforthief("Plížení",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Godar_Teach_Thief_Sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Godar_Teach_TROPHYS_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Vyjímání žihadel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSting)),DIA_Godar_Teach_TROPHYS_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Vyjímání křídel",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWing)),DIA_Godar_Teach_TROPHYS_BFWing);
		};
		if(Godar_TeachDragonStuff == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Vyjímání dračích šupin",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Godar_Teach_TROPHYS_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Získávání dračí krve",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Nejlepší způsob, jak získat zuby, je za pomoci pořádného nože.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Nejrychlejší způsob, jak získat žihadlo krvavé mouchy, je vymáčknout ho dozadu před tím, než ho vyřízneš.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Křídla krvavých much jsou velmi křehká. Takže až je budeš odřezávat, musíš být opravdu opatrný.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Když se chceš plížit, nazuj si měkké boty. Tuhá podrážka může nadělat spoustu hluku.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Abys mohl z draka dostat jeho šupiny, budeš potřebovat spoustu síly. Ale dá se to zvládnout.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Najdi si na dračím břichu měkké místečko. Tam rozřízni a vyextrahuj krev.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};


instance DIA_Godar_AllDragonsDead(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_AllDragonsDead_Condition;
	information = DIA_Godar_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Zabil jsem všechny draky.";
};


func int DIA_Godar_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Zabil jsem všechny draky.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//Dobrá, a co. Tady v údolí nám toho zůstalo ještě spousta.
};


instance DIA_Godar_PICKPOCKET(C_Info)
{
	npc = DJG_711_Godar;
	nr = 900;
	condition = DIA_Godar_PICKPOCKET_Condition;
	information = DIA_Godar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Godar_PICKPOCKET_Condition()
{
	return C_Beklauen(16,160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET,Dialog_Back,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};


instance DIA_GODAR_FUCKOFF(C_Info)
{
	npc = DJG_711_Godar;
	nr = 2;
	condition = dia_godar_fuckoff_condition;
	information = dia_godar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_godar_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_godar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

