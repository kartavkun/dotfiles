-- Solarized Dark color palette
-- Official colors from https://ethanschoonover.com/solarized/
return {
  -- Accent colors
  rosewater = 0xffb58900, -- yellow
  flamingo = 0xffcb4b16, -- orange
  pink = 0xffd33682, -- magenta
  mauve = 0xff6c71c4, -- violet
  red = 0xffdc322f, -- red
  maroon = 0xffdc322f, -- red (Solarized doesn't have separate maroon)
  peach = 0xffcb4b16, -- orange
  yellow = 0xffb58900, -- yellow
  green = 0xff859900, -- green
  teal = 0xff2aa198, -- cyan
  sky = 0xff268bd2, -- blue
  sapphire = 0xff268bd2, -- blue
  blue = 0xff268bd2, -- blue
  lavender = 0xff6c71c4, -- violet

  -- Text colors
  text = 0xff839496, -- base0 (primary text)
  subtext1 = 0xff93a1a1, -- base1 (secondary text)
  subtext0 = 0xffeee8d5, -- base2 (tertiary text)

  -- Overlay colors (for borders, inactive states)
  overlay2 = 0xff073642, -- base03
  overlay1 = 0xff002b36, -- base02
  overlay0 = 0xff586e75, -- base01

  -- Surface colors (for backgrounds)
  surface2 = 0xff073642, -- base03
  surface1 = 0xff002b36, -- base02
  surface0 = 0xff073642, -- base03

  -- Base colors (for main backgrounds)
  base = 0xff002b36, -- base02
  mantle = 0xff073642, -- base03
  crust = 0xff002b36, -- base02

  -- Utility
  transparent = 0x00000000,

  -- Helper function to apply alpha to colors
  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
