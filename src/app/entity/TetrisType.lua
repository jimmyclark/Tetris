--[[
   方块的类型
]]
local TetrisType = class("TetrisType")

-- I 型矩阵
TetrisType.TYPE_I = 
{
	array={
		{
			{0,0,0,0},
			{1,1,1,1},
			{0,0,0,0},
			{0,0,0,0}
		},

		{
			{0,0,1,0},
			{0,0,1,0},
			{0,0,1,0},
			{0,0,1,0}
		},

		{
			{0,0,0,0},
			{0,0,0,0},
			{1,1,1,1},
			{0,0,0,0}
		},

		{
			{0,1,0,0},
			{0,1,0,0},
			{0,1,0,0},
			{0,1,0,0}
		}
	},
	rows = 4, 			-- 行数
	cols = 4, 			-- 列数
	effectType = 1, 	-- 影响的类型(比如说先找到第一行有1的，然后看影响的列;如果是1表示影响为1列，则遍历对应的行或者列，反正都是是1行或1列的)
};

-- J 型矩阵
TetrisType.TYPE_J = 
{
	array={
		{
			{1,0,0},
			{1,1,1},
			{0,0,0},
		},

		{
			{0,1,1},
			{0,1,0},
			{0,1,0},
		},

		{
			{0,0,0},
			{1,1,1},
			{0,0,1}
		},

		{
			{0,1,0},
			{0,1,0},
			{1,1,0},
		}
	},
	rows = 3,
	cols = 3,
	effectType = 2
};

-- L 型矩阵
TetrisType.TYPE_L = 
{
	array={
		{
			{0,0,1},
			{1,1,1},
			{0,0,0},
		},

		{
			{0,1,0},
			{0,1,0},
			{0,1,1},
		},

		{
			{0,0,0},
			{1,1,1},
			{1,0,0}
		},

		{
			{1,1,0},
			{0,1,0},
			{0,1,0},
		}
	},
	rows = 3,
	cols = 3,
	effectType = 2
};

-- S 型矩阵
TetrisType.TYPE_S = 
{
	array={
		{
			{0,1,1},
			{1,1,0},
			{0,0,0},
		},

		{
			{0,1,0},
			{0,1,1},
			{0,0,1},
		},

		{
			{0,0,0},
			{0,1,1},
			{1,1,0}
		},

		{
			{1,0,0},
			{1,1,0},
			{0,1,0},
		}
	},
	rows = 3,
	cols = 3,
	effectType = 2
};

-- T 型矩阵
TetrisType.TYPE_T = 
{
	array={
		{
			{0,1,0},
			{1,1,1},
			{0,0,0},
		},

		{
			{0,1,0},
			{0,1,1},
			{0,1,0},
		},

		{
			{0,0,0},
			{1,1,1},
			{0,1,0}
		},

		{
			{0,1,0},
			{1,1,0},
			{0,1,0},
		}
	},
	rows = 3,
	cols = 3,
	effectType = 2
};

-- Z 型矩阵
TetrisType.TYPE_Z = 
{
	array={
		{
			{1,1,0},
			{0,1,1},
			{0,0,0},
		},

		{
			{0,0,1},
			{0,1,1},
			{0,1,0},
		},

		{
			{0,0,0},
			{1,1,0},
			{0,1,1}
		},

		{
			{0,1,0},
			{1,1,0},
			{1,0,0},
		}
	},
	rows = 3,
	cols = 3,
	effectType = 2
};

-- O 型矩阵
TetrisType.TYPE_Z = 
{
	array={
		{
			{1,1},
			{1,1},
		},

		{
			{1,1},
			{1,1},
		},

		{
			{1,1},
			{1,1},
		},

		{
			{1,1},
			{1,1},
		}
	},
	rows = 2,
	cols = 2,
	effectType = 2
};

function TetrisType:ctor()
	self.m_totalType = {
						 TetrisType.TYPE_I,
						 TetrisType.TYPE_J,
						 TetrisType.TYPE_L,
						 TetrisType.TYPE_Z,
						 TetrisType.TYPE_O,
						 TetrisType.TYPE_S,
						 TetrisType.TYPE_T
					};
end

function TetrisType:getTotalType()
	return #self.m_totalType;
end

return TetrisType
