# Valanga
[![Gem Version](https://badge.fury.io/rb/valanga.svg)](http://badge.fury.io/rb/valanga)
[![Gemnasium](https://gemnasium.com/mgi166/valanga.svg)](https://gemnasium.com/mgi166/valanga)
[![Code Climate](https://codeclimate.com/github/mgi166/valanga/badges/gpa.svg)](https://codeclimate.com/github/mgi166/valanga)

A Ruby client for [REFLEC BEAT](http://p.eagate.573.jp/game/reflec/groovin/p/index.html)

![](https://raw.githubusercontent.com/mgi166/valanga/master/img/Valanga.png)

## Dependency

* [PhantomJS](http://phantomjs.org/)

## Usage
### Prepare
Create `Valanga::Client` instance.  
The arguments of `name_or_email` is `KONAMI ID` or `email` that you registered.  

```ruby
client = Valanga::Client.new(name_or_email, password)
```

### Fetch all music names

```ruby
client.list_musics
#=> ["Artifacter", "Army of Marionette", "RPG", "アイネクライネ", ....]
```

### Search music
Specifies the music name, returns `Valanga::Music` instance.

```ruby
music = client.search('Arousing').hard

music.name             #=> "Arousing"
music.artist           #=> "DJ TOTTO feat.吉河順央"
music.rank             #=> "AAA+"
music.score            #=> 1615
music.achievement_rate #=> 98.4
music.miss_count       #=> 0
music.play_count       #=> 21
music.clear            #=> "clear"
music.full_combo       #=> "all_just_reflec_full_combo"

music.cleared?     #=> true
music.played?      #=> true
music.full_combo?  #=> true
music.has_special? #=> false
```

#### Difficulty / Version

```ruby
music = client.search('music_name')

# basic
music.groovin.basic # groovin version.
music.collete.basic # collete version.
music.basic         # merged score groovin and collete.

# medium
music.groovin.medium # groovin version.
music.collete.medium # collete version.
music.medium         # merged score groovin and collete.

# hard
music.groovin.hard # groovin version.
music.collete.hard # collete version.
music.hard         # merged score groovin and collete.

# special
music.special # only exists groovin version.
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'valanga'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install valanga

## Contributing

1. Fork it ( https://github.com/mgi166/valanga/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
