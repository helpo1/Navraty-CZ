func int B_GetLearnCostAttribute(var C_Npc oth,var int attribut)
{
	var int kosten;

	kosten = 0;

	if(attribut == ATR_STRENGTH)
	{
		if(oth.aivar[REAL_STRENGTH] >= 400)
		{
			if((oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_DEXTERITY]) && (oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 300)
		{
			if((oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_DEXTERITY]) && (oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 200)
		{
			if((oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_DEXTERITY]) && (oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 100)
		{
			if((oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_DEXTERITY]) && (oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_STRENGTH] >= 50)
		{
			if((oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_DEXTERITY]) && (oth.aivar[REAL_STRENGTH] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_DEXTERITY)
	{
		if(oth.aivar[REAL_DEXTERITY] >= 400)
		{
			if((oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 300)
		{
			if((oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 200)
		{
			if((oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 100)
		{
			if((oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 50)
		{
			if((oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_DEXTERITY] >= oth.aivar[REAL_MANA_MAX]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_MANA_MAX)
	{
		if(oth.aivar[REAL_MANA_MAX] >= 600)
		{
			if((oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 6;
			}
			else
			{
				kosten = 10;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 400)
		{
			if((oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 5;
			}
			else
			{
				kosten = 8;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 200)
		{
			if((oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 4;
			}
			else
			{
				kosten = 6;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 100)
		{
			if((oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 3;
			}
			else
			{
				kosten = 4;
			};
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 50)
		{
			if((oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_STRENGTH]) && (oth.aivar[REAL_MANA_MAX] >= oth.aivar[REAL_DEXTERITY]))
			{
				kosten = 2;
			}
			else
			{
				kosten = 3;
			};
		}
		else
		{
			kosten = 1;
		};
	};
	if(attribut == ATR_HITPOINTS_MAX)
	{
		if(oth.attribute[ATR_HITPOINTS_MAX] >= 4000)
		{
			kosten = 5;
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 3000)
		{
			kosten = 4;
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 2000)
		{
			kosten = 3;
		}
		else if(oth.attribute[ATR_HITPOINTS_MAX] >= 1000)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};

	return kosten;
};