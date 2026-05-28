SMODS.ConsumableType {
  key = "opusm_Glyph",
  primary_colour = HEX("858580"),
  secondary_colour = HEX("858580"),
  collection_rows = { 6, 6 },
  shop_rate = 0,
  default = "c_opusm_bonding",
  can_stack = true,
  can_divide = true
}

SMODS.UndiscoveredSprite {
  key = "opusm_Glyph",
  atlas = "Cards",
  path = "OpusMagnumCards.png",
  pos = { x = 3, y = 2 },
  px = 71,
  py = 95,
  no_overlay = true
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "bonding",
  pos = { x = 0, y = 0 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "multibonding",
  pos = { x = 1, y = 0 },
  cost = 2,
  atlas = "Cards",
  config = { extra = { cards = 3 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_opusm_bonding
    return { vars = { card.ability.extra.cards } }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "triplexbonding",
  pos = { x = 2, y = 0 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "unbonding",
  pos = { x = 3, y = 0 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "calcification",
  pos = { x = 4, y = 0 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_cardinalexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "duplication",
  pos = { x = 0, y = 1 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_cardinalexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "projection",
  pos = { x = 1, y = 1 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_basemetalexplanation" }
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_promotionexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "purification",
  pos = { x = 2, y = 1 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_basemetalexplanation" }
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_promotionexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "animusmus",
  pos = { x = 3, y = 1 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "disposal",
  pos = { x = 4, y = 1 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "unification",
  pos = { x = 0, y = 2 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_cardinalexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "opusm_Glyph",
  key = "dispersion",
  pos = { x = 1, y = 2 },
  cost = 2,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = "Other", key = "opusm_cardinalexplanation" }
  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end
}

SMODS.Consumable {
  set = "Spectral",
  key = "vanberloswheel",
  pos = { x = 2, y = 2 },
  cost = 4,
  atlas = "Cards",
  loc_vars = function(self, info_queue, card)

  end,
  can_use = function(self, card)
    return false
  end,
  use = function(self, card, area, copier)

  end,

  soul_set = "opusm_Glyph",
  soul_rate = 0.006,
}
