import React from 'react'

const Header = (props) => {
  const {name, image_url} = props.attributes

  return(
    <div className="header">
      <h1><img src={image_url} alt={name} width="50"/>{name}</h1>

      <div>

        <div className="totalReviews"></div>
        <div className="starRating"></div>
        <div className="totalOutOf">3 out of 5</div>
      </div>
      
    </div>
  )
}
export default Header