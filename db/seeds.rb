Cliq.create!([
  {parent_id: nil, name: "sports", is_category: true, ancestry: "1"},
  {parent_id: nil, name: "cliq", is_category: false, ancestry: nil},
  {parent_id: nil, name: "games", is_category: true, ancestry: "1"},
  {parent_id: nil, name: "technology", is_category: true, ancestry: "1"},
  {parent_id: nil, name: "viral", is_category: true, ancestry: "1"},
  {parent_id: nil, name: "movies", is_category: false, ancestry: "1/2"},
  {parent_id: nil, name: "television", is_category: false, ancestry: "1/2"},
  {parent_id: nil, name: "sony", is_category: false, ancestry: "1/4"},
  {parent_id: nil, name: "playstation 4", is_category: false, ancestry: "1/4/9"},
  {parent_id: nil, name: "televisions", is_category: false, ancestry: "1/5"},
  {parent_id: nil, name: "sony", is_category: false, ancestry: "1/5/11"},
  {parent_id: nil, name: "entertainment", is_category: true, ancestry: "1"}
])
Topic.create!([
  {subject: "first Subject for...entertainment", body: "This will be the body", user_id: 1, cliq_id: 2},
  {subject: "I really want a ps4", body: "how should i get it?", user_id: 1, cliq_id: 10},
  {subject: "Guardians of the Galaxy coming out on Friday", body: "Gonna be fun to watch", user_id: 1, cliq_id: 7},
  {subject: "This is another entertainment post\"\n\n", body: "please not an error", user_id: 1, cliq_id: 2}
])
