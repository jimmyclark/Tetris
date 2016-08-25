local UICreator = require("app.ui.UICreator");
local SchdulePool = require("app.schedule.SchedulePool");

local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

local TETRIS_BGCOLOR = cc.c4f(0.2,0.2,0.2,0.8);
local TETRIS_MYCOLOR = cc.c4f(0.5,0,0,1);

local TETRIS_FORECOLOR = cc.c4f(10/255,28/255,49/255,1);
local TETRIS_BORDERWIDTH = 1;
local TETRIS_WIDTH = 20;
local TETRIS_HEIGHT = 20;

local PLAYER_FACEW = 22;
local PLAYER_FACEH = 12;

local startX = display.left + 50 ;
local startY = display.bottom + 100;

function MainScene:ctor()
	self.m_bgLayer = display.newColorLayer(cc.c4b(255,255,255,255))
	self.m_bgLayer:addTo(self);

    self.m_myBgTetris = {};

    self.m_myTetris = {}; -- my block 

    self.m_distant = 1; -- my time change

    self.m_startPosition = {};

    -- init bg
    self:initMyFaceBg();

    -- initSchedule
    self:initSchedule();

    -- init shape
    self:initShape();

    -- start Game
    self:startGame();

end

------------------------------------------------------------ Init ---------------------------------------------------------------------------------
function MainScene:initMyFaceBg()
    local extraParam = {fillColor=TETRIS_BGCOLOR,borderColor=TETRIS_FORECOLOR,borderWidth=TETRIS_BORDERWIDTH}
	
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

---------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------- Start Game ---------------------------------------------------------------------------------- 
function MainScene:calculateShape()
	local randomType = math.floor(math.random(1,#self.m_shapeTable));
	self.m_currentShape = self.m_rectShape[randomType]; 
end

function MainScene:startGame()
	self.my_schedule:loopCall(handler(self,self.onMyTimeChanged),self.m_distant);
end

function MainScene:onMyTimeChanged()
	-- if have not current shape ,calculate
	if not self.m_currentShape then 
		self:calculateShape();
	end

	if not self.m_currentPosW and not self.m_currentPosH then 
		self.m_currentPosW = (PLAYER_FACEH - 2 )/2; -- 
		self.m_currentPosH = PLAYER_FACEW; -- 22
	else
		self.m_currentPosH = self.m_currentPosH - 1;
	end

	-- deal with some case
	self:judgeSomethingException();

	self:concatMyShape();

	self:clearLastShape();

	self:drawMyShape();

	return true;
end

function MainScene:judgeSomethingException()
	
end

function MainScene:concatMyShape()
	local currentShow = PLAYER_FACEW - self.m_currentPosH + 1;

	local showTableNum = currentShow <= 4 and currentShow or 4;
	for i = 1,showTableNum do 
		for j = 1,4 do 
			self.m_myTetris[self.m_currentPosH + i - 1 ][self.m_currentPosW + j] = self.m_currentShape[i][j];
		end 
	end
end

function MainScene:toStringRect()
	for i = 1, #self.m_myTetris do 
		local msg = "";
		for j = 1, #self.m_myTetris[i] do
			msg = msg .. self.m_myTetris[i][j] .. "   ";
		end
		print(msg);
	end
end

function MainScene:clearLastShape()
	if self.m_lastGone then 
		for i = 1,#self.m_lastGone do
			local x = self.m_lastGone[i].x;
			local y = self.m_lastGone[i].y;
			self.m_myBgTetris[x][y]:clear();

			local extraParam = {fillColor=TETRIS_BGCOLOR,borderColor=TETRIS_FORECOLOR,borderWidth=TETRIS_BORDERWIDTH}
			local rectParam = {x=startX + TETRIS_WIDTH*y,y=startY + TETRIS_HEIGHT*x,width=TETRIS_WIDTH,height=TETRIS_HEIGHT};

			self.m_myBgTetris[x][y] = display.newRect(rectParam,extraParam)
			self:addChild(self.m_myBgTetris[x][y])
		end
	end
end

function MainScene:drawMyShape()
	-- record last Gone
	self.m_lastGone = {};

	for i = 1,#self.m_myTetris do 
		for j =1,#self.m_myTetris[i] do
			
			if self.m_myTetris[i][j] == 1 then 
				self.m_myBgTetris[i][j]:clear();

				local extraParam = {fillColor=TETRIS_MYCOLOR,borderColor=TETRIS_FORECOLOR,borderWidth=TETRIS_BORDERWIDTH}
				local rectParam = {x=startX + TETRIS_WIDTH*j,y=startY + TETRIS_HEIGHT*i,width=TETRIS_WIDTH,height=TETRIS_HEIGHT};

				self.m_myBgTetris[i][j] = display.newRect(rectParam,extraParam)


				self.m_lastGone[#self.m_lastGone+1] = {x=i,y=j};

				self:addChild(self.m_myBgTetris[i][j])
			end
		end
	end
end

function MainScene:onCleanup()
    self.m_schedule:clearAll();
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
