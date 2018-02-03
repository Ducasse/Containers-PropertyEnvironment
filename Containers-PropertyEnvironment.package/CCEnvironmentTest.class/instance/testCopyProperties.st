tests-copy
testCopyProperties
	"I'm here to test if postCopy is right."

	| config |
	config := self environmentClass new.
	self deny: config properties == config copy properties