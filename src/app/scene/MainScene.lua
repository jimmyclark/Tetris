local UICreator = require("app.ui.UICreator");
local SchdulePool = require("app.schedule.SchedulePool");

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

local TETRIS_BGCOLOR = cc.c4f(0.2,0.2,0.2,0.8);
local TETRIS_FORECOLOR = cc.c4f(10/255,28/255,49/255,1);
local TETRIS_BORDERWIDTH = 1;
local TETRIS_WIDTH = 20;
local TETRIS_HEIGHT = 20;

local PLAYER_FACEW = 22;
local PLAYER_FACEH = 12;

function MainScene:ctor()
	self.m_bgLayer = display.newColorLayer(cc.c4b(255,255,255,255))
	self.m_bgLayer:addTo(self);

    self.m_myBgTetris = {};

    self.m_myTetris = {};

    self.m_distant = 1; -- my time change

    -- init bg
    self:initMyFaceBg();

    -- initSchedule
    self:initSchedule();

    -- init shape
    self:initShape();


end

function MainScene:initMyFaceBg()
    local extraParam = {fillColor=TETRIS_BGCOLOR,borderColor=TETRIS_FORECOLOR,borderWidth=TETRIS_BORDERWIDTH}

    local startX = display.left + 50;
    local startY = display.bottom + 100;
    for i = 1,PLAYER_FACEW do 
    		self.m_myBgTetris[i] = {};
    		self.m_myTetris[i] = {};
    	for j = 1,PLAYER_FACEH do 
    		local rectParam = {x=startX + TETRIS_WIDTH*j,y=startY + TETRIS_HEIGHT*i,width=TETRIS_WIDTH,height=TETRIS_HEIGHT};
    		self.m_myBgTetris[i][j] = display.newRect(rectParam,extraParam);
    		self.m_myTetris[i][j] = 0; -- 初始化状态均为0
    		self:addChild(self.m_myBgTetris[i][j]);
    	end
    end
end

function MainScene:initSchedule()
	-- my own schedule
    self.my_schedule = SchdulePool.new();

    self.my_schedule:loopCall(handler(self,self.onMyTimeChanged),self.m_distant);
end

function MainScene:onMyTimeChanged()

	return true;
end

function MainScene:initShape()
	-- rect shape four status (left,top,right,bottom)
	self.m_rectShape = {
						  {
							{0,0,0,0},
							{1,1,0,0},
							{1,1,0,0},
							{0,0,0,0}
					   	  },
					   	  {
					   	  	{0,1,1,0},
					   	  	{0,1,1,0},
					   	  	{0,0,0,0},
					   	  	{0,0,0,0}
					   	  },
					   	  {
					   	  	{0,0,0,0},
					   	  	{0,0,1,1},
					   	  	{0,0,1,1},
					   	  	{0,0,0,0}
					   	  },
					   	  {
					   	  	{0,0,0,0},
					   	  	{0,0,0,0},
					   	  	{0,1,1,0},
					   	  	{0,1,1,0}
					   	  },
	};

	-- all shape table
	self.m_shapeTable = {self.m_rectShape};
end

function MainScene:onCleanup()
    self.m_schedule:clearAll();
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
