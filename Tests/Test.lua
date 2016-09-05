YokiRaidCursor.Testing = {}

local Test = YokiRaidCursor.Class('Test')
local Mockagne = LibStub('mockagne'):Get()

local SUCCESSSTART = '|cff00ff00'
local FAILSTART = '|cffff0000'
local END = '|r'

function Test.RunAll()
    local tests = YokiRaidCursor.Testing.tests

    if (tests == nil 
        or type(tests) ~= 'table') then
        print('Tests failed to initialize.')
        return
    end

    print('Running tests.')

    for k, test in pairs(tests) do
        if (type(test[2]) == 'function') then
            test[2](test[1])
        end
    end
end

function Test:Register(test)
    if (YokiRaidCursor.Testing.tests == nil) then
        YokiRaidCursor.Testing.tests = {}
    end

    table.insert(YokiRaidCursor.Testing.tests, {self, test})
end

function Test:AssertEquals(a, b)
    if (a == b) then
        return true
    else
        msg = "Failed to assert '" .. tostring(a) .. "' equals '" .. tostring(b) .. "'."
        Test:_PrintFail(msg)
    end
end

function Test:AssertNotEquals(a, b)
    if (a ~= b) then
        return true
    else
        msg = "Failed to assert '" .. tostring(a) .. "' not equals '" .. tostring(b) .. "'."
        Test:_PrintFail(msg)
    end
end

function Test:AssertNil(a)
    if (a == nil) then
        return true
    else
        msg = "Failed to assert '" .. tostring(a) .. "' is nil."
        Test:_PrintFail(msg)
    end
end

function Test:AssertNotNil(a)
    if (a ~= nil) then
        return true
    else
        msg = "Failed to assert '" .. tostring(a) .. "' is not nil."
        Test:_PrintFail(msg)
    end
end

function Test:AssertInstanceOf(className, object)
    if ('instance of class '..className == tostring(object)) then
        return true
    else
        msg = 'Failed to assert object is instance of ' .. className .. '.'
        Test:_PrintFail(msg)
    end
end

function Test:GetMock()
    return Mockagne.getMock()
end

function Test:When(functionCall)
    return Mockagne.when(functionCall)
end

function Test:Any(item)
    return Mockagne.any(item)
end

function Test:Verify(mockInvoke)
    Mockagne.verify(mockInvoke)
end

function Test:VerifyNoCall(mockInvoke)
    Mockagne.verify_no_call(mockInvoke)
end

function Test:CreateMockFrame(x, y, w, h)
    local mock = self:GetMock()

    self:When(mock:GetRect()).thenAnswer(x/2, y/2, x, y)

    return mock
end

function Test:_PrintFail(message)
    local m = FAILSTART
    m = m .. message .. '\n'
    m = m .. debugstack(3, 1, 0)
    print(m)
end


YokiRaidCursor.Testing.Test = Test
