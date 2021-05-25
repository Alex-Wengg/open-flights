
import React, { useState, useEffect } from 'react'
import axios from 'axios'
import Header from './Header'

const Airline = (props) => {
  const [airline, setAirline] = useState({})
  const [review, setReview] = useState({})
  const [loaded, setLoaded] = useState(false)
   
  useEffect( () => {
    const sluge = props.match.params.sluge
    const url = '/api/v1/airlines/'+sluge
 
    axios.get(url)
    .then( resp => {
      setAirline(resp.data)
      setLoaded(true)
    })
    .catch( resp => console.log(resp,"") )
  }, [])

 
  return(
    <div className="wrapper">
       <div className="column">
         {
           loaded &&
           <Header attributes={airline.data.attributes } />
         }
         <div className="reviews">
           [reviews will go here]
         </div>
       </div>
       <div className="column">
         [new review form will go here]
       </div>
     </div>
  )

}

export default Airline