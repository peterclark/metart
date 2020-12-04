import axios from 'axios'

const PIECES_URL = 'https://collectionapi.metmuseum.org/public/collection/v1/objects'

let pieces = []

export default tag Department

	prop data

	def getPieces
		const { status, data } = await axios.get("{PIECES_URL}?departmentIds={data.departmentId}")
		pieces = data.objectIDs
		imba.commit!

	def setup
		getPieces

	def render
		<self> for piece in pieces
			<button> piece.objectID
