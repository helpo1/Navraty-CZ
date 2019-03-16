
func void G_CanNotUse(var int bIsPlayer,var int nAttribute,var int nValue)
{
	var string strMessage;
	var string strAttributeMissing;
	var int nAttributeValue;
	var int nDifference;
	var string strDifference;

		if((nAttribute == ATR_MANA_MAX) && (nValue == 666666))
		{
			strMessage = PRINT_ADDON_BELIARSCOURSE_MISSING;
			B_BlitzInArsch();
			SC_FailedToEquipBeliarsWeapon = TRUE;
		}
		else if((nAttribute == ATR_MANA_MAX) && (nValue == 6666))
		{
			strMessage = PRINT_ADDON_BELIARSCOURSE_MISSING;
		}
		else
		{
			if(nAttribute == ATR_HITPOINTS)
			{
				strAttributeMissing = PRINT_HITPOINTS_MISS;
				nAttributeValue = self.attribute[ATR_HITPOINTS];
			}
			else if(nAttribute == ATR_HITPOINTS_MAX)
			{
				strAttributeMissing = PRINT_HITPOINTS_MAX_MISS;
				nAttributeValue = self.attribute[ATR_HITPOINTS_MAX];
			}
			else if(nAttribute == ATR_MANA)
			{
				strAttributeMissing = PRINT_MANA_MISS;
				nAttributeValue = self.attribute[ATR_MANA];
			}
			else if(nAttribute == ATR_MANA_MAX)
			{
				strAttributeMissing = PRINT_MANA_MAX_MISS;
				nAttributeValue = self.attribute[ATR_MANA_MAX];
			}
			else if(nAttribute == ATR_STRENGTH)
			{
				strAttributeMissing = PRINT_STRENGTH_MISS;
				nAttributeValue = self.attribute[ATR_STRENGTH];
			}
			else if(nAttribute == ATR_DEXTERITY)
			{
				strAttributeMissing = PRINT_DEXTERITY_MISS;
				nAttributeValue = self.attribute[ATR_DEXTERITY];
			}
			else
			{
				strAttributeMissing = "";
				nAttributeValue = 0;
			};

			nDifference = nValue - nAttributeValue;
			strDifference = IntToString(nDifference);
			strMessage = PRINT_MISSING;
			strMessage = ConcatStrings(strMessage,strDifference);
			strMessage = ConcatStrings(strMessage,strAttributeMissing);
		};
		if(bIsPlayer)
		{
			if(nAttribute == ATR_REGENERATEMANA)
			{
				strMessage = PRINT_MISSING_SKILL;
				AI_Print(strMessage);
				B_Say(self,self,"$IMPOSSIBLEFORME");
			}
			else if(nAttribute == ATR_REGENERATEHP)
			{
				strMessage = PRINT_MISSING_SKILL;
				AI_Print(strMessage);
				B_Say(self,self,"$IMPOSSIBLEFORME");
			}
			else if(nAttribute == SKL_CROSSBOW)
			{
				strMessage = PRINT_MISSING_SKILL;
				AI_Print(strMessage);
				B_Say(self,self,"$IMPOSSIBLEFORME");
			}
			else if(nAttribute == SKL_STAMINA)
			{
				strMessage = PRINT_MISSING_SKILL_STAM;
				AI_Print(strMessage);
				B_Say(self,self,"$IMPOSSIBLEFORME");
			}
			else
			{
				AI_Print(strMessage);
				B_Say(self,self,"$IMPOSSIBLEFORME");
			};
		};
};