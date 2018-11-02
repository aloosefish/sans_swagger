# Find and pillage the best source of rap lyrics.
library(geniusr)
library(dplyr)
library(tidytext)

# Prompts for API token from https://genius.com/api-clients
genius_token()

rappers <- c("MF DOOM", "Viktor Vaughn","Ghostface Killah", "Raekwon", "RZA", "Jay-Z", "Nas", "Big Daddy Kane", "KRS-One", "Boogie Down Productions", "Wu-Tang Clan", "Public Enemy", "Busta Rhymes", "Canibus", "Run DMC", "Cannibal Ox", "El-P", "Company Flow", "Cage", "Aesop Rock", "Organized Konfusion", "Prince Po", "Pharoahe Monch", "Eric B. & Rakim", "Rakim", "Eminem", "OutKast", "Killer Mike", "Geto Boys", "UGK", "Run the Jewels", "Rage Against the Machine", "Ice Cube", "Del the Funky Homosapien", "Deltron 3030", "Rob Sonic", "Mike Ladd", "Murs", "Vast Aire", "Mr. Lif", "Kendrick Lamar", "2 Chainz", "Lil Wayne", "Curren$y", "The Coup", "Nicki Minaj", "Jean Grae", "Immortal Technique", "Talib Kweli", "Mos Def", "The Roots", "Masta Ace", "De La Soul", "A Tribe Called Quest", "Common", "Chino XL", "Ras Kass", "E-40", "Kool Moe Dee", "Mobb Deep", "The Notorious BIG", "8Ball & MJG", "Three 6 Mafia", "Scarface", "Lauryn Hill", "Foxy Brown", "Heather B", "Missy Elliott", "Rapsody", "Queen Latifah", "Yo Yo", "Bahamadia", "Lil' Kim", "Eve", "MC Lyte", "Rah Digga", "Da Brat", "Salt-N-Pepa", "Blackalicious", "Gang Starr", "Guru", "Jadakiss", "T.I.", "Beanie Sigel", "DMX", "Homeboy Sandman", "Camp Lo", "Snoop Dogg", "Q-Tip", "Kanye West", "Lupe Fiasco", "AZ", "Big Pun", "LL Cool J", "Big L", "Redman", "GZA", "Slick Rick", "Kool G Rap", "2Pac", "Busdriver", "Open Mike Eagle", "Vordul Mega", "The Mountain Goats", "Antipop Consortium", "Beans", "High Priest", "M. Sayyid", "Eyedea and Abilities", "Black Milk")
 
# get rapper artist_ids
artist_ids <- map_dfr(rappers, search_artist)
# remove duplicates
artist_ids <- artist_ids[!duplicated(artist_ids), 1:2]
# remove artists not in rappers vector
artists <- artist_ids[artist_ids$artist_name %in% rappers, ]

# Find rappers not in artists
left_out <- rappers[!(rappers %in% artists$artist_name)]

# get meta data for all songs by or featuring an artist
# one at a time first
meta_song <-  get_artist_songs(artists$artist_id[1], include_features = TRUE)

meta_songs <- map(artists$artist_id, get_artist_songs, include_features = TRUE)



