--[[
   ���������
]]
local TetrisType = class("TetrisType")

-- I �;���
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
	rows = 4, 			-- ����
	cols = 4, 			-- ����
	effectType = 1, 	-- Ӱ�������(����˵���ҵ���һ����1�ģ�Ȼ��Ӱ�����;�����1��ʾӰ��Ϊ1�У��������Ӧ���л����У�����������1�л�1�е�)
};

-- J �;���
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

-- L �;���
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

-- S �;���
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

-- T �;���
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

-- Z �;���
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

-- O �;���
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
