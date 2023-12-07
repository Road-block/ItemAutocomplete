select(2, ...) 'ItemDatabase'

-- Imports
local util = require 'Utility.Functions'
local utf8 = require 'Shared.UTF8'

-- Consts
local const = util.ReadOnly({
  itemIds = util.IsWrath() and {
    { 1, 54798}, -- Defaults
    { 122270 }, -- WoW Token (AH)
    { 122284 }, -- WoW Token
    { 172070 }, -- Customer Service Package
    { 180089 }, -- Panda Collar
    { 192455, 198647, 198665 }, -- Elite Expedition Supplies
    { 198628, 198629, 198630, 198631, 198632, 198633, 198635, 198636, 198640, 198641, 198642, 198643, 198644 },
  } or util.IsBcc() and { -- See: https://tbc.wowhead.com/items?filter=151;1;187815
    { 1, 39656 }, -- Defaults
    { 43516 }, -- Brutal Nether Drake
    { 122270 }, -- WoW Token (AH)
    { 122284 }, -- WoW Token
    { 172070 }, -- Customer Service Package
    { 180089 }, -- Panda Collar
    { 184865, 187815 },
  } or util.IsSom and { -- See: https://classic.wowhead.com/items?filter=151;2;24284
    { 1, 24283 }, -- Defaults
    { 122270 }, -- WoW Token (AH)
    { 122284 }, -- WoW Token
    { 172070 }, -- Customer Service Package
    { 180089 }, -- Panda Collar
    { 184937, 184938 }, -- Chronoboon Displacers
    { 189419, 189421 }, -- Fire Resist Gear
    { 189426, 189427 }, -- Raid Consumables
  } or util.IsSod and {
    { 1, 24283 }, -- Defaults
    { 122270 }, -- WoW Token (AH)
    { 122284 }, -- WoW Token
    { 172070 }, -- Customer Service Package
    { 180089 }, -- Panda Collar
    { 184937, 184938 }, -- Chronoboon Displacers
    { 189419, 189420, 189421, 189426, 189427 }, -- Fire Resist Gear, Raid Consumables
    { 190179, 190180, 190181, 190186, 190187, 190232, 190307, 190308, 190309 },
    { 191204, 191249, 191267, 191268, 191272, 191280, 191288, 191292, 191312, 191313 },
    { 191414, 191458, 191459, 191477, 191480, 191481, 191550 },
    { 191605, 191606, 191607, 191608, 191609, 191610, 191611, 191612, 191613, 191614, 191656, 191660, 191661, 191664, 191666 },
    { 202251, 202254, 202256, 202316, 202641 },
    { 203723, 203726, 203745, 203746, 203747, 203748, 203749, 203750, 203751, 203752, 203753, 203754, 203755, 203756 },
    { 203784, 203785, 203786, 203787, 203960, 203961, 203962, 203990, 203991, 203992, 203993, 203994 },
    { 204174, 204270, 204441, 204476, 204477, 204478, 204688, 204689, 204690, 204703, 204716, 204795, 204804, 204806 },
    { 204807, 204809, 204864, 204905, 204906, 204907, 204910, 204912 },
    { 205019, 205020, 205022, 205181, 205182, 205183, 205184, 205215, 205218, 205228, 205230, 205364, 205420, 205683 },
    { 205685, 205863, 205864, 205897, 205905, 205932, 205940, 205942, 205943, 205944, 205945, 205946, 205947, 205948 },
    { 205949, 205950, 205951, 205952, 205953, 205961, 205979, 205995 },
    { 206032, 206155, 206157, 206159, 206168, 206169, 206170, 206175, 206176, 206177, 206264, 206344, 206345, 206376 },
    { 206381, 206382, 206383, 206384, 206385, 206386, 206387, 206388, 206389, 206390, 206391, 206466, 206469, 206954 },
    { 206963, 206966, 206970, 206975, 206985, 206989, 206992, 206994, 206995 },
    { 207062, 207098, 207106, 207107, 207108, 207109, 207110, 207590, 207631, 207731, 207732, 207733, 207972, 207973, 207974, 207975 },
    { 208005, 208007, 208034, 208035, 208036, 208037, 208038, 208085, 208086, 208139, 208140, 208158, 208159, 208160 },
    { 208180, 208183, 208185, 208192, 208205, 208213, 208215, 208218, 208219, 208220, 208223, 208224, 208414, 208601 },
    { 208602, 208603, 208604, 208605, 208607, 208608, 208609, 208610, 208611, 208612, 208682, 208687, 208689, 208701 },
    { 208739, 208741, 208743, 208744, 208749, 208750, 208753, 208754, 208758, 208760, 208764, 208765, 208766, 208767 },
    { 208768, 208771, 208772, 208773, 208777, 208778, 208799, 208800, 208823, 208828, 208833, 208838, 208843, 208847 },
    { 208848, 208849, 208851, 208853, 208854, 208855, 208860 },
    { 209027, 209028, 209029, 209030, 209031, 209041, 209042, 209043, 209045, 209047, 209056, 209057, 209058, 209059 },
    { 209418, 209420, 209421, 209422, 209423, 209424, 209432, 209436, 209523, 209524, 209525, 209526, 209527, 209534 },
    { 209559, 209560, 209561, 209562, 209563, 209564, 209565, 209566, 209567, 209568, 209569, 209570, 209571, 209572 },
    { 209573, 209574, 209575, 209576, 209577, 209578, 209579, 209580, 209581, 209590, 209608, 209611, 209612, 209613 },
    { 209614, 209615, 209616, 209617, 209618, 209619, 209620, 209621, 209622, 209623, 209624, 209625, 209626, 209667 },
    { 209668, 209669, 209670, 209671, 209672, 209673, 209674, 209675, 209676, 209677, 209678, 209679, 209680, 209681 },
    { 209682, 209683, 209684, 209685, 209686, 209687, 209688, 209689, 209690, 209691, 209692, 209693, 209694, 209748 },
    { 209778, 209779, 209800, 209816, 209817, 209818, 209819, 209820, 209821, 209822, 209823, 209824, 209825, 209828 },
    { 209830, 209836, 209838, 209840, 209841, 209843, 209844, 209845, 209846, 209847, 209848, 209849, 209850, 209851 },
    { 209852, 209872, 209873, 209874 },
    { 210015, 210026, 210043, 210044, 210045, 210053, 210055, 210056, 210080, 210137, 210138, 210146, 210147, 210177 },
    { 210178, 210179, 210183, 210186, 210187, 210188, 210195, 210209, 210210, 210212, 210213, 210229, 210250, 210251 },
    { 210252, 210253, 210322, 210323, 210329, 210330, 210410, 210499, 210500, 210534, 210568, 210569, 210573, 210589 },
    { 210596, 210653, 210654, 210655, 210665, 210667, 210668, 210696, 210708, 210709, 210712, 210713, 210724, 210741 },
    { 210746, 210763, 210765, 210771, 210772, 210773, 210779, 210781, 210794, 210795, 210811, 210817, 210818, 210820 },
    { 210822, 210823, 210824, 210825, 210953, 210955, 210963, 210966, 210967, 210968, 210979, 210980 },
    { 11205, 211247, 211263, 211315, 211316, 211317, 211318, 211319, 211320, 211321, 211322, 211323, 211324, 211325 },
    { 11326, 211327, 211328, 211329, 211330, 211331, 211332, 211365, 211367, 211368, 211382, 211384, 211385, 211386 },
    { 11387, 211390, 211391, 211392, 211393, 211419, 211420, 211421, 211422, 211423, 211443, 211444, 211445, 211447 },
    { 11448, 211449, 211450, 211451, 211452, 211454, 211455, 211456, 211457, 211458, 211460, 211461, 211462, 211463 },
    { 11464, 211465, 211466, 211467, 211468, 211471, 211472, 211476, 211477, 211482, 211487, 211488, 211490, 211491 },
    { 11492, 211498, 211499, 211500, 211501, 211502, 211504, 211505, 211506, 211507, 211508, 211509, 211510, 211511 },
    { 11512, 211514, 211528, 211530, 211531, 211534, 211691, 211777, 211779, 211780, 211784, 211785, 211786, 211787 },
    { 11789, 211799, 211800, 211809, 211813, 211814, 211815, 211816, 211818, 211819, 211820, 211821, 211822, 211823 },
    { 11824, 211825, 211826, 211827, 211828, 211829, 211830, 211831, 211832, 211833, 211834, 211835, 211836, 211837 },
    { 11838, 211839, 211840, 211841, 211842, 211843, 211845, 211846, 211848, 211849, 211852, 211853, 211854, 211855 },
    { 11856, 211857, 211933, 211934, 211935, 211940, 211941, 211944, 211953, 211954, 211955, 211956, 211957 },
    { 212160, 212580, 212581, 212582, 212583, 212584, 212585, 212586, 212587, 212588, 212589, 212590, 213087, 213088 }
  },
  itemsQueriedPerUpdate = 50,
})

------------------------------------------
-- Class definition
------------------------------------------

local ItemDatabase = {}
ItemDatabase.__index = ItemDatabase

------------------------------------------
-- Constructor
------------------------------------------

-- Creates a new item database
function ItemDatabase.New(persistence, eventSource, taskScheduler)
  local self = setmetatable({}, ItemDatabase)

  self.methods = util.ContextBinder(self)
  self.eventSource = eventSource
  self.eventSource:AddListener('GET_ITEM_INFO_RECEIVED', self.methods._OnItemInfoReceived)
  self.itemsById = persistence:GetRealmItem('itemDatabase')
  self.databaseInfo = persistence:GetRealmItem('itemDatabaseInfo')
  self.taskScheduler = taskScheduler

  return self
end

------------------------------------------
-- Public methods
------------------------------------------

function ItemDatabase:AddItemById(itemId)
  local itemName, itemLink = GetItemInfo(itemId)

  -- The item info may not yet exist, in that case it's received asynchronously
  -- from the server via the GET_ITEM_INFO_RECEIVED event.
  if itemName ~= nil and not self:_IsDevItem(itemId, itemName) then
    -- Precalculate each code point to improve query performance
    local itemNameCodePoints = {}
    for _, codePoint in utf8.CodePoints(itemName) do
      itemNameCodePoints[#itemNameCodePoints + 1] = codePoint
    end

    self.itemsById[itemId] = { id = itemId, name = itemNameCodePoints, link = itemLink }
    return true
  else
    return false
  end
end

function ItemDatabase:GetItemById(itemId)
  return self.itemsById[itemId]
end

function ItemDatabase:UpdateItemsAsync(onFinish)
  if self:IsUpdating() then
    return
  end

  -- Reset the current database
  wipe(self.itemsById)
  self.databaseInfo.version = 0
  self.updateItemsTaskId = self.taskScheduler:Enqueue({
    onFinish = onFinish,
    task = function()
      return self:_TaskUpdateItems(const.itemsQueriedPerUpdate)
    end,
  })
end

function ItemDatabase:IsObsolete()
  local latestVersion = tonumber(util.GetAddonMetadata('X-ItemDatabaseVersion'))
  return (self.databaseInfo.version or 0) < latestVersion
end

function ItemDatabase:IsEmpty()
  return next(self.itemsById) == nil
end

function ItemDatabase:IsUpdating()
  return self.taskScheduler:IsScheduled(self.updateItemsTaskId)
end

function ItemDatabase:ItemIterator()
  return pairs(self:IsUpdating() and {} or self.itemsById)
end

------------------------------------------
-- Private methods
------------------------------------------

function ItemDatabase:_IsDevItem(itemId, itemName)
  local whitelistedIds = { 19971, 31716 }

  for _, whitelistedId in ipairs(whitelistedIds) do
    if itemId == whitelistedId then
      return false
    end
  end

  local devPatterns = {
    -- LuaFormatter off
    'Monster %-',
    'DEPRECATED',
    'Dep[rt][ie]cated',
    'DEP',
    'DEBUG',
    '%(old%d?%)',
    'OLD',
    '[ %(]test[%) ]',
    '^test ',
    'Testing ?%d?$',
    'Test[%u) ]',
    'Test$',
    'Test_',
    'TEST',
    '^test$',
    'UNUSED',
    '^Unused ',
    'PH',
    -- LuaFormatter on
  }

  for _, pattern in ipairs(devPatterns) do
    if itemName:match(pattern) then
      return true
    end
  end

  return false
end

function ItemDatabase:_OnItemInfoReceived(itemId, success)
  if success then
    self:AddItemById(itemId)
  end
end

function ItemDatabase:_TaskUpdateItems(itemsPerYield)
  local itemsProcessed = 0

  for _, range in ipairs(const.itemIds) do
    local lowId, highId = range[1], range[2] or range[1]

    for itemId = lowId, highId do
      if C_Item.DoesItemExistByID(itemId) then
        self:AddItemById(itemId)
      end

      itemsProcessed = itemsProcessed + 1

      if itemsProcessed % itemsPerYield == 0 then
        coroutine.yield()
      end
    end
  end

  self.databaseInfo.version = tonumber(util.GetAddonMetadata('X-ItemDatabaseVersion'))
  return 1
end

------------------------------------------
-- Exports
------------------------------------------

export.New = function(...)
  return ItemDatabase.New(...)
end
