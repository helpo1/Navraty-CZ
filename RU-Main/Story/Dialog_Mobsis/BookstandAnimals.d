
var int Animals_1_permanent;
var int Animals_2_permanent;
var int Animals_3_permanent;

func void Use_BookstandAnimals1_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Охота и добыча");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Каждое животное и существо обладает трофеями, которые увеличивают славу и богатство опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Опытный охотник знает о трофеях своей добычи и знает различные способы, как их получить. ");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Вырывать зубы ");
		Doc_PrintLines(nDocID,0,"Зубы - оружие многих животных и существ. Кто знает об этом, тот при поимке волков, глорхов, мракорисов, болотожоров и троллей получит свой трофей.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Снимать шкуры");
		Doc_PrintLines(nDocID,1,"Каждый опытный охотник должен уметь снимать шкуру у многих животных. Овцы, волки, мракорисы и многие другие.");
		Doc_PrintLines(nDocID,1,"Охотник, который обладает этим талантом, также может снимать кожу с болотожоров и шныгов.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Ломать когти");
		Doc_PrintLines(nDocID,1,"Искусство ломать когти - это добыча с ящериц всех видов, глорхов, шныгов и мракорисов их когтей.  ");
		Doc_Show(nDocID);
		if(Animals_1_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_1_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
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
		if((BookBonus_90 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_90 = TRUE;
		};
	};
};

func void Use_BookstandAnimals2_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Охота и добыча");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Каждое животное и существо обладает трофеями, которые увеличивают славу и богатство опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Кровяной шершень");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Чтобы завладеть трофеями этого летающего дьявола, необходимо два особых умения. ");
		Doc_PrintLines(nDocID,0,"Первое - это умение отделить крылья, а второе - извлечь жало. ");
		Doc_PrintLines(nDocID,0,"Опытный охотник должен овладеть обоими умениями, чтобы получить оба трофея.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Оружие полевых жуков и ползунов - это их мандибулы. Прежде всего мандибулы ползунов");
		Doc_PrintLines(nDocID,1,"считаются особо стоящими, так как они содержат сок, который восстанавливает магическую энергию.");
		Doc_PrintLines(nDocID,1,"Но необходимо применять его с умом, так как со временем человеческое тело перестает реагировать на него.");
		Doc_PrintLines(nDocID,1,"Также важными являются панцири ползунов из которых можно делать хорошие доспехи. ");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_2_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_2_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
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
		if((BookBonus_91 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_91 = TRUE;
		};
	};
};

func void Use_BookstandAnimals3_S1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Brown_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Brown_R.tga",0);
		Doc_SetFont(nDocID,-1,Font_Book_New_Small);
		Doc_SetMargins(nDocID,0,275,20,30,20,1);
		Doc_PrintLine(nDocID,0,"Охота и добыча");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLines(nDocID,0,"Каждое животное и существо обладает трофеями, которые увеличивают славу и богатство опытного охотника.");
		Doc_PrintLine(nDocID,0,"");
		Doc_PrintLine(nDocID,0,"Огненная ящерица ");
		Doc_PrintLines(nDocID,0,"Эти редкие существа принадлежат к виду ящериц, которые могут извергать огонь. Каждый, кто подойдет к нему близко - будет сожжен. ");
		Doc_PrintLines(nDocID,0,"Только с защитой от огня можно выстоять в борьбе с этим существом и вырвать у него драгоценный язык.");
		Doc_SetMargins(nDocID,-1,30,20,275,20,1);
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"Мракорис");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLines(nDocID,1,"Мракорис - это древний одиночный вид, который живет исключительно в лесах. ");
		Doc_PrintLines(nDocID,1,"Днем мракорис по большей мере отдыхает, и поэтому не опасен. Но ночью он выходит на охоту и представляет огромную угрозу.");
		Doc_PrintLines(nDocID,1,"Голова мракориса увенчана рогом, который является ценным трофеем для охотника. Охотник должен овладеть умением - правильно отламывать рог,");
		Doc_PrintLines(nDocID,1,"чтобы заполучить этот трофей.");
		Doc_PrintLine(nDocID,1,"");
		Doc_PrintLine(nDocID,1,"");
		Doc_Show(nDocID);
		if(Animals_3_permanent == FALSE)
		{
			B_GivePlayerXP(XP_Bookstand);
			Animals_3_permanent = TRUE;
			B_Say(self,self,"$HOWINTEREST");
			RankPoints = RankPoints + 1;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Риторика + 1");
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
		if((BookBonus_92 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
			BookBonus_92 = TRUE;
		};
	};
};

