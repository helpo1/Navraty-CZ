
func void B_Announce_Herold()
{
	var int randy;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,hero);
	};

	AI_RemoveWeapon(self);

	if(Npc_HasItems(self,Fakescroll) == 0)
	{
		CreateInvItem(self,Fakescroll);
	};
	if(PLAYER_MOBSI_PRODUCTION != MOBSI_Talk)
	{
		AI_UseItemToState(self,Fakescroll,1);
		AI_Output(self,self,"DIA_Herold_Announce_04_00");	//Slyšte, občané Khorinisu! Podle přímého rozkazu ctihodného lorda Hagena vstupuje v platnost následující nařízení.

		if(Kapitel <= 2)
		{
			randy = Hlp_Random(5);

			if(randy == 0)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_01");	//Z bezpečnostních důvodů se vstup do lesů a divočiny kolem města důrazně nedoporučuje.
				AI_Output(self,self,"DIA_Herold_Announce_04_02");	//Navíc je přísně zakázán jakýkoli kontakt se vzbouřenými rolníky v přilehlých oblastech.
			}
			else if(randy == 1)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_03");	//Tímto okamžikem se lord Andre stává vrchním velitelem naší domobrany.
				AI_Output(self,self,"DIA_Herold_Announce_04_04");	//Všichni občané našeho města, kteří dokážou držet zbraň, jsou naléhavě žádáni, aby posílili řady královské domobrany.
			}
			else if(randy == 2)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_05");	//Bezpečnostní opatření zajišťující ochranu horní čtvrti budou ještě více zpřísněna.
				AI_Output(self,self,"DIA_Herold_Announce_04_06");	//Strážcům brány se nakazuje, aby se přísně drželi rozkazů a zabránili tak vstupu kohokoli nepovolaného.
			}
			else if(randy == 3)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_07");	//Ve všech městech a oblastech celé říše tímto okamžikem vstupuje v platnost stanné právo.
				AI_Output(self,self,"DIA_Herold_Announce_04_08");	//Všichni civilní soudci předají s okamžitou platností své úřady královským paladinům.
				AI_Output(self,self,"DIA_Herold_Announce_04_09");	//Ctihodný lord Andre je pověřen co nejpřísnějším potrestáním veškeré nezákonné činnosti či pokusů o odpor vůči královské gardě.
				AI_Output(self,self,"DIA_Herold_Announce_04_10");	//Každý obyvatel Khorinisu, který se proviní nezákonnou činností, se bude okamžitě zodpovídat lordu Andremu.
			}
			else
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_11");	//Z důvodu bezprostředního nebezpečí útoků skřetů jsou všichni občané žádáni, aby se na tuto hrozbu dostatečně připravili.
				AI_Output(self,self,"DIA_Herold_Announce_04_12");	//Všichni nechť neprodleně započnou s bojovým výcvikem a přiměřeně se ozbrojí.
			};
		}
		else if(Kapitel == 3)
		{
			if(MIS_RescueBennet != LOG_SUCCESS)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_13");	//Žoldácký kovář Bennet, který podle zavraždil paladina Lothara, byl ve jménu Innose uznán vinným.
				AI_Output(self,self,"DIA_Herold_Announce_04_14");	//Rozsudek zní smrt oběšením. Poprava se bude konat za několik málo dnů.
			}
			else
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_15");	//Kovář Bennet byl zproštěn obžaloby, protože rádce lorda Hagena prokázal jeho nevinu.
			};
		}
		else if(Kapitel == 4)
		{
			AI_Output(self,self,"DIA_Herold_Announce_04_16");	//Zvěsti, které vypovídají o přítomnosti draků v Hornickém údolí Khorinisu, se nezakládají na pravdě.
			AI_Output(self,self,"DIA_Herold_Announce_04_17");	//Tyto povídačky byly šířeny nepřítelem, aby mezi odvážným lidem Myrtany vyvolaly paniku.
			AI_Output(self,self,"DIA_Herold_Announce_04_18");	//Abychom tyto směšné zvěsti vyvrátili, byla do Hornického údolí vyslána jednotka statečných paladinů pro vedením jednoho z nich, jenž se v té oblasti dokonale vyzná.
		}
		else
		{
			randy = Hlp_Random(2);
	
			if(randy == 0)
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_19");	//Draci, kteří ohrožovali naši zem, byli poraženi statečnými muži pod vedením lorda Hagena.
				AI_Output(self,self,"DIA_Herold_Announce_04_20");	//Král Rhobar už brzy zbaví naši zemi skřetů a království znovu dosáhne dřívější slávy a rozkvětu.
			}
			else
			{
				AI_Output(self,self,"DIA_Herold_Announce_04_21");	//Lord Andre převezme s okamžitou platností nejvyšší velení nad městem Khorinis.
				AI_Output(self,self,"DIA_Herold_Announce_04_22");	//Lord Hagen prohlásil, že se osobně zúčastní výpravy do Hornického údolí, aby zajistil, že jeho loď odtamtud odpluje jen a pouze s plným podpalubím magické rudy.
			};
		};

		AI_UseItemToState(self,Fakescroll,-1);
	};
};

