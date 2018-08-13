I'm a kind of dictionary with optional lookup in my parent. I'm an environment of properties with values (binding key -> value). I may have an ancestor chain (father, grand-father...) in which I look for my properties when I do not define them. 

Users should pay attention than getting keys is not the same as iterating on keys since a parent may have the same keys than a child. Therefore the iteration will iterate all the keys/values while getting the keys will return a set of the unique keys and not an array with potential duplicates because from the client of a child it is not possible to access a shadowed keys in a parent.


Implementation notes.

For the moment keysDo: do not garantee any order. A possible improvement would be to use an orderedUniqueCollection to keep the keys. 
