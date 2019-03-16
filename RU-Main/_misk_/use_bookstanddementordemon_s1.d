
func void use_bookstanddementordemon_s1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		nDocID = Doc_Create();
		Doc_SetPages(nDocID,2);
		Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
		Doc_Show(nDocID);
	};
	if(NECRODEMONAPPEAR == FALSE)
	{
		Wld_InsertNpc(necromacerdemonzombie,"FP_ROAM_DARKTOWER_06");
		NECRODEMONAPPEAR = TRUE;
	};
};

func void Use_BookstandDementor_S1()
{
	var C_Npc her;
	var int nDocID;
	var int randomtext;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			randomtext = Hlp_Random(5);

			if(randomtext == 0)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"Твои крыши строятся из мертвого дерева. Твои стены строятся из мертвого камня. Твои мечты строятся из мертвых мыслей.");
				Doc_PrintLines(nDocID,0,"Возвращаются крича, смеясь, распевая, назад к жизни, забирают то, что ты украл, и сдирают кожу с твоих мертвых костей, визжа.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Люди-глупцы слепы, они собирают сокровища и страдают от жадности по золотым камням и оковам.");
				Doc_PrintLines(nDocID,1,"Темный Бог освобождает их тьмой и болью и собирает их кости и души для своей трапезы.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_01 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_01 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
				if((BookBonus_119 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Интеллект + 1");
					BookBonus_119 = TRUE;
				};
			}
			else if(randomtext == 1)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"То был наш Господин, который покарал их. Он дал им могущество, чтобы осуществить его рай.");
				Doc_PrintLines(nDocID,0,"Но они отказались или у них не хватило мастерства. Почему это случилось навсегда останется неизвестным.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Но ясно, что они были наказаны за их ошибки. Их цивилизация была стёрта с лица земли для того чтобы появилась наша.");
				Doc_PrintLines(nDocID,1,"И сейчас она должна дать путь нашему господину - Богу Тьмы в его стремлении осуществить задуманное.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_02 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_02 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
				if((BookBonus_120 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Интеллект + 1");
					BookBonus_120 = TRUE;
				};
			}
			else if(randomtext == 2)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"Скоро всё будет освящено дыханием Господина. И все те, кто отвергал и предовал его - почувствуют это на себе.");
				Doc_PrintLines(nDocID,0,"Все получат благословение и очищение по делам своим. И не поможет им лжебог их - ибо слаб он пред могуществом Господина.");
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Демоны будут рвать их плоть на куски и реки станут багровыми от их крови. Солнце больше не встанет ни для одного из них.");
				Doc_PrintLines(nDocID,1,"Всех их поглотит священная Тьма багровой пеленой забвения!");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_03 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_03 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
				if((BookBonus_121 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Интеллект + 1");
					BookBonus_121 = TRUE;
				};
			}
			else if(randomtext == 3)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLines(nDocID,0,"Одним движением, хозяин окончит все человеческие страдания, и очистит путь для того, чтобы Господин снова ступил на землю.");
				Doc_PrintLines(nDocID,0,"Никто не укроется от его взора и возмездия. Мы будет строить в честь его имени новый мир - суть которого за пределами понимания этих жалких тварей.");
				Doc_PrintLines(nDocID,0,"И наступит время мрака и тьмы во веки веков!");
				Doc_PrintLine(nDocID,0,"");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLines(nDocID,1,"Да будет бласловенно имя Его - в наших молитвах ему найдем мы силы сокрушить врагов.");
				Doc_PrintLines(nDocID,1,"Обрушим мы всю свою ярость на головы преспешников глупца - дабы никто не усомнился в силе нашего Господина.");
				Doc_PrintLines(nDocID,1,"И живые будут завидовать мертвым!");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_04 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_04 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
				if((BookBonus_122 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Интеллект + 1");
					BookBonus_122 = TRUE;
				};
			}
			else if(randomtext == 4)
			{
				nDocID = Doc_Create();
				Doc_SetPages(nDocID,2);
				Doc_SetPage(nDocID,0,"Book_RED_L.tga",0);
				Doc_SetPage(nDocID,1,"Book_RED_R.tga",0);
				Doc_SetFont(nDocID,-1,Font_Book_New_Small);
				Doc_SetMargins(nDocID,0,275,20,30,20,1);
				Doc_PrintLine(nDocID,0,"");
				Doc_PrintLine(nDocID,0,"Я тот, чья обитель - тьма…");
				Doc_PrintLine(nDocID,0,"Смерть - мое дыхание…");
				Doc_PrintLine(nDocID,0,"Мои ноги твердо стоят на могилах,");
				Doc_PrintLine(nDocID,0,"И воскрешение мертвых - моя пища!");
				Doc_SetMargins(nDocID,-1,30,20,275,20,1);
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"Имя мое - страх людской.");
				Doc_PrintLine(nDocID,1,"Я - князь всего, что накрывает тень.");
				Doc_PrintLine(nDocID,1,"И во всем величии ночи,");
				Doc_PrintLine(nDocID,1,"Возвожу я темные стены времени.");
				Doc_PrintLine(nDocID,1,"");
				Doc_PrintLine(nDocID,1,"");
				Doc_Show(nDocID);

				if(READDMTBOOK_05 == FALSE)
				{
					B_GivePlayerXP(XP_Bookstand);
					READDMTBOOK_05 = TRUE;
					B_Say(self,self,"$HOWINTEREST");
					RankPoints = RankPoints + 1;
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
				if((BookBonus_123 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
				{
					ATR_INTELLECT += 1;
					Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
					AI_Print("Интеллект + 1");
					BookBonus_123 = TRUE;
				};
			};
		};
	};
};

func void use_bookstanddementor1_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Зарождение Мира");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Когда-то было лишь ничто, и это ничто было благословенно. Ибо имя тому ничто было Хаос - повелителя пустоты и мрака Мордрага.");
			Doc_PrintLines(nDocID,0,"И были рождены в той пустоте божественные стихии по имени - земля, вода, камень и огонь и в виде своем, отражали они сущность пустоты.");
			Doc_PrintLines(nDocID,0,"Но там, где правит Хаос - нет места божественной мудрости. И были стихии слепы в единственном своем желании поглотить все вокруг себя.");
			Doc_PrintLines(nDocID,0,"И так прошли века, а за ними тысячилетия - и не было конца этому противостоянию стихий между собой...");
			Doc_PrintLine(nDocID,0," ");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"И лишь осознав то, что там где правит Хоас их существование бесмысленно - стихии узрели единственный путь существования мира.");
			Doc_PrintLines(nDocID,1,"Придя на путь согласия между собой - стихии смогли изгнать Великий Хаос и заточить повелителя пустоты в том месте, где он был поражден.");
			Doc_PrintLines(nDocID,1,"В чертогах происхождения Силы....навсегда сокрыв его за священными вратами, наложив на них великую печать вечности.");
			Doc_PrintLines(nDocID,1,"И так зародился мир.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_01 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_01 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_124 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_124 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor2_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Стражи мира");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Части единого в разобщенности дали новую грань сущего, и мало кто знает истинную причину произошедшего.");
			Doc_PrintLines(nDocID,0,"Цель их проста и берет она свое начало в причине творения мира и его сущности в разных обличиях.");
			Doc_PrintLines(nDocID,0,"И было слово - и был то знак, что дал мудрость и могущество братьям, противостоять тому, кто пленен создателями в сердце мира.");
			Doc_PrintLines(nDocID,0,"Дабы исполнить волю творцов до скончания времен.");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"Каждый вдохнул жизнь в свое создание и наделил силой, дабы он мог помочь братьям своим в их общем деле.");
			Doc_PrintLines(nDocID,1,"Были они равны меж собой и никто не стоял выше. Но сущность их была отражением тайных желаний создателей.");
			Doc_PrintLines(nDocID,1,"Ибо в страсти обрести могущество - забыли они о том, для чего они созданы. И пал один из братьев от руки брата своего же.");
			Doc_PrintLines(nDocID,1,"И то было концом и началом - мудрости и безумия, что длиться и по сей день.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_02 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_02 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_125 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_125 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor3_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Путь Хранителя");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Нельзя найти то, чего нет и измерить то, что бесконечно. Ибо суть того пути, не в поиске - но в осуществлении цели.");
			Doc_PrintLines(nDocID,0,"Вступивший на эту тропу не являет ни добро, ни зло, ни мудрость судьи - поскольку смысл ее существования в обоих.");
			Doc_PrintLines(nDocID,0,"Мудрость эта в себе кроет цель, что не может следовать пути сохранения истинного равновесия - ибо суть ее хаос.");
			Doc_PrintLines(nDocID,0,"Узреть эту грань дано не всем. И лишь избранным дарована такая судьба, и в праве они принять ее или отвергнуть.");
			Doc_PrintLines(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLines(nDocID,1,"Смысл того пути нельзя понять или дать ему определение словом. Это постижение сущности, мира и судьбы.");
			Doc_PrintLines(nDocID,1,"По мере движения вперед, тот скрытый путь осветится божественной мудростью творцов и станет ясна цель его.");
			Doc_PrintLines(nDocID,1,"И сплетутся пути жизни в единое кольцо и повторит свой оборот судьба - ибо только сфера может быть идеальной в своем равновесии.");
			Doc_PrintLines(nDocID,1,"Дабы придать истинный вид тому, что воистину имеет ценность в мире сущего.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_03 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_03 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_126 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_126 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor4_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Анналы Хранителя");
			Doc_PrintLine(nDocID,0,"часть I");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Сущность баланса - беспристрастность. Принять чью-либо сторону, стать любящим или злобным - это значит потерять баланс.");
			Doc_PrintLines(nDocID,0,"После чего ни на одно действие нельзя положиться. Наша ноша не для зависимых от душевного состояния.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Надеяться на других - слабость для сильного, но сила для слабого.");
			Doc_PrintLines(nDocID,1,"Мудрость и баланс лежат в познании вашей собственной природы с течением времени, когда ты познаешь себя.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_04 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_04 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_127 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_127 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor5_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Анналы Хранителя");
			Doc_PrintLine(nDocID,0,"часть II");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Есть те, для кого знание - щит, и те, для кого оно - оружие. Ни один из взглядов не сбалансирован, но один менее неразумен.");
			Doc_PrintLines(nDocID,0,"Тот, кто в познании ограничивается лишь тем, что уже знают другие такой же болван, как и тот, кто не утруждает себя учебой.");
			Doc_PrintLines(nDocID,0,"Сокровище познания самое ценное в мире и охраняются они как правило соответственно.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Камень не может знать, зачем долото раскалывает его; сталь не может знать, зачем огонь обжигает ее.");
			Doc_PrintLines(nDocID,1,"Когда смерть и отчаяние хватаются за тебя, не бей свою грудь и не проклинай свою злую судьбу.");
			Doc_PrintLines(nDocID,1,"Но возблагодари творцов за испытания, которые закаляют тебя.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_05 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_05 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_128 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_128 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor6_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Анналы Хранителя");
			Doc_PrintLine(nDocID,0,"часть III");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Древние разложения проявляются вновь. Это могло бы нарушить равновесие, но мы знали, что нужно оставаться бдительными, на случай если это произойдет.");
			Doc_PrintLines(nDocID,0,"Никому уже нельзя было доверить вмешательство. И некоторые усомнились в правоте Творцов.");
			Doc_PrintLines(nDocID,0,"Но печати выдержали и немногие добились триумфа, а сомневавшихся положили в фундамент нового Храма.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Используя честь нашу, как щит над землей и небом, мы не должны терять мудрость.");
			Doc_PrintLines(nDocID,1,"Пусть они будут в безопасности и под замком, но всегда в распоряжении правоверных. Будущие поколения заложники нашей отзывчивости.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_06 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_06 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_129 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_129 = TRUE;
			};
		};
	};
};

func void use_bookstanddementor7_s1()
{
	var C_Npc her;
	var int nDocID;
	var int rnd;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		if(KNOWDEMENTORLANGUAGE == FALSE)
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_Dementor_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_Dementor_R.tga",0);
			Doc_Show(nDocID);
			B_Say(self,self,"$CANTREADTHIS");
		}
		else
		{
			nDocID = Doc_Create();
			Doc_SetPages(nDocID,2);
			Doc_SetPage(nDocID,0,"Book_WOOD_L.tga",0);
			Doc_SetPage(nDocID,1,"Book_WOOD_R.tga",0);
			Doc_SetFont(nDocID,-1,Font_Book_New);
			Doc_SetMargins(nDocID,0,275,20,30,20,1);
			Doc_PrintLine(nDocID,0,"Анналы Хранителя");
			Doc_PrintLine(nDocID,0,"часть IV");
			Doc_SetFont(nDocID,-1,Font_Book_New_Small);
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLines(nDocID,0,"Хотя наши познания мира велики, некоторые явления оказались гораздо сложнее, чем мы предполагали.");
			Doc_PrintLines(nDocID,0,"Самый неожиданный союз также оказался самым эффективным.");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_PrintLine(nDocID,0,"");
			Doc_SetMargins(nDocID,-1,30,20,275,20,1);
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLines(nDocID,1,"Смотря на реликты, оставленные создателями, Мы понимали - каких высот может достичь цивилизация.");
			Doc_PrintLines(nDocID,1,"Смотря же на древние руины мы понимаем насколько опасно может быть это величие.");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_PrintLine(nDocID,1,"");
			Doc_Show(nDocID);

			if(READDEMENTORBOOK_07 == FALSE)
			{
				B_GivePlayerXP(XP_Bookstand);
				READDEMENTORBOOK_07 = TRUE;
				B_Say(self,self,"$HOWINTEREST");
				RankPoints = RankPoints + 1;
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
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
			if((BookBonus_130 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Интеллект + 1");
				BookBonus_130 = TRUE;
			};
		};
	};
};