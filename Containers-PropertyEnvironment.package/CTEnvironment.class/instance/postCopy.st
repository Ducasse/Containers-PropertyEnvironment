copying
postCopy
	"Make sure that properties are properly copied, but not the parent."
	super postCopy.
	properties := properties copy.
