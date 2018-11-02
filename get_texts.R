# get texts from gutenberg

library(dplyr)
library(gutenbergr)


authors <- c("Joyce, James", "Woolf, Virginia", "Whitman, Walt", "Verlaine, Paul", "Donne, John", "Milton, John", "Wilde, Oscar", "Twain, Mark", "Thoreau, Henry David", "Emerson, Ralph Waldo", "Shakespeare, William", "Melville, Herman", "Jonson, Ben", "Dryden, John", "Spenser, Edmund", "Johnson, Samuel", "Wordsworth, William", "Keats, John", "Pope, Alexander", "Homer", "Poe, Edgar Allan", "Raleigh, Walter", "Wyatt, Thomas", "Marlowe, Christoper", "Peele, George", "Kyd, Thomas", "Dekker, Thomas", "Middleton, Thomas", "Heywood, Thomas", "Alabaster, William", "Armin, Robert", "Barnes, Barnabe", "Barry, Lording", "Beaumont, Francis", "Berkeley, William", "Brandon, Samuel", "Brome, Richard", "Carlell, Lodowick", "Cartwright, William",  "Cavendish, Margaret", "Cavendish, William", "Chapman, George", "Chettle, Henry", "Clavell, John", "Daborne, John", "Daniel, Samuel", "Davenant, William", "Davenport, Robert", "Day, John", "de Vere, Edward", "Drayton, Michael", "Edwardes, Richard", "Field, Nathan", "Fletcher, John", "Ford, John", "Fraunce, Abraham", " Fulwell, Ulpian", "Gagar, William", "Gascoigne, George", "Glapthorne, Henry", "Goffe, Thomas", "Golding, Arthur", "Greene, Robert", "Gunnell, Richard", "Hathwaye, Richard", "Haughton, William", "Heywood, Thomas", "Hughes, Thomas", "Killigrew, Henry", "Killegrew, Thomas", "Legge, Thomas", "Lodge, Thomas", "Lyly, John", "Markham, Gervase", "Marmion, Shackerley", "Marston, John", "Massinger, Philip", "May, Thomas", "Munday, Anthony", "Nabbes, Thomas", "Nashe, Thomas", "Norton, Thomas", "Percy, William", "Porter, Henry", "Preston, Thomas", "Rankins, William", "Rowley, Samuel", "Rowley, William", "Rutter, Joseph", "Sackville, Thomas", "Sampson, William", "Sharpham, Edward", "Shirley, James", "Sidney, Mary", "Sidney, Philip", "Smith, Wentworth", "Tomkis, Thomas", "Tourneur, Cyril", "Webster, John", "Whetstone, George", "Wilkins, George", "Wilson, Arthur", "Wilson, Robert")

authors <- unique(authors)


id_collection <- gutenberg_metadata %>%
    filter(author %in% authors, language == "en") %>%
  # remove duplicate title author combos
  distinct(title, author, author_id, .keep_all = TRUE)

# download books
books <- gutenberg_download(id_collection, meta_fields = c("title", "author"))

saveRDS(books, "data/books_rds.rds")

# extract text 
