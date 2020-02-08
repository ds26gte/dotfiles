-- last modified 2020-02-07
-- created 2019-10-31
-- Dorai Sitaram

ctermtorgb = {}

first16 = {
  [0] = '000000', [1] = '800000', [2] = '008000', [3] = '808000', [4] = '000080',
  [5] = '800080', [6] = '008080', [7] = 'c0c0c0', [8] = '808080', [9] = 'ff0000',
  [10] = '00ff00', [11] = 'ffff00', [12] = '0000ff', [13] = 'ff00ff', [14] = '00ffff',
  [15] = 'ffffff'
}

rgbgrade = {
  [0] = '00', [1] = '5f', [2] = '87', [3] = 'af', [4] = 'df', [5] = 'ff'
}

function ctermtorgb.ctermtorgb(n)
  if n < 0 or n > 255 then
    error('invalid cterm color')
  end
  if n <= 15 then
    return '#' .. first16[n]
  elseif n < 232 then
    local red, green, blue
    n = n - 16
    blue = n % 6
    n = math.floor(n / 6)
    green = n % 6
    red = math.floor(n / 6)
    return '#' .. rgbgrade[red] .. rgbgrade[green] .. rgbgrade[blue]
  else
    n = n - 232
    return 'gray' .. (n*4 - 1)
  end
end

return ctermtorgb
