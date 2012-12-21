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

R = /^([^;\s]+)(?:;([^:\s]+))* (?:\[([^;\s]+)(?:;([^:\s]+))*\] )?\/(.+)\/$/
ENTL = /^EntL\d+X?$/

def to_entry(line)

  m = R.match(line)

  kis = [ m[1], *(m[2] ? m[2].split(';') : []) ]
  kas = [ m[3], *(m[4] ? m[4].split(';') : []) ].compact
  gls = m[5].split('/').reject { |g| ENTL.match(g) }

  label = kis.join(';')
  label += "【#{kas.join(';')}】" if kas.any?

  puts "<idx:entry name=\"word\" scriptable=\"yes\">"

  puts "  <h2>#{label}</h2>"

  (kis + kas).each do |k|
    puts "  <idx:orth value=#{k.split('(').first.inspect}></idx:orth>"
  end

  gls.each do |gloss|
    puts "  <p>#{gloss}</p>"
  end
  puts "</idx:entry>"

  #puts "<mbp:pagebreak/>"
  puts "<hr/>"

rescue => e

  STDERR.puts '=' * 80
  STDERR.puts "failed to parse: #{line}"
  STDERR.puts e.inspect
  STDERR.puts m.inspect
  STDERR.puts e.backtrace[0, 3]
  STDERR.puts '-' * 80
end

count = 0
while true
  line = STDIN.readline rescue nil
  break unless line
  count += 1
  to_entry(line)
end

puts %{
    </mbp:frameset>
  </body>

  <!-- total count: #{count} -->

</html>
}

