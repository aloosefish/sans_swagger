# Find and pillage the best source of rap lyrics.
library(geniusr)
library(dplyr)
library(tidytext)

rappers <- c("MF DOOM", "DOOM", "Viktor Vaughn", "Danger Doom","Ghostface Killah", "Raekwon", "Jay-Z", "Nas", "Big Daddy Kane", "KRS-One", "Boogie Down Productions", "Wu-Tang Clan", "Public Enemy", "Busta Rhymes", "Canibus", "Run-DMC", "Cannibal Ox", "El-P", "Company Flow", "Cage", "Aesop Rock", "Organized Konfusion", "Prince Po", "Pharoahe Monch", "Eric B. & Rakim", "Rakim", "Eminem", "OutKast", "Killer Mike", "Geto Boys", "UGK", "Run the Jewels", "Rage Against the Machine", "Ice Cube", "Del the Funky Homosapien", "Deltron 3030", "Rob Sonic", "Mike Ladd", "Murs", "Vasta Aire", "Mr. Lif", "Kendrick Lamar", "2 Chainz", "Lil Wayne", "Curren$y", "The Coup", "Nicki Minaj", "Jean Grae", "Immortal Technique", "Talib Kweli", "Mos Def", "The Roots", "Masta Ace", "De La Soul", "A Tribe Called Quest", "Common", "Chino XL", "Ras Kass", "E-40", "Kool Moe Dee", "Mobb Deep", "Notorious B.I.G.", "8Ball & MJG", "Three 6 Mafia", "Scarface", "Lauryn Hill", "Foxy Brown", "Heather B", "Missy Elliot", "Rapsody", "Queen Latifah", "Yo-Yo", "Bahamadia", "Lil' Kim", "Eve", "MC Lyte", "Rah Digga", "Da Brat", "Salt-N-Pepa", "Blackalicious", "Gang Starr", "Guru", "Jadakiss", "T.I.", "Beanie Sigel", "DMX", "Homeboy Sandman", "Camp Lo", "Snoop Dogg", "Q-Tip", "Kanye West", "Lupe Fiasco", "Royc da 5'9\"", "AZ", "Big Pun", "LL Cool J", "Big L", "Redman", "GZA", "Slick Rick", "Kool G. Rap", "2Pac", "Busdriver", "Open Mike Eagle")
 

# EXAMPLE CODE
gm_search <- search_song(search_term = "good morning") %>%
  # look for Kanye as the primary artist
  filter(artist_name == "Kanye West")

gm_lyrics <- scrape_lyrics_id(song_id = gm_search$song_id)
gm_lyrics
