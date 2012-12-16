# encoding: UTF-8

puts %{
<?xml version="1.0" encoding="utf-8"?>
<html xmlns:idx="www.mobipocket.com" xmlns:mbp="www.mobipocket.com" xmlns:xlink="http://www.w3.org/1999/xlink">
  <body>
    <mbp:pagebreak/>
    <mbp:frameset>

      <mbp:slave-frame display="bottom" device="all" breadth="auto" leftmargin="0" rightmargin="0" bottommargin="0" topmargin="0">
        <div align="center" bgcolor="yellow"/>
        <a onclick="index_search()">Dictionary Search</a>
        </div>
      </mbp:slave-frame>
      <mbp:pagebreak/>
}

R = /^([^;\s]+)(?:;([^:\s]+))* \[([^;\s]+)(?:;([^:\s]+))*\] \/(.+)\/$/

def to_entry(line)

  m = R.match(line)

  unless m
    STDERR.puts "failed to parse >#{line}<"
    return
  end

  kis = [ m[1], *(m[2] ? m[2].split(';') : []) ]
  kas = [ m[3], *(m[4] ? m[4].split(';') : []) ]
  gls = m[5].split('/')[0..-2]

  label = kis.join(';')
  label += "【#{kas.join(';')}】" if kas.any?

  puts "<idx:entry name=\"word\" scriptable=\"yes\">"

  puts "  <h2>"
  puts label
  puts "  </h2>"

  (kis + kas).each do |k|
    puts "  <idx:orth value=#{k.split('(').first.inspect}></idx:orth>"
  end

  gls.each do |gloss|
    puts "  <p>#{gloss}</p>"
  end
  puts "</idx:entry>"

  puts "<hr/>"
  #puts "<mbp:pagebreak/>"
end

while true
  line = STDIN.readline rescue nil
  break unless line
  to_entry(line)
end

puts %{
    </mbp:frameset>
  </body>
</html>
}

