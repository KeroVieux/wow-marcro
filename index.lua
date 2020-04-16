--
-- Created by IntelliJ IDEA.
-- User: kerovieux
-- Date: 25/2/2020
-- Time: 15:23
-- To change this template use File | Settings | File Templates.
--

DEFAULT_CHAT_FRAME:AddMessage('测试信息')


per = UnitPower("player") / 532
c = string.format("%d", per)
s1 = "我的蓝量只剩** " .. c .. "**个治疗波，要么我想办法！要么你们想办法！!"
s2 = "我已经没奶了，容我缓缓"
if (per < 4 and per > 1) then
    SendChatMessage(s1, "yell", nil, 1)
elseif (per <  1) then
    SendChatMessage(s2, "yell", nil, 1)
end

num = UnitPower("player") / UnitPowerMax("player") * 100
c = string.format("%d", num)
s1 = "我只剩下** " .. c .. "%** 蓝，需要喝水，菜刀们请稍等"
s2 = "虽然我还有** " .. c .. "%** 蓝，但是我还是选择喝水，你们稍等"
if (num < 20) then
    SendChatMessage(s1, "yell", nil, 1)
else
    SendChatMessage(s2, "yell", nil, 1)
end


local s, d, _,
t = GetSpellCooldown("自然迅捷")
if (s == 0) then
    SendChatMessage("我已经对 >>%t<< 丢了[自然迅捷]，剩下的看造化了。", "yell")
else
    SendChatMessage("情况危亡，但是我的[自然迅捷]还有" .. ceil(s + d - GetTime()) .. "秒冷却，还有没有其他治疗！？", "yell")
end

c = UnitClass("target")
l = UnitLevel("target")
n = UnitName("target")
r = UnitRace("target")
if GetRaidTargetIndex("target") == null then
    SetRaidTarget("target", 8)
    SendChatMessage("大家集火这只 **骷髅** ，请MT重点照顾 >> " .. l .. "级" .. c .. " " .. n .. " <<", "yell")
end

