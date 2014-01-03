-- Create a autorelease LuaProxy.
-- �����Զ��ͷŵ�LuaProxy��
local proxy = LuaProxy:create()
-- Read a layer from ccbi file.
-- ��ccbi�ļ��ж�һ���㡣
local n = proxy:readCCBFromFile"ALayer.ccbi"
-- Pick up a node named "Label", cast to label, set the string.
-- ȡ����ΪLabel�Ľڵ㣬ת��ΪCCLabelTTF���趨�ַ������ݡ�
tolua.cast(proxy:getNode"Label", "CCLabelTTF"):setString"This is a label."
-- Create a scene and run.
-- ������������ʾ��
local s = CCScene:create()
s:addChild(tolua.cast(n, "CCLayer"))
CCDirector:sharedDirector():runWithScene(s)

-- Play another timeline (sequence).
-- ������һ��ʱ���߶�����
-- "n" is returned from LuaProxy:readCCBFromFile()
-- "n" ��ǰ����ļ���ȡ�Ľڵ㡣
local am = CCBAnimationManager:pickFromNode(n)
am:runAnimations"2nd Timeline"
-- Handle timeline complate event.
-- "proxy" must be retained.
-- ����ʱ��������¼���"proxy" ����ִ��retain������
-- Callback: CCBAnimationManager *am, string timelineName, LuaEventHandler *hnd
proxy:handleAnimationComplate(am, function(am, timelineName, hnd)
	-- do something after timeline complate
end)
