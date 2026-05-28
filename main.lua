SMODS.Atlas {
  key = "modicon",
  path = "OpusMagnumLogo.png",
  px = 34,
  py = 34
}

SMODS.Atlas {
  key = "Cards",
  path = "OpusMagnumCards.png",
  px = 71,
  py = 95
}

G.opusm_tilePX = 21
G.opusm_tilePY = 25

SMODS.Atlas {
  key = "TileElements",
  path = "OpusMagnumElements.png",
  px = G.opusm_tilePX,
  py = G.opusm_tilePY
}

G.C.OPUS_MAGNUM = {
  Atom = HEX("563532"),
  Compound = HEX("324256"),
  Glyph = HEX("858580"),
  TransmutationMachine = HEX("3C635B")
}

local loc_colour_ref = loc_colour

function loc_colour(_c, default)
  if not G.ARGS.LOC_COLOURS then
    loc_colour_ref(_c, default)
  elseif not G.ARGS.LOC_COLOURS.opusm_colours then
    G.ARGS.LOC_COLOURS.opusm_colours = true

    local new_colors = {
      opusm_atom = G.C.OPUS_MAGNUM.Atom,
      opusm_compound = G.C.OPUS_MAGNUM.Compound,
      opusm_glyph = G.C.OPUS_MAGNUM.Glyph,
      opusm_transmutationmachine = G.C.OPUS_MAGNUM.TransmutationMachine
    }

    for k, v in pairs(new_colors) do
      G.ARGS.LOC_COLOURS[k] = v
    end
  end

  return loc_colour_ref(_c, default)
end

local allFolders = { "none", "items" }

local allFiles = { ["none"] = {}, ["items"] = { "Elements", "Glyphs", "Reagents", "TransmutationEngine" } }

for i = 1, #allFolders do
  if allFolders[i] == "none" then
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFiles[allFolders[i]][j] .. ".lua"))()
    end
  else
    for j = 1, #allFiles[allFolders[i]] do
      assert(SMODS.load_file(allFolders[i] .. "/" .. allFiles[allFolders[i]][j] .. ".lua"))()
    end
  end
end

local update_ref = Game.update
function Game:update(dt)
  if not G.GAME.opusm_reagent_rate_cache then G.GAME.opusm_reagent_rate_cache = 0 end
  if not G.GAME.opusm_glyph_rate_cache then G.GAME.opusm_glyph_rate_cache = 0 end

  G.GAME.opusm_reagent_rate = G.GAME.opusm_reagent_rate_cache
  G.GAME.opusm_glyph_rate = G.GAME.opusm_glyph_rate_cache

  return update_ref(self, dt)
end