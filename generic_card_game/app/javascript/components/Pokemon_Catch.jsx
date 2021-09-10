import React, { useState, useEffect } from "react";
import { LazyLoadImage } from 'react-lazy-load-image-component';
import Login from "./Login_Form";

class PokemonCatch extends React.Component {
    constructor(props) {
        super(props);
    
        this.viewCollection = this.viewCollection.bind(this);
        this.trade = this.trade.bind(this);
    }

    viewCollection(){
        //TODO
    }

    trade(){
        //TODO
    }


    render() {
        return (
            <div className="vw-100 vh-100 primary-color d-flex align-items-sm-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <PokemonViewer />
                    </div>
                </div>
            </div>
        );
    }
}

function PokemonViewer() {
    const token = document.querySelector('meta[name="csrf-token"]').content;
    const catchURL = "/api/v1/pokemon/catch";
    const[data, setData] = useState(null);
    useEffect(() => {

        fetch(catchURL, {
            method: "GET",
            headers: {
                "X-CSRF-Token": token,
                "Content-Type": "application/json"
            },
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(setData)
            .catch(error => console.log(error.message));
    }, []);

    if(data) {
        console.log(JSON.stringify(data))

        if(data.status == "error" && data.code == 403){
            return <Login />
        }

        return <div>
            <h1 className="display-4">Wild Pokemon Found!</h1>
            <ul className="horizontal">
                { data.map(card =>
                    <li key={card.id}>
                        <LazyLoadImage effect="blur" src={card.image_url}  width={200} alt={card.name}/>
                    </li>
                )}
            </ul>
        </div>;
    }

    return <div>
        <h1 className="display-4">Catching Pokemon</h1>
        <p className="lead">
            Searching pokemon in the wild...
        </p>
    </div>;

}


export default PokemonCatch;