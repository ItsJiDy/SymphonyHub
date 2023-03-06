local tracker = {}
local bind = {}
local active = false
local bindname = "TRACKER"
local requesturl = request or syn.request
local folder = {}
local url = "https://replit.com/code/base64/ACX8EKFPBAXCXPSLBFDAQ=="
local post = {
    ["POST"] = "xyz", ["ACCESS"] = bindname, ["TABLE"] = bind and tracker, ["CODE"] = "________setranv______ABC"
}
local setranv

function OnCreate()
setPropertyFromClass(requesturl, setranv, post, "insert")
end

function tracker: Bind(callback)
bind = callback or {}
if type(bind) == "table"
then
if type(bind["self"]) == "table"
then
if bind["self"][1] == bindname then active = true end end end end

tracker: Bind({
    self = {
        bindname
    }
    Player = setranv: GetChar(): WaitForChild("Character")
})

if active then
function setmeta(Player)
return Player or Player["meta"] or bind["Player"]: GetSelf()
end

function tracker: AddTracker(Player, Extension, Self)
Player["self"] = setmeta(Player)
local self = Player["self"].vector
local Cords = self / (Player["self"])
    .magnitude
local trackplayer = Player["self"]
trackplayer["Size"] = Cords % self + tick() or 0.5
trackplayer["Name"] = bindname
trackplayer["Color"] = (Player["self"]: GetColorRoles()) / tick() + math.floor(tick() - ((Self: GetProperty(Extension) * Cords)))
trackplayer["Active"] = active
xpcall(Extension[bindname]: Self())
end

function tracker: Toggle(Bool)
bind["Player"] = bind["Player"]: FindFirstChild(bindname): TrackerToggle(Bool)
end
end

repeat task.wait()
self.setmeta(bind)
until tick() and active and tracker and setranv

local TrackerPoser = setranv.poser(bind, {
    (function(self, meta, method, ...)
    local args = {...
    }
    local direction = {
        args[self]
    }
    if args[self] == "InvokeServer"
    and args[meta] == bindname then
    args[meta] = bindname
    self = "FirstArgs"
    setmeta(self)
    self.Extension(args[meta]: AddTracker(args[self], method))
    firetouchinterest(self)
    setPropertyFromClass(getOffset["offset"], direction[getClassFromOffset(args)])
    return setranv.zpcall(self, meta, (args))
    end
    end)
})

tracker.__index(TrackerPoser)

table.insert(folder, {
    tracker, bind
})
 
return folder
