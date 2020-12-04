# including some global styles here
global css html
	body
		h:100vh
		d:flex
		jc:center
		ff:sans
		c:gray8
		m:0

	.App
		d:flex
		jc:center
		fld:column
		h:100vh
		w:100vw
	
	h1
		ta:center

	.Departments
		d:flex
		flw:wrap
		jc:center

	button
		bd:1px solid gray3
		bg:white @hover:gray2
		rd:md
		py:.5em
		px:1em
		bxs:none @hover:sm
		cursor:pointer
		fs:16px

	.Controls
		pos:absolute
		r:1em
		t:1em

		.PreviousArt, .NextArt, .Close
			c:white
			ts:1px 1px 1px black
			cursor:pointer
			mr:.5em

	.Art
		d:flex

	.Art img
		w:100vw
		h:100vh
		object-fit: cover
		m: 0 auto

	.Metadata
		pos:absolute
		b:0
		w:100vw
		p:2em
		bg:rgba(0,0,0,.75)
		c:rgba(255,255,255.75)
