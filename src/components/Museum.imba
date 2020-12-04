import axios from 'axios'

const DEPT_URL = 'https://collectionapi.metmuseum.org/public/collection/v1/departments'
const PIECES_URL = 'https://collectionapi.metmuseum.org/public/collection/v1/objects'

let departments = []
let pieces = []
let art = nil
let interval = 1

export default tag Museum

	def getDepartments
		const { status, data } = await axios.get(DEPT_URL)
		departments = data.departments
		imba.commit!

	def getPieces dept
		const { departmentId } = dept
		const { status, data } = await axios.get("{PIECES_URL}?departmentIds={departmentId}")
		pieces = data.objectIDs
		imba.commit!

	def getPiece id
		try
			const { status, data } = await axios.get("{PIECES_URL}/{id}")
			console.log(art)
			art = data
			imba.commit!
			interval = 1
		catch e
			interval += 1

	def previousPiece
		const id = Number(art.objectID) - interval
		getPiece(id)

	def nextPiece
		const id = Number(art.objectID) + interval
		getPiece(id)

	def setup
		getDepartments()

	def close
		art = null

	def render
		<self>
			if !art
				<h1> 'Metropolitan Museum of Art' 
				<div.Departments>
					for department in departments
						<button :click.getPieces(department)> department.displayName
					if pieces.length > 0
						<div.Pieces>
							<h1> "Pieces"
							for piece in pieces.slice(0,100)
								<button :click.getPiece(piece)> piece
			if art
				<div.Controls>
					<i.PreviousArt.fa.fa-chevron-left :click.previousPiece>
					<i.NextArt.fa.fa-chevron-right :click.nextPiece>
					<i.Close.fa.fa-times :click.close>
				<div.Art>
					<img src=art.primaryImage>
				<div.Metadata>
					<h2> art.title
					<div> art.medium
					<div> art.artistDisplayName
					<div> art.artistDisplayBio




