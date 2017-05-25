BeliefType.destroy_all
BeliefType.create!([  {name: "A total non-believer"}, ])
BeliefType.create!([  {name: "Accepting and open to the possibility"}, ])
BeliefType.create!([  {name: "A firm believer "}, ])

Relationship.destroy_all
Relationship.create!([  {name: "Choose One", typeof: "none"}, ])
Relationship.create!([  {name: "Father", typeof: "family"}, ])
Relationship.create!([  {name: "Mother", typeof: "family"}, ])
Relationship.create!([  {name: "Sister", typeof: "family"}, ])
Relationship.create!([  {name: "Brother", typeof: "family"}, ])
Relationship.create!([  {name: "Uncle", typeof: "family"}, ])
Relationship.create!([  {name: "Aunt", typeof: "family"}, ])
Relationship.create!([  {name: "Husband", typeof: "family"}, ])
Relationship.create!([  {name: "Wife", typeof: "family"}, ])
Relationship.create!([  {name: "Son", typeof: "family"}, ])
Relationship.create!([  {name: "Daughter", typeof: "family"}, ])
Relationship.create!([  {name: "Cousin", typeof: "family"}, ])
Relationship.create!([  {name: "Other", typeof: "family"} ])
