--[[
    时间池
]]
local scheduler = require(cc.PACKAGE_NAME .. ".scheduler")

local SchedulerPool = class("SchedulerPool")

function SchedulerPool:ctor()
    self.m_pool = {};
    self.m_id = 0;
end

-- 清空schdule池
function SchedulerPool:clearAll()
    for k,v in pairs(self.m_pool) do 
        scheduler.unscheduleGlobal(v);
    end
    self.m_pool = {};
end

-- 清除某个schedule
function SchedulerPool:clear(id)
    if self.m_pool[id] then
        scheduler.unscheduleGlobal(self.m_pool[id]);
        self.m_pool[id] = nil;
    end
end

function SchedulerPool:delayCall(callback, delay, ...)
    self.m_id = self.m_id + 1;
    local id = self.m_id;
    local args = {...};
    local handle = scheduler.performWithDelayGlobal(function() 
        self.m_pool[id] = nil;
        if callback then
            callback(self, unpack(args));
        end
    end, delay);
    self.m_pool[id] = handle;
    return id;
end

-- 核心方法
function SchedulerPool:loopCall(callback, interval, ...)
    self.m_id = self.m_id + 1;
    local id = self.m_id;
    local args = {...};
    local handle = scheduler.scheduleGlobal(function()
        if callback then
            if not callback(self, id, unpack(args)) then
                scheduler.unscheduleGlobal(self.m_pool[id]);
                self.m_pool[id] = nil;
            end
        end
    end, interval);
    self.m_pool[id] = handle;
    return id;
end

return SchedulerPool;