if not (MODULES.kb_layout and MODULES.kb_layout.enable) then
  return
end

local keyboard = SBAR.add('item', 'kb_layout', {
  position = 'right',
  icon = { drawing = false },
  label = {
    font = { style = FONT.style_map['Bold'], size = 12 },
    color = COLORS.text,
    string = '??',
  },
})

local function update_keyboard()
  SBAR.exec([[defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID]], function(result)
    local layout = result:match('%.keylayout%.([%w_]+)') or result:gsub("\n","")
    local short = '??'
    if layout:find('Russian') then short = 'RU'
    elseif layout:find('ABC') or layout:find('U.S.') then short = 'EN'
    else short = layout:sub(1,2):upper()
    end
    keyboard:set({ label = { string = short } })
  end)
end

SBAR.add('event', 'keyboard_change', 'AppleSelectedInputSourcesChangedNotification')

keyboard:subscribe({ 'routine', 'system_woke', 'keyboard_change' }, update_keyboard)

-- Первый апдейт
update_keyboard()
