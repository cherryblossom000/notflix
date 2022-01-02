<h1 align="center">NOTFLIX</h1>
<p align="center">f@#k netflix use notflix a tool which search magnet links and stream it with webtorrent</p>
<p align="center">This is a fork for macOS</p>

##
<p align="center">
<img src="./preview.gif" alt="Video Preview" width="500px">
</p>

> Watch bugswriter’s video - [bugswriter’s notflix](https://youtu.be/RFJCL9C46Mc)

### How does this work?

This is a shell script. It scrapes 1337x and gets the magnet link.
After this it uses [WebTorrent](https://webtorrent.io/) to stream the video from the magnet link.
For scraping, the script uses simple gnu utils like sed, awk, paste, cut.

## Requirements

* [WebTorrent Desktop][webtorrent-desktop] — A tool to stream torrents. Install via Homebrew
  (`brew install --cask webtorrent`) or from the [website][webtorrent-desktop].
* [skim](https://github.com/lotabout/skim) or [fzf](https://github.com/junegunn/fzf) — a CLI fuzzy
  finder. If both are present, skim is used.

## Installation

### cURL
cURL **notflix** to your **$PATH** and give execute permissions.

```sh
$ sudo curl -sL "https://raw.githubusercontent.com/cherryblossom000/notflix/master/notflix" -o /usr/local/bin/notflix
$ sudo chmod +x /usr/local/bin/notflix
```
- To update, just do `curl` again, no need to `chmod` anymore.
- To uninstall, simply remove `notflix` from your **$PATH**, for example `sudo rm -f /usr/local/bin/notflix`.

## License
This project is licensed under [GPL-3.0](https://raw.githubusercontent.com/Illumina/licenses/master/gpl-3.0.txt).

[webtorrent-desktop]: https://webtorrent.io/desktop
