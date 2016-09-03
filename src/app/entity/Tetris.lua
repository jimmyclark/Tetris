--[[
   方块类
]]
local Tetris = class("Tetris")
tetrisType = require("app.entity.TetrisType").new();

function Tetris:ctor()
	self.m_currentTetrisType = 0;   -- 当前的tetris类型
	self.m_currentTetris = {}; 		-- 当前的方块数组
	self.m_currentRows = 0; 		-- 当前所在的行数
	self.m_currentCols = 0; 		-- 当前所在的列数
	self.m_currentRotate = 0; 		-- 当前是否翻转，只能为1，2，3，4
end

function Tetris:getCurrentTetrisType()
	return self.m_currentTetrisType;
end

function Tetris:setCurrentTetrisType(type)
	if not type then 
		return;
	end

	type = type or 0;

	if type 
		and tonumber(type) > 0 
		and tonumber(type) <= tetrisType:getTotalType() then
		self.m_currentTetrisType = type;
		self.m_currentTetris = tetrisType[type];
	end
end

function Tetris:getCurrentTetris()
	return self.m_currentTetris;
end

function Tetris:getCurrentRowsCols()
	return self.m_currentRows,self.m_currentCols;
end

function Tetris:setCurrentRows(row)
	self.m_currentRows = row;
end

function Tetris:setCurrentCols(col)
	self.m_currentCols = col;
end

function Tetris:getCurrentRotate()
	return self.m_currentRotate;
end

function Tetris:setCurrentRotate(currentRotate)
	if currentRotate > 0 and currentRotate < 5 then 
		self.m_currentRotate = currentRotate;
	end
end

function Tetris:reset()
	self.m_currentTetrisType = 0;   
	self.m_currentTetris = {}; 		
	self.m_currentRows = 0; 		
	self.m_currentCols = 0; 		
	self.m_currentRotate = 0; 		
end

return Tetris
