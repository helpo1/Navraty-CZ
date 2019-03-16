//######################################################
//
//  Skycontroller
//      Контроллер неба для outdoor-уровней наиболее
//      спецефичен среди всех SkyController'ов.
//
// Обновление: Неверно! Еще более специфичен
// oCSkyControler_Barrier. Я описываю его здесь,
// но не переименовываю, а добавляю свойства барьера
// в конце.
//######################################################


class zCSkyController_Outdoor /* точнее oCSkyControler_Barrier */ {
    //zCObject {
    var int    _vtbl;
    var int    _zCObject_refCtr;
    var int    _zCObject_hashIndex;
    var int    _zCObject_hashNext;
    var string _zCObject_objectName;
    //}
    
    /*
    enum zTWeather
    {
        zTWEATHER_SNOW,
        zTWEATHER_RAIN
    };*/
    
    //Здесь приводится таблица цветов по времени суток для настройки освещения.
    var int polyLightCLUTPtr;   //zCOLOR*  "colour look up table", см. ниже
    
    var int cloudShadowScale;   //zREAL    
    var int m_bColorChanged;    //zBOOL    
    var int m_enuWeather;       //zTWeather

    var int backgroundColor;    //zCOLOR                           
    var int fillBackground;     //zBOOL                         
    var int backgroundTexture;  //zCTexture*                    
    var int relightCtr;         //zTFrameCtr ~ int              
    var int lastRelightTime;    //zREAL                         
    var int m_fRelightTime;     //zREAL                         

    var int underwaterFX;       //zBOOL                      
    var int underwaterColor;    //zCOLOR                        
    var int underwaterFarZ;     //zREAL                      
    var int underwaterStartTime;//zREAL                      
    var int oldFovX;            //zREAL                      
    var int oldFovY;            //zREAL                      
    var int vobUnderwaterPFX;   //zCVob*                        

    //Полигон экрана? Для затемнения? Но для этого есть камера...	//NS: возможно, для эффектов, когда смотрим "против солнца"?
    var int scrPoly;            //zCPolygon*                   
    var int scrPolyMesh;        //zCMesh*                        
    var int scrPolyAlpha;       //int                               
    var int scrPolyColor;       //zCOLOR                          
    var int scrPolyAlphaFunc;   //zTRnd_AlphaBlendFunc
    
    //далее: специфика Outdoor'а!
    var int initDone;           //zBOOL
    var int masterTime;         //zREAL //Небо в Outdoor связано со временем
    var int masterTimeLast;     //zREAL
    
    //enum zESkyLayerMode { zSKY_MODE_POLY, zSKY_MODE_BOX };
    
    //zCSkyState masterState;
        var int masterState_time;                    //zREAL               
        var int masterState_polyColor[3];            //zVEC3               
        var int masterState_fogColor[3];             //zVEC3               
        var int masterState_domeColor1[3];           //zVEC3               
        var int masterState_domeColor0[3];           //zVEC3               
        var int masterState_fogDist;                 //zREAL               
        var int masterState_sunOn;                   //zBOOL               
        var int masterState_cloudShadowOn;           //int                  
        
        //zCSkyLayerData masterState_layer[zSKY_NUM_LAYER]  //zSKY_NUM_LAYER == 2
            //Layer 0
            var int masterState_layer0_skyMode;      //zESkyLayerMode   
            var int masterState_layer0_tex;          //zCTexture*          
            var string masterState_layer0_texName;   //zSTRING               
            var int masterState_layer0_texAlpha;     //zREAL                   
            var int masterState_layer0_texScale;     //zREAL                   
            var int masterState_layer0_texSpeed[2];  //zVEC2                   
            //Layer 1
            var int masterState_layer1_skyMode;      //zESkyLayerMode   
            var int masterState_layer1_tex;          //zCTexture*          
            var string masterState_layer1_texName;   //zSTRING               
            var int masterState_layer1_texAlpha;     //zREAL                   
            var int masterState_layer1_texScale;     //zREAL                   
            var int masterState_layer1_texSpeed[2];  //zVEC2
    
    var int state0;      //zCSkyState*
    var int state1;      //zCSkyState*
    
    //zCArray<zCSkyState*>      stateList;
        var int stateList_array;         //zCSkyState**
        var int stateList_numAlloc;      //int
        var int stateList_numInArray;    //int
    
    var int polyLightCLUT[256];     //zCOLOR //Таблица цветов для освещения. Зависит от времени суток.
    /*  Зацикленная функция назначает интенсивность от 0 до 255 каждому цвету. Влияет только на статическое освещение.
		polyLightCLUT обновляется контроллером неба регулярно, из различных предустановок для разного времени суток (красный вечером, голубой утром...).
		Другими словами, в любой точке имеем линейную интерполяцию между черным и текущим светом солнца.
	*/
	
    var int dayCounter;             //zREAL  //совершенно бесполезен
    
    //zCArray<zVEC3> fogColorDayVariations;
        var int fogColorDayVariations_array;         //zVEC3*
        var int fogColorDayVariations_numAlloc;      //int
        var int fogColorDayVariations_numInArray;    //int
    
    //zCArray<zVEC3> fogColorDayVariations2;
        var int fogColorDayVariations2_array;        //zVEC3*
        var int fogColorDayVariations2_numAlloc;     //int
        var int fogColorDayVariations2_numInArray;   //int
    
    var int m_fSkyScale;             //zREAL
    var int m_bSkyScaleChanged;      //zBOOL
    var int m_overrideColor[3];      //zVEC3
    var int m_bOverrideColorFlag;    //zBOOL
    var int m_bDontRain;             //zBOOL
    var int m_bLevelChanged;         //zBOOL
    var int m_bDarkSky;              //zBOOL //Oldworld

    //туман (fog)
    var int resultFogScale;          //zREAL             
    var int heightFogMinY;           //zREAL             
    var int heightFogMaxY;           //zREAL             
    var int userFogFar;              //zREAL             
    var int resultFogNear;           //zREAL             
    var int resultFogFar;            //zREAL             
    var int resultFogSkyNear;        //zREAL             
    var int resultFogSkyFar;         //zREAL             
    var int resultFogColor;          //zCOLOR           
    var int resultFogColorOverride;  //zCOLOR           
    var int userFarZScalability;     //zREAL             

    var int skyLayerState[2];        //zCSkyState*  

    //zCSkyLayer skyLayer[2];    
        //0
        var int skyLayer0_skyPolyMesh;             //zCMesh*             
        var int skyLayer0_skyPoly;                 //zCPolygon*    
        var int skyLayer0_skyTexOffs[2];           //zVEC2             
        var int skyLayer0_skyDomeMesh;             //zCMesh*             
        var int skyLayer0_skyMode;                 //zESkyLayerMode
        //1
        var int skyLayer1_skyPolyMesh;             //zCMesh*             
        var int skyLayer1_skyPoly;                 //zCPolygon*    
        var int skyLayer1_skyTexOffs[2];           //zVEC2             
        var int skyLayer1_skyDomeMesh;             //zCMesh*             
        var int skyLayer1_skyMode;                 //zESkyLayerMode
    
    //zCSkyLayer skyLayerRainClouds;
        var int skyLayerRainClouds_skyPolyMesh;             //zCMesh*            
        var int skyLayerRainClouds_skyPoly;                 //zCPolygon*       
        var int skyLayerRainClouds_skyTexOffs[2];           //zVEC2            
        var int skyLayerRainClouds_skyDomeMesh;             //zCMesh*            
        var int skyLayerRainClouds_skyMode;                 //zESkyLayerMode

    var int skyCloudLayerTex;        //zCTexture*    

    // светила (planets)
    //enum { NUM_PLANETS = 2 }; //Солнце:0, Луна:1
    //zCSkyPlanet                   planets[NUM_PLANETS];
        //Солнце:
        var int Sun_mesh;        //zCMesh*
        var int Sun_color0[4];   //zVEC4     
        var int Sun_color1[4];   //zVEC4     
        var int Sun_size;        //zREAL     
        var int Sun_pos[3];      //zVEC3     
        var int Sun_rotAxis[3];  //zVEC3     
        //Луна:
        var int Moon_mesh;        //zCMesh*
        var int Moon_color0[4];   //zVEC4    
        var int Moon_color1[4];   //zVEC4    
        var int Moon_size;        //zREAL    
        var int Moon_pos[3];      //zVEC3    
        var int Moon_rotAxis[3];  //zVEC3    
    
    var int m_bSunVisible;        //zBOOL
    var int m_fFadeScale;         //zREAL
                                
    // pfx для неба              
    var int vobSkyPFX;            //zCVob*  
    var int skyPFXTimer;          //zREAL    

    // ветер
    var int m_bIsMainControler;   //zBOOL //а существуют другие, кроме основного контроллера?
    
    var int m_bWindVec[3];        //zVEC3

    /*
    enum zTCamLocationHint {
        zCAM_OUTSIDE_SECTOR,
        zCAM_INSIDE_SECTOR_CANT_SEE_OUTSIDE,
        zCAM_INSIDE_SECTOR_CAN_SEE_OUTSIDE,
    };*/
    //
    
    //struct zTRainFX {
        var int rainFX_outdoorRainFX;                   //zCOutdoorRainFX*   
        var int rainFX_camLocationHint;                 //zTCamLocationHint 
        var int rainFX_outdoorRainFXWeight;             //zREAL                      // 0..1
        var int rainFX_soundVolume;                     //zREAL                      // 0..1
        var int rainFX_timerInsideSectorCantSeeOutside; //zREAL                      // мс
        var int rainFX_timeStartRain;                   //zREAL                      
        var int rainFX_timeStopRain;                    //zREAL                      
        var int rainFX_renderLightning;                 //zBOOL                      
        var int rainFX_m_bRaining;                      //zBOOL                      
        var int rainFX_m_iRainCtr;                      //int Сколько раз до этого шел дождь.
    //} rainFX;
    
    var int barrier; 	//oCBarrier *
	var int bFadeInOut; //zBOOL
};

/* В Gothic 2 отвечает за отображение молний при грозе
 * доступ можно получить через MEM_SkyController.barrier */
 
class oCBarrier {
	var int skySphereMesh;             //zCMesh*    
	
	var int myPolyList;	               //myPoly*    
	var int myVertList;                //myVert*    
	
	var int numMyVerts;                //int        
	var int numMyPolys;                //int        
	
    var int myThunderList;             //myThunder* 
    var int numMaxThunders;            //int        
    var int numMyThunders;             //int        
    
    var int actualIndex;               //int        
    var int rootBoltIndex;             //int        
    
    var int startPointList1[10];       //int        
	var int numStartPoints1;           //int        
	var int startPointList2[10];       //int        
	var int numStartPoints2;           //int        
	var int startPointList3[10];       //int        
	var int numStartPoints3;           //int        
	var int startPointList4[10];       //int        
	var int numStartPoints4;           //int        
	
	var int topestPoint;               //int        
	
	var int bFadeInOut;                //zBOOL      
	var int fadeState;                 //int		
	
	var int fadeIn;                    //zBOOL      
	var int fadeOut;                   //zBOOL      
	var int bFlashing;                 //zBOOL	     
	var int fFlashTime;                //float	     

	
	var int sfx1;                      //zCSoundFX*
	var int sfxHandle1;                //zTSoundHandle 
	var int sfx2;                      //zCSoundFX*
	var int sfxHandle2;                //zTSoundHandle 
	var int sfx3;                      //zCSoundFX*
	var int sfxHandle3;                //zTSoundHandle 
	var int sfx4;                      //zCSoundFX*
	var int sfxHandle4;                //zTSoundHandle 
	
	var int thunderStartDecal;         //zCDecal*
	
	var int activeThunder_Sector1;     //zBOOL 		      
	var int activeThunder_Sector2;     //zBOOL 		      
	var int activeThunder_Sector3;     //zBOOL 		      
	var int activeThunder_Sector4;     //zBOOL 		   
	
	var int originalTexUVList;         //zVEC2*      
};