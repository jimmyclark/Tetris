-- Author: Jam
-- Date: 2015.04.07

require("config")
require("cocos.init")
require("framework.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    cc.Director:getInstance():setContentScaleFactor(720/CONFIG_SCREEN_HEIGHT)
    self:enterScene("app.scene.MainScene")
end

function MyApp:enterScene(sceneName, args, transitionType, time, more)
    --local scenePackageName = self.packageRoot .."." .. sceneName
    local scenePackageName = sceneName
    local sceneClass = require(scenePackageName)
    local scene = sceneClass.new(unpack(checktable(args)))
    display.replaceScene(scene, transitionType, time, more)
end

return MyApp
