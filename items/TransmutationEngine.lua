local key_press_ref = Controller.key_press
function Controller:key_press(key)
  key_press_ref(self, key)
  if self.pressed_keys["o"] and not G.SETTINGS.paused and not G.TMJUI and not (is_debugplus_console_open and is_debugplus_console_open()) then
    G.FUNCS.run_opus_magnum_trans_menu()
  end
end

G.FUNCS.run_opus_magnum_trans_menu = function()
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu {
    definition = create_opus_magnum_trans_menu()
  }
end

G.FUNCS.can_run_opus_magnum_trans_menu = function()

end

G.opusm_tileOvW = 1
G.opusm_tileOvH = 1 * (G.opusm_tilePY / G.opusm_tilePX)
G.opusm_tilePixelSize = G.opusm_tileOvW / G.opusm_tilePX

G.opusm_trans_board = {
  { true, true, true, true, true, true, true, true, true, true, true, true },
  { true, true, true, true, true, false, true, true, true, true, false, true, true },
  { true, true, true, true, true, true, true, true, true, true, true, true, true, true },
  { true, true, true, true, true, false, true, false, false, true, false, true, true },
  { true, true, true, true, true, false, false, true, false, false, true, true },
  { true, true, true, true, true, true, true, true, true, true, true },
}

function create_opus_magnum_trans_menu()
  local largest_row = -1
  for _, v in ipairs(G.opusm_trans_board) do
    if #v > largest_row then largest_row = #v end
  end

  local rows = {}
  rows[#rows + 1] = {
    n = G.UIT.R,
    config = { w = 1, h = G.opusm_tileOvH, colour = G.C.RED },
    nodes = {}
  }

  local ix = 0
  for _, i in ipairs(G.opusm_trans_board) do
    ix = ix + 1
    local cols = {
      n = G.UIT.R,
      config = { align = "cm", padding = -3 * G.opusm_tilePixelSize },
      nodes = {}
    }
    cols.nodes[#cols.nodes + 1] = { n = G.UIT.B, config = { h = 0.1, w = G.opusm_tileOvW } }
    if #i < largest_row then cols.nodes[#cols.nodes + 1] = { n = G.UIT.B, config = { h = 0.1, w = (((G.opusm_tilePX * (largest_row - #i)) + 6 - ((largest_row - #i) * 3)) / 2) * G.opusm_tilePixelSize } } end
    for j = 1, #i do
      local added_things = {}

      if G.opusm_trans_board[ix][j] then
        local tile = SMODS.create_sprite(0, 0, G.opusm_tileOvW, G.opusm_tileOvH, "opusm_TileElements", { x = 0, y = 0 })
        tile.states.drag.can = false

        local element_card = Card(0, 0, G.opusm_tileOvW, G.opusm_tileOvH, G.P_CARDS.empty, G.P_CENTERS.omelem_opusm_fire)
        element_card.no_shadow = true
        element_card.states.drag.can = true

        added_things[#added_things + 1] = {
          n = G.UIT.R,
          config = { padding = G.opusm_tileOvW },
          nodes = {
            {
              n = G.UIT.C,
              config = { padding = -G.opusm_tileOvW },
              nodes = {
                { n = G.UIT.O, config = { object = tile } },
                { n = G.UIT.O, config = { object = element_card } },
              }
            }
          }
        }
      else
        added_things[#added_things + 1] = {
          n = G.UIT.R,
          config = { padding = G.opusm_tileOvW },
          nodes = {
            {
              n = G.UIT.C,
              config = { padding = -G.opusm_tileOvW },
              nodes = {
                { n = G.UIT.B, config = { w = G.opusm_tileOvW, h = G.opusm_tileOvH } },
                { n = G.UIT.B, config = { w = G.opusm_tileOvW, h = G.opusm_tileOvH } }
              }
            }
          }
        }
      end

      if ix < #i then
        added_things[#added_things + 1] = {
          n = G.UIT.R,
          config = { padding = G.opusm_tileOvW / (3 / 2) },
          nodes = {}
        }
      end

      cols.nodes[#cols.nodes + 1] = {
        n = G.UIT.C,
        config = { padding = -G.opusm_tileOvW / 2 },
        nodes = added_things
      }
    end
    if #i < largest_row then cols.nodes[#cols.nodes + 1] = { n = G.UIT.B, config = { h = 0.1, w = (((G.opusm_tilePX * (largest_row - #i)) + 6 - ((largest_row - #i) * 3)) / 2) * G.opusm_tilePixelSize } } end
    rows[#rows + 1] = cols
  end

  local t = create_UIBox_generic_options({
    infotip = localize("opusm_trans_controls"),
    contents = {
      {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.1, colour = G.C.BLACK, r = 0.1, no_fill = true },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", minw = 12, minh = 8, padding = -2 * G.opusm_tilePixelSize },
            nodes = rows
          }
        }
      }
    }
  })
  return t
end

--[[G.opusm_transmutation_engine_sprite = SMODS.CanvasSprite {
  W = 6, H = 4,
  canvasScale = 10
}

G.FUNCS.setup_transmutation_engine_rend = function(e)
  e.config.func = nil
  local draw_self_ref = e.draw_self
  function e:draw_self(...)
    draw_self_ref(self, ...)

    local canvas = e.config.object.canvas
    canvas:renderTo(function()
      love.graphics.clear(0, 0, 0, 0)
      love.graphics.setColor(1, 0, 0, 1)
      love.graphics.rectangle("fill", -10, 0, 30, 30)
      love.graphics.setColor(0, 1, 0, 1)
      love.graphics.rectangle("fill", 0, 0, 20, 20)
      love.graphics.setColor(0, 0, 1, 1)
      love.graphics.rectangle("fill", 0, 0, 10, 10)
    end)

    if G.OVERLAY_MENU then
      local obj = G.OVERLAY_MENU:get_UIE_by_ID("opusm_trans_canvas_obj")
      if obj then
        love.graphics.push()
        love.graphics.origin()
        G.opusm_transmutation_engine_sprite:draw_from(obj)
        G.opusm_transmutation_engine_sprite.canvas:renderTo(love.graphics.clear, 0, 0, 0, 0)
        love.graphics.pop()
      end
    end
  end
end

function create_opus_magnum_trans_menu()
  local t = create_UIBox_generic_options({
    infotip = localize("opusm_trans_controls"),
    contents = {
      {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.1 },
        nodes = {
          {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.2, minw = 12, minh = 8 },
            nodes = {
              {
                n = G.UIT.O,
                config = { object = G.opusm_transmutation_engine_sprite, func = "setup_transmutation_engine_rend", id = "opusm_trans_canvas_obj" }
              }
            }
          }
        }
      }
    }
  })
  return t
end]] --

--[[

contents = {
      {
        n = G.UIT.R,
        config = { align = "cm", padding = 0 },
        nodes = {
          create_tabs({
            tabs = {
              {
                label = localize("k_phanta_deathnote_tab1"),
                chosen = true,
                tab_definition_function = G.UIDEF.phanta_deathnote_tab1
              },
              {
                label = localize("k_phanta_deathnote_tab2"),
                tab_definition_function = G.UIDEF.phanta_deathnote_tab2
              },
              {
                label = localize("k_phanta_deathnote_tab3"),
                tab_definition_function = G.UIDEF.phanta_deathnote_tab3
              }
            },
            snap_to_nav = true,
            no_shoulders = true
          })
        }
      }
    }

]] --
