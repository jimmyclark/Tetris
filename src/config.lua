
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = false

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "landscape"

-- design resolution
CONFIG_SCREEN_WIDTH  = 1280
CONFIG_SCREEN_HEIGHT = 720

-- auto scale mode
local glView = cc.Director:getInstance():getOpenGLView()
local size = glView:getFrameSize()
local w = size.width
local h = size.height

if w/h >= CONFIG_SCREEN_WIDTH/CONFIG_SCREEN_HEIGHT then
    CONFIG_SCREEN_AUTOSCALE = "FIXED_HEIGHT"
else
    CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"
end

GAME_VERSION = "0.0.1"

