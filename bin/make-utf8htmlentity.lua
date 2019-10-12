#! /usr/bin/env lua

-- last modified 2019-10-11
-- Dorai Sitaram

sp_char_list = {
    "‘’“”",
    "—",
    "–",
    "−",
    "×",
    "†",
    "°′″",
    "→",
    "ĀāĒēĪīŌōŪū",
    "ḌḍḤḥḶḷṆṇṚṛṢṣṬṭ",
    "ṀṁṄṅ",
    "Ññ",
    "Śś",
    "ẖḴḵḺḻṈṉṞṟ",
    "ÄäÖöÜü",
    "ß",
    "ĂăĔĕĬĭŎŏŬŭ",
    "ÁáÉéÍíÓóÚú",
    "ÀàÈèÌìÒòÙù",
    "ÂâÊêÎîÔôÛû", 
    "Çç",
    "Œœ",
    "ËëÏï",
    "ÃãÕõ",
    "ÆæÅåØø",
    "ÞþÐð",
    "ΓΔΘΛΞΠΣΦΨΩ",
    "αβγδεζηθικλμνξπρστυφξψω",
  }

function utf8_to_html_entity(ss)
  local o = io.open("utf8htmlentity", 'w')
  o:write("sed -i -e '\n")
  local n = #ss
  local i = 1
  while i <= n do
    local s = ss[i]
    for p,c in utf8.codes(s) do
      o:write(string.format("s/%s/\\&#x%x;/g\n", utf8.char(c), c))
    end
    i = i+1
  end
  o:write("' $1\n")
  o:close()
  os.execute("chmod +x utf8htmlentity")
end

utf8_to_html_entity(sp_char_list)
