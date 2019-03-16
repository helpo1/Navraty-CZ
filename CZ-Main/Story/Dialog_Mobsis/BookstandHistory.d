
var int History_1_permanent;
var int History_2_permanent;
var int History_3_permanent;

func void Use_BookstandHistory1_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Jak bojovat");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Nejlepší obrana je útok - alespoň proti všem nelidským stvůrám. Odvracet útoky zvířat nebo oblud totiž vůbec nemá cenu.");
		Doc_PrintLines(nDocID,0,"Takového protivníka si je lepší několika dobře mířenými ranami držet od těla a pak ho v překvapit náhlým výpadem.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Samozřejmě že zkušení válečníci mohou tyto pohyby libovolně spojovat. Pokud jsi mistrem bojových umění, můžeš takových kombinací používat i více.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_1_permanent == FALSE)
		{
			B_RaiseFightTalent_Bonus(self,NPC_TALENT_1H,1);
			AI_Print(PRINT_Learn1H);
			History_1_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_93 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_93 = TRUE;
		};
	};
};

func void Use_BookstandHistory2_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Ostrov");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Přístavní město Khorinis leží na ostrově u pobřeží království Myrtana.");
		Doc_PrintLines(nDocID,0,"Tento ostrov je proslulý zejména tím, že se na něm nachází slavné Hornické údolí. Jeho pověst je pochybná, neboť je po mnoho let obklopovala neprostupná magická bariéra, a proto sloužilo jako věznice pro trestance z celé říše.");
		Doc_PrintLines(nDocID,0,"Ti zde dolovali magickou rudu, jejíž ložiska se ukrývala hluboko pod povrchem země.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Půda za hranicemi Khorinisu je velmi úrodná, proto tu najdete mnoho farmářských usedlostí, kde se pěstují zejména tuříny a chovají ovce.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Již po celé generace patří největší statek velkostatkáři, který pak okolní půdu pronajímá ostatním farmářům.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Uprostřed ostrova stojí starobylý Innosův klášter, který vedou mágové Ohně a kde provádějí své magické a alchymistické výzkumy a také lisují víno.");
		Doc_Show(nDocID);
		if(History_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_2_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_94 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_94 = TRUE;
		};
	};
};

func void Use_BookstandHistory3_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Zákony ostrova");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Všude, kde žije více lidí pohromadě, musí dodržovat určitá pravidla pokojného soužití - jak v klášteře, tak ve městě či na statku.");
		Doc_PrintLines(nDocID,0,"Všechny zločiny proti komunitě budou potrestány.");
		Doc_PrintLines(nDocID,0,"Je zakázáno provokovat souboje nebo se zapojovat do rvaček.");
		Doc_PrintLines(nDocID,0,"Každá krádež je také zločinem a pachatel ponese patřičné následky. I ovce jsou chráněny zákonem.");
		Doc_PrintLines(nDocID,0,"");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Pokud někdo zabije druhého, musí být za svůj čin souzen a odsouzen.");
		Doc_PrintLines(nDocID,1,"Chce-li se vyhnout vězení, musí zaplatit tučnou pokutu.");
		Doc_PrintLines(nDocID,1,"Na velkých místech dbají o pořádek muži zákona. Doslechnou se o každém zločinu i přestupku a jejich povinností je potrestat viníka a učinit tak spravedlnosti zadost.");
		Doc_PrintLines(nDocID,1,"Každý, kdo se stane obětí či svědkem zločinu, nebude mít samozřejmě o pachateli dobré mínění.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(History_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			History_3_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};
		}
		else
		{
			rnd = Hlp_Random(100);
			if(rnd <= 30)
			{
				B_Say(self,self,"$NOTHINGNEW");
			}
			else if(rnd <= 60)
			{
				B_Say(self,self,"$NOTHINGNEW02");
			}
			else if(rnd <= 99)
			{
				B_Say(self,self,"$NOTHINGNEW03");
			};
		};
		if((BookBonus_95 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
			BookBonus_95 = TRUE;
		};
	};
};