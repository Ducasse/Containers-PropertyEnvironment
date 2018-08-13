iteration
do: aBlock 
	"Evaluate aBlock for each of the receiver's keys, starting from the receiver and going up in its parent chain if any."

	self valuesDo: aBlock