YokiRaidCursor.Core.Utilities = {}


function YokiRaidCursor.Core.Utilities.MergeTables(t1, t2)
    for k, v in pairs(t2) do
        table.insert(t1, v)
    end

    return t1
end
