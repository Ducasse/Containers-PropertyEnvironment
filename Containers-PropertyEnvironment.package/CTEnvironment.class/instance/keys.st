accessing
keys
	"Answer a Set containing the receiver's keys."
	| s |
	s := Set new. 
	"we use a set and not an array because we should go over potential parent keys and the intersection between parent and children keys may not be empty. So we should not report duplicates."
	self keysDo: [ :k | s add: k ].
	^ s 