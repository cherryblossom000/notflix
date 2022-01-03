# Dependencies - WebTorrent Desktop

use str
use re

var base-url = https://1337x.wtf

var query
if (< (count $args) 1) {
  print 'Search Torrent: '
  set query = (read-line)
} else {
  set query = (str:join ' ' $args)
}
set query = (str:replace ' ' + $query)

fn table-cell {|idx name|
  put '<td class="coll-'$idx' '$name'">'
}
var regex = (str:join '\n' [
  (table-cell 1 name)'.+?<a href="(/torrent/.+?)">(.+?)</a>.*?</td>'
  (table-cell 2 seeds)'(.+?)</td>'
  (table-cell 3 leeches)'(.+?)</td>'
  '.+?'
  (table-cell 4 'size mob-uploader')'(.+?)<'
])

var @torrents = (
  curl -s $base-url/search/$query/1/ |
  slurp |
  put (re:find $regex (one))[groups] |
  each {|gs|
    put [
      &link=$gs[1][text]
      &title=$gs[2][text]
      &seeders=$gs[3][text]
      &leechers=$gs[4][text]
      &size=$gs[5][text]
    ]
  }
)

if (< (count $torrents) 1) {
  echo "😔  No Result found. Try again 🔴"
  exit 1
}

echo '🔍  Searching Magnet seeds 🧲'
var selected = (
  range 0 (count $torrents) |
  each {|i|
    var t = $torrents[$i]
    echo $i' - ['$t[size]'] [S:'$t[seeders]', L:'$t[leechers]'] '(
      put $t[title] |
      re:replace '[\.\- ]+' ' ' (one) |
      re:replace '[^A-Za-z\d ]' '' (one)
    )
  } |
  sk |
  str:split &max=2 ' - ' (one) |
  take 1
)

open -a WebTorrent (
  curl -s $base-url$torrents[$selected][link] |
  slurp |
  re:find &max=1 'magnet:\?xt=urn:btih:[a-zA-Z\d]+' (one)
)[text]

echo "🎥  Enjoy Watching ☺️ "
